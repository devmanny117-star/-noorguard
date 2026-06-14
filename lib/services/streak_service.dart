import 'package:shared_preferences/shared_preferences.dart';

class WeekSummary {
  final int totalCompleted;
  final List<int> dailyCounts; // index 0 = Sunday ... 6 = Saturday
  final int bestDayIndex;

  const WeekSummary({
    required this.totalCompleted,
    required this.dailyCounts,
    required this.bestDayIndex,
  });
}

class PrayerStats {
  final int totalCompleted;
  final int totalPossible;
  final int currentStreak;
  final int longestStreak;
  final String? bestPrayer;
  final String? hardestPrayer;
  final List<int> last7Days; // oldest to newest, counts 0-5
  final int fullDays;
  final int partialDays;
  final int missedDays;

  const PrayerStats({
    required this.totalCompleted,
    required this.totalPossible,
    required this.currentStreak,
    required this.longestStreak,
    required this.bestPrayer,
    required this.hardestPrayer,
    required this.last7Days,
    required this.fullDays,
    required this.partialDays,
    required this.missedDays,
  });

  double get completionRate =>
      totalPossible > 0 ? totalCompleted / totalPossible : 0.0;
}

class StreakService {
  static const _prefix = 'prayer_log_';
  static const _keyStreak = 'streak_count';

  static const List<String> prayerNames = [
    'Fajr',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];

  String _dayKey(DateTime date) =>
      '$_prefix${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  Future<void> markPrayer(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _dayKey(DateTime.now());
    final done = prefs.getStringList(key) ?? [];
    if (!done.contains(name)) {
      done.add(name);
      await prefs.setStringList(key, done);
      await _saveStreak(prefs);
    }
  }

  Future<void> unmarkPrayer(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _dayKey(DateTime.now());
    final done = prefs.getStringList(key) ?? [];
    done.remove(name);
    await prefs.setStringList(key, done);
    await _saveStreak(prefs);
  }

  Future<List<String>> getTodayCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_dayKey(DateTime.now())) ?? [];
  }

  Future<bool> isPrayerDone(String name) async {
    final done = await getTodayCompleted();
    return done.contains(name);
  }

  Future<int> getTodayCompletedCount() async {
    final done = await getTodayCompleted();
    return done.length;
  }

  Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    await _saveStreak(prefs);
    final streak = prefs.getInt(_keyStreak) ?? 0;
    // Today completing all 5 prayers is always at least day 1
    if (streak < 1) {
      final todayDone = prefs.getStringList(_dayKey(DateTime.now())) ?? [];
      if (todayDone.length >= prayerNames.length) return 1;
    }
    return streak;
  }

  Future<WeekSummary> getWeekSummary() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);
    // Dart weekday: Mon=1...Sun=7 → start the week on Sunday
    final startOfWeek =
        todayNorm.subtract(Duration(days: todayNorm.weekday % 7));

    final counts = <int>[];
    for (int i = 0; i < 7; i++) {
      final day = startOfWeek.add(Duration(days: i));
      counts.add((prefs.getStringList(_dayKey(day)) ?? []).length);
    }

    final total = counts.fold<int>(0, (a, b) => a + b);
    int bestDayIndex = 0;
    for (int i = 1; i < 7; i++) {
      if (counts[i] > counts[bestDayIndex]) bestDayIndex = i;
    }

    return WeekSummary(
      totalCompleted: total,
      dailyCounts: counts,
      bestDayIndex: bestDayIndex,
    );
  }

  Future<PrayerStats> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);

    // Find the earliest day with any logged data
    DateTime? earliest;
    for (final key in prefs.getKeys()) {
      if (!key.startsWith(_prefix)) continue;
      final parts = key.substring(_prefix.length).split('-');
      if (parts.length != 3) continue;
      final date = DateTime(
        int.parse(parts[0]),
        int.parse(parts[1]),
        int.parse(parts[2]),
      );
      if (earliest == null || date.isBefore(earliest)) earliest = date;
    }

    int totalCompleted = 0;
    int totalPossible = 0;
    int longestStreak = 0;
    final prayerCounts = {for (final name in prayerNames) name: 0};

    if (earliest != null) {
      final daysSpan = todayNorm.difference(earliest).inDays + 1;
      totalPossible = daysSpan * prayerNames.length;
      int currentRun = 0;
      for (int i = 0; i < daysSpan; i++) {
        final day = earliest.add(Duration(days: i));
        final done = prefs.getStringList(_dayKey(day)) ?? [];
        totalCompleted += done.length;
        for (final p in done) {
          if (prayerCounts.containsKey(p)) {
            prayerCounts[p] = prayerCounts[p]! + 1;
          }
        }
        if (done.length >= prayerNames.length) {
          currentRun++;
          if (currentRun > longestStreak) longestStreak = currentRun;
        } else {
          currentRun = 0;
        }
      }
    }

    String? bestPrayer;
    String? hardestPrayer;
    if (totalCompleted > 0) {
      final sorted = prayerCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      bestPrayer = sorted.first.key;
      hardestPrayer = sorted.last.key;
    }

    final currentStreak = await getStreak();
    if (longestStreak < currentStreak) longestStreak = currentStreak;

    final last7Days = <int>[];
    for (int i = 6; i >= 0; i--) {
      final day = todayNorm.subtract(Duration(days: i));
      last7Days.add((prefs.getStringList(_dayKey(day)) ?? []).length);
    }

    int fullDays = 0;
    int partialDays = 0;
    int missedDays = 0;
    final monthStart = DateTime(today.year, today.month, 1);
    for (DateTime d = monthStart;
        !d.isAfter(todayNorm);
        d = d.add(const Duration(days: 1))) {
      final count = (prefs.getStringList(_dayKey(d)) ?? []).length;
      if (count >= prayerNames.length) {
        fullDays++;
      } else if (count > 0) {
        partialDays++;
      } else {
        missedDays++;
      }
    }

    return PrayerStats(
      totalCompleted: totalCompleted,
      totalPossible: totalPossible,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      bestPrayer: bestPrayer,
      hardestPrayer: hardestPrayer,
      last7Days: last7Days,
      fullDays: fullDays,
      partialDays: partialDays,
      missedDays: missedDays,
    );
  }

  Future<void> _saveStreak(SharedPreferences prefs) async {
    final today = DateTime.now();
    int streak = 0;

    // Walk backwards from yesterday counting fully-completed days
    DateTime day = DateTime(today.year, today.month, today.day - 1);
    while (true) {
      final completed = prefs.getStringList(_dayKey(day)) ?? [];
      if (completed.length >= prayerNames.length) {
        streak++;
        day = day.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }

    // Add today if all 5 prayers are done
    final todayDone = prefs.getStringList(_dayKey(today)) ?? [];
    if (todayDone.length >= prayerNames.length) streak++;

    await prefs.setInt(_keyStreak, streak);
  }
}
