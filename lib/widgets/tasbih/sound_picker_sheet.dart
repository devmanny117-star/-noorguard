import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../models/tasbih_sound.dart';
import '../../services/tasbih_service.dart';

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _cream = Color(0xFFF5EFE6);

Future<void> showSoundPickerSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _SoundPickerSheet(),
  );
}

String _soundLabel(AppLocalizations l10n, String id) {
  switch (id) {
    case 'classic_click':
      return l10n.tasbihSoundClassicClick;
    case 'soft_chime':
      return l10n.tasbihSoundSoftChime;
    case 'stone_tap':
      return l10n.tasbihSoundStoneTap;
    case 'rain_drop':
      return l10n.tasbihSoundRainDrop;
    case 'soft_feather':
      return l10n.tasbihSoundSoftFeather;
    default:
      return id;
  }
}

class _SoundPickerSheet extends StatefulWidget {
  const _SoundPickerSheet();

  @override
  State<_SoundPickerSheet> createState() => _SoundPickerSheetState();
}

class _SoundPickerSheetState extends State<_SoundPickerSheet> {
  late final AudioPlayer _previewPlayer =
      AudioPlayer(playerId: 'tasbih_preview');
  String? _playingId;

  @override
  void initState() {
    super.initState();
    _previewPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _playingId = null);
    });
  }

  @override
  void dispose() {
    _previewPlayer.stop();
    _previewPlayer.dispose();
    super.dispose();
  }

  Future<void> _preview(String id) async {
    try {
      await _previewPlayer.stop();
      await _previewPlayer.setAudioContext(tasbihAudioContext());
      setState(() => _playingId = id);
      await _previewPlayer.play(
        AssetSource(tasbihSoundAssetFor(id)),
        volume: 0.7,
      );
    } catch (_) {
      if (mounted) setState(() => _playingId = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListenableBuilder(
      listenable: TasbihService(),
      builder: (context, _) {
        final selected = TasbihService().selectedSoundId;
        return Container(
          decoration: const BoxDecoration(
            color: _navy,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.tasbihSoundPickerTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _cream,
                  ),
                ),
                const SizedBox(height: 8),
                ...tasbihSoundOptions.map((opt) {
                  final isSelected = opt.id == selected;
                  final isPlaying = _playingId == opt.id;
                  return InkWell(
                    onTap: () => TasbihService().setSelectedSound(opt.id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isPlaying
                                  ? Icons.pause_circle_filled_rounded
                                  : Icons.play_circle_fill_rounded,
                              color: _gold,
                              size: 28,
                            ),
                            onPressed: () => _preview(opt.id),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              _soundLabel(l10n, opt.id),
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                color: isSelected ? _gold : _cream,
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(Icons.check_rounded,
                                size: 18, color: _gold),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
