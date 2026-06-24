import 'package:audioplayers/audioplayers.dart';

class TasbihSoundOption {
  final String id;
  final String assetPath;
  const TasbihSoundOption(this.id, this.assetPath);
}

const tasbihSoundOptions = [
  TasbihSoundOption('classic_click', 'sounds/tasbih_classic_click.wav'),
  TasbihSoundOption('soft_chime', 'sounds/tasbih_soft_chime.wav'),
  TasbihSoundOption('stone_tap', 'sounds/tasbih_stone_tap.wav'),
  TasbihSoundOption('rain_drop', 'sounds/tasbih_rain_drop.wav'),
  TasbihSoundOption('soft_feather', 'sounds/tasbih_soft_feather.wav'),
];

const _defaultSoundId = 'classic_click';

String tasbihSoundAssetFor(String id) => tasbihSoundOptions
    .firstWhere((s) => s.id == id, orElse: () => tasbihSoundOptions.first)
    .assetPath;

bool isValidTasbihSoundId(String id) =>
    tasbihSoundOptions.any((s) => s.id == id);

const tasbihDefaultSoundId = _defaultSoundId;

/// Routes tap sounds through the media stream (Android `STREAM_MUSIC`, via
/// usage=media/content=music) and an iOS session category that ignores the
/// silent/mute switch (`.playback`), so the tap sound is always audible
/// whenever the user has it enabled — regardless of ringer/silent state —
/// without taking audio focus away from Quran/Adhan playback elsewhere in
/// the app (`audioFocus: none`, `mixWithOthers`).
AudioContext tasbihAudioContext() => AudioContext(
      android: const AudioContextAndroid(
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.media,
        audioFocus: AndroidAudioFocus.none,
      ),
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.playback,
        options: const {AVAudioSessionOptions.mixWithOthers},
      ),
    );
