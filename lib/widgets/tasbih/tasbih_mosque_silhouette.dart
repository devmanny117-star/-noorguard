import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Very faint static mosque silhouette anchored to the bottom of the
/// screen, used as a background texture on the tasbih counter. Wrapped in
/// [IgnorePointer] and painted once (no animation), so it never interferes
/// with the tap-anywhere counter.
class TasbihMosqueSilhouette extends StatelessWidget {
  final Color color;

  const TasbihMosqueSilhouette({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: _MosqueSilhouettePainter(color: color),
      ),
    );
  }
}

class _MosqueSilhouettePainter extends CustomPainter {
  final Color color;
  const _MosqueSilhouettePainter({required this.color});

  void _dome(Path path, double cx, double baseY, double r) {
    path.addArc(Rect.fromCircle(center: Offset(cx, baseY), radius: r), math.pi,
        math.pi);
    path.addRect(Rect.fromLTRB(cx - r, baseY - 1, cx + r, baseY + 6));
  }

  void _minaret(Path path, double cx, double baseY, double towerHeight,
      double towerWidth) {
    final top = baseY - towerHeight;
    path.addRect(Rect.fromLTRB(cx - towerWidth, top, cx + towerWidth, baseY));
    _dome(path, cx, top, towerWidth * 1.6);
    path.addRect(Rect.fromLTRB(
        cx - 1, top - towerWidth * 1.6 - 14, cx + 1, top - towerWidth * 1.6));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final baseY = h * 0.76;
    final cx = w / 2;
    final path = Path();

    path.addRect(
        Rect.fromLTRB(cx - w * 0.32, baseY, cx + w * 0.32, baseY + h * 0.24));

    final domeR = w * 0.13;
    _dome(path, cx, baseY, domeR);
    path.addRect(
        Rect.fromLTRB(cx - 1.5, baseY - domeR - 16, cx + 1.5, baseY - domeR));

    _dome(path, cx - w * 0.15, baseY, w * 0.065);
    _dome(path, cx + w * 0.15, baseY, w * 0.065);

    _minaret(path, cx - w * 0.27, baseY + h * 0.05, h * 0.30, w * 0.018);
    _minaret(path, cx + w * 0.27, baseY + h * 0.05, h * 0.30, w * 0.018);

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _MosqueSilhouettePainter oldDelegate) =>
      oldDelegate.color != color;
}
