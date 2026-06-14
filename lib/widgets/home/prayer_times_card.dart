import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../models/prayer_model.dart';
import '../../theme/app_theme.dart';

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

class PrayerTimesCard extends StatelessWidget {
  final List<Prayer>? prayers;

  const PrayerTimesCard({super.key, this.prayers});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    final cardDecoration = BoxDecoration(
      color: colors.cardBg,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.07),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
    );

    if (prayers == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: Container(
          height: 160,
          decoration: cardDecoration,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.gold),
              strokeWidth: 2.5,
            ),
          ),
        ),
      );
    }

    final nextPrayer = prayers!.firstWhere(
      (p) => p.isNext,
      orElse: () => prayers!.first,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Container(
        decoration: cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NextPrayerHeader(prayer: nextPrayer),
            Container(height: 1, color: colors.border),
            _AllPrayersRow(prayers: prayers!),
          ],
        ),
      ),
    );
  }
}

class _NextPrayerHeader extends StatelessWidget {
  final Prayer prayer;
  const _NextPrayerHeader({required this.prayer});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 14, 18),
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
                    color: AppColors.gold,
                    letterSpacing: 2.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _localizedPrayerName(l10n, prayer),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: colors.primaryText,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  prayer.arabicName,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 19,
                    color: AppColors.gold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 17,
                      color: AppColors.gold,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      prayer.time,
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: AppColors.gold,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  _countdown(prayer.time),
                  style: GoogleFonts.lato(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: colors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 104,
            height: 108,
            child: CustomPaint(painter: _MosqueOutlinePainter()),
          ),
        ],
      ),
    );
  }
}

class _AllPrayersRow extends StatelessWidget {
  final List<Prayer> prayers;
  const _AllPrayersRow({required this.prayers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
      child: Row(
        children: prayers.map((prayer) {
          return Expanded(child: _PrayerPill(prayer: prayer));
        }).toList(),
      ),
    );
  }
}

class _PrayerPill extends StatelessWidget {
  final Prayer prayer;
  const _PrayerPill({required this.prayer});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final isDark = context.isDark;
    final isNext = prayer.isNext;
    final isPassed = prayer.isPassed;

    final passedBg = isDark ? const Color(0xFF222222) : const Color(0xFFF0F0F0);
    final passedIcon = isDark ? const Color(0xFF444444) : const Color(0xFFBBBBBB);
    final passedText = isDark ? const Color(0xFF555555) : const Color(0xFFAAAAAA);
    final passedTime = isDark ? const Color(0xFF444444) : const Color(0xFFBBBBBB);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        color: isNext
            ? AppColors.gold
            : isPassed
                ? passedBg
                : colors.secondaryBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconForPrayer(prayer.iconPath),
            size: 18,
            color: isNext
                ? Colors.white
                : isPassed
                    ? passedIcon
                    : AppColors.gold,
          ),
          const SizedBox(height: 5),
          Text(
            _localizedPrayerName(l10n, prayer),
            style: GoogleFonts.lato(
              fontSize: 10,
              fontWeight: isNext ? FontWeight.w700 : FontWeight.w500,
              color: isNext
                  ? Colors.white
                  : isPassed
                      ? passedText
                      : colors.primaryText,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            prayer.time.replaceAll(' AM', '').replaceAll(' PM', ''),
            style: GoogleFonts.lato(
              fontSize: 9.5,
              fontWeight: FontWeight.w600,
              color: isNext
                  ? Colors.white.withOpacity(0.88)
                  : isPassed
                      ? passedTime
                      : AppColors.gold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _iconForPrayer(String name) {
    switch (name) {
      case 'fajr':
        return Icons.wb_twilight_rounded;
      case 'dhuhr':
        return Icons.wb_sunny_rounded;
      case 'asr':
        return Icons.light_mode_outlined;
      case 'maghrib':
        return Icons.wb_twilight_rounded;
      case 'isha':
        return Icons.nightlight_round;
      default:
        return Icons.access_time;
    }
  }
}

class _MosqueOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = AppColors.gold.withOpacity(0.75)
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
      ..color = AppColors.gold.withOpacity(0.75)
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
