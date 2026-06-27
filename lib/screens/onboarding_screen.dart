import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import 'beginner_home_screen.dart';
import 'home_screen.dart';

// Always dark — onboarding never inherits the system theme.
const _bg = Color(0xFF081321);
const _bgGradCenter = Color(0xFF0D1827);
const _bgGradEdge = Color(0xFF060E1C);
const _titleGold = Color(0xFFD4AF37);
const _gold = Color(0xFFC9A84C);
const _mutedGold = Color(0xFFA08532);
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
  late final AnimationController _floatCtrl;
  late final AnimationController _twinkleCtrl;
  late final Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _floatCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
    _floatAnim = Tween<double>(begin: -7.0, end: 7.0).animate(
      CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut),
    );
    _twinkleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatCtrl.dispose();
    _twinkleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);
    final topPad = MediaQuery.paddingOf(context).top;
    final botPad = MediaQuery.paddingOf(context).bottom;
    final archW = size.width * 0.92;
    final archH = size.height * 0.53;

    return Stack(
      children: [
        // Full-screen radial gradient background
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.7),
                radius: 1.3,
                colors: [_bgGradCenter, _bgGradEdge],
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: topPad + 16),
            // ── arch + animations (58% of screen) ──────────────────────────
            SizedBox(
              height: size.height * 0.58,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Arch with gradient fill + ornate Mughal outline
                  CustomPaint(
                    size: Size(archW, archH),
                    painter: const _IslamicArchPainter(),
                  ),
                  // Twinkling stars inside the arch
                  AnimatedBuilder(
                    animation: _twinkleCtrl,
                    builder: (_, __) => CustomPaint(
                      size: Size(archW, archH),
                      painter: _StarsPainter(twinkle: _twinkleCtrl.value),
                    ),
                  ),
                  // Gold glow behind moon (animated with float)
                  AnimatedBuilder(
                    animation: _floatAnim,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, -archH * 0.06 + _floatAnim.value),
                      child: Container(
                        width: archW * 0.30,
                        height: archW * 0.30,
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
                  ),
                  // Floating crescent (30% smaller, center-lower)
                  AnimatedBuilder(
                    animation: _floatAnim,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, -archH * 0.06 + _floatAnim.value),
                      child: SizedBox(
                        width: archW * 0.18,
                        height: archW * 0.18,
                        child: const CustomPaint(painter: _CrescentPainter()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ── bottom text block ───────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.onboardingWelcomeTo,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: _white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Noor',
                            style: GoogleFonts.inter(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: _white,
                              height: 1.1,
                            ),
                          ),
                          TextSpan(
                            text: ' Guard',
                            style: GoogleFonts.inter(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: _titleGold,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.onboardingSubtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: _grey,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const _PageDots(currentPage: 0, totalPages: 3),
                    const SizedBox(height: 24),
                    _GoldButton(
                      label: l10n.onboardingLetsGetStarted,
                      onTap: widget.onNext,
                      showArrow: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: botPad + 16),
          ],
        ),
        // Skip button
        Positioned(
          top: topPad + 8,
          right: 16,
          child: TextButton(
            onPressed: widget.onSkip,
            style: TextButton.styleFrom(
              foregroundColor: _grey,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Text(
              l10n.onboardingSkip,
              style: GoogleFonts.lato(fontSize: 15, color: _grey),
            ),
          ),
        ),
      ],
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
                const _IconCircle(icon: Icons.person_outline_rounded),
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
        height: 56,
        decoration: BoxDecoration(
          gradient: enabled
              ? const LinearGradient(
                  colors: [Color(0xFFD4A832), _mutedGold],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: enabled ? null : _cardBg,
          borderRadius: BorderRadius.circular(14),
          border: enabled ? null : Border.all(color: _cardBorder),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.28),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  )
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: enabled ? _bg : _grey,
                  letterSpacing: 0.3,
                ),
              ),
              if (showArrow && enabled) ...[
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded,
                    color: _bg, size: 18),
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
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected ? _gold.withValues(alpha: 0.07) : _cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : _cardBorder,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? _gold.withValues(alpha: 0.14)
                    : _cardBorder,
              ),
              child: Icon(icon,
                  color: selected ? _gold : _grey, size: 22),
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
                    style: GoogleFonts.lato(fontSize: 12, color: _grey, height: 1.4),
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
// PAINTERS
// ─────────────────────────────────────────────────────────────────────────────

class _IslamicArchPainter extends CustomPainter {
  const _IslamicArchPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final mid = w / 2;

    // Pillar positions
    final left = w * 0.10;
    final right = w * 0.90;
    final base = h * 0.96;
    final shoulder = h * 0.65;

    // Three-cusp Mughal ogee arch points
    final lCuspX = w * 0.23;  final lCuspY = h * 0.43;
    final lDipX  = w * 0.37;  final lDipY  = h * 0.27;
    final peakY  = h * 0.05;
    final rDipX  = w * 0.63;  final rDipY  = h * 0.27;
    final rCuspX = w * 0.77;  final rCuspY = h * 0.43;

    final archPath = Path()
      ..moveTo(left, base)
      ..lineTo(left, shoulder)
      // Left pillar → left cusp (gentle outward curve)
      ..cubicTo(left,      h * 0.56,
                w * 0.16, lCuspY,
                lCuspX,   lCuspY)
      // Left cusp → left dip (concave inward)
      ..cubicTo(w * 0.30, h * 0.41,
                w * 0.34, lDipY + h * 0.02,
                lDipX,    lDipY)
      // Left dip → center peak (main arch rise)
      ..cubicTo(w * 0.40, h * 0.13,
                w * 0.45, peakY + h * 0.04,
                mid,      peakY)
      // Center peak → right dip (mirror)
      ..cubicTo(w * 0.55, peakY + h * 0.04,
                w * 0.60, h * 0.13,
                rDipX,    rDipY)
      // Right dip → right cusp
      ..cubicTo(w * 0.66, rDipY + h * 0.02,
                w * 0.70, h * 0.41,
                rCuspX,   rCuspY)
      // Right cusp → right pillar
      ..cubicTo(w * 0.84, rCuspY,
                right,    h * 0.56,
                right,    shoulder)
      ..lineTo(right, base)
      ..lineTo(left, base);

    // 1. Dark radial gradient fill inside arch
    canvas.save();
    canvas.clipPath(archPath);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..shader = const RadialGradient(
          center: Alignment(0, -0.2),
          radius: 0.75,
          colors: [Color(0x35101E31), Color(0x88060E1C)],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );
    canvas.restore();

    // 2. Gold outline stroke
    canvas.drawPath(
      archPath,
      Paint()
        ..color = _gold.withValues(alpha: 0.58)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // 3. Diamond at center peak
    const ds = 4.0;
    canvas.drawPath(
      Path()
        ..moveTo(mid, peakY - ds)
        ..lineTo(mid + ds, peakY)
        ..lineTo(mid, peakY + ds)
        ..lineTo(mid - ds, peakY)
        ..close(),
      Paint()
        ..color = _gold.withValues(alpha: 0.85)
        ..style = PaintingStyle.fill,
    );

    // 4. Small diamonds at cusp tips
    const cs = 2.8;
    for (final (cx, cy) in [(lCuspX, lCuspY), (rCuspX, rCuspY)]) {
      canvas.drawPath(
        Path()
          ..moveTo(cx, cy - cs)
          ..lineTo(cx + cs, cy)
          ..lineTo(cx, cy + cs)
          ..lineTo(cx - cs, cy)
          ..close(),
        Paint()
          ..color = _gold.withValues(alpha: 0.55)
          ..style = PaintingStyle.fill,
      );
    }

    // 5. Shoulder springing line
    canvas.drawLine(
      Offset(left, shoulder),
      Offset(right, shoulder),
      Paint()
        ..color = _gold.withValues(alpha: 0.20)
        ..strokeWidth = 0.8,
    );
  }

  @override
  bool shouldRepaint(_IslamicArchPainter _) => false;
}

class _StarsPainter extends CustomPainter {
  final double twinkle;
  const _StarsPainter({required this.twinkle});

  // [x, y, radius] — all inside arch bounds, avoiding the crescent center
  static const List<List<double>> _positions = [
    [0.34, 0.22, 2.5], [0.66, 0.24, 2.0], [0.27, 0.44, 3.5],
    [0.73, 0.42, 3.0], [0.50, 0.15, 4.0], [0.40, 0.62, 2.0],
    [0.60, 0.63, 2.5], [0.50, 0.78, 3.0], [0.37, 0.32, 2.0],
    [0.63, 0.33, 2.5], [0.44, 0.52, 3.5], [0.56, 0.53, 2.0],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < _positions.length; i++) {
      final phase = ((i * 0.41) + twinkle) % 1.0;
      final alpha = 0.45 + 0.35 * math.sin(phase * math.pi);
      canvas.drawCircle(
        Offset(size.width * _positions[i][0], size.height * _positions[i][1]),
        _positions[i][2],
        Paint()
          ..color = _white.withValues(alpha: alpha)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(_StarsPainter old) => old.twinkle != twinkle;
}

class _CrescentPainter extends CustomPainter {
  const _CrescentPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.40;

    // Glow
    canvas.drawCircle(
      Offset(cx, cy),
      r * 1.3,
      Paint()
        ..color = _gold.withValues(alpha: 0.10)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14),
    );

    // Crescent: clip to outer circle, fill gold, cut inner circle offset right
    final clip = Path()
      ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    canvas.save();
    canvas.clipPath(clip);
    canvas.drawCircle(Offset(cx, cy), r,
        Paint()..color = _gold..style = PaintingStyle.fill);
    canvas.drawCircle(
      Offset(cx + r * 0.30, cy - r * 0.04),
      r * 0.80,
      Paint()..color = _bg..style = PaintingStyle.fill,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CrescentPainter _) => false;
}
