import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_model.dart';
import '../models/dua_model.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

// The 4 specific apps shown as blocked in focus mode
final _kFocusApps = <AppItem>[
  AppItem(
    name: 'Instagram',
    category: 'Social Media',
    icon: Icons.camera_alt_rounded,
    iconColor: const Color(0xFFE1306C),
    iconBg: const Color(0xFFFCE4EC),
    isBlocked: true,
  ),
  AppItem(
    name: 'TikTok',
    category: 'Social Media',
    icon: Icons.music_note_rounded,
    iconColor: const Color(0xFF010101),
    iconBg: const Color(0xFFF5F5F5),
    isBlocked: true,
  ),
  AppItem(
    name: 'YouTube',
    category: 'Entertainment',
    icon: Icons.play_circle_filled_rounded,
    iconColor: const Color(0xFFFF0000),
    iconBg: const Color(0xFFFFEBEE),
    isBlocked: true,
  ),
  AppItem(
    name: 'Twitter',
    category: 'Social Media',
    icon: Icons.alternate_email_rounded,
    iconColor: const Color(0xFF1DA1F2),
    iconBg: const Color(0xFFE3F2FD),
    isBlocked: true,
  ),
];

class FocusModeScreen extends StatefulWidget {
  const FocusModeScreen({super.key});

  @override
  State<FocusModeScreen> createState() => _FocusModeScreenState();
}

class _FocusModeScreenState extends State<FocusModeScreen>
    with TickerProviderStateMixin {
  static const _presets = [15, 25, 45, 60];
  int _selectedPreset = 1;
  bool _isRunning = false;
  late int _totalSeconds;
  late int _remaining;
  Timer? _timer;
  int _duaIndex = 0;

  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;
  late AnimationController _duaFadeCtrl;
  late Animation<double> _duaFade;

  @override
  void initState() {
    super.initState();
    _totalSeconds = _presets[_selectedPreset] * 60;
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
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseCtrl.dispose();
    _duaFadeCtrl.dispose();
    super.dispose();
  }

  // ── Timer control ────────────────────────────────────────────────────────

  void _startTimer() {
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
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
      _totalSeconds = _presets[_selectedPreset] * 60;
      _remaining = _totalSeconds;
      _duaIndex = 0;
    });
    _duaFadeCtrl.value = 1.0;
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

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.65),
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

  void _selectPreset(int index) {
    if (_isRunning) return;
    setState(() {
      _selectedPreset = index;
      _totalSeconds = _presets[index] * 60;
      _remaining = _totalSeconds;
    });
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  String _formatTime() {
    final m = _remaining ~/ 60;
    final s = _remaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // progress = 1.0 (full ring) at start → 0.0 (empty ring) at end
  double get _progress =>
      _totalSeconds > 0 ? _remaining / _totalSeconds : 0.0;

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
                      isRunning: _isRunning,
                      pulse: _pulse,
                    ),
                    const SizedBox(height: 24),
                    _PresetRow(
                      presets: _presets,
                      selected: _selectedPreset,
                      locked: _isRunning,
                      onSelect: _selectPreset,
                    ),
                    const SizedBox(height: 28),
                    _BlockedAppsPreview(
                      apps: _kFocusApps,
                      isRunning: _isRunning,
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
                color: AppColors.deepGreen.withOpacity(0.1),
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
        color: AppColors.deepGreen.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.deepGreen.withOpacity(0.12)),
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
  final Animation<double> pulse;

  const _TimerCircle({
    required this.progress,
    required this.timeString,
    required this.dua,
    required this.duaFade,
    required this.isRunning,
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
                          .withOpacity(0.18 + pulse.value * 0.10),
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
                    color: AppColors.gold.withOpacity(0.06),
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
                    isRunning ? l10n.remaining : l10n.ready,
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
                    color: AppColors.gold.withOpacity(0.35),
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
                          Text(
                            dua.translation.replaceAll('\n', ' '),
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

class _PresetRow extends StatelessWidget {
  final List<int> presets;
  final int selected;
  final bool locked;
  final ValueChanged<int> onSelect;

  const _PresetRow({
    required this.presets,
    required this.selected,
    required this.locked,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
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
            children: List.generate(presets.length, (i) {
              final isSelected = i == selected;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onSelect(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(
                        right: i < presets.length - 1 ? 10 : 0),
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
                                color: AppColors.gold.withOpacity(0.28),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${presets[i]}',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : colors.primaryText,
                          ),
                        ),
                        Text(
                          l10n.minutesAbbreviation,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white.withOpacity(0.8)
                                : colors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BLOCKED APPS PREVIEW
// ─────────────────────────────────────────────────────────────────────────────

class _BlockedAppsPreview extends StatelessWidget {
  final List<AppItem> apps;
  final bool isRunning;

  const _BlockedAppsPreview({
    required this.apps,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isRunning
                      ? const Color(0xFFFFEBEE)
                      : colors.secondaryBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  l10n.appsBlockedCount(apps.length),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: apps
                .map((a) => _BlockedAppIcon(app: a, isRunning: isRunning))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BlockedAppIcon extends StatelessWidget {
  final AppItem app;
  final bool isRunning;

  const _BlockedAppIcon({required this.app, required this.isRunning});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    Widget icon = Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: app.iconBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(app.icon, color: app.iconColor, size: 28),
    );

    // Grey out the icons only while a session is active
    if (isRunning) {
      icon = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      0.55, 0,
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
                  border:
                      Border.all(color: colors.cardBg, width: 1.5),
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
        Text(
          app.name,
          style: GoogleFonts.lato(
            fontSize: 10,
            color: colors.secondaryText,
            fontWeight: FontWeight.w500,
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
                  .withOpacity(0.35),
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
            color: AppColors.gold.withOpacity(0.45),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withOpacity(0.12),
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
                color: AppColors.gold.withOpacity(0.1),
                border: Border.all(
                  color: AppColors.gold.withOpacity(0.3),
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.gold.withOpacity(0.2),
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
                      color: AppColors.gold.withOpacity(0.32),
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
