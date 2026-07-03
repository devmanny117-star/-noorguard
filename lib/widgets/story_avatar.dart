import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _kNavy = Color(0xFF0D1B2A);
const _kGold = Color(0xFFC9A84C);

/// Icon ids for the "Icon" avatar style, in picker order. The id string is
/// what gets stored in Firestore's `avatarData`.
const List<String> kStoryAvatarIcons = [
  'crescent',
  'star',
  'dome',
  'palm',
  'mountain',
  'lantern',
  'beads',
  'book',
  'compass',
  'sun',
  'clouds',
  'wave',
];

/// Community Stories author avatar — dark navy circle with gold content.
///
/// `avatarType`: 'initials' (default), 'icon' (avatarData = icon id from
/// [kStoryAvatarIcons]) or 'pattern' (avatarData = seed string, usually
/// "<userId>#<variant>"). Unknown/missing data falls back to initials.
class StoryAvatar extends StatelessWidget {
  final String avatarType;
  final String? avatarData;
  final String initials;
  final double size;
  final double borderWidth;

  const StoryAvatar({
    super.key,
    required this.avatarType,
    required this.avatarData,
    required this.initials,
    this.size = 40,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    final data = avatarData;
    Widget child;
    if (avatarType == 'icon' && data != null && kStoryAvatarIcons.contains(data)) {
      child = CustomPaint(
        size: Size.square(size),
        painter: IslamicIconPainter(icon: data, color: _kGold),
      );
    } else if (avatarType == 'pattern' && data != null && data.isNotEmpty) {
      child = CustomPaint(
        size: Size.square(size),
        painter: GeometricAvatarPainter(seed: data, color: _kGold),
      );
    } else {
      child = Center(
        child: Text(
          initials,
          style: GoogleFonts.playfairDisplay(
            fontSize: size * 0.35,
            fontWeight: FontWeight.w800,
            color: _kGold,
          ),
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _kNavy,
        border: Border.all(
          color: _kGold.withValues(alpha: 0.7),
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}

/// Unique geometric avatar derived deterministically from a seed string —
/// concentric rotated stars/polygons in gold on the navy circle.
class GeometricAvatarPainter extends CustomPainter {
  final String seed;
  final Color color;
  const GeometricAvatarPainter({required this.seed, required this.color});

  /// FNV-1a — stable across platforms/releases, unlike String.hashCode.
  static int _hash(String s) {
    var h = 0x811C9DC5;
    for (final c in s.codeUnits) {
      h ^= c;
      h = (h * 0x01000193) & 0x7FFFFFFF;
    }
    return h;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final h = _hash(seed);
    final center = Offset(size.width / 2, size.height / 2);
    final maxR = size.shortestSide * 0.40;
    final rings = 2 + (h & 1);

    for (var i = 0; i < rings; i++) {
      final bits = h >> (i * 7);
      final sides = 5 + (bits & 3);
      final rotation = ((bits >> 2) % 60) * math.pi / 180;
      final isStar = (bits >> 4) & 1 == 1;
      final r = maxR * (1 - i * 0.34);
      final paint = Paint()
        ..color = color.withValues(alpha: 0.9 - i * 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, size.shortestSide * 0.045);
      canvas.drawPath(_polyPath(center, r, sides, rotation, isStar), paint);
    }
    canvas.drawCircle(
      center,
      size.shortestSide * 0.05,
      Paint()..color = color.withValues(alpha: 0.9),
    );
  }

  Path _polyPath(Offset c, double r, int sides, double rot, bool star) {
    final path = Path();
    final n = star ? sides * 2 : sides;
    for (var i = 0; i < n; i++) {
      final radius = (star && i.isOdd) ? r * 0.5 : r;
      final a = rot - math.pi / 2 + i * 2 * math.pi / n;
      final p =
          Offset(c.dx + radius * math.cos(a), c.dy + radius * math.sin(a));
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    return path..close();
  }

  @override
  bool shouldRepaint(GeometricAvatarPainter old) =>
      old.seed != seed || old.color != color;
}

/// The 12 illustrated Islamic avatar icons, drawn in code (no assets).
class IslamicIconPainter extends CustomPainter {
  final String icon;
  final Color color;
  const IslamicIconPainter({required this.icon, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = math.max(1.2, s * 0.055)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final fill = Paint()..color = color;
    Offset p(double x, double y) => Offset(x * s, y * s);

    switch (icon) {
      case 'crescent':
        final r = s * 0.28;
        final path = Path.combine(
          PathOperation.difference,
          Path()..addOval(Rect.fromCircle(center: p(0.5, 0.5), radius: r)),
          Path()
            ..addOval(Rect.fromCircle(
                center: p(0.5, 0.5).translate(r * 0.45, -r * 0.2),
                radius: r * 0.85)),
        );
        canvas.drawPath(path, fill);
      case 'star':
        final path = Path();
        for (var i = 0; i < 10; i++) {
          final radius = i.isEven ? s * 0.30 : s * 0.13;
          final a = -math.pi / 2 + i * math.pi / 5;
          final pt = Offset(0.5 * s + radius * math.cos(a),
              0.52 * s + radius * math.sin(a));
          if (i == 0) {
            path.moveTo(pt.dx, pt.dy);
          } else {
            path.lineTo(pt.dx, pt.dy);
          }
        }
        canvas.drawPath(path..close(), fill);
      case 'dome':
        canvas.drawArc(Rect.fromCircle(center: p(0.5, 0.60), radius: s * 0.22),
            math.pi, math.pi, false, stroke);
        canvas.drawLine(p(0.24, 0.60), p(0.76, 0.60), stroke);
        canvas.drawLine(p(0.5, 0.38), p(0.5, 0.28), stroke);
        canvas.drawCircle(p(0.5, 0.25), s * 0.03, fill);
      case 'palm':
        final trunk = Path()
          ..moveTo(0.48 * s, 0.78 * s)
          ..quadraticBezierTo(0.56 * s, 0.60 * s, 0.54 * s, 0.42 * s);
        canvas.drawPath(trunk, stroke);
        for (final (dx, dy) in [(-0.20, -0.06), (-0.13, -0.16), (0.02, -0.20), (0.16, -0.12), (0.20, 0.0)]) {
          final frond = Path()
            ..moveTo(0.54 * s, 0.42 * s)
            ..quadraticBezierTo((0.54 + dx * 0.6) * s, (0.42 + dy - 0.06) * s,
                (0.54 + dx) * s, (0.42 + dy) * s);
          canvas.drawPath(frond, stroke);
        }
      case 'mountain':
        final path = Path()
          ..moveTo(0.18 * s, 0.70 * s)
          ..lineTo(0.42 * s, 0.36 * s)
          ..lineTo(0.55 * s, 0.54 * s)
          ..lineTo(0.65 * s, 0.42 * s)
          ..lineTo(0.82 * s, 0.70 * s);
        canvas.drawPath(path, stroke);
      case 'lantern':
        canvas.drawLine(p(0.5, 0.24), p(0.5, 0.32), stroke);
        canvas.drawArc(Rect.fromCircle(center: p(0.5, 0.42), radius: s * 0.10),
            math.pi, math.pi, false, stroke);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTRB(0.38 * s, 0.42 * s, 0.62 * s, 0.68 * s),
              Radius.circular(s * 0.05)),
          stroke,
        );
        canvas.drawLine(p(0.5, 0.46), p(0.5, 0.64), stroke);
      case 'beads':
        for (var i = 0; i < 9; i++) {
          final a = -math.pi / 2 + i * 2 * math.pi / 11;
          canvas.drawCircle(
              Offset(0.5 * s + 0.22 * s * math.cos(a),
                  0.44 * s + 0.22 * s * math.sin(a)),
              s * 0.04,
              fill);
        }
        canvas.drawLine(p(0.5, 0.66), p(0.5, 0.76), stroke);
        canvas.drawCircle(p(0.5, 0.79), s * 0.035, fill);
      case 'book':
        final left = Path()
          ..moveTo(0.5 * s, 0.44 * s)
          ..quadraticBezierTo(0.36 * s, 0.36 * s, 0.24 * s, 0.42 * s)
          ..lineTo(0.24 * s, 0.62 * s)
          ..quadraticBezierTo(0.36 * s, 0.56 * s, 0.5 * s, 0.64 * s);
        final right = Path()
          ..moveTo(0.5 * s, 0.44 * s)
          ..quadraticBezierTo(0.64 * s, 0.36 * s, 0.76 * s, 0.42 * s)
          ..lineTo(0.76 * s, 0.62 * s)
          ..quadraticBezierTo(0.64 * s, 0.56 * s, 0.5 * s, 0.64 * s);
        canvas.drawPath(left, stroke);
        canvas.drawPath(right, stroke);
        canvas.drawLine(p(0.5, 0.44), p(0.5, 0.64), stroke);
      case 'compass':
        canvas.drawCircle(p(0.5, 0.5), s * 0.26, stroke);
        final needle = Path()
          ..moveTo(0.5 * s, 0.32 * s)
          ..lineTo(0.57 * s, 0.5 * s)
          ..lineTo(0.5 * s, 0.68 * s)
          ..lineTo(0.43 * s, 0.5 * s);
        canvas.drawPath(needle..close(), fill);
        canvas.drawLine(p(0.5, 0.20), p(0.5, 0.26), stroke);
      case 'sun':
        canvas.drawCircle(p(0.5, 0.5), s * 0.15, stroke);
        for (var i = 0; i < 8; i++) {
          final a = i * math.pi / 4;
          canvas.drawLine(
            Offset(0.5 * s + 0.22 * s * math.cos(a),
                0.5 * s + 0.22 * s * math.sin(a)),
            Offset(0.5 * s + 0.30 * s * math.cos(a),
                0.5 * s + 0.30 * s * math.sin(a)),
            stroke,
          );
        }
      case 'clouds':
        canvas.drawArc(Rect.fromCircle(center: p(0.40, 0.52), radius: s * 0.13),
            math.pi * 0.9, math.pi * 1.1, false, stroke);
        canvas.drawArc(Rect.fromCircle(center: p(0.60, 0.48), radius: s * 0.11),
            math.pi * 1.1, math.pi * 1.0, false, stroke);
        canvas.drawLine(p(0.28, 0.63), p(0.72, 0.63), stroke);
      case 'wave':
        for (final y in [0.42, 0.56, 0.70]) {
          final path = Path()..moveTo(0.22 * s, y * s);
          path.quadraticBezierTo(
              0.36 * s, (y - 0.10) * s, 0.5 * s, y * s);
          path.quadraticBezierTo(
              0.64 * s, (y + 0.10) * s, 0.78 * s, y * s);
          canvas.drawPath(path, stroke);
        }
    }
  }

  @override
  bool shouldRepaint(IslamicIconPainter old) =>
      old.icon != icon || old.color != color;
}
