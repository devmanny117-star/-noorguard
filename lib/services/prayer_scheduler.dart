import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/prayer_model.dart';
import 'live_notification_service.dart';
import 'notification_service.dart';
import 'prayer_state.dart';

/// Everything that should follow a fresh prayer-times fetch — the
/// 15-minutes-early reminders, the native full-screen alarms (the 7-day
/// Android window), and the keep-alive/live notification — extracted from
/// the regular home screen so the Beginner Mode home screen arms
/// notifications through the identical path.
class PrayerScheduler {
  PrayerScheduler._();

  /// Safe to call on every (re)load: each schedule starts by cancelling the
  /// previous one, so it replaces rather than piles up.
  static void scheduleFromPrayers(BuildContext context, List<Prayer> prayers) {
    final today = DateTime.now();
    final data = prayers.map<Map<String, dynamic>>((p) {
      return {'name': p.name, 'time': _parseTimeString(p.time, today)};
    }).toList();
    // Share the exact times we scheduled so the foreground adhan controller
    // fires in sync with these notifications (these use the device location).
    PrayerState().setScheduledPrayerTimes(data);

    // Respect the user's notification preference on every load — without
    // this check, simply reopening the app (which re-runs this on every
    // cold start of either home screen) would silently re-schedule every
    // prayer notification and full-screen alarm even with the bell off.
    if (!PrayerState().masterNotifications) {
      debugPrint('PrayerScheduler: masterNotifications is OFF, skipping schedule');
      return;
    }
    debugPrint('PrayerScheduler: masterNotifications is ON, scheduling ${data.length} prayer alarms');

    final adhanId = PrayerState().selectedAdhanId;
    NotificationService().schedulePrayerNotifications(
      data,
      adhanId: adhanId,
    );
    NotificationService().scheduleFullScreenPrayerAlarms(
      data,
      adhanId: adhanId,
    );
    _startKeepAliveServiceIfNeeded(context, data);
  }

  /// Keeps the app classified as foreground so prayer alarms and
  /// notifications keep being delivered reliably in the background — only
  /// while the user has prayer notifications turned on at all. The service's
  /// persistent notification doubles as the "Noor Guard Live" lock-screen
  /// notification, so its localized payload (next-prayer countdown + rotating
  /// daily content) is refreshed first.
  static Future<void> _startKeepAliveServiceIfNeeded(
      BuildContext context, List<Map<String, dynamic>> data) async {
    if (!PrayerState().masterNotifications) return;
    if (!context.mounted) return;
    await LiveNotificationService.push(context: context, prayers: data);
    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await NotificationService().startKeepAliveService(
      title: l10n.appName,
      text: l10n.keepAliveNotificationText,
      channelName: l10n.liveNotifChannelName,
      channelDescription: l10n.liveNotifChannelDescription,
    );
  }

  static DateTime _parseTimeString(String timeStr, DateTime date) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final isPm = parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}
