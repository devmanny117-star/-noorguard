import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_compass/flutter_compass.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';
import '../models/saved_location_model.dart';
import '../services/location_service.dart';
import '../services/qibla_service.dart';
import '../l10n/app_localizations.dart';
import '../widgets/banner_ad_widget.dart';

// ── Constants ──────────────────────────────────────────────────────────────────

const _kGold = Color(0xFFD4AF37);
const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF1A2A3A);

/// Preferred compass diameter; shrinks on short screens (see _buildBody)
/// so the spirit level below it stays fully visible.
const _kCompassSize = 330.0;
const _kCompassSizeMin = 240.0;

/// Everything in the body column except the compass (paddings, chips,
/// labels, spirit level) — used to decide how much room the compass gets.
/// Kept tight so the compass gets as much of the leftover as possible.
const _kNonCompassContentHeight = 360.0;
const _kNeedleFrac = 0.58;
const _kEmojiSize = 22.0;

// Smoothing factor for the compass low-pass filter (sin/cos domain).
// Lower = more smoothing but slower response; 0.12 balances both well.
const _kLpfAlpha = 0.12;

// Needle must be within this many degrees of Mecca to trigger the gold glow.
const _kAlignThresholdDeg = 8.0;

// ── Haptic feedback zones ─────────────────────────────────────────────────────

enum _HapticZone { veryFar, far, medium, near, close, aligned }

_HapticZone _hapticZoneFor(double degreesOff) {
  if (degreesOff <= 8) return _HapticZone.aligned;
  if (degreesOff <= 15) return _HapticZone.close;
  if (degreesOff <= 30) return _HapticZone.near;
  if (degreesOff <= 60) return _HapticZone.medium;
  if (degreesOff <= 90) return _HapticZone.far;
  return _HapticZone.veryFar;
}

Duration _hapticIntervalFor(_HapticZone zone) => switch (zone) {
      _HapticZone.veryFar => const Duration(milliseconds: 1200),
      _HapticZone.far => const Duration(milliseconds: 900),
      _HapticZone.medium => const Duration(milliseconds: 700),
      _HapticZone.near => const Duration(milliseconds: 500),
      _HapticZone.close => const Duration(milliseconds: 350),
      _HapticZone.aligned => const Duration(milliseconds: 200),
    };

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
  if (acc <= 15) return _Accuracy.high;
  if (acc <= 30) return _Accuracy.medium;
  return _Accuracy.low;
}

Color _accuracyColor(_Accuracy a) => switch (a) {
      _Accuracy.high => const Color(0xFF4CAF50),
      _Accuracy.medium => const Color(0xFFFFB300),
      _Accuracy.low => const Color(0xFFEF5350),
      _Accuracy.unknown => const Color(0xFFEF5350),
    };

String _accuracyLabel(_Accuracy a, AppLocalizations l10n) => switch (a) {
      _Accuracy.high => l10n.accuracyHigh,
      _Accuracy.medium => l10n.accuracyMedium,
      _Accuracy.low => l10n.accuracyLow,
      _Accuracy.unknown => l10n.accuracyCalibrating,
    };

// ── Screen ────────────────────────────────────────────────────────────────────

class QiblaScreen extends StatefulWidget {
  // Whether this tab is the one currently shown by the bottom-nav
  // IndexedStack. IndexedStack keeps every tab mounted even when hidden, so
  // without this flag the compass/haptics keep running on every other tab.
  final bool isActive;

  const QiblaScreen({super.key, required this.isActive});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> with WidgetsBindingObserver {
  // Location & qibla
  double _qiblaBearing = 0;
  bool _isLoading = true;
  // True whenever we have no usable coordinate yet — permission denied
  // (temporarily or permanently), GPS timed out, location services are off,
  // or any other failure fetching a fix. There is no default coordinate to
  // fall back to, so this state always offers the user a way forward:
  // re-request permission, or pick a city manually.
  bool _needsLocationSetup = false;
  String _locationLabel = '';

  final _locationService = LocationService();
  List<SavedLocation> _savedLocations = [];
  // The saved-location id currently in effect, or null to use the device's
  // live GPS position (the original behavior of this screen).
  String? _selectedLocationId;

  // Needle state (unbounded accumulator for shortest-path interpolation)
  double _needleAngle = 0;
  double _prevNeedleAngle = 0;

  // Compass heading (filtered) for the readout chip
  double _compassHeading = 0;

  // Low-pass filter state — maintained in sin/cos space to avoid 0°/360° jumps
  double _lpfSin = 0.0;
  double _lpfCos = 1.0;
  bool _lpfInit = false;

  // Accuracy
  double? _compassAccuracy;
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

  StreamSubscription<CompassEvent>? _compassSub;
  StreamSubscription<AccelerometerEvent>? _accelSub;

  // Haptic feedback as the needle approaches Qibla
  _HapticZone _hapticZone = _HapticZone.veryFar;
  Timer? _hapticPulseTimer;
  bool _vibratorAvailable = false;

  // Tracks the app's foreground/background state (set by
  // didChangeAppLifecycleState below). Combined with widget.isActive, this is
  // the single source of truth for whether haptics are allowed to run at all —
  // both must hold, or any in-flight vibration is stopped immediately.
  bool _lifecycleResumed = true;
  bool get _isScreenVisible => widget.isActive && _lifecycleResumed;

  // ── Lifecycle ────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // This screen is built eagerly inside the home tab's IndexedStack, so
    // initState() can fire before the first frame is even painted — on iOS,
    // requesting location permission that early can race the native view's
    // attachment and the system prompt silently never appears. Waiting for
    // the first frame ensures the native side is fully up before we ask.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _init();
    });
  }

  Future<void> _init() async {
    _savedLocations = await _locationService.loadSavedLocations();
    _selectedLocationId = await _locationService.loadSelectedLocationId();
    await _resolveLocation();
    if (!kIsWeb) {
      _subscribeCompass();
      _subscribeAccelerometer();
      if (Platform.isAndroid) {
        _vibratorAvailable = await Vibration.hasVibrator();
      }
      _startHapticPulsing();
    }
  }

  // Stops any in-progress/scheduled vibration the moment the app leaves the
  // foreground (backgrounded, locked, screen turned off, call interruption,
  // etc.) so the phone never keeps buzzing while the user isn't looking.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _lifecycleResumed = state == AppLifecycleState.resumed;
    if (_isScreenVisible) {
      if (_hapticPulseTimer == null) _startHapticPulsing();
    } else {
      _stopHaptics();
    }
  }

  // Stops haptics the moment the user switches away from the Qibla tab.
  // IndexedStack never disposes hidden tabs, so this is the only signal for
  // "the user navigated away" while the app itself stays in the foreground.
  @override
  void didUpdateWidget(QiblaScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      if (_isScreenVisible) {
        if (_hapticPulseTimer == null) _startHapticPulsing();
      } else {
        _stopHaptics();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopHaptics();
    _compassSub?.cancel();
    _accelSub?.cancel();
    super.dispose();
  }

  // ── Location ─────────────────────────────────────────────────────────────────

  Future<void> _resolveLocation() async {
    final saved = _findSavedLocation(_selectedLocationId);
    if (saved != null) {
      _applySavedLocation(saved);
      return;
    }

    LocationPermission perm;
    try {
      perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        // Fully awaited — the UI stays on the loading state (no compass)
        // until the native prompt actually resolves, so we never act on a
        // stale "denied" from before the user has answered.
        perm = await Geolocator.requestPermission();
      }
    } catch (_) {
      _showLocationSetup();
      return;
    }

    if (perm == LocationPermission.denied ||
        perm == LocationPermission.deniedForever) {
      // Denied (whether just now or previously) or not yet granted — there
      // is no default coordinate to fall back to, so hand the user a choice
      // instead: re-request permission, or pick a city manually.
      _showLocationSetup();
      return;
    }

    try {
      final pos = await Geolocator.getCurrentPosition()
          .timeout(const Duration(seconds: 10));
      _applyLocation(pos.latitude, pos.longitude);
    } catch (_) {
      // Permission is granted but the fix still failed — e.g. location
      // services disabled system-wide, the 10s timeout, or another
      // unexpected error. Same fallback screen; "Allow Location" there
      // re-runs this whole flow and effectively retries.
      _showLocationSetup();
    }
  }

  void _applyLocation(double lat, double lng) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _qiblaBearing = QiblaService.calculateQiblaDirection(lat, lng);
      _needsLocationSetup = false;
      // City name instead of raw coordinates. Reverse geocoding is async, so
      // show "Locating…" until it resolves (kept if it never does).
      _locationLabel = l10n.locating;
      _isLoading = false;
    });
    _resolveCityLabel(lat, lng);
  }

  /// No usable coordinate and nothing left to try automatically — stop
  /// loading and let the user either re-request permission or enter a city
  /// manually. Never renders a compass bearing in this state.
  void _showLocationSetup() {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _needsLocationSetup = true;
    });
  }

  /// "Allow Location" button on the setup screen. If permission was
  /// permanently denied, the OS won't show the prompt again — the only way
  /// forward is the app's Settings page. Otherwise, re-run the full resolve
  /// flow, which re-requests permission (or just retries the GPS fix if
  /// permission is already granted).
  Future<void> _onAllowLocationTap() async {
    final perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _needsLocationSetup = false;
    });
    await _resolveLocation();
  }

  /// Replaces the "Locating…" placeholder with the reverse-geocoded city
  /// name once it arrives. Bearing math never waits on this — it's purely
  /// the label.
  Future<void> _resolveCityLabel(double lat, double lng) async {
    final city = await _locationService.cityFromLatLng(lat, lng);
    if (city != null && mounted) {
      setState(() => _locationLabel = city.label);
    }
  }

  SavedLocation? _findSavedLocation(String? id) {
    if (id == null) return null;
    for (final loc in _savedLocations) {
      if (loc.id == id) return loc;
    }
    return null;
  }

  void _applySavedLocation(SavedLocation loc) {
    if (!mounted) return;
    setState(() {
      _qiblaBearing =
          QiblaService.calculateQiblaDirection(loc.latitude, loc.longitude);
      _needsLocationSetup = false;
      _locationLabel = loc.name;
      _isLoading = false;
    });
  }

  /// Switches the active location — `id` is a saved location's id, or null
  /// to fall back to the device's live GPS position. Re-loads the saved
  /// list first so a location added moments ago in the selector sheet is
  /// immediately recognised, then recomputes the Qibla bearing right away.
  Future<void> _selectLocation(String? id) async {
    _savedLocations = await _locationService.loadSavedLocations();
    _selectedLocationId = id;
    await _locationService.saveSelectedLocationId(id);
    if (id == null && mounted) setState(() => _isLoading = true);
    await _resolveLocation();
  }

  Future<void> _openLocationSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _LocationSelectorSheet(
        initialLocations: _savedLocations,
        selectedId: _selectedLocationId,
        onSelect: _selectLocation,
      ),
    );
    final refreshed = await _locationService.loadSavedLocations();
    if (mounted) setState(() => _savedLocations = refreshed);
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
      final delta = ((rawAngle - _needleAngle) + 180) % 360 - 180;

      final newLevel = _classify(event.accuracy);

      setState(() {
        _compassHeading = filteredHeading;
        _compassAccuracy = event.accuracy;
        _prevNeedleAngle = _needleAngle;
        _needleAngle += delta;

        // Reset manual dismiss when the sensor reaches full accuracy so that if
        // accuracy later drops again the calibration prompt can reappear.
        if (newLevel == _Accuracy.high) _calibrationDismissed = false;
      });

      final degreesOff = ((_needleAngle % 360 + 180) % 360 - 180).abs();
      _updateHaptics(degreesOff);
    });
  }

  // ── Haptic feedback ───────────────────────────────────────────────────────────

  void _startHapticPulsing() {
    _hapticPulseTimer?.cancel();
    _hapticPulseTimer = Timer.periodic(
      _hapticIntervalFor(_hapticZone),
      (_) {
        if (!_isScreenVisible) return;
        _fireHaptic(_hapticZone);
      },
    );
  }

  void _updateHaptics(double degreesOff) {
    if (kIsWeb || !_isScreenVisible) return;
    final zone = _hapticZoneFor(degreesOff);
    if (zone == _hapticZone) return;
    _hapticZone = zone;
    _hapticPulseTimer?.cancel();
    _hapticPulseTimer = Timer.periodic(
      _hapticIntervalFor(zone),
      (_) {
        if (!_isScreenVisible) return;
        _fireHaptic(_hapticZone);
      },
    );
  }

  void _fireHaptic(_HapticZone zone) {
    if (!kIsWeb && Platform.isIOS) {
      switch (zone) {
        case _HapticZone.veryFar:
        case _HapticZone.far:
          HapticFeedback.lightImpact();
        case _HapticZone.medium:
        case _HapticZone.near:
          HapticFeedback.mediumImpact();
        case _HapticZone.close:
          HapticFeedback.heavyImpact();
        case _HapticZone.aligned:
          _fireTripleBurst();
      }
    } else if (!kIsWeb && Platform.isAndroid && _vibratorAvailable) {
      switch (zone) {
        case _HapticZone.veryFar:
          Vibration.vibrate(duration: 60, amplitude: 60);
        case _HapticZone.far:
          Vibration.vibrate(duration: 70, amplitude: 80);
        case _HapticZone.medium:
          Vibration.vibrate(duration: 80, amplitude: 120);
        case _HapticZone.near:
          Vibration.vibrate(duration: 100, amplitude: 170);
        case _HapticZone.close:
          Vibration.vibrate(duration: 120, amplitude: 220);
        case _HapticZone.aligned:
          Vibration.vibrate(
            pattern: [0, 180, 60, 180],
            intensities: [0, 255, 0, 255],
          );
      }
    }
  }

  Future<void> _fireTripleBurst() async {
    HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 60));
    HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 60));
    HapticFeedback.heavyImpact();
  }

  void _stopHaptics() {
    _hapticPulseTimer?.cancel();
    _hapticPulseTimer = null;
    _hapticZone = _HapticZone.veryFar;
    if (!kIsWeb && Platform.isAndroid && _vibratorAvailable) {
      Vibration.cancel();
    }
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
            child: Container(height: 1, color: _kGold.withValues(alpha: 0.15)),
          ),
        ),
        body: _isLoading
            ? _buildLoading()
            : (_needsLocationSetup
                ? _buildLocationSetup(l10n)
                : _buildBody(l10n)),
      ),
    );
  }

  Widget _buildLocationSetup(AppLocalizations l10n) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_off_outlined,
                  size: 40, color: Colors.white.withValues(alpha: 0.4)),
              const SizedBox(height: 16),
              Text(
                l10n.qiblaLocationPermissionTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.qiblaLocationPermissionMessage,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _onAllowLocationTap,
                  style: FilledButton.styleFrom(
                    backgroundColor: _kGold,
                    foregroundColor: _kNavy,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    l10n.onboardingAllowLocation,
                    style: GoogleFonts.lato(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _openLocationSheet,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _kGold,
                    side: BorderSide(color: _kGold.withValues(alpha: 0.5)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    l10n.enterCityManually,
                    style: GoogleFonts.lato(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(_kGold),
          strokeWidth: 2,
        ),
      );

  Widget _buildBody(AppLocalizations l10n) {
    // Bottom clearance: only what no ancestor SafeArea has consumed yet.
    // The home shell's SafeArea already insets the tab above the nav pill
    // and home indicator, so adding viewPadding here would double-count it
    // and steal height from the compass.
    final bottomClearance = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // On short screens (iPhones) the full-size compass pushes the
          // spirit level off the bottom; shrink it until the whole column
          // fits, down to a floor that keeps the dial readable. Never wider
          // than the screen minus the 24px side paddings either.
          final maxCompass = math.max(
            _kCompassSizeMin,
            math.min(_kCompassSize, constraints.maxWidth - 48),
          );
          final compassSize = (constraints.maxHeight -
                  bottomClearance -
                  _kNonCompassContentHeight)
              .clamp(_kCompassSizeMin, maxCompass);
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 16 + bottomClearance),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      _LocationChip(
                        label: _locationLabel,
                        onTap: _openLocationSheet,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.directionToSacredHouse,
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.4),
                          letterSpacing: 0.4,
                        ),
                      ),
                      if (!kIsWeb) ...[
                        const SizedBox(height: 12),
                        _AccuracyBadge(level: _accuracyLevel),
                      ],
                      const SizedBox(height: 12),
                      // 1. Compass dial
                      _buildCompass(l10n, compassSize),
                      // 2.
                      const SizedBox(height: 12),
                      // 3. Degree label
                      Text(
                        l10n.towardMecca(_qiblaBearing.toStringAsFixed(1)),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: _kGold,
                        ),
                      ),
                      // 4.
                      const SizedBox(height: 8),
                      // 5. Heading badge
                      if (!kIsWeb)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: _kCard,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _kGold.withValues(alpha: 0.15),
                                width: 1),
                          ),
                          child: Text(
                            l10n.headingDegrees(
                                _compassHeading.toStringAsFixed(0)),
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.5),
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      // 6.
                      const SizedBox(height: 14),
                      // 7 & 8. Spirit level label + circle + "Tilt to level" text
                      if (!kIsWeb) _SpiritLevel(x: _lpfAccelX, y: _lpfAccelY),
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
                                padding: const EdgeInsets.only(top: 12),
                                child: _CalibrationPrompt(
                                  onDismiss: () => setState(
                                      () => _calibrationDismissed = true),
                                ),
                              )
                            : const SizedBox.shrink(key: ValueKey('no-cal')),
                      ),
                      if (kIsWeb) ...[
                        const SizedBox(height: 24),
                        _WebNote(label: l10n.compassRequiresDevice),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const BannerAdWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Compass widget ────────────────────────────────────────────────────────────

  Widget _buildCompass(AppLocalizations l10n, double size) {
    // Kaaba emoji sits at the needle tip — derived from the actual dial
    // size, which shrinks on short screens.
    final emojiTop = size / 2 * (1 - _kNeedleFrac) - _kEmojiSize / 2;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _prevNeedleAngle, end: _needleAngle),
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
      builder: (_, angle, __) {
        // Glow strength ramps from 0→1 as the needle approaches ±5° of Mecca
        final dist = ((angle % 360 + 180) % 360 - 180).abs();
        final glow = (1.0 - dist / _kAlignThresholdDeg).clamp(0.0, 1.0);

        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer gold glow rings — appear when needle nears Mecca
              if (glow > 0)
                CustomPaint(
                  size: Size(size, size),
                  painter: _AlignmentGlowPainter(strength: glow),
                ),

              // Fixed compass dial (repaints only when locale changes)
              CustomPaint(
                size: Size(size, size),
                painter: _CompassDialPainter(
                  north: l10n.compassNorth,
                  east: l10n.compassEast,
                  south: l10n.compassSouth,
                  west: l10n.compassWest,
                ),
              ),

              // Rotating needle + Kaaba emoji
              Transform.rotate(
                angle: angle * math.pi / 180,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size(size, size),
                        painter: _NeedlePainter(glowStrength: glow),
                      ),
                      Positioned(
                        top: emojiTop,
                        child: const Text(
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
}

// ── Accuracy badge ────────────────────────────────────────────────────────────

class _AccuracyBadge extends StatelessWidget {
  final _Accuracy level;
  const _AccuracyBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = _accuracyColor(level);
    final label = _accuracyLabel(level, l10n);
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
          const Text('∞',
              style: TextStyle(fontSize: 22, color: Color(0xFFEF5350))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.compassNeedsCalibration,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalizations.of(context)!.compassCalibrationHint,
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
    final color = tiltMag < 1.5
        ? const Color(0xFF4CAF50)
        : tiltMag < 3.5
            ? const Color(0xFFFFB300)
            : const Color(0xFFEF5350);

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
              AppLocalizations.of(context)!.spiritLevelLabel,
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
          isLevel
              ? AppLocalizations.of(context)!.spiritLevelLevelText
              : AppLocalizations.of(context)!.spiritLevelTiltText,
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
  final Color bubbleColor;
  const _SpiritLevelPainter({
    required this.x,
    required this.y,
    required this.bubbleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outerR = size.width / 2 - 1;
    const bubbleR = 9.0;
    final maxOff = outerR - bubbleR - 3;

    // ── Background circle ───────────────────────────────────────────────────
    canvas.drawCircle(Offset(cx, cy), outerR, Paint()..color = _kCard);

    // Outer ring
    canvas.drawCircle(
      Offset(cx, cy),
      outerR,
      Paint()
        ..color = _kGold.withValues(alpha: 0.28)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // ── Crosshairs ──────────────────────────────────────────────────────────
    final cross = Paint()
      ..color = Colors.white.withValues(alpha: 0.07)
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
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // ── Bubble position ─────────────────────────────────────────────────────
    // Spirit level: bubble floats to the HIGH side (opposite of tilt direction).
    // When phone tilts right (+x), right is LOW → bubble goes LEFT (−x on screen).
    // When phone tilts with top down (−y from gravity on flat phone), top is LOW →
    // bubble goes toward bottom of screen (+y). We negate both axes so the bubble
    // moves to the high side.
    final rawDx = -(x / 4.0) * maxOff;
    final rawDy =
        (y / 4.0) * maxOff; // screen Y is already inverted vs. device Y
    // Clamp bubble to stay inside the circle
    final dist = math.sqrt(rawDx * rawDx + rawDy * rawDy);
    final scale = dist > maxOff ? maxOff / dist : 1.0;
    final bx = cx + rawDx * scale;
    final by = cy + rawDy * scale;

    // Bubble glow
    canvas.drawCircle(
      Offset(bx, by),
      bubbleR + 5,
      Paint()
        ..color = bubbleColor.withValues(alpha: 0.20)
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
        ..color = _kGold.withValues(alpha: 0.13 * strength)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22),
    );

    // Tighter inner ring
    canvas.drawCircle(
      c,
      r + 6,
      Paint()
        ..color = _kGold.withValues(alpha: 0.22 * strength)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );

    // Crisp rim highlight at full alignment
    if (strength > 0.7) {
      canvas.drawCircle(
        c,
        r,
        Paint()
          ..color = _kGold.withValues(alpha: 0.45 * ((strength - 0.7) / 0.3))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );
    }
  }

  @override
  bool shouldRepaint(_AlignmentGlowPainter old) => old.strength != strength;
}

// ── Compass dial painter ──────────────────────────────────────────────────────

class _CompassDialPainter extends CustomPainter {
  final String north;
  final String east;
  final String south;
  final String west;

  const _CompassDialPainter({
    required this.north,
    required this.east,
    required this.south,
    required this.west,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

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

    // Degree tick marks
    for (int deg = 0; deg < 360; deg += 5) {
      final rad = deg * math.pi / 180;
      final sinA = math.sin(rad);
      final cosA = math.cos(rad);

      final (len, width, opacity) = switch (deg % 90) {
        0 => (20.0, 2.2, 1.00),
        45 => (13.0, 1.6, 0.80),
        _ => switch (deg % 30) {
            0 => (10.0, 1.4, 0.65),
            _ => switch (deg % 10) {
                0 => (6.0, 1.0, 0.40),
                _ => (3.5, 0.8, 0.22),
              },
          },
      };

      final outerR = r - 4;
      final innerR = outerR - len;
      canvas.drawLine(
        Offset(cx + outerR * sinA, cy - outerR * cosA),
        Offset(cx + innerR * sinA, cy - innerR * cosA),
        Paint()
          ..color = _kGold.withValues(alpha: opacity)
          ..strokeWidth = width
          ..strokeCap = StrokeCap.round,
      );
    }

    // Cardinal letters
    _paintCardinal(canvas, cx, cy, r, north, 0, large: true);
    _paintCardinal(canvas, cx, cy, r, east, 90);
    _paintCardinal(canvas, cx, cy, r, south, 180);
    _paintCardinal(canvas, cx, cy, r, west, 270);
  }

  void _paintCardinal(
      Canvas canvas, double cx, double cy, double r, String letter, int deg,
      {bool large = false}) {
    final rad = deg * math.pi / 180;
    final labelR = r * 0.60;
    final x = cx + labelR * math.sin(rad);
    final y = cy - labelR * math.cos(rad);

    final tp = TextPainter(
      text: TextSpan(
        text: letter,
        style: TextStyle(
          fontSize: large ? 17 : 13,
          fontWeight: FontWeight.w800,
          color: _kGold.withValues(alpha: large ? 1.0 : 0.60),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
  }

  @override
  bool shouldRepaint(_CompassDialPainter old) =>
      old.north != north ||
      old.east != east ||
      old.south != south ||
      old.west != west;
}

// ── Needle painter ────────────────────────────────────────────────────────────

class _NeedlePainter extends CustomPainter {
  final double glowStrength; // 0.0 → 1.0
  const _NeedlePainter({this.glowStrength = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    final tipY = cy - r * _kNeedleFrac;
    const baseWidth = 8.0;
    final indentY = cy + r * 0.06;

    final goldPath = Path()
      ..moveTo(cx, tipY)
      ..lineTo(cx - baseWidth, cy)
      ..lineTo(cx, indentY)
      ..lineTo(cx + baseWidth, cy)
      ..close();

    // Enhanced glow when aligned with Mecca
    final glowAlpha = 0.28 + 0.35 * glowStrength;
    final glowRadius = 7.0 + 10.0 * glowStrength;
    canvas.drawPath(
      goldPath,
      Paint()
        ..color = _kGold.withValues(alpha: glowAlpha)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius)
        ..style = PaintingStyle.fill,
    );

    // Solid gold fill
    canvas.drawPath(
        goldPath,
        Paint()
          ..color = _kGold
          ..style = PaintingStyle.fill);

    // Thin border for definition
    canvas.drawPath(
      goldPath,
      Paint()
        ..color = _kGold.withValues(alpha: 0.6)
        ..style = PaintingStyle.stroke
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
  final VoidCallback onTap;
  const _LocationChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _kCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _kGold.withValues(alpha: 0.40),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.my_location_rounded,
                color: _kGold,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.70),
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: _kGold.withValues(alpha: 0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Location selector bottom sheet ────────────────────────────────────────────

class _LocationSelectorSheet extends StatefulWidget {
  final List<SavedLocation> initialLocations;
  final String? selectedId;
  final ValueChanged<String?> onSelect;

  const _LocationSelectorSheet({
    required this.initialLocations,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  State<_LocationSelectorSheet> createState() => _LocationSelectorSheetState();
}

class _LocationSelectorSheetState extends State<_LocationSelectorSheet> {
  final _locationService = LocationService();
  final _searchController = TextEditingController();

  late List<SavedLocation> _locations;
  late String? _selectedId;
  bool _isSearching = false;
  String? _error;

  // Live autocomplete state. Suggestions come from OpenStreetMap's free
  // Nominatim API (no key needed); a failed request just leaves the list
  // empty, silently falling back to the manual submit flow.
  Timer? _suggestDebounce;
  List<_CitySuggestion> _suggestions = const [];
  bool _noSuggestionResults = false;
  int _suggestRequestSeq = 0;

  @override
  void initState() {
    super.initState();
    _locations = List.of(widget.initialLocations);
    _selectedId = widget.selectedId;
  }

  @override
  void dispose() {
    _suggestDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String text) {
    _suggestDebounce?.cancel();
    final query = text.trim();
    if (query.length < 2) {
      if (_suggestions.isNotEmpty || _noSuggestionResults) {
        setState(() {
          _suggestions = const [];
          _noSuggestionResults = false;
        });
      }
      return;
    }
    _suggestDebounce = Timer(
        const Duration(milliseconds: 400), () => _fetchSuggestions(query));
  }

  Future<void> _fetchSuggestions(String query) async {
    final seq = ++_suggestRequestSeq;
    try {
      // featuretype=settlement restricts results to inhabited places
      // (cities/towns/villages) — no streets, businesses, or countries.
      final uri = Uri.https('nominatim.openstreetmap.org', '/search', {
        'q': query,
        'format': 'jsonv2',
        'addressdetails': '1',
        'limit': '6',
        'featuretype': 'settlement',
      });
      // Nominatim's usage policy requires an identifying User-Agent.
      final response = await http.get(uri, headers: {
        'User-Agent': 'NoorGuard/1.0 (prayer times app)',
      }).timeout(const Duration(seconds: 6));
      if (response.statusCode != 200)
        throw Exception('HTTP ${response.statusCode}');

      final results = (jsonDecode(response.body) as List<dynamic>)
          .cast<Map<String, dynamic>>();
      final suggestions = <_CitySuggestion>[];
      final seen = <String>{};
      for (final item in results) {
        final name = item['name'] as String? ?? '';
        final address = item['address'] as Map<String, dynamic>? ?? const {};
        final country = address['country'] as String? ?? '';
        final lat = double.tryParse(item['lat'] as String? ?? '');
        final lon = double.tryParse(item['lon'] as String? ?? '');
        if (name.isEmpty || lat == null || lon == null) continue;
        if (!seen.add('$name|$country')) continue;
        suggestions.add(_CitySuggestion(
          name: name,
          country: country,
          latitude: lat,
          longitude: lon,
        ));
      }

      // A newer keystroke's request supersedes this one; likewise the user
      // may have cleared the field while we were in flight.
      if (!mounted ||
          seq != _suggestRequestSeq ||
          _searchController.text.trim() != query) {
        return;
      }
      setState(() {
        _suggestions = suggestions;
        _noSuggestionResults = suggestions.isEmpty;
      });
    } catch (_) {
      // No network / timeout: stay silent and keep the manual submit path.
      if (!mounted || seq != _suggestRequestSeq) return;
      setState(() {
        _suggestions = const [];
        _noSuggestionResults = false;
      });
    }
  }

  Future<void> _applySuggestion(_CitySuggestion suggestion) async {
    _suggestDebounce?.cancel();
    final location = SavedLocation(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: suggestion.country.isEmpty
          ? suggestion.name
          : '${suggestion.name}, ${suggestion.country}',
      latitude: suggestion.latitude,
      longitude: suggestion.longitude,
    );
    try {
      final updated = await _locationService.addLocation(location);
      if (!mounted) return;
      setState(() => _locations = updated);
      _select(location.id);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = AppLocalizations.of(context)!
            .maxLocationsReachedMessage(LocationService.maxSavedLocations);
      });
    }
  }

  void _select(String? id) {
    widget.onSelect(id);
    Navigator.of(context).pop();
  }

  Future<void> _addLocation() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    _suggestDebounce?.cancel();
    setState(() {
      _isSearching = true;
      _error = null;
      _suggestions = const [];
      _noSuggestionResults = false;
    });
    try {
      final newLocation = await _locationService.geocodeCityName(query);
      final updated = await _locationService.addLocation(newLocation);
      if (!mounted) return;
      setState(() {
        _locations = updated;
        _isSearching = false;
        _searchController.clear();
      });
      _select(newLocation.id);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isSearching = false;
        _error = AppLocalizations.of(context)!.locationNotFound;
      });
    }
  }

  Future<void> _deleteLocation(String id) async {
    final updated = await _locationService.deleteLocation(id);
    if (!mounted) return;
    final wasSelected = _selectedId == id;
    setState(() {
      _locations = updated;
      if (wasSelected) _selectedId = null;
    });
    if (wasSelected) widget.onSelect(null);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxHeight = MediaQuery.of(context).size.height * 0.8;
    final atMax = _locations.length >= LocationService.maxSavedLocations;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: _kNavy,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _kGold.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.selectLocationTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _select(null),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    child: Row(
                      children: [
                        const Icon(Icons.my_location_rounded,
                            size: 18, color: _kGold),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.useCurrentLocation,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: _selectedId == null
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color:
                                  _selectedId == null ? _kGold : Colors.white,
                            ),
                          ),
                        ),
                        if (_selectedId == null)
                          const Icon(Icons.check_rounded,
                              size: 18, color: _kGold),
                      ],
                    ),
                  ),
                ),
                Divider(color: _kGold.withValues(alpha: 0.12), height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 14, 24, 6),
                  child: Text(
                    l10n.savedLocationsHeader,
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.4),
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                if (_locations.isEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                    child: Text(
                      l10n.noSavedLocationsYet,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.45),
                        height: 1.4,
                      ),
                    ),
                  )
                else
                  ..._locations.map((loc) {
                    final isSelected = loc.id == _selectedId;
                    return InkWell(
                      onTap: () => _select(loc.id),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place_rounded,
                              size: 18,
                              color: isSelected ? _kGold : Colors.white38,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                loc.name,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: isSelected ? _kGold : Colors.white,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(Icons.check_rounded,
                                    size: 18, color: _kGold),
                              ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                size: 20,
                                color: Colors.white38,
                              ),
                              tooltip: l10n.deleteLocationTooltip,
                              onPressed: () => _deleteLocation(loc.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                Divider(color: _kGold.withValues(alpha: 0.12), height: 1),
                // Both this dropdown and the search bar below are Padding
                // widgets, so without explicit keys the dropdown appearing or
                // disappearing makes Flutter re-match the column's children
                // by position — the search bar's TextField subtree is then
                // treated as a brand-new widget, losing focus and dismissing
                // the keyboard mid-typing. Stable keys keep each element's
                // identity across those layout changes.
                if (_suggestions.isNotEmpty || _noSuggestionResults)
                  Padding(
                    key: const ValueKey('qibla_city_suggestions'),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _kCard,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: _kGold.withValues(alpha: 0.22)),
                      ),
                      child: _noSuggestionResults
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              child: Text(
                                l10n.noCitiesFound,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  color: Colors.white38,
                                ),
                              ),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var i = 0;
                                    i < _suggestions.length;
                                    i++) ...[
                                  if (i > 0)
                                    Divider(
                                      color: _kGold.withValues(alpha: 0.1),
                                      height: 1,
                                    ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () =>
                                        _applySuggestion(_suggestions[i]),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 16,
                                            color:
                                                _kGold.withValues(alpha: 0.7),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _suggestions[i].name,
                                                  style: GoogleFonts.lato(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                if (_suggestions[i]
                                                    .country
                                                    .isNotEmpty)
                                                  Text(
                                                    _suggestions[i].country,
                                                    style: GoogleFonts.lato(
                                                      fontSize: 12,
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                    ),
                  ),
                Padding(
                  key: const ValueKey('qibla_city_search_bar'),
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: atMax
                      ? Text(
                          l10n.maxLocationsReachedMessage(
                              LocationService.maxSavedLocations),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 14),
                                textInputAction: TextInputAction.search,
                                onChanged: _onSearchChanged,
                                onSubmitted: (_) => _addLocation(),
                                decoration: InputDecoration(
                                  hintText: l10n.searchCityHint,
                                  hintStyle: GoogleFonts.lato(
                                    color: Colors.white38,
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: _kCard,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 44,
                              width: 44,
                              child: ElevatedButton(
                                onPressed: _isSearching ? null : _addLocation,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _kGold,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: _isSearching
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: _kNavy,
                                        ),
                                      )
                                    : Icon(
                                        Icons.add_rounded,
                                        color: _kNavy,
                                        semanticLabel: l10n.addLocationTooltip,
                                      ),
                              ),
                            ),
                          ],
                        ),
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
                    child: Text(
                      _error!,
                      style: GoogleFonts.lato(
                          fontSize: 12, color: const Color(0xFFEF5350)),
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
              ],
            ),
          ),
        ),
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

/// One row in the live city-autocomplete dropdown, straight from Nominatim.
class _CitySuggestion {
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  const _CitySuggestion({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });
}
