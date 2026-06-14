import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class QuoteBanner extends StatelessWidget {
  const QuoteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 112,
          color: colors.warmBg,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 112,
                child: CustomPaint(painter: _IslamicStarPainter()),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 18, 18, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '"${l10n.verityWithHardship}"',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: colors.primaryText,
                          fontStyle: FontStyle.italic,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.ashSharh946,
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IslamicStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final fillPaint = Paint()
      ..color = AppColors.gold.withOpacity(0.10)
      ..style = PaintingStyle.fill;
    _drawStar(canvas, fillPaint, Offset(cx, cy), 44.0);

    final strokeOuter = Paint()
      ..color = AppColors.gold.withOpacity(0.60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeJoin = StrokeJoin.round;
    _drawStar(canvas, strokeOuter, Offset(cx, cy), 44.0);

    final strokeInner = Paint()
      ..color = AppColors.gold.withOpacity(0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    _drawStar(canvas, strokeInner, Offset(cx, cy), 26.0);

    final strokeCenter = Paint()
      ..color = AppColors.gold.withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    _drawStar(canvas, strokeCenter, Offset(cx, cy), 13.0);

    final dotPaint = Paint()
      ..color = AppColors.gold.withOpacity(0.40)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy - 50), 2.0, dotPaint);
    canvas.drawCircle(Offset(cx, cy + 50), 2.0, dotPaint);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 8; i++) {
      final outer = (i * math.pi / 4) - math.pi / 2;
      final inner = outer + math.pi / 8;
      final ox = center.dx + r * math.cos(outer);
      final oy = center.dy + r * math.sin(outer);
      final ix = center.dx + r * 0.42 * math.cos(inner);
      final iy = center.dy + r * 0.42 * math.sin(inner);
      i == 0 ? path.moveTo(ox, oy) : path.lineTo(ox, oy);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_IslamicStarPainter old) => false;
}
