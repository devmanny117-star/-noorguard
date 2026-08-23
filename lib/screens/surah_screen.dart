import 'dart:async';
import 'dart:math' as math;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/surah_translations.dart';
import '../l10n/app_localizations.dart';
import '../models/reciter_model.dart';
import '../models/surah_model.dart';
import '../services/app_blocking_service.dart';
import '../services/quran_player_controller.dart';
import '../services/quran_service.dart';
import '../services/share_helper.dart';
import '../services/bookmark_service.dart';
import '../services/tafsir_api_service.dart';
import '../widgets/font_size_slider.dart';
import '../widgets/hours_minutes_picker_dialog.dart';
import '../widgets/premium_upgrade_dialog.dart';
import 'saved_verses_screen.dart';
import 'tafsir_screen.dart';

// First N reciters in `reciters` (models/reciter_model.dart) are free;
// the rest require Premium.
const _freeReciterIds = {'alafasy', 'sudais'};

const _textScaleKey = 'quran_text_scale';
// Legacy single-favorite pref, migrated into _favReciterIdsKey on first load.
const _favReciterKey = 'favorite_reciter_id';
const _favReciterIdsKey = 'favorite_reciter_ids';

/// Maximum number of reciters a user can favorite at once.
const _maxFavoriteReciters = 3;
const double _minTextScale = 0.8;
const double _maxTextScale = 4.0;

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFD4AF37);
const _cardColor = Color(0xFF152030);

class SurahScreen extends StatefulWidget {
  final Surah surah;

  /// Non-null when opened from the App Blocking block screen's "Read 3
  /// Ayahs" button — shows a progress banner and grants the bypass once
  /// [AyahChallenge.targetCount] distinct ayahs have been viewed.
  final AyahChallenge? ayahChallenge;

  /// When non-null, the reader scrolls to this verse number after the surah
  /// finishes loading (used by the Quran search ayah results).
  final int? initialVerseNumber;

  const SurahScreen({
    super.key,
    required this.surah,
    this.ayahChallenge,
    this.initialVerseNumber,
  });

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen>
    with SingleTickerProviderStateMixin {
  /// Gold pulse played on the verse that a notification deep link, saved
  /// verse, or search result landed on (see [_settleOnVerse]). Single
  /// forward play: gold at 30% opacity fading to transparent over 2 s.
  late final AnimationController _highlightController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );
  late final Animation<double> _highlightFade = CurvedAnimation(
    parent: _highlightController,
    curve: Curves.easeOut,
  );
  int? _highlightVerseNumber;

  static const _pulseGold = Color(0xFFC9A84C);

  List<Verse> _verses = [];
  bool _loading = true;
  bool _requested = false;

  final Set<int> _seenVerses = {};
  bool _challengeComplete = false;
  int? _justConfirmedVerse;

  /// True once the challenge's completion sequence starts fading the whole
  /// screen out, just before it dismisses.
  bool _dismissing = false;

  /// Counts a verse as read — either the user tapped it directly, or its
  /// audio played through to completion (see _playerStateSub /
  /// _discontinuitySub). Never just from scrolling it into view, which used
  /// to let the challenge complete before the user had read anything.
  void _onAyahRead(int verseNumber) {
    final challenge = widget.ayahChallenge;
    if (challenge == null || _challengeComplete) return;
    if (!_seenVerses.add(verseNumber)) return;
    setState(() => _justConfirmedVerse = verseNumber);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && _justConfirmedVerse == verseNumber) {
        setState(() => _justConfirmedVerse = null);
      }
    });
    if (_seenVerses.length >= AyahChallenge.targetCount) {
      _completeChallenge(challenge);
    }
  }

  Future<void> _completeChallenge(AyahChallenge challenge) async {
    // Escapes the audio player's event-dispatch call stack first (relevant
    // when the 3rd ayah was counted via auto-advance) — touching the player
    // synchronously while it's still mid-dispatch throws "Cannot fire new
    // event. Controller is already firing an event."
    await Future.microtask(() {});

    // 1. Fade the audio out over 500ms instead of an abrupt stop — also
    // prevents a 4th ayah from getting an audible head start, since
    // just_audio may have already gapless-transitioned into it by now.
    await _fadeOutAudio();
    // This was a forced reading gate, not a listening session — don't leave
    // a stray mini player behind once the user is sent back to their app.
    QuranPlayerController.instance.clear();

    // 2. Gold celebration overlay (see _ChallengeCompleteOverlay) — let it
    // breathe for a beat before moving on.
    setState(() => _challengeComplete = true);
    final service = AppBlockingService();
    await service.grantAyahChallengeBypass(challenge.blockedPackage);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    // 3. Fade the whole screen out, then dismiss — no abrupt cut.
    setState(() => _dismissing = true);
    await Future.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    Navigator.of(context).pop();

    // 4. Return the user to the app they were trying to open.
    await service.launchApp(challenge.blockedPackage);
  }

  Future<void> _fadeOutAudio() async {
    const steps = 10;
    const stepDuration = Duration(milliseconds: 50);
    final startVolume = _audioPlayer.volume;
    if (startVolume > 0) {
      for (var i = 1; i <= steps; i++) {
        await _audioPlayer
            .setVolume((startVolume * (1 - i / steps)).clamp(0.0, 1.0));
        await Future.delayed(stepDuration);
      }
    }
    await _audioPlayer.pause();
  }

  Reciter _selectedReciter = reciters.first;
  List<String> _favoriteReciterIds = [];
  // Shared app-wide player (see QuranPlayerController) — NOT owned by this
  // screen, so playback survives navigating away (powers the Quran tab's
  // mini player). dispose() below deliberately does not stop/dispose it.
  AudioPlayer get _audioPlayer => QuranPlayerController.instance.player;
  List<AudioSource>? _playlist;
  Uri? _artworkUri;
  int? _playingVerseNumber;
  bool _isPlaying = false;

  // Background/lock-screen Premium gating now lives on
  // QuranPlayerController itself (see quran_player_controller.dart) — it
  // used to live here, but that meant it only fired while a SurahScreen was
  // mounted, missing exactly the case the shared player exists for:
  // playback continuing after navigating back to the Quran tab's mini
  // player, with no SurahScreen around to observe app lifecycle changes.

  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<int?>? _currentIndexSub;
  StreamSubscription<PositionDiscontinuity>? _discontinuitySub;

  /// When true, the player automatically advances to the next verse on completion.
  bool _continuousPlay = false;

  /// Remaining sleep-timer duration. Null means no timer is active.
  Duration? _sleepRemaining;
  Timer? _sleepCountdownTimer;

  int _fontScaleIndex = kDefaultFontScaleIndex;
  double _textScale = 1.0;
  final Map<int, Offset> _pointerPositions = {};
  double? _pinchStartDistance;
  double _pinchStartScale = 1.0;

  // True once the user scrolls the verse list while playback is paused —
  // hides the player bar to give the reader more room. Cleared as soon as
  // playback resumes from any source (tap, notification, lock screen).
  bool _hiddenByScroll = false;

  bool get _showPlayerBar => _playingVerseNumber != null && !_hiddenByScroll;

  // One GlobalKey per verse tile so the currently playing verse can be
  // scrolled into view with Scrollable.ensureVisible regardless of its
  // (variable) rendered height.
  final Map<int, GlobalKey> _verseKeys = {};
  final ScrollController _scrollController = ScrollController();

  GlobalKey _verseKey(int verseNumber) =>
      _verseKeys.putIfAbsent(verseNumber, () => GlobalKey());

  void _scrollToVerse(int verseNumber) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _verseKeys[verseNumber]?.currentContext;
      if (ctx == null || !mounted) return;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
        alignment: 0.3,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // Once the pulse fades out, drop the overlay wrapper entirely so the
    // tile renders identically to every other verse again.
    _highlightController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() => _highlightVerseNumber = null);
      }
    });
    _playerStateSub = _audioPlayer.playerStateStream.listen((state) {
      if (!mounted) return;
      // The last verse in the playlist has no next item to auto-advance to
      // — it only ever signals completion via processingState, not a
      // position discontinuity, so it needs its own ayah-challenge check.
      if (state.processingState == ProcessingState.completed &&
          _playingVerseNumber != null) {
        _onAyahRead(_playingVerseNumber!);
      }
      setState(() {
        _isPlaying = state.playing;
        // Bring the bar back the moment playback resumes, regardless of
        // what triggered it (in-app tap, notification, lock screen).
        if (state.playing) _hiddenByScroll = false;
      });
    });
    // Keeps _playingVerseNumber (and the highlighted verse / player bar) in
    // sync with whichever item the playlist is currently on, whether that
    // came from a tap, the prev/next buttons, or the lock screen controls.
    // Also the single place that syncs QuranPlayerController — every way a
    // new verse can start playing already funnels through this stream.
    _currentIndexSub = _audioPlayer.currentIndexStream.listen((index) {
      if (!mounted || index == null) return;
      if (index < 0 || index >= _verses.length) return;
      final verseNumber = _verses[index].number;
      setState(() => _playingVerseNumber = verseNumber);
      _scrollToVerse(verseNumber);
      QuranPlayerController.instance.setNowPlaying(
        surah: widget.surah,
        reciter: _selectedReciter,
        verseNumber: verseNumber,
        playlistVerseNumbers: _verses.map((v) => v.number).toList(),
      );
    });
    // The playlist auto-advances to the next verse by default; when
    // continuous play is off, immediately pause so playback stops after the
    // current verse instead of rolling into the next one. Explicit
    // prev/next taps (reason: seek) are left alone — only a verse whose
    // audio actually played through to its own end counts toward the
    // ayah challenge.
    _discontinuitySub =
        _audioPlayer.positionDiscontinuityStream.listen((event) {
      if (event.reason == PositionDiscontinuityReason.autoAdvance) {
        final completedIndex = event.previousEvent.currentIndex;
        if (completedIndex != null &&
            completedIndex >= 0 &&
            completedIndex < _verses.length) {
          _onAyahRead(_verses[completedIndex].number);
        }
        if (!_continuousPlay) {
          // just_audio is still mid-dispatch of this very event; calling
          // pause() synchronously here throws "Cannot fire new event.
          // Controller is already firing an event". Deferring to a
          // microtask lets this event finish dispatching first.
          Future.microtask(() => _audioPlayer.pause());
        }
      }
    });
    _loadFontScale();
    _loadTextScale();
    _loadFavoriteReciter();
    _loadVerseBookmarks();
  }

  // ── Verse bookmarks ──────────────────────────────────────────────────────

  /// Verse numbers of this surah that are bookmarked.
  Set<int> _bookmarkedVerses = {};

  Future<void> _loadVerseBookmarks() async {
    final saved = await BookmarkService.loadVerseBookmarks();
    if (!mounted) return;
    setState(() {
      _bookmarkedVerses = saved
          .where((v) => v.surahNumber == widget.surah.number)
          .map((v) => v.verseNumber)
          .toSet();
    });
  }

  Future<void> _toggleVerseBookmark(Verse verse) async {
    final keys = await BookmarkService.toggleVerseBookmark(SavedVerse(
      surahNumber: widget.surah.number,
      surahEnglishName: widget.surah.englishName,
      surahArabicName: widget.surah.name,
      verseNumber: verse.number,
      arabic: verse.arabic,
      translation: verse.translation,
    ));
    if (!mounted) return;
    setState(() {
      _bookmarkedVerses = keys
          .where((k) => k.startsWith('${widget.surah.number}:'))
          .map((k) => int.parse(k.split(':').last))
          .toSet();
    });
  }

  // ── Favourite reciters (up to 3) ─────────────────────────────────────────

  Future<void> _loadFavoriteReciter() async {
    final prefs = await SharedPreferences.getInstance();
    var ids = prefs.getStringList(_favReciterIdsKey);
    // One-time migration from the old single-favorite pref.
    if (ids == null) {
      final legacy = prefs.getString(_favReciterKey);
      ids = [if (legacy != null) legacy];
      await prefs.setStringList(_favReciterIdsKey, ids);
      await prefs.remove(_favReciterKey);
    }
    final valid =
        ids.where((id) => reciters.any((r) => r.id == id)).toList();
    if (!mounted) return;
    setState(() {
      _favoriteReciterIds = valid;
      // The first favorite is the default reciter, as the single favorite
      // was before.
      if (valid.isNotEmpty) {
        final match =
            reciters.where((r) => r.id == valid.first).firstOrNull;
        if (match != null) _selectedReciter = match;
      }
    });
  }

  Future<void> _saveFavoriteReciters(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favReciterIdsKey, ids);
    if (!mounted) return;
    setState(() => _favoriteReciterIds = List.of(ids));
  }

  void _showReciterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: _cardColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _ReciterSheet(
        selected: _selectedReciter,
        initialFavoriteIds: _favoriteReciterIds,
        onSelect: (reciter) {
          _onSelectReciter(reciter);
          Navigator.pop(ctx);
        },
        onFavoritesChanged: _saveFavoriteReciters,
      ),
    );
  }

  // ── Font / text scale ────────────────────────────────────────────────────

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('quran');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('quran', index);
  }

  Future<void> _loadTextScale() async {
    final prefs = await SharedPreferences.getInstance();
    final scale = prefs.getDouble(_textScaleKey) ?? 1.0;
    if (mounted) setState(() => _textScale = scale);
  }

  Future<void> _saveTextScale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_textScaleKey, _textScale);
  }

  // ── Pinch-to-zoom ────────────────────────────────────────────────────────

  void _onPointerDown(PointerDownEvent event) {
    _pointerPositions[event.pointer] = event.position;
    if (_pointerPositions.length == 2) {
      final points = _pointerPositions.values.toList();
      _pinchStartDistance = (points[0] - points[1]).distance;
      _pinchStartScale = _textScale;
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (!_pointerPositions.containsKey(event.pointer)) return;
    _pointerPositions[event.pointer] = event.position;
    final startDistance = _pinchStartDistance;
    if (_pointerPositions.length == 2 &&
        startDistance != null &&
        startDistance > 0) {
      final points = _pointerPositions.values.toList();
      final distance = (points[0] - points[1]).distance;
      final newScale = (_pinchStartScale * (distance / startDistance))
          .clamp(_minTextScale, _maxTextScale);
      if ((newScale - _textScale).abs() > 0.01) {
        setState(() => _textScale = newScale);
      }
    }
  }

  void _onPointerUp(PointerEvent event) {
    _pointerPositions.remove(event.pointer);
    if (_pointerPositions.length < 2) _pinchStartDistance = null;
    if (_pointerPositions.isEmpty) _saveTextScale();
  }

  // ── Lifecycle ────────────────────────────────────────────────────────────

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_requested) {
      _requested = true;
      _load(Localizations.localeOf(context).languageCode);
    }
  }

  @override
  void dispose() {
    _playerStateSub?.cancel();
    _currentIndexSub?.cancel();
    _discontinuitySub?.cancel();
    // Deliberately NOT stopping/disposing _audioPlayer here — it's the
    // shared QuranPlayerController.instance.player, not owned by this
    // screen. Leaving it alone on navigation-away is what lets playback
    // (and the Quran tab's mini player) survive after the reader closes;
    // only cancelling this screen's own subscriptions above.
    _sleepCountdownTimer?.cancel();
    _scrollController.dispose();
    _highlightController.dispose();
    super.dispose();
  }

  Future<void> _load(String locale) async {
    final verses = await fetchVerses(widget.surah.number, locale: locale);
    if (!kIsWeb) {
      _artworkUri = await QuranPlayerController.instance.getArtworkUri();
    }
    if (!mounted) return;
    // If this surah's audio is already playing via the shared
    // QuranPlayerController (e.g. this screen was (re)opened by tapping the
    // Quran tab's mini player), adopt that session's state.
    // currentIndexStream's replay-on-subscribe in initState() fired before
    // _verses was populated, so its `index >= _verses.length` guard silently
    // dropped that event — this is the fallback that actually syncs it.
    final controller = QuranPlayerController.instance;
    final alreadyPlayingThisSurah =
        controller.surah?.number == widget.surah.number;
    setState(() {
      _verses = verses;
      _loading = false;
      if (alreadyPlayingThisSurah) {
        _selectedReciter = controller.reciter ?? _selectedReciter;
        _playlist = _buildPlaylist();
        _playingVerseNumber = controller.verseNumber;
        _isPlaying = _audioPlayer.playing;
      }
    });
    // Scroll to the requested verse if the screen was opened from a search
    // result, saved verse, or notification deep link.
    final target = widget.initialVerseNumber;
    if (target != null) {
      final index = verses.indexWhere((v) => v.number == target);
      if (index >= 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _settleOnVerse(target, index);
        });
      }
    }
    // The playlist is built lazily on first play (see _playVerseAudio), not
    // here — setAudioSources() resets the player's current index to 0 as
    // soon as it's called, which would mark verse 1 "active" (showing the
    // player bar and its highlight) before the user has tapped play at all.
  }

  /// Lands the list EXACTLY on [target]. A single proportional jump +
  /// ensureVisible isn't enough: verse tiles have very different heights, so
  /// the estimate can miss by several ayahs, the target tile is then never
  /// built, ensureVisible finds no context and silently gives up — leaving
  /// the list a few verses short (a notification deep link to 13:28 used to
  /// land on ~13:23 this way). Instead, after the head-start jump this walks
  /// a viewport at a time toward the target — the direction read off the
  /// tiles that ARE built — until the target tile exists, then ensureVisible
  /// lands precisely on it.
  Future<void> _settleOnVerse(int target, int index) async {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    final approx = (index / math.max(_verses.length, 1)) *
        position.maxScrollExtent;
    _scrollController.jumpTo(approx.clamp(0.0, position.maxScrollExtent));
    await WidgetsBinding.instance.endOfFrame;

    // Enough steps to cross even Al-Baqarah end-to-end one viewport at a time.
    for (int attempt = 0; attempt < 60; attempt++) {
      if (!mounted || !_scrollController.hasClients) return;
      final ctx = _verseKeys[target]?.currentContext;
      if (ctx != null && ctx.mounted) {
        await Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          alignment: 0.3,
        );
        // Landed — pulse the target verse gold so the eye finds it.
        if (!mounted) return;
        setState(() => _highlightVerseNumber = target);
        _highlightController.forward(from: 0);
        return;
      }
      // Keys persist after their tile unbuilds, so "built" = has a context.
      final built = _verseKeys.entries
          .where((e) => e.value.currentContext != null)
          .map((e) => e.key)
          .toList();
      if (built.isEmpty) return;
      final pos = _scrollController.position;
      final double delta;
      if (target > built.reduce(math.max)) {
        delta = pos.viewportDimension * 0.9;
      } else if (target < built.reduce(math.min)) {
        delta = -pos.viewportDimension * 0.9;
      } else {
        return; // target sits between built tiles — cannot happen in practice
      }
      final next = (pos.pixels + delta).clamp(0.0, pos.maxScrollExtent);
      if (next == pos.pixels) return; // hit the list edge; nothing more to do
      _scrollController.jumpTo(next);
      await WidgetsBinding.instance.endOfFrame;
    }
  }

  // ── Audio playback ───────────────────────────────────────────────────────

  // Surah 9 (At-Tawbah) is the only surah without Bismillah.
  bool get _showBismillah => widget.surah.number != 9;

  bool get _isFatiha => widget.surah.number == 1;

  /// One playable item per verse, in surah order, each tagged with the
  /// metadata (surah, verse, reciter) shown in the lock screen / status bar
  /// media notification.
  List<AudioSource> _buildPlaylist() {
    return [
      for (final verse in _verses)
        AudioSource.uri(
          Uri.parse(
              _selectedReciter.audioUrl(widget.surah.number, verse.number)),
          tag: MediaItem(
            id: _selectedReciter.audioUrl(widget.surah.number, verse.number),
            title: '${widget.surah.englishName} • Ayah ${verse.number}',
            artist: _selectedReciter.name,
            album: widget.surah.englishName,
            artUri: _artworkUri,
          ),
        ),
    ];
  }

  Future<void> _playVerseAudio(int verseNumber) async {
    if (_playingVerseNumber == verseNumber) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play();
      }
      return;
    }
    final index = _verses.indexWhere((v) => v.number == verseNumber);
    if (index == -1) return;
    if (_playlist == null) {
      _playlist = _buildPlaylist();
      await _audioPlayer.setAudioSources(_playlist!,
          initialIndex: index, preload: false);
    } else {
      await _audioPlayer.seek(Duration.zero, index: index);
    }
    // Set directly rather than relying solely on currentIndexStream: after
    // the close button resets the index-tracking state, re-tapping the same
    // verse seeks to an index that hasn't changed, so the stream wouldn't
    // fire again.
    if (mounted) setState(() => _playingVerseNumber = verseNumber);
    await _audioPlayer.play();
  }

  Future<void> _playAdjacent(int delta) async {
    if (delta >= 0) {
      await _audioPlayer.seekToNext();
    } else {
      await _audioPlayer.seekToPrevious();
    }
    await _audioPlayer.play();
  }

  /// Stops playback completely, hides the player bar, and clears the
  /// highlighted verse — triggered by the player bar's close (X) button.
  Future<void> _closePlayer() async {
    await _audioPlayer.stop();
    QuranPlayerController.instance.clear();
    if (!mounted) return;
    setState(() {
      _playingVerseNumber = null;
      _hiddenByScroll = false;
    });
  }

  Future<void> _onSelectReciter(Reciter reciter) async {
    if (!_freeReciterIds.contains(reciter.id)) {
      final prefs = await SharedPreferences.getInstance();
      final isPremium = prefs.getBool('is_premium') ?? false;
      if (!isPremium) {
        if (!mounted) return;
        final l10n = AppLocalizations.of(context)!;
        PremiumUpgradeDialog.show(
          context,
          featureName: l10n.premiumQuranRecitersName,
          featureDescription: l10n.premiumQuranRecitersDescription,
        );
        return;
      }
    }
    final verseNumber = _playingVerseNumber;
    final wasPlaying = _isPlaying;
    setState(() => _selectedReciter = reciter);
    // Nothing has played yet — just remember the preference for next time,
    // without touching the player (that would prematurely activate verse 1).
    if (verseNumber == null || _verses.isEmpty) return;
    final index = _verses.indexWhere((v) => v.number == verseNumber);
    _playlist = _buildPlaylist();
    await _audioPlayer.setAudioSources(
      _playlist!,
      initialIndex: index < 0 ? 0 : index,
      preload: false,
    );
    if (wasPlaying) await _audioPlayer.play();
  }

  // ── Verse tafsir bottom sheet ────────────────────────────────────────────

  Future<void> _shareVerse(Verse verse) async {
    final l10n = AppLocalizations.of(context)!;
    final source = '${widget.surah.englishName} ${widget.surah.number}:${verse.number}';
    try {
      await shareContent(
        context: context,
        typeLabel: l10n.shareCardVerseLabel,
        arabic: verse.arabic,
        transliteration: verse.transliteration,
        translation: verse.translation.isNotEmpty ? verse.translation : verse.arabic,
        source: source,
        brandingLabel: l10n.shareViaLabel,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l10n.shareError,
            style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ));
    }
  }

  void _showVerseTafsir(Verse verse) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _VerseTafsirSheet(
        surahNumber: widget.surah.number,
        surahName: widget.surah.englishName,
        verse: verse,
        locale: locale,
        l10n: l10n,
      ),
    );
  }

  // ── Continuous play ──────────────────────────────────────────────────────

  void _toggleContinuousPlay() =>
      setState(() => _continuousPlay = !_continuousPlay);

  // ── Sleep timer ──────────────────────────────────────────────────────────

  void _startSleepTimer(Duration duration) {
    _sleepCountdownTimer?.cancel();
    setState(() => _sleepRemaining = duration);
    _sleepCountdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      final remaining = _sleepRemaining;
      if (remaining == null || remaining.inSeconds <= 0) {
        _cancelSleepTimer();
        _audioPlayer.stop();
        return;
      }
      setState(() => _sleepRemaining = remaining - const Duration(seconds: 1));
    });
  }

  void _cancelSleepTimer() {
    _sleepCountdownTimer?.cancel();
    _sleepCountdownTimer = null;
    if (mounted) setState(() => _sleepRemaining = null);
  }

  void _showSleepTimerSheet() {
    final l10n = AppLocalizations.of(context)!;
    final presets = [
      (const Duration(minutes: 15), '15 ${l10n.minutesAbbreviation}'),
      (const Duration(minutes: 30), '30 ${l10n.minutesAbbreviation}'),
      (const Duration(minutes: 45), '45 ${l10n.minutesAbbreviation}'),
      (const Duration(hours: 1), '1 ${l10n.hoursAbbreviation}'),
      (const Duration(minutes: 90), '1.5 ${l10n.hoursAbbreviation}'),
      (const Duration(hours: 2), '2 ${l10n.hoursAbbreviation}'),
      (const Duration(minutes: 150), '2.5 ${l10n.hoursAbbreviation}'),
      (const Duration(hours: 3), '3 ${l10n.hoursAbbreviation}'),
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: _cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.bedtime_rounded, color: _gold, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.sleepTimer,
                      style: GoogleFonts.lato(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    if (_sleepRemaining != null)
                      TextButton(
                        onPressed: () {
                          _cancelSleepTimer();
                          Navigator.pop(ctx);
                        },
                        child: Text(
                          l10n.cancelTimerButton,
                          style: GoogleFonts.lato(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final (duration, label) in presets)
                      _SleepChip(
                        label: label,
                        onTap: () {
                          _startSleepTimer(duration);
                          Navigator.pop(ctx);
                        },
                      ),
                    _SleepChip(
                      label: l10n.custom,
                      icon: Icons.edit_rounded,
                      onTap: () {
                        Navigator.pop(ctx);
                        _showCustomSleepDialog();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showCustomSleepDialog() async {
    final minutes = await showHoursMinutesPickerDialog(context);
    if (minutes != null && minutes > 0 && mounted) {
      _startSleepTimer(Duration(minutes: minutes));
    }
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final langCode = Localizations.localeOf(context).languageCode;
    final isArabicLocale = langCode == 'ar';
    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              widget.surah.englishName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            if (isArabicLocale)
              Text(
                widget.surah.name,
                style: GoogleFonts.scheherazadeNew(fontSize: 15, color: _gold),
              )
            else
              Text(
                surahNameTranslations[widget.surah.number]?[langCode] ??
                    widget.surah.englishNameTranslation,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _gold,
                  letterSpacing: 0.2,
                ),
              ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_stories_outlined),
            tooltip: l10n.tafsir,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => TafsirScreen(surah: widget.surah)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_rounded, color: _gold),
            tooltip: l10n.savedVerses,
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SavedVersesScreen()),
              );
              _loadVerseBookmarks();
            },
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: _gold))
          : AnimatedOpacity(
              opacity: _dismissing ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              child: Stack(
                children: [
                  Column(
                    children: [
                      if (widget.ayahChallenge != null)
                        _AyahChallengeBanner(
                          seenCount: _seenVerses.length,
                          complete: _challengeComplete,
                        ),
                      FontSizeSlider(
                          index: _fontScaleIndex,
                          onChanged: _onFontScaleChanged),
                      Expanded(
                        child: Listener(
                          onPointerDown: _onPointerDown,
                          onPointerMove: _onPointerMove,
                          onPointerUp: _onPointerUp,
                          onPointerCancel: _onPointerUp,
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              // Scrolling while paused hides the bar to give the
                              // reader more room; while playing it stays put.
                              // dragDetails is only non-null for an actual user
                              // drag, never for the app's own programmatic
                              // scroll-to-verse — so that auto-scroll (e.g. a
                              // verse that auto-pauses right after
                              // auto-advancing) never counts as a manual scroll.
                              if (notification is ScrollUpdateNotification &&
                                  notification.dragDetails != null &&
                                  !_isPlaying &&
                                  !_hiddenByScroll) {
                                setState(() => _hiddenByScroll = true);
                              }
                              return false;
                            },
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaler: TextScaler.linear(
                                    kFontScaleSteps[_fontScaleIndex]),
                              ),
                              child: ListView.builder(
                                controller: _scrollController,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(
                                  16,
                                  8,
                                  16,
                                  _showPlayerBar ? 110 : 16,
                                ),
                                itemCount: _verses.length +
                                    (_showBismillah ? 1 : 0) +
                                    (_isFatiha ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (_showBismillah && index == 0) {
                                    return _BismillahHeader(
                                        textScale: _textScale);
                                  }
                                  final introIndex =
                                      _showBismillah ? 1 : 0;
                                  if (_isFatiha && index == introIndex) {
                                    return const _FatihaIntroCard();
                                  }
                                  final headerCount =
                                      (_showBismillah ? 1 : 0) +
                                          (_isFatiha ? 1 : 0);
                                  final verse =
                                      _verses[index - headerCount];
                                  final challengeActive =
                                      widget.ayahChallenge != null &&
                                          !_challengeComplete;
                                  final isLast = index ==
                                      _verses.length + headerCount - 1;
                                  Widget tile = _VerseTile(
                                    verse: verse,
                                    textScale: _textScale,
                                    isLast: isLast,
                                    isActive:
                                        _playingVerseNumber == verse.number,
                                    isPlaying:
                                        _playingVerseNumber == verse.number &&
                                            _isPlaying,
                                    playTooltip: l10n.playVerse,
                                    onPlayTap: () =>
                                        _playVerseAudio(verse.number),
                                    onTafsirTap: () =>
                                        _showVerseTafsir(verse),
                                    onShareTap: () => _shareVerse(verse),
                                    isBookmarked: _bookmarkedVerses
                                        .contains(verse.number),
                                    onBookmarkTap: () =>
                                        _toggleVerseBookmark(verse),
                                    challengeActive: challengeActive,
                                    challengeSeen:
                                        _seenVerses.contains(verse.number),
                                    justConfirmed:
                                        _justConfirmedVerse == verse.number,
                                    onAyahTap: challengeActive
                                        ? () => _onAyahRead(verse.number)
                                        : null,
                                  );
                                  // Gold pulse over the verse a deep link /
                                  // saved verse / search result landed on.
                                  // Overlaid ON TOP of the tile (its card is
                                  // opaque); the bottom inset keeps the pulse
                                  // off the 10px gap _VerseTile adds below
                                  // every card but the last.
                                  if (_highlightVerseNumber == verse.number) {
                                    tile = Stack(
                                      children: [
                                        tile,
                                        Positioned.fill(
                                          bottom: isLast ? 0 : 10,
                                          child: IgnorePointer(
                                            child: AnimatedBuilder(
                                              animation: _highlightFade,
                                              builder: (_, __) => DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: _pulseGold.withValues(
                                                    alpha: 0.3 *
                                                        (1 -
                                                            _highlightFade
                                                                .value),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return KeyedSubtree(
                                    key: _verseKey(verse.number),
                                    child: tile,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: !_showPlayerBar,
                      child: AnimatedSlide(
                        duration: const Duration(milliseconds: 320),
                        curve: Curves.easeOutCubic,
                        offset:
                            _showPlayerBar ? Offset.zero : const Offset(0, 1.2),
                        child: _PlayerBar(
                          surahEnglishName: widget.surah.englishName,
                          verseNumber: _playingVerseNumber ??
                              (_verses.isNotEmpty ? _verses.first.number : 1),
                          totalVerses: widget.surah.numberOfAyahs,
                          reciterShortName: _selectedReciter.shortName,
                          audioPlayer: _audioPlayer,
                          isPlaying: _isPlaying,
                          continuousPlay: _continuousPlay,
                          sleepRemaining: _sleepRemaining,
                          onPlayPause: () => _playVerseAudio(
                            _playingVerseNumber ??
                                (_verses.isNotEmpty ? _verses.first.number : 1),
                          ),
                          onPrevious: () => _playAdjacent(-1),
                          onNext: () => _playAdjacent(1),
                          onToggleContinuous: _toggleContinuousPlay,
                          onSleepTimer: _showSleepTimerSheet,
                          onReciterTap: _showReciterSheet,
                          onClose: _closePlayer,
                        ),
                      ),
                    ),
                  ),
                  if (_challengeComplete)
                    const Positioned.fill(
                      child: _ChallengeCompleteOverlay(),
                    ),
                ],
              ),
            ),
    );
  }
}

// ── Ayah-challenge progress banner ────────────────────────────────────────────

class _AyahChallengeBanner extends StatelessWidget {
  final int seenCount;
  final bool complete;
  const _AyahChallengeBanner({required this.seenCount, required this.complete});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: _gold.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _gold.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(
            complete ? Icons.check_circle_rounded : Icons.menu_book_rounded,
            size: 18,
            color: _gold,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  complete
                      ? l10n.quranChallengeComplete
                      : l10n.quranChallengeBannerTitle,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
                if (!complete) ...[
                  const SizedBox(height: 2),
                  Text(
                    l10n.quranChallengeBannerProgress(
                      seenCount.clamp(0, AyahChallenge.targetCount),
                      AyahChallenge.targetCount,
                    ),
                    style: GoogleFonts.lato(
                      fontSize: 11.5,
                      color: _gold.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Ayah-challenge completion celebration ───────────────────────────────────

/// Full-screen gold celebration shown for ~1s once the 3rd ayah is counted,
/// before the screen fades out and returns the user to their app — the
/// "premium, intentional" beat between finishing the challenge and leaving.
class _ChallengeCompleteOverlay extends StatelessWidget {
  const _ChallengeCompleteOverlay();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return IgnorePointer(
      child: Container(
        color: _navy.withValues(alpha: 0.82),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.6, end: 1.0),
            duration: const Duration(milliseconds: 450),
            curve: Curves.elasticOut,
            builder: (context, scale, child) =>
                Transform.scale(scale: scale, child: child),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _gold.withValues(alpha: 0.15),
                    border: Border.all(color: _gold, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _gold.withValues(alpha: 0.55),
                        blurRadius: 44,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: _gold,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.quranChallengeComplete,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Reciter picker sheet ──────────────────────────────────────────────────────

class _ReciterSheet extends StatefulWidget {
  final Reciter selected;
  final List<String> initialFavoriteIds;
  final ValueChanged<Reciter> onSelect;
  final ValueChanged<List<String>> onFavoritesChanged;

  const _ReciterSheet({
    required this.selected,
    required this.initialFavoriteIds,
    required this.onSelect,
    required this.onFavoritesChanged,
  });

  @override
  State<_ReciterSheet> createState() => _ReciterSheetState();
}

class _ReciterSheetState extends State<_ReciterSheet> {
  late List<String> _favoriteIds = List.of(widget.initialFavoriteIds);

  /// Shows the "max 3 favorites" message inline in the sheet — a SnackBar
  /// would be hidden behind this modal bottom sheet.
  bool _limitMessageVisible = false;
  Timer? _limitTimer;

  @override
  void dispose() {
    _limitTimer?.cancel();
    super.dispose();
  }

  void _toggleFavorite(Reciter reciter) {
    HapticFeedback.lightImpact();
    final ids = List.of(_favoriteIds);
    if (ids.contains(reciter.id)) {
      ids.remove(reciter.id);
    } else if (ids.length >= _maxFavoriteReciters) {
      _limitTimer?.cancel();
      setState(() => _limitMessageVisible = true);
      _limitTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) setState(() => _limitMessageVisible = false);
      });
      return;
    } else {
      ids.add(reciter.id);
    }
    setState(() {
      _favoriteIds = ids;
      _limitMessageVisible = false;
    });
    widget.onFavoritesChanged(ids);
  }

  Widget _sectionHeader(String label) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 6),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _gold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      );

  Widget _tile(Reciter r) => _ReciterTile(
        reciter: r,
        isSelected: r.id == widget.selected.id,
        isFavorite: _favoriteIds.contains(r.id),
        isLocked: !_freeReciterIds.contains(r.id),
        onTap: () => widget.onSelect(r),
        onToggleFavorite: () => _toggleFavorite(r),
      );

  static const _rowDivider = Divider(
      color: Colors.white12, height: 1, indent: 20, endIndent: 20);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Favorites keep the order they were added in; the rest keep list order.
    final favorites = [
      for (final id in _favoriteIds)
        ...reciters.where((r) => r.id == id),
    ];
    final others =
        reciters.where((r) => !_favoriteIds.contains(r.id)).toList();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Drag handle ──────────────────────────────────────────────
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ── Header ───────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.mic_rounded, color: _gold, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    l10n.selectReciter,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // ── Limit message (inline, auto-hides) ───────────────────────
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              child: _limitMessageVisible
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline_rounded,
                              color: _gold, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              l10n.favoriteRecitersLimit,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: _gold,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.white12, height: 1),
            // ── Reciter list: favorites pinned on top ────────────────────
            Flexible(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  if (favorites.isNotEmpty) ...[
                    _sectionHeader(l10n.favoriteRecitersSection),
                    for (int i = 0; i < favorites.length; i++) ...[
                      if (i > 0) _rowDivider,
                      _tile(favorites[i]),
                    ],
                    const Divider(color: Colors.white24, height: 1),
                  ],
                  for (int i = 0; i < others.length; i++) ...[
                    if (i > 0) _rowDivider,
                    _tile(others[i]),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _ReciterTile extends StatelessWidget {
  final Reciter reciter;
  final bool isSelected;
  final bool isFavorite;
  final bool isLocked;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const _ReciterTile({
    required this.reciter,
    required this.isSelected,
    required this.isFavorite,
    required this.isLocked,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    // Same faded treatment as past events on the Islamic Calendar screen.
    final double dim = isLocked ? 0.55 : 1.0;

    return InkWell(
      onTap: onTap,
      splashColor: _gold.withValues(alpha: 0.08),
      highlightColor: _gold.withValues(alpha: 0.04),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            // Star button
            GestureDetector(
              onTap: onToggleFavorite,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Icon(
                  isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: (isFavorite ? _gold : Colors.white30)
                      .withValues(alpha: dim),
                  size: 22,
                ),
              ),
            ),
            // Reciter name
            Expanded(
              child: Text(
                reciter.name,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: (isSelected ? _gold : Colors.white)
                      .withValues(alpha: dim),
                ),
              ),
            ),
            // Selected checkmark
            if (isSelected)
              const Icon(Icons.check_rounded, color: _gold, size: 20),
          ],
        ),
      ),
    );
  }
}

// ── Player bar ───────────────────────────────────────────────────────────────

class _PlayerBar extends StatefulWidget {
  final String surahEnglishName;
  final int verseNumber;
  final int totalVerses;
  final String reciterShortName;
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final bool continuousPlay;
  final Duration? sleepRemaining;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToggleContinuous;
  final VoidCallback onSleepTimer;
  final VoidCallback onReciterTap;
  final VoidCallback onClose;

  const _PlayerBar({
    required this.surahEnglishName,
    required this.verseNumber,
    required this.totalVerses,
    required this.reciterShortName,
    required this.audioPlayer,
    required this.isPlaying,
    required this.continuousPlay,
    this.sleepRemaining,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
    required this.onToggleContinuous,
    required this.onSleepTimer,
    required this.onReciterTap,
    required this.onClose,
  });

  @override
  State<_PlayerBar> createState() => _PlayerBarState();
}

class _PlayerBarState extends State<_PlayerBar> {
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _seeking = false;
  double _seekValue = 0.0;

  late final StreamSubscription<Duration> _positionSub;
  late final StreamSubscription<Duration?> _durationSub;
  late final StreamSubscription<int?> _indexSub;

  @override
  void initState() {
    super.initState();
    _positionSub = widget.audioPlayer.positionStream.listen((pos) {
      if (!_seeking && mounted) setState(() => _position = pos);
    });
    _durationSub = widget.audioPlayer.durationStream.listen((dur) {
      if (mounted) setState(() => _duration = dur ?? Duration.zero);
    });
    // Avoids briefly showing the previous verse's position/duration while
    // the newly selected one is still loading.
    _indexSub = widget.audioPlayer.currentIndexStream.listen((_) {
      if (mounted) setState(() => _position = Duration.zero);
    });
  }

  @override
  void dispose() {
    _positionSub.cancel();
    _durationSub.cancel();
    _indexSub.cancel();
    super.dispose();
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return d.inHours > 0 ? '${d.inHours}:$m:$s' : '$m:$s';
  }

  double get _sliderValue {
    if (_seeking) return _seekValue;
    if (_duration.inMilliseconds == 0) return 0.0;
    return (_position.inMilliseconds / _duration.inMilliseconds)
        .clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        border: Border(
            top: BorderSide(color: _gold.withValues(alpha: 0.3), width: 1.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Row 1: reciter button | sleep countdown ────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 16, 4),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: widget.onReciterTap,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 6),
                      decoration: BoxDecoration(
                        color: _gold.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _gold.withValues(alpha: 0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mic_rounded, size: 13, color: _gold),
                          const SizedBox(width: 5),
                          Text(
                            widget.reciterShortName,
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _gold,
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 14,
                            color: _gold.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (widget.sleepRemaining != null) ...[
                    const Icon(Icons.bedtime_rounded, size: 13, color: _gold),
                    const SizedBox(width: 4),
                    Text(
                      _fmt(widget.sleepRemaining!),
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _gold,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  GestureDetector(
                    onTap: widget.onClose,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _gold.withValues(alpha: 0.5)),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.close_rounded,
                          size: 14, color: _gold),
                    ),
                  ),
                ],
              ),
            ),

            // ── Row 2: surah name | verse count ───────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.surahEnglishName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.verseCount(widget.totalVerses, widget.verseNumber),
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // ── Progress bar ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    _fmt(_position),
                    style:
                        GoogleFonts.lato(fontSize: 10, color: Colors.white38),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 5.5),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 14),
                        activeTrackColor: _gold,
                        inactiveTrackColor: _gold.withValues(alpha: 0.18),
                        thumbColor: _gold,
                        overlayColor: _gold.withValues(alpha: 0.18),
                      ),
                      child: Slider(
                        value: _sliderValue,
                        onChangeStart: (v) => setState(() {
                          _seeking = true;
                          _seekValue = v;
                        }),
                        onChanged: (v) => setState(() => _seekValue = v),
                        onChangeEnd: (v) {
                          final ms = (_duration.inMilliseconds * v).round();
                          widget.audioPlayer.seek(Duration(milliseconds: ms));
                          setState(() => _seeking = false);
                        },
                      ),
                    ),
                  ),
                  Text(
                    _fmt(_duration),
                    style:
                        GoogleFonts.lato(fontSize: 10, color: Colors.white38),
                  ),
                ],
              ),
            ),

            // ── Controls ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous_rounded),
                    color: Colors.white70,
                    iconSize: 32,
                    onPressed: widget.onPrevious,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onPlayPause,
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _gold,
                        boxShadow: [
                          BoxShadow(
                            color: _gold.withValues(alpha: 0.4),
                            blurRadius: 14,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 32,
                        color: _navy,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.skip_next_rounded),
                    color: Colors.white70,
                    iconSize: 32,
                    onPressed: widget.onNext,
                  ),
                ],
              ),
            ),

            // ── Toggles: continuous play | sleep timer ─────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 2, 14, 12),
              child: Row(
                children: [
                  _TogglePill(
                    icon: Icons.repeat_rounded,
                    label: l10n.continuousPlay,
                    active: widget.continuousPlay,
                    onTap: widget.onToggleContinuous,
                  ),
                  const Spacer(),
                  _TogglePill(
                    icon: Icons.bedtime_rounded,
                    label: l10n.sleepTimer,
                    active: widget.sleepRemaining != null,
                    onTap: widget.onSleepTimer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reusable toggle pill button ───────────────────────────────────────────────

class _TogglePill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _TogglePill({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: active ? _gold.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: active ? _gold.withValues(alpha: 0.6) : Colors.white24,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: active ? _gold : Colors.white38),
            const SizedBox(width: 4),
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: active ? _gold : Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Sleep timer chip ──────────────────────────────────────────────────────────

class _SleepChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const _SleepChip({required this.label, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold.withValues(alpha: 0.4)),
          color: _gold.withValues(alpha: 0.08),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 13, color: _gold),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _gold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Al-Fatiha intro card ──────────────────────────────────────────────────────

class _FatihaIntroCard extends StatelessWidget {
  const _FatihaIntroCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.7), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.14),
            blurRadius: 32,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _IslamicPatternPainter()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'الْفَاتِحَة',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 52,
                        color: _gold,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.fatihaIntroTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(height: 1, color: _gold.withValues(alpha: 0.28)),
                  const SizedBox(height: 18),
                  Text(
                    l10n.fatihaIntroBody,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.87),
                      height: 1.75,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                    decoration: BoxDecoration(
                      color: _gold.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: _gold.withValues(alpha: 0.28)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.format_quote_rounded,
                          color: _gold.withValues(alpha: 0.55),
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            l10n.fatihaIntroIbnKathir,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              color: _gold.withValues(alpha: 0.88),
                              height: 1.65,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IslamicPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37).withValues(alpha: 0.055)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    const step = 36.0;
    const r = 13.0;
    for (double x = 0; x <= size.width + step; x += step) {
      for (double y = 0; y <= size.height + step; y += step) {
        _drawStar8(canvas, paint, Offset(x, y), r);
      }
    }
  }

  void _drawStar8(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    final inner = r * 0.42;
    for (int i = 0; i < 8; i++) {
      final outerAngle = i * math.pi / 4 - math.pi / 2;
      final innerAngle = outerAngle + math.pi / 8;
      final ox = center.dx + r * math.cos(outerAngle);
      final oy = center.dy + r * math.sin(outerAngle);
      final ix = center.dx + inner * math.cos(innerAngle);
      final iy = center.dy + inner * math.sin(innerAngle);
      if (i == 0) {
        path.moveTo(ox, oy);
      } else {
        path.lineTo(ix, iy);
        path.lineTo(ox, oy);
      }
    }
    // close back through the last inner point
    const lastInner = 7 * math.pi / 4 - math.pi / 2 + math.pi / 8;
    path.lineTo(
      center.dx + inner * math.cos(lastInner),
      center.dy + inner * math.sin(lastInner),
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Bismillah header ──────────────────────────────────────────────────────────

class _BismillahHeader extends StatelessWidget {
  final double textScale;
  const _BismillahHeader({this.textScale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.45), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.09),
            blurRadius: 22,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            textAlign: TextAlign.center,
            style: GoogleFonts.scheherazadeNew(
              fontSize: 28 * textScale,
              color: _gold,
              height: 1.9,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Bismillaahir Rahmaanir Raheem',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 12 * textScale,
              fontStyle: FontStyle.italic,
              color: _gold.withValues(alpha: 0.72),
              letterSpacing: 0.4,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Verse tile ────────────────────────────────────────────────────────────────

class _VerseTile extends StatelessWidget {
  final Verse verse;
  final double textScale;
  final bool isLast;
  final bool isActive;
  final bool isPlaying;
  final String playTooltip;
  final VoidCallback onPlayTap;
  final VoidCallback onTafsirTap;
  final VoidCallback? onShareTap;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;

  /// True while an ayah-reading challenge is in progress — shows the
  /// read/unread indicator dot next to the verse number.
  final bool challengeActive;
  final bool challengeSeen;

  /// Briefly true right after this verse is counted, for the gold flash.
  final bool justConfirmed;
  final VoidCallback? onAyahTap;

  const _VerseTile({
    required this.verse,
    this.textScale = 1.0,
    required this.isLast,
    this.isActive = false,
    required this.isPlaying,
    required this.playTooltip,
    required this.onPlayTap,
    required this.onTafsirTap,
    this.onShareTap,
    this.isBookmarked = false,
    this.onBookmarkTap,
    this.challengeActive = false,
    this.challengeSeen = false,
    this.justConfirmed = false,
    this.onAyahTap,
  });

  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    final highlighted = isActive || justConfirmed;
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onAyahTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            decoration: BoxDecoration(
              color: highlighted
                  ? Color.lerp(_cardColor, _gold, 0.07)
                  : _cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: highlighted ? _gold : _gold.withValues(alpha: 0.12),
                width: highlighted ? 1.6 : 1,
              ),
              boxShadow: highlighted
                  ? [
                      BoxShadow(
                        color: _gold.withValues(alpha: 0.25),
                        blurRadius: 18,
                        spreadRadius: 0,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: _gold.withValues(alpha: 0.7), width: 1.2),
                        color: _gold.withValues(alpha: 0.08),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${verse.number}',
                        textScaler: TextScaler.noScaling,
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _gold,
                        ),
                      ),
                    ),
                    if (challengeActive) ...[
                      const SizedBox(width: 6),
                      Icon(
                        challengeSeen
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_unchecked_rounded,
                        size: 16,
                        color: challengeSeen
                            ? _gold
                            : _gold.withValues(alpha: 0.3),
                      ),
                    ],
                    const SizedBox(width: 12),
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          verse.arabic,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 24 * textScale,
                            color: Colors.white,
                            height: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (verse.transliteration.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Container(height: 1, color: _gold.withValues(alpha: 0.15)),
                  const SizedBox(height: 10),
                  Text(
                    verse.transliteration,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: 12.5 * textScale,
                      fontStyle: FontStyle.italic,
                      color: _gold.withValues(alpha: 0.85),
                      height: 1.6,
                    ),
                  ),
                ],
                if (verse.translation.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(height: 1, color: _gold.withValues(alpha: 0.15)),
                  const SizedBox(height: 10),
                  Text(
                    verse.translation,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: 13 * textScale,
                      color: _mutedText,
                      height: 1.65,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                Row(
                  children: [
                    _TafsirButton(onTap: onTafsirTap),
                    const Spacer(),
                    if (onBookmarkTap != null) ...[
                      GestureDetector(
                        onTap: onBookmarkTap,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, anim) =>
                              ScaleTransition(scale: anim, child: child),
                          child: Icon(
                            isBookmarked
                                ? Icons.bookmark_rounded
                                : Icons.bookmark_border_rounded,
                            key: ValueKey(isBookmarked),
                            size: 22,
                            color: _gold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    if (onShareTap != null) ...[
                      GestureDetector(
                        onTap: onShareTap,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _gold.withValues(alpha: 0.12),
                            border: Border.all(
                                color: _gold.withValues(alpha: 0.60),
                                width: 1.2),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Icons.share_rounded,
                              color: _gold, size: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    _PlayButton(
                      isPlaying: isPlaying,
                      tooltip: playTooltip,
                      onTap: onPlayTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!isLast) const SizedBox(height: 10),
      ],
    );
  }
}

// ── Verse play button ─────────────────────────────────────────────────────────

class _PlayButton extends StatelessWidget {
  final bool isPlaying;
  final String tooltip;
  final VoidCallback onTap;

  const _PlayButton({
    required this.isPlaying,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withValues(alpha: 0.12),
            border: Border.all(color: _gold.withValues(alpha: 0.5)),
          ),
          alignment: Alignment.center,
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: _gold,
            size: 18,
          ),
        ),
      ),
    );
  }
}

// ── Verse tafsir button ──────────────────────────────────────────────────────

class _TafsirButton extends StatelessWidget {
  final VoidCallback onTap;
  const _TafsirButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Tooltip(
      message: l10n.verseTafsir,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withValues(alpha: 0.08),
            border: Border.all(color: _gold.withValues(alpha: 0.35)),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.auto_stories_rounded,
            color: _gold.withValues(alpha: 0.8),
            size: 15,
          ),
        ),
      ),
    );
  }
}

// ── Verse tafsir bottom sheet ────────────────────────────────────────────────

class _VerseTafsirSheet extends StatefulWidget {
  final int surahNumber;
  final String surahName;
  final Verse verse;
  final String locale;
  final AppLocalizations l10n;

  const _VerseTafsirSheet({
    required this.surahNumber,
    required this.surahName,
    required this.verse,
    required this.locale,
    required this.l10n,
  });

  @override
  State<_VerseTafsirSheet> createState() => _VerseTafsirSheetState();
}

class _VerseTafsirSheetState extends State<_VerseTafsirSheet> {
  TafsirApiResult? _tafsir;
  bool _loading = true;
  bool _notFound = false;

  @override
  void initState() {
    super.initState();
    _fetchTafsir();
  }

  Future<void> _fetchTafsir() async {
    final result = await TafsirApiService.instance.fetchTafsirVerse(
      widget.surahNumber,
      widget.verse.number,
      widget.locale,
    );
    if (!mounted) return;
    setState(() {
      _tafsir = result;
      _loading = false;
      _notFound = result == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: _navy,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _gold.withValues(alpha: 0.12),
                    border: Border.all(color: _gold.withValues(alpha: 0.5)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.verse.number}',
                    textScaler: TextScaler.noScaling,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.verseTafsir,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${widget.surahName} ${widget.surahNumber}:${widget.verse.number}',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: _gold.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_tafsir != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: _gold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _tafsir!.source,
                      style: GoogleFonts.lato(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: _gold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(height: 1, color: _gold.withValues(alpha: 0.15)),
          Flexible(
            child: _loading
                ? Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: _gold.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.loadingTafsir,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  )
                : _notFound
                    ? Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(
                          l10n.tafsirNotAvailable,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.white38,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                widget.verse.arabic,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 22,
                                  color: _gold,
                                  height: 2.0,
                                ),
                              ),
                            ),
                            if (widget.verse.translation.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              Text(
                                widget.verse.translation,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xFF8A9BB0),
                                  height: 1.6,
                                ),
                              ),
                            ],
                            const SizedBox(height: 16),
                            Container(
                                height: 1,
                                color: _gold.withValues(alpha: 0.15)),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(
                                  Icons.auto_stories_rounded,
                                  size: 14,
                                  color: _gold.withValues(alpha: 0.7),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  l10n.tafsir,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: _gold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _tafsir!.text,
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.85),
                                height: 1.75,
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
