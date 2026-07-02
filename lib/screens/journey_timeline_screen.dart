import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../models/surah_model.dart';
import '../widgets/geometric_pattern_painter.dart';
import 'duas_screen.dart';
import 'how_to_pray_screen.dart';
import 'islamic_glossary_screen.dart';
import 'new_muslim_hub_screen.dart';
import 'shahada_screen.dart';
import 'surah_screen.dart';
import 'why_do_we_screen.dart';
import 'wudu_guide_screen.dart';

const _kNavy   = Color(0xFF0D1B2A);
const _kCard   = Color(0xFF0f1e30);
const _kGold   = Color(0xFFC9A84C);
const _kCream  = Color(0xFFF5EFE6);
const _kGrey   = Color(0xFF6B7A8D);

const _kAlFatiha = Surah(
  number: 1,
  name: 'الفاتحة',
  englishName: 'Al-Fatiha',
  englishNameTranslation: 'The Opening',
  numberOfAyahs: 7,
  revelationType: 'Meccan',
);

// ── Public entry point ────────────────────────────────────────────────────────

class JourneyTimelineScreen extends StatefulWidget {
  const JourneyTimelineScreen({super.key});

  @override
  State<JourneyTimelineScreen> createState() => _JourneyTimelineScreenState();
}

class _JourneyTimelineScreenState extends State<JourneyTimelineScreen> {
  final List<bool> _month1Tasks = List.filled(7, false);

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      for (int i = 0; i < 7; i++) {
        _month1Tasks[i] = prefs.getBool('journey_task_month1_task$i') ?? false;
      }
    });
  }

  Future<void> _toggleTask(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final v = !_month1Tasks[index];
    await prefs.setBool('journey_task_month1_task$index', v);
    if (mounted) setState(() => _month1Tasks[index] = v);
  }

  Widget _taskScreen(int index) {
    switch (index) {
      case 0: return const ShahadaScreen();
      case 1: return const WuduGuideScreen();
      case 2: return const SurahScreen(surah: _kAlFatiha);
      case 3: return const HowToPrayScreen();
      case 4: return const DuasScreen();
      case 5: return const IslamicGlossaryScreen();
      case 6: return const WhyDoWeScreen();
      default: return const NewMuslimHubScreen();
    }
  }

  int get _done => _month1Tasks.where((t) => t).length;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: _kNavy,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──────────────────────────────────────────────────────
            SliverAppBar(
              backgroundColor: _kNavy,
              surfaceTintColor: Colors.transparent,
              pinned: true,
              expandedHeight: 110,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: _kCream, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.only(left: 20, bottom: 14),
                title: Text(
                  l10n.journeyTimelineTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: _kCream,
                  ),
                ),
                background: const Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: GeometricPatternPainter(
                          color: _kGold,
                          alpha: 0.05,
                        ),
                      ),
                    ),
                    // Gradient fade at bottom so title is legible
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, _kNavy],
                            stops: [0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Timeline ────────────────────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Month 1 — active
                  _MonthBlock(
                    monthName: l10n.journeyMonth1Name,
                    badgeIcon: Icons.nightlight_round,
                    status: _done == 7
                        ? _MonthStatus.completed
                        : _MonthStatus.inProgress,
                    statusLabel: _done == 7
                        ? l10n.journeyCompleted
                        : l10n.journeyInProgress,
                    done: _done,
                    total: 7,
                    progressLabel: l10n.journeyTasksCompleted(_done, 7),
                    tasks: _buildMonth1Tasks(l10n),
                    taskChecked: _month1Tasks,
                    onToggle: _toggleTask,
                    onNavigate: (i) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => _taskScreen(i)),
                    ),
                    isLocked: false,
                  ),

                  const _TimelineDot(),

                  // Month 2 — locked
                  _MonthBlock(
                    monthName: l10n.journeyMonth2Name,
                    badgeIcon: Icons.star_rounded,
                    status: _MonthStatus.locked,
                    statusLabel: l10n.journeyLocked,
                    done: 0,
                    total: 7,
                    progressLabel: l10n.journeyTasksCompleted(0, 7),
                    tasks: _buildMonth2Tasks(l10n),
                    taskChecked: List.filled(7, false),
                    onToggle: (_) {},
                    onNavigate: (_) {},
                    isLocked: true,
                  ),

                  const _TimelineDot(),

                  // Month 3 — locked
                  _MonthBlock(
                    monthName: l10n.journeyMonth3Name,
                    badgeIcon: Icons.mosque_rounded,
                    status: _MonthStatus.locked,
                    statusLabel: l10n.journeyLocked,
                    done: 0,
                    total: 7,
                    progressLabel: l10n.journeyTasksCompleted(0, 7),
                    tasks: _buildMonth3Tasks(l10n),
                    taskChecked: List.filled(7, false),
                    onToggle: (_) {},
                    onNavigate: (_) {},
                    isLocked: true,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _buildMonth1Tasks(AppLocalizations l10n) => [
    l10n.beginnerEssential6, // Understanding the Shahada
    l10n.beginnerEssential2, // Learn Wudu
    l10n.beginnerEssential4, // Al-Fatiha
    l10n.beginnerEssential3, // How to Pray
    l10n.beginnerEssential5, // Daily Duas
    l10n.beginnerEssential7, // Glossary
    l10n.whyDoWe, // Why Do We...
  ];

  List<String> _buildMonth2Tasks(AppLocalizations l10n) => [
    l10n.journeyTask2_1, l10n.journeyTask2_2, l10n.journeyTask2_3,
    l10n.journeyTask2_4, l10n.journeyTask2_5, l10n.journeyTask2_6,
    l10n.journeyTask2_7,
  ];

  List<String> _buildMonth3Tasks(AppLocalizations l10n) => [
    l10n.journeyTask3_1, l10n.journeyTask3_2, l10n.journeyTask3_3,
    l10n.journeyTask3_4, l10n.journeyTask3_5, l10n.journeyTask3_6,
    l10n.journeyTask3_7,
  ];
}

// ── Month status ──────────────────────────────────────────────────────────────

enum _MonthStatus { completed, inProgress, locked }

// ── Month block ───────────────────────────────────────────────────────────────

class _MonthBlock extends StatefulWidget {
  final String monthName;
  final IconData badgeIcon;
  final _MonthStatus status;
  final String statusLabel;
  final int done;
  final int total;
  final String progressLabel;
  final List<String> tasks;
  final List<bool> taskChecked;
  final void Function(int) onToggle;
  final void Function(int) onNavigate;
  final bool isLocked;

  const _MonthBlock({
    required this.monthName,
    required this.badgeIcon,
    required this.status,
    required this.statusLabel,
    required this.done,
    required this.total,
    required this.progressLabel,
    required this.tasks,
    required this.taskChecked,
    required this.onToggle,
    required this.onNavigate,
    required this.isLocked,
  });

  @override
  State<_MonthBlock> createState() => _MonthBlockState();
}

class _MonthBlockState extends State<_MonthBlock>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _ctrl;
  late final Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _expanded = !widget.isLocked;
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: _expanded ? 1.0 : 0.0,
    );
    _expandAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
  }

  Color get _borderColor {
    switch (widget.status) {
      case _MonthStatus.completed:
        return _kGold;
      case _MonthStatus.inProgress:
        return _kGold.withValues(alpha: 0.55);
      case _MonthStatus.locked:
        return const Color(0xFF1E3348);
    }
  }

  Color get _bgColor {
    switch (widget.status) {
      case _MonthStatus.completed:
        return _kGold.withValues(alpha: 0.08);
      case _MonthStatus.inProgress:
        return _kCard;
      case _MonthStatus.locked:
        return const Color(0xFF0a1624);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLocked = widget.isLocked;
    final progress = widget.total > 0 ? widget.done / widget.total : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: 1),
        boxShadow: widget.status == _MonthStatus.inProgress
            ? [
                BoxShadow(
                  color: _kGold.withValues(alpha: 0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          children: [
            // Geometric pattern
            Positioned.fill(
              child: CustomPaint(
                painter: GeometricPatternPainter(
                  color: _kGold,
                  alpha: isLocked ? 0.03 : 0.06,
                ),
              ),
            ),

            // Lock overlay for future months
            if (isLocked)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: _kNavy.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header row ─────────────────────────────────────────────
                GestureDetector(
                  onTap: _toggle,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Badge icon circle
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isLocked
                                ? _kGold.withValues(alpha: 0.06)
                                : _kGold.withValues(alpha: 0.14),
                            border: Border.all(
                              color: isLocked
                                  ? _kGold.withValues(alpha: 0.18)
                                  : _kGold.withValues(alpha: 0.55),
                              width: 1,
                            ),
                          ),
                          child: isLocked
                              ? Icon(Icons.lock_outline_rounded,
                                  color: _kGold.withValues(alpha: 0.40),
                                  size: 22)
                              : Icon(widget.badgeIcon,
                                  color: _kGold, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.monthName,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: isLocked
                                      ? _kCream.withValues(alpha: 0.40)
                                      : _kCream,
                                ),
                              ),
                              const SizedBox(height: 4),
                              _StatusChip(
                                label: widget.statusLabel,
                                status: widget.status,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          _expanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: isLocked
                              ? _kGrey.withValues(alpha: 0.40)
                              : _kGrey,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Progress bar (only for active/completed) ───────────────
                if (!isLocked)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.progressLabel,
                          style: GoogleFonts.lato(
                            fontSize: 11,
                            color: _kGold,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: _kGold.withValues(alpha: 0.12),
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(_kGold),
                            minHeight: 5,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),

                // ── Expandable task list ────────────────────────────────────
                SizeTransition(
                  sizeFactor: _expandAnim,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    child: Column(
                      children: [
                        for (int i = 0; i < widget.tasks.length; i++) ...[
                          if (i > 0)
                            Divider(
                              color: _kGold.withValues(alpha: 0.08),
                              height: 1,
                            ),
                          _TaskRow(
                            label: widget.tasks[i],
                            checked: !isLocked && widget.taskChecked[i],
                            isLocked: isLocked,
                            onToggle: isLocked ? null : () => widget.onToggle(i),
                            onNavigate: isLocked ? null : () => widget.onNavigate(i),
                            taskIndex: i,
                            monthStatus: widget.status,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

// ── Task row ──────────────────────────────────────────────────────────────────

class _TaskRow extends StatelessWidget {
  final String label;
  final bool checked;
  final bool isLocked;
  final VoidCallback? onToggle;
  final VoidCallback? onNavigate;
  final int taskIndex;
  final _MonthStatus monthStatus;

  const _TaskRow({
    required this.label,
    required this.checked,
    required this.isLocked,
    required this.onToggle,
    required this.onNavigate,
    required this.taskIndex,
    required this.monthStatus,
  });

  @override
  Widget build(BuildContext context) {
    final dimmed = isLocked;
    return GestureDetector(
      onTap: onNavigate,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: checked ? _kGold : Colors.transparent,
                  border: Border.all(
                    color: dimmed
                        ? _kGold.withValues(alpha: 0.18)
                        : checked
                            ? _kGold
                            : _kGold.withValues(alpha: 0.45),
                    width: 1.5,
                  ),
                ),
                child: checked
                    ? const Icon(Icons.check_rounded,
                        size: 14, color: _kNavy)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: dimmed
                      ? _kCream.withValues(alpha: 0.28)
                      : checked
                          ? _kCream.withValues(alpha: 0.40)
                          : _kCream,
                  decoration:
                      checked ? TextDecoration.lineThrough : null,
                  decorationColor: _kCream.withValues(alpha: 0.30),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!isLocked)
              Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: _kGold.withValues(alpha: checked ? 0.25 : 0.55),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Status chip ───────────────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  final String label;
  final _MonthStatus status;
  const _StatusChip({required this.label, required this.status});

  Color get _color {
    switch (status) {
      case _MonthStatus.completed:
        return _kGold;
      case _MonthStatus.inProgress:
        return const Color(0xFF4CAF8E);
      case _MonthStatus.locked:
        return _kGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color.withValues(alpha: 0.30), width: 1),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: _color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ── Timeline connector dot ────────────────────────────────────────────────────

class _TimelineDot extends StatelessWidget {
  const _TimelineDot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Center(
        child: CustomPaint(
          size: const Size(2, 32),
          painter: _DotLinePainter(),
        ),
      ),
    );
  }
}

class _DotLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _kGold.withValues(alpha: 0.30)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Dashed vertical line
    const dashH = 4.0;
    const gapH = 4.0;
    double y = 0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, math.min(y + dashH, size.height)),
        paint,
      );
      y += dashH + gapH;
    }

    // Center dot
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      4,
      Paint()
        ..color = _kGold.withValues(alpha: 0.45)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(_DotLinePainter _) => false;
}
