import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../data/prayer_times_data.dart';
import '../models/prayer_model.dart';
import 'adhan_playback_service.dart';
import 'notification_service.dart';
import 'prayer_state.dart';

/// Plays the full adhan through the in-app audio player when a prayer reminder
/// fires **while the app is in the foreground**, on both Android and iOS.
///
/// How it stays free of overlapping audio:
///   • While the app is open this controller arms a Dart [Timer] for each
///     enabled, upcoming prayer reminder, firing a few seconds before the
///     scheduled OS notification would.
///   • When a timer fires it cancels that prayer's scheduled OS notification
///     (so its bundled adhan clip never sounds), shows a soundless banner, and
///     plays the full adhan via [AdhanPlaybackService].
///   • If the app is in the background the timers are torn down and never run,
///     so the OS notification fires normally with its bundled adhan sound —
///     the user still hears the adhan when the app is closed.
///
/// It never bulk-cancels scheduled notifications, so the closed-app reminders
/// (and the in-app test notification) keep working exactly as before.
///
/// Stop triggers while the adhan is playing:
///   • Volume up/down key press (both platforms — native signals `stopAdhan`)
///   • Tapping the prayer notification banner (native signals `stopAdhan`)
///   • Swiping away the prayer notification banner (native signals `stopAdhan`)
class AdhanForegroundController with WidgetsBindingObserver {
  static final AdhanForegroundController _instance =
      AdhanForegroundController._internal();
  factory AdhanForegroundController() => _instance;
  AdhanForegroundController._internal();

  static const Map<String, int> _notifIds = {
    'Fajr': 0,
    'Dhuhr': 1,
    'Asr': 2,
    'Maghrib': 3,
    'Isha': 4,
  };

  /// Fire this many seconds before the OS notification's time, leaving a
  /// margin to cancel it before it can play its own sound.
  static const _leadSeconds = 3;

  /// MethodChannel shared with native Android/iOS for volume-key interception
  /// (Android), notification dismiss/tap callbacks, and play-state sync.
  static const _channel = MethodChannel('adhan_control');

  /// `true` while the foreground adhan is streaming. The UI observes this to
  /// show/hide the floating Stop Adhan button.
  final ValueNotifier<bool> isAdhanPlaying = ValueNotifier(false);

  final List<Timer> _timers = [];
  bool _started = false;

  /// ID of the prayer notification currently showing (0–4), or null when no
  /// foreground adhan session is active. Used to cancel the banner when the
  /// adhan is stopped programmatically (e.g. volume key / stop button).
  int? _currentPrayerId;

  List<Prayer>? _cachedPrayers;
  DateTime? _cachedDay;

  /// Registers the lifecycle observer and arms timers for the current
  /// (foreground) session. Safe to call more than once.
  void start() {
    if (_started) return;
    _started = true;
    WidgetsBinding.instance.addObserver(this);

    // Handle stop requests coming from native (Android volume key, notification tap/dismiss).
    _channel.setMethodCallHandler(_handleNativeCall);

    // Keep native in sync with play state (Android uses this for volume-key interception).
    AdhanPlaybackService().onPlayStateChanged = _onPlayStateChanged;

    // Dart-side callback: fires when the user taps the prayer notification banner.
    // This is the primary iOS tap handler since the native MethodChannel path
    // depends on timing of channel initialisation.
    NotificationService.onPrayerBannerTapped = stopAdhan;

    _armTimers();
  }

  /// Dispatches native method calls received on [_channel].
  Future<dynamic> _handleNativeCall(MethodCall call) async {
    if (call.method == 'stopAdhan') {
      await stopAdhan();
    }
  }

  /// Notifies the UI and native code whenever playback starts or stops.
  void _onPlayStateChanged(bool isPlaying) {
    isAdhanPlaying.value = isPlaying;
    _channel.invokeMethod('setPlaying', isPlaying);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _armTimers();
    } else {
      // Backgrounded/inactive: let the scheduled OS notifications (with the
      // bundled adhan sound) handle prayers instead.
      _cancelTimers();
    }
  }

  /// Re-reads today's prayer times and (re)arms a timer per enabled, upcoming
  /// prayer reminder. Called fresh on every resume.
  Future<void> _armTimers() async {
    _cancelTimers();

    final state = PrayerState();
    if (!state.masterNotifications) return;

    final prayers = await _todaysPrayerTimes();
    if (prayers == null) return;

    final now = DateTime.now();
    for (final entry in prayers) {
      final name = entry['name'] as String;
      final time = entry['time'] as DateTime;
      final id = _notifIds[name];
      if (id == null) continue;
      if (state.notifications[name.toLowerCase()] != true) continue;

      final notifyAt = time.subtract(const Duration(minutes: 15));
      final fireAt = notifyAt.subtract(const Duration(seconds: _leadSeconds));
      if (!fireAt.isAfter(now)) continue;

      _timers.add(Timer(fireAt.difference(now), () => _onPrayerFire(id, name)));
    }
  }

  Future<void> _onPrayerFire(int id, String name) async {
    _currentPrayerId = id;
    // Stop the OS notification's own adhan clip, show a silent banner in its
    // place, then play the full adhan through the audio player.
    await NotificationService().cancelPrayerNotification(id);
    await NotificationService().showSilentPrayerBanner(id, name);
    await AdhanPlaybackService().playForAdhan(PrayerState().selectedAdhanId);
  }

  /// Verification hook for the settings screen: reproduces what the user sees
  /// and hears when a reminder fires in the foreground — a soundless banner
  /// plus the full selected adhan — without touching any real scheduled
  /// reminder.
  Future<void> simulateForegroundPrayer() async {
    _currentPrayerId = 0;
    isAdhanPlaying.value = true;
    await NotificationService().showSilentPrayerBanner(0, 'Fajr');
    await AdhanPlaybackService().playForAdhan(PrayerState().selectedAdhanId);
  }

  /// Stops the in-app adhan if it's currently playing, dismisses the
  /// accompanying silent prayer banner from the notification tray, and hides
  /// the floating Stop Adhan button.
  Future<void> stopAdhan() async {
    isAdhanPlaying.value = false;
    await AdhanPlaybackService().stop();
    if (_currentPrayerId != null) {
      final id = _currentPrayerId!;
      _currentPrayerId = null;
      await NotificationService().cancelPrayerNotification(id);
    }
  }

  void _cancelTimers() {
    for (final t in _timers) {
      t.cancel();
    }
    _timers.clear();
  }

  /// Today's prayer times as `{'name', 'time'}` entries. Prefers the times the
  /// home screen scheduled from the device location; otherwise falls back to a
  /// network fetch (cached for the day so rapid lifecycle changes don't hammer
  /// it).
  Future<List<Map<String, dynamic>>?> _todaysPrayerTimes() async {
    final shared = PrayerState().scheduledPrayerTimes;
    if (shared != null && shared.isNotEmpty) return shared;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (_cachedPrayers == null || _cachedDay != today) {
      try {
        _cachedPrayers = await fetchPrayerTimes();
        _cachedDay = today;
      } catch (e) {
        debugPrint('AdhanForegroundController: prayer times unavailable: $e');
        return null;
      }
    }
    return _cachedPrayers!
        .map((p) => {'name': p.name, 'time': _parseTime(p.time)})
        .toList();
  }

  DateTime _parseTime(String timeStr) {
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
}
