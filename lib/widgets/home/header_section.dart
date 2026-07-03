import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/live_notification_service.dart';
import '../../services/notification_service.dart';
import '../../services/prayer_state.dart';
import '../../theme/app_theme.dart';
import '../../theme/theme_controller.dart';
import '../../l10n/app_localizations.dart';
import '../crescent_star_painter.dart';

// Matches the "low accuracy / alert" red used elsewhere in the app (e.g. the
// Qibla screen's accuracy badge) so the disabled-bell state reads as a clear
// warning rather than introducing a new one-off red.
const _kNotificationsOffRed = Color(0xFFEF5350);

class HeaderSection extends StatelessWidget {
  final VoidCallback onShare;
  final String userName;
  final bool isBeginnerMode;
  final VoidCallback? onModeToggle;

  const HeaderSection({
    super.key,
    required this.onShare,
    this.userName = '',
    this.isBeginnerMode = false,
    this.onModeToggle,
  });

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
                  userName.isNotEmpty
                      ? l10n.greetingWithName(userName)
                      : l10n.assalamualaikum,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: userName.isNotEmpty ? 26 : 32,
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
              if (onModeToggle != null) ...[
                _CircleButton(
                  onTap: onModeToggle!,
                  child: isBeginnerMode
                      ? const Icon(Icons.person_rounded,
                          size: 20, color: AppColors.gold)
                      : const SizedBox(
                          width: 24,
                          height: 24,
                          child: CustomPaint(painter: CrescentStarPainter()),
                        ),
                ),
                const SizedBox(width: 8),
              ],
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
                  color: prayerState.masterNotifications
                      ? AppColors.gold
                      : _kNotificationsOffRed,
                  size: 21,
                ),
              ),
              const SizedBox(width: 8),
              _CircleButton(
                onTap: onShare,
                child: const Icon(
                  Icons.share_rounded,
                  color: Color(0xFFC9A84C),
                  size: 21,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _toggleNotifications(
    BuildContext context,
    AppLocalizations l10n,
    PrayerState prayerState,
  ) async {
    final enabled = !prayerState.masterNotifications;
    // The icon/color flip instantly — toggleMasterNotifications calls
    // notifyListeners() synchronously before doing any async cancel/schedule
    // work, so context.watch<PrayerState>() in build() already rebuilt by
    // the time this await resolves. Only the snackbar waits on verification.
    final verified = await prayerState.toggleMasterNotifications(enabled);
    if (!context.mounted) return;

    // Mirrors settings_screen.dart's _onMasterNotificationsChanged — without
    // this, toggling the bell here left the "Prayer notifications active"
    // foreground service running (or stopped) regardless of the new state,
    // since only the Settings screen's switch used to do this.
    if (enabled) {
      // Refresh the live notification payload first when today's prayer
      // times are already known, so the service comes back with a current
      // countdown instead of the last session's.
      final scheduled = PrayerState().scheduledPrayerTimes;
      if (scheduled != null && context.mounted) {
        await LiveNotificationService.push(context: context, prayers: scheduled);
      }
      if (!context.mounted) return;
      await NotificationService().startKeepAliveService(
        title: l10n.appName,
        text: l10n.keepAliveNotificationText,
        channelName: l10n.liveNotifChannelName,
        channelDescription: l10n.liveNotifChannelDescription,
      );
    } else {
      await NotificationService().stopKeepAliveService();
    }
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            verified
                ? (enabled ? Icons.notifications : Icons.notifications_off)
                : Icons.error_outline_rounded,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            verified
                ? (enabled ? l10n.notificationsOn : l10n.notificationsOff)
                : l10n.notificationsToggleUnconfirmed,
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
              color: Colors.black.withValues(alpha: 0.04),
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
