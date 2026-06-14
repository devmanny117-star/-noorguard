import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    if (kIsWeb) return;

    tz_data.initializeTimeZones();

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

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> schedulePrayerNotifications(
      List<Map<String, dynamic>> prayers) async {
    if (kIsWeb) return;

    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'prayer_reminders',
        'Prayer Reminders',
        channelDescription: 'Notifications 15 minutes before each prayer',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    for (int i = 0; i < prayers.length; i++) {
      final name = prayers[i]['name'] as String;
      final time = prayers[i]['time'] as DateTime;
      final notifyAt = time.subtract(const Duration(minutes: 15));

      if (notifyAt.isBefore(DateTime.now())) continue;

      await _plugin.zonedSchedule(
        id: i,
        title: '🕌 $name in 15 minutes',
        body: 'Time to prepare for $name prayer',
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
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

    await _plugin.zonedSchedule(
      id: id,
      title: '🕌 $name in 15 minutes',
      body: 'Time to prepare for $name prayer',
      scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_reminders',
          'Prayer Reminders',
          channelDescription: 'Notifications 15 minutes before each prayer',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }
}
