import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Small outline crescent moon + star, opening to the right (the star sits
/// inside the crescent's open side) — a lighter-weight echo of the filled
/// splash-screen crescent, used as a tiny decorative mark above the dhikr
/// name on the tasbih counter screen.
class TasbihCrescentStarIcon extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const TasbihCrescentStarIcon({
    super.key,
    required this.color,
    this.width = 34,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(painter: _CrescentStarPainter(color: color)),
    );
  }
}

class _CrescentStarPainter extends CustomPainter {
  final Color color;
  const _CrescentStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width * 0.36;
    final cy = size.height * 0.5;
    final r = size.height * 0.46;

    final outer = Path()
      ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    final inner = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(cx + r * 0.36, cy - r * 0.08),
        radius: r * 0.8,
      ));
    final crescent = Path.combine(PathOperation.difference, outer, inner);

    canvas.drawPath(
      crescent,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.3,
    );

    _drawStar(
      canvas,
      Offset(size.width * 0.82, size.height * 0.36),
      size.height * 0.18,
    );
  }

  void _drawStar(Canvas canvas, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final outerAngle = i * 2 * math.pi / 5 - math.pi / 2;
      final innerAngle = outerAngle + math.pi / 5;
      final ox = center.dx + r * math.cos(outerAngle);
      final oy = center.dy + r * math.sin(outerAngle);
      final ix = center.dx + r * 0.42 * math.cos(innerAngle);
      final iy = center.dy + r * 0.42 * math.sin(innerAngle);
      i == 0 ? path.moveTo(ox, oy) : path.lineTo(ox, oy);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  @override
  bool shouldRepaint(covariant _CrescentStarPainter oldDelegate) => false;
}
