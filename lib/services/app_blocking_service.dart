import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../models/installed_app.dart';
import '../models/prayer_model.dart';
import 'streak_service.dart';

enum BlockingMode { soft, firm, hard }

/// A pending "Read 3 Ayahs" challenge handed off from the native block
/// screen — completing it grants [blockedPackage] a bypass through the end
/// of the prayer window that triggered it.
class AyahChallenge {
  final String blockedPackage;
  final int windowEndMillis;
  static const targetCount = 3;

  const AyahChallenge({required this.blockedPackage, required this.windowEndMillis});
}

/// One computed prayer block window for today — shared by [AppBlockingService
/// .syncToNative] (which serializes these for the native AccessibilityService)
/// and Focus Mode (which checks live against these to pause/resume its timer).
class PrayerWindow {
  final String prayerName;
  final DateTime start;
  final DateTime end;

  const PrayerWindow({required this.prayerName, required this.start, required this.end});

  bool contains(DateTime time) => !time.isBefore(start) && !time.isAfter(end);
}

/// Owns App Blocking settings (on/off, mode, selected prayers, buffer
/// minutes, blocked packages) and is the only thing that talks to the
/// native Android side. Mirrors `PrayerState`'s singleton/ChangeNotifier
/// shape. The AccessibilityService and BlockActivity never read Flutter's
/// own SharedPreferences file or call back into Dart — everything they need
/// (config + already-localized strings) is pushed down via [syncToNative].
class AppBlockingService extends ChangeNotifier {
  static final AppBlockingService _instance = AppBlockingService._internal();
  factory AppBlockingService() => _instance;
  AppBlockingService._internal();

  static const _channel = MethodChannel('app_blocking_control');

  static const List<int> bufferOptions = [0, 5, 10, 15, 30];
  static const List<String> prayerNames = StreakService.prayerNames;

  bool enabled = false;
  BlockingMode mode = BlockingMode.firm;
  Set<String> selectedPrayers = {...prayerNames};
  int preMinutes = 5;
  int postMinutes = 15;
  Set<String> blockedPackages = {};

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    enabled = prefs.getBool('app_blocking_enabled') ?? false;
    final modeName = prefs.getString('app_blocking_mode') ?? BlockingMode.firm.name;
    mode = BlockingMode.values.firstWhere(
      (m) => m.name == modeName,
      orElse: () => BlockingMode.firm,
    );
    selectedPrayers =
        (prefs.getStringList('app_blocking_prayers') ?? prayerNames).toSet();
    preMinutes = prefs.getInt('app_blocking_pre_minutes') ?? 5;
    postMinutes = prefs.getInt('app_blocking_post_minutes') ?? 15;
    blockedPackages =
        (prefs.getStringList('app_blocking_packages') ?? []).toSet();
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app_blocking_enabled', enabled);
    await prefs.setString('app_blocking_mode', mode.name);
    await prefs.setStringList('app_blocking_prayers', selectedPrayers.toList());
    await prefs.setInt('app_blocking_pre_minutes', preMinutes);
    await prefs.setInt('app_blocking_post_minutes', postMinutes);
    await prefs.setStringList('app_blocking_packages', blockedPackages.toList());
  }

  Future<void> setEnabled(bool value) async {
    enabled = value;
    notifyListeners();
    await _persist();
  }

  Future<void> setMode(BlockingMode value) async {
    mode = value;
    notifyListeners();
    await _persist();
  }

  Future<void> togglePrayer(String prayerName, bool value) async {
    if (value) {
      selectedPrayers.add(prayerName);
    } else {
      selectedPrayers.remove(prayerName);
    }
    notifyListeners();
    await _persist();
  }

  Future<void> setPreMinutes(int minutes) async {
    preMinutes = minutes;
    notifyListeners();
    await _persist();
  }

  Future<void> setPostMinutes(int minutes) async {
    postMinutes = minutes;
    notifyListeners();
    await _persist();
  }

  Future<void> toggleBlockedPackage(String packageName, bool value) async {
    if (value) {
      blockedPackages.add(packageName);
    } else {
      blockedPackages.remove(packageName);
    }
    notifyListeners();
    await _persist();
  }

  /// Cached so screens that just need a few icons (Focus Mode) don't pay for
  /// a full re-fetch + re-decode of every installed app's icon on every
  /// build. Pass `forceRefresh: true` where freshness matters more than
  /// speed (the App Blocking apps picker, opened specifically to manage this
  /// list).
  List<InstalledApp>? _cachedApps;

  Future<List<InstalledApp>> getInstalledApps({bool forceRefresh = false}) async {
    if (!Platform.isAndroid) return [];
    if (!forceRefresh && _cachedApps != null) return _cachedApps!;
    try {
      final result =
          await _channel.invokeMethod<List<dynamic>>('getInstalledApps');
      final apps = (result ?? [])
          .map((e) => InstalledApp.fromMap(e as Map<dynamic, dynamic>))
          .where((a) => !a.isSystemApp)
          .toList()
        ..sort((a, b) =>
            a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      _cachedApps = apps;
      return apps;
    } catch (_) {
      return _cachedApps ?? [];
    }
  }

  /// Resolves the currently blocked packages to their real installed-app
  /// data (name + icon), for previews like Focus Mode's blocked-apps row.
  Future<List<InstalledApp>> getBlockedAppsWithIcons() async {
    final apps = await getInstalledApps();
    final byPackage = {for (final a in apps) a.packageName: a};
    return blockedPackages
        .map((pkg) => byPackage[pkg])
        .whereType<InstalledApp>()
        .toList();
  }

  Future<bool> isAccessibilityServiceEnabled() async {
    if (!Platform.isAndroid) return false;
    try {
      return await _channel
              .invokeMethod<bool>('isAccessibilityServiceEnabled') ??
          false;
    } catch (_) {
      return false;
    }
  }

  Future<void> openAccessibilitySettings() async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod('openAccessibilitySettings');
    } catch (_) {}
  }

  /// Consumes (clears) any ayah challenge BlockActivity attached when it
  /// launched MainActivity for the "Read 3 Ayahs" flow.
  Future<AyahChallenge?> consumePendingAyahChallenge() async {
    if (!Platform.isAndroid) return null;
    try {
      final result =
          await _channel.invokeMethod<Map<dynamic, dynamic>>('getPendingAyahChallenge');
      if (result == null) return null;
      final pkg = result['blockedPackage'] as String?;
      if (pkg == null) return null;
      return AyahChallenge(
        blockedPackage: pkg,
        windowEndMillis: (result['windowEndMillis'] as num?)?.toInt() ?? 0,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> grantAyahChallengeBypass(String packageName, int untilMillis) async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod('grantAyahChallengeBypass', {
        'packageName': packageName,
        'untilMillis': untilMillis,
      });
    } catch (_) {}
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

  /// Today's prayer block windows for the currently-selected prayers — the
  /// single source both [syncToNative] (serializes for native) and Focus
  /// Mode (live pause/resume check) compute from.
  List<PrayerWindow> computeTodaysWindows(List<Prayer> todaysPrayers) {
    final windows = <PrayerWindow>[];
    for (final p in todaysPrayers) {
      if (!selectedPrayers.contains(p.name)) continue;
      DateTime time;
      try {
        time = _parseTime(p.time);
      } catch (_) {
        continue;
      }
      windows.add(PrayerWindow(
        prayerName: p.name,
        start: time.subtract(Duration(minutes: preMinutes)),
        end: time.add(Duration(minutes: postMinutes)),
      ));
    }
    return windows;
  }

  /// Pushes the full native-side config: on/off, mode, blocked packages,
  /// today's prayer block windows, the current locale code (so the native
  /// block screen can pick the right language from the bundled verse
  /// asset), and every localized string the block screen needs.
  Future<void> syncToNative(
    BuildContext context,
    List<Prayer> todaysPrayers,
  ) async {
    if (!Platform.isAndroid) return;
    final l10n = AppLocalizations.of(context)!;

    final windows = computeTodaysWindows(todaysPrayers)
        .map((w) => {
              'prayerName': w.prayerName,
              'startEpochMillis': w.start.millisecondsSinceEpoch,
              'endEpochMillis': w.end.millisecondsSinceEpoch,
            })
        .toList();

    try {
      await _channel.invokeMethod('updateBlockingConfig', {
        'enabled': enabled,
        'mode': mode.name,
        'blockedPackages': blockedPackages.toList(),
        'windows': windows,
        'locale': Localizations.localeOf(context).languageCode,
        'strings': {
          'headline1': l10n.appBlockingHeadline1,
          'headline2': l10n.appBlockingHeadline2,
          'iPrayed': l10n.appBlockingIPrayedButton,
          'readAyahs': l10n.appBlockingReadAyahsButton,
          'emergencyBypass': l10n.appBlockingEmergencyBypass,
          'bypassConfirmTitle': l10n.appBlockingBypassConfirmTitle,
          'bypassConfirmBody': l10n.appBlockingBypassConfirmBody,
          'bypassConfirmContinue': l10n.appBlockingBypassConfirmContinue,
          'bypassConfirmCancel': l10n.appBlockingBypassConfirmCancel,
          'softReminderTitle': l10n.appBlockingSoftReminderTitle,
          'softReminderBody': l10n.appBlockingSoftReminderBody,
          'focusHeadline1': l10n.focusBlockHeadline1,
          'focusHeadline2': l10n.focusBlockHeadline2,
          'endFocusSession': l10n.endFocusSessionButton,
        },
      });
    } catch (_) {
      // Best-effort — the in-app settings already reflect the change even
      // if pushing it to native fails (e.g. accessibility service absent).
    }
  }

  /// Starts a Focus Mode session — blocks the shared apps list for
  /// [duration], independent of the prayer-time "enabled" toggle.
  Future<void> startFocusSession(Duration duration) async {
    if (!Platform.isAndroid) return;
    final endMillis = DateTime.now().add(duration).millisecondsSinceEpoch;
    try {
      await _channel.invokeMethod('updateFocusSession', {'endMillis': endMillis});
    } catch (_) {}
  }

  Future<void> endFocusSession() async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod('updateFocusSession', {'endMillis': null});
    } catch (_) {}
  }

  /// Pulls native truth for the running focus session — null if there isn't
  /// one (including if the user ended it early from the native focus block
  /// screen's "End Focus Session" button), so Dart's timer can reconcile
  /// after returning from it.
  Future<DateTime?> reconcileFocusSession() async {
    if (!Platform.isAndroid) return null;
    try {
      final endMillis = await _channel.invokeMethod<int>('getFocusSessionStatus');
      if (endMillis == null) return null;
      return DateTime.fromMillisecondsSinceEpoch(endMillis);
    } catch (_) {
      return null;
    }
  }
}
