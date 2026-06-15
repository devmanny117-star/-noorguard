import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../locale_controller.dart';
import 'home_screen.dart';

// Fixed onboarding palette — always dark regardless of system theme
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
  int _currentPage = 0;
  String _selectedLanguage = 'English';

  static const _localeCodeMap = {
    'English': 'en',
    'Arabic': 'ar',
    'Urdu': 'ur',
    'Spanish': 'es',
    'German': 'de',
    'Dutch': 'nl',
    'Portuguese': 'pt',
    'Italian': 'it',
    'French': 'fr',
    'Indonesian': 'id',
    'Chinese': 'zh',
    'Japanese': 'ja',
    'Bengali': 'bn',
    'Turkish': 'tr',
    'Swahili': 'sw',
  };

  Future<void> _onLanguageSelected(String lang) async {
    setState(() => _selectedLanguage = lang);
    final code = _localeCodeMap[lang] ?? 'en';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_locale', code);
    if (mounted) {
      LocaleScope.of(context).onLocaleChange(Locale(code));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _goToHome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // Full-screen Islamic geometric pattern (always below everything)
          Positioned.fill(
            child: CustomPaint(painter: _GeometricPatternPainter()),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    // Prevent swipe-back from completion screen
                    physics: _currentPage == 3
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    children: [
                      _WelcomePage(
                        selectedLanguage: _selectedLanguage,
                        onLanguageSelected: _onLanguageSelected,
                        onNext: _nextPage,
                      ),
                      _LocationPage(onNext: _nextPage),
                      _NotificationPage(onNext: _nextPage),
                      _ReadyPage(onEnter: _goToHome),
                    ],
                  ),
                ),
                // Progress dots
                _PageDots(current: _currentPage, total: 4),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 1 — WELCOME & LANGUAGE
// ─────────────────────────────────────────────────────────────────────────────

class _WelcomePage extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;
  final VoidCallback onNext;

  static const _languages = [
    ('English', 'English', false),
    ('العربية', 'Arabic', true),
    ('اردو', 'Urdu', true),
    ('Español', 'Spanish', false),
    ('Deutsch', 'German', false),
    ('Nederlands', 'Dutch', false),
    ('Português', 'Portuguese', false),
    ('Italiano', 'Italian', false),
    ('Français', 'French', false),
    ('Bahasa Indonesia', 'Indonesian', false),
    ('中文', 'Chinese', false),
    ('日本語', 'Japanese', false),
    ('বাংলা', 'Bengali', false),
    ('Türkçe', 'Turkish', false),
    ('Kiswahili', 'Swahili', false),
  ];

  const _WelcomePage({
    required this.selectedLanguage,
    required this.onLanguageSelected,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const SizedBox(height: 28),

          // Logo — crescent + star in layered gold rings (matches "All Set" screen)
          const _CrescentLogo(),

          const SizedBox(height: 28),

          // App name
          Text(
            l10n.appName,
            style: GoogleFonts.playfairDisplay(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: _white,
              letterSpacing: 0.5,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 6),

          // Arabic / Urdu transliteration
          Text(
            'نور گارڈ',
            style: GoogleFonts.scheherazadeNew(
              fontSize: 24,
              color: _gold,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            l10n.onboardingTagline,
            style: GoogleFonts.lato(
              fontSize: 14.5,
              fontStyle: FontStyle.italic,
              color: _white.withValues(alpha: 0.55),
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 36),

          // Thin gold divider
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 0.6, color: _gold.withValues(alpha: 0.25)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  l10n.onboardingChooseLanguage,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _grey,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    height: 0.6, color: _gold.withValues(alpha: 0.25)),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Language grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.6,
            children: _languages.map((lang) {
              final (label, id, isRtl) = lang;
              return _LangCard(
                label: label,
                identifier: id,
                isSelected: selectedLanguage == id,
                onTap: () => onLanguageSelected(id),
                isRtl: isRtl,
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          _GoldButton(label: l10n.onboardingGetStarted, onTap: onNext),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

class _LangCard extends StatelessWidget {
  final String label;
  final String identifier;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isRtl;

  const _LangCard({
    required this.label,
    required this.identifier,
    required this.isSelected,
    required this.onTap,
    this.isRtl = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? _gold.withValues(alpha: 0.12) : _cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? _gold : _cardBorder,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gold dot when selected
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 6 : 0,
              height: isSelected ? 6 : 0,
              margin: EdgeInsets.only(right: isSelected ? 7 : 0),
              decoration: const BoxDecoration(
                color: _gold,
                shape: BoxShape.circle,
              ),
            ),
            Flexible(
              child: Text(
                label,
                style: isRtl
                    ? GoogleFonts.scheherazadeNew(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? _gold : _white,
                      )
                    : GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? _gold : _white,
                      ),
                overflow: TextOverflow.ellipsis,
                textAlign: isRtl ? TextAlign.right : TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 2 — LOCATION PERMISSION
// ─────────────────────────────────────────────────────────────────────────────

class _LocationPage extends StatelessWidget {
  final VoidCallback onNext;
  const _LocationPage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const Spacer(flex: 2),

          // Location pin with layered glow rings
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 136,
                height: 136,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _gold.withValues(alpha: 0.05),
                ),
              ),
              Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _gold.withValues(alpha: 0.09),
                ),
              ),
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _gold.withValues(alpha: 0.14),
                  border: Border.all(
                    color: _gold.withValues(alpha: 0.30),
                    width: 1,
                  ),
                ),
              ),
              const Icon(Icons.location_on_rounded, size: 42, color: _gold),
            ],
          ),

          const SizedBox(height: 36),

          Text(
            l10n.onboardingLocationTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: _white,
              height: 1.15,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            l10n.onboardingLocationDesc,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: _white.withValues(alpha: 0.62),
              height: 1.70,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Privacy promise banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _gold.withValues(alpha: 0.22),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.shield_rounded, size: 17, color: _gold),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.onboardingPrivacyBanner,
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      color: _gold,
                      fontWeight: FontWeight.w600,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(flex: 3),

          _GoldButton(label: l10n.onboardingAllowLocation, onTap: onNext),

          const SizedBox(height: 18),

          GestureDetector(
            onTap: onNext,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                l10n.onboardingSkipForNow,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: _grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 3 — NOTIFICATION PERMISSION
// ─────────────────────────────────────────────────────────────────────────────

class _NotificationPage extends StatelessWidget {
  final VoidCallback onNext;
  const _NotificationPage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          const Spacer(flex: 2),

          // Animated pulsing bell
          const _PulsingBell(),

          const SizedBox(height: 36),

          Text(
            l10n.onboardingNotificationTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: _white,
              height: 1.15,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            l10n.onboardingNotificationDesc,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: _white.withValues(alpha: 0.62),
              height: 1.70,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Feature chips
          Row(
            children: [
              _FeatureChip(
                icon: Icons.mosque_rounded,
                label: l10n.onboardingAdhanAlerts,
              ),
              const SizedBox(width: 10),
              _FeatureChip(
                icon: Icons.timer_rounded,
                label: l10n.onboardingCustomTiming,
              ),
              const SizedBox(width: 10),
              _FeatureChip(
                icon: Icons.tune_rounded,
                label: l10n.onboardingAdjustable,
              ),
            ],
          ),

          const Spacer(flex: 3),

          _GoldButton(label: l10n.onboardingEnableNotifications, onTap: onNext),

          const SizedBox(height: 18),

          GestureDetector(
            onTap: onNext,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                l10n.onboardingMaybeLater,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: _grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _PulsingBell extends StatefulWidget {
  const _PulsingBell();

  @override
  State<_PulsingBell> createState() => _PulsingBellState();
}

class _PulsingBellState extends State<_PulsingBell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _pulse = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, __) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outermost expanding ring
            Container(
              width: 130 + _pulse.value * 16,
              height: 130 + _pulse.value * 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _gold.withValues(alpha: 0.03 + _pulse.value * 0.025),
              ),
            ),
            Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _gold.withValues(alpha: 0.08),
              ),
            ),
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _gold.withValues(alpha: 0.14),
                border: Border.all(
                  color: _gold.withValues(alpha: 0.28),
                  width: 1,
                ),
              ),
            ),
            // Bell wobble — slight rotation tick
            Transform.rotate(
              angle: math.sin(_ctrl.value * math.pi * 2) * 0.12,
              child: const Icon(
                Icons.notifications_rounded,
                size: 44,
                color: _gold,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _cardBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: _gold),
            const SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 10.5,
                color: _white.withValues(alpha: 0.65),
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 4 — ALL SET
// ─────────────────────────────────────────────────────────────────────────────

class _ReadyPage extends StatefulWidget {
  final VoidCallback onEnter;
  const _ReadyPage({required this.onEnter});

  @override
  State<_ReadyPage> createState() => _ReadyPageState();
}

class _ReadyPageState extends State<_ReadyPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeIn;
  late final Animation<double> _slideUp;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slideUp = Tween(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
    // Slight delay so you see the page land before elements animate in
    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) => Opacity(
        opacity: _fadeIn.value,
        child: Transform.translate(
          offset: Offset(0, _slideUp.value),
          child: child,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Crescent in gold ring with checkmark overlay
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _gold.withValues(alpha: 0.07),
                  ),
                ),
                Container(
                  width: 112,
                  height: 112,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _gold.withValues(alpha: 0.11),
                    border: Border.all(
                      color: _gold.withValues(alpha: 0.30),
                      width: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 74,
                  height: 74,
                  child: CustomPaint(painter: _CrescentPainter()),
                ),
                // Small checkmark badge
                Positioned(
                  bottom: 14,
                  right: 14,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B5E20),
                      shape: BoxShape.circle,
                      border: Border.all(color: _bg, width: 2),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              l10n.onboardingAllSetTitle,
              style: GoogleFonts.playfairDisplay(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: _white,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              l10n.onboardingAllSetDesc,
              style: GoogleFonts.lato(
                fontSize: 14.5,
                color: _white.withValues(alpha: 0.58),
                height: 1.65,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Feature summary cards
            _SummaryTile(
              icon: Icons.access_time_rounded,
              label: l10n.onboardingPrayerTimesLabel,
              desc: l10n.onboardingPrayerTimesDesc,
            ),
            const SizedBox(height: 10),
            _SummaryTile(
              icon: Icons.lock_outline_rounded,
              label: l10n.onboardingLockScreenLabel,
              desc: l10n.onboardingLockScreenDesc,
            ),
            const SizedBox(height: 10),
            _SummaryTile(
              icon: Icons.security_rounded,
              label: l10n.onboardingPrayerGuardLabel,
              desc: l10n.onboardingPrayerGuardDesc,
            ),

            const Spacer(flex: 3),

            _GoldButton(label: l10n.onboardingEnterApp, onTap: widget.onEnter),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String desc;

  const _SummaryTile({
    required this.icon,
    required this.label,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 20, color: _gold),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.lato(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: _white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: GoogleFonts.lato(
                    fontSize: 11.5,
                    color: _grey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle_rounded, size: 18, color: _gold),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED COMPONENTS
// ─────────────────────────────────────────────────────────────────────────────

class _GoldButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _GoldButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFD9B45A), _gold, _mutedGold],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: _gold.withValues(alpha: 0.38),
              blurRadius: 22,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: _bg,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  final int current;
  final int total;

  const _PageDots({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 26.0 : 8.0,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? _gold : _gold.withValues(alpha: 0.28),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WELCOME SCREEN — CRESCENT LOGO
// ─────────────────────────────────────────────────────────────────────────────

class _CrescentLogo extends StatelessWidget {
  const _CrescentLogo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withValues(alpha: 0.07),
          ),
        ),
        Container(
          width: 112,
          height: 112,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withValues(alpha: 0.11),
            border: Border.all(
              color: _gold.withValues(alpha: 0.30),
              width: 1.5,
            ),
          ),
        ),
        const SizedBox(
          width: 74,
          height: 74,
          child: CustomPaint(painter: _CrescentPainter()),
        ),
      ],
    );
  }
}

class _CrescentPainter extends CustomPainter {
  const _CrescentPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.40;

    final paint = Paint()
      ..color = _gold
      ..style = PaintingStyle.fill;

    // Crescent: outer circle minus offset inner circle
    final outer = Path()
      ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    final inner = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(cx + r * 0.34, cy - r * 0.08),
        radius: r * 0.78,
      ));
    final crescent = Path.combine(PathOperation.difference, outer, inner);

    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(-math.pi / 9);
    canvas.translate(-cx, -cy);
    canvas.drawPath(crescent, paint);
    canvas.restore();

    // 5-pointed star
    _drawStar(canvas, paint, Offset(cx + r * 0.72, cy - r * 0.60), r * 0.20);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final outer = i * 2 * math.pi / 5 - math.pi / 2;
      final inner = outer + math.pi / 5;
      final ox = center.dx + r * math.cos(outer);
      final oy = center.dy + r * math.sin(outer);
      final ix = center.dx + r * 0.38 * math.cos(inner);
      final iy = center.dy + r * 0.38 * math.sin(inner);
      i == 0 ? path.moveTo(ox, oy) : path.lineTo(ox, oy);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CrescentPainter old) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// BACKGROUND — ISLAMIC GEOMETRIC PATTERN
// ─────────────────────────────────────────────────────────────────────────────

class _GeometricPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC9A84C).withValues(alpha: 0.032)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.9;

    const tileW = 78.0;
    const tileH = 78.0;

    final cols = (size.width / tileW).ceil() + 2;
    final rows = (size.height / tileH).ceil() + 2;

    for (int row = -1; row < rows; row++) {
      for (int col = -1; col < cols; col++) {
        final dx = col * tileW + (row.isOdd ? tileW / 2 : 0);
        final dy = row * tileH;
        _drawStar8(canvas, paint, Offset(dx, dy), tileW * 0.32);

        // Connecting squares at midpoints
        if (row.isEven) {
          _drawSquare(canvas, paint, Offset(dx + tileW / 2, dy + tileH / 2),
              tileW * 0.14);
        }
      }
    }
  }

  void _drawStar8(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 8; i++) {
      final outerA = i * math.pi / 4 - math.pi / 8;
      final innerA = outerA + math.pi / 8;
      final ox = center.dx + r * math.cos(outerA);
      final oy = center.dy + r * math.sin(outerA);
      final ix = center.dx + r * 0.41 * math.cos(innerA);
      final iy = center.dy + r * 0.41 * math.sin(innerA);
      i == 0 ? path.moveTo(ox, oy) : path.lineTo(ox, oy);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawSquare(Canvas canvas, Paint paint, Offset center, double r) {
    final rect = Rect.fromCenter(center: center, width: r * 2, height: r * 2);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi / 4);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawRect(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GeometricPatternPainter old) => false;
}
