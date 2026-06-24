import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../services/tasbih_service.dart';

class TasbihStatsScreen extends StatefulWidget {
  const TasbihStatsScreen({super.key});

  @override
  State<TasbihStatsScreen> createState() => _TasbihStatsScreenState();
}

class _TasbihStatsScreenState extends State<TasbihStatsScreen> {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  TasbihStats? _stats;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await TasbihService().getStats();
    if (mounted) setState(() => _stats = stats);
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
          l10n.tasbihStatsTitle,
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
                    if (stats.allTimeTotal == 0) ...[
                      _buildNoStatsBanner(l10n),
                      const SizedBox(height: 16),
                    ],
                    _buildTodayCard(l10n, stats),
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
                    const SizedBox(height: 24),
                    _buildSectionHeader(l10n.last7Days),
                    const SizedBox(height: 16),
                    _buildWeeklyChart(l10n, stats),
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
              l10n.tasbihNoActivityYetMessage,
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

  Widget _buildTodayCard(AppLocalizations l10n, TasbihStats stats) {
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
            l10n.tasbihDailyTotalLabel,
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
                '${stats.todayTaps}',
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
                  '${stats.todayRounds} ${l10n.tasbihRoundsTodayLabel.toLowerCase()}',
                  style: GoogleFonts.lato(fontSize: 12, color: _mutedText),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 0.8, color: _gold.withValues(alpha: 0.18)),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                l10n.tasbihAllTimeTotalLabel,
                style: GoogleFonts.lato(fontSize: 13, color: _mutedText),
              ),
              const Spacer(),
              Text(
                '${stats.allTimeTotal}',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart(AppLocalizations l10n, TasbihStats stats) {
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
}

// ─── Stat tile ────────────────────────────────────────────────────────────────

class _StatTile extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;

  const _StatTile({required this.emoji, required this.value, required this.label});

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
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: GoogleFonts.lato(fontSize: 12, color: _mutedText)),
        ],
      ),
    );
  }
}

// ─── Weekly bar chart ───────────────────────────────────────────────────────

class _WeeklyBarChart extends StatelessWidget {
  final List<int> counts; // 7 values, oldest to newest
  final List<String> labels;

  const _WeeklyBarChart({required this.counts, required this.labels});

  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    const maxBarHeight = 90.0;
    final scale = counts.fold<int>(1, (m, c) => c > m ? c : m);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(7, (i) {
        final count = counts[i];
        final barHeight = count <= 0 ? 0.0 : (count / scale) * maxBarHeight;
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
                  color: count >= scale ? _gold : _gold.withValues(alpha: 0.35),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
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
