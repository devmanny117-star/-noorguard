import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';
import '../data/prayer_times_data.dart';
import '../models/dua_model.dart';
import '../models/prayer_model.dart';
import '../services/prayer_state.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

class LockScreenPreview extends StatefulWidget {
  const LockScreenPreview({super.key});

  @override
  State<LockScreenPreview> createState() => _LockScreenPreviewState();
}

class _LockScreenPreviewState extends State<LockScreenPreview>
    with TickerProviderStateMixin {
  late Timer _clockTimer;
  late Timer _duaTimer;
  DateTime _now = DateTime.now();
  int _duaIndex = 0;

  late AnimationController _duaFadeCtrl;
  late Animation<double> _duaFade;
  late AnimationController _crescentCtrl;
  late Animation<double> _crescentGlow;

  List<Prayer>? _prayers;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    _loadPrayerTimes();

    _duaFadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _duaFade = CurvedAnimation(parent: _duaFadeCtrl, curve: Curves.easeInOut);
    _duaFadeCtrl.value = 1.0;

    _crescentCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _crescentGlow = CurvedAnimation(parent: _crescentCtrl, curve: Curves.easeInOut);

    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });

    _duaTimer = Timer.periodic(const Duration(seconds: 7), (_) async {
      if (!mounted) return;
      await _duaFadeCtrl.reverse();
      if (!mounted) return;
      setState(() => _duaIndex = (_duaIndex + 1) % lockScreenDuas.length);
      _duaFadeCtrl.forward();
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _duaTimer.cancel();
    _duaFadeCtrl.dispose();
    _crescentCtrl.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  String _formatHour() {
    final h = _now.hour % 12;
    return (h == 0 ? 12 : h).toString();
  }

  String _formatMinute() => _now.minute.toString().padLeft(2, '0');

  String _amPm(String localeCode) => DateFormat('a', localeCode).format(_now);

  String _formatDate(String localeCode) {
    return DateFormat('EEEE, MMMM d', localeCode).format(_now);
  }

  Future<void> _loadPrayerTimes() async {
    try {
      await Geolocator.requestPermission();
      final position = await Geolocator.getCurrentPosition();
      final placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      final placemark = placemarks.first;
      final prayers = await fetchPrayerTimes(
        city: placemark.locality ?? 'Sacramento',
        country: placemark.isoCountryCode ?? 'US',
      );
      if (mounted) setState(() => _prayers = prayers);
    } catch (_) {
      try {
        final prayers = await fetchPrayerTimes();
        if (mounted) setState(() => _prayers = prayers);
      } catch (_) {
        // Leave _prayers null — the prayer section just stays hidden.
      }
    }
  }

  DateTime? _parseTimeToday(String timeStr) {
    try {
      final parts = timeStr.split(' ');
      final timeParts = parts[0].split(':');
      var hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final isPm = parts[1].toUpperCase() == 'PM';
      if (isPm && hour != 12) hour += 12;
      if (!isPm && hour == 12) hour = 0;
      return DateTime(_now.year, _now.month, _now.day, hour, minute);
    } catch (_) {
      return null;
    }
  }

  String _countdownTo(DateTime target) {
    final diff = target.difference(_now);
    if (diff.isNegative) return '';
    final h = diff.inHours;
    final m = diff.inMinutes.remainder(60);
    return h > 0 ? '${h}h ${m}m' : '${m}m';
  }

  /// The most recently-due prayer that hasn't been marked yet — what "I
  /// Prayed" should mark (mirrors the same rule used by the home-screen
  /// widgets' I Prayed button).
  Prayer? _currentDuePrayer(PrayerState state) {
    final prayers = _prayers;
    if (prayers == null || prayers.isEmpty) return null;
    final nextIndex = prayers.indexWhere((p) => p.isNext);
    if (nextIndex == -1) return null;
    final currentIndex = (nextIndex - 1 + prayers.length) % prayers.length;
    return prayers[currentIndex];
  }

  static String _localizedPrayerName(AppLocalizations l10n, String englishName) {
    return switch (englishName) {
      'Fajr' => l10n.fajr,
      'Dhuhr' => l10n.dhuhr,
      'Asr' => l10n.asr,
      'Maghrib' => l10n.maghrib,
      'Isha' => l10n.isha,
      _ => englishName,
    };
  }

  @override
  Widget build(BuildContext context) {
    final dua = lockScreenDuas[_duaIndex];
    final l10n = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).toString();

    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Islamic geometric pattern background
          CustomPaint(painter: _LockPatternPainter()),

          // Subtle radial glow behind the clock
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.3),
                  radius: 0.85,
                  colors: [
                    AppColors.gold.withValues(alpha: 0.07),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Back button row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.arrow_back_ios_rounded,
                                  size: 13, color: Colors.white70),
                              const SizedBox(width: 4),
                              Text(
                                l10n.preview,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: _crescentGlow,
                        builder: (_, __) => _CrescentMoon(
                          glowIntensity: _crescentGlow.value,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 80),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ── CLOCK ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${_formatHour()}:${_formatMinute()}',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 88,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gold,
                        height: 1.0,
                        letterSpacing: -2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14, left: 6),
                      child: Text(
                        _amPm(localeCode),
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gold.withValues(alpha: 0.65),
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),

                // Date
                Text(
                  _formatDate(localeCode),
                  style: GoogleFonts.lato(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.55),
                    letterSpacing: 0.4,
                  ),
                ),

                const SizedBox(height: 22),

                // ── NEXT PRAYER PILL ──
                Builder(builder: (context) {
                  final prayers = _prayers;
                  final nextIndex = prayers?.indexWhere((p) => p.isNext) ?? -1;
                  final next = nextIndex == -1 ? null : prayers![nextIndex];
                  final nextTime = next == null ? null : _parseTimeToday(next.time);
                  final countdown = nextTime == null ? '' : _countdownTo(nextTime);
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.gold.withValues(alpha: 0.30),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.deepGreen.withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.access_time_rounded,
                              size: 15, color: AppColors.gold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          next == null ? l10n.asr : _localizedPrayerName(l10n, next.name),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          next == null ? l10n.lockPreviewCountdown : countdown,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.72),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 16),

                // ── 5 PRAYER TIMES + I PRAYED ──
                if (_prayers != null) _LockPrayerRow(prayers: _prayers!),

                const SizedBox(height: 12),

                Consumer<PrayerState>(
                  builder: (context, state, _) {
                    final current = _currentDuePrayer(state);
                    if (current == null) return const SizedBox.shrink();
                    final alreadyDone = state.prayers[current.name] ?? false;
                    return GestureDetector(
                      onTap: alreadyDone
                          ? null
                          : () => state.togglePrayer(current.name, context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 9),
                        decoration: BoxDecoration(
                          color: alreadyDone
                              ? AppColors.gold.withValues(alpha: 0.18)
                              : AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              alreadyDone
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              size: 16,
                              color: alreadyDone
                                  ? AppColors.gold
                                  : const Color(0xFF1B5E20),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              l10n.iPrayedButton,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: alreadyDone
                                    ? AppColors.gold
                                    : const Color(0xFF1B5E20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // ── GOLD DIVIDER ──
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              AppColors.gold.withValues(alpha: 0.35),
                              AppColors.gold.withValues(alpha: 0.35),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 30),

                // ── DUA SECTION ──
                Expanded(
                  child: FadeTransition(
                    opacity: _duaFade,
                    child: _DuaDisplay(dua: dua),
                  ),
                ),

                // ── DUA DOT INDICATORS ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    lockScreenDuas.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: i == _duaIndex ? 18 : 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: i == _duaIndex
                            ? AppColors.gold
                            : Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── SWIPE HINT ──
                Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.white.withValues(alpha: 0.35),
                      size: 22,
                    ),
                    Text(
                      l10n.swipeUpToUnlock,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.35),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 5 PRAYER TIMES ROW
// ─────────────────────────────────────────────
class _LockPrayerRow extends StatelessWidget {
  final List<Prayer> prayers;
  const _LockPrayerRow({required this.prayers});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PrayerState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: prayers.map((p) {
          final done = state.prayers[p.name] ?? false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _LockScreenPreviewState._localizedPrayerName(
                  AppLocalizations.of(context)!,
                  p.name,
                ),
                style: GoogleFonts.lato(
                  fontSize: 11,
                  fontWeight: p.isNext ? FontWeight.w700 : FontWeight.w500,
                  color: p.isNext
                      ? AppColors.gold
                      : Colors.white.withValues(alpha: 0.55),
                ),
              ),
              const SizedBox(height: 4),
              Icon(
                done ? Icons.circle : Icons.circle_outlined,
                size: 8,
                color: done
                    ? const Color(0xFF4CAF50)
                    : Colors.white.withValues(alpha: 0.25),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// DUA TEXT WIDGET
// ─────────────────────────────────────────────
class _DuaDisplay extends StatelessWidget {
  final Dua dua;
  const _DuaDisplay({required this.dua});

  @override
  Widget build(BuildContext context) {
    // Arabic-locale readers are served by the Arabic original above; showing
    // a redundant translation line underneath would be out of place.
    final isArabicLocale = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Arabic text (right to left)
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              dua.arabic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                height: 1.8,
                fontFamily: 'serif',
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Gold thin line
          Container(
            width: 40,
            height: 1.5,
            color: AppColors.gold.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 18),
          if (!isArabicLocale) ...[
            Text(
              dua.translationFor(Localizations.localeOf(context).languageCode),
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white.withValues(alpha: 0.60),
                height: 1.65,
                letterSpacing: 0.2,
              ),
            ),
          ],
          const SizedBox(height: 10),
          Text(
            '— ${dua.source}',
            style: GoogleFonts.lato(
              fontSize: 11,
              color: AppColors.gold.withValues(alpha: 0.55),
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CRESCENT MOON WIDGET
// ─────────────────────────────────────────────
class _CrescentMoon extends StatelessWidget {
  final double glowIntensity;
  const _CrescentMoon({required this.glowIntensity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: CustomPaint(
        painter: _CrescentPainter(glowIntensity: glowIntensity),
      ),
    );
  }
}

class _CrescentPainter extends CustomPainter {
  final double glowIntensity;
  _CrescentPainter({required this.glowIntensity});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.38;

    // Glow halo
    final glowPaint = Paint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        6 + glowIntensity * 6,
      )
      ..color = AppColors.gold.withValues(alpha: 0.18 + glowIntensity * 0.12);
    canvas.drawCircle(Offset(cx, cy), r + 4, glowPaint);

    // Crescent body
    final outerPath = Path()
      ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    final innerPath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(cx + r * 0.42, cy - r * 0.08),
        radius: r * 0.78,
      ));

    final crescent = Path.combine(PathOperation.difference, outerPath, innerPath);

    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(-math.pi / 14);
    canvas.translate(-cx, -cy);

    final fillPaint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.88 + glowIntensity * 0.12)
      ..style = PaintingStyle.fill;
    canvas.drawPath(crescent, fillPaint);
    canvas.restore();

    // Star next to crescent
    _drawStar(canvas, Offset(cx + r * 1.1, cy - r * 0.85), r * 0.16);
  }

  void _drawStar(Canvas canvas, Offset center, double r) {
    final paint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final outer = (i * 2 * math.pi / 5) - math.pi / 2;
      final inner = outer + math.pi / 5;
      final op = Offset(center.dx + r * math.cos(outer), center.dy + r * math.sin(outer));
      final ip = Offset(center.dx + r * 0.45 * math.cos(inner), center.dy + r * 0.45 * math.sin(inner));
      if (i == 0) {
        path.moveTo(op.dx, op.dy);
      } else {
        path.lineTo(op.dx, op.dy);
      }
      path.lineTo(ip.dx, ip.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CrescentPainter old) => old.glowIntensity != glowIntensity;
}

// ─────────────────────────────────────────────
// BACKGROUND PATTERN PAINTER
// ─────────────────────────────────────────────
class _LockPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.55;

    final dotPaint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.10)
      ..style = PaintingStyle.fill;

    const spacing = 48.0;
    const starR = 15.0;

    // Dense 8-point star field with hex-offset rows
    for (double y = -starR; y < size.height + starR; y += spacing * 0.88) {
      final row = (y / (spacing * 0.88)).floor();
      final xOffset = row.isOdd ? spacing / 2 : 0.0;
      for (double x = -starR + xOffset; x < size.width + starR; x += spacing) {
        _draw8Star(canvas, linePaint, Offset(x, y), starR);
        // Tiny dot at center
        canvas.drawCircle(Offset(x, y), 1.0, dotPaint);
      }
    }

    // Faint horizontal lattice lines across full width
    final latticePaint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.04)
      ..strokeWidth = 0.4;
    for (double y = 0; y < size.height; y += spacing * 0.88) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), latticePaint);
    }
  }

  void _draw8Star(Canvas canvas, Paint paint, Offset c, double r) {
    final inner = r * 0.42;
    final path = Path();
    for (int i = 0; i < 8; i++) {
      final outer = (i * math.pi / 4) - math.pi / 2;
      final inn = outer + math.pi / 8;
      final op = Offset(c.dx + r * math.cos(outer), c.dy + r * math.sin(outer));
      final ip = Offset(c.dx + inner * math.cos(inn), c.dy + inner * math.sin(inn));
      if (i == 0) {
        path.moveTo(op.dx, op.dy);
      } else {
        path.lineTo(op.dx, op.dy);
      }
      path.lineTo(ip.dx, ip.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LockPatternPainter old) => false;
}
