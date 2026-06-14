import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _channelId = 'prayer_reminders';
  static const _channelName = 'Prayer Reminders';
  static const _channelDescription =
      'Notifications 15 minutes before each prayer';

  static const Map<String, _PrayerMessage> _prayerMessages = {
    'Fajr': _PrayerMessage(
      title: '🕌 Time for Fajr',
      body: 'Rise and pray. Allah rewards those who wake for Him.',
    ),
    'Dhuhr': _PrayerMessage(
      title: '☀️ Time for Dhuhr',
      body: 'Take a moment for Allah. Your Dhuhr prayer awaits.',
    ),
    'Asr': _PrayerMessage(
      title: '🌤️ Time for Asr',
      body: 'The middle prayer. Guard it closely. — Al-Baqarah 2:238',
    ),
    'Maghrib': _PrayerMessage(
      title: '🌅 Time for Maghrib',
      body: 'The sun has set. Answer the call of Allah.',
    ),
    'Isha': _PrayerMessage(
      title: '🌙 Time for Isha',
      body: 'End your day with Allah. Your night prayer awaits.',
    ),
  };

  _PrayerMessage _messageFor(String name) =>
      _prayerMessages[name] ??
      _PrayerMessage(
        title: '🕌 $name in 15 minutes',
        body: 'Time to prepare for $name prayer',
      );

  Future<void> init() async {
    if (kIsWeb) return;

    tz_data.initializeTimeZones();
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timezone.identifier));
    } catch (e) {
      debugPrint('NotificationService: could not resolve local timezone: $e');
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(settings: initSettings);

    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    // Create the channel up front so it shows up with the right importance
    // in system settings even before the first notification fires.
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
      ),
    );

    await androidPlugin?.requestNotificationsPermission();
    // Android 12+ requires this special-access permission for exact alarms;
    // prompts the system "Alarms & reminders" settings screen if not granted.
    await androidPlugin?.requestExactAlarmsPermission();
  }

  NotificationDetails get _notificationDetails => const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      );

  /// Falls back to inexact scheduling if exact-alarm permission isn't
  /// granted, so reminders still fire (within a short OS-controlled window)
  /// instead of throwing and silently dropping the schedule.
  Future<AndroidScheduleMode> _scheduleMode() async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final canScheduleExact =
        await androidPlugin?.canScheduleExactNotifications() ?? false;
    return canScheduleExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;
  }

  Future<void> schedulePrayerNotifications(
      List<Map<String, dynamic>> prayers) async {
    if (kIsWeb) return;

    final scheduleMode = await _scheduleMode();

    for (int i = 0; i < prayers.length; i++) {
      final name = prayers[i]['name'] as String;
      final time = prayers[i]['time'] as DateTime;
      final notifyAt = time.subtract(const Duration(minutes: 15));

      if (notifyAt.isBefore(DateTime.now())) continue;

      final message = _messageFor(name);

      try {
        await _plugin.zonedSchedule(
          id: i,
          title: message.title,
          body: message.body,
          scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
          notificationDetails: _notificationDetails,
          androidScheduleMode: scheduleMode,
        );
      } catch (e) {
        debugPrint('NotificationService: failed to schedule $name reminder: $e');
      }
    }
  }

  Future<void> cancelPrayerNotification(int id) async {
    if (kIsWeb) return;
    await _plugin.cancel(id: id);
  }

  Future<void> scheduleSinglePrayerNotification(
      int id, String name, DateTime time) async {
    if (kIsWeb) return;
    final notifyAt = time.subtract(const Duration(minutes: 15));
    if (notifyAt.isBefore(DateTime.now())) return;

    final message = _messageFor(name);

    try {
      await _plugin.zonedSchedule(
        id: id,
        title: message.title,
        body: message.body,
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: _notificationDetails,
        androidScheduleMode: await _scheduleMode(),
      );
    } catch (e) {
      debugPrint('NotificationService: failed to schedule $name reminder: $e');
    }
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }

  /// Schedules a one-off test notification 10 seconds from now, for
  /// verifying that notifications fire correctly on a real device.
  Future<void> scheduleTestNotification() async {
    if (kIsWeb) return;

    final notifyAt = DateTime.now().add(const Duration(seconds: 10));

    try {
      await _plugin.zonedSchedule(
        id: 999,
        title: '🔔 Test Notification',
        body: 'Notifications are working correctly!',
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: _notificationDetails,
        androidScheduleMode: await _scheduleMode(),
      );
    } catch (e) {
      debugPrint('NotificationService: failed to schedule test notification: $e');
    }
  }
}

class _PrayerMessage {
  final String title;
  final String body;

  const _PrayerMessage({required this.title, required this.body});
}
