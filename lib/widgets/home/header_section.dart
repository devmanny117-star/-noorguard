import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/prayer_state.dart';
import '../../theme/app_theme.dart';
import '../../theme/theme_controller.dart';
import '../../l10n/app_localizations.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback onOpenSettings;

  const HeaderSection({super.key, required this.onOpenSettings});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = context.isDark;
    final controller = ThemeScope.of(context);
    final l10n = AppLocalizations.of(context)!;
    final prayerState = context.watch<PrayerState>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 18, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.assalamualaikum,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: colors.primaryText,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.mayAllahBlessYourDay,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: colors.secondaryText,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              // Dark/light mode toggle
              _CircleButton(
                onTap: () => controller.toggle(isDark),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: Tween(begin: 0.75, end: 1.0).animate(anim),
                    child: FadeTransition(opacity: anim, child: child),
                  ),
                  child: Icon(
                    isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round,
                    key: ValueKey(isDark),
                    size: 20,
                    color: isDark ? AppColors.gold : colors.primaryText,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _CircleButton(
                onTap: () => _toggleNotifications(context, l10n, prayerState),
                child: Icon(
                  prayerState.masterNotifications
                      ? Icons.notifications
                      : Icons.notifications_off,
                  color: colors.primaryText,
                  size: 21,
                ),
              ),
              const SizedBox(width: 8),
              _CircleButton(
                onTap: onOpenSettings,
                child: Icon(
                  Icons.settings_outlined,
                  color: colors.primaryText,
                  size: 21,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleNotifications(
    BuildContext context,
    AppLocalizations l10n,
    PrayerState prayerState,
  ) {
    final enabled = !prayerState.masterNotifications;
    prayerState.toggleMasterNotifications(enabled);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            enabled ? Icons.notifications : Icons.notifications_off,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            enabled ? l10n.notificationsOn : l10n.notificationsOff,
            style: GoogleFonts.lato(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF2C2C2A),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ));
  }
}

class _CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _CircleButton({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: colors.cardBg,
          shape: BoxShape.circle,
          border: Border.all(
            color: colors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
