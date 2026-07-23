import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prayer_model.dart';

/// The last successfully fetched prayer times, restored from disk.
class CachedPrayerTimes {
  final List<Prayer> prayers;
  final String city;
  final DateTime date;

  CachedPrayerTimes({
    required this.prayers,
    required this.city,
    required this.date,
  });

  /// False when the cache was written on an earlier day — still worth
  /// showing instantly (clock times drift only a minute or two per day),
  /// but callers should treat it as a placeholder for the fresh fetch.
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

/// Persists the last successful prayer-times fetch so cold starts can paint
/// the Next Prayer card immediately instead of spinning through the
/// GPS + network round-trip. Written by every successful [fetchPrayerTimes];
/// read once at screen startup.
class PrayerTimesCache {
  static const _cacheKey = 'prayer_times_cache_v1';

  static Future<void> save(List<Prayer> prayers, {required String city}) async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _cacheKey,
      jsonEncode({
        'city': city,
        'dateMillis':
            DateTime(now.year, now.month, now.day).millisecondsSinceEpoch,
        'prayers': [
          for (final p in prayers)
            {
              'name': p.name,
              'arabicName': p.arabicName,
              'time': p.time,
              'iconPath': p.iconPath,
            },
        ],
      }),
    );
  }

  /// Null when nothing is cached yet (or the entry is unreadable). The
  /// next/passed flags are recomputed against the current clock rather than
  /// restored, so a cache from this morning still highlights the right
  /// prayer tonight.
  static Future<CachedPrayerTimes?> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_cacheKey);
      if (raw == null) return null;
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final entries = (decoded['prayers'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      if (entries.isEmpty) return null;

      final now = DateTime.now();
      final nowMinutes = now.hour * 60 + now.minute;
      final minutes = [for (final e in entries) _toMinutes(e['time'] as String)];
      var nextIndex = minutes.indexWhere((m) => m > nowMinutes);
      if (nextIndex == -1) nextIndex = 0;

      return CachedPrayerTimes(
        city: decoded['city'] as String? ?? '',
        date: DateTime.fromMillisecondsSinceEpoch(
            (decoded['dateMillis'] as num).toInt()),
        prayers: [
          for (var i = 0; i < entries.length; i++)
            Prayer(
              name: entries[i]['name'] as String,
              arabicName: entries[i]['arabicName'] as String? ?? '',
              time: entries[i]['time'] as String,
              iconPath: entries[i]['iconPath'] as String? ?? '',
              isNext: i == nextIndex,
              isPassed: minutes[i] <= nowMinutes && i != nextIndex,
            ),
        ],
      );
    } catch (_) {
      return null;
    }
  }

  /// "5:23 AM" → minutes since midnight.
  static int _toMinutes(String time) {
    final parts = time.split(' ');
    final clock = parts[0].split(':');
    var hour = int.parse(clock[0]);
    final minute = int.parse(clock[1]);
    final isPm = parts.length > 1 && parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    return hour * 60 + minute;
  }
}
