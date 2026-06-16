import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../services/qibla_service.dart';
import '../l10n/app_localizations.dart';

// ── Constants ──────────────────────────────────────────────────────────────────

const _kGold = Color(0xFFD4AF37);
const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF1A2A3A);

const _kDefaultLat = 38.5816;
const _kDefaultLng = -121.4944;

const _kCompassSize = 284.0;
const _kNeedleFrac  = 0.58;
const _kNeedleTipY  = _kCompassSize / 2 * (1 - _kNeedleFrac);
const _kEmojiSize   = 22.0;
const _kEmojiTop    = _kNeedleTipY - _kEmojiSize / 2;

// Smoothing factor for the compass low-pass filter (sin/cos domain).
// Lower = more smoothing but slower response; 0.12 balances both well.
const _kLpfAlpha = 0.12;

// Needle must be within this many degrees of Mecca to trigger the gold glow.
const _kAlignThresholdDeg = 5.0;

// ── Accuracy helpers ───────────────────────────────────────────────────────────

// flutter_compass maps Android SensorManager levels to fixed degree values:
//   ACCURACY_HIGH   → 15°
//   ACCURACY_MEDIUM → 30°
//   ACCURACY_LOW    → 45°
//   UNRELIABLE      → null  (plugin sends −1, which it converts to null)
// On iOS the value is the true heading-accuracy in degrees from CLLocationManager.

enum _Accuracy { unknown, low, medium, high }

_Accuracy _classify(double? acc) {
  if (acc == null) return _Accuracy.unknown;
  if (acc <= 15)   return _Accuracy.high;
  if (acc <= 30)   return _Accuracy.medium;
  return            _Accuracy.low;
}

Color _accuracyColor(_Accuracy a) => switch (a) {
  _Accuracy.high    => const Color(0xFF4CAF50),
  _Accuracy.medium  => const Color(0xFFFFB300),
  _Accuracy.low     => const Color(0xFFEF5350),
  _Accuracy.unknown => const Color(0xFFEF5350),
};

String _accuracyLabel(_Accuracy a) => switch (a) {
  _Accuracy.high    => 'High Accuracy',
  _Accuracy.medium  => 'Medium Accuracy',
  _Accuracy.low     => 'Low Accuracy',
  _Accuracy.unknown => 'Calibrating…',
};

// ── Screen ────────────────────────────────────────────────────────────────────

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  // Location & qibla
  double _qiblaBearing  = 0;
  bool   _isLoading     = true;
  bool   _usingDefault  = false;
  String _locationLabel = '';

  // Needle state (unbounded accumulator for shortest-path interpolation)
  double _needleAngle     = 0;
  double _prevNeedleAngle = 0;

  // Compass heading (filtered) for the readout chip
  double _compassHeading = 0;

  // Low-pass filter state — maintained in sin/cos space to avoid 0°/360° jumps
  double _lpfSin  = 0.0;
  double _lpfCos  = 1.0;
  bool   _lpfInit = false;

  // Accuracy
  double?  _compassAccuracy;
  _Accuracy get _accuracyLevel => _classify(_compassAccuracy);

  // Calibration prompt visibility
  bool _calibrationDismissed = false;
  bool get _showCalibration =>
      !kIsWeb &&
      !_calibrationDismissed &&
      (_accuracyLevel == _Accuracy.low || _accuracyLevel == _Accuracy.unknown);

  // Accelerometer (spirit level) — low-pass filtered
  double _lpfAccelX = 0.0;
  double _lpfAccelY = 0.0;

  StreamSubscription<CompassEvent>?       _compassSub;
  StreamSubscription<AccelerometerEvent>? _accelSub;

  // ── Lifecycle ────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _resolveLocation();
    if (!kIsWeb) {
      _subscribeCompass();
      _subscribeAccelerometer();
    }
  }

  @override
  void dispose() {
    _compassSub?.cancel();
    _accelSub?.cancel();
    super.dispose();
  }

  // ── Location ─────────────────────────────────────────────────────────────────

  Future<void> _resolveLocation() async {
    try {
      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.denied ||
          perm == LocationPermission.deniedForever) {
        throw Exception('permission denied');
      }
      final pos = await Geolocator.getCurrentPosition()
          .timeout(const Duration(seconds: 10));
      _applyLocation(pos.latitude, pos.longitude, isDefault: false);
    } catch (_) {
      _applyLocation(_kDefaultLat, _kDefaultLng, isDefault: true);
    }
  }

  void _applyLocation(double lat, double lng, {required bool isDefault}) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _qiblaBearing  = QiblaService.calculateQiblaDirection(lat, lng);
      _usingDefault  = isDefault;
      _locationLabel = isDefault
          ? l10n.defaultLocation
          : '${lat.toStringAsFixed(2)}°, ${lng.toStringAsFixed(2)}°';
      _isLoading = false;
    });
  }

  // ── Compass stream ────────────────────────────────────────────────────────────

  void _subscribeCompass() {
    _compassSub = FlutterCompass.events?.listen((event) {
      if (event.heading == null || !mounted) return;

      final rad = event.heading! * math.pi / 180.0;

      // Initialise the filter on the first sample to avoid a long ramp-up from 0.
      if (!_lpfInit) {
        _lpfSin = math.sin(rad);
        _lpfCos = math.cos(rad);
        _lpfInit = true;
      } else {
        // Filter in sin/cos space — eliminates the wraparound discontinuity at
        // 0°/360° that would cause the needle to spin when crossing north.
        _lpfSin = _kLpfAlpha * math.sin(rad) + (1 - _kLpfAlpha) * _lpfSin;
        _lpfCos = _kLpfAlpha * math.cos(rad) + (1 - _kLpfAlpha) * _lpfCos;
      }

      final filteredHeading =
          (math.atan2(_lpfSin, _lpfCos) * 180.0 / math.pi + 360) % 360;

      // Shortest-path delta keeps the needle from spinning the long way round
      final rawAngle = (_qiblaBearing - filteredHeading + 360) % 360;
      final delta    = ((rawAngle - _needleAngle) + 180) % 360 - 180;

      final newLevel = _classify(event.accuracy);

      setState(() {
        _compassHeading  = filteredHeading;
        _compassAccuracy = event.accuracy;
        _prevNeedleAngle = _needleAngle;
        _needleAngle    += delta;

        // Reset manual dismiss when the sensor reaches full accuracy so that if
        // accuracy later drops again the calibration prompt can reappear.
        if (newLevel == _Accuracy.high) _calibrationDismissed = false;
      });
    });
  }

  // ── Accelerometer stream ──────────────────────────────────────────────────────

  void _subscribeAccelerometer() {
    try {
      _accelSub = accelerometerEventStream(
        samplingPeriod: SensorInterval.uiInterval,
      ).listen((e) {
        if (!mounted) return;
        // Light low-pass filter to smooth the bubble without making it feel laggy
        _lpfAccelX = 0.2 * e.x + 0.8 * _lpfAccelX;
        _lpfAccelY = 0.2 * e.y + 0.8 * _lpfAccelY;
        setState(() {}); // trigger repaint of spirit level
      });
    } catch (_) {
      // Accelerometer unavailable — spirit level stays centred
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor:            Colors.transparent,
        statusBarIconBrightness:   Brightness.light,
        statusBarBrightness:       Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: _kNavy,
        appBar: AppBar(
          backgroundColor: _kNavy,
          elevation: 0,
          iconTheme: const IconThemeData(color: _kGold),
          centerTitle: true,
          title: Text(
            l10n.qibla,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: _kGold.withValues(alpha: 0.15)),
          ),
        ),
        body: _isLoading ? _buildLoading() : _buildBody(l10n),
      ),
    );
  }

  Widget _buildLoading() => const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(_kGold),
      strokeWidth: 2,
    ),
  );

  Widget _buildBody(AppLocalizations l10n) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _LocationChip(label: _locationLabel, isDefault: _usingDefault),
            const SizedBox(height: 6),
            Text(
              l10n.directionToSacredHouse,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.4),
                letterSpacing: 0.4,
              ),
            ),
            if (!kIsWeb) ...[
              const SizedBox(height: 8),
              _AccuracyBadge(level: _accuracyLevel),
            ],
            Expanded(child: Center(child: _buildCompass())),
            // Calibration prompt — slides in/out automatically
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: SizeTransition(sizeFactor: anim, child: child),
              ),
              child: _showCalibration
                  ? Padding(
                      key: const ValueKey('cal'),
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _CalibrationPrompt(
                        onDismiss: () =>
                            setState(() => _calibrationDismissed = true),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('no-cal')),
            ),
            _buildReadout(l10n),
            if (!kIsWeb) ...[
              const SizedBox(height: 16),
              _SpiritLevel(x: _lpfAccelX, y: _lpfAccelY),
            ],
            if (kIsWeb) ...[
              const SizedBox(height: 24),
              _WebNote(label: l10n.compassRequiresDevice),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ── Compass widget ────────────────────────────────────────────────────────────

  Widget _buildCompass() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _prevNeedleAngle, end: _needleAngle),
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
      builder: (_, angle, __) {
        // Glow strength ramps from 0→1 as the needle approaches ±5° of Mecca
        final dist   = ((angle % 360 + 180) % 360 - 180).abs();
        final glow   = (1.0 - dist / _kAlignThresholdDeg).clamp(0.0, 1.0);

        return SizedBox(
          width: _kCompassSize,
          height: _kCompassSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer gold glow rings — appear when needle nears Mecca
              if (glow > 0)
                CustomPaint(
                  size: const Size(_kCompassSize, _kCompassSize),
                  painter: _AlignmentGlowPainter(strength: glow),
                ),

              // Fixed compass dial (never repaints)
              CustomPaint(
                size: const Size(_kCompassSize, _kCompassSize),
                painter: _CompassDialPainter(),
              ),

              // Rotating needle + Kaaba emoji
              Transform.rotate(
                angle: angle * math.pi / 180,
                child: SizedBox(
                  width: _kCompassSize,
                  height: _kCompassSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(_kCompassSize, _kCompassSize),
                        painter: _NeedlePainter(glowStrength: glow),
                      ),
                      const Positioned(
                        top: _kEmojiTop,
                        child: Text(
                          '🕋',
                          style: TextStyle(fontSize: _kEmojiSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Centre jewel
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: _kGold,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _kGold.withValues(alpha: 0.55),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Readout ───────────────────────────────────────────────────────────────────

  Widget _buildReadout(AppLocalizations l10n) {
    return Column(
      children: [
        Text(
          l10n.towardMecca(_qiblaBearing.toStringAsFixed(1)),
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
        const SizedBox(height: 10),
        if (!kIsWeb)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _kCard,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _kGold.withValues(alpha: 0.15), width: 1),
            ),
            child: Text(
              l10n.headingDegrees(_compassHeading.toStringAsFixed(0)),
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.5),
                letterSpacing: 1.0,
              ),
            ),
          ),
      ],
    );
  }
}

// ── Accuracy badge ────────────────────────────────────────────────────────────

class _AccuracyBadge extends StatelessWidget {
  final _Accuracy level;
  const _AccuracyBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    final color = _accuracyColor(level);
    final label = _accuracyLabel(level);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Container(
        key: ValueKey(level),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 4),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Calibration prompt ────────────────────────────────────────────────────────

class _CalibrationPrompt extends StatelessWidget {
  final VoidCallback onDismiss;
  const _CalibrationPrompt({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A3A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFEF5350).withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Text('∞', style: TextStyle(fontSize: 22, color: Color(0xFFEF5350))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Compass needs calibration',
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Move your phone slowly in a figure-8 motion to improve accuracy.',
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.55),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onDismiss,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.close_rounded,
                size: 18,
                color: Colors.white.withValues(alpha: 0.35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Spirit level ──────────────────────────────────────────────────────────────

class _SpiritLevel extends StatelessWidget {
  final double x; // accelerometer X (m/s²)
  final double y; // accelerometer Y (m/s²)
  const _SpiritLevel({required this.x, required this.y});

  static const _outerD = 80.0;

  @override
  Widget build(BuildContext context) {
    final tiltMag = math.sqrt(x * x + y * y);
    final isLevel = tiltMag < 1.5;
    final color   = tiltMag < 1.5 ? const Color(0xFF4CAF50)
                  : tiltMag < 3.5 ? const Color(0xFFFFB300)
                  :                  const Color(0xFFEF5350);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lens_blur_rounded,
              size: 12,
              color: _kGold.withValues(alpha: 0.45),
            ),
            const SizedBox(width: 4),
            Text(
              'Spirit Level',
              style: GoogleFonts.lato(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.38),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        CustomPaint(
          size: const Size(_outerD, _outerD),
          painter: _SpiritLevelPainter(x: x, y: y, bubbleColor: color),
        ),
        const SizedBox(height: 5),
        Text(
          isLevel ? '✓  Level' : 'Tilt to level',
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _SpiritLevelPainter extends CustomPainter {
  final double x;
  final double y;
  final Color  bubbleColor;
  const _SpiritLevelPainter({
    required this.x,
    required this.y,
    required this.bubbleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx      = size.width  / 2;
    final cy      = size.height / 2;
    final outerR  = size.width  / 2 - 1;
    const bubbleR = 9.0;
    final maxOff  = outerR - bubbleR - 3;

    // ── Background circle ───────────────────────────────────────────────────
    canvas.drawCircle(Offset(cx, cy), outerR, Paint()..color = _kCard);

    // Outer ring
    canvas.drawCircle(
      Offset(cx, cy),
      outerR,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.28)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // ── Crosshairs ──────────────────────────────────────────────────────────
    final cross = Paint()
      ..color      = Colors.white.withValues(alpha: 0.07)
      ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(cx - outerR + 8, cy), Offset(cx + outerR - 8, cy), cross);
    canvas.drawLine(
      Offset(cx, cy - outerR + 8), Offset(cx, cy + outerR - 8), cross);

    // Centre target ring
    canvas.drawCircle(
      Offset(cx, cy),
      bubbleR + 4,
      Paint()
        ..color      = Colors.white.withValues(alpha: 0.07)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // ── Bubble position ─────────────────────────────────────────────────────
    // Spirit level: bubble floats to the HIGH side (opposite of tilt direction).
    // When phone tilts right (+x), right is LOW → bubble goes LEFT (−x on screen).
    // When phone tilts with top down (−y from gravity on flat phone), top is LOW →
    // bubble goes toward bottom of screen (+y). We negate both axes so the bubble
    // moves to the high side.
    final rawDx = -(x / 4.0) * maxOff;
    final rawDy =  (y / 4.0) * maxOff; // screen Y is already inverted vs. device Y
    // Clamp bubble to stay inside the circle
    final dist  = math.sqrt(rawDx * rawDx + rawDy * rawDy);
    final scale = dist > maxOff ? maxOff / dist : 1.0;
    final bx    = cx + rawDx * scale;
    final by    = cy + rawDy * scale;

    // Bubble glow
    canvas.drawCircle(
      Offset(bx, by),
      bubbleR + 5,
      Paint()
        ..color      = bubbleColor.withValues(alpha: 0.20)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    // Bubble fill
    canvas.drawCircle(Offset(bx, by), bubbleR, Paint()..color = bubbleColor);

    // Highlight spot (gives a 3-D glass-ball look)
    canvas.drawCircle(
      Offset(bx - bubbleR * 0.28, by - bubbleR * 0.28),
      bubbleR * 0.32,
      Paint()..color = Colors.white.withValues(alpha: 0.40),
    );
  }

  @override
  bool shouldRepaint(_SpiritLevelPainter old) =>
      old.x != x || old.y != y || old.bubbleColor != bubbleColor;
}

// ── Alignment glow painter ────────────────────────────────────────────────────

class _AlignmentGlowPainter extends CustomPainter {
  final double strength; // 0.0 → 1.0
  const _AlignmentGlowPainter({required this.strength});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;

    // Wide outer halo
    canvas.drawCircle(
      c,
      r + 18,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.13 * strength)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22),
    );

    // Tighter inner ring
    canvas.drawCircle(
      c,
      r + 6,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.22 * strength)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );

    // Crisp rim highlight at full alignment
    if (strength > 0.7) {
      canvas.drawCircle(
        c,
        r,
        Paint()
          ..color      = _kGold.withValues(alpha: 0.45 * ((strength - 0.7) / 0.3))
          ..style      = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );
    }
  }

  @override
  bool shouldRepaint(_AlignmentGlowPainter old) => old.strength != strength;
}

// ── Compass dial painter ──────────────────────────────────────────────────────

class _CompassDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width  / 2;
    final cy = size.height / 2;
    final r  = size.width  / 2;

    // Background
    canvas.drawCircle(Offset(cx, cy), r, Paint()..color = _kNavy);

    // Subtle inner glow fill
    canvas.drawCircle(
      Offset(cx, cy),
      r * 0.68,
      Paint()
        ..color = _kGold.withValues(alpha: 0.04)
        ..style = PaintingStyle.fill,
    );

    // Outer gold rim
    canvas.drawCircle(
      Offset(cx, cy),
      r - 1.5,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.88)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Inner decorative ring
    canvas.drawCircle(
      Offset(cx, cy),
      r * 0.78,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.10)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // Degree tick marks
    for (int deg = 0; deg < 360; deg += 5) {
      final rad = deg * math.pi / 180;
      final sinA = math.sin(rad);
      final cosA = math.cos(rad);

      final (len, width, opacity) = switch (deg % 90) {
        0       => (20.0, 2.2, 1.00),
        45      => (13.0, 1.6, 0.80),
        _       => switch (deg % 30) {
            0   => (10.0, 1.4, 0.65),
            _   => switch (deg % 10) {
                0 => ( 6.0, 1.0, 0.40),
                _ => ( 3.5, 0.8, 0.22),
              },
          },
      };

      final outerR = r - 4;
      final innerR = outerR - len;
      canvas.drawLine(
        Offset(cx + outerR * sinA, cy - outerR * cosA),
        Offset(cx + innerR * sinA, cy - innerR * cosA),
        Paint()
          ..color      = _kGold.withValues(alpha: opacity)
          ..strokeWidth = width
          ..strokeCap  = StrokeCap.round,
      );
    }

    // Cardinal letters
    _paintCardinal(canvas, cx, cy, r, 'N',   0, large: true);
    _paintCardinal(canvas, cx, cy, r, 'E',  90);
    _paintCardinal(canvas, cx, cy, r, 'S', 180);
    _paintCardinal(canvas, cx, cy, r, 'W', 270);
  }

  void _paintCardinal(Canvas canvas, double cx, double cy, double r,
      String letter, int deg, {bool large = false}) {
    final rad    = deg * math.pi / 180;
    final labelR = r * 0.60;
    final x      = cx + labelR * math.sin(rad);
    final y      = cy - labelR * math.cos(rad);

    final tp = TextPainter(
      text: TextSpan(
        text: letter,
        style: TextStyle(
          fontSize:   large ? 17 : 13,
          fontWeight: FontWeight.w800,
          color:      _kGold.withValues(alpha: large ? 1.0 : 0.60),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
  }

  @override
  bool shouldRepaint(_CompassDialPainter old) => false;
}

// ── Needle painter ────────────────────────────────────────────────────────────

class _NeedlePainter extends CustomPainter {
  final double glowStrength; // 0.0 → 1.0
  const _NeedlePainter({this.glowStrength = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width  / 2;
    final cy = size.height / 2;
    final r  = size.width  / 2;

    final tipY      = cy - r * _kNeedleFrac;
    const baseWidth = 8.0;
    final indentY   = cy + r * 0.06;

    final goldPath = Path()
      ..moveTo(cx, tipY)
      ..lineTo(cx - baseWidth, cy)
      ..lineTo(cx, indentY)
      ..lineTo(cx + baseWidth, cy)
      ..close();

    // Enhanced glow when aligned with Mecca
    final glowAlpha  = 0.28 + 0.35 * glowStrength;
    final glowRadius = 7.0  + 10.0 * glowStrength;
    canvas.drawPath(
      goldPath,
      Paint()
        ..color      = _kGold.withValues(alpha: glowAlpha)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius)
        ..style      = PaintingStyle.fill,
    );

    // Solid gold fill
    canvas.drawPath(goldPath, Paint()..color = _kGold..style = PaintingStyle.fill);

    // Thin border for definition
    canvas.drawPath(
      goldPath,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.6)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // Muted tail (south end)
    final tailPath = Path()
      ..moveTo(cx, cy + r * 0.30)
      ..lineTo(cx - 5, cy)
      ..lineTo(cx + 5, cy)
      ..close();
    canvas.drawPath(
      tailPath,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.16)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(_NeedlePainter old) => old.glowStrength != glowStrength;
}

// ── Location chip ─────────────────────────────────────────────────────────────

class _LocationChip extends StatelessWidget {
  final String label;
  final bool   isDefault;
  const _LocationChip({required this.label, required this.isDefault});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _kGold.withValues(alpha: isDefault ? 0.18 : 0.40),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDefault ? Icons.location_off_outlined : Icons.my_location_rounded,
            color: isDefault ? Colors.white30 : _kGold,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 12,
              color: isDefault
                  ? Colors.white.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.70),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Web note ──────────────────────────────────────────────────────────────────

class _WebNote extends StatelessWidget {
  final String label;
  const _WebNote({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kGold.withValues(alpha: 0.20), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.smartphone_outlined, color: _kGold, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.lato(fontSize: 13, color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}
