import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../widgets/geometric_pattern_painter.dart';
import 'beginner_home_screen.dart';
import 'home_screen.dart';

// Always dark — onboarding never inherits the system theme.
const _bg = Color(0xFF081321);
const _titleGold = Color(0xFFD4AF37);
const _gold = Color(0xFFC9A84C);
const _white = Color(0xFFF5F5F0);
const _grey = Color(0xFF6B7A8D);
const _cardBg = Color(0xFF152535);
const _cardBorder = Color(0xFF1E3348);

// ─────────────────────────────────────────────────────────────────────────────
// ENTRY POINT
// ─────────────────────────────────────────────────────────────────────────────

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  String _userName = '';
  bool? _beginnerMode;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    // Marks the Samsung notification wizard as done — new onboarding
    // handles the basic notification prompt inline, so users skip that screen.
    await prefs.setBool('notification_setup_complete', true);
    if (_userName.isNotEmpty) await prefs.setString('user_name', _userName);
    await prefs.setBool('beginner_mode', _beginnerMode ?? false);
    if (!mounted) return;
    final isBeginner = _beginnerMode ?? false;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            isBeginner ? const BeginnerHomeScreen() : const HomeScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: _bg,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _WelcomePage(
              onNext: _nextPage,
              onSkip: _completeOnboarding,
            ),
            _NamePage(
              onNext: (name) {
                setState(() => _userName = name);
                _nextPage();
              },
              onBack: _prevPage,
            ),
            _IslamModePage(
              onNext: (isBeginner) {
                setState(() => _beginnerMode = isBeginner);
                _nextPage();
              },
              onBack: _prevPage,
            ),
            _LocationPage(onNext: _nextPage, onBack: _prevPage),
            _NotificationPage(onComplete: _completeOnboarding, onBack: _prevPage),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 1 – WELCOME
// ─────────────────────────────────────────────────────────────────────────────

class _WelcomePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  const _WelcomePage({required this.onNext, required this.onSkip});

  @override
  State<_WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<_WelcomePage>
    with TickerProviderStateMixin {
  late final AnimationController _fadeCtrl;
  late final AnimationController _twinkleCtrl;
  late final AnimationController _buttonCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _buttonFadeAnim;
  late final Animation<Offset> _buttonSlideAnim;

  @override
  void initState() {
    super.initState();
    // 400ms screen fade-in
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);

    // Star twinkle
    _twinkleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    // Button fades + slides up after brief delay
    _buttonCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) _buttonCtrl.forward();
    });
    _buttonFadeAnim =
        CurvedAnimation(parent: _buttonCtrl, curve: Curves.easeOut);
    _buttonSlideAnim =
        Tween<Offset>(begin: const Offset(0, 0.22), end: Offset.zero).animate(
      CurvedAnimation(parent: _buttonCtrl, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    _twinkleCtrl.dispose();
    _buttonCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);
    final topPad = MediaQuery.paddingOf(context).top;
    final botPad = MediaQuery.paddingOf(context).bottom;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Stack(
        children: [
          // Radial gradient: brighter center-top, dark edges
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -0.55),
                  radius: 1.15,
                  colors: [Color(0xFF101E31), Color(0xFF081321)],
                ),
              ),
            ),
          ),

          Column(
            children: [
              SizedBox(height: topPad + 12),

              // ── Mosque section: upper 50% of screen ───────────────────────
              SizedBox(
                height: size.height * 0.50,
                child: Stack(
                  children: [
                    // Mosque silhouette — gold outline, no fill
                    const Positioned.fill(
                      child: CustomPaint(painter: _MasjidPainter()),
                    ),
                    // Star particles scattered in the sky around the mosque
                    AnimatedBuilder(
                      animation: _twinkleCtrl,
                      builder: (_, __) => Positioned.fill(
                        child: CustomPaint(
                          painter: _StarsPainter(twinkle: _twinkleCtrl.value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Text + CTA section ─────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // "Welcome to"
                      Text(
                        l10n.onboardingWelcomeTo,
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFF8F8F8)
                              .withValues(alpha: 0.72),
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // "Noor Guard" — "Guard" in gold
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'Noor ',
                            style: GoogleFonts.inter(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFF8F8F8),
                              height: 1.1,
                              letterSpacing: -0.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Guard',
                            style: GoogleFonts.inter(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: _titleGold,
                              height: 1.1,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      // Subtitle — max 70% width, white 65% opacity
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: size.width * 0.70),
                        child: Text(
                          l10n.onboardingSubtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFF8F8F8)
                                .withValues(alpha: 0.62),
                            height: 1.6,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const _PageDots(currentPage: 0, totalPages: 3),
                      const SizedBox(height: 22),
                      // Button slides up + fades in
                      SlideTransition(
                        position: _buttonSlideAnim,
                        child: FadeTransition(
                          opacity: _buttonFadeAnim,
                          child: _GoldButton(
                            label: l10n.onboardingLetsGetStarted,
                            onTap: widget.onNext,
                            showArrow: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: botPad + 16),
            ],
          ),

          // Skip — top-right, gold
          Positioned(
            top: topPad + 8,
            right: 16,
            child: TextButton(
              onPressed: widget.onSkip,
              style: TextButton.styleFrom(
                foregroundColor: _titleGold,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                overlayColor: _titleGold,
              ),
              child: Text(
                l10n.onboardingSkip,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: _titleGold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 2 – NAME
// ─────────────────────────────────────────────────────────────────────────────

class _NamePage extends StatefulWidget {
  final void Function(String name) onNext;
  final VoidCallback onBack;
  const _NamePage({required this.onNext, required this.onBack});

  @override
  State<_NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<_NamePage> {
  final _controller = TextEditingController();
  String _name = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final botPad = MediaQuery.paddingOf(context).bottom;

    return Column(
      children: [
        SafeArea(child: _StepHeader(onBack: widget.onBack, step: 2)),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 32),
                const _IslamicStarCircle(),
                const SizedBox(height: 28),
                Text(
                  l10n.onboardingWhatsYourName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: _white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.onboardingNameSubtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 15, color: _grey, height: 1.5),
                ),
                const SizedBox(height: 36),
                TextField(
                  controller: _controller,
                  onChanged: (v) => setState(() => _name = v.trim()),
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  style: GoogleFonts.lato(fontSize: 17, color: _white),
                  cursorColor: _gold,
                  decoration: InputDecoration(
                    hintText: l10n.onboardingNameHint,
                    hintStyle: GoogleFonts.lato(color: _grey.withValues(alpha: 0.6)),
                    filled: true,
                    fillColor: _cardBg,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: _cardBorder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: _cardBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: _gold, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                _GoldButton(
                  label: l10n.onboardingContinue,
                  onTap: _name.isNotEmpty ? () => widget.onNext(_name) : null,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: botPad + 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 3 – ISLAM MODE
// ─────────────────────────────────────────────────────────────────────────────

class _IslamModePage extends StatefulWidget {
  final void Function(bool isBeginner) onNext;
  final VoidCallback onBack;
  const _IslamModePage({required this.onNext, required this.onBack});

  @override
  State<_IslamModePage> createState() => _IslamModePageState();
}

class _IslamModePageState extends State<_IslamModePage> {
  bool? _selected; // true = beginner, false = familiar

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final botPad = MediaQuery.paddingOf(context).bottom;

    return Column(
      children: [
        SafeArea(child: _StepHeader(onBack: widget.onBack, step: 3)),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 28),
                const _IconCircle(icon: Icons.people_outline_rounded),
                const SizedBox(height: 24),
                Text(
                  l10n.onboardingAreYouNewToIslam,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _white,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.onboardingModeSubtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 14, color: _grey, height: 1.5),
                ),
                const SizedBox(height: 32),
                _ModeCard(
                  selected: _selected == true,
                  onTap: () => setState(() => _selected = true),
                  icon: Icons.nightlight_round,
                  title: l10n.onboardingNewToIslam,
                  desc: l10n.onboardingNewToIslamDesc,
                ),
                const SizedBox(height: 14),
                _ModeCard(
                  selected: _selected == false,
                  onTap: () => setState(() => _selected = false),
                  icon: Icons.menu_book_outlined,
                  title: l10n.onboardingFamiliarWithIslam,
                  desc: l10n.onboardingFamiliarWithIslamDesc,
                ),
                const SizedBox(height: 36),
                _GoldButton(
                  label: l10n.onboardingContinue,
                  onTap: _selected != null
                      ? () => widget.onNext(_selected!)
                      : null,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: botPad + 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 4 – LOCATION
// ─────────────────────────────────────────────────────────────────────────────

class _LocationPage extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const _LocationPage({required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final botPad = MediaQuery.paddingOf(context).bottom;

    return Column(
      children: [
        SafeArea(child: _StepHeader(onBack: onBack, step: 4)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _IconCircle(icon: Icons.location_on_outlined),
                const SizedBox(height: 28),
                Text(
                  l10n.onboardingLocationTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _white,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.onboardingLocationDesc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 14, color: _grey, height: 1.55),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _gold.withValues(alpha: 0.22)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.lock_outline, color: _gold, size: 16),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l10n.onboardingPrivacyBanner,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: _gold.withValues(alpha: 0.85),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                _GoldButton(label: l10n.onboardingAllowLocation, onTap: onNext),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onNext,
                  style: TextButton.styleFrom(foregroundColor: _grey),
                  child: Text(
                    l10n.onboardingSkipForNow,
                    style: GoogleFonts.lato(color: _grey, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: botPad + 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 5 – NOTIFICATION
// ─────────────────────────────────────────────────────────────────────────────

class _NotificationPage extends StatelessWidget {
  final VoidCallback onComplete;
  final VoidCallback onBack;
  const _NotificationPage({required this.onComplete, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final botPad = MediaQuery.paddingOf(context).bottom;

    return Column(
      children: [
        SafeArea(
          child: Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: _white, size: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _IconCircle(icon: Icons.notifications_outlined),
                const SizedBox(height: 28),
                Text(
                  l10n.onboardingNotificationTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _white,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.onboardingNotificationDesc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 14, color: _grey, height: 1.55),
                ),
                const SizedBox(height: 28),
                _FeatureRow(icon: Icons.volume_up_outlined, label: l10n.onboardingAdhanAlerts),
                const SizedBox(height: 10),
                _FeatureRow(icon: Icons.tune_rounded, label: l10n.onboardingCustomTiming),
                const SizedBox(height: 10),
                _FeatureRow(icon: Icons.timer_outlined, label: l10n.onboardingAdjustable),
                const SizedBox(height: 36),
                _GoldButton(
                    label: l10n.onboardingEnableNotifications, onTap: onComplete),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onComplete,
                  style: TextButton.styleFrom(foregroundColor: _grey),
                  child: Text(
                    l10n.onboardingMaybeLater,
                    style: GoogleFonts.lato(color: _grey, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: botPad + 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED COMPONENTS
// ─────────────────────────────────────────────────────────────────────────────

class _StepHeader extends StatelessWidget {
  final VoidCallback onBack;
  final int step;
  const _StepHeader({required this.onBack, required this.step});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: _white, size: 20),
        ),
        const Spacer(),
        Text(
          l10n.onboardingStepOf(step, 4),
          style: GoogleFonts.lato(color: _grey, fontSize: 14),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  const _IconCircle({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _gold.withValues(alpha: 0.10),
        border: Border.all(color: _gold.withValues(alpha: 0.28), width: 1.5),
      ),
      child: Icon(icon, color: _gold, size: 38),
    );
  }
}

class _GoldButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool showArrow;
  const _GoldButton({required this.label, required this.onTap, this.showArrow = false});

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 58,
        decoration: BoxDecoration(
          color: enabled ? _titleGold : _cardBg,
          borderRadius: BorderRadius.circular(18),
          border: enabled ? null : Border.all(color: _cardBorder),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: _titleGold.withValues(alpha: 0.32),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: enabled ? _bg : _grey,
                  letterSpacing: 0.1,
                ),
              ),
              if (showArrow && enabled) ...[
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, color: _bg, size: 19),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  const _PageDots({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPages, (i) {
        final active = i == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? _gold : _grey.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String desc;
  const _ModeCard({
    required this.selected,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: selected ? _gold.withValues(alpha: 0.09) : _cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : _cardBorder,
            width: selected ? 2.0 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.24),
                    blurRadius: 18,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            // Islamic geometric pattern background
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CustomPaint(
                  painter: GeometricPatternPainter(
                    color: _gold,
                    alpha: selected ? 0.09 : 0.05,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? _gold.withValues(alpha: 0.20)
                          : _gold.withValues(alpha: 0.09),
                      border: Border.all(
                        color: _gold.withValues(alpha: selected ? 0.55 : 0.25),
                        width: 1,
                      ),
                    ),
                    child: Icon(icon, color: _gold, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: selected ? _white : _white.withValues(alpha: 0.80),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          desc,
                          style: GoogleFonts.lato(
                              fontSize: 12, color: _grey, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    selected
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked,
                    color: selected ? _gold : _grey.withValues(alpha: 0.50),
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withValues(alpha: 0.10),
          ),
          child: Icon(icon, color: _gold, size: 17),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.lato(fontSize: 14, color: _white.withValues(alpha: 0.85)),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ISLAMIC STAR ICON — Screen 2 avatar replacement
// ─────────────────────────────────────────────────────────────────────────────

class _IslamicStarCircle extends StatelessWidget {
  const _IslamicStarCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _gold.withValues(alpha: 0.10),
        border: Border.all(color: _gold.withValues(alpha: 0.40), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.18),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const CustomPaint(painter: _IslamicStarPainter()),
    );
  }
}

class _IslamicStarPainter extends CustomPainter {
  const _IslamicStarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outerR = size.width * 0.30;
    final innerR = outerR * 0.48;
    const points = 8;

    final path = Path();
    for (int i = 0; i < points * 2; i++) {
      final angle = (i * math.pi / points) - math.pi / 2;
      final r = i.isEven ? outerR : innerR;
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Subtle outer glow
    canvas.drawPath(
      path,
      Paint()
        ..color = _gold.withValues(alpha: 0.18)
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
    // Solid gold star
    canvas.drawPath(
      path,
      Paint()
        ..color = _gold
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(_IslamicStarPainter _) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS  (arch shape is assets/arch.svg — see SvgPicture in build())
// ─────────────────────────────────────────────────────────────────────────────

class _StarsPainter extends CustomPainter {
  final double twinkle;
  const _StarsPainter({required this.twinkle});

  // [x, y, radius] — stars in the night sky around the mosque silhouette
  static const List<List<double>> _positions = [
    [0.08, 0.06, 2.0], // upper left sky
    [0.92, 0.05, 2.0], // upper right sky
    [0.22, 0.03, 2.5], // top left
    [0.78, 0.04, 2.5], // top right
    [0.50, 0.02, 2.0], // top center, above mosque peak
    [0.04, 0.24, 1.8], // far left sky
    [0.96, 0.22, 1.8], // far right sky
    [0.14, 0.13, 2.0], // mid-left sky
    [0.86, 0.11, 2.0], // mid-right sky
    [0.36, 0.07, 1.5], // above mosque, left of center
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < _positions.length; i++) {
      final phase = ((i * 0.37) + twinkle) % 1.0;
      final alpha = 0.50 + 0.14 * math.sin(phase * math.pi); // stays near 0.6
      canvas.drawCircle(
        Offset(size.width * _positions[i][0], size.height * _positions[i][1]),
        _positions[i][2],
        Paint()
          ..color = const Color(0xFFF8F8F8).withValues(alpha: alpha)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(_StarsPainter old) => old.twinkle != twinkle;
}

// ─────────────────────────────────────────────────────────────────────────────
// Mosque silhouette — gold outline only, 2px stroke, #C9A84C, no fill
// ─────────────────────────────────────────────────────────────────────────────

class _MasjidPainter extends CustomPainter {
  const _MasjidPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final mid = w / 2;

    // Mosque spans 80% of canvas width, centered
    final mW     = w * 0.80;
    final mLeft  = w * 0.10;
    final mRight = w * 0.90;
    final baseY  = h * 0.90;

    // ── Vertical reference points ─────────────────────────────────────────────
    final structTopY       = baseY  - mW * 0.180; // top of side walls
    final drumTopY         = structTopY - mW * 0.048; // drum below main dome
    final domePeakY        = drumTopY   - mW * 0.338; // tip of main dome
    final sideMinTopY      = structTopY - mW * 0.295; // top of side minarets
    final centerMinCapBase = domePeakY  - mW * 0.120; // base of center min cap
    final centerMinTopY    = domePeakY  - mW * 0.162; // tip of center minaret

    // ── Horizontal widths ─────────────────────────────────────────────────────
    final drumHalfW      = mW * 0.170;
    final domeBulgeHalfW = mW * 0.185; // widest point of onion dome
    final domeBulgeY     = drumTopY - mW * 0.095;
    final domeNeckHalfW  = mW * 0.080; // narrowest waist
    final domeNeckY      = drumTopY - mW * 0.215;
    final leftDomeCx     = mid - mW * 0.300;
    final rightDomeCx    = mid + mW * 0.300;
    final sideDomeHalfW  = mW * 0.090;
    final sideDomePeakY  = structTopY - mW * 0.120;
    final sideDomeNeckW  = mW * 0.040;
    final sideDomeNeckY  = structTopY - mW * 0.070;
    final sideMinHalfW   = mW * 0.022;
    final leftMinCx      = mLeft + mW * 0.050;
    final rightMinCx     = mRight - mW * 0.050;
    final sideMinCapH    = mW * 0.042;
    final centerMinHalfW = mW * 0.024;
    final doorHalfW      = mW * 0.055;
    final doorTopY       = baseY - mW * 0.148;
    final doorPeakY      = doorTopY - mW * 0.058;

    // ── Subtle gold glow behind the whole mosque ──────────────────────────────
    final glowCenter = Offset(mid, (structTopY + baseY) / 2);
    final glowRect   = Rect.fromCenter(
        center: glowCenter, width: mW * 1.10, height: mW * 0.75);
    canvas.drawOval(
      glowRect,
      Paint()
        ..shader = RadialGradient(
          colors: [
            _gold.withValues(alpha: 0.09),
            _gold.withValues(alpha: 0.0),
          ],
        ).createShader(glowRect),
    );

    // ── Stroke paint ──────────────────────────────────────────────────────────
    final s = Paint()
      ..color = _gold.withValues(alpha: 0.92)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // ── Side minarets (drawn before walls so bases are covered) ───────────────
    for (final cx in [leftMinCx, rightMinCx]) {
      final capBaseY = sideMinTopY + sideMinCapH;
      // Minaret body sides
      canvas.drawLine(Offset(cx - sideMinHalfW, baseY),
          Offset(cx - sideMinHalfW, capBaseY), s);
      canvas.drawLine(Offset(cx + sideMinHalfW, baseY),
          Offset(cx + sideMinHalfW, capBaseY), s);
      // Pointed spire cap
      canvas.drawPath(
        Path()
          ..moveTo(cx - sideMinHalfW, capBaseY)
          ..lineTo(cx, sideMinTopY)
          ..lineTo(cx + sideMinHalfW, capBaseY),
        s,
      );
      // Decorative band on body
      final bandY = capBaseY + mW * 0.048;
      canvas.drawLine(
          Offset(cx - sideMinHalfW, bandY), Offset(cx + sideMinHalfW, bandY), s);
      // Crescent at tip
      _drawCrescent(canvas, Offset(cx, sideMinTopY - mW * 0.018), mW * 0.020);
    }

    // ── Main body walls ───────────────────────────────────────────────────────
    // Left wall + roof to left dome
    canvas.drawPath(
      Path()
        ..moveTo(mLeft, baseY)
        ..lineTo(mLeft, structTopY)
        ..lineTo(leftDomeCx - sideDomeHalfW, structTopY),
      s,
    );
    // Roof segment: left dome right edge → drum left edge
    canvas.drawLine(Offset(leftDomeCx + sideDomeHalfW, structTopY),
        Offset(mid - drumHalfW, structTopY), s);
    // Roof segment: drum right edge → right dome left edge
    canvas.drawLine(Offset(mid + drumHalfW, structTopY),
        Offset(rightDomeCx - sideDomeHalfW, structTopY), s);
    // Right wall + roof from right dome
    canvas.drawPath(
      Path()
        ..moveTo(rightDomeCx + sideDomeHalfW, structTopY)
        ..lineTo(mRight, structTopY)
        ..lineTo(mRight, baseY),
      s,
    );

    // ── Drum (vertical sides, rising from roof to dome base) ──────────────────
    canvas.drawLine(Offset(mid - drumHalfW, structTopY),
        Offset(mid - drumHalfW, drumTopY), s);
    canvas.drawLine(Offset(mid + drumHalfW, structTopY),
        Offset(mid + drumHalfW, drumTopY), s);

    // ── Side domes (small onion domes on the roof) ────────────────────────────
    for (final cx in [leftDomeCx, rightDomeCx]) {
      canvas.drawPath(
        Path()
          ..moveTo(cx - sideDomeHalfW, structTopY)
          ..cubicTo(cx - sideDomeHalfW, structTopY - mW * 0.030,
              cx - sideDomeNeckW, sideDomeNeckY - mW * 0.005,
              cx - sideDomeNeckW, sideDomeNeckY)
          ..cubicTo(cx - sideDomeNeckW, sideDomeNeckY - mW * 0.025,
              cx - mW * 0.010, sideDomePeakY + mW * 0.012,
              cx, sideDomePeakY)
          ..cubicTo(cx + mW * 0.010, sideDomePeakY + mW * 0.012,
              cx + sideDomeNeckW, sideDomeNeckY - mW * 0.025,
              cx + sideDomeNeckW, sideDomeNeckY)
          ..cubicTo(cx + sideDomeNeckW, sideDomeNeckY - mW * 0.005,
              cx + sideDomeHalfW, structTopY - mW * 0.030,
              cx + sideDomeHalfW, structTopY),
        s,
      );
    }

    // ── Main dome: classic onion shape ────────────────────────────────────────
    canvas.drawPath(
      Path()
        ..moveTo(mid - drumHalfW, drumTopY)
        // Left side: drum edge → belly (flares out)
        ..cubicTo(
          mid - domeBulgeHalfW, drumTopY - mW * 0.040,
          mid - domeBulgeHalfW, domeBulgeY + mW * 0.018,
          mid - domeBulgeHalfW, domeBulgeY,
        )
        // Left: belly → neck (narrows inward)
        ..cubicTo(
          mid - domeBulgeHalfW, domeBulgeY - mW * 0.050,
          mid - domeNeckHalfW,  domeNeckY  + mW * 0.018,
          mid - domeNeckHalfW,  domeNeckY,
        )
        // Left: neck → peak
        ..cubicTo(
          mid - domeNeckHalfW, domeNeckY  - mW * 0.045,
          mid - mW * 0.020,    domePeakY  + mW * 0.038,
          mid,                 domePeakY,
        )
        // Right: peak → neck
        ..cubicTo(
          mid + mW * 0.020,   domePeakY  + mW * 0.038,
          mid + domeNeckHalfW, domeNeckY - mW * 0.045,
          mid + domeNeckHalfW, domeNeckY,
        )
        // Right: neck → belly
        ..cubicTo(
          mid + domeNeckHalfW,  domeNeckY  + mW * 0.018,
          mid + domeBulgeHalfW, domeBulgeY - mW * 0.050,
          mid + domeBulgeHalfW, domeBulgeY,
        )
        // Right: belly → drum edge
        ..cubicTo(
          mid + domeBulgeHalfW, domeBulgeY + mW * 0.018,
          mid + domeBulgeHalfW, drumTopY   - mW * 0.040,
          mid + drumHalfW,      drumTopY,
        ),
      s,
    );

    // ── Center minaret (tallest, rises above dome peak) ───────────────────────
    canvas.drawPath(
      Path()
        ..moveTo(mid - centerMinHalfW, domePeakY)
        ..lineTo(mid - centerMinHalfW, centerMinCapBase)
        ..lineTo(mid, centerMinTopY)
        ..lineTo(mid + centerMinHalfW, centerMinCapBase)
        ..lineTo(mid + centerMinHalfW, domePeakY),
      s,
    );
    // Decorative band on center minaret body
    canvas.drawLine(
      Offset(mid - centerMinHalfW, centerMinCapBase + mW * 0.038),
      Offset(mid + centerMinHalfW, centerMinCapBase + mW * 0.038),
      s,
    );
    // Crescent at tip
    _drawCrescent(canvas, Offset(mid, centerMinTopY - mW * 0.015), mW * 0.018);

    // ── Base line ─────────────────────────────────────────────────────────────
    canvas.drawLine(Offset(mLeft, baseY), Offset(mRight, baseY), s);

    // ── Arched entrance door ──────────────────────────────────────────────────
    canvas.drawPath(
      Path()
        ..moveTo(mid - doorHalfW, baseY)
        ..lineTo(mid - doorHalfW, doorTopY)
        ..cubicTo(
          mid - doorHalfW, doorTopY - mW * 0.028,
          mid - mW * 0.012, doorPeakY + mW * 0.010,
          mid, doorPeakY,
        )
        ..cubicTo(
          mid + mW * 0.012, doorPeakY + mW * 0.010,
          mid + doorHalfW, doorTopY - mW * 0.028,
          mid + doorHalfW, doorTopY,
        )
        ..lineTo(mid + doorHalfW, baseY),
      s,
    );
  }

  // Small filled crescent at each minaret tip
  void _drawCrescent(Canvas canvas, Offset center, double r) {
    final outer = Path()
      ..addOval(Rect.fromCircle(center: center, radius: r));
    final inner = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(center.dx + r * 0.30, center.dy),
        radius: r * 0.76,
      ));
    canvas.drawPath(
      Path.combine(PathOperation.difference, outer, inner),
      Paint()
        ..color = _gold
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(_MasjidPainter _) => false;
}
