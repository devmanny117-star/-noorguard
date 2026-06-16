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
  AdhanPlaybackService._internal();

  final AudioPlayer _player = AudioPlayer();

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
    } catch (e) {
      debugPrint('AdhanPlaybackService: failed to play $adhanId: $e');
    }
  }

  Future<void> stop() async {
    if (kIsWeb) return;
    try {
      await _player.stop();
    } catch (_) {}
  }
}
