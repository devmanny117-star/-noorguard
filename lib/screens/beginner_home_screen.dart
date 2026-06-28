import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/prayer_times_data.dart';
import '../l10n/app_localizations.dart';
import '../models/prayer_model.dart';
import '../models/surah_model.dart';
import '../widgets/home/feature_grid.dart';
import '../widgets/home/header_section.dart';
import '../widgets/home/hero_card.dart';
import '../widgets/home/prayer_times_card.dart';
import '../widgets/home/premium_bottom_nav.dart';
import 'duas_screen.dart';
import 'home_screen.dart';
import 'how_to_pray_screen.dart';
import 'islamic_glossary_screen.dart';
import 'new_muslim_hub_screen.dart';
import 'prayers_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'settings_screen.dart';
import 'surah_screen.dart';
import 'wudu_guide_screen.dart';

const _kNavy   = Color(0xFF0D1B2A);
const _kCard   = Color(0xFF0f1e30);
const _kGold   = Color(0xFFC9A84C);
const _kCream  = Color(0xFFF5EFE6);

const _kAlFatiha = Surah(
  number: 1,
  name: 'الفاتحة',
  englishName: 'Al-Fatiha',
  englishNameTranslation: 'The Opening',
  numberOfAyahs: 7,
  revelationType: 'Meccan',
);

// ── BeginnerHomeScreen ─────────────────────────────────────────────────────────

class BeginnerHomeScreen extends StatefulWidget {
  const BeginnerHomeScreen({super.key});

  @override
  State<BeginnerHomeScreen> createState() => _BeginnerHomeScreenState();
}

class _BeginnerHomeScreenState extends State<BeginnerHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        } else {
          SystemNavigator.pop();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          extendBody: true,
          backgroundColor: _kNavy,
          body: SafeArea(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                _BeginnerBody(
                  onOpenSettings: () => setState(() => _selectedIndex = 3),
                  onOpenPrayers:  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PrayersScreen()),
                  ),
                ),
                const QuranScreen(),
                QiblaScreen(isActive: _selectedIndex == 2),
                const SettingsScreen(),
              ],
            ),
          ),
          bottomNavigationBar: PremiumBottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (i) => setState(() => _selectedIndex = i),
          ),
        ),
      ),
    );
  }
}

// ── Body (home tab) ────────────────────────────────────────────────────────────

class _BeginnerBody extends StatefulWidget {
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenPrayers;

  const _BeginnerBody({
    required this.onOpenSettings,
    required this.onOpenPrayers,
  });

  @override
  State<_BeginnerBody> createState() => _BeginnerBodyState();
}

class _BeginnerBodyState extends State<_BeginnerBody> {
  List<Prayer>? _prayers;
  String        _userName     = '';
  DateTime?     _shahadaDate;
  final List<bool> _essentials = List.filled(7, false);
  int           _quoteIndex   = 0;
  Timer?        _quoteTimer;

  @override
  void initState() {
    super.initState();
    _loadData();
    _quoteTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (mounted) setState(() => _quoteIndex = (_quoteIndex + 1) % 5);
    });
  }

  @override
  void dispose() {
    _quoteTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final dateStr = prefs.getString('shahada_date');
    setState(() {
      _userName    = prefs.getString('user_name') ?? '';
      _shahadaDate = dateStr != null ? DateTime.tryParse(dateStr) : null;
      for (int i = 0; i < 7; i++) {
        _essentials[i] = prefs.getBool('essential_$i') ?? false;
      }
    });
    _loadPrayerTimes();
  }

  Future<void> _loadPrayerTimes() async {
    try {
      await Geolocator.requestPermission();
      final pos    = await Geolocator.getCurrentPosition();
      final marks  = await placemarkFromCoordinates(pos.latitude, pos.longitude);
      final city   = marks.first.locality       ?? 'Sacramento';
      final country = marks.first.isoCountryCode ?? 'US';
      final prayers = await fetchPrayerTimes(city: city, country: country);
      if (mounted) setState(() => _prayers = prayers);
    } catch (_) {
      try {
        final prayers = await fetchPrayerTimes(city: 'Sacramento', country: 'US');
        if (mounted) setState(() => _prayers = prayers);
      } catch (_) {
        if (mounted) setState(() => _prayers = todaysPrayers);
      }
    }
  }

  Future<void> _toggleEssential(int index) async {
    final prefs    = await SharedPreferences.getInstance();
    final newValue = !_essentials[index];
    await prefs.setBool('essential_$index', newValue);
    if (mounted) setState(() => _essentials[index] = newValue);
  }

  Future<void> _pickShahadaDate() async {
    final now    = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: now,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: _kGold,
            onPrimary: _kNavy,
            surface: _kCard,
            onSurface: _kCream,
          ),
        ),
        child: child!,
      ),
    );
    if (picked == null || !mounted) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shahada_date', picked.toIso8601String());
    setState(() => _shahadaDate = picked);
  }

  Future<void> _switchToFullMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('beginner_mode', false);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  int    get _daysSince => _shahadaDate == null ? 0 : DateTime.now().difference(_shahadaDate!).inDays;
  double get _progress  => _shahadaDate == null ? 0 : (_daysSince / 30.0).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: greeting (top-left) + 3 icon buttons (top-right)
          const SizedBox(height: 4),
          HeaderSection(
            onOpenSettings: widget.onOpenSettings,
            userName: _userName,
          ),
          const SizedBox(height: 6),
          // Section 1: Prayer Times Card
          PrayerTimesCard(
            prayers: _prayers,
            onNextPrayerTap: widget.onOpenPrayers,
          ),
          // Section 2: Hero Card
          const HeroCard(),
          // Section 3: Journey Card
          _JourneyCard(
            daysSince:  _shahadaDate != null ? _daysSince : null,
            progress:   _progress,
            quoteIndex: _quoteIndex,
            onSetDate:  _pickShahadaDate,
          ),
          // Section 4: Muslim Essentials Checklist
          _EssentialsCard(
            checked:  _essentials,
            onToggle: _toggleEssential,
          ),
          // Section 5: Beginner Toolbox
          const _ToolboxCard(),
          // Section 6: Explore All Features
          _ExploreAllCard(onTap: _switchToFullMode),
        ],
      ),
    );
  }
}

// ── Shared card wrapper ────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.45), width: 1),
      ),
      child: child,
    );
  }
}

// ── Section 3: Journey Card ────────────────────────────────────────────────────

class _JourneyCard extends StatelessWidget {
  final int?         daysSince;
  final double       progress;
  final int          quoteIndex;
  final VoidCallback onSetDate;

  const _JourneyCard({
    required this.daysSince,
    required this.progress,
    required this.quoteIndex,
    required this.onSetDate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final quotes = [
      l10n.beginnerQuote1,
      l10n.beginnerQuote2,
      l10n.beginnerQuote3,
      l10n.beginnerQuote4,
      l10n.beginnerQuote5,
    ];

    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section label
          Text(
            l10n.beginnerYourJourney,
            style: GoogleFonts.lato(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          // Shahada tracker
          if (daysSince != null) ...[
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 5,
                        backgroundColor: _kGold.withValues(alpha: 0.15),
                        valueColor: const AlwaysStoppedAnimation<Color>(_kGold),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: _kGold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.beginnerDaySinceShahada(daysSince!),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: _kGold.withValues(alpha: 0.15),
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(_kGold),
                          minHeight: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ] else ...[
            GestureDetector(
              onTap: onSetDate,
              child: Row(
                children: [
                  const Icon(Icons.add_circle_outline, color: _kGold, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    l10n.beginnerTapToSetShahadaDate,
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      color: _kGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 14),
          // Rotating quote
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (child, anim) =>
                FadeTransition(opacity: anim, child: child),
            child: Text(
              key: ValueKey(quoteIndex),
              '"${quotes[quoteIndex]}"',
              style: GoogleFonts.lato(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.white.withValues(alpha: 0.50),
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section 4: Essentials Checklist ───────────────────────────────────────────

class _EssentialsCard extends StatelessWidget {
  final List<bool> checked;
  final void Function(int) onToggle;

  const _EssentialsCard({required this.checked, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final items = <({String label, Widget screen})>[
      (label: l10n.beginnerEssential1, screen: const NewMuslimHubScreen()),
      (label: l10n.beginnerEssential2, screen: const WuduGuideScreen()),
      (label: l10n.beginnerEssential3, screen: const HowToPrayScreen()),
      (label: l10n.beginnerEssential4, screen: const SurahScreen(surah: _kAlFatiha)),
      (label: l10n.beginnerEssential5, screen: const DuasScreen()),
      (label: l10n.beginnerEssential6, screen: const NewMuslimHubScreen()),
      (label: l10n.beginnerEssential7, screen: const IslamicGlossaryScreen()),
    ];

    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.beginnerMuslimEssentials,
            style: GoogleFonts.lato(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0)
              Divider(color: _kGold.withValues(alpha: 0.10), height: 1),
            _EssentialItem(
              label:      items[i].label,
              checked:    checked[i],
              onToggle:   () => onToggle(i),
              onNavigate: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => items[i].screen),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EssentialItem extends StatelessWidget {
  final String       label;
  final bool         checked;
  final VoidCallback onToggle;
  final VoidCallback onNavigate;

  const _EssentialItem({
    required this.label,
    required this.checked,
    required this.onToggle,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigate,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: checked ? _kGold : Colors.transparent,
                  border: Border.all(
                    color: _kGold,
                    width: checked ? 0 : 1.5,
                  ),
                ),
                child: checked
                    ? const Icon(Icons.check, size: 14, color: _kNavy)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: checked
                      ? Colors.white.withValues(alpha: 0.30)
                      : Colors.white,
                  decoration: checked ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.white.withValues(alpha: 0.30),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: _kGold.withValues(alpha: checked ? 0.25 : 0.65),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section 5: Beginner Toolbox ────────────────────────────────────────────────

class _ToolboxCard extends StatelessWidget {
  const _ToolboxCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final items = <({IconData icon, String label, Widget screen})>[
      (icon: Icons.self_improvement_rounded, label: l10n.beginnerLearnSalah, screen: const HowToPrayScreen()),
      (icon: Icons.water_drop_rounded,       label: l10n.wuduGuide,          screen: const WuduGuideScreen()),
      (icon: Icons.menu_book_rounded,        label: l10n.islamicGlossary,    screen: const IslamicGlossaryScreen()),
      (icon: Icons.favorite_rounded,         label: l10n.revertCorner,       screen: const NewMuslimHubScreen()),
    ];

    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.beginnerToolboxSection,
            style: GoogleFonts.lato(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FeatureCard(
                  icon:  items[0].icon,
                  label: items[0].label,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => items[0].screen)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FeatureCard(
                  icon:  items[1].icon,
                  label: items[1].label,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => items[1].screen)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FeatureCard(
                  icon:  items[2].icon,
                  label: items[2].label,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => items[2].screen)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FeatureCard(
                  icon:  items[3].icon,
                  label: items[3].label,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => items[3].screen)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Section 6: Explore All Features ───────────────────────────────────────────

class _ExploreAllCard extends StatelessWidget {
  final VoidCallback onTap;
  const _ExploreAllCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _kGold.withValues(alpha: 0.18),
                _kGold.withValues(alpha: 0.08),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _kGold.withValues(alpha: 0.55), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.beginnerExploreAll,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l10n.beginnerExploreSubtitle,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.50),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: _kGold,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: _kNavy,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
