import 'package:flutter/material.dart';

const _kGold = Color(0xFFC9A84C);

/// Filled crescent moon + 5-pointed star, same SVG path as the share card
/// branding mark. Renders gold by default; pass [color] to override.
class CrescentStarPainter extends CustomPainter {
  final Color color;
  const CrescentStarPainter({this.color = _kGold});

  @override
  void paint(Canvas canvas, Size size) {
    // SVG viewBox is "-2 -2 36 36": map that coordinate space onto the canvas.
    final sx = size.width / 36.0;
    final sy = size.height / 36.0;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(2 * sx, 2 * sy);
    canvas.scale(sx, sy);

    // Crescent: M24 16 A12 12 0 1 1 12 4 A10 10 0 1 0 24 16Z
    final crescent = Path()
      ..moveTo(24, 16)
      ..arcToPoint(const Offset(12, 4),
          radius: const Radius.circular(12), largeArc: true, clockwise: true)
      ..arcToPoint(const Offset(24, 16),
          radius: const Radius.circular(10), largeArc: true, clockwise: false)
      ..close();
    canvas.drawPath(crescent, paint);

    // Star: 10-point polygon
    const pts = [
      Offset(22, 4),    Offset(23.2, 7.5),  Offset(27, 7.5),
      Offset(24, 9.8),  Offset(25.2, 13.5), Offset(22, 11.2),
      Offset(18.8, 13.5), Offset(20, 9.8),  Offset(17, 7.5),
      Offset(20.8, 7.5),
    ];
    final star = Path()..moveTo(pts[0].dx, pts[0].dy);
    for (var i = 1; i < pts.length; i++) {
      star.lineTo(pts[i].dx, pts[i].dy);
    }
    star.close();
    canvas.drawPath(star, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CrescentStarPainter old) => old.color != color;
}
