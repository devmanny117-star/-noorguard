import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../models/adhan_model.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  // An Android notification channel's sound is locked in when the channel is
  // created and can never be changed afterwards. To let each adhan style have
  // its own sound we therefore give every style its own channel
  // (`prayer_reminders_adhan_<id>`) and create it lazily before scheduling.
  static const _channelName = 'Prayer Reminders';
  static const _channelDescription =
      'Notifications 15 minutes before each prayer';

  // Legacy single-sound channel from before per-adhan channels existed.
  static const _legacyChannelId = 'prayer_reminders';

  // Soundless channel for the foreground banner. When the app is open the
  // full adhan is played by the in-app audio player, so the accompanying
  // banner must stay silent to avoid two adhans overlapping.
  static const _silentChannelId = 'prayer_reminders_silent';

  String _channelIdFor(String soundResource) => 'prayer_reminders_$soundResource';

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
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      defaultPresentBanner: true,
      defaultPresentList: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
    );

    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    // Drop the old single-sound channel so users don't see a stale, silent
    // "Prayer Reminders" entry alongside the new per-adhan channels.
    await androidPlugin?.deleteNotificationChannel(channelId: _legacyChannelId);

    // Soundless channel used for the foreground banner.
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _silentChannelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
        playSound: false,
      ),
    );

    await androidPlugin?.requestNotificationsPermission();
    // Android 12+ requires this special-access permission for exact alarms;
    // prompts the system "Alarms & reminders" settings screen if not granted.
    await androidPlugin?.requestExactAlarmsPermission();
  }

  /// Creates (idempotently) the Android channel whose sound is the bundled
  /// adhan clip for [soundResource] (e.g. `adhan_makkah`). Safe to call every
  /// time we schedule; re-creating an existing channel is a no-op.
  Future<void> _ensureAndroidChannel(String soundResource) async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(
      AndroidNotificationChannel(
        _channelIdFor(soundResource),
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound(soundResource),
        audioAttributesUsage: AudioAttributesUsage.notificationEvent,
      ),
    );
  }

  /// Notification details that play the bundled adhan clip for [adhanId] on
  /// both platforms. Android uses a per-adhan channel + raw resource; iOS uses
  /// the bundled `.caf` of the same base name.
  NotificationDetails _detailsFor(String adhanId) {
    final soundResource = adhanSoundResource(adhanId);
    return NotificationDetails(
      android: AndroidNotificationDetails(
        _channelIdFor(soundResource),
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound(soundResource),
        audioAttributesUsage: AudioAttributesUsage.notificationEvent,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
        presentList: true,
        sound: '$soundResource.caf',
      ),
    );
  }

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
      List<Map<String, dynamic>> prayers,
      {required String adhanId}) async {
    if (kIsWeb) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final details = _detailsFor(adhanId);
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
          notificationDetails: details,
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
      int id, String name, DateTime time,
      {required String adhanId}) async {
    if (kIsWeb) return;
    final notifyAt = time.subtract(const Duration(minutes: 15));
    if (notifyAt.isBefore(DateTime.now())) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final message = _messageFor(name);

    try {
      await _plugin.zonedSchedule(
        id: id,
        title: message.title,
        body: message.body,
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: _detailsFor(adhanId),
        androidScheduleMode: await _scheduleMode(),
      );
    } catch (e) {
      debugPrint('NotificationService: failed to schedule $name reminder: $e');
    }
  }

  /// Shows an immediate, **soundless** prayer banner. Used in the foreground
  /// when the in-app audio player is handling the adhan, so the user sees the
  /// reminder without a second adhan playing from the notification.
  ///
  /// Re-uses the prayer's notification [id] (0–4); the iOS AppDelegate presents
  /// these identifiers without sound when the app is in the foreground.
  ///
  /// On Android the banner is posted natively so we can attach a deleteIntent
  /// (swipe-dismiss → stop adhan) and contentIntent (tap → stop adhan).
  /// On iOS the PRAYER_ADHAN category is attached so that a swipe-dismiss
  /// fires the AppDelegate's didReceive handler (→ stop adhan).
  Future<void> showSilentPrayerBanner(int id, String name) async {
    if (kIsWeb) return;
    final message = _messageFor(name);

    if (!kIsWeb && Platform.isAndroid) {
      // Native Android notification: both contentIntent and deleteIntent point
      // to AdhanStopReceiver so tap and swipe-dismiss both stop the adhan.
      try {
        await const MethodChannel('adhan_control').invokeMethod(
          'showSilentBanner',
          {'id': id, 'title': message.title, 'body': message.body},
        );
      } catch (e) {
        debugPrint('NotificationService: failed to show $name native banner: $e');
      }
      return;
    }

    // iOS: flutter_local_notifications with the PRAYER_ADHAN category so that
    // the AppDelegate's didReceive fires for both tap and swipe-dismiss.
    try {
      await _plugin.show(
        id: id,
        title: message.title,
        body: message.body,
        notificationDetails: const NotificationDetails(
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: false,
            presentBanner: true,
            presentList: true,
            categoryIdentifier: 'PRAYER_ADHAN',
          ),
        ),
      );
    } catch (e) {
      debugPrint('NotificationService: failed to show $name banner: $e');
    }
  }

  /// Set by [AdhanForegroundController] to stop playback when the user taps a
  /// prayer notification banner. Avoids a circular import while keeping the
  /// tap path entirely in Dart (no MethodChannel timing dependency).
  static void Function()? onPrayerBannerTapped;

  static void _onNotificationResponse(NotificationResponse response) {
    // Prayer notification IDs are 0–4 (Fajr → Isha). Tapping any of them
    // while the adhan is playing should stop it.
    final id = response.id;
    if (id != null && id >= 0 && id <= 4) {
      onPrayerBannerTapped?.call();
    }
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }

  /// Schedules a one-off test notification 10 seconds from now, for
  /// verifying that notifications (and the selected adhan sound) fire
  /// correctly on a real device.
  Future<void> scheduleTestNotification({required String adhanId}) async {
    if (kIsWeb) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final notifyAt = DateTime.now().add(const Duration(seconds: 10));

    try {
      await _plugin.zonedSchedule(
        id: 999,
        title: '🔔 Test Notification',
        body: 'Notifications are working correctly!',
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: _detailsFor(adhanId),
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
