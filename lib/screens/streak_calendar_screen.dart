import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class StreakCalendarScreen extends StatefulWidget {
  const StreakCalendarScreen({super.key});

  @override
  State<StreakCalendarScreen> createState() => _StreakCalendarScreenState();
}

class _StreakCalendarScreenState extends State<StreakCalendarScreen> {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);
  static const _prefix = 'prayer_log_';

  List<String> _weekDayLabels(AppLocalizations l10n) =>
      [l10n.sun, l10n.mon, l10n.tue, l10n.wed, l10n.thu, l10n.fri, l10n.sat];

  List<String> _monthNames(AppLocalizations l10n) => [
    l10n.january, l10n.february, l10n.march, l10n.april, l10n.may, l10n.june,
    l10n.july, l10n.august, l10n.september, l10n.october, l10n.november, l10n.december,
  ];

  late DateTime _displayMonth;
  Map<String, int> _completionMap = {};
  int _currentStreak = 0;
  int _longestStreak = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _displayMonth = DateTime(now.year, now.month);
    _load();
  }

  String _dayKey(DateTime date) =>
      '$_prefix${date.year}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  Future<void> _load() async {
    if (mounted) setState(() => _loading = true);
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);

    // Completion counts for displayed month
    final map = <String, int>{};
    final daysInMonth =
        DateUtils.getDaysInMonth(_displayMonth.year, _displayMonth.month);
    for (int d = 1; d <= daysInMonth; d++) {
      final date = DateTime(_displayMonth.year, _displayMonth.month, d);
      final key = _dayKey(date);
      map[key] = (prefs.getStringList(key) ?? []).length;
    }

    // Current streak — matching StreakService logic
    int current = 0;
    DateTime check =
        todayNorm.subtract(const Duration(days: 1));
    while (true) {
      final count = (prefs.getStringList(_dayKey(check)) ?? []).length;
      if (count >= 5) {
        current++;
        check = check.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    if ((prefs.getStringList(_dayKey(todayNorm)) ?? []).length >= 5) current++;

    // Longest streak — scan forward over last 365 days
    int longest = 0;
    int temp = 0;
    final scanStart = todayNorm.subtract(const Duration(days: 364));
    for (int i = 0; i < 365; i++) {
      final day = scanStart.add(Duration(days: i));
      final count = (prefs.getStringList(_dayKey(day)) ?? []).length;
      if (count >= 5) {
        temp++;
        if (temp > longest) longest = temp;
      } else {
        temp = 0;
      }
    }
    longest = longest < current ? current : longest;

    if (mounted) {
      setState(() {
        _completionMap = map;
        _currentStreak = current;
        _longestStreak = longest;
        _loading = false;
      });
    }
  }

  void _prevMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month - 1);
    });
    _load();
  }

  void _nextMonth() {
    final now = DateTime.now();
    final nextMonth = DateTime(_displayMonth.year, _displayMonth.month + 1);
    if (nextMonth.isAfter(DateTime(now.year, now.month))) return;
    setState(() => _displayMonth = nextMonth);
    _load();
  }

  bool get _canGoForward {
    final now = DateTime.now();
    return _displayMonth.isBefore(DateTime(now.year, now.month));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: _gold))
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPageHeader(l10n),
                    const SizedBox(height: 20),
                    _buildStreakBadges(l10n),
                    const SizedBox(height: 24),
                    _buildMonthNav(l10n),
                    const SizedBox(height: 16),
                    _buildWeekdayLabels(l10n),
                    const SizedBox(height: 8),
                    _buildCalendarGrid(),
                    const SizedBox(height: 24),
                    _buildLegend(l10n),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildPageHeader(AppLocalizations l10n) {
    return Text(
      l10n.prayerHistory,
      style: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildStreakBadges(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            emoji: '🔥',
            value: '$_currentStreak',
            label: l10n.currentStreak,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            emoji: '🏆',
            value: '$_longestStreak',
            label: l10n.longestStreak,
          ),
        ),
      ],
    );
  }

  Widget _buildMonthNav(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _prevMonth,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.chevron_left_rounded,
                color: _gold, size: 22),
          ),
        ),
        Text(
          '${_monthNames(l10n)[_displayMonth.month - 1]} ${_displayMonth.year}',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: _canGoForward ? _nextMonth : null,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.chevron_right_rounded,
                color: _canGoForward ? _gold : _mutedText.withValues(alpha: 0.4),
                size: 22),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayLabels(AppLocalizations l10n) {
    return Row(
      children: _weekDayLabels(l10n).map((label) {
        return Expanded(
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _mutedText,
                letterSpacing: 0.3,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);
    final daysInMonth =
        DateUtils.getDaysInMonth(_displayMonth.year, _displayMonth.month);
    final firstDay = DateTime(_displayMonth.year, _displayMonth.month, 1);
    // Dart weekday: 1=Mon...7=Sun → convert to 0=Sun...6=Sat
    final startOffset = firstDay.weekday % 7;

    final cells = <Widget>[];

    // Empty leading cells
    for (int i = 0; i < startOffset; i++) {
      cells.add(const SizedBox());
    }

    // Day cells
    for (int d = 1; d <= daysInMonth; d++) {
      final date = DateTime(_displayMonth.year, _displayMonth.month, d);
      final isToday = date.isAtSameMomentAs(todayNorm);
      final isFuture = date.isAfter(todayNorm);
      final key = _dayKey(date);
      final count = _completionMap[key] ?? 0;

      cells.add(_DayCell(
        day: d,
        count: count,
        isToday: isToday,
        isFuture: isFuture,
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 6,
      crossAxisSpacing: 4,
      childAspectRatio: 0.85,
      children: cells,
    );
  }

  Widget _buildLegend(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.legend,
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _mutedText,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _LegendItem(color: _gold, filled: true, label: l10n.allFivePrayers),
              const SizedBox(width: 20),
              _LegendItem(
                  color: _gold, filled: false, label: l10n.partialPrayers),
              const SizedBox(width: 20),
              _LegendItem(
                  color: const Color(0xFF243040),
                  filled: true,
                  label: l10n.none),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Day cell ─────────────────────────────────────────────────────────────────

class _DayCell extends StatelessWidget {
  final int day;
  final int count;
  final bool isToday;
  final bool isFuture;

  const _DayCell({
    required this.day,
    required this.count,
    required this.isToday,
    required this.isFuture,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _navy = Color(0xFF0D1B2A);

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color border;
    final Color textColor;

    if (isFuture) {
      bg = const Color(0xFF111923);
      border = Colors.transparent;
      textColor = Colors.white.withValues(alpha: 0.18);
    } else if (count >= 5) {
      bg = _gold;
      border = _gold;
      textColor = _navy;
    } else if (count > 0) {
      bg = _gold.withValues(alpha: 0.1);
      border = _gold.withValues(alpha: 0.6);
      textColor = _gold;
    } else {
      bg = const Color(0xFF152030);
      border = Colors.transparent;
      textColor = Colors.white.withValues(alpha: 0.5);
    }

    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isToday && count < 5 ? _gold : border,
          width: isToday && count < 5 ? 1.5 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w500,
              color: textColor,
            ),
          ),
          if (isToday) ...[
            const SizedBox(height: 2),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: count >= 5 ? _navy : _gold,
              ),
            ),
          ] else if (!isFuture && count > 0 && count < 5) ...[
            const SizedBox(height: 2),
            Text(
              '$count/5',
              style: GoogleFonts.lato(
                fontSize: 8,
                color: _gold.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Stat card ────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;

  const _StatCard({
    required this.emoji,
    required this.value,
    required this.label,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.lato(fontSize: 12, color: _mutedText),
          ),
        ],
      ),
    );
  }
}

// ─── Legend item ──────────────────────────────────────────────────────────────

class _LegendItem extends StatelessWidget {
  final Color color;
  final bool filled;
  final String label;

  const _LegendItem({
    required this.color,
    required this.filled,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: filled ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color, width: 1.5),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 11,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
