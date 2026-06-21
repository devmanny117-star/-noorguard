import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:home_widget/home_widget.dart';
import '../l10n/app_localizations.dart';
import '../models/prayer_model.dart';
import '../data/widget_daily_verses.dart';
import 'hijri_date_service.dart';
import 'qibla_service.dart';
import 'streak_service.dart';

/// Bridges Flutter data to the native Android home-screen widgets via the
/// `home_widget` plugin. Every key written here has a matching reader on the
/// Kotlin side (see android/app/src/main/kotlin/.../widget/WidgetKeys.kt) —
/// keep the two in sync when adding fields.
class WidgetDataService {
  // Fully qualified since the widget classes live in the .widget sub-package,
  // not the root package androidName alone would assume.
  static const _androidWidgetNames = [
    'com.example.noor_guard.widget.SmallPrayerWidgetReceiver',
    'com.example.noor_guard.widget.MediumPrayerWidgetReceiver',
    'com.example.noor_guard.widget.LargePrayerWidgetReceiver',
  ];

  static const _englishToLocalizedKey = {
    'Fajr': 'fajr',
    'Dhuhr': 'dhuhr',
    'Asr': 'asr',
    'Maghrib': 'maghrib',
    'Isha': 'isha',
  };

  /// Pushes the full snapshot (prayer times, Hijri date, location, Qibla,
  /// daily verse, completion + streak, and localized labels). Called once
  /// prayer times and location have been resolved.
  static Future<void> pushPrayerTimesSnapshot({
    required BuildContext context,
    required List<Prayer> prayers,
    required String locationLabel,
    double? lat,
    double? lng,
  }) async {
    if (kIsWeb) return;
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;
    final locale = Localizations.localeOf(context).languageCode;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final streak = StreakService();
    final completedToday = await streak.getTodayCompleted();
    final streakCount = await streak.getStreak();

    final next = prayers.where((p) => p.isNext).firstOrNull ?? prayers.first;
    final now = DateTime.now();

    final prayersJson = prayers
        .map((p) => {
              'name': p.name,
              'displayName': _localizedPrayerName(l10n, p.name),
              'time': p.time,
              'done': completedToday.contains(p.name),
              'isNext': p.isNext,
            })
        .toList();

    final hijri = HijriDate.fromGregorian(now);
    final monthNames = _hijriMonthNames(l10n);
    final verse = widgetVerseForDate(now);

    double? bearing;
    if (lat != null && lng != null) {
      bearing = QiblaService.calculateQiblaDirection(lat, lng);
    }

    await Future.wait([
      HomeWidget.saveWidgetData('next_prayer_name', _localizedPrayerName(l10n, next.name)),
      HomeWidget.saveWidgetData('next_prayer_time', next.time),
      HomeWidget.saveWidgetData(
        'next_prayer_epoch_millis',
        _parseTimeToday(next.time, now).millisecondsSinceEpoch,
      ),
      HomeWidget.saveWidgetData('prayers_json', jsonEncode(prayersJson)),
      HomeWidget.saveWidgetData('streak_count', streakCount),
      HomeWidget.saveWidgetData('hijri_date', hijri.format(monthNames)),
      HomeWidget.saveWidgetData('location_label', locationLabel),
      HomeWidget.saveWidgetData('qibla_bearing_degrees', bearing),
      HomeWidget.saveWidgetData('daily_verse_text', verse.forLocale(locale)),
      HomeWidget.saveWidgetData('daily_verse_ref', verse.reference),
      HomeWidget.saveWidgetData('locale_code', locale),
      HomeWidget.saveWidgetData('is_rtl', isRtl),
      HomeWidget.saveWidgetData('label_next_prayer', l10n.nextPrayer),
      HomeWidget.saveWidgetData('label_i_prayed', l10n.iPrayedButton),
      HomeWidget.saveWidgetData('label_streak', l10n.streak),
      HomeWidget.saveWidgetData('label_day_streak', l10n.dayStreak),
      HomeWidget.saveWidgetData('label_qibla', l10n.qibla),
    ]);

    await _updateAllWidgets();
  }

  /// Pushes just the completion/streak state — called after a prayer is
  /// toggled, without needing to resend the (unchanged) prayer times.
  static Future<void> pushCompletionSnapshot({
    required BuildContext context,
    required List<Prayer> prayers,
  }) async {
    if (kIsWeb) return;
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;

    final streak = StreakService();
    final completedToday = await streak.getTodayCompleted();
    final streakCount = await streak.getStreak();

    final prayersJson = prayers
        .map((p) => {
              'name': p.name,
              'displayName': _localizedPrayerName(l10n, p.name),
              'time': p.time,
              'done': completedToday.contains(p.name),
              'isNext': p.isNext,
            })
        .toList();

    await Future.wait([
      HomeWidget.saveWidgetData('prayers_json', jsonEncode(prayersJson)),
      HomeWidget.saveWidgetData('streak_count', streakCount),
    ]);

    await _updateAllWidgets();
  }

  static Future<void> _updateAllWidgets() async {
    for (final name in _androidWidgetNames) {
      try {
        await HomeWidget.updateWidget(qualifiedAndroidName: name);
      } catch (_) {
        // Ignored: harmless if a given widget size hasn't been added to the
        // home screen (or, during development, hasn't been built yet).
      }
    }
  }

  /// Parses a "4:47 PM" style time string onto [date]'s calendar day.
  static DateTime _parseTimeToday(String timeStr, DateTime date) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final isPm = parts.length > 1 && parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  static String _localizedPrayerName(AppLocalizations l10n, String englishName) {
    return switch (_englishToLocalizedKey[englishName]) {
      'fajr' => l10n.fajr,
      'dhuhr' => l10n.dhuhr,
      'asr' => l10n.asr,
      'maghrib' => l10n.maghrib,
      'isha' => l10n.isha,
      _ => englishName,
    };
  }

  static List<String> _hijriMonthNames(AppLocalizations l10n) => [
        l10n.islamicMonthMuharram,
        l10n.islamicMonthSafar,
        l10n.islamicMonthRabiAlAwwal,
        l10n.islamicMonthRabiAlThani,
        l10n.islamicMonthJumadaAlAwwal,
        l10n.islamicMonthJumadaAlThani,
        l10n.islamicMonthRajab,
        l10n.islamicMonthShaban,
        l10n.islamicMonthRamadan,
        l10n.islamicMonthShawwal,
        l10n.islamicMonthDhulQadah,
        l10n.islamicMonthDhulHijjah,
      ];
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
