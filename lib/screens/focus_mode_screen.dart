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
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import 'installed_apps_picker_screen.dart';

// Shown as blocked in Focus Mode's preview row, capped for the row's layout
// — the count badge still reflects the full blocked-apps total.
const _kFocusPreviewLimit = 4;

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
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final controller = TextEditingController();
    final minutes = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.cardBg,
        title: Text(
          l10n.customTimerMinutesTitle,
          style: GoogleFonts.lato(
            color: colors.primaryText,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          style: TextStyle(color: colors.primaryText),
          decoration: InputDecoration(
            hintText: l10n.customTimerHint,
            hintStyle: TextStyle(color: colors.secondaryText),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.gold.withValues(alpha: 0.5)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.gold),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel,
                style: GoogleFonts.lato(color: colors.secondaryText)),
          ),
          TextButton(
            onPressed: () {
              final value = int.tryParse(controller.text.trim());
              if (value != null && value > 0) Navigator.pop(ctx, value);
            },
            child: Text(
              l10n.start,
              style: GoogleFonts.lato(
                  color: AppColors.gold, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
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
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: colors.warmBg,
      body: SafeArea(
        child: Column(
          children: [
            _Header(isRunning: _isRunning),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const _SubtitleCard(),
                    const SizedBox(height: 28),
                    _TimerCircle(
                      progress: _progress,
                      timeString: _formatTime(),
                      dua: focusDuas[_duaIndex],
                      duaFade: _duaFade,
                      isRunning: _isRunning && !_pausedForPrayer,
                      pausedForPrayer: _pausedForPrayer,
                      pulse: _pulse,
                    ),
                    const SizedBox(height: 24),
                    _DurationRow(
                      fixedMinutes: _fixedPresetMinutes,
                      selectedMinutes: _selectedMinutes,
                      isCustomSelected: _isCustomSelected,
                      locked: _isRunning,
                      onSelectFixed: _selectFixedPreset,
                      onSelectCustom: _selectCustomDuration,
                    ),
                    const SizedBox(height: 28),
                    _BlockedAppsPreview(
                      apps: _blockedApps,
                      selectedCount: _blockedAppsCount,
                      iconsReady: _blockedAppsIconsReady,
                      isRunning: _isRunning,
                      onSelectApps: _isRunning ? null : _openAppsPicker,
                    ),
                    const SizedBox(height: 28),
                    _StartStopButton(
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
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 22, 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: colors.primaryText,
            ),
          ),
          Text(
            l10n.focusMode,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: colors.primaryText,
            ),
          ),
          const Spacer(),
          AnimatedOpacity(
            opacity: isRunning ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.deepGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.deepGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.active,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deepGreen,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.deepGreen.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.deepGreen.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.mosque_rounded,
            size: 18,
            color: AppColors.deepGreen,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.focusModeSubtitle,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: AppColors.deepGreen,
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
// TIMER CIRCLE
// ─────────────────────────────────────────────────────────────────────────────

class _TimerCircle extends StatelessWidget {
  final double progress;
  final String timeString;
  final Dua dua;
  final Animation<double> duaFade;
  final bool isRunning;
  final bool pausedForPrayer;
  final Animation<double> pulse;

  const _TimerCircle({
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
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return AnimatedBuilder(
      animation: pulse,
      builder: (_, __) {
        final glowRadius = isRunning ? (16 + pulse.value * 14) : 0.0;
        return Container(
          width: 290,
          height: 290,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isRunning
                ? [
                    BoxShadow(
                      color: AppColors.gold
                          .withValues(alpha: 0.18 + pulse.value * 0.10),
                      blurRadius: glowRadius,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: CustomPaint(
            painter: _TimerRingPainter(
              progress: progress,
              trackColor: colors.border,
            ),
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.cardBg,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeString,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gold,
                      letterSpacing: -1,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    pausedForPrayer
                        ? l10n.focusPaused
                        : (isRunning ? l10n.remaining : l10n.ready),
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      color: colors.secondaryText,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 36,
                    height: 1.5,
                    color: AppColors.gold.withValues(alpha: 0.35),
                  ),
                  const SizedBox(height: 14),
                  FadeTransition(
                    opacity: duaFade,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              dua.arabic.replaceAll('\n', ' '),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.6,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (Localizations.localeOf(context).languageCode !=
                              'ar')
                            Text(
                              dua
                                  .translationFor(
                                    Localizations.localeOf(context)
                                        .languageCode,
                                  )
                                  .replaceAll('\n', ' '),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 10.5,
                                color: colors.secondaryText,
                                height: 1.45,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Ring: starts full (progress=1.0), depletes to empty (progress=0.0).
class _TimerRingPainter extends CustomPainter {
  final double progress;
  final Color trackColor;

  _TimerRingPainter({required this.progress, required this.trackColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // Background track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, radius, trackPaint);

    if (progress <= 0) return;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Gradient arc — sweeps from 12 o'clock clockwise by progress fraction
    final shader = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: -math.pi / 2 + 2 * math.pi * progress,
      colors: const [
        Color(0xFFE8D5A3),
        AppColors.gold,
        AppColors.mutedGold,
      ],
    ).createShader(rect);

    final arcPaint = Paint()
      ..shader = shader
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      arcPaint,
    );

    // Leading dot at the tip of the arc
    final endAngle = -math.pi / 2 + 2 * math.pi * progress;
    final dotCenter = Offset(
      center.dx + radius * math.cos(endAngle),
      center.dy + radius * math.sin(endAngle),
    );
    canvas.drawCircle(dotCenter, 6, Paint()..color = AppColors.gold);
    canvas.drawCircle(dotCenter, 3, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_TimerRingPainter old) =>
      old.progress != progress || old.trackColor != trackColor;
}

// ─────────────────────────────────────────────────────────────────────────────
// PRESET DURATION SELECTOR
// ─────────────────────────────────────────────────────────────────────────────

class _DurationRow extends StatelessWidget {
  final List<int> fixedMinutes;
  final int selectedMinutes;
  final bool isCustomSelected;
  final bool locked;
  final ValueChanged<int> onSelectFixed;
  final VoidCallback onSelectCustom;

  const _DurationRow({
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.duration.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
            letterSpacing: 1.3,
          ),
        ),
        const SizedBox(height: 10),
        Opacity(
          opacity: locked ? 0.45 : 1.0,
          child: Row(
            children: [
              for (int i = 0; i < fixedMinutes.length; i++)
                Expanded(
                  child: _DurationTile(
                    margin: const EdgeInsets.only(right: 10),
                    isSelected:
                        !isCustomSelected && selectedMinutes == fixedMinutes[i],
                    onTap: () => onSelectFixed(fixedMinutes[i]),
                    primaryText: '${fixedMinutes[i]}',
                    secondaryText: l10n.minutesAbbreviation,
                  ),
                ),
              Expanded(
                child: _DurationTile(
                  margin: EdgeInsets.zero,
                  isSelected: isCustomSelected,
                  onTap: onSelectCustom,
                  icon: Icons.edit_rounded,
                  primaryText: l10n.custom,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DurationTile extends StatelessWidget {
  final EdgeInsets margin;
  final bool isSelected;
  final VoidCallback onTap;
  final String primaryText;
  final String? secondaryText;
  final IconData? icon;

  const _DurationTile({
    required this.margin,
    required this.isSelected,
    required this.onTap,
    required this.primaryText,
    this.secondaryText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.gold : colors.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.gold : colors.border,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: 0.28),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.white : colors.primaryText,
              )
            else
              Text(
                primaryText,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : colors.primaryText,
                ),
              ),
            if (secondaryText != null)
              Text(
                secondaryText!,
                style: GoogleFonts.lato(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.8)
                      : colors.secondaryText,
                ),
              )
            else if (icon != null)
              Text(
                primaryText,
                style: GoogleFonts.lato(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : colors.primaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BLOCKED APPS PREVIEW
// ─────────────────────────────────────────────────────────────────────────────

class _BlockedAppsPreview extends StatelessWidget {
  final List<InstalledApp> apps;
  final int selectedCount;
  final bool iconsReady;
  final bool isRunning;
  final VoidCallback? onSelectApps;

  const _BlockedAppsPreview({
    required this.apps,
    required this.selectedCount,
    required this.iconsReady,
    required this.isRunning,
    this.onSelectApps,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final preview = apps.take(_kFocusPreviewLimit).toList();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                l10n.blockedDuringFocus,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: colors.primaryText,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color:
                      isRunning ? const Color(0xFFFFEBEE) : colors.secondaryBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  l10n.appsBlockedCount(selectedCount),
                  style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: isRunning
                        ? const Color(0xFFB71C1C)
                        : colors.secondaryText,
                  ),
                ),
              ),
            ],
          ),
          // Real icons only render once the installed-apps cache is warm
          // (e.g. the picker below has been opened this session) — selecting
          // 0 apps still shows the empty-state text either way, but a
          // non-zero count with cold icons shows neither, rather than a
          // spinner, so opening this screen never feels like it's waiting
          // on anything.
          if (selectedCount == 0) ...[
            const SizedBox(height: 16),
            Text(
              l10n.appBlockingNoAppsSelected,
              style:
                  GoogleFonts.lato(fontSize: 12.5, color: colors.secondaryText),
            ),
          ] else if (iconsReady) ...[
            const SizedBox(height: 16),
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
                  foregroundColor: AppColors.gold,
                  side:
                      BorderSide(color: AppColors.gold.withValues(alpha: 0.5)),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  l10n.appBlockingSelectAppsButton,
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
    final colors = context.appColors;

    Widget icon = Container(
      width: 52,
      height: 52,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.secondaryBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: app.iconBytes != null
          ? Image.memory(app.iconBytes!, fit: BoxFit.cover)
          : Icon(Icons.apps_rounded, color: colors.secondaryText, size: 28),
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
                  color: isRunning
                      ? const Color(0xFFB71C1C)
                      : colors.secondaryText,
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.cardBg, width: 1.5),
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
              color: colors.secondaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// START / STOP BUTTON
// ─────────────────────────────────────────────────────────────────────────────

class _StartStopButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTap;

  const _StartStopButton({required this.isRunning, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isRunning
                ? [const Color(0xFFB71C1C), const Color(0xFFD32F2F)]
                : [AppColors.gold, AppColors.mutedGold],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: (isRunning ? const Color(0xFFB71C1C) : AppColors.gold)
                  .withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isRunning ? Icons.stop_rounded : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 26,
            ),
            const SizedBox(width: 10),
            Text(
              isRunning ? l10n.stopFocus : l10n.startFocus,
              style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.4,
              ),
            ),
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
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: colors.cardBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.gold.withValues(alpha: 0.45),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.12),
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
                color: AppColors.gold.withValues(alpha: 0.1),
                border: Border.all(
                  color: AppColors.gold.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.nightlight_round,
                size: 38,
                color: AppColors.gold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              l10n.alhamdulillah,
              style: GoogleFonts.playfairDisplay(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.gold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 6),

            Text(
              l10n.sessionComplete,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.primaryText,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              l10n.stayedFocusedFor(_durationLabel(l10n)),
              style: GoogleFonts.lato(
                fontSize: 14,
                color: colors.secondaryText,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.gold.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                l10n.focusCompletionQuote,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 12.5,
                  fontStyle: FontStyle.italic,
                  color: AppColors.gold,
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
                    colors: [AppColors.gold, AppColors.mutedGold],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gold.withValues(alpha: 0.32),
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
                      color: Colors.white,
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
