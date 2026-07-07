import 'dart:io';
import 'dart:ui' show Locale;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../l10n/app_localizations.dart';
import '../models/adhan_model.dart';
import '../models/prayer_model.dart' show todaysPrayers;

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

  /// Localizations resolved from the user's in-app language (SharedPreferences
  /// `app_locale`, the same key main.dart reads), NOT the device language —
  /// these methods run without a BuildContext (e.g. from PrayerState), so
  /// they can't use AppLocalizations.of. Note: scheduled notification text is
  /// baked in at scheduling time; after a language change it updates on the
  /// next reschedule (every app open re-schedules from the home screen).
  Future<AppLocalizations> _l10n() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('app_locale') ?? 'en';
    try {
      return lookupAppLocalizations(Locale(code));
    } catch (_) {
      return lookupAppLocalizations(const Locale('en'));
    }
  }

  _PrayerMessage _messageFor(AppLocalizations l10n, String name) {
    return switch (name) {
      'Fajr' => _PrayerMessage(
          title: l10n.prayerReminderTitleFajr,
          body: l10n.prayerReminderBodyFajr,
        ),
      'Dhuhr' => _PrayerMessage(
          title: l10n.prayerReminderTitleDhuhr,
          body: l10n.prayerReminderBodyDhuhr,
        ),
      'Asr' => _PrayerMessage(
          title: l10n.prayerReminderTitleAsr,
          body: l10n.prayerReminderBodyAsr,
        ),
      'Maghrib' => _PrayerMessage(
          title: l10n.prayerReminderTitleMaghrib,
          body: l10n.prayerReminderBodyMaghrib,
        ),
      'Isha' => _PrayerMessage(
          title: l10n.prayerReminderTitleIsha,
          body: l10n.prayerReminderBodyIsha,
        ),
      _ => _PrayerMessage(
          title: l10n.prayerReminderTitleGeneric(name),
          body: l10n.prayerReminderBodyGeneric(name),
        ),
    };
  }

  String _alarmMessageFor(AppLocalizations l10n, String name) {
    return switch (name) {
      'Fajr' => l10n.prayerAlarmMessageFajr,
      'Dhuhr' => l10n.prayerAlarmMessageDhuhr,
      'Asr' => l10n.prayerAlarmMessageAsr,
      'Maghrib' => l10n.prayerAlarmMessageMaghrib,
      'Isha' => l10n.prayerAlarmMessageIsha,
      _ => l10n.prayerAlarmMessageGeneric(name),
    };
  }

  static const _alarmChannel = MethodChannel('adhan_control');

  /// Reads the persisted master Prayer Notifications toggle directly from
  /// SharedPreferences — the same `notif_master` key [PrayerState] writes —
  /// rather than depending on [PrayerState] itself (which would create a
  /// circular import, since it already imports this service). Every method
  /// below that can actually deliver a notification, alarm, or sound to the
  /// user checks this first, so a missed guard at any call site can never
  /// let one through.
  Future<bool> _masterNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notif_master') ?? true;
  }

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

    // Delete every per-adhan "Prayer Reminders" channel so it gets recreated
    // at defaultImportance (see _ensureAndroidChannel). These channels were
    // previously created at Importance.high, which on Samsung One UI makes
    // them eligible for the "Pop-up notification" toggle — if a user enabled
    // that for this channel (easy to do by mistake alongside the real
    // full-screen alarm channel), the 15-minutes-early reminder would ALSO
    // take over the lock screen, looking like a second, plainer full-screen
    // alarm before the premium one at the actual prayer time. Importance and
    // sound can't be changed on an existing channel, so it must be deleted
    // and recreated; unlike the alarm channel, this one has no OEM toggle
    // worth preserving, so deleting it here is intentional and safe.
    for (final style in adhanStyles) {
      await androidPlugin?.deleteNotificationChannel(
        channelId: _channelIdFor(adhanSoundResource(style.id)),
      );
    }

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
    await androidPlugin?.requestExactAlarmsPermission();
  }

  Future<bool> get canUseFullScreenIntent async {
    if (kIsWeb || !Platform.isAndroid) return true;
    try {
      return await _alarmChannel.invokeMethod<bool>(
              'canUseFullScreenIntent') ??
          true;
    } catch (_) {
      return true;
    }
  }

  Future<bool> get canDrawOverlays async {
    if (kIsWeb || !Platform.isAndroid) return true;
    try {
      return await _alarmChannel.invokeMethod<bool>('canDrawOverlays') ??
          true;
    } catch (_) {
      return true;
    }
  }

  Future<void> openFullScreenIntentSettings() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('openFullScreenIntentSettings');
    } catch (_) {}
  }

  Future<void> openOverlaySettings() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('openOverlaySettings');
    } catch (_) {}
  }

  Future<bool> get areNotificationsEnabled async {
    if (kIsWeb || !Platform.isAndroid) return true;
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    return await androidPlugin?.areNotificationsEnabled() ?? true;
  }

  Future<bool> get canScheduleExactAlarms async {
    if (kIsWeb || !Platform.isAndroid) return true;
    try {
      return await _alarmChannel.invokeMethod<bool>('canScheduleExactAlarms') ??
          true;
    } catch (_) {
      return true;
    }
  }

  Future<void> requestNotificationsPermission() async {
    if (kIsWeb || !Platform.isAndroid) return;
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.requestNotificationsPermission();
  }

  Future<void> openExactAlarmSettings() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('openExactAlarmSettings');
    } catch (_) {}
  }

  Future<bool> get isSamsungDevice async {
    if (kIsWeb || !Platform.isAndroid) return false;
    try {
      return await _alarmChannel.invokeMethod<bool>('isSamsungDevice') ??
          false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> get isIgnoringBatteryOptimizations async {
    if (kIsWeb || !Platform.isAndroid) return true;
    try {
      return await _alarmChannel.invokeMethod<bool>(
              'isIgnoringBatteryOptimizations') ??
          true;
    } catch (_) {
      return true;
    }
  }

  /// Opens the system "ignore battery optimizations" dialog (falls back to
  /// this app's details page natively if that Intent isn't handled), so
  /// Noor Guard isn't slowed or delayed in the background.
  Future<void> openBatteryOptimizationSettings() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('openBatteryOptimizationSettings');
    } catch (_) {}
  }

  /// Opens Samsung's Device Care battery screen, where "Background usage
  /// limits -> Never sleeping apps" lives. No-op (well, a harmless fallback
  /// natively) on non-Samsung devices.
  Future<void> openSamsungBackgroundUsageSettings() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('openSamsungBackgroundUsageSettings');
    } catch (_) {}
  }

  /// Starts the persistent foreground service that keeps the app process
  /// classified as "foreground" so prayer alarms and notifications keep
  /// being delivered reliably in the background. Shows a minimal, silent,
  /// ongoing notification while active — required by Android for any
  /// foreground service. No-op on iOS, which has no equivalent background
  /// keep-alive concept.
  Future<void> startKeepAliveService({
    required String title,
    required String text,
    required String channelName,
    required String channelDescription,
  }) async {
    if (kIsWeb || !Platform.isAndroid) return;
    if (!await _masterNotificationsEnabled()) return;
    try {
      await _alarmChannel.invokeMethod('startKeepAliveService', {
        'title': title,
        'text': text,
        'channelName': channelName,
        'channelDescription': channelDescription,
      });
    } catch (_) {}
  }

  Future<void> stopKeepAliveService() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('stopKeepAliveService');
    } catch (_) {}
  }

  /// Creates (idempotently) the full-screen alarm channel for [adhanId] so a
  /// Settings deep link can land on a channel that already exists, even
  /// before the user's first prayer alarm has ever fired.
  Future<void> ensureAlarmChannel(String adhanId) async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _alarmChannel.invokeMethod('ensureAlarmChannel', {
        'adhanId': adhanSoundResource(adhanId).replaceFirst('adhan_', ''),
      });
    } catch (_) {}
  }

  /// Opens this app's notification settings page. On Samsung One UI this is
  /// where the "Pop-up notification" toggle lives (per channel). Pass
  /// [adhanId] to jump straight to the currently selected adhan's alarm
  /// channel instead of the app's general notification settings list.
  Future<void> openAppNotificationSettings({String? adhanId}) async {
    if (kIsWeb || !Platform.isAndroid) return;
    if (adhanId != null) await ensureAlarmChannel(adhanId);
    final channelId = adhanId != null
        ? 'prayer_alarm_${adhanSoundResource(adhanId).replaceFirst('adhan_', '')}'
        : null;
    try {
      await _alarmChannel.invokeMethod('openAppNotificationSettings', {
        'channelId': channelId,
      });
    } catch (_) {}
  }

  /// Creates (idempotently) the Android channel whose sound is the bundled
  /// adhan clip for [soundResource] (e.g. `adhan_makkah`). Safe to call every
  /// time we schedule; re-creating an existing channel is a no-op.
  ///
  /// Deliberately defaultImportance, not high: this is the 15-minutes-early
  /// reminder, not the at-time full-screen alarm (that's the separate native
  /// `prayer_alarm_<id>` channel). High importance made this channel eligible
  /// for Samsung's "Pop-up notification" toggle, which — if a user enabled it
  /// here too — full-screen-took-over the lock screen 15 minutes before the
  /// real premium alarm screen, looking like a duplicate. defaultImportance
  /// still plays the bundled adhan sound, just without a heads-up peek/pop-up.
  Future<void> _ensureAndroidChannel(String soundResource) async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(
      AndroidNotificationChannel(
        _channelIdFor(soundResource),
        _channelName,
        description: _channelDescription,
        importance: Importance.defaultImportance,
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
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
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

  /// Uses alarmClock when exact-alarm permission is granted: like
  /// setAlarmClock() on the native full-screen alarm, this is exempt from
  /// Doze AND Battery Saver, so the 15-minutes-early reminder still fires on
  /// time without the user needing to turn Battery Saver off. Falls back to
  /// inexact scheduling if exact-alarm permission isn't granted, so reminders
  /// still fire (within a short OS-controlled window) instead of throwing and
  /// silently dropping the schedule.
  Future<AndroidScheduleMode> _scheduleMode() async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final canScheduleExact =
        await androidPlugin?.canScheduleExactNotifications() ?? false;
    return canScheduleExact
        ? AndroidScheduleMode.alarmClock
        : AndroidScheduleMode.inexactAllowWhileIdle;
  }

  Future<void> schedulePrayerNotifications(
      List<Map<String, dynamic>> prayers,
      {required String adhanId}) async {
    if (kIsWeb) return;
    if (!await _masterNotificationsEnabled()) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final details = _detailsFor(adhanId);
    final scheduleMode = await _scheduleMode();
    final l10n = await _l10n();

    for (int i = 0; i < prayers.length; i++) {
      final name = prayers[i]['name'] as String;
      final time = prayers[i]['time'] as DateTime;
      final notifyAt = time.subtract(const Duration(minutes: 15));

      if (notifyAt.isBefore(DateTime.now())) continue;

      final message = _messageFor(l10n, name);

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
    if (!await _masterNotificationsEnabled()) return;
    final notifyAt = time.subtract(const Duration(minutes: 15));
    if (notifyAt.isBefore(DateTime.now())) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final message = _messageFor(await _l10n(), name);

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
    if (!await _masterNotificationsEnabled()) return;
    final message = _messageFor(await _l10n(), name);

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

  static const Map<String, String> _arabicPrayerNames = {
    'Fajr': 'الفجر',
    'Dhuhr': 'الظهر',
    'Asr': 'العصر',
    'Maghrib': 'المغرب',
    'Isha': 'العشاء',
  };

  static const Map<String, int> _alarmNotifIds = {
    'Fajr': 100,
    'Dhuhr': 101,
    'Asr': 102,
    'Maghrib': 103,
    'Isha': 104,
  };

  static String _formatPrayerTime(DateTime time) {
    final hour = time.hour > 12
        ? time.hour - 12
        : (time.hour == 0 ? 12 : time.hour);
    final amPm = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $amPm';
  }

  /// Parses a "h:mm AM/PM" time string (the [todaysPrayers] fallback format)
  /// into today's DateTime, for when there's no real scheduled-time data yet.
  static DateTime _parsePrayerTime(String timeStr) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final isPm = parts.length > 1 && parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  Future<void> scheduleFullScreenPrayerAlarms(
      List<Map<String, dynamic>> prayers,
      {required String adhanId}) async {
    if (kIsWeb || !Platform.isAndroid) return;
    if (!await _masterNotificationsEnabled()) return;

    try {
      await _alarmChannel.invokeMethod('cancelPrayerAlarms');
    } catch (_) {}

    // Sent with every alarm so the lock screen Activity can show all 5
    // prayers and compute "next prayer" itself, regardless of which one fired.
    final allPrayers = prayers.map((entry) {
      final time = entry['time'] as DateTime;
      return {
        'name': entry['name'] as String,
        'time': _formatPrayerTime(time),
        'epochMillis': time.millisecondsSinceEpoch,
      };
    }).toList();

    final l10n = await _l10n();
    for (final entry in prayers) {
      final name = entry['name'] as String;
      final time = entry['time'] as DateTime;
      if (time.isBefore(DateTime.now())) continue;

      final notifId = _alarmNotifIds[name];
      if (notifId == null) continue;

      try {
        await _alarmChannel.invokeMethod('schedulePrayerAlarm', {
          'prayerName': name,
          'arabicName': _arabicPrayerNames[name] ?? '',
          'prayerTime': _formatPrayerTime(time),
          'message': _alarmMessageFor(l10n, name),
          'adhanId': adhanSoundResource(adhanId).replaceFirst('adhan_', ''),
          'triggerAtMillis': time.millisecondsSinceEpoch,
          'notificationId': notifId,
          'allPrayers': allPrayers,
        });
      } catch (e) {
        debugPrint(
            'NotificationService: failed to schedule alarm for $name: $e');
      }
    }
  }

  Future<List<String>> getPendingPrayerMarks() async {
    if (kIsWeb || !Platform.isAndroid) return [];
    try {
      final result =
          await _alarmChannel.invokeMethod<List<dynamic>>('getPendingPrayerMarks');
      return result?.cast<String>() ?? [];
    } catch (e) {
      debugPrint('NotificationService: failed to get pending marks: $e');
      return [];
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

  /// Cancels every scheduled full-screen prayer alarm (ids 100–104) — the
  /// native AlarmManager alarms that fire at the exact prayer time. These
  /// live entirely outside flutter_local_notifications, so [cancelAll] alone
  /// (which only clears the 15-minutes-early reminders) never touches them.
  ///
  /// The native side retries each id once and re-verifies removal via
  /// PendingIntent lookup (AlarmManager.cancel() has no success return value).
  /// Returns true only if every id was confirmed clear; false on iOS/web is
  /// not meaningful since there's nothing to cancel there, so this returns
  /// true in that case (vacuously "clear").
  Future<bool> cancelFullScreenPrayerAlarms() async {
    if (kIsWeb || !Platform.isAndroid) return true;
    try {
      return await _alarmChannel.invokeMethod<bool>('cancelPrayerAlarms') ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Reports, for each of [ids] (default 100–104), whether a full-screen
  /// prayer alarm is currently pending in AlarmManager. Used to verify a
  /// schedule/cancel actually took effect, since apps can't run `dumpsys
  /// alarm` on themselves. Returns every id mapped to false on iOS/web.
  Future<Map<int, bool>> queryPendingPrayerAlarms([
    List<int> ids = const [100, 101, 102, 103, 104],
  ]) async {
    if (kIsWeb || !Platform.isAndroid) {
      return {for (final id in ids) id: false};
    }
    try {
      final result =
          await _alarmChannel.invokeMethod<Map<Object?, Object?>>(
        'queryPendingPrayerAlarms',
        ids,
      );
      if (result == null) return {for (final id in ids) id: false};
      return result.map(
        (key, value) => MapEntry(key as int, value as bool),
      );
    } catch (_) {
      return {for (final id in ids) id: false};
    }
  }

  /// Schedules a one-off test notification 10 seconds from now, for
  /// verifying that notifications (and the selected adhan sound) fire
  /// correctly on a real device. Respects the master toggle like every real
  /// prayer notification — a "test" should never fire when the user has
  /// notifications turned off.
  Future<void> scheduleTestNotification({required String adhanId}) async {
    if (kIsWeb) return;
    if (!await _masterNotificationsEnabled()) return;

    await _ensureAndroidChannel(adhanSoundResource(adhanId));
    final notifyAt = DateTime.now().add(const Duration(seconds: 10));
    final l10n = await _l10n();

    try {
      await _plugin.zonedSchedule(
        id: 999,
        title: l10n.testNotificationTitle,
        body: l10n.testNotificationBody,
        scheduledDate: tz.TZDateTime.from(notifyAt, tz.local),
        notificationDetails: _detailsFor(adhanId),
        androidScheduleMode: await _scheduleMode(),
      );
    } catch (e) {
      debugPrint('NotificationService: failed to schedule test notification: $e');
    }
  }

  /// Schedules a one-off **full-screen lock alarm** 10 seconds from now,
  /// through the same native AlarmManager -> PrayerAlarmReceiver path real
  /// prayer alarms use, so the lock screen Activity can be verified on a
  /// real device without waiting for an actual prayer time. Uses [prayers]
  /// (today's real schedule) for the firing prayer's name/time/message and
  /// the pills row — whichever prayer is next, or today's last prayer if all
  /// 5 have already passed — so the test alarm looks exactly like a real one,
  /// with no placeholder "test" text anywhere on screen.
  ///
  /// Falls back to [todaysPrayers]'s sample schedule when [prayers] is empty
  /// (e.g. the home screen's location/network fetch hasn't finished yet) so
  /// this button always fires immediately instead of silently doing nothing.
  Future<void> scheduleTestFullScreenAlarm({
    required String adhanId,
    required List<Map<String, dynamic>> prayers,
  }) async {
    if (kIsWeb || !Platform.isAndroid) return;
    // No notification of any kind — including this manual debug trigger —
    // should fire while the user has Prayer Notifications turned off. To
    // verify cancellation behavior instead, schedule this test alarm while
    // notifications are on, then toggle them off and confirm it disappears.
    if (!await _masterNotificationsEnabled()) return;

    final List<Map<String, dynamic>> schedule = prayers.isNotEmpty
        ? prayers
        : todaysPrayers
            .map<Map<String, dynamic>>(
                (p) => {'name': p.name, 'time': _parsePrayerTime(p.time)})
            .toList();

    final now = DateTime.now();
    final entry = schedule.firstWhere(
      (p) => (p['time'] as DateTime).isAfter(now),
      orElse: () => schedule.last,
    );
    final name = entry['name'] as String;
    final time = entry['time'] as DateTime;

    final allPrayers = schedule.map((p) {
      final t = p['time'] as DateTime;
      return {
        'name': p['name'] as String,
        'time': _formatPrayerTime(t),
        'epochMillis': t.millisecondsSinceEpoch,
      };
    }).toList();

    try {
      await _alarmChannel.invokeMethod('schedulePrayerAlarm', {
        'prayerName': name,
        'arabicName': _arabicPrayerNames[name] ?? '',
        'prayerTime': _formatPrayerTime(time),
        'message': _alarmMessageFor(await _l10n(), name),
        'adhanId': adhanSoundResource(adhanId).replaceFirst('adhan_', ''),
        'triggerAtMillis':
            now.add(const Duration(seconds: 10)).millisecondsSinceEpoch,
        // Deliberately Dhuhr's real id (101), not a dedicated test-only id —
        // this puts the test alarm inside cancelPrayerAlarms()'s 100-104
        // range so it can be used to verify the bell OFF toggle actually
        // cancels a pending alarm. Trade-off: if a real Dhuhr alarm is
        // already scheduled today, tapping this button overwrites it with
        // the test's near-term trigger until the next natural reschedule.
        'notificationId': 101,
        'allPrayers': allPrayers,
      });
    } catch (e) {
      debugPrint('NotificationService: failed to schedule test alarm: $e');
    }
  }
}

class _PrayerMessage {
  final String title;
  final String body;

  const _PrayerMessage({required this.title, required this.body});
}
