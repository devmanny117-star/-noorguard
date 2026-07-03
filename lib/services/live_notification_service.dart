import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/share_data.dart';
import '../l10n/app_localizations.dart';
import '../models/asma_ul_husna_model.dart';
import '../models/dua_model.dart';
import '../screens/islamic_glossary_screen.dart' show glossaryTermAt;

/// Assembles the fully localized payload behind the persistent "Noor Guard
/// Live" notification (next-prayer countdown + rotating daily Islamic
/// content) and hands it to the native [PrayerForegroundService] via
/// SharedPreferences — the Kotlin side reads `flutter.live_notif_payload`
/// from the FlutterSharedPreferences file and re-renders itself every 30
/// minutes without needing Dart to be running.
///
/// Everything user-visible is resolved here in the app's selected language,
/// because native code has no access to Flutter localizations. Countdown
/// strings are passed as templates with literal `{h}`/`{m}` placeholders so
/// the service can re-format them as time passes.
class LiveNotificationService {
  LiveNotificationService._();

  static const payloadPrefsKey = 'live_notif_payload';

  /// Days of rotating content included per push, so the notification keeps
  /// showing fresh daily content even if the app isn't opened for a week.
  static const _daysOfContent = 7;

  /// Writes today's payload. [prayers] are `{'name': String, 'time': DateTime}`
  /// entries — the same shape the home screen already builds for scheduling.
  static Future<void> push({
    required BuildContext context,
    required List<Map<String, dynamic>> prayers,
  }) async {
    if (kIsWeb || !Platform.isAndroid) return;
    final l10n = AppLocalizations.of(context);
    if (l10n == null || prayers.isEmpty) return;
    final locale = Localizations.localeOf(context).languageCode;

    final prayersJson = prayers.map((entry) {
      final time = entry['time'] as DateTime;
      return {
        'displayName': _localizedPrayerName(l10n, entry['name'] as String),
        'timeLabel': _formatTime(time),
        'epochMillis': time.millisecondsSinceEpoch,
      };
    }).toList();

    // Tomorrow's Fajr (approximated as today's + 24h — off by the ~1 minute
    // prayer times drift per day, corrected the next time the app opens) so
    // the countdown keeps working overnight after Isha has passed.
    final fajr = prayers.firstWhere(
      (p) => (p['name'] as String) == 'Fajr',
      orElse: () => prayers.first,
    );
    final fajrTime = (fajr['time'] as DateTime).add(const Duration(days: 1));

    final today = DateTime.now();
    final days = <Map<String, String>>[];
    for (int i = 0; i < _daysOfContent; i++) {
      final date = DateTime(today.year, today.month, today.day + i);
      days.add(_contentForDate(date, l10n, locale));
    }

    final payload = <String, dynamic>{
      'prayers': prayersJson,
      'tomorrowFajrDisplayName': _localizedPrayerName(l10n, 'Fajr'),
      'tomorrowFajrTimeLabel': _formatTime(fajrTime),
      'tomorrowFajrEpochMillis': fajrTime.millisecondsSinceEpoch,
      'countdownHoursMinutes':
          l10n.liveNotifCountdownHoursMinutes('{h}', '{m}'),
      'countdownMinutes': l10n.liveNotifCountdownMinutes('{m}'),
      'countdownNow': l10n.liveNotifCountdownNow,
      'days': days,
    };

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(payloadPrefsKey, jsonEncode(payload));
  }

  /// One day's rotating content block, cycling ayah → dua → glossary word →
  /// Name of Allah → hadith by day of year, and stepping through each pool
  /// on every 5-day pass so consecutive weeks never repeat.
  static Map<String, String> _contentForDate(
      DateTime date, AppLocalizations l10n, String locale) {
    final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
    final step = dayOfYear ~/ 5;
    final dateKey = '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';

    switch (dayOfYear % 5) {
      case 0:
        final ayah = shareAyahs[step % shareAyahs.length];
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderAyah,
          'arabic': ayah.arabic,
          'body': _translationOrEmpty(locale, ayah.translationFor),
          'source': ayah.source,
        };
      case 1:
        final dua = lockScreenDuas[step % lockScreenDuas.length];
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderDua,
          'arabic': dua.arabic.replaceAll('\n', ' '),
          'body': _translationOrEmpty(
              locale, (l) => dua.translationFor(l).replaceAll('\n', ' ')),
          'source': dua.source,
        };
      case 2:
        final term = glossaryTermAt(step, locale);
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderWord,
          'arabic': term.arabic,
          'body': '${term.transliteration} — ${term.definition}',
          'source': '',
        };
      case 3:
        final name = asmaUlHusnaNames[step % asmaUlHusnaNames.length];
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderName,
          'arabic': name.arabic,
          'body': '${name.transliteration} — ${name.meaningText(locale)}\n'
              '${name.explanationText(locale)}',
          'source': '',
        };
      default:
        final hadith = shareHadiths[step % shareHadiths.length];
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderHadith,
          'arabic': hadith.arabic,
          'body': _translationOrEmpty(locale, hadith.translationFor),
          'source': hadith.source,
        };
    }
  }

  /// Ayahs, duas, and hadiths deliberately have no 'ar' translation entry —
  /// Arabic readers are served by the Arabic text itself (the same convention
  /// as duas_screen.dart) — so for the Arabic locale the translation line is
  /// omitted instead of falling back to English.
  static String _translationOrEmpty(
      String locale, String Function(String) translationFor) {
    return locale == 'ar' ? '' : translationFor(locale);
  }

  /// 12-hour "1:09 PM" format, matching every other prayer-time label in the
  /// app (widgets, alarms, lock screen).
  static String _formatTime(DateTime time) {
    final hour =
        time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final amPm = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $amPm';
  }

  static String _localizedPrayerName(AppLocalizations l10n, String name) {
    return switch (name) {
      'Fajr' => l10n.fajr,
      'Dhuhr' => l10n.dhuhr,
      'Asr' => l10n.asr,
      'Maghrib' => l10n.maghrib,
      'Isha' => l10n.isha,
      _ => name,
    };
  }
}
