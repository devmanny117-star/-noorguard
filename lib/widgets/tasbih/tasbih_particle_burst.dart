import 'dart:math';
import 'package:flutter/material.dart';

class _Particle {
  final double angle;
  final double speed;
  final double size;
  final bool light;

  _Particle({
    required this.angle,
    required this.speed,
    required this.size,
    required this.light,
  });
}

/// Gold particle burst shown briefly when a dhikr (33) or a full round (99)
/// completes. Call [burst] via a GlobalKey to trigger it; bigger bursts use
/// a higher [BurstStyle.power] / particle count.
class TasbihParticleBurst extends StatefulWidget {
  final Color color;
  final Color colorLight;

  const TasbihParticleBurst({
    super.key,
    required this.color,
    required this.colorLight,
  });

  @override
  State<TasbihParticleBurst> createState() => TasbihParticleBurstState();
}

class TasbihParticleBurstState extends State<TasbihParticleBurst>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );
  final _rng = Random();
  List<_Particle> _particles = const [];

  void burst({int count = 36, double power = 1.0}) {
    _particles = List.generate(count, (_) {
      return _Particle(
        angle: _rng.nextDouble() * 2 * pi,
        speed: (0.55 + _rng.nextDouble() * 0.6) * power,
        size: 2.5 + _rng.nextDouble() * 4.0,
        light: _rng.nextBool(),
      );
    });
    _ctrl.forward(from: 0);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) {
          if (_particles.isEmpty || _ctrl.value >= 1.0) {
            return const SizedBox.shrink();
          }
          return CustomPaint(
            size: Size.infinite,
            painter: _BurstPainter(
              t: _ctrl.value,
              particles: _particles,
              color: widget.color,
              colorLight: widget.colorLight,
            ),
          );
        },
      ),
    );
  }
}

class _BurstPainter extends CustomPainter {
  final double t;
  final List<_Particle> particles;
  final Color color;
  final Color colorLight;

  _BurstPainter({
    required this.t,
    required this.particles,
    required this.color,
    required this.colorLight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxDistance = size.shortestSide * 0.55;
    final fade = (1 - t).clamp(0.0, 1.0);
    final eased = Curves.easeOutCubic.transform(t);
    final gravity = t * t * 50;

    for (final p in particles) {
      final distance = eased * maxDistance * p.speed;
      final offset = center +
          Offset(cos(p.angle) * distance, sin(p.angle) * distance + gravity);
      final paint = Paint()
        ..color = (p.light ? colorLight : color).withValues(alpha: fade);
      canvas.drawCircle(offset, p.size * (0.6 + 0.4 * fade), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BurstPainter oldDelegate) => true;
}
