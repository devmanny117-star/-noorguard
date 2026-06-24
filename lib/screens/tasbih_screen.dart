import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

// Same fixed dark palette as lock_screen.dart / BlockActivity's native screen.
const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _goldLight = Color(0xFFE8D5A3);
const _goldMuted = Color(0xFFA08532);
const _cream = Color(0xFFF5EFE6);
const _creamMuted = Color(0xB3F5EFE6);

/// Dhikr names are kept transliterated rather than translated, same as
/// prayer names elsewhere in the app (e.g. "Fajr") — they're recited terms,
/// not phrases with a meaningful per-language equivalent.
class _Dhikr {
  final String name;
  final String arabic;
  const _Dhikr(this.name, this.arabic);
}

const _dhikrTarget = 33;
const _totalTarget = 99;

const _dhikrList = [
  _Dhikr('SubhanAllah', 'سُبْحَانَ اللَّهِ'),
  _Dhikr('Alhamdulillah', 'الْحَمْدُ لِلَّهِ'),
  _Dhikr('Allahu Akbar', 'اللَّهُ أَكْبَرُ'),
];

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with TickerProviderStateMixin {
  int _dhikrIndex = 0;
  int _count = 0;
  int _totalCount = 0;
  bool _celebrating = false;
  bool _pressed = false;

  late final AnimationController _rippleCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final AnimationController _dhikrFadeCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 320),
    value: 1,
  );
  late final AnimationController _celebrationCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late final AnimationController _glowCtrl = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  _Dhikr get _currentDhikr => _dhikrList[_dhikrIndex];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  void dispose() {
    _rippleCtrl.dispose();
    _dhikrFadeCtrl.dispose();
    _celebrationCtrl.dispose();
    _glowCtrl.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  Future<void> _advanceDhikr() async {
    await _dhikrFadeCtrl.reverse();
    if (!mounted) return;
    setState(() {
      _dhikrIndex++;
      _count = 0;
    });
    _dhikrFadeCtrl.forward();
  }

  void _onTap() {
    if (_celebrating) return;
    HapticFeedback.mediumImpact();
    _rippleCtrl.forward(from: 0);
    setState(() {
      _count++;
      _totalCount++;
    });
    if (_count >= _dhikrTarget) {
      HapticFeedback.heavyImpact();
      Future.delayed(const Duration(milliseconds: 380), () {
        if (!mounted) return;
        if (_dhikrIndex >= _dhikrList.length - 1) {
          setState(() => _celebrating = true);
          _celebrationCtrl.forward(from: 0);
        } else {
          _advanceDhikr();
        }
      });
    }
  }

  void _reset() {
    HapticFeedback.lightImpact();
    _celebrationCtrl.reset();
    _dhikrFadeCtrl.value = 1;
    setState(() {
      _dhikrIndex = 0;
      _count = 0;
      _totalCount = 0;
      _celebrating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(l10n),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: _buildProgress(l10n),
                      ),
                      _buildDhikrInfo(),
                      _buildCounterButton(),
                      _buildFooter(l10n),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_celebrating) _buildCelebrationOverlay(l10n),
        ],
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
          const SizedBox(width: 32),
        ],
      ),
    );
  }

  Widget _buildProgress(AppLocalizations l10n) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_dhikrList.length, (i) {
            final reached = i < _dhikrIndex || _celebrating;
            final active = i == _dhikrIndex && !_celebrating;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 5),
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
          '${(_celebrating ? _dhikrList.length : _dhikrIndex + 1)}/${_dhikrList.length}',
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

  Widget _buildDhikrInfo() {
    return FadeTransition(
      opacity: _dhikrFadeCtrl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _currentDhikr.name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _currentDhikr.arabic,
            style: GoogleFonts.scheherazadeNew(
              fontSize: 34,
              color: _cream,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton() {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: _onTap,
      child: SizedBox(
        width: 260,
        height: 260,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _glowCtrl,
              builder: (context, _) => Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _gold.withValues(
                          alpha: 0.22 + _glowCtrl.value * 0.14),
                      blurRadius: 38 + _glowCtrl.value * 18,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _rippleCtrl,
              builder: (context, _) {
                final t = _rippleCtrl.value;
                if (t == 0) return const SizedBox();
                return Opacity(
                  opacity: (1 - t).clamp(0.0, 1.0) * 0.55,
                  child: Transform.scale(
                    scale: 1 + t * 0.3,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: _goldLight, width: 3),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedScale(
              scale: _pressed ? 0.95 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [_goldLight, _gold, _goldMuted],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$_count',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 72,
                      fontWeight: FontWeight.w700,
                      color: _navy,
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

  Widget _buildFooter(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${l10n.tasbihTotalLabel}: $_totalCount / $_totalTarget',
            style: GoogleFonts.lato(
              fontSize: 14,
              color: _creamMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: _reset,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: _creamMuted),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh_rounded, size: 16, color: _creamMuted),
                  const SizedBox(width: 6),
                  Text(
                    l10n.tasbihResetButton,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: _creamMuted,
                      fontWeight: FontWeight.w600,
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
                          onTap: _reset,
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
