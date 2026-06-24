import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 33 beads threaded on a thin gold string, arranged in a circle like a
/// real misbaha. Purely decorative — wrapped in [IgnorePointer] so taps
/// always fall through to the screen's tap-anywhere counter beneath it.
class TasbihBeadRing extends StatefulWidget {
  final int count;
  final int target;
  final double size;
  final Color gold;
  final Color goldLight;
  final Color brightGold;

  const TasbihBeadRing({
    super.key,
    required this.count,
    required this.target,
    required this.gold,
    required this.goldLight,
    required this.brightGold,
    this.size = 270,
  });

  @override
  State<TasbihBeadRing> createState() => _TasbihBeadRingState();
}

class _TasbihBeadRingState extends State<TasbihBeadRing>
    with TickerProviderStateMixin {
  late final AnimationController _pulseCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);

  late final AnimationController _reactionCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 360),
  );

  bool _flashAll = false;

  @override
  void didUpdateWidget(covariant TasbihBeadRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.count > oldWidget.count) {
      _flashAll = widget.count >= widget.target;
      _reactionCtrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    _reactionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: Listenable.merge([_pulseCtrl, _reactionCtrl]),
          builder: (context, _) => CustomPaint(
            painter: _BeadRingPainter(
              count: widget.count,
              target: widget.target,
              pulse: _pulseCtrl.value,
              reaction: _reactionCtrl.value,
              flashAll: _flashAll,
              gold: widget.gold,
              goldLight: widget.goldLight,
              brightGold: widget.brightGold,
            ),
          ),
        ),
      ),
    );
  }
}

class _BeadRingPainter extends CustomPainter {
  final int count;
  final int target;
  final double pulse;
  final double reaction;
  final bool flashAll;
  final Color gold;
  final Color goldLight;
  final Color brightGold;

  _BeadRingPainter({
    required this.count,
    required this.target,
    required this.pulse,
    required this.reaction,
    required this.flashAll,
    required this.gold,
    required this.goldLight,
    required this.brightGold,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (target <= 0) return;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 14;
    const beadRadius = 6.5;
    final justLitIndex = count - 1;
    final reactionStrength = (1 - reaction).clamp(0.0, 1.0);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = gold.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4,
    );

    for (int i = 0; i < target; i++) {
      final angle = -math.pi / 2 + i * (2 * math.pi / target);
      final beadCenter =
          center + Offset(math.cos(angle), math.sin(angle)) * radius;

      final completed = i < count;
      final isCurrent = i == count && count < target;
      final isJustLit = i == justLitIndex && reactionStrength > 0;

      double r = beadRadius;
      Color fill;

      if (flashAll && reactionStrength > 0) {
        fill = Color.lerp(gold, Colors.white, reactionStrength * 0.85) ?? gold;
        r = beadRadius * (1 + reactionStrength * 0.4);
      } else if (isJustLit) {
        fill = Color.lerp(gold, Colors.white, reactionStrength * 0.85) ?? gold;
        r = beadRadius * (1 + reactionStrength * 0.6);
      } else if (completed) {
        fill = gold;
      } else if (isCurrent) {
        fill = brightGold;
      } else {
        fill = gold.withValues(alpha: 0.2);
      }

      if (isCurrent) {
        canvas.drawCircle(
          beadCenter,
          beadRadius * 1.7,
          Paint()
            ..color = brightGold.withValues(alpha: 0.30 + pulse * 0.25)
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5 + pulse * 4),
        );
      }

      canvas.drawCircle(beadCenter, r, Paint()..color = fill);

      if (completed || isCurrent || isJustLit) {
        final shineCenter = beadCenter + Offset(-r * 0.32, -r * 0.32);
        canvas.drawCircle(
          shineCenter,
          r * 0.34,
          Paint()..color = Colors.white.withValues(alpha: 0.45),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BeadRingPainter oldDelegate) => true;
}
