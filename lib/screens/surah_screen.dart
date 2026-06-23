import 'dart:async';
import 'dart:io';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/surah_translations.dart';
import '../l10n/app_localizations.dart';
import '../models/reciter_model.dart';
import '../models/surah_model.dart';
import '../services/app_blocking_service.dart';
import '../services/quran_service.dart';
import '../services/tafsir_api_service.dart';
import '../widgets/font_size_slider.dart';
import 'tafsir_screen.dart';

const _textScaleKey = 'quran_text_scale';
const _favReciterKey = 'favorite_reciter_id';
const double _minTextScale = 0.8;
const double _maxTextScale = 4.0;

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFD4AF37);
const _cardColor = Color(0xFF152030);

// Cached across the whole app session so the mosque image used as lock
// screen / notification artwork is only copied out of the asset bundle once.
Uri? _quranArtworkUri;

/// MediaItem.artUri needs a real file:// (or http(s):///content://) URI —
/// Flutter asset paths aren't directly usable — so this copies the bundled
/// mosque hero image to a real file on first use and reuses it after that.
Future<Uri> _getQuranArtworkUri() async {
  final cached = _quranArtworkUri;
  if (cached != null) return cached;
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/quran_audio_artwork.jpg');
  if (!await file.exists()) {
    final data = await rootBundle.load('assets/images/mosques/mosque_1.jpg');
    await file.writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      flush: true,
    );
  }
  final uri = Uri.file(file.path);
  _quranArtworkUri = uri;
  return uri;
}

class SurahScreen extends StatefulWidget {
  final Surah surah;

  /// Non-null when opened from the App Blocking block screen's "Read 3
  /// Ayahs" button — shows a progress banner and grants the bypass once
  /// [AyahChallenge.targetCount] distinct ayahs have been viewed.
  final AyahChallenge? ayahChallenge;
  const SurahScreen({super.key, required this.surah, this.ayahChallenge});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
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
  String? _favoriteReciterId;
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<AudioSource>? _playlist;
  Uri? _artworkUri;
  int? _playingVerseNumber;
  bool _isPlaying = false;

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
    _currentIndexSub = _audioPlayer.currentIndexStream.listen((index) {
      if (!mounted || index == null) return;
      if (index < 0 || index >= _verses.length) return;
      final verseNumber = _verses[index].number;
      setState(() => _playingVerseNumber = verseNumber);
      _scrollToVerse(verseNumber);
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
  }

  // ── Favourite reciter ────────────────────────────────────────────────────

  Future<void> _loadFavoriteReciter() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(_favReciterKey);
    if (!mounted) return;
    setState(() {
      _favoriteReciterId = id;
      if (id != null) {
        final match = reciters.where((r) => r.id == id).firstOrNull;
        if (match != null) _selectedReciter = match;
      }
    });
  }

  Future<void> _setFavoriteReciter(Reciter reciter) async {
    HapticFeedback.lightImpact();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_favReciterKey, reciter.id);
    if (!mounted) return;
    setState(() => _favoriteReciterId = reciter.id);
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
        initialFavoriteId: _favoriteReciterId,
        onSelect: (reciter) {
          _onSelectReciter(reciter);
          Navigator.pop(ctx);
        },
        onToggleFavorite: _setFavoriteReciter,
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
    // dispose() stops playback internally first, which also tears down the
    // lock screen / notification media session for this player.
    _audioPlayer.dispose();
    _sleepCountdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _load(String locale) async {
    final verses = await fetchVerses(widget.surah.number, locale: locale);
    _artworkUri = await _getQuranArtworkUri();
    if (!mounted) return;
    setState(() {
      _verses = verses;
      _loading = false;
    });
    // The playlist is built lazily on first play (see _playVerseAudio), not
    // here — setAudioSources() resets the player's current index to 0 as
    // soon as it's called, which would mark verse 1 "active" (showing the
    // player bar and its highlight) before the user has tapped play at all.
  }

  // ── Audio playback ───────────────────────────────────────────────────────

  // Surah 9 (At-Tawbah) is the only surah without Bismillah.
  bool get _showBismillah => widget.surah.number != 9;

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
    if (!mounted) return;
    setState(() {
      _playingVerseNumber = null;
      _hiddenByScroll = false;
    });
  }

  Future<void> _onSelectReciter(Reciter reciter) async {
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

  void _showCustomSleepDialog() {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _cardColor,
        title: Text(
          l10n.customTimerMinutesTitle,
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: l10n.customTimerHint,
            hintStyle: const TextStyle(color: Colors.white38),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _gold.withValues(alpha: 0.5)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: _gold),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel,
                style: GoogleFonts.lato(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              final minutes = int.tryParse(controller.text.trim());
              if (minutes != null && minutes > 0) {
                _startSleepTimer(Duration(minutes: minutes));
                Navigator.pop(ctx);
              }
            },
            child: Text(
              l10n.start,
              style:
                  GoogleFonts.lato(color: _gold, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
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
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(
                                  16,
                                  8,
                                  16,
                                  _showPlayerBar ? 110 : 16,
                                ),
                                itemCount:
                                    _verses.length + (_showBismillah ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (_showBismillah && index == 0) {
                                    return _BismillahHeader(
                                        textScale: _textScale);
                                  }
                                  final verse = _verses[
                                      _showBismillah ? index - 1 : index];
                                  final challengeActive =
                                      widget.ayahChallenge != null &&
                                          !_challengeComplete;
                                  return KeyedSubtree(
                                    key: _verseKey(verse.number),
                                    child: _VerseTile(
                                      verse: verse,
                                      textScale: _textScale,
                                      isLast: index ==
                                          _verses.length +
                                              (_showBismillah ? 0 : -1),
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
                                      challengeActive: challengeActive,
                                      challengeSeen:
                                          _seenVerses.contains(verse.number),
                                      justConfirmed:
                                          _justConfirmedVerse == verse.number,
                                      onAyahTap: challengeActive
                                          ? () => _onAyahRead(verse.number)
                                          : null,
                                    ),
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
  final String? initialFavoriteId;
  final ValueChanged<Reciter> onSelect;
  final ValueChanged<Reciter> onToggleFavorite;

  const _ReciterSheet({
    required this.selected,
    required this.initialFavoriteId,
    required this.onSelect,
    required this.onToggleFavorite,
  });

  @override
  State<_ReciterSheet> createState() => _ReciterSheetState();
}

class _ReciterSheetState extends State<_ReciterSheet> {
  late String? _favoriteId;

  @override
  void initState() {
    super.initState();
    _favoriteId = widget.initialFavoriteId;
  }

  List<Reciter> get _sortedReciters {
    final sorted = List<Reciter>.from(reciters);
    if (_favoriteId != null) {
      final idx = sorted.indexWhere((r) => r.id == _favoriteId);
      if (idx > 0) sorted.insert(0, sorted.removeAt(idx));
    }
    return sorted;
  }

  void _toggleFavorite(Reciter reciter) {
    HapticFeedback.lightImpact();
    final newId = _favoriteId == reciter.id ? null : reciter.id;
    setState(() => _favoriteId = newId);
    if (newId != null) widget.onToggleFavorite(reciter);
  }

  @override
  Widget build(BuildContext context) {
    final sorted = _sortedReciters;
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
                    'Reciter',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.white12, height: 1),
            // ── Reciter list ─────────────────────────────────────────────
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: sorted.length,
                separatorBuilder: (_, __) => const Divider(
                    color: Colors.white12,
                    height: 1,
                    indent: 20,
                    endIndent: 20),
                itemBuilder: (ctx, i) {
                  final r = sorted[i];
                  final isSelected = r.id == widget.selected.id;
                  final isFavorite = r.id == _favoriteId;
                  return _ReciterTile(
                    reciter: r,
                    isSelected: isSelected,
                    isFavorite: isFavorite,
                    onTap: () => widget.onSelect(r),
                    onToggleFavorite: () => _toggleFavorite(r),
                  );
                },
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
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const _ReciterTile({
    required this.reciter,
    required this.isSelected,
    required this.isFavorite,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: isFavorite ? _gold : Colors.white30,
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
                  color: isSelected ? _gold : Colors.white,
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
