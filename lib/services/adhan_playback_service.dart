import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/adhan_model.dart';

/// Plays the full-length adhan through the in-app audio player.
///
/// Used for the foreground case: when the app is open and a prayer reminder
/// fires, we play the user's selected adhan in full here (instead of the short
/// bundled notification clip) so they hear the complete call to prayer. The
/// bundled ~25s clip remains the sound for the closed-app notification.
///
/// The adhan styles are remote MP3s (not bundled with the app), so the first
/// fetch of a given style is downloaded once, cached to disk, and kept
/// decoded in memory — [preload] does this ahead of time (at app startup and
/// whenever the user switches styles) so [playForAdhan] can start instantly
/// from RAM instead of streaming over the network each time.
class AdhanPlaybackService {
  static final AdhanPlaybackService _instance =
      AdhanPlaybackService._internal();
  factory AdhanPlaybackService() => _instance;

  final AudioPlayer _player = AudioPlayer();

  /// Called with `true` when playback starts, `false` when it stops (either
  /// manually or at track end). Set by [AdhanForegroundController] to keep
  /// native code in sync so volume-key and dismiss handlers know when to act.
  void Function(bool isPlaying)? onPlayStateChanged;

  String? _preloadedId;
  Uint8List? _preloadedBytes;

  AdhanPlaybackService._internal() {
    // Notify when the track finishes naturally so native stops listening.
    _player.onPlayerComplete.listen((_) {
      onPlayStateChanged?.call(false);
    });
  }

  /// Downloads (or reads from local disk cache) [adhanId]'s audio and keeps
  /// the decoded bytes in memory so a later [playForAdhan] call for the same
  /// id plays instantly from RAM. Safe to call repeatedly — a no-op once
  /// that id is already the preloaded one.
  Future<void> preload(String adhanId) async {
    if (kIsWeb || _preloadedId == adhanId) return;
    try {
      final bytes = await _loadBytes(adhanId);
      _preloadedId = adhanId;
      _preloadedBytes = bytes;
    } catch (e) {
      debugPrint('AdhanPlaybackService: preload failed for $adhanId: $e');
    }
  }

  /// Preloads whichever adhan style is currently selected. Called once at
  /// app startup so the very first test/prayer playback is instant.
  Future<void> preloadSelected() async {
    if (kIsWeb) return;
    final prefs = await SharedPreferences.getInstance();
    await preload(prefs.getString('selected_adhan') ?? 'makkah');
  }

  AdhanStyle _styleFor(String adhanId) => adhanStyles.firstWhere(
        (s) => s.id == adhanId,
        orElse: () => adhanStyles.first,
      );

  Future<Uint8List> _loadBytes(String adhanId) async {
    final style = _styleFor(adhanId);
    final cacheFile = await _cacheFileFor(style.id);
    if (await cacheFile.exists()) {
      return cacheFile.readAsBytes();
    }
    final response = await http.get(Uri.parse(style.audioUrl));
    if (response.statusCode != 200) {
      throw HttpException(
          'HTTP ${response.statusCode} fetching adhan audio for ${style.id}');
    }
    final bytes = response.bodyBytes;
    try {
      await cacheFile.writeAsBytes(bytes, flush: true);
    } catch (_) {
      // Disk cache is a nice-to-have for future launches — the bytes already
      // in hand are still good for the play that triggered this load.
    }
    return bytes;
  }

  Future<File> _cacheFileFor(String adhanId) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/adhan_cache_$adhanId.mp3');
  }

  /// Plays the full adhan for [adhanId] from the start, replacing anything
  /// already playing. Plays instantly from the in-memory preload when
  /// available; otherwise falls back to streaming the style's remote URL so
  /// playback still works the first time (e.g. preload hasn't finished yet
  /// or failed because the device was offline at startup).
  ///
  /// Checks the master Prayer Notifications toggle directly (same
  /// `notif_master` key [PrayerState] writes) as a last line of defense —
  /// this is the actual sound reaching the user, so it must never play
  /// regardless of how a caller got here.
  Future<void> playForAdhan(String adhanId) async {
    if (kIsWeb) return;
    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool('notif_master') ?? true)) return;
    try {
      await _player.stop();
      if (_preloadedId != adhanId) {
        await preload(adhanId);
      }
      Source source;
      if (_preloadedId == adhanId && _preloadedBytes != null) {
        if (Platform.isIOS) {
          // BytesSource is not supported by audioplayers on iOS — it throws
          // and the adhan plays silently. Play the disk-cached file that
          // preload already wrote instead.
          final cacheFile = await _cacheFileFor(adhanId);
          source = await cacheFile.exists()
              ? DeviceFileSource(cacheFile.path)
              : UrlSource(_styleFor(adhanId).audioUrl);
        } else {
          source = BytesSource(_preloadedBytes!);
        }
      } else {
        source = UrlSource(_styleFor(adhanId).audioUrl);
      }
      await _player.play(source);
      onPlayStateChanged?.call(true);
    } catch (e) {
      debugPrint('AdhanPlaybackService: failed to play $adhanId: $e');
    }
  }

  Future<void> stop() async {
    if (kIsWeb) return;
    try {
      await _player.stop();
      onPlayStateChanged?.call(false);
    } catch (_) {}
  }
}
