import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/prayer_times_data.dart';
import '../models/prayer_model.dart';
import 'notification_service.dart';
import 'streak_service.dart';
import 'widget_data_service.dart';

class PrayerState extends ChangeNotifier {
  static final PrayerState _instance = PrayerState._internal();
  factory PrayerState() => _instance;
  PrayerState._internal();

  final _streak = StreakService();

  final Map<String, bool> prayers = {
    'Fajr': false,
    'Dhuhr': false,
    'Asr': false,
    'Maghrib': false,
    'Isha': false,
  };

  /// The full prayer list (with display times) most recently resolved by the
  /// home screen — kept here so togglePrayer can refresh the home-screen
  /// widgets without every caller having to thread the list through itself.
  List<Prayer>? lastKnownPrayers;

  int streakCount = 0;
  bool beginnerMode = false;

  int get completedCount => prayers.values.where((v) => v).length;

  static const _notifIds = {
    'fajr': 0, 'dhuhr': 1, 'asr': 2, 'maghrib': 3, 'isha': 4,
  };
  static const _displayNames = {
    'fajr': 'Fajr', 'dhuhr': 'Dhuhr', 'asr': 'Asr',
    'maghrib': 'Maghrib', 'isha': 'Isha',
  };

  bool masterNotifications = true;

  // Guards toggleMasterNotifications against re-entrancy — e.g. a rapid
  // double-tap of the bell, or the header bell and the Settings switch
  // both firing near-simultaneously — so two overlapping cancel/reschedule
  // sequences can never interleave and leave AlarmManager in a mixed state.
  bool _isTogglingNotifications = false;

  final Map<String, bool> notifications = {
    'fajr': true,
    'dhuhr': true,
    'asr': true,
    'maghrib': true,
    'isha': true,
  };

  String selectedAdhanId = 'makkah';

  /// The prayer times most recently scheduled for notifications, as
  /// `{'name': String, 'time': DateTime}` entries. Set by the home screen
  /// (which resolves them from the device location) so the foreground adhan
  /// controller fires in sync with the actual notifications.
  List<Map<String, dynamic>>? scheduledPrayerTimes;

  void setScheduledPrayerTimes(List<Map<String, dynamic>> data) {
    scheduledPrayerTimes = data;
  }

  Future<void> loadToday() async {
    final completed = await _streak.getTodayCompleted();
    final streak = await _streak.getStreak();
    for (final key in prayers.keys) {
      prayers[key] = completed.contains(key);
    }
    streakCount = streak;
    await loadNotifications();
    await loadBeginnerMode();
    await loadSelectedAdhan();
    notifyListeners();
  }

  Future<void> loadSelectedAdhan() async {
    final prefs = await SharedPreferences.getInstance();
    selectedAdhanId = prefs.getString('selected_adhan') ?? 'makkah';
    notifyListeners();
  }

  Future<void> setSelectedAdhan(String id) async {
    selectedAdhanId = id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_adhan', id);
    // Re-schedule so already-queued reminders adopt the newly selected adhan
    // sound (a notification's sound is fixed once it's scheduled).
    await _rescheduleEnabledNotifications();
  }

  /// Re-schedules every currently-enabled prayer reminder using the current
  /// [selectedAdhanId]. No-op when notifications are turned off.
  Future<void> _rescheduleEnabledNotifications() async {
    if (!masterNotifications) return;
    try {
      final prayerTimes = await fetchPrayerTimes();
      final alarmData = <Map<String, dynamic>>[];
      for (final entry in _notifIds.entries) {
        final key = entry.key;
        final notifId = entry.value;
        final name = _displayNames[key]!;
        if (notifications[key] != true) {
          await NotificationService().cancelPrayerNotification(notifId);
          continue;
        }
        final p = prayerTimes.firstWhere((pr) => pr.name == name);
        final time = _parseTime(p.time);
        await NotificationService().scheduleSinglePrayerNotification(
            notifId, name, time,
            adhanId: selectedAdhanId);
        alarmData.add({'name': name, 'time': time});
      }
      await NotificationService().scheduleFullScreenPrayerAlarms(
          alarmData,
          adhanId: selectedAdhanId);
    } catch (_) {}
  }

  Future<void> togglePrayer(String name, [BuildContext? context]) async {
    final isDone = prayers[name] ?? false;
    prayers[name] = !isDone;
    notifyListeners(); // optimistic update
    if (isDone) {
      await _streak.unmarkPrayer(name);
    } else {
      await _streak.markPrayer(name);
    }
    streakCount = await _streak.getStreak();
    notifyListeners(); // update streak after persist

    final known = lastKnownPrayers;
    if (context != null && context.mounted && known != null) {
      await WidgetDataService.pushCompletionSnapshot(context: context, prayers: known);
    }
  }

  Future<void> loadBeginnerMode() async {
    final prefs = await SharedPreferences.getInstance();
    beginnerMode = prefs.getBool('beginner_mode') ?? false;
    notifyListeners();
  }

  Future<void> toggleBeginnerMode(bool value) async {
    beginnerMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('beginner_mode', value);
  }

  Future<void> loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    masterNotifications = prefs.getBool('notif_master') ?? true;
    for (final key in notifications.keys) {
      notifications[key] = prefs.getBool('notif_$key') ?? true;
    }
    notifyListeners();
  }

  /// Returns true once the cancel (value=false) or reschedule (value=true)
  /// was verified against AlarmManager — i.e. the OFF state is confirmed to
  /// leave nothing pending, or the ON state is confirmed to have every
  /// prayer's full-screen alarm actually scheduled. Callers should only
  /// surface a "Notifications disabled/enabled" success message when this
  /// returns true.
  Future<bool> toggleMasterNotifications(bool value) async {
    if (_isTogglingNotifications) {
      debugPrint('PrayerState: toggleMasterNotifications ignored — already in progress');
      return false;
    }
    _isTogglingNotifications = true;
    try {
      // Flip and broadcast immediately — optimistic, so the bell icon always
      // reflects the tap even if a downstream step below throws (e.g. on a
      // device/permission state where cancelAll or rescheduling fails).
      masterNotifications = value;
      for (final key in notifications.keys) {
        notifications[key] = value;
      }
      notifyListeners();

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('notif_master', value);
        for (final key in notifications.keys) {
          await prefs.setBool('notif_$key', value);
        }

        if (!value) {
          debugPrint('PrayerState.toggleMasterNotifications(false): cancelling all prayer alarms');
          // Cancel both the 15-minutes-early reminders (flutter_local_notifications)
          // AND the native full-screen at-time alarms — they're scheduled through
          // entirely separate systems, so both must be cancelled for "off" to
          // actually mean no prayer notification fires at all. The native side
          // already retries+verifies each id; this is the final confirmation.
          await NotificationService().cancelAll();
          final cleared = await NotificationService().cancelFullScreenPrayerAlarms();
          if (!cleared) {
            debugPrint('PrayerState: some prayer alarms could not be confirmed cancelled');
          }
          return cleared;
        } else {
          debugPrint('PrayerState.toggleMasterNotifications(true): rescheduling all prayer alarms');
          final prayerTimes = await fetchPrayerTimes();
          final data = prayerTimes
              .map((p) => {'name': p.name, 'time': _parseTime(p.time)})
              .toList();
          await NotificationService()
              .schedulePrayerNotifications(data, adhanId: selectedAdhanId);
          await NotificationService()
              .scheduleFullScreenPrayerAlarms(data, adhanId: selectedAdhanId);

          // Only the ids whose time hadn't already passed get scheduled
          // natively, so only verify those — a passed prayer is correctly
          // absent from AlarmManager, not a verification failure.
          final expectedIds = <int>[];
          for (final entry in data) {
            final id = _alarmIdFor(entry['name'] as String);
            final time = entry['time'] as DateTime;
            if (id != null && time.isAfter(DateTime.now())) expectedIds.add(id);
          }
          final pending = await NotificationService().queryPendingPrayerAlarms(
            expectedIds.isEmpty ? const [100, 101, 102, 103, 104] : expectedIds,
          );
          final allScheduled = expectedIds.every((id) => pending[id] == true);
          if (!allScheduled) {
            debugPrint('PrayerState: some prayer alarms could not be confirmed scheduled');
          }
          return allScheduled;
        }
      } catch (_) {
        // The toggle itself already took effect (masterNotifications + UI);
        // a failure here only means scheduling/cancellation didn't fully sync.
        return false;
      }
    } finally {
      _isTogglingNotifications = false;
    }
  }

  static const Map<String, int> _alarmIds = {
    'Fajr': 100,
    'Dhuhr': 101,
    'Asr': 102,
    'Maghrib': 103,
    'Isha': 104,
  };

  int? _alarmIdFor(String prayerName) => _alarmIds[prayerName];

  Future<void> togglePrayerNotification(String prayer, bool value) async {
    notifications[prayer] = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notif_$prayer', value);

    final notifId = _notifIds[prayer]!;
    final name = _displayNames[prayer]!;

    if (!value) {
      await NotificationService().cancelPrayerNotification(notifId);
    } else {
      try {
        final prayerTimes = await fetchPrayerTimes();
        final p = prayerTimes.firstWhere((pr) => pr.name == name);
        await NotificationService().scheduleSinglePrayerNotification(
            notifId, name, _parseTime(p.time),
            adhanId: selectedAdhanId);
      } catch (_) {}
    }
  }

  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final isPm = parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}
