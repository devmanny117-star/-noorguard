import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import 'beginner_home_screen.dart';
import 'home_screen.dart';

// Always dark — onboarding never inherits the system theme.
const _bg = Color(0xFF0D1B2A);
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
    final archSize = size.width * 0.76;

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: topPad + 16),
            // ── arch + animations (55% of screen) ──────────────────────────
            SizedBox(
              height: size.height * 0.52,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Subtle radial glow behind arch
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: const Alignment(0, -0.1),
                          radius: 0.75,
                          colors: [
                            _gold.withValues(alpha: 0.07),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Arch outline
                  CustomPaint(
                    size: Size(archSize, archSize),
                    painter: _IslamicArchPainter(),
                  ),
                  // Twinkling stars
                  AnimatedBuilder(
                    animation: _twinkleCtrl,
                    builder: (_, __) => CustomPaint(
                      size: Size(archSize, archSize),
                      painter: _StarsPainter(twinkle: _twinkleCtrl.value),
                    ),
                  ),
                  // Floating crescent
                  AnimatedBuilder(
                    animation: _floatAnim,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, _floatAnim.value),
                      child: SizedBox(
                        width: archSize * 0.30,
                        height: archSize * 0.30,
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
                      l10n.onboardingWelcomeTo.toUpperCase(),
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: _gold,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Noor Guard',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: _white,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      l10n.onboardingSubtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: _grey,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const _PageDots(currentPage: 0, totalPages: 3),
                    const SizedBox(height: 28),
                    _GoldButton(
                      label: l10n.onboardingLetsGetStarted,
                      onTap: widget.onNext,
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
  const _GoldButton({required this.label, required this.onTap});

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
          child: Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: enabled ? _bg : _grey,
              letterSpacing: 0.3,
            ),
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
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint()
      ..color = _gold.withValues(alpha: 0.52)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final left = w * 0.18;
    final right = w * 0.82;
    final base = h * 0.92;
    final shoulder = h * 0.54;
    final peak = h * 0.07;
    final midX = w / 2;
    final spanH = shoulder - peak;

    // Pointed Islamic arch — two cubic beziers meeting at the peak
    final path = Path()
      ..moveTo(left, base)
      ..lineTo(left, shoulder)
      ..cubicTo(
        left, shoulder - spanH * 0.55,
        midX - (midX - left) * 0.35, peak + spanH * 0.15,
        midX, peak,
      )
      ..cubicTo(
        midX + (right - midX) * 0.35, peak + spanH * 0.15,
        right, shoulder - spanH * 0.55,
        right, shoulder,
      )
      ..lineTo(right, base)
      ..lineTo(left, base);

    canvas.drawPath(path, paint);

    // Decorative small diamond at the arch peak
    final diamondPaint = Paint()
      ..color = _gold.withValues(alpha: 0.70)
      ..style = PaintingStyle.fill;
    const ds = 4.0;
    final diamondPath = Path()
      ..moveTo(midX, peak - ds)
      ..lineTo(midX + ds, peak)
      ..lineTo(midX, peak + ds)
      ..lineTo(midX - ds, peak)
      ..close();
    canvas.drawPath(diamondPath, diamondPaint);

    // Thin horizontal springing line at shoulder level
    final springPaint = Paint()
      ..color = _gold.withValues(alpha: 0.22)
      ..strokeWidth = 0.8;
    canvas.drawLine(Offset(left, shoulder), Offset(right, shoulder), springPaint);
  }

  @override
  bool shouldRepaint(_IslamicArchPainter _) => false;
}

class _StarsPainter extends CustomPainter {
  final double twinkle;
  const _StarsPainter({required this.twinkle});

  static const List<List<double>> _positions = [
    [0.12, 0.18], [0.88, 0.22], [0.08, 0.60],
    [0.92, 0.50], [0.50, 0.04], [0.28, 0.09],
    [0.72, 0.10],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < _positions.length; i++) {
      final phase = ((i * 0.41) + twinkle) % 1.0;
      final alpha = 0.25 + 0.55 * math.sin(phase * math.pi);
      canvas.drawCircle(
        Offset(size.width * _positions[i][0], size.height * _positions[i][1]),
        1.8,
        Paint()
          ..color = _gold.withValues(alpha: alpha)
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
