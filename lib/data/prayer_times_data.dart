import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prayer_model.dart';

Future<List<Prayer>> fetchPrayerTimes({
  String city = 'Sacramento',
  String country = 'US',
}) async {
  final uri = Uri.parse(
    'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=2',
  );
  final response = await http.get(uri);
  if (response.statusCode != 200) {
    throw Exception('Failed to load prayer times: ${response.statusCode}');
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final timings = body['data']['timings'] as Map<String, dynamic>;

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

  return prayerKeys.map((key) {
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
}

String _formatTime(int hour, int minute) {
  final period = hour < 12 ? 'AM' : 'PM';
  final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
}
