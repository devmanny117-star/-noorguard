import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/prayer_model.dart';
import '../data/prayer_times_data.dart';
import '../services/prayer_state.dart';
import '../services/streak_service.dart';
import '../l10n/app_localizations.dart';
import 'prayer_stats_screen.dart';

// ─── Prayer detail data ───────────────────────────────────────────────────────

class _PrayerDetail {
  final int fardRakats;
  final String? sunnahLabel;
  final String timeDescription;
  final String hadith;
  final String beginnerTip;

  const _PrayerDetail({
    required this.fardRakats,
    this.sunnahLabel,
    required this.timeDescription,
    required this.hadith,
    required this.beginnerTip,
  });
}

Map<String, _PrayerDetail> _prayerDetails(AppLocalizations l10n) => {
  'Fajr': _PrayerDetail(
    fardRakats: 2,
    sunnahLabel: l10n.sunnahBefore(2),
    timeDescription: l10n.prayedAt(l10n.timePeriodDawnBeforeSunrise),
    hadith: l10n.fajrHadith,
    beginnerTip: l10n.fajrTip,
  ),
  'Dhuhr': _PrayerDetail(
    fardRakats: 4,
    sunnahLabel: '${l10n.sunnahBefore(4)} · ${l10n.sunnahAfter(2)}',
    timeDescription: l10n.prayedAt(l10n.timePeriodAfterSunPassesHighestPoint),
    hadith: l10n.dhuhrHadith,
    beginnerTip: l10n.dhuhrTip,
  ),
  'Asr': _PrayerDetail(
    fardRakats: 4,
    sunnahLabel: null,
    timeDescription: l10n.prayedAt(l10n.timePeriodLateAfternoon),
    hadith: l10n.asrHadith,
    beginnerTip: l10n.asrTip,
  ),
  'Maghrib': _PrayerDetail(
    fardRakats: 3,
    sunnahLabel: l10n.sunnahAfter(2),
    timeDescription: l10n.prayedAt(l10n.timePeriodJustAfterSunset),
    hadith: l10n.maghribHadith,
    beginnerTip: l10n.maghribTip,
  ),
  'Isha': _PrayerDetail(
    fardRakats: 4,
    sunnahLabel: l10n.sunnahAfter(2),
    timeDescription: l10n.prayedAt(l10n.timePeriodNightBeforeMidnight),
    hadith: l10n.ishaHadith,
    beginnerTip: l10n.ishaTip,
  ),
};

// ─── Screen ───────────────────────────────────────────────────────────────────

class PrayersScreen extends StatefulWidget {
  const PrayersScreen({super.key});

  @override
  State<PrayersScreen> createState() => _PrayersScreenState();
}

class _PrayersScreenState extends State<PrayersScreen> {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  List<Prayer> _prayers = [];
  bool _loading = true;

  WeekSummary? _weekSummary;
  bool _weekExpanded = true;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
    _loadWeekSummary();
  }

  Future<void> _loadPrayerTimes() async {
    try {
      final prayers = await fetchPrayerTimes();
      if (mounted) setState(() { _prayers = prayers; _loading = false; });
    } catch (_) {
      if (mounted) setState(() { _prayers = todaysPrayers; _loading = false; });
    }
  }

  Future<void> _loadWeekSummary() async {
    final summary = await StreakService().getWeekSummary();
    if (mounted) setState(() => _weekSummary = summary);
  }

  String _formattedDate(BuildContext context) {
    final localeCode = Localizations.localeOf(context).toString();
    return DateFormat('EEEE, MMMM d', localeCode).format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PrayerState>();
    final completed = state.completedCount;

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            tooltip: l10n.prayerStats,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PrayerStatsScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: _gold))
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildHeader(context, state, completed),
                  ),
                  if (_weekSummary != null)
                    SliverToBoxAdapter(
                      child: _buildWeeklySummary(context),
                    ),
                  if (state.beginnerMode)
                    SliverToBoxAdapter(
                      child: _buildBeginnerBanner(context),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) {
                          final name = _prayers[i].name;
                          final key = name.toLowerCase();
                          return _PrayerCard(
                            prayer: _prayers[i],
                            isCompleted: state.prayers[name] ?? false,
                            notifEnabled: state.notifications[key] ?? true,
                            onToggle: () async {
                              await context
                                  .read<PrayerState>()
                                  .togglePrayer(name, context);
                              _loadWeekSummary();
                            },
                            onToggleNotif: () => context
                                .read<PrayerState>()
                                .togglePrayerNotification(
                                    key, !(state.notifications[key] ?? true)),
                          );
                        },
                        childCount: _prayers.length,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildWeeklySummary(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final summary = _weekSummary!;
    final dayNames = [
      l10n.sun, l10n.mon, l10n.tue, l10n.wed, l10n.thu, l10n.fri, l10n.sat,
    ];
    final bestIndex = summary.bestDayIndex;
    final bestCount = summary.dailyCounts[bestIndex];

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _weekExpanded = !_weekExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        color: _gold, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      l10n.thisWeek,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _gold,
                      ),
                    ),
                  ],
                ),
                AnimatedRotation(
                  turns: _weekExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: _weekExpanded
                ? Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.weeklyProgress(summary.totalCompleted),
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: (summary.totalCompleted / 35).clamp(0.0, 1.0),
                            minHeight: 7,
                            backgroundColor: Colors.white.withValues(alpha: 0.1),
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(_gold),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                color: _gold, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              '${l10n.bestDay}: ${dayNames[bestIndex]} '
                              '($bestCount/5)',
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: _mutedText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildBeginnerBanner(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1F0A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF4CAF50).withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          const Text('🌱', style: TextStyle(fontSize: 15)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.beginnerModePrayersTip,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.85),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, PrayerState state, int completed) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formattedDate(context),
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _gold.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _gold.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 4),
                    Text(
                      l10n.streakDays(state.streakCount),
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: _gold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.prayersCompleted(completed),
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: completed / 5,
              minHeight: 7,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(_gold),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Prayer card ──────────────────────────────────────────────────────────────

class _PrayerCard extends StatefulWidget {
  final Prayer prayer;
  final bool isCompleted;
  final bool notifEnabled;
  final VoidCallback onToggle;
  final VoidCallback onToggleNotif;

  const _PrayerCard({
    required this.prayer,
    required this.isCompleted,
    required this.notifEnabled,
    required this.onToggle,
    required this.onToggleNotif,
  });

  @override
  State<_PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<_PrayerCard> {
  bool _expanded = false;

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final detail = _prayerDetails(l10n)[widget.prayer.name];
    final isMissed = widget.prayer.isPassed && !widget.isCompleted;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: widget.isCompleted ? const Color(0xFF1A2510) : _cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: widget.isCompleted
                ? _gold.withValues(alpha: 0.6)
                : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: widget.isCompleted
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.18),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Always-visible header row ──
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.prayer.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: widget.isCompleted ? _gold : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.prayer.arabicName,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 17,
                            color: _gold.withValues(
                                alpha: widget.isCompleted ? 1.0 : 0.7),
                          ),
                        ),
                        if (isMissed) ...[
                          const SizedBox(height: 6),
                          _MissedBadge(label: l10n.missedPrayerBadge),
                        ],
                      ],
                    ),
                  ),
                  Text(
                    widget.prayer.time,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isMissed
                          ? Colors.white.withValues(alpha: 0.35)
                          : Colors.white.withValues(
                              alpha: widget.isCompleted ? 0.5 : 0.85),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Bell — inner GestureDetector wins the arena,
                  // so tapping here does NOT expand the card.
                  GestureDetector(
                    onTap: widget.onToggleNotif,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        widget.notifEnabled
                            ? Icons.notifications_rounded
                            : Icons.notifications_off_outlined,
                        key: ValueKey(widget.notifEnabled),
                        color: widget.notifEnabled
                            ? _gold
                            : Colors.white.withValues(alpha: 0.25),
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Checkmark — inner GestureDetector wins the arena,
                  // so tapping here does NOT expand the card.
                  GestureDetector(
                    onTap: widget.onToggle,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isCompleted ? _gold : Colors.transparent,
                        border: Border.all(
                          color: widget.isCompleted
                              ? _gold
                              : Colors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: widget.isCompleted
                          ? const Icon(Icons.check_rounded,
                              color: Colors.black, size: 22)
                          : null,
                    ),
                  ),
                ],
              ),

              // ── Qada (make-up) banner for missed prayers ──
              if (isMissed) ...[
                const SizedBox(height: 12),
                _QadaBanner(
                  explanation: l10n.qadaExplanation,
                  buttonLabel: l10n.makeItUp,
                  onMakeItUp: widget.onToggle,
                ),
              ],

              // ── Expand chevron hint ──
              Align(
                alignment: Alignment.center,
                child: AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 280),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white.withValues(alpha: 0.3),
                    size: 20,
                  ),
                ),
              ),

              // ── Expandable detail section ──
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _expanded && detail != null
                    ? _buildDetail(detail, l10n)
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(_PrayerDetail detail, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Container(height: 1, color: _gold.withValues(alpha: 0.2)),
        const SizedBox(height: 14),

        // ── Rakat pills ──
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _RakatPill(
              label: l10n.fardRakats(detail.fardRakats),
              filled: true,
            ),
            if (detail.sunnahLabel != null)
              _RakatPill(label: detail.sunnahLabel!, filled: false),
          ],
        ),
        const SizedBox(height: 12),

        // ── Time description ──
        Text(
          detail.timeDescription,
          style: GoogleFonts.lato(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: _mutedText,
          ),
        ),
        const SizedBox(height: 14),

        // ── Hadith quote box ──
        Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          decoration: BoxDecoration(
            color: _gold.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              left: BorderSide(color: _gold, width: 3),
            ),
          ),
          child: Text(
            '"${detail.hadith}"',
            style: GoogleFonts.playfairDisplay(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 14),

        // ── Beginner tip ──
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🌱', style: TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.newMuslimTip,
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    detail.beginnerTip,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: _mutedText,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

// ─── Rakat pill ───────────────────────────────────────────────────────────────

class _RakatPill extends StatelessWidget {
  final String label;
  final bool filled;

  const _RakatPill({required this.label, required this.filled});

  static const _gold = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: filled ? _gold.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: filled ? _gold : _gold.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _gold,
        ),
      ),
    );
  }
}

// ─── Missed prayer badge ────────────────────────────────────────────────────

class _MissedBadge extends StatelessWidget {
  final String label;

  const _MissedBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Colors.white.withValues(alpha: 0.55),
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

// ─── Qada (make-up prayer) banner ───────────────────────────────────────────

class _QadaBanner extends StatelessWidget {
  final String explanation;
  final String buttonLabel;
  final VoidCallback onMakeItUp;

  const _QadaBanner({
    required this.explanation,
    required this.buttonLabel,
    required this.onMakeItUp,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              explanation,
              style: GoogleFonts.lato(
                fontSize: 12,
                color: _mutedText,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: onMakeItUp,
            style: TextButton.styleFrom(
              backgroundColor: _gold.withValues(alpha: 0.15),
              foregroundColor: _gold,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              buttonLabel,
              style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
