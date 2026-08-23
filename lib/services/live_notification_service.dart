import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../data/share_data.dart';
import '../l10n/app_localizations.dart';
import '../models/asma_ul_husna_model.dart';
import '../models/dua_model.dart';
import '../screens/islamic_glossary_screen.dart' show glossaryTermAt;
import 'quran_service.dart' show fetchAyahTranslation;

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

  /// iOS-only: one [FlutterLocalNotificationsPlugin] instance for scheduling
  /// the Fajr content notifications below. Talks to the same native
  /// platform channel `NotificationService`'s instance already initialized
  /// at app startup (main.dart calls `NotificationService().init()` before
  /// any prayer schedule/push happens), so this doesn't need its own
  /// `initialize()` call — same pattern flutter_local_notifications apps
  /// commonly use for a secondary call site.
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  /// Notification ids for the [_daysOfContent] pre-scheduled iOS Fajr
  /// content notifications (500–506) — clear of every id range
  /// `NotificationService` uses (0–4, 50–79, 100–134, 999), so cancelling or
  /// rescheduling one system never touches the other.
  static const _iosFajrNotifIdBase = 500;

  /// Writes today's payload. [prayers] are `{'name': String, 'time': DateTime}`
  /// entries — the same shape the home screen already builds for scheduling.
  ///
  /// Android gets the SharedPreferences payload the foreground service reads
  /// (see class doc). iOS has no equivalent always-running native service,
  /// so it instead gets [_daysOfContent] pre-scheduled local notifications
  /// timed to Fajr, one per day, each showing that day's rotating content —
  /// see [_scheduleIosFajrNotifications].
  static Future<void> push({
    required BuildContext context,
    required List<Map<String, dynamic>> prayers,
  }) async {
    if (kIsWeb) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;
    final l10n = AppLocalizations.of(context);
    if (l10n == null || prayers.isEmpty) return;
    final locale = Localizations.localeOf(context).languageCode;

    final today = DateTime.now();
    final days = <Map<String, String>>[];
    for (int i = 0; i < _daysOfContent; i++) {
      final date = DateTime(today.year, today.month, today.day + i);
      days.add(await _contentForDate(date, l10n, locale));
    }

    if (Platform.isIOS) {
      await _scheduleIosFajrNotifications(
        prayers: prayers,
        today: today,
        days: days,
      );
      return;
    }

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

  /// Pre-schedules [_daysOfContent] one-shot local notifications timed to
  /// Fajr — today plus the next `_daysOfContent - 1` days — each showing
  /// that day's rotating content from [days] (built by the same
  /// [_contentForDate] cycle Android's payload uses, so both platforms show
  /// identical content on any given date). Title is the content type header
  /// (e.g. "NAME OF ALLAH", already uppercase in every locale's ARB); body is
  /// the Arabic text followed by the transliteration/meaning line
  /// [_contentForDate] already assembled per type.
  ///
  /// Each day's Fajr time is approximated as today's Fajr clock time carried
  /// onto that future date (same drift caveat as the Android tomorrow-Fajr
  /// countdown above — corrected next time the app opens and re-pushes).
  ///
  /// Always cancels its own id range first, so every call (cold start, a
  /// fresh prayer-time fetch, a language change) atomically replaces the
  /// previous window instead of piling notifications on top of it.
  static Future<void> _scheduleIosFajrNotifications({
    required List<Map<String, dynamic>> prayers,
    required DateTime today,
    required List<Map<String, String>> days,
  }) async {
    for (int i = 0; i < _daysOfContent; i++) {
      await _plugin.cancel(id: _iosFajrNotifIdBase + i);
    }

    final fajr = prayers.firstWhere(
      (p) => (p['name'] as String) == 'Fajr',
      orElse: () => prayers.first,
    );
    final fajrTime = fajr['time'] as DateTime;
    final now = DateTime.now();

    for (int i = 0; i < days.length; i++) {
      final date = DateTime(today.year, today.month, today.day + i);
      final scheduledAt = DateTime(
        date.year,
        date.month,
        date.day,
        fajrTime.hour,
        fajrTime.minute,
      );
      if (scheduledAt.isBefore(now)) continue;

      final day = days[i];
      final arabic = day['arabic'] ?? '';
      final meaning = day['body'] ?? '';
      final body = meaning.isEmpty ? arabic : '$arabic\n$meaning';
      // Same `<type>:<data>` contract NotificationNavService routes for the
      // Android live notification's extras — tapping this notification then
      // deep-links to the exact ayah/dua/glossary term/name/hadith it showed,
      // instead of just opening the app at the home screen.
      final navType = day['navType'] ?? '';
      final navData = day['navData'] ?? '';
      final payload = navType.isEmpty ? null : '$navType:$navData';

      try {
        await _plugin.zonedSchedule(
          id: _iosFajrNotifIdBase + i,
          title: day['header'] ?? '',
          body: body,
          scheduledDate: tz.TZDateTime.from(scheduledAt, tz.local),
          payload: payload,
          notificationDetails: const NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              presentBanner: true,
              presentList: true,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      } catch (e) {
        debugPrint(
            'LiveNotificationService: failed to schedule iOS Fajr content day $i: $e');
      }
    }
  }

  /// One day's rotating content block, cycling ayah → dua → glossary word →
  /// Name of Allah → hadith by day of year, and stepping through each pool
  /// on every 5-day pass so consecutive weeks never repeat.
  static Future<Map<String, String>> _contentForDate(
      DateTime date, AppLocalizations l10n, String locale) async {
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
          'body': await _readerSyncedTranslation(
            source: ayah.source,
            fallback: _translationOrEmpty(locale, ayah.translationFor),
            locale: locale,
          ),
          'source': ayah.source,
          'navType': 'ayah',
          'navData': _ayahNavData(ayah.source),
        };
      case 1:
        final dua = lockScreenDuas[step % lockScreenDuas.length];
        // Several rotating duas ARE Quran verses (their source cites e.g.
        // "Al-Baqarah 2:201") — those must match the reader word-for-word
        // too, not just the dedicated ayah days.
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderDua,
          'arabic': dua.arabic.replaceAll('\n', ' '),
          'body': await _readerSyncedTranslation(
            source: dua.source,
            fallback: _translationOrEmpty(
                locale, (l) => dua.translationFor(l).replaceAll('\n', ' ')),
            locale: locale,
          ),
          'source': dua.source,
          'navType': 'dua',
          'navData': dua.arabic,
        };
      case 2:
        final term = glossaryTermAt(step, locale);
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderWord,
          'arabic': term.arabic,
          'body': '${term.transliteration} — ${term.definition}',
          'source': '',
          'navType': 'glossary',
          'navData': term.transliteration,
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
          'navType': 'asma',
          'navData': '${name.number}',
        };
      default:
        final hadithIndex = step % shareHadiths.length;
        final hadith = shareHadiths[hadithIndex];
        return {
          'date': dateKey,
          'header': l10n.liveNotifHeaderHadith,
          'arabic': hadith.arabic,
          'body': _translationOrEmpty(locale, hadith.translationFor),
          'source': hadith.source,
          'navType': 'hadith',
          'navData': '$hadithIndex',
        };
    }
  }

  /// "surah:ayah" parsed from an ayah source label like "Al-Baqarah 2:238";
  /// empty when the label carries no reference (tap then falls back to home).
  static String _ayahNavData(String source) {
    final match = RegExp(r'(\d+):(\d+)').firstMatch(source);
    if (match == null) return '';
    return '${match.group(1)}:${match.group(2)}';
  }

  /// The reference [source] cites, e.g. "Al-Baqarah 2:201" or the range
  /// "Ta-Ha 20:25–26", translated in the SAME edition the Quran reader shows
  /// for [locale] — so notification text and reader text match word-for-word.
  ///
  /// Every successful fetch is cached in SharedPreferences, so once synced
  /// the reader's wording keeps being used even when a later payload refresh
  /// happens offline. Returns [fallback] (the bundled translation) when the
  /// source cites no Quran reference, for the Arabic locale (no translation
  /// line), and when fetching fails with nothing cached yet.
  static Future<String> _readerSyncedTranslation({
    required String source,
    required String fallback,
    required String locale,
  }) async {
    if (fallback.isEmpty) return fallback;
    final match = RegExp(r'(\d+):(\d+)(?:[–-](\d+))?').firstMatch(source);
    if (match == null) return fallback;
    final surah = int.parse(match.group(1)!);
    final first = int.parse(match.group(2)!);
    final last = int.tryParse(match.group(3) ?? '') ?? first;
    if (last < first || last - first > 2) return fallback;

    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'reader_synced_tr_${locale}_${surah}_${first}_$last';
    final parts = <String>[];
    for (int ayah = first; ayah <= last; ayah++) {
      final text = await fetchAyahTranslation(surah, ayah, locale);
      if (text == null) return prefs.getString(cacheKey) ?? fallback;
      parts.add(text);
    }
    final joined = parts.join(' ');
    await prefs.setString(cacheKey, joined);
    return joined;
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
