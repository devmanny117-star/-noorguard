import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import 'settings_shared.dart';

/// Settings sub-screen showing the full Noor Guard privacy promise — reached
/// by tapping the "Privacy & Trust" row on the main Settings screen.
class SettingsPrivacyScreen extends StatelessWidget {
  const SettingsPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const cardColors = settingsNavyCardColors;

    return SettingsSubScreenScaffold(
      title: l10n.privacyAndTrust,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColors.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.gold.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.shield_rounded,
                      size: 17,
                      color: AppColors.gold,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.privacyPromiseTitle,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  l10n.privacyPromiseBody,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: cardColors.primaryText,
                    height: 1.65,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  height: 0.8,
                  color: AppColors.gold.withValues(alpha: 0.25),
                ),
                const SizedBox(height: 14),
                Text(
                  l10n.noorGuardMotto,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 13.5,
                    fontStyle: FontStyle.italic,
                    color: AppColors.gold,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
