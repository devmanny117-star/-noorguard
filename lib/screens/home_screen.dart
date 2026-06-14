import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../theme/app_theme.dart';
import '../models/prayer_model.dart';
import '../data/prayer_times_data.dart';
import '../services/notification_service.dart';
import '../widgets/home/header_section.dart';
import '../widgets/home/hero_card.dart';
import '../widgets/home/prayer_times_card.dart';
import '../widgets/home/feature_grid.dart';
import '../widgets/home/quote_banner.dart';
import '../widgets/streak_badge_widget.dart';
import '../widgets/prayer_checkin_widget.dart';
import 'prayers_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'settings_screen.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colors.background,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _HomeBody(
                onOpenSettings: () => setState(() => _selectedIndex = 4),
              ),
              const QuranScreen(),
              const QiblaScreen(),
              const PrayersScreen(),
              const SettingsScreen(),
            ],
          ),
        ),
        bottomNavigationBar: _BottomNav(
          selectedIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
        ),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  final VoidCallback onOpenSettings;

  const _HomeBody({required this.onOpenSettings});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  List<Prayer>? _prayers;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  Future<void> _loadPrayerTimes() async {
    try {
      await Geolocator.requestPermission();
      final position = await Geolocator.getCurrentPosition();
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;
      final city = placemark.locality ?? 'Sacramento';
      final country = placemark.isoCountryCode ?? 'US';
      final prayers = await fetchPrayerTimes(city: city, country: country);
      if (mounted) {
        setState(() => _prayers = prayers);
        _scheduleNotifications(prayers);
      }
    } catch (_) {
      try {
        final prayers = await fetchPrayerTimes(city: 'Sacramento', country: 'US');
        if (mounted) {
          setState(() => _prayers = prayers);
          _scheduleNotifications(prayers);
        }
      } catch (_) {
        if (mounted) {
          setState(() => _prayers = todaysPrayers);
          _scheduleNotifications(todaysPrayers);
        }
      }
    }
  }

  void _scheduleNotifications(List<Prayer> prayers) {
    final today = DateTime.now();
    final data = prayers.map((p) {
      return {'name': p.name, 'time': _parseTimeString(p.time, today)};
    }).toList();
    NotificationService().schedulePrayerNotifications(data);
  }

  DateTime _parseTimeString(String timeStr, DateTime date) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final isPm = parts[1].toUpperCase() == 'PM';
    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          HeaderSection(onOpenSettings: widget.onOpenSettings),
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 6, 18, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: StreakBadgeWidget(),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(18, 6, 18, 0),
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 12),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1B2A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const PrayerCheckinWidget(),
          ),
          const SizedBox(height: 6),
          const HeroCard(),
          const RevertCornerCard(),
          PrayerTimesCard(prayers: _prayers),
          const FeatureGrid(),
          const SizedBox(height: 4),
          const QuoteBanner(),
        ],
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: AppColors.gold),
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: colors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.comingSoon,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: colors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: colors.cardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home_rounded,
                label: l10n.home,
                isSelected: selectedIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.menu_book_outlined,
                selectedIcon: Icons.menu_book_rounded,
                label: l10n.quran,
                isSelected: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                icon: Icons.explore_outlined,
                selectedIcon: Icons.explore_rounded,
                label: l10n.qibla,
                isSelected: selectedIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavItem(
                icon: Icons.access_time_outlined,
                selectedIcon: Icons.access_time_filled_rounded,
                label: l10n.prayers,
                isSelected: selectedIndex == 3,
                onTap: () => onTap(3),
              ),
              _NavItem(
                icon: Icons.grid_view_outlined,
                selectedIcon: Icons.grid_view_rounded,
                label: l10n.more,
                isSelected: selectedIndex == 4,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final color = isSelected ? AppColors.gold : colors.secondaryText;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2.5,
              width: isSelected ? 28.0 : 0.0,
              margin: const EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Icon(
              isSelected ? selectedIcon : icon,
              size: 22,
              color: color,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
