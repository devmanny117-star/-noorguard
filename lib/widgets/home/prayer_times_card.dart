import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../models/prayer_model.dart';
import '../../screens/streak_calendar_screen.dart';
import '../../services/prayer_state.dart';
import '../geometric_pattern_painter.dart';

// Matches the Revert Corner card's navy/gold palette.
const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFD4AF37);
const _cardDark = Color(0xFF1A2A3A);

String _localizedPrayerName(AppLocalizations l10n, Prayer prayer) {
  switch (prayer.iconPath) {
    case 'fajr':
      return l10n.fajr;
    case 'dhuhr':
      return l10n.dhuhr;
    case 'asr':
      return l10n.asr;
    case 'maghrib':
      return l10n.maghrib;
    case 'isha':
      return l10n.isha;
    default:
      return prayer.name;
  }
}

String _arabicNameFor(Prayer prayer) {
  switch (prayer.iconPath) {
    case 'fajr':
      return 'الفجر';
    case 'dhuhr':
      return 'الظهر';
    case 'asr':
      return 'العصر';
    case 'maghrib':
      return 'المغرب';
    case 'isha':
      return 'العشاء';
    default:
      return prayer.arabicName;
  }
}

class PrayerTimesCard extends StatefulWidget {
  final List<Prayer>? prayers;
  final VoidCallback? onNextPrayerTap;

  const PrayerTimesCard({super.key, this.prayers, this.onNextPrayerTap});

  @override
  State<PrayerTimesCard> createState() => _PrayerTimesCardState();
}

class _PrayerTimesCardState extends State<PrayerTimesCard> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Keeps the "Next: ... in Xh Ym" countdown live without a manual refresh.
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  static final _cardDecoration = BoxDecoration(
    color: _navy,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: _gold.withValues(alpha: 0.35)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.22),
        blurRadius: 16,
        offset: const Offset(0, 6),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final prayerState = context.watch<PrayerState>();

    if (widget.prayers == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: Container(
          height: 280,
          decoration: _cardDecoration,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(_gold),
              strokeWidth: 2.5,
            ),
          ),
        ),
      );
    }

    final prayers = widget.prayers!;
    final nextPrayer = prayers.firstWhere(
      (p) => p.isNext,
      orElse: () => prayers.first,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Container(
        decoration: _cardDecoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(painter: GeometricPatternPainter()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NextPrayerHeader(prayer: nextPrayer, onTap: widget.onNextPrayerTap),
                  _TopStatsRow(
                    streak: prayerState.streakCount,
                    completed: prayerState.completedCount,
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    color: _gold.withValues(alpha: 0.15),
                  ),
                  _AllPrayersRow(prayers: prayers, prayerState: prayerState),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopStatsRow extends StatelessWidget {
  final int streak;
  final int completed;
  const _TopStatsRow({required this.streak, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StreakCalendarScreen()),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _cardDark,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _gold.withValues(alpha: 0.35)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🔥', style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 6),
                  Text(
                    '$streak',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _cardDark,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _gold.withValues(alpha: 0.35)),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                '$completed / 5',
                key: ValueKey(completed),
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextPrayerHeader extends StatelessWidget {
  final Prayer prayer;
  final VoidCallback? onTap;
  const _NextPrayerHeader({required this.prayer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = _localizedPrayerName(l10n, prayer);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 14, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.nextPrayer.toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                    letterSpacing: 2.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  prayer.arabicName,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 19,
                    color: _gold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 17,
                      color: _gold,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      prayer.time,
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: _gold,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  _nextPrayerLabel(l10n, name, prayer.time),
                  style: GoogleFonts.lato(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 125,
            height: 130,
            // Prayer-specific gold mosque art (sunrise for Fajr, crescent
            // for Isha, ...). Falls back to the outline drawing for any
            // prayer without a matching asset.
            child: Image.asset(
              'assets/images/mosques/${prayer.iconPath}_mosque.png',
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  CustomPaint(painter: _MosqueOutlinePainter()),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class _AllPrayersRow extends StatelessWidget {
  final List<Prayer> prayers;
  final PrayerState prayerState;
  const _AllPrayersRow({required this.prayers, required this.prayerState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 16),
      child: Row(
        children: prayers.map((prayer) {
          final done = prayerState.prayers[prayer.name] ?? false;
          return Expanded(
            child: _PrayerPill(
              prayer: prayer,
              done: done,
              onTap: () => prayerState.togglePrayer(prayer.name, context),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PrayerPill extends StatelessWidget {
  final Prayer prayer;
  final bool done;
  final VoidCallback onTap;
  const _PrayerPill({
    required this.prayer,
    required this.done,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        decoration: BoxDecoration(
          color: done ? _gold : _cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: done ? _gold : _gold.withValues(alpha: 0.22),
            width: 1.5,
          ),
          boxShadow: done
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: ScaleTransition(scale: anim, child: child),
              ),
              child: done
                  ? const Icon(
                      Icons.check_rounded,
                      key: ValueKey('check'),
                      color: _navy,
                      size: 20,
                    )
                  : Text(
                      _arabicNameFor(prayer),
                      key: const ValueKey('arabic'),
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 17,
                        color: _gold,
                        height: 1.15,
                      ),
                    ),
            ),
            const SizedBox(height: 5),
            Text(
              _localizedPrayerName(l10n, prayer),
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: done ? _navy : Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                Text(
                  prayer.time.replaceAll(' AM', '').replaceAll(' PM', ''),
                  style: GoogleFonts.lato(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                    color: done ? _navy.withValues(alpha: 0.75) : _gold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MosqueOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = _gold.withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;

    canvas.drawLine(
      Offset(0, h * 0.88),
      Offset(w, h * 0.88),
      stroke,
    );

    final body = Path()
      ..moveTo(w * 0.14, h * 0.88)
      ..lineTo(w * 0.14, h * 0.60)
      ..lineTo(w * 0.86, h * 0.60)
      ..lineTo(w * 0.86, h * 0.88);
    canvas.drawPath(body, stroke);

    _drawDomeOutline(canvas, stroke, Offset(w * 0.50, h * 0.50), w * 0.22, h * 0.32);
    _drawDomeOutline(canvas, stroke, Offset(w * 0.285, h * 0.62), w * 0.115, h * 0.18);
    _drawDomeOutline(canvas, stroke, Offset(w * 0.715, h * 0.62), w * 0.115, h * 0.18);

    _drawMinaretOutline(canvas, stroke, w * 0.085, h * 0.22, w * 0.058, h * 0.88);
    _drawMinaretOutline(canvas, stroke, w * 0.857, h * 0.24, w * 0.058, h * 0.88);

    _drawCrescentOutline(canvas, stroke, Offset(w * 0.50, h * 0.18), h * 0.054);
  }

  void _drawDomeOutline(Canvas canvas, Paint paint, Offset center,
      double halfWidth, double height) {
    final path = Path()
      ..moveTo(center.dx - halfWidth, center.dy + height * 0.10)
      ..quadraticBezierTo(
        center.dx - halfWidth, center.dy - height * 0.55,
        center.dx, center.dy - height * 0.55,
      )
      ..quadraticBezierTo(
        center.dx + halfWidth, center.dy - height * 0.55,
        center.dx + halfWidth, center.dy + height * 0.10,
      );
    canvas.drawPath(path, paint);
  }

  void _drawMinaretOutline(Canvas canvas, Paint paint, double x, double topY,
      double width, double groundY) {
    canvas.drawLine(Offset(x, topY + width * 2.0), Offset(x, groundY), paint);
    canvas.drawLine(
        Offset(x + width, topY + width * 2.0), Offset(x + width, groundY), paint);
    final tip = Path()
      ..moveTo(x - width * 0.22, topY + width * 2.0)
      ..lineTo(x + width * 0.5, topY)
      ..lineTo(x + width * 1.22, topY + width * 2.0);
    canvas.drawPath(tip, paint);
  }

  void _drawCrescentOutline(Canvas canvas, Paint paint, Offset center, double radius) {
    final crescentPaint = Paint()
      ..color = _gold.withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.15,
      math.pi * 1.70,
      false,
      crescentPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.dx + radius * 0.35, center.dy - radius * 0.08),
        radius: radius * 0.82,
      ),
      math.pi * 1.0,
      math.pi * 0.95,
      false,
      crescentPaint,
    );
  }

  @override
  bool shouldRepaint(_MosqueOutlinePainter old) => false;
}

String _nextPrayerLabel(AppLocalizations l10n, String name, String timeStr) {
  final countdown = _countdown(timeStr);
  if (countdown.isEmpty) return name;
  return '${l10n.nextPrayer}: $name $countdown';
}

String _countdown(String timeStr) {
  try {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    if (parts[1] == 'PM' && hour != 12) hour += 12;
    if (parts[1] == 'AM' && hour == 12) hour = 0;
    final now = DateTime.now();
    var target = DateTime(now.year, now.month, now.day, hour, minute);
    if (target.isBefore(now)) target = target.add(const Duration(days: 1));
    final diff = target.difference(now);
    final h = diff.inHours;
    final m = diff.inMinutes.remainder(60);
    if (h > 0) return 'in ${h}h ${m}m';
    return 'in ${m}m';
  } catch (_) {
    return '';
  }
}
