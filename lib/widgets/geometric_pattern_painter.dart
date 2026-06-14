import 'dart:math' show cos, sin, pi;
import 'package:flutter/material.dart';

/// Subtle repeating 8-pointed Islamic star pattern, used as a background
/// texture on dark navy/gold cards (Revert Corner, unified prayer card).
class GeometricPatternPainter extends CustomPainter {
  const GeometricPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37).withValues(alpha: 0.07)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    const r = 13.0;
    const spacing = 52.0;

    for (double y = 0; y <= size.height + r; y += spacing) {
      for (double x = 0; x <= size.width + r; x += spacing) {
        _drawEightPointedStar(canvas, Offset(x, y), r, paint);
      }
    }
  }

  void _drawEightPointedStar(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (int i = 0; i < 16; i++) {
      final angle = i * pi / 8 - pi / 2;
      final radius = i.isEven ? r : r * 0.38;
      final x = c.dx + cos(angle) * radius;
      final y = c.dy + sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(GeometricPatternPainter old) => false;
}
