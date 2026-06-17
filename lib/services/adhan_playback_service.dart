import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import '../models/adhan_model.dart';

/// Plays the full-length adhan through the in-app audio player.
///
/// Used for the foreground case: when the app is open and a prayer reminder
/// fires, we play the user's selected adhan in full here (instead of the short
/// bundled notification clip) so they hear the complete call to prayer. The
/// bundled ~25s clip remains the sound for the closed-app notification.
class AdhanPlaybackService {
  static final AdhanPlaybackService _instance =
      AdhanPlaybackService._internal();
  factory AdhanPlaybackService() => _instance;

  final AudioPlayer _player = AudioPlayer();

  /// Called with `true` when playback starts, `false` when it stops (either
  /// manually or at track end). Set by [AdhanForegroundController] to keep
  /// native code in sync so volume-key and dismiss handlers know when to act.
  void Function(bool isPlaying)? onPlayStateChanged;

  AdhanPlaybackService._internal() {
    // Notify when the track finishes naturally so native stops listening.
    _player.onPlayerComplete.listen((_) {
      onPlayStateChanged?.call(false);
    });
  }

  /// Plays the full adhan for [adhanId] from the start, replacing anything
  /// already playing. Streams from the style's remote URL; failures (e.g. no
  /// network) are swallowed so the silent banner still shows on its own.
  Future<void> playForAdhan(String adhanId) async {
    if (kIsWeb) return;
    final style = adhanStyles.firstWhere(
      (s) => s.id == adhanId,
      orElse: () => adhanStyles.first,
    );
    try {
      await _player.stop();
      await _player.play(UrlSource(style.audioUrl));
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
