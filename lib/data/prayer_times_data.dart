import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prayer_model.dart';
import '../services/location_service.dart';
import '../services/prayer_times_cache.dart';

// Last location a fetch succeeded with, so fetchPrayerTimesWindow can query
// the same city without needing to re-resolve the device location.
const _lastCityKey = 'prayer_loc_city';
const _lastCountryKey = 'prayer_loc_country';

/// Thrown when no city is known at all (no explicit argument, nothing
/// remembered from a previous fetch, no saved Qibla location). Callers
/// should surface the city picker — there is deliberately no default city.
class NoPrayerLocationException implements Exception {
  @override
  String toString() => 'NoPrayerLocationException: no prayer city available';
}

/// Resolves the city/country to fetch for when the caller didn't pass one:
/// the last city a fetch succeeded with, else the saved Qibla city.
Future<PrayerCity> _resolveCity() async {
  final prefs = await SharedPreferences.getInstance();
  final lastCity = prefs.getString(_lastCityKey);
  final lastCountry = prefs.getString(_lastCountryKey);
  if (lastCity != null && lastCountry != null) {
    return PrayerCity(city: lastCity, country: lastCountry);
  }
  final saved = await LocationService().savedPrayerCity();
  if (saved != null) return saved;
  throw NoPrayerLocationException();
}

Future<List<Prayer>> fetchPrayerTimes({
  String? city,
  String? country,
}) async {
  if (city == null || country == null) {
    final resolved = await _resolveCity();
    city = resolved.city;
    country = resolved.country;
  }
  final uri = Uri.parse(
    'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=2',
  );
  final response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to load prayer times: ${response.statusCode}');
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final timings = body['data']['timings'] as Map<String, dynamic>;

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_lastCityKey, city);
  await prefs.setString(_lastCountryKey, country);

  const prayerKeys = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  const arabicNames = {
    'Fajr': 'الفجر',
    'Dhuhr': 'الظهر',
    'Asr': 'العصر',
    'Maghrib': 'المغرب',
    'Isha': 'العشاء',
  };
  const iconPaths = {
    'Fajr': 'fajr',
    'Dhuhr': 'dhuhr',
    'Asr': 'asr',
    'Maghrib': 'maghrib',
    'Isha': 'isha',
  };

  final now = DateTime.now();
  final nowMinutes = now.hour * 60 + now.minute;

  // Parse each prayer's time into total minutes for comparison
  final minuteMap = <String, int>{};
  for (final key in prayerKeys) {
    final raw = timings[key] as String; // "05:23" (24-hour)
    final parts = raw.split(':');
    minuteMap[key] = int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }

  // Find the first prayer that hasn't passed yet; if all passed, wrap to Fajr
  final nextKey = prayerKeys.firstWhere(
    (k) => minuteMap[k]! > nowMinutes,
    orElse: () => prayerKeys.first,
  );

  final prayers = prayerKeys.map((key) {
    final raw = timings[key] as String;
    final parts = raw.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return Prayer(
      name: key,
      arabicName: arabicNames[key]!,
      time: _formatTime(hour, minute),
      iconPath: iconPaths[key]!,
      isNext: key == nextKey,
      isPassed: minuteMap[key]! <= nowMinutes && key != nextKey,
    );
  }).toList();

  // Every successful fetch refreshes the cold-start cache, so the Next
  // Prayer card can paint instantly on the next app open. Failure to write
  // must never fail the fetch itself.
  try {
    await PrayerTimesCache.save(prayers, city: '$city, $country');
  } catch (_) {}

  return prayers;
}

String _formatTime(int hour, int minute) {
  final period = hour < 12 ? 'AM' : 'PM';
  final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
}

/// One day's five prayer times as exact [DateTime]s, keyed by prayer name.
class DailyPrayerTimes {
  final DateTime date;
  final Map<String, DateTime> times;
  DailyPrayerTimes(this.date, this.times);
}

/// Prayer times for [days] consecutive days starting today, from AlAdhan's
/// monthly calendar endpoint (one request per calendar month touched, so at
/// most two). Queries the last city [fetchPrayerTimes] succeeded with, else
/// the saved Qibla city; throws [NoPrayerLocationException] when neither
/// exists. Used by the iOS multi-day reminder window.
Future<List<DailyPrayerTimes>> fetchPrayerTimesWindow({int days = 12}) async {
  final resolved = await _resolveCity();
  final city = resolved.city;
  final country = resolved.country;

  final now = DateTime.now();
  final first = DateTime(now.year, now.month, now.day);
  final last = first.add(Duration(days: days - 1));
  final months = <DateTime>[DateTime(first.year, first.month)];
  if (last.month != first.month || last.year != first.year) {
    months.add(DateTime(last.year, last.month));
  }

  const prayerKeys = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  final byDate = <String, Map<String, DateTime>>{};
  for (final month in months) {
    final uri = Uri.parse(
      'https://api.aladhan.com/v1/calendarByCity/${month.year}/${month.month}'
      '?city=$city&country=$country&method=2',
    );
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load prayer calendar: ${response.statusCode}');
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    for (final day in body['data'] as List<dynamic>) {
      final gregorian = day['date']['gregorian']['date'] as String; // DD-MM-YYYY
      final dateParts = gregorian.split('-');
      final date = DateTime(
        int.parse(dateParts[2]),
        int.parse(dateParts[1]),
        int.parse(dateParts[0]),
      );
      final timings = day['timings'] as Map<String, dynamic>;
      final times = <String, DateTime>{};
      for (final key in prayerKeys) {
        // Calendar timings arrive as "05:23 (PDT)" — clock time first.
        final raw = (timings[key] as String).split(' ').first;
        final timeParts = raw.split(':');
        times[key] = DateTime(
          date.year, date.month, date.day,
          int.parse(timeParts[0]), int.parse(timeParts[1]),
        );
      }
      byDate[_dateKey(date)] = times;
    }
  }

  return [
    for (var i = 0; i < days; i++)
      if (byDate[_dateKey(first.add(Duration(days: i)))] case final times?)
        DailyPrayerTimes(first.add(Duration(days: i)), times),
  ];
}

String _dateKey(DateTime d) => '${d.year}-${d.month}-${d.day}';
