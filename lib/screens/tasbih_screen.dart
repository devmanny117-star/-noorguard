import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../l10n/app_localizations.dart';
import '../models/dhikr_model.dart';
import '../models/tasbih_sound.dart';
import '../services/tasbih_service.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/tasbih/manage_dhikr_sheet.dart';
import '../widgets/tasbih/sound_picker_sheet.dart';
import '../widgets/tasbih/tasbih_bead_ring.dart';
import '../widgets/tasbih/tasbih_crescent_star_icon.dart';
import '../widgets/tasbih/tasbih_mosque_silhouette.dart';
import '../widgets/tasbih/tasbih_particle_burst.dart';
import 'tasbih_stats_screen.dart';

// Same fixed dark palette as lock_screen.dart / BlockActivity's native screen.
const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _goldLight = Color(0xFFE8D5A3);
const _goldMuted = Color(0xFFA08532);
const _brightGold = Color(0xFFFFD54A);
const _cream = Color(0xFFF5EFE6);
const _creamMuted = Color(0xB3F5EFE6);

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with TickerProviderStateMixin {
  final _service = TasbihService();
  final _burstKey = GlobalKey<TasbihParticleBurstState>();
  AudioPool? _tickPool;
  String? _tickPoolSoundId;
  Timer? _hintTimer;

  bool _ready = false;
  bool _celebrating = false;
  bool _pressed = false;
  bool _showHint = false;

  late final AnimationController _rippleCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 550),
  );
  late final AnimationController _celebrationCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    WakelockPlus.enable();
    _init();
  }

  Future<void> _init() async {
    await _service.init();
    if (!mounted) return;
    setState(() => _ready = true);
    if (_service.soundEnabled) _ensureTickPool();
    if (!_service.tapHintShown) {
      setState(() => _showHint = true);
      _hintTimer = Timer(const Duration(seconds: 4), () {
        if (mounted) setState(() => _showHint = false);
        _service.markTapHintShown();
      });
    }
  }

  @override
  void dispose() {
    _rippleCtrl.dispose();
    _celebrationCtrl.dispose();
    _hintTimer?.cancel();
    _tickPool?.dispose();
    WakelockPlus.disable();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  /// Pre-loads a small pool of players for the selected tap sound so
  /// playback has no per-tap asset-load latency. Routed through
  /// [tasbihAudioContext] (Android STREAM_MUSIC / iOS playback category) so
  /// it's audible even with the device on vibrate/silent.
  ///
  /// Uses [PlayerMode.lowLatency] (SoundPool on Android) rather than the
  /// pool's default MediaPlayer-backed mode — MediaPlayer's per-play
  /// scheduling overhead is only really noticeable on very short clips
  /// (the classic-click/stone-tap clicks), which is why those specifically
  /// felt delayed while the longer soft-chime didn't. lowLatency mode
  /// doesn't auto-return players to the pool on completion, so each
  /// [_playTick] call schedules its own stop() once the clip has finished.
  Future<void> _ensureTickPool() async {
    final id = _service.selectedSoundId;
    if (_tickPoolSoundId == id && _tickPool != null) return;
    final oldPool = _tickPool;
    try {
      final newPool = await AudioPool.create(
        source: AssetSource(tasbihSoundAssetFor(id)),
        maxPlayers: 5,
        minPlayers: 3,
        playerMode: PlayerMode.lowLatency,
        audioContext: tasbihAudioContext(),
      );
      _tickPool = newPool;
      _tickPoolSoundId = id;
    } catch (_) {
      // Tap counting must never depend on audio playback succeeding.
    }
    await oldPool?.dispose();
  }

  Future<void> _playTick() async {
    try {
      await _ensureTickPool();
      final pool = _tickPool;
      if (pool == null) return;
      final stop = await pool.start(volume: 0.6);
      Future.delayed(const Duration(milliseconds: 700), stop);
    } catch (_) {
      // Tap counting must never depend on audio playback succeeding.
    }
  }

  void _onTap() {
    if (!_ready || _celebrating) return;
    final result = _service.tap();

    HapticFeedback.lightImpact();
    _rippleCtrl.forward(from: 0);
    if (_service.soundEnabled) _playTick();

    if (result.completedRound) {
      HapticFeedback.heavyImpact();
      Future.delayed(
          const Duration(milliseconds: 90), HapticFeedback.heavyImpact);
      _burstKey.currentState?.burst(count: 70, power: 1.7);
      Future.delayed(const Duration(milliseconds: 380), () {
        if (!mounted) return;
        if (_service.sessionTotal < _service.roundTarget) return;
        setState(() => _celebrating = true);
        _celebrationCtrl.forward(from: 0);
      });
    } else if (result.reachedDhikrTarget) {
      HapticFeedback.heavyImpact();
      _burstKey.currentState?.burst(count: 40, power: 1.0);
      Future.delayed(const Duration(milliseconds: 380), () {
        if (!mounted) return;
        _service.advanceToNextDhikr();
      });
    }
  }

  void _onUndo() {
    if (!_service.canUndo) return;
    HapticFeedback.lightImpact();
    _service.undo();
    if (_celebrating) {
      _celebrationCtrl.reset();
      setState(() => _celebrating = false);
    }
  }

  void _onReset() {
    HapticFeedback.lightImpact();
    _celebrationCtrl.reset();
    setState(() => _celebrating = false);
    _service.resetSession();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: ListenableBuilder(
        listenable: _service,
        builder: (context, _) {
          return Stack(
            children: [
              Positioned.fill(
                child: TasbihMosqueSilhouette(
                    color: _gold.withValues(alpha: 0.05)),
              ),
              // Tap-anywhere layer. Real buttons in the layers painted above
              // this one absorb their own taps first, so they never also
              // register as a count.
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown:
                      _ready ? (_) => setState(() => _pressed = true) : null,
                  onTapUp:
                      _ready ? (_) => setState(() => _pressed = false) : null,
                  onTapCancel:
                      _ready ? () => setState(() => _pressed = false) : null,
                  onTap: _ready ? _onTap : null,
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    _buildHeader(l10n),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 4),
                          _buildDhikrBlock(l10n),
                          _buildProgress(l10n),
                          _buildBottomButtons(),
                          _buildStatsBar(l10n),
                        ],
                      ),
                    ),
                    const BannerAdWidget(),
                  ],
                ),
              ),
              if (_showHint) _buildTapHint(l10n),
              if (_celebrating) _buildCelebrationOverlay(l10n),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 12, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 16, color: Colors.white70),
            ),
          ),
          Expanded(
            child: Text(
              l10n.tasbihCounter,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _cream,
              ),
            ),
          ),
          IconButton(
            tooltip: l10n.tasbihSoundToggleTooltip,
            icon: Icon(
              _service.soundEnabled
                  ? Icons.volume_up_rounded
                  : Icons.volume_off_rounded,
              size: 19,
              color: _creamMuted,
            ),
            onPressed: () {
              final enabling = !_service.soundEnabled;
              _service.setSoundEnabled(enabling);
              if (enabling) _ensureTickPool();
            },
          ),
          IconButton(
            tooltip: l10n.tasbihSoundPickerTitle,
            icon: const Icon(Icons.graphic_eq_rounded,
                size: 19, color: _creamMuted),
            onPressed: () => showSoundPickerSheet(context),
          ),
          IconButton(
            tooltip: l10n.tasbihManageDhikrTooltip,
            icon: const Icon(Icons.list_alt_rounded,
                size: 19, color: _creamMuted),
            onPressed: () => showManageDhikrSheet(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDhikrBlock(AppLocalizations l10n) {
    final dhikr = _service.currentDhikr;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 420),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.10),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: Column(
        key: ValueKey(_service.dhikrIndex),
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTopSection(l10n, dhikr),
          const SizedBox(height: 18),
          _buildBeadRingCenter(l10n, dhikr),
        ],
      ),
    );
  }

  Widget _buildTopSection(AppLocalizations l10n, DhikrItem dhikr) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TasbihCrescentStarIcon(color: _gold.withValues(alpha: 0.75)),
        const SizedBox(height: 10),
        Text(
          l10n.tasbihCurrentlyReciting.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: _gold.withValues(alpha: 0.75),
            letterSpacing: 2.4,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          dhikr.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _gold,
          ),
        ),
        if (dhikr.arabic.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            dhikr.arabic,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: GoogleFonts.scheherazadeNew(fontSize: 30, color: _cream),
          ),
        ],
      ],
    );
  }

  Widget _buildBeadRingCenter(AppLocalizations l10n, DhikrItem dhikr) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TasbihBeadRing(
            count: _service.count,
            target: dhikr.target,
            size: 270,
            gold: _gold,
            goldLight: _goldLight,
            brightGold: _brightGold,
          ),
          AnimatedBuilder(
            animation: _rippleCtrl,
            builder: (context, _) {
              final t = _rippleCtrl.value;
              if (t == 0) return const SizedBox();
              return IgnorePointer(
                child: Opacity(
                  opacity: (1 - t).clamp(0.0, 1.0) * 0.6,
                  child: Transform.scale(
                    scale: 0.4 + t * 0.9,
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _goldLight, width: 2.4),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          IgnorePointer(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _gold.withValues(alpha: 0.16),
                    _gold.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_service.count}',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.tasbihOfTarget(dhikr.target),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _creamMuted,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: TasbihParticleBurst(
              key: _burstKey,
              color: _gold,
              colorLight: _goldLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(AppLocalizations l10n) {
    final dhikrList = _service.dhikrList;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(dhikrList.length, (i) {
            final reached = i < _service.dhikrIndex || _celebrating;
            final active = i == _service.dhikrIndex && !_celebrating;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              width: active ? 26 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: reached || active
                    ? _gold
                    : Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          '${(_celebrating ? dhikrList.length : _service.dhikrIndex + 1)}/${dhikrList.length}',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _creamMuted,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CircleIconButton(
          icon: Icons.undo_rounded,
          size: 54,
          enabled: _service.canUndo,
          onTap: _onUndo,
        ),
        const SizedBox(width: 22),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: _ready ? (_) => setState(() => _pressed = true) : null,
          onTapUp: _ready ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: _ready ? () => setState(() => _pressed = false) : null,
          onTap: _ready ? _onTap : null,
          child: AnimatedScale(
            scale: _pressed ? 0.92 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_goldLight, _gold, _goldMuted],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.45),
                    blurRadius: 22,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child:
                  const Icon(Icons.touch_app_rounded, color: _navy, size: 30),
            ),
          ),
        ),
        const SizedBox(width: 22),
        _CircleIconButton(
          icon: Icons.refresh_rounded,
          size: 54,
          enabled: true,
          onTap: _onReset,
        ),
      ],
    );
  }

  Widget _buildStatsBar(AppLocalizations l10n) {
    final today = DateTime.now();
    final todayTaps = _service.dailyTapsOn(today);
    final todayRounds = _service.dailyRoundsOn(today);
    final streak = _service.currentStreak;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TasbihStatsScreen()),
        ),
        child: Tooltip(
          message: l10n.tasbihStatsTooltip,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            padding: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: _gold.withValues(alpha: 0.18)),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _StatColumn(
                    value: '$todayTaps',
                    label: l10n.tasbihDailyTotalLabel,
                  ),
                ),
                _statDivider(),
                Expanded(
                  child: _StatColumn(
                    value: '$streak',
                    label: l10n.currentStreak,
                  ),
                ),
                _statDivider(),
                Expanded(
                  child: _StatColumn(
                    value: '$todayRounds',
                    label: l10n.tasbihRoundsTodayLabel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statDivider() =>
      Container(width: 1, height: 30, color: _gold.withValues(alpha: 0.2));

  Widget _buildTapHint(AppLocalizations l10n) {
    return Positioned(
      top: 70,
      left: 32,
      right: 32,
      child: IgnorePointer(
        child: AnimatedOpacity(
          opacity: _showHint ? 1 : 0,
          duration: const Duration(milliseconds: 400),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: _navy.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _gold.withValues(alpha: 0.35)),
            ),
            child: Text(
              l10n.tasbihTapAnywhereHint,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 12.5,
                color: _cream,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCelebrationOverlay(AppLocalizations l10n) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: AnimatedBuilder(
          animation: _celebrationCtrl,
          builder: (context, child) {
            final t = _celebrationCtrl.value.clamp(0.0, 1.0);
            final bounce = Curves.elasticOut.transform(t);
            return Container(
              color: _navy.withValues(alpha: 0.94 * t),
              child: Center(
                child: Opacity(
                  opacity: t,
                  child: Transform.scale(
                    scale: 0.7 + 0.3 * bounce,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [_goldLight, _gold, _goldMuted],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _gold.withValues(alpha: 0.5),
                                blurRadius: 40,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.check_rounded,
                              color: _navy, size: 64),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          l10n.tasbihCelebrationTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: _gold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            l10n.tasbihCelebrationBody,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: _creamMuted,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        GestureDetector(
                          onTap: _onReset,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 14),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [_goldLight, _gold, _goldMuted],
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Text(
                              l10n.tasbihStartNewSession,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: _navy,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final bool enabled;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.size,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = enabled ? _gold : _gold.withValues(alpha: 0.3);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled ? onTap : null,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1.6),
        ),
        child: Icon(icon, color: color, size: size * 0.42),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _gold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 10.5,
            color: _creamMuted,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
