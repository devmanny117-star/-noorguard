import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_compass/flutter_compass.dart';
import '../services/qibla_service.dart';
import '../l10n/app_localizations.dart';

// ── Constants ─────────────────────────────────────────────────────────────────

const _kGold  = Color(0xFFD4AF37);
const _kNavy  = Color(0xFF0D1B2A);
const _kCard  = Color(0xFF1A2A3A);

const _kDefaultLat =  38.5816;
const _kDefaultLng = -121.4944;

// Compass widget dimensions
const _kCompassSize   = 284.0;
const _kNeedleFrac    = 0.58;   // needle tip as fraction of radius above center
const _kNeedleTipY    = _kCompassSize / 2 * (1 - _kNeedleFrac); // ≈ 59.6 from top
const _kEmojiSize     = 22.0;
const _kEmojiTop      = _kNeedleTipY - _kEmojiSize / 2; // center emoji on tip

// ── Screen ────────────────────────────────────────────────────────────────────

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double _qiblaBearing    = 0;
  double _needleAngle     = 0;   // current target (unbounded for shortest-path)
  double _prevNeedleAngle = 0;   // previous target, for TweenAnimationBuilder
  double _compassHeading  = 0;
  bool   _isLoading       = true;
  bool   _usingDefault    = false;
  String _locationLabel   = '';

  StreamSubscription<CompassEvent>? _compassSub;

  // ── Lifecycle ───────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _resolveLocation();
    if (!kIsWeb) _subscribeCompass();
  }

  @override
  void dispose() {
    _compassSub?.cancel();
    super.dispose();
  }

  // ── Location ────────────────────────────────────────────────────────────────

  Future<void> _resolveLocation() async {
    try {
      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.denied ||
          perm == LocationPermission.deniedForever) {
        throw Exception('location permission denied');
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
      _isLoading     = false;
    });
  }

  // ── Compass stream ──────────────────────────────────────────────────────────

  void _subscribeCompass() {
    _compassSub = FlutterCompass.events?.listen((event) {
      if (event.heading == null || !mounted) return;
      final heading  = event.heading!;
      final rawAngle = (_qiblaBearing - heading + 360) % 360;

      // Shortest-path interpolation to avoid spinning the long way round
      final delta      = ((rawAngle - _needleAngle) + 180) % 360 - 180;
      final smoothAngle = _needleAngle + delta;

      setState(() {
        _compassHeading  = heading;
        _prevNeedleAngle = _needleAngle;
        _needleAngle     = smoothAngle;
      });
    });
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
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
            child: Container(
              height: 1,
              color: _kGold.withValues(alpha: 0.15),
            ),
          ),
        ),
        body: _isLoading ? _buildLoading() : _buildBody(l10n),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(_kGold),
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildBody(AppLocalizations l10n) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _LocationChip(label: _locationLabel, isDefault: _usingDefault),
            const SizedBox(height: 8),
            Text(
              l10n.directionToSacredHouse,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.4),
                letterSpacing: 0.4,
              ),
            ),
            Expanded(
              child: Center(child: _buildCompass()),
            ),
            _buildReadout(l10n),
            if (kIsWeb) ...[
              const SizedBox(height: 24),
              _WebNote(label: l10n.compassRequiresDevice),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ── Compass widget ───────────────────────────────────────────────────────────

  Widget _buildCompass() {
    return SizedBox(
      width: _kCompassSize,
      height: _kCompassSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fixed dial
          CustomPaint(
            size: const Size(_kCompassSize, _kCompassSize),
            painter: _CompassDialPainter(),
          ),

          // Rotating needle (animates smoothly between headings)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: _prevNeedleAngle, end: _needleAngle),
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOut,
            builder: (_, angle, __) {
              return Transform.rotate(
                angle: angle * math.pi / 180,
                child: const SizedBox(
                  width: _kCompassSize,
                  height: _kCompassSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Needle body
                      CustomPaint(
                        size: Size(_kCompassSize, _kCompassSize),
                        painter: _NeedlePainter(),
                      ),
                      // Kaaba emoji at tip
                      Positioned(
                        top: _kEmojiTop,
                        child: Text(
                          '🕋',
                          style: TextStyle(fontSize: _kEmojiSize),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
  }

  // ── Readout ──────────────────────────────────────────────────────────────────

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
        if (!kIsWeb) ...[
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
      ],
    );
  }
}

// ── Supporting widgets ────────────────────────────────────────────────────────

class _LocationChip extends StatelessWidget {
  final String label;
  final bool isDefault;
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

// ── Compass dial painter ──────────────────────────────────────────────────────

class _CompassDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width  / 2;
    final cy = size.height / 2;
    final r  = size.width  / 2;

    // ── Background ─────────────────────────────────────────────────────────
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()..color = _kNavy,
    );

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
        ..color = _kGold.withValues(alpha: 0.88)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Inner decorative ring
    canvas.drawCircle(
      Offset(cx, cy),
      r * 0.78,
      Paint()
        ..color = _kGold.withValues(alpha: 0.10)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // ── Degree tick marks ──────────────────────────────────────────────────
    for (int deg = 0; deg < 360; deg += 5) {
      final rad = deg * math.pi / 180;
      final sin = math.sin(rad);
      final cos = math.cos(rad);

      final double len;
      final double width;
      final double opacity;

      if (deg % 90 == 0) {
        len     = 20;
        width   = 2.2;
        opacity = 1.0;
      } else if (deg % 45 == 0) {
        len     = 13;
        width   = 1.6;
        opacity = 0.80;
      } else if (deg % 30 == 0) {
        len     = 10;
        width   = 1.4;
        opacity = 0.65;
      } else if (deg % 10 == 0) {
        len     = 6;
        width   = 1.0;
        opacity = 0.40;
      } else {
        len     = 3.5;
        width   = 0.8;
        opacity = 0.22;
      }

      final outerR = r - 4;
      final innerR = outerR - len;

      canvas.drawLine(
        Offset(cx + outerR * sin, cy - outerR * cos),
        Offset(cx + innerR * sin, cy - innerR * cos),
        Paint()
          ..color      = _kGold.withValues(alpha: opacity)
          ..strokeWidth = width
          ..strokeCap  = StrokeCap.round,
      );
    }

    // ── Cardinal letters ───────────────────────────────────────────────────
    _paintCardinal(canvas, cx, cy, r, 'N',   0, large: true);
    _paintCardinal(canvas, cx, cy, r, 'E',  90);
    _paintCardinal(canvas, cx, cy, r, 'S', 180);
    _paintCardinal(canvas, cx, cy, r, 'W', 270);
  }

  void _paintCardinal(
    Canvas canvas,
    double cx,
    double cy,
    double r,
    String letter,
    int deg, {
    bool large = false,
  }) {
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
  const _NeedlePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width  / 2;
    final cy = size.height / 2;
    final r  = size.width  / 2;

    // Tip and base geometry
    final tipY      = cy - r * _kNeedleFrac;
    const baseWidth = 8.0;
    final indentY   = cy + r * 0.06; // slight concave at base

    // Gold needle (points UP = toward Mecca in local coords)
    final goldPath = Path()
      ..moveTo(cx, tipY)
      ..lineTo(cx - baseWidth, cy)
      ..lineTo(cx, indentY)
      ..lineTo(cx + baseWidth, cy)
      ..close();

    // Glow pass
    canvas.drawPath(
      goldPath,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.28)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7)
        ..style      = PaintingStyle.fill,
    );

    // Solid gold fill
    canvas.drawPath(
      goldPath,
      Paint()
        ..color = _kGold
        ..style = PaintingStyle.fill,
    );

    // Thin crisp border for definition
    canvas.drawPath(
      goldPath,
      Paint()
        ..color      = _kGold.withValues(alpha: 0.6)
        ..style      = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // Muted tail (opposite end)
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
  bool shouldRepaint(_NeedlePainter old) => false;
}
