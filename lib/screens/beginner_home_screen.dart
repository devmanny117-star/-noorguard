import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/prayer_times_data.dart';
import '../l10n/app_localizations.dart';
import '../models/prayer_model.dart';
import '../models/surah_model.dart';
import '../theme/app_theme.dart';
import '../widgets/geometric_pattern_painter.dart';
import '../widgets/home/header_section.dart';
import '../widgets/share_sheet.dart';
import '../widgets/home/hero_card.dart';
import '../widgets/home/prayer_times_card.dart';
import '../widgets/home/premium_bottom_nav.dart';
import 'adhan_screen.dart';
import 'app_blocking_screen.dart';
import 'asma_ul_husna_screen.dart';
import 'duas_screen.dart';
import 'focus_mode_screen.dart';
import 'how_to_pray_screen.dart';
import 'islamic_calendar_screen.dart';
import 'islamic_glossary_screen.dart';
import 'journey_timeline_screen.dart';
import 'new_muslim_hub_screen.dart';
import 'prayers_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'settings_screen.dart';
import 'surah_screen.dart';
import 'shahada_screen.dart';
import 'tafsir_of_the_day_screen.dart';
import 'tasbih_screen.dart';
import 'why_do_we_screen.dart';
import 'wudu_guide_screen.dart';

const _kGold = Color(0xFFC9A84C);

enum _ShahadaDisplayMode { days, months, years }

const _kAlFatiha = Surah(
  number: 1,
  name: 'الفاتحة',
  englishName: 'Al-Fatiha',
  englishNameTranslation: 'The Opening',
  numberOfAyahs: 7,
  revelationType: 'Meccan',
);

// ── BeginnerHomeScreen ─────────────────────────────────────────────────────────

class BeginnerHomeScreen extends StatefulWidget {
  final Widget Function()? switchToHome;
  const BeginnerHomeScreen({super.key, this.switchToHome});

  @override
  State<BeginnerHomeScreen> createState() => _BeginnerHomeScreenState();
}

class _BeginnerHomeScreenState extends State<BeginnerHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        } else {
          SystemNavigator.pop();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
          statusBarBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.dark
                  : Brightness.light,
        ),
        child: Scaffold(
          extendBody: true,
          backgroundColor: context.appColors.background,
          body: SafeArea(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                _BeginnerBody(
                  onOpenPrayers: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PrayersScreen()),
                  ),
                  switchToHome: widget.switchToHome,
                ),
                const QuranScreen(),
                QiblaScreen(isActive: _selectedIndex == 2),
                const SettingsScreen(),
              ],
            ),
          ),
          bottomNavigationBar: PremiumBottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (i) => setState(() => _selectedIndex = i),
          ),
        ),
      ),
    );
  }
}

// ── Body (home tab) ────────────────────────────────────────────────────────────

class _BeginnerBody extends StatefulWidget {
  final VoidCallback onOpenPrayers;
  final Widget Function()? switchToHome;

  const _BeginnerBody({
    required this.onOpenPrayers,
    this.switchToHome,
  });

  @override
  State<_BeginnerBody> createState() => _BeginnerBodyState();
}

class _BeginnerBodyState extends State<_BeginnerBody> {
  List<Prayer>?        _prayers;
  String               _userName    = '';
  DateTime?            _shahadaDate;
  _ShahadaDisplayMode  _displayMode = _ShahadaDisplayMode.days;
  final List<bool> _tasks = List.filled(7, false);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final dateStr  = prefs.getString('shahada_date');
    final modeStr  = prefs.getString('shahada_display_mode') ?? 'days';
    setState(() {
      _userName    = prefs.getString('user_name') ?? '';
      _shahadaDate = dateStr != null ? DateTime.tryParse(dateStr) : null;
      _displayMode = _ShahadaDisplayMode.values.firstWhere(
        (m) => m.name == modeStr, orElse: () => _ShahadaDisplayMode.days);
      for (int i = 0; i < 7; i++) {
        _tasks[i] = prefs.getBool('journey_task_month1_task$i') ?? false;
      }
    });
    _loadPrayerTimes();
  }

  Future<void> _reloadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      for (int i = 0; i < 7; i++) {
        _tasks[i] = prefs.getBool('journey_task_month1_task$i') ?? false;
      }
    });
  }

  Future<void> _loadPrayerTimes() async {
    try {
      await Geolocator.requestPermission();
      final pos    = await Geolocator.getCurrentPosition();
      final marks  = await placemarkFromCoordinates(pos.latitude, pos.longitude);
      final city   = marks.first.locality       ?? 'Sacramento';
      final country = marks.first.isoCountryCode ?? 'US';
      final prayers = await fetchPrayerTimes(city: city, country: country);
      if (mounted) setState(() => _prayers = prayers);
    } catch (_) {
      try {
        final prayers = await fetchPrayerTimes(city: 'Sacramento', country: 'US');
        if (mounted) setState(() => _prayers = prayers);
      } catch (_) {
        if (mounted) setState(() => _prayers = todaysPrayers);
      }
    }
  }

  Future<void> _toggleMode() async {
    final l10n = AppLocalizations.of(context)!;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('beginner_mode', false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(l10n.switchedToRegularMode,
          style: GoogleFonts.lato(color: Colors.white)),
      backgroundColor: const Color(0xFF1B3A2D),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ));
    final builder = widget.switchToHome;
    if (builder == null) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => builder(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  Future<void> _toggleTask(int index) async {
    final prefs    = await SharedPreferences.getInstance();
    final newValue = !_tasks[index];
    await prefs.setBool('journey_task_month1_task$index', newValue);
    if (mounted) setState(() => _tasks[index] = newValue);
  }

  Future<void> _pickShahadaDate() async {
    final now    = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: now,
      builder: (ctx, child) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return Theme(
          data: Theme.of(ctx).copyWith(
            colorScheme: isDark
                ? const ColorScheme.dark(
                    primary: _kGold,
                    onPrimary: Color(0xFF0D1B2A),
                    surface: Color(0xFF0F1E30),
                    onSurface: Color(0xFFF5EFE6),
                  )
                : ColorScheme.light(
                    primary: _kGold,
                    onPrimary: Colors.white,
                    surface: Colors.white,
                    onSurface: Theme.of(ctx).colorScheme.onSurface,
                  ),
          ),
          child: child!,
        );
      },
    );
    if (picked == null || !mounted) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shahada_date', picked.toIso8601String());
    setState(() => _shahadaDate = picked);
  }

  Future<void> _setDisplayMode(_ShahadaDisplayMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shahada_display_mode', mode.name);
    if (mounted) setState(() => _displayMode = mode);
  }

  Future<void> _showShahadaOptions() async {
    final daysSince = _shahadaDate != null
        ? DateTime.now().difference(_shahadaDate!).inDays
        : 0;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => _ShahadaOptionsSheet(
        userName: _userName,
        shahadaDate: _shahadaDate,
        displayMode: _displayMode,
        daysSince: daysSince,
        onPickDate: () {
          Navigator.pop(ctx);
          _pickShahadaDate();
        },
        onModeChange: _setDisplayMode,
      ),
    );
  }

  void _showExploreFeaturesSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _ExploreAllFeaturesSheet(),
    );
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(height: 4),
            HeaderSection(
              onShare: () => showShareSheet(context),
              userName: _userName,
              isBeginnerMode: true,
              onModeToggle: _toggleMode,
            ),
            const SizedBox(height: 6),
            PrayerTimesCard(
              prayers: _prayers,
              onNextPrayerTap: widget.onOpenPrayers,
            ),
            const HeroCard(),
            _JourneyCard(
              userName:    _userName,
              shahadaDate: _shahadaDate,
              displayMode: _displayMode,
              onBadgeTap:  _shahadaDate == null
                  ? _pickShahadaDate
                  : _showShahadaOptions,
              tasks:       _tasks,
              onToggle:   _toggleTask,
              progressLabel: l10n.journeyTasksCompleted(
                _tasks.where((t) => t).length, 7),
              taskLabels: [
                l10n.beginnerEssential6,
                l10n.beginnerEssential2,
                l10n.beginnerEssential4,
                l10n.beginnerEssential3,
                l10n.beginnerEssential5,
                l10n.beginnerEssential7,
                l10n.whyDoWe,
              ],
              viewFullLabel: l10n.journeyViewFull,
              onNavigate: (i) => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => _taskScreen(i)),
              ),
              onViewFull: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const JourneyTimelineScreen()),
              ).then((_) => _reloadTasks()),
            ),
            const _ToolboxCard(),
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              _ExploreAllCard(onTap: _showExploreFeaturesSheet),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Shared card wrapper ────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.45), width: 1),
      ),
      child: child,
    );
  }
}

// ── Section 3: Journey Card (unified) ─────────────────────────────────────────

class _JourneyCard extends StatelessWidget {
  final String               userName;
  final DateTime?            shahadaDate;
  final _ShahadaDisplayMode  displayMode;
  final VoidCallback         onBadgeTap;
  final List<bool>           tasks;
  final void Function(int)   onToggle;
  final void Function(int)   onNavigate;
  final VoidCallback         onViewFull;
  final String               progressLabel;
  final List<String>         taskLabels;
  final String               viewFullLabel;

  const _JourneyCard({
    required this.userName,
    required this.shahadaDate,
    required this.displayMode,
    required this.onBadgeTap,
    required this.tasks,
    required this.onToggle,
    required this.onNavigate,
    required this.onViewFull,
    required this.progressLabel,
    required this.taskLabels,
    required this.viewFullLabel,
  });

  int get _done => tasks.where((t) => t).length;

  int get _daysSince =>
      shahadaDate == null ? 0 : DateTime.now().difference(shahadaDate!).inDays;

  String _formatDate(DateTime d) {
    const m = ['Jan','Feb','Mar','Apr','May','Jun',
                'Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${m[d.month - 1]} ${d.day}, ${d.year}';
  }

  String _displayBadge(int days) {
    switch (displayMode) {
      case _ShahadaDisplayMode.days:
        return 'Day $days as a Muslim';
      case _ShahadaDisplayMode.months:
        final mo = (days / 30.44).floor();
        return '$mo month${mo == 1 ? '' : 's'} as a Muslim';
      case _ShahadaDisplayMode.years:
        final yr = (days / 365.25).floor();
        return '$yr year${yr == 1 ? '' : 's'} as a Muslim';
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _done / 7.0;
    final l10n     = AppLocalizations.of(context)!;
    final title    = userName.isNotEmpty ? "$userName's Journey" : 'Your Journey';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.50), width: 1),
        boxShadow: [
          BoxShadow(
            color: _kGold.withValues(alpha: 0.10),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          children: [
            // ── Geometric pattern watermark (slightly more visible) ──────
            const Positioned.fill(
              child: CustomPaint(
                painter: GeometricPatternPainter(color: _kGold, alpha: 0.10),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── Header: crescent icon + title with glow ───────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: CustomPaint(
                          painter: _JourneyCrescentPainter(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                            shadows: [
                              Shadow(
                                color: _kGold.withValues(alpha: 0.45),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // ── Shahada date or CTA pill ──────────────────────────
                  if (shahadaDate != null) ...[
                    GestureDetector(
                      onTap: onBadgeTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shahada: ${_formatDate(shahadaDate!)}',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: const Color(0xB3F5EFE6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _kGold.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _kGold.withValues(alpha: 0.40),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _displayBadge(_daysSince),
                                  style: GoogleFonts.lato(
                                    fontSize: 11,
                                    color: _kGold,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(Icons.edit_rounded,
                                    size: 10,
                                    color: _kGold.withValues(alpha: 0.55)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    GestureDetector(
                      onTap: onBadgeTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          color: _kGold.withValues(alpha: 0.09),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _kGold.withValues(alpha: 0.50),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.add_circle_outline_rounded,
                                color: _kGold, size: 14),
                            const SizedBox(width: 6),
                            Text(
                              l10n.beginnerTapToSetShahadaDate,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: _kGold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 12),

                  // ── Gold divider ──────────────────────────────────────
                  Divider(
                    color: _kGold.withValues(alpha: 0.22),
                    thickness: 0.5,
                    height: 1,
                  ),

                  const SizedBox(height: 12),

                  // ── Shimmer progress bar ──────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: _ShimmerProgressBar(value: progress),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        progressLabel,
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          color: _kGold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // ── Task list ─────────────────────────────────────────
                  for (int i = 0; i < taskLabels.length; i++) ...[
                    if (i > 0)
                      Divider(color: _kGold.withValues(alpha: 0.08), height: 1),
                    _JourneyTaskRow(
                      label:      taskLabels[i],
                      checked:    tasks[i],
                      onToggle:   () => onToggle(i),
                      onNavigate: () => onNavigate(i),
                    ),
                  ],

                  const SizedBox(height: 14),

                  // ── View full journey button (InkWell ripple) ─────────
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: onViewFull,
                      borderRadius: BorderRadius.circular(12),
                      splashColor: _kGold.withValues(alpha: 0.20),
                      highlightColor: _kGold.withValues(alpha: 0.08),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0x11C9A84C),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _kGold.withValues(alpha: 0.50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              viewFullLabel,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: _kGold,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.arrow_forward_rounded,
                                color: _kGold, size: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Journey card crescent + star painter ──────────────────────────────────────

class _JourneyCrescentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r  = size.width * 0.38;

    // Soft glow behind
    canvas.drawCircle(
      Offset(cx, cy), r * 1.1,
      Paint()
        ..color = _kGold.withValues(alpha: 0.14)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
    );

    final paint = Paint()..color = _kGold..style = PaintingStyle.fill;

    // Crescent: outer minus offset inner
    final outer    = Path()..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    final inner    = Path()..addOval(Rect.fromCircle(
        center: Offset(cx + r * 0.34, cy - r * 0.08), radius: r * 0.78));
    final crescent = Path.combine(PathOperation.difference, outer, inner);

    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(-math.pi / 9);
    canvas.translate(-cx, -cy);
    canvas.drawPath(crescent, paint);
    canvas.restore();

    // 5-pointed star
    _drawStar(canvas, paint, Offset(cx + r * 0.72, cy - r * 0.60), r * 0.20);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final a  = i * 2 * math.pi / 5 - math.pi / 2;
      final ia = a + math.pi / 5;
      final x  = center.dx + r * math.cos(a);
      final y  = center.dy + r * math.sin(a);
      final ix = center.dx + r * 0.38 * math.cos(ia);
      final iy = center.dy + r * 0.38 * math.sin(ia);
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_JourneyCrescentPainter _) => false;
}

// ── Shimmer progress bar ───────────────────────────────────────────────────────

class _ShimmerProgressBar extends StatefulWidget {
  final double value;
  const _ShimmerProgressBar({required this.value});

  @override
  State<_ShimmerProgressBar> createState() => _ShimmerProgressBarState();
}

class _ShimmerProgressBarState extends State<_ShimmerProgressBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => SizedBox(
        height: 7,
        child: CustomPaint(
          painter: _ShimmerBarPainter(
            progress: widget.value,
            shimmerPos: _ctrl.value,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _ShimmerBarPainter extends CustomPainter {
  final double progress;
  final double shimmerPos;
  const _ShimmerBarPainter({required this.progress, required this.shimmerPos});

  @override
  void paint(Canvas canvas, Size size) {
    const radius = Radius.circular(6);

    // Track
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), radius),
      Paint()..color = _kGold.withValues(alpha: 0.14),
    );

    if (progress <= 0) return;

    final fillW = size.width * progress.clamp(0.0, 1.0);
    final fillRect = Rect.fromLTWH(0, 0, fillW, size.height);

    // Gold fill
    canvas.drawRRect(
      RRect.fromRectAndRadius(fillRect, radius),
      Paint()..color = _kGold,
    );

    // Shimmer sweep
    final sw = fillW * 0.45;
    final sx = shimmerPos * (fillW + sw) - sw;
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(fillRect, radius));
    canvas.drawRect(
      Rect.fromLTWH(sx, 0, sw, size.height),
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.0),
            Colors.white.withValues(alpha: 0.30),
            Colors.white.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(sx, 0, sw, size.height)),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ShimmerBarPainter old) =>
      old.progress != progress || old.shimmerPos != shimmerPos;
}

// ── Journey task row (with gold pulse on check) ───────────────────────────────

class _JourneyTaskRow extends StatefulWidget {
  final String       label;
  final bool         checked;
  final VoidCallback onToggle;
  final VoidCallback onNavigate;

  const _JourneyTaskRow({
    required this.label,
    required this.checked,
    required this.onToggle,
    required this.onNavigate,
  });

  @override
  State<_JourneyTaskRow> createState() => _JourneyTaskRowState();
}

class _JourneyTaskRowState extends State<_JourneyTaskRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double>   _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );
    _pulseAnim = CurvedAnimation(parent: _pulse, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(_JourneyTaskRow old) {
    super.didUpdateWidget(old);
    if (!old.checked && widget.checked) {
      _pulse.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onNavigate,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // ── Checkbox with pulse ring ───────────────────────────────
            GestureDetector(
              onTap: widget.onToggle,
              child: SizedBox(
                width: 32,
                height: 32,
                child: AnimatedBuilder(
                  animation: _pulseAnim,
                  builder: (_, __) {
                    final p = _pulseAnim.value;
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Expanding pulse ring
                        if (widget.checked && p > 0 && p < 1)
                          Container(
                            width: 24 + 16 * p,
                            height: 24 + 16 * p,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _kGold.withValues(alpha: (1 - p) * 0.50),
                                width: 1.5,
                              ),
                            ),
                          ),
                        // Main circle
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.checked ? _kGold : Colors.transparent,
                            border: Border.all(
                              color: widget.checked
                                  ? _kGold
                                  : _kGold.withValues(alpha: 0.55),
                              width: 1.5,
                            ),
                            boxShadow: widget.checked
                                ? [
                                    BoxShadow(
                                      color: _kGold.withValues(alpha: 0.30),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: _kGold.withValues(alpha: 0.10),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                          ),
                          child: widget.checked
                              ? const Icon(Icons.check_rounded,
                                  size: 14, color: Colors.white)
                              : null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.label,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: widget.checked
                      ? const Color(0xFFF5EFE6).withValues(alpha: 0.35)
                      : const Color(0xFFF5EFE6),
                  decoration: widget.checked ? TextDecoration.lineThrough : null,
                  decorationColor:
                      const Color(0xFFF5EFE6).withValues(alpha: 0.25),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: _kGold.withValues(alpha: widget.checked ? 0.25 : 0.60),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section 5: Beginner Toolbox ────────────────────────────────────────────────

class _ToolboxCard extends StatelessWidget {
  const _ToolboxCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final items = <({IconData icon, String label, String subtitle, Widget screen})>[
      (icon: Icons.airline_seat_flat,        label: l10n.beginnerLearnSalah, subtitle: l10n.toolboxLearnSalahSubtitle, screen: const HowToPrayScreen()),
      (icon: Icons.water_drop_rounded,       label: l10n.wuduGuide,          subtitle: l10n.toolboxWuduSubtitle,          screen: const WuduGuideScreen()),
      (icon: Icons.menu_book_rounded,        label: l10n.islamicGlossary,    subtitle: l10n.toolboxGlossarySubtitle,      screen: const IslamicGlossaryScreen()),
      (icon: Icons.favorite_rounded,         label: l10n.backToBasics,       subtitle: l10n.backToBasicsSubtitle,         screen: const NewMuslimHubScreen()),
    ];

    return _SectionCard(
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(
              painter: GeometricPatternPainter(color: _kGold, alpha: 0.09),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.beginnerToolboxSection,
                style: GoogleFonts.lato(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: _kGold,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _ToolboxFeatureCard(
                      icon: items[0].icon,
                      label: items[0].label,
                      subtitle: items[0].subtitle,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => items[0].screen)),
                      customIcon: const SizedBox(
                        width: 52,
                        height: 52,
                        child: CustomPaint(
                          painter: _SujoodPainter(color: _kGold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ToolboxFeatureCard(
                      icon: items[1].icon,
                      label: items[1].label,
                      subtitle: items[1].subtitle,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => items[1].screen)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _ToolboxFeatureCard(
                      icon: items[2].icon,
                      label: items[2].label,
                      subtitle: items[2].subtitle,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => items[2].screen)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ToolboxFeatureCard(
                      icon: items[3].icon,
                      label: items[3].label,
                      subtitle: items[3].subtitle,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => items[3].screen)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Toolbox Feature Card ───────────────────────────────────────────────────────

class _ToolboxFeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? customIcon;
  const _ToolboxFeatureCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0x33C9A84C), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Geometric watermark
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const CustomPaint(
                  painter: GeometricPatternPainter(
                    color: _kGold,
                    alpha: 0.07,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customIcon ?? Icon(icon, color: _kGold, size: 42),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: GoogleFonts.lato(
                    color: const Color(0xFFF5EFE6),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    height: 1.2,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.lato(
                    color: const Color(0xB3F5EFE6),
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    letterSpacing: 0.1,
                    height: 1.3,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Explore All Features modal sheet ─────────────────────────────────────────

class _ExploreAllFeaturesSheet extends StatelessWidget {
  const _ExploreAllFeaturesSheet();

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final features = <({IconData icon, String label, String subtitle, Widget screen})>[
      (icon: Icons.auto_stories_rounded,     label: l10n.tafsirOfTheDay,    subtitle: l10n.tafsirSubtitle,              screen: const TafsirOfTheDayScreen()),
      (icon: Icons.volunteer_activism_rounded, label: l10n.duas,            subtitle: l10n.dailySupplications,          screen: const DuasScreen()),
      (icon: Icons.touch_app_rounded,         label: l10n.tasbihCounter,    subtitle: l10n.tasbihCounterSubtitle,       screen: const TasbihScreen()),
      (icon: Icons.hourglass_empty_rounded,   label: l10n.focusMode,        subtitle: l10n.focusModeSubtitle,           screen: const FocusModeScreen()),
      (icon: Icons.security_rounded,          label: l10n.appBlocking,      subtitle: l10n.blockDuringPrayerTimes,      screen: const AppBlockingScreen()),
      (icon: Icons.calendar_month_rounded,    label: l10n.islamicCalendar,  subtitle: l10n.islamicCalendarSubtitle,     screen: const IslamicCalendarScreen()),
      (icon: Icons.star_rounded,             label: l10n.asmaUlHusnaTile,  subtitle: l10n.asmaUlHusnaTileSubtitle,    screen: const AsmaUlHusnaScreen()),
      (icon: Icons.mosque_rounded,            label: l10n.adhan,            subtitle: l10n.adhanSubtitle,               screen: const AdhanScreen()),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.80,
      minChildSize: 0.50,
      maxChildSize: 0.92,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: context.appColors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Stack(
            children: [
              // Islamic geometric background
              const Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  child: CustomPaint(
                    painter: GeometricPatternPainter(color: _kGold, alpha: 0.07),
                  ),
                ),
              ),
              Column(
                children: [
                  // Drag handle
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 6),
                    child: Center(
                      child: Container(
                        width: 36,
                        height: 4,
                        decoration: BoxDecoration(
                          color: _kGold.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  // Title + subtitle
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 4),
                    child: Column(
                      children: [
                        Text(
                          l10n.beginnerExploreAll,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.beginnerExploreFeaturesSubtitle,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: context.appColors.secondaryText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Divider(color: _kGold.withValues(alpha: 0.22), height: 1),
                  ),
                  // Scrollable grid
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                      children: [
                        for (int row = 0; row < 4; row++) ...[
                          if (row > 0) const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _FeatureModalCard(
                                  icon: features[row * 2].icon,
                                  label: features[row * 2].label,
                                  subtitle: features[row * 2].subtitle,
                                  onTap: () => _navigate(context, features[row * 2].screen),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _FeatureModalCard(
                                  icon: features[row * 2 + 1].icon,
                                  label: features[row * 2 + 1].label,
                                  subtitle: features[row * 2 + 1].subtitle,
                                  onTap: () => _navigate(context, features[row * 2 + 1].screen),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FeatureModalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _FeatureModalCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: isDark ? null : context.appColors.secondaryBg,
          gradient: isDark
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF101E31), Color(0xFF081321)],
                )
              : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _kGold.withValues(alpha: 0.55),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.07),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: _kGold, size: 32),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: GoogleFonts.lato(
                    color: context.appColors.primaryText,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    height: 1.2,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.lato(
                    color: _kGold.withValues(alpha: 0.75),
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    letterSpacing: 0.1,
                    height: 1.3,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section 6: Explore All Features ───────────────────────────────────────────

class _ExploreAllCard extends StatelessWidget {
  final VoidCallback onTap;
  const _ExploreAllCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1B2A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _kGold.withValues(alpha: 0.55), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.beginnerExploreAll,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _kGold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l10n.beginnerExploreSubtitle,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: _kGold.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _kGold,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF0D1B2A),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Shahada options bottom sheet ───────────────────────────────────────────────

class _ShahadaOptionsSheet extends StatefulWidget {
  final String               userName;
  final DateTime?            shahadaDate;
  final _ShahadaDisplayMode  displayMode;
  final int                  daysSince;
  final VoidCallback         onPickDate;
  final void Function(_ShahadaDisplayMode) onModeChange;

  const _ShahadaOptionsSheet({
    required this.userName,
    required this.shahadaDate,
    required this.displayMode,
    required this.daysSince,
    required this.onPickDate,
    required this.onModeChange,
  });

  @override
  State<_ShahadaOptionsSheet> createState() => _ShahadaOptionsSheetState();
}

class _ShahadaOptionsSheetState extends State<_ShahadaOptionsSheet> {
  late _ShahadaDisplayMode _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.displayMode;
  }

  String _fmt(DateTime d) {
    const mo = ['Jan','Feb','Mar','Apr','May','Jun',
                 'Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${mo[d.month - 1]} ${d.day}, ${d.year}';
  }

  void _pick(_ShahadaDisplayMode mode) {
    setState(() => _selected = mode);
    widget.onModeChange(mode);
  }

  @override
  Widget build(BuildContext context) {
    final showYears = widget.daysSince >= 365;
    final hasDate   = widget.shahadaDate != null;

    return Container(
      decoration: BoxDecoration(
        color: context.appColors.cardBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 18),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: _kGold.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: CustomPaint(painter: _JourneyCrescentPainter()),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.userName.isNotEmpty
                      ? "${widget.userName}'s Shahada Journey"
                      : 'Your Shahada Journey',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _kGold,
                  ),
                ),
              ],
            ),
          ),

          if (hasDate) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _fmt(widget.shahadaDate!),
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: context.appColors.secondaryText,
                ),
              ),
            ),
          ],

          const SizedBox(height: 18),
          Divider(color: _kGold.withValues(alpha: 0.12), height: 1),

          InkWell(
            onTap: widget.onPickDate,
            splashColor: _kGold.withValues(alpha: 0.12),
            highlightColor: _kGold.withValues(alpha: 0.06),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _kGold.withValues(alpha: 0.12),
                    ),
                    child: const Icon(Icons.calendar_today_rounded,
                        color: _kGold, size: 17),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      hasDate
                          ? 'Change my Shahada date'
                          : 'Set my Shahada date',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: context.appColors.primaryText,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      color: _kGold.withValues(alpha: 0.50), size: 20),
                ],
              ),
            ),
          ),

          if (hasDate) ...[
            Divider(color: _kGold.withValues(alpha: 0.12), height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DISPLAY AS',
                    style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: _kGold.withValues(alpha: 0.70),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _ModeChip(
                        label: 'Days',
                        selected: _selected == _ShahadaDisplayMode.days,
                        onTap: () => _pick(_ShahadaDisplayMode.days),
                      ),
                      const SizedBox(width: 8),
                      _ModeChip(
                        label: 'Months',
                        selected: _selected == _ShahadaDisplayMode.months,
                        onTap: () => _pick(_ShahadaDisplayMode.months),
                      ),
                      const SizedBox(width: 8),
                      _ModeChip(
                        label: 'Years',
                        selected: _selected == _ShahadaDisplayMode.years,
                        enabled: showYears,
                        onTap: showYears
                            ? () => _pick(_ShahadaDisplayMode.years)
                            : null,
                      ),
                    ],
                  ),
                  if (!showYears) ...[
                    const SizedBox(height: 7),
                    Text(
                      'Years unlocks after 1 year as a Muslim',
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        color: context.appColors.secondaryText,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ModeChip extends StatelessWidget {
  final String        label;
  final bool          selected;
  final bool          enabled;
  final VoidCallback? onTap;

  const _ModeChip({
    required this.label,
    required this.selected,
    this.enabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: selected ? _kGold.withValues(alpha: 0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? _kGold
                : _kGold.withValues(alpha: enabled ? 0.28 : 0.12),
            width: selected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected
                ? _kGold
                : _kGold.withValues(alpha: enabled ? 0.55 : 0.25),
          ),
        ),
      ),
    );
  }
}

// ── Sujood (Prostration) Silhouette ───────────────────────────────────────────
//
// Side-view silhouette of a person in full sujood (prostration).
// Viewed from the person's left side, facing left (head at bottom-left).
//
//   • Large rounded back hump  — dominant feature, peaks ~¼ from the top
//   • Head near the ground     — small circle, forehead almost touching floor
//   • Kufi/cap                 — small oval protruding from back-top of head
//   • Arms flat on the ground  — thin filled shape extending toward the head
//   • Legs folded under        — thighs drop from hips, shins fold right/back
//
// All shapes are filled in the same color to form a single clean silhouette.

class _SujoodPainter extends CustomPainter {
  final Color color;
  const _SujoodPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final w = size.width;
    final h = size.height;

    // ── BODY ──────────────────────────────────────────────────────────────────
    // Single path: outer (back/spine) edge → inner (belly) edge → close.
    final body = Path();

    // Neck junction — where head meets torso
    body.moveTo(w * 0.21, h * 0.69);

    // OUTER BACK — rises steeply from neck, arches into a large hump, descends to hips
    body.cubicTo(w * 0.30, h * 0.51, w * 0.42, h * 0.32, w * 0.56, h * 0.25); // → hump peak
    body.cubicTo(w * 0.67, h * 0.28, w * 0.75, h * 0.41, w * 0.77, h * 0.56); // → upper buttock

    // BUTTOCKS — full rounded curve
    body.cubicTo(w * 0.81, h * 0.62, w * 0.81, h * 0.70, w * 0.77, h * 0.77);

    // OUTER THIGH → outer knee on the ground
    body.cubicTo(w * 0.75, h * 0.82, w * 0.72, h * 0.86, w * 0.68, h * 0.88);

    // OUTER SHIN + foot extending to the right
    body.quadraticBezierTo(w * 0.76, h * 0.90, w * 0.85, h * 0.89);
    body.lineTo(w * 0.88, h * 0.89); // toe tip

    // INNER BELLY EDGE — back left to neck
    body.lineTo(w * 0.88, h * 0.93);                                            // underfoot
    body.lineTo(w * 0.70, h * 0.93);                                            // inner heel
    body.quadraticBezierTo(w * 0.65, h * 0.90, w * 0.63, h * 0.86);           // inner knee
    body.cubicTo(w * 0.61, h * 0.79, w * 0.61, h * 0.71, w * 0.62, h * 0.65); // inner thigh → hip
    body.cubicTo(w * 0.52, h * 0.67, w * 0.37, h * 0.73, w * 0.24, h * 0.78); // belly → chest

    body.close(); // chest → neck
    canvas.drawPath(body, p);

    // ── ARMS ──────────────────────────────────────────────────────────────────
    // Thin flat shape from the chest area extending forward along the ground.
    final arms = Path();
    arms.moveTo(w * 0.27, h * 0.75);
    arms.cubicTo(w * 0.18, h * 0.78, w * 0.09, h * 0.81, w * 0.02, h * 0.84); // upper arm edge
    arms.lineTo(w * 0.03, h * 0.91);
    arms.cubicTo(w * 0.11, h * 0.88, w * 0.20, h * 0.85, w * 0.29, h * 0.82); // lower arm edge
    arms.close();
    canvas.drawPath(arms, p);

    // ── HEAD ──────────────────────────────────────────────────────────────────
    // Small circle; forehead nears the ground at lower-left.
    canvas.drawCircle(Offset(w * 0.13, h * 0.79), w * 0.084, p);

    // ── KUFI / CAP ────────────────────────────────────────────────────────────
    // Small oval sitting on the back-top of the tilted head, protruding above
    // the head circle so it reads as a cap in the filled silhouette.
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.18, h * 0.70),
        width: w * 0.15,
        height: h * 0.08,
      ),
      p,
    );
  }

  @override
  bool shouldRepaint(covariant _SujoodPainter old) => old.color != color;
}
