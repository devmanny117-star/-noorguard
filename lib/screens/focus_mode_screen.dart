import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/dua_model.dart';
import '../models/installed_app.dart';
import '../services/app_blocking_service.dart';
import '../services/prayer_state.dart';
import '../services/widget_data_service.dart';
import '../widgets/geometric_pattern_painter.dart';
import '../widgets/hours_minutes_picker_dialog.dart';
import '../l10n/app_localizations.dart';
import 'installed_apps_picker_screen.dart';

// Shown as blocked in Focus Mode's preview row, capped for the row's layout
// — the count badge still reflects the full blocked-apps total.
const _kFocusPreviewLimit = 4;

// Premium dark navy design system — hardcoded, never theme-dependent.
const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF0F1E30);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);
const _kMutedGold = Color(0xFFB08D3E);
const _kStopRed = Color(0xFFEF5350);

/// Shared card chrome: #0f1e30 fill, 1px gold border at 30%, 14px radius.
BoxDecoration _cardDecoration() => BoxDecoration(
      color: _kCard,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: _kGold.withValues(alpha: 0.3), width: 1),
    );

class FocusModeScreen extends StatefulWidget {
  const FocusModeScreen({super.key});

  @override
  State<FocusModeScreen> createState() => _FocusModeScreenState();
}

class _FocusModeScreenState extends State<FocusModeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  static const _fixedPresetMinutes = [30, 60, 120];
  int _selectedMinutes = _fixedPresetMinutes.first;
  bool _isCustomSelected = false;
  bool _isRunning = false;
  bool _pausedForPrayer = false;
  late int _totalSeconds;
  late int _remaining;
  Timer? _timer;
  int _duaIndex = 0;

  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;
  late AnimationController _duaFadeCtrl;
  late Animation<double> _duaFade;

  List<InstalledApp> _blockedApps = [];
  // True once _blockedApps reflects real icons/names — false (not "loading")
  // when the installed-apps cache simply hasn't been warmed yet this
  // session, so the preview shows just the count badge instead of a spinner.
  bool _blockedAppsIconsReady = false;
  int _blockedAppsCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _totalSeconds = _selectedMinutes * 60;
    _remaining = _totalSeconds;

    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _pulse = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);

    _duaFadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..value = 1.0;
    _duaFade = CurvedAnimation(parent: _duaFadeCtrl, curve: Curves.easeInOut);

    _loadBlockedApps();
  }

  /// Focus Mode's own blocked-apps list — independent of App Blocking's
  /// prayer-time list, set up via [_openAppsPicker]. Deliberately cheap:
  /// loadSettings() is just SharedPreferences reads (no native call), and
  /// resolving real icons only happens if the installed-apps cache is
  /// already warm — never triggers a fresh fetch itself, so opening this
  /// screen never pays for a cold icon-decode of every installed app.
  Future<void> _loadBlockedApps() async {
    final service = AppBlockingService();
    await service.loadSettings();
    if (!mounted) return;
    final cached = service.getFocusBlockedAppsWithIconsIfCached();
    setState(() {
      _blockedAppsCount = service.focusBlockedPackages.length;
      _blockedApps = cached ?? [];
      _blockedAppsIconsReady = cached != null;
    });
  }

  Future<void> _openAppsPicker() async {
    final l10n = AppLocalizations.of(context)!;
    final service = AppBlockingService();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InstalledAppsPickerScreen(
          title: l10n.appBlockingAppsTitle,
          initiallySelected: service.focusBlockedPackages,
          onToggle: service.toggleFocusBlockedPackage,
          pinSelectedToTop: true,
        ),
      ),
    );
    if (!mounted) return;
    // The picker always force-refreshes the installed-apps cache, so this
    // now resolves real icons instantly instead of needing its own fetch.
    await _loadBlockedApps();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // The user may have ended the session early from the native focus block
    // screen ("End Focus Session") while this screen was backgrounded —
    // reconcile against native truth so the local timer doesn't keep running
    // a session that's no longer actually blocking anything.
    if (state == AppLifecycleState.resumed) _reconcileFocusSession();
  }

  Future<void> _reconcileFocusSession() async {
    if (!_isRunning) return;
    final nativeEnd = await AppBlockingService().reconcileFocusSession();
    if (nativeEnd != null || !mounted) return;
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _pausedForPrayer = false;
      _remaining = _totalSeconds;
      _duaIndex = 0;
    });
    _duaFadeCtrl.value = 1.0;
    if (mounted) {
      await WidgetDataService.pushFocusState(context: context, active: false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _pulseCtrl.dispose();
    _duaFadeCtrl.dispose();
    super.dispose();
  }

  // ── Timer control ────────────────────────────────────────────────────────

  void _startTimer() {
    setState(() => _isRunning = true);
    final service = AppBlockingService();
    service.startFocusSession(Duration(seconds: _remaining));
    WidgetDataService.pushFocusState(
      context: context,
      active: true,
      endTime: DateTime.now().add(Duration(seconds: _remaining)),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      final pausedNow = _isPausedForActivePrayerWindow();
      if (pausedNow) {
        if (!_pausedForPrayer) setState(() => _pausedForPrayer = true);
        return;
      }
      if (_pausedForPrayer) {
        setState(() => _pausedForPrayer = false);
        // Extend the native session (and widget) by however long the pause
        // lasted — the remaining duration is unchanged since it never
        // decremented while paused.
        service.startFocusSession(Duration(seconds: _remaining));
        WidgetDataService.pushFocusState(
          context: context,
          active: true,
          endTime: DateTime.now().add(Duration(seconds: _remaining)),
        );
      }

      // Decrement first so the display reaches 00:00 before completing.
      setState(() => _remaining--);

      if (_remaining <= 0) {
        t.cancel();
        _onSessionComplete();
        return;
      }

      // Rotate dua every 30 seconds (skip the very first tick where
      // _remaining == _totalSeconds - 1, which is never divisible by 30
      // for any of the preset durations — this check is just a safety guard).
      if (_remaining % 30 == 0) {
        _rotateDua();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _pausedForPrayer = false;
      _totalSeconds = _selectedMinutes * 60;
      _remaining = _totalSeconds;
      _duaIndex = 0;
    });
    _duaFadeCtrl.value = 1.0;
    AppBlockingService().endFocusSession();
    WidgetDataService.pushFocusState(context: context, active: false);
  }

  /// Live check (no native round-trip) against today's prayer windows —
  /// reused from the same computation AppBlockingService pushes to native,
  /// so Focus Mode's pause/resume always matches what's actually blocking.
  bool _isPausedForActivePrayerWindow() {
    final prayers = PrayerState().lastKnownPrayers;
    if (prayers == null) return false;
    final windows = AppBlockingService().computeTodaysWindows(prayers);
    final now = DateTime.now();
    for (final w in windows) {
      if (w.contains(now)) {
        final done = PrayerState().prayers[w.prayerName] ?? false;
        if (!done) return true;
      }
    }
    return false;
  }

  Future<void> _rotateDua() async {
    await _duaFadeCtrl.reverse();
    if (!mounted) return;
    setState(() => _duaIndex = (_duaIndex + 1) % focusDuas.length);
    _duaFadeCtrl.forward();
  }

  void _onSessionComplete() {
    HapticFeedback.heavyImpact();
    final completed = _totalSeconds;
    setState(() => _isRunning = false);
    AppBlockingService().endFocusSession();
    WidgetDataService.pushFocusState(context: context, active: false);

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (_) => _CompletionDialog(
        completedSeconds: completed,
        onDone: () {
          Navigator.of(context).pop();
          setState(() {
            _remaining = _totalSeconds;
            _duaIndex = 0;
          });
          _duaFadeCtrl.value = 1.0;
        },
      ),
    );
  }

  void _selectFixedPreset(int minutes) {
    if (_isRunning) return;
    setState(() {
      _selectedMinutes = minutes;
      _isCustomSelected = false;
      _totalSeconds = minutes * 60;
      _remaining = _totalSeconds;
    });
  }

  Future<void> _selectCustomDuration() async {
    if (_isRunning) return;
    final minutes = await showHoursMinutesPickerDialog(context);
    if (minutes != null && mounted) {
      setState(() {
        _selectedMinutes = minutes;
        _isCustomSelected = true;
        _totalSeconds = minutes * 60;
        _remaining = _totalSeconds;
      });
    }
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  String _formatTime() {
    final m = _remaining ~/ 60;
    final s = _remaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // progress = 1.0 (full ring) at start → 0.0 (empty ring) at end
  double get _progress => _totalSeconds > 0 ? _remaining / _totalSeconds : 0.0;

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kNavy,
      body: Stack(
        children: [
          // Islamic 8-pointed star field behind everything.
          const Positioned.fill(
            child: CustomPaint(
              painter: GeometricPatternPainter(color: _kGold, alpha: 0.06),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _Header(isRunning: _isRunning),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        const _SubtitleCard(),
                        const SizedBox(height: 16),
                        _TimerCard(
                          progress: _progress,
                          timeString: _formatTime(),
                          dua: focusDuas[_duaIndex],
                          duaFade: _duaFade,
                          isRunning: _isRunning && !_pausedForPrayer,
                          pausedForPrayer: _pausedForPrayer,
                          pulse: _pulse,
                        ),
                        const SizedBox(height: 16),
                        _DurationCard(
                          fixedMinutes: _fixedPresetMinutes,
                          selectedMinutes: _selectedMinutes,
                          isCustomSelected: _isCustomSelected,
                          locked: _isRunning,
                          onSelectFixed: _selectFixedPreset,
                          onSelectCustom: _selectCustomDuration,
                        ),
                        const SizedBox(height: 16),
                        _BlockedAppsCard(
                          apps: _blockedApps,
                          selectedCount: _blockedAppsCount,
                          iconsReady: _blockedAppsIconsReady,
                          isRunning: _isRunning,
                          onSelectApps: _isRunning ? null : _openAppsPicker,
                        ),
                        const SizedBox(height: 16),
                        _BeginFocusButton(
                          isRunning: _isRunning,
                          onTap: _isRunning ? _stopTimer : _startTimer,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HEADER
// ─────────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final bool isRunning;
  const _Header({required this.isRunning});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 20, 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: _kGold,
            ),
          ),
          Text(
            l10n.focusMode,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
          const Spacer(),
          AnimatedOpacity(
            opacity: isRunning ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _kGold.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _kGold.withValues(alpha: 0.4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: _kGold,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.active,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: _kGold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SUBTITLE CARD
// ─────────────────────────────────────────────────────────────────────────────

class _SubtitleCard extends StatelessWidget {
  const _SubtitleCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const Icon(
            Icons.mosque_rounded,
            size: 18,
            color: _kGold,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.focusModeSubtitle,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: _kCream.withValues(alpha: 0.85),
                height: 1.45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TIMER CARD (ring + countdown + rotating dhikr)
// ─────────────────────────────────────────────────────────────────────────────

class _TimerCard extends StatelessWidget {
  final double progress;
  final String timeString;
  final Dua dua;
  final Animation<double> duaFade;
  final bool isRunning;
  final bool pausedForPrayer;
  final Animation<double> pulse;

  const _TimerCard({
    required this.progress,
    required this.timeString,
    required this.dua,
    required this.duaFade,
    required this.isRunning,
    this.pausedForPrayer = false,
    required this.pulse,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final langCode = Localizations.localeOf(context).languageCode;
    final label = pausedForPrayer
        ? l10n.focusPaused
        : (isRunning ? l10n.remaining : l10n.ready);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: pulse,
            builder: (_, __) => Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: isRunning
                    ? [
                        BoxShadow(
                          color: _kGold.withValues(
                              alpha: 0.12 + pulse.value * 0.08),
                          blurRadius: 14 + pulse.value * 12,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: CustomPaint(
                painter: _TimerRingPainter(progress: progress),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        timeString,
                        style: GoogleFonts.lato(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          color: _kCream,
                          height: 1.0,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        label.toUpperCase(),
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          color: _kGold,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: 36,
            height: 1,
            color: _kGold.withValues(alpha: 0.35),
          ),
          const SizedBox(height: 14),
          FadeTransition(
            opacity: duaFade,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    dua.arabic.replaceAll('\n', ' '),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 18,
                      color: _kGold,
                      height: 1.6,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (langCode != 'ar') ...[
                  const SizedBox(height: 6),
                  Text(
                    dua.translationFor(langCode).replaceAll('\n', ' '),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      color: _kCream.withValues(alpha: 0.6),
                      height: 1.45,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

// Ring: starts full (progress=1.0), depletes to empty (progress=0.0).
// Thin 2px track at 15% gold, 2.5px round-capped gold progress arc from
// 12 o'clock, faint gold inner fill.
class _TimerRingPainter extends CustomPainter {
  final double progress;

  _TimerRingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    // Inner fill
    canvas.drawCircle(
      center,
      radius - 2,
      Paint()..color = _kGold.withValues(alpha: 0.04),
    );

    // Full-circle track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = _kGold.withValues(alpha: 0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    if (progress <= 0) return;

    // Progress arc — sweeps clockwise from 12 o'clock (-90°).
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = _kGold
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_TimerRingPainter old) => old.progress != progress;
}

// ─────────────────────────────────────────────────────────────────────────────
// DURATION CARD
// ─────────────────────────────────────────────────────────────────────────────

class _DurationCard extends StatelessWidget {
  final List<int> fixedMinutes;
  final int selectedMinutes;
  final bool isCustomSelected;
  final bool locked;
  final ValueChanged<int> onSelectFixed;
  final VoidCallback onSelectCustom;

  const _DurationCard({
    required this.fixedMinutes,
    required this.selectedMinutes,
    required this.isCustomSelected,
    required this.locked,
    required this.onSelectFixed,
    required this.onSelectCustom,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.duration.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Opacity(
            opacity: locked ? 0.45 : 1.0,
            child: Row(
              children: [
                for (final minutes in fixedMinutes) ...[
                  Expanded(
                    child: _DurationPill(
                      label: '$minutes',
                      isSelected:
                          !isCustomSelected && selectedMinutes == minutes,
                      onTap: () => onSelectFixed(minutes),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: _DurationPill(
                    label: l10n.custom,
                    isSelected: isCustomSelected,
                    onTap: onSelectCustom,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DurationPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DurationPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? _kGold : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? _kGold : _kGold.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            color: isSelected ? _kNavy : _kCream,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BLOCKED APPS CARD
// ─────────────────────────────────────────────────────────────────────────────

class _BlockedAppsCard extends StatelessWidget {
  final List<InstalledApp> apps;
  final int selectedCount;
  final bool iconsReady;
  final bool isRunning;
  final VoidCallback? onSelectApps;

  const _BlockedAppsCard({
    required this.apps,
    required this.selectedCount,
    required this.iconsReady,
    required this.isRunning,
    this.onSelectApps,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final preview = apps.take(_kFocusPreviewLimit).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.blockedDuringFocus.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            selectedCount == 0
                ? l10n.appBlockingNoAppsSelected
                : l10n.appsBlockedCount(selectedCount),
            style: GoogleFonts.lato(
              fontSize: 12.5,
              fontWeight:
                  selectedCount == 0 ? FontWeight.w400 : FontWeight.w600,
              color: selectedCount == 0
                  ? _kCream.withValues(alpha: 0.5)
                  : _kCream.withValues(alpha: 0.85),
            ),
          ),
          // Real icons only render once the installed-apps cache is warm
          // (e.g. the picker below has been opened this session) — selecting
          // 0 apps still shows the empty-state text either way, but a
          // non-zero count with cold icons shows neither, rather than a
          // spinner, so opening this screen never feels like it's waiting
          // on anything.
          if (selectedCount > 0 && iconsReady) ...[
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: preview
                  .map((a) => _BlockedAppIcon(app: a, isRunning: isRunning))
                  .toList(),
            ),
          ],
          if (onSelectApps != null) ...[
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onSelectApps,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _kGold,
                  side: BorderSide(color: _kGold.withValues(alpha: 0.5)),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  '+ ${l10n.appBlockingSelectAppsButton}',
                  style: GoogleFonts.lato(
                      fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BlockedAppIcon extends StatelessWidget {
  final InstalledApp app;
  final bool isRunning;

  const _BlockedAppIcon({required this.app, required this.isRunning});

  @override
  Widget build(BuildContext context) {
    Widget icon = Container(
      width: 52,
      height: 52,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _kNavy,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kGold.withValues(alpha: 0.15)),
      ),
      child: app.iconBytes != null
          ? Image.memory(app.iconBytes!, fit: BoxFit.cover)
          : Icon(Icons.apps_rounded,
              color: _kCream.withValues(alpha: 0.5), size: 28),
    );

    // Grey out the icons only while a session is active
    if (isRunning) {
      icon = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0,
          0,
          0,
          0.55,
          0,
        ]),
        child: icon,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            icon,
            Positioned(
              right: -4,
              bottom: -4,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: isRunning ? const Color(0xFFB71C1C) : _kMutedGold,
                  shape: BoxShape.circle,
                  border: Border.all(color: _kCard, width: 1.5),
                ),
                child: const Icon(
                  Icons.block_rounded,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        SizedBox(
          width: 60,
          child: Text(
            app.appName,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontSize: 10,
              color: _kCream.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BEGIN FOCUS BUTTON
// ─────────────────────────────────────────────────────────────────────────────

class _BeginFocusButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTap;

  const _BeginFocusButton({required this.isRunning, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final accent = isRunning ? _kStopRed : _kGold;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              accent.withValues(alpha: 0.2),
              accent.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: accent.withValues(alpha: 0.5), width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isRunning ? Icons.stop_rounded : Icons.play_arrow_rounded,
                  color: accent,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  isRunning ? l10n.stopFocus : l10n.startFocus,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: accent,
                  ),
                ),
              ],
            ),
            if (!isRunning) ...[
              const SizedBox(height: 4),
              Text(
                l10n.focusButtonSubtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 11,
                  color: _kCream.withValues(alpha: 0.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SESSION COMPLETE DIALOG
// ─────────────────────────────────────────────────────────────────────────────

class _CompletionDialog extends StatelessWidget {
  final int completedSeconds;
  final VoidCallback onDone;

  const _CompletionDialog({
    required this.completedSeconds,
    required this.onDone,
  });

  String _durationLabel(AppLocalizations l10n) {
    final m = completedSeconds ~/ 60;
    return l10n.focusSessionMinutes(m);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _kGold.withValues(alpha: 0.45),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _kGold.withValues(alpha: 0.12),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Crescent icon
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _kGold.withValues(alpha: 0.1),
                border: Border.all(
                  color: _kGold.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.nightlight_round,
                size: 38,
                color: _kGold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              l10n.alhamdulillah,
              style: GoogleFonts.playfairDisplay(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: _kGold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 6),

            Text(
              l10n.sessionComplete,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _kCream,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              l10n.stayedFocusedFor(_durationLabel(l10n)),
              style: GoogleFonts.lato(
                fontSize: 14,
                color: _kCream.withValues(alpha: 0.6),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _kGold.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _kGold.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                l10n.focusCompletionQuote,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 12.5,
                  fontStyle: FontStyle.italic,
                  color: _kGold,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            // Done button
            GestureDetector(
              onTap: onDone,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_kGold, _kMutedGold],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: _kGold.withValues(alpha: 0.32),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    l10n.done,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _kNavy,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
