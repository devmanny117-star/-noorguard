import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../services/streak_service.dart';

class PrayerStatsScreen extends StatefulWidget {
  const PrayerStatsScreen({super.key});

  @override
  State<PrayerStatsScreen> createState() => _PrayerStatsScreenState();
}

class _PrayerStatsScreenState extends State<PrayerStatsScreen> {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  PrayerStats? _stats;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await StreakService().getStats();
    if (mounted) setState(() => _stats = stats);
  }

  String _localizedPrayerName(AppLocalizations l10n, String name) {
    switch (name) {
      case 'Fajr':
        return l10n.fajr;
      case 'Dhuhr':
        return l10n.dhuhr;
      case 'Asr':
        return l10n.asr;
      case 'Maghrib':
        return l10n.maghrib;
      case 'Isha':
        return l10n.isha;
      default:
        return name;
    }
  }

  List<String> _last7DayLabels(AppLocalizations l10n) {
    final dayNames = [
      l10n.sun, l10n.mon, l10n.tue, l10n.wed, l10n.thu, l10n.fri, l10n.sat,
    ];
    final today = DateTime.now();
    return List.generate(7, (i) {
      final day = today.subtract(Duration(days: 6 - i));
      return dayNames[day.weekday % 7];
    });
  }

  List<String> _monthNames(AppLocalizations l10n) => [
    l10n.january, l10n.february, l10n.march, l10n.april, l10n.may, l10n.june,
    l10n.july, l10n.august, l10n.september, l10n.october, l10n.november,
    l10n.december,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final stats = _stats;

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          l10n.prayerStats,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: stats == null
            ? const Center(child: CircularProgressIndicator(color: _gold))
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (stats.totalPossible == 0) ...[
                      _buildNoStatsBanner(l10n),
                      const SizedBox(height: 16),
                    ],
                    _buildCompletionCard(l10n, stats),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _StatTile(
                            emoji: '🔥',
                            value: '${stats.currentStreak}',
                            label: l10n.currentStreak,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatTile(
                            emoji: '🏆',
                            value: '${stats.longestStreak}',
                            label: l10n.longestStreak,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _StatTile(
                            emoji: '⭐',
                            value: stats.bestPrayer != null
                                ? _localizedPrayerName(l10n, stats.bestPrayer!)
                                : l10n.notEnoughData,
                            label: l10n.bestPrayer,
                            small: stats.bestPrayer == null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatTile(
                            emoji: '💤',
                            value: stats.hardestPrayer != null
                                ? _localizedPrayerName(
                                    l10n, stats.hardestPrayer!)
                                : l10n.notEnoughData,
                            label: l10n.hardestPrayer,
                            small: stats.hardestPrayer == null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildSectionHeader(l10n.last7Days),
                    const SizedBox(height: 16),
                    _buildWeeklyChart(l10n, stats),
                    const SizedBox(height: 24),
                    _buildSectionHeader(
                      '${l10n.thisMonth} · '
                      '${_monthNames(l10n)[DateTime.now().month - 1]}',
                    ),
                    const SizedBox(height: 16),
                    _buildMonthlyBreakdown(l10n, stats),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildNoStatsBanner(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.insights_rounded, color: _gold, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.noStatsYet,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.playfairDisplay(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCompletionCard(AppLocalizations l10n, PrayerStats stats) {
    final percent = (stats.completionRate * 100).round();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.completionRate,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: _mutedText,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$percent%',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text(
                  l10n.totalPrayersCompleted(stats.totalCompleted),
                  style: GoogleFonts.lato(fontSize: 12, color: _mutedText),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: stats.completionRate.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              valueColor: const AlwaysStoppedAnimation<Color>(_gold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart(AppLocalizations l10n, PrayerStats stats) {
    final labels = _last7DayLabels(l10n);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.2)),
      ),
      child: _WeeklyBarChart(counts: stats.last7Days, labels: labels),
    );
  }

  Widget _buildMonthlyBreakdown(AppLocalizations l10n, PrayerStats stats) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            emoji: '✅',
            value: '${stats.fullDays}',
            label: l10n.fullDays,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            emoji: '🌓',
            value: '${stats.partialDays}',
            label: l10n.partialDays,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            emoji: '⬜',
            value: '${stats.missedDays}',
            label: l10n.missedDays,
          ),
        ),
      ],
    );
  }
}

// ─── Stat tile ────────────────────────────────────────────────────────────────

class _StatTile extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final bool small;

  const _StatTile({
    required this.emoji,
    required this.value,
    required this.label,
    this.small = false,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: small
                ? GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _gold,
                  )
                : GoogleFonts.playfairDisplay(
                    fontSize: 22,
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

// ─── Weekly bar chart ───────────────────────────────────────────────────────

class _WeeklyBarChart extends StatelessWidget {
  final List<int> counts; // 7 values, oldest to newest, 0-5
  final List<String> labels;

  const _WeeklyBarChart({required this.counts, required this.labels});

  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    const maxBarHeight = 90.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(7, (i) {
        final count = counts[i];
        final barHeight = count <= 0 ? 0.0 : (count / 5) * maxBarHeight;
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$count',
                style: GoogleFonts.lato(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: barHeight < 6 && count > 0 ? 6 : barHeight,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: count >= 5 ? _gold : _gold.withValues(alpha: 0.35),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                labels[i],
                style: GoogleFonts.lato(fontSize: 11, color: _mutedText),
              ),
            ],
          ),
        );
      }),
    );
  }
}
