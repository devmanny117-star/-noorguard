import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/reciter_model.dart';
import '../models/surah_model.dart';
import 'quran_service.dart';

/// App-wide "now playing" state for Quran verse audio, shared between
/// [SurahScreen]'s full reader and the Quran tab's mini player. Holding the
/// single [AudioPlayer] instance here (instead of inside SurahScreen's own
/// State) is what lets playback survive navigating away from the reader —
/// SurahScreen no longer disposes it on exit, only detaches its own local
/// UI subscriptions.
///
/// Also persists the last-played surah/ayah/reciter to SharedPreferences, so
/// the mini player can show it — paused, nothing loaded yet — from the
/// moment the app launches (see [restoreLastPlayed] and [resume]).
class QuranPlayerController extends ChangeNotifier {
  QuranPlayerController._() {
    // Backstops SurahScreen's own explicit setNowPlaying calls: keeps
    // [verseNumber] correct as playback naturally advances even while no
    // SurahScreen is mounted to report it (e.g. resumed from the mini
    // player, then left sitting on the Quran tab while verses auto-advance).
    player.currentIndexStream.listen(_onIndexChanged);
  }
  static final QuranPlayerController instance = QuranPlayerController._();

  static const _prefsKey = 'quran_last_played';

  final AudioPlayer player = AudioPlayer();

  Surah? surah;
  Reciter? reciter;
  int? verseNumber;

  /// Verse numbers for the playlist currently loaded into [player], in
  /// index order — lets [_onIndexChanged] map a raw player index back to an
  /// ayah number. Set alongside every setAudioSources() call (by
  /// SurahScreen's setNowPlaying, and by [resume]'s own cold-start load).
  List<int>? _playlistVerseNumbers;

  Uri? _artworkUriCache;

  /// True once something has been loaded for playback — the mini player
  /// shows whenever this is true, mirroring how SurahScreen's own in-reader
  /// player bar already stays up while paused (not just while playing).
  bool get hasActiveSession => surah != null;

  void _onIndexChanged(int? index) {
    final numbers = _playlistVerseNumbers;
    final currentSurah = surah;
    final currentReciter = reciter;
    if (index == null || numbers == null) return;
    if (index < 0 || index >= numbers.length) return;
    if (currentSurah == null || currentReciter == null) return;
    setNowPlaying(
      surah: currentSurah,
      reciter: currentReciter,
      verseNumber: numbers[index],
    );
  }

  /// Called by SurahScreen whenever the currently-playing verse changes
  /// (a tap, prev/next, continuous auto-advance, or a lock-screen/
  /// notification control) — the single place all of those already funnel
  /// through via currentIndexStream. [playlistVerseNumbers] should be the
  /// verse numbers of the playlist currently loaded into [player], in index
  /// order, whenever the caller has them handy.
  void setNowPlaying({
    required Surah surah,
    required Reciter reciter,
    required int verseNumber,
    List<int>? playlistVerseNumbers,
  }) {
    this.surah = surah;
    this.reciter = reciter;
    this.verseNumber = verseNumber;
    if (playlistVerseNumbers != null) {
      _playlistVerseNumbers = playlistVerseNumbers;
    }
    notifyListeners();
    _persist();
  }

  /// Ends the shared "now playing" session — the mini player disappears,
  /// and the persisted last-played entry is cleared (an explicit close
  /// shouldn't come back on the next app launch). Does not touch [player]
  /// itself; callers stop/pause it first.
  void clear() {
    if (surah == null) return;
    surah = null;
    reciter = null;
    verseNumber = null;
    _playlistVerseNumbers = null;
    notifyListeners();
    _clearPersisted();
  }

  /// Starts (or resumes) playback for the current session — used by the
  /// mini player's play button. If [player] already has a source loaded
  /// (the normal in-app pause/resume case), this just resumes it in place.
  /// If nothing is loaded yet (a session [restoreLastPlayed] brought back
  /// from disk at app launch, before any SurahScreen has been opened this
  /// run), this fetches that surah's verses and builds a fresh playlist
  /// seeked to the saved ayah first.
  Future<void> resume({required String locale}) async {
    final targetSurah = surah;
    if (targetSurah == null || player.playing) return;
    if (player.audioSource != null) {
      await player.play();
      return;
    }
    final targetReciter = reciter ?? reciters.first;
    final targetVerse = verseNumber ?? 1;
    final verses = await fetchVerses(targetSurah.number, locale: locale);
    if (verses.isEmpty) return;
    final artworkUri = await getArtworkUri();
    final index = verses.indexWhere((v) => v.number == targetVerse);
    final playlist = [
      for (final v in verses)
        AudioSource.uri(
          Uri.parse(targetReciter.audioUrl(targetSurah.number, v.number)),
          tag: MediaItem(
            id: targetReciter.audioUrl(targetSurah.number, v.number),
            title: '${targetSurah.englishName} • Ayah ${v.number}',
            artist: targetReciter.name,
            album: targetSurah.englishName,
            artUri: artworkUri,
          ),
        ),
    ];
    reciter = targetReciter;
    _playlistVerseNumbers = verses.map((v) => v.number).toList();
    await player.setAudioSources(
      playlist,
      initialIndex: index < 0 ? 0 : index,
      preload: false,
    );
    await player.play();
  }

  /// MediaItem.artUri needs a real file:// URI — Flutter asset paths aren't
  /// directly usable — so this copies the bundled mosque hero image to a
  /// real file on first use and reuses it after that. Shared by SurahScreen
  /// and [resume] so both use identical lock-screen artwork.
  Future<Uri> getArtworkUri() async {
    final cached = _artworkUriCache;
    if (cached != null) return cached;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/quran_audio_artwork.jpg');
    if (!await file.exists()) {
      final data =
          await rootBundle.load('assets/images/mosques/mosque_1.jpg');
      await file.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        flush: true,
      );
    }
    final uri = Uri.file(file.path);
    _artworkUriCache = uri;
    return uri;
  }

  Future<void> _persist() async {
    final s = surah;
    final r = reciter;
    final v = verseNumber;
    if (s == null || r == null || v == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _prefsKey,
      jsonEncode({'surah': s.toJson(), 'reciterId': r.id, 'verseNumber': v}),
    );
  }

  Future<void> _clearPersisted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }

  /// Loads the last-played surah/ayah/reciter from disk (if any) so the
  /// mini player can show it — paused, nothing actually loaded into
  /// [player] yet — from the moment the app launches, before any
  /// SurahScreen has been opened this session. Call once, early at startup
  /// (see main.dart). No-ops if nothing was ever saved, or the saved entry
  /// is malformed (e.g. from an old app version's different format).
  Future<void> restoreLastPlayed() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == null) return;
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      final restoredSurah =
          Surah.fromJson(json['surah'] as Map<String, dynamic>);
      final restoredVerse = json['verseNumber'] as int?;
      if (restoredVerse == null) return;
      final reciterId = json['reciterId'] as String?;
      final restoredReciter = reciters.firstWhere(
        (r) => r.id == reciterId,
        orElse: () => reciters.first,
      );
      surah = restoredSurah;
      reciter = restoredReciter;
      verseNumber = restoredVerse;
      notifyListeners();
    } catch (_) {
      // Corrupt/old-format entry — nothing to restore.
    }
  }
}
