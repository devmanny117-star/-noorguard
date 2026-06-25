import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../services/notification_service.dart';
import '../services/prayer_state.dart';
import 'settings_shared.dart';

/// Settings sub-screen for the master notifications switch plus the five
/// individual per-prayer toggles — reached by tapping the "Prayer
/// Notifications" row on the main Settings screen.
class SettingsPrayerNotificationsScreen extends StatefulWidget {
  const SettingsPrayerNotificationsScreen({super.key});

  @override
  State<SettingsPrayerNotificationsScreen> createState() =>
      _SettingsPrayerNotificationsScreenState();
}

class _SettingsPrayerNotificationsScreenState
    extends State<SettingsPrayerNotificationsScreen> {
  /// Starts/stops the persistent foreground service alongside the master
  /// notifications toggle — no point keeping the app alive in the background
  /// for prayer alarms the user has turned off entirely.
  Future<void> _onMasterNotificationsChanged(
      PrayerState prayerState, bool value) async {
    await prayerState.toggleMasterNotifications(value);
    if (!mounted) return;
    if (value) {
      final l10n = AppLocalizations.of(context)!;
      await NotificationService().startKeepAliveService(
        title: l10n.appName,
        text: l10n.keepAliveNotificationText,
        channelName: l10n.keepAliveChannelName,
        channelDescription: l10n.keepAliveChannelDescription,
      );
    } else {
      await NotificationService().stopKeepAliveService();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final prayerState = context.watch<PrayerState>();

    return SettingsSubScreenScaffold(
      title: l10n.prayerNotifications,
      children: [
        SettingsCard(
          children: [
            SettingsToggleRow(
              label: l10n.enableAllNotifications,
              value: prayerState.masterNotifications,
              onChanged: (value) =>
                  _onMasterNotificationsChanged(prayerState, value),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionHeader(title: l10n.individualPrayers),
        SettingsCard(
          children: [
            SettingsPrayerRow(
              name: l10n.fajr,
              icon: Icons.wb_twilight_rounded,
              value: prayerState.notifications['fajr'] ?? true,
              enabled: prayerState.masterNotifications,
              onChanged: (v) =>
                  prayerState.togglePrayerNotification('fajr', v),
            ),
            const SettingsDivider(),
            SettingsPrayerRow(
              name: l10n.dhuhr,
              icon: Icons.wb_sunny_rounded,
              value: prayerState.notifications['dhuhr'] ?? true,
              enabled: prayerState.masterNotifications,
              onChanged: (v) =>
                  prayerState.togglePrayerNotification('dhuhr', v),
            ),
            const SettingsDivider(),
            SettingsPrayerRow(
              name: l10n.asr,
              icon: Icons.light_mode_outlined,
              value: prayerState.notifications['asr'] ?? true,
              enabled: prayerState.masterNotifications,
              onChanged: (v) =>
                  prayerState.togglePrayerNotification('asr', v),
            ),
            const SettingsDivider(),
            SettingsPrayerRow(
              name: l10n.maghrib,
              icon: Icons.nights_stay_rounded,
              value: prayerState.notifications['maghrib'] ?? true,
              enabled: prayerState.masterNotifications,
              onChanged: (v) =>
                  prayerState.togglePrayerNotification('maghrib', v),
            ),
            const SettingsDivider(),
            SettingsPrayerRow(
              name: l10n.isha,
              icon: Icons.nightlight_rounded,
              value: prayerState.notifications['isha'] ?? true,
              enabled: prayerState.masterNotifications,
              onChanged: (v) =>
                  prayerState.togglePrayerNotification('isha', v),
            ),
          ],
        ),
      ],
    );
  }
}
