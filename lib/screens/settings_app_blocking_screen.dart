import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import 'settings_shared.dart';

/// Settings sub-screen for the "block during prayer times" switch plus the
/// block-duration preset — reached by tapping the "App Blocking" row on the
/// main Settings screen.
class SettingsAppBlockingScreen extends StatefulWidget {
  final bool blockDuringPrayer;
  final String blockDuration;
  final ValueChanged<bool> onBlockDuringPrayerChanged;
  final ValueChanged<String> onBlockDurationChanged;

  const SettingsAppBlockingScreen({
    super.key,
    required this.blockDuringPrayer,
    required this.blockDuration,
    required this.onBlockDuringPrayerChanged,
    required this.onBlockDurationChanged,
  });

  @override
  State<SettingsAppBlockingScreen> createState() =>
      _SettingsAppBlockingScreenState();
}

class _SettingsAppBlockingScreenState
    extends State<SettingsAppBlockingScreen> {
  late bool _blockDuringPrayer;
  late String _blockDuration;

  @override
  void initState() {
    super.initState();
    _blockDuringPrayer = widget.blockDuringPrayer;
    _blockDuration = widget.blockDuration;
  }

  /// (stable key, localized label) pairs — the key is what `_blockDuration`
  /// tracks so the selected pill survives a language switch.
  static List<(String, String)> _durations(AppLocalizations l10n) => [
        ('30min', l10n.duration30Min),
        ('1hour', l10n.duration1Hour),
        ('prayerWindow', l10n.durationPrayerWindowOnly),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const cardColors = settingsNavyCardColors;
    final durations = _durations(l10n);

    return SettingsSubScreenScaffold(
      title: l10n.appBlocking,
      children: [
        SettingsCard(
          children: [
            SettingsToggleRow(
              label: l10n.blockDuringPrayerTimes,
              leadingIcon: Icons.security_rounded,
              value: _blockDuringPrayer,
              onChanged: (v) {
                setState(() => _blockDuringPrayer = v);
                widget.onBlockDuringPrayerChanged(v);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.blockDurationLabel,
                style: GoogleFonts.lato(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: cardColors.secondaryText,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: List.generate(durations.length, (i) {
                  final (key, label) = durations[i];
                  final selected = _blockDuration == key;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: i < durations.length - 1 ? 8 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _blockDuration = key);
                          widget.onBlockDurationChanged(key);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          height: 44,
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.gold.withValues(alpha: 0.12)
                                : cardColors.cardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected
                                  ? AppColors.gold
                                  : cardColors.border,
                              width: selected ? 1.5 : 1.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              label,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: selected
                                    ? AppColors.gold
                                    : cardColors.secondaryText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
