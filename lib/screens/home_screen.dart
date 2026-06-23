import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../theme/app_theme.dart';
import '../models/prayer_model.dart';
import '../models/surah_model.dart';
import '../data/prayer_times_data.dart';
import '../services/app_blocking_service.dart';
import '../services/notification_service.dart';
import '../services/prayer_state.dart';
import '../services/widget_data_service.dart';
import '../widgets/home/header_section.dart';
import '../widgets/home/hero_card.dart';
import '../widgets/home/prayer_times_card.dart';
import '../widgets/home/feature_grid.dart';
import 'prayers_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'settings_screen.dart';
import 'surah_screen.dart';
import '../l10n/app_localizations.dart';

// Always available offline as the ayah-challenge's reading target — avoids
// waiting on fetchSurahs() just to resolve this one well-known surah's
// display metadata (SurahScreen still fetches the actual ayah text itself).
const _alFatiha = Surah(
  number: 1,
  name: 'الفاتحة',
  englishName: 'Al-Fatiha',
  englishNameTranslation: 'The Opening',
  numberOfAyahs: 7,
  revelationType: 'Meccan',
);

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
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_selectedIndex != 0) {
          setState(() => _selectedIndex = 0);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: colors.background,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _HomeBody(
                onOpenSettings: () => setState(() => _selectedIndex = 3),
                onOpenPrayers: () => Navigator.push(
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
  final VoidCallback onOpenPrayers;

  const _HomeBody({required this.onOpenSettings, required this.onOpenPrayers});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with WidgetsBindingObserver {
  List<Prayer>? _prayers;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAppBlockingThenPrayerTimes();
    _applyPendingPrayerMarks();
    _checkAyahChallenge();
  }

  /// loadSettings() must finish before _loadPrayerTimes() reaches
  /// syncToNative() — AppBlockingService.blockedPackages starts out empty
  /// until loadSettings() reads it from disk, and these previously raced
  /// (both fired unawaited from initState()): whichever finished first won,
  /// so a fast prayer-time fetch (e.g. a cached/fallback path with no
  /// network call) could push an empty blocked-apps list to native even
  /// though the user's selection was correctly persisted — silently leaving
  /// nothing for the AccessibilityService to block all day.
  Future<void> _loadAppBlockingThenPrayerTimes() async {
    await AppBlockingService().loadSettings();
    if (!mounted) return;
    _loadPrayerTimes();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // _HomeBody is usually still alive in the background, so the ayah
    // challenge from BlockActivity's "Read 3 Ayahs" — which relaunches
    // MainActivity rather than creating a fresh one — needs a re-check on
    // resume; initState() alone only ever sees it on a true cold start.
    if (state == AppLifecycleState.resumed) _checkAyahChallenge();
  }

  Future<void> _checkAyahChallenge() async {
    final challenge = await AppBlockingService().consumePendingAyahChallenge();
    if (challenge == null || !mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SurahScreen(surah: _alFatiha, ayahChallenge: challenge),
      ),
    );
  }

  Future<void> _applyPendingPrayerMarks() async {
    final marked = await NotificationService().getPendingPrayerMarks();
    if (marked.isEmpty) return;
    final state = PrayerState();
    for (final name in marked) {
      if (state.prayers.containsKey(name) && state.prayers[name] != true) {
        await state.togglePrayer(name, mounted ? context : null);
      }
    }
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
        _pushWidgetSnapshot(
          prayers,
          locationLabel: '$city, $country',
          lat: position.latitude,
          lng: position.longitude,
        );
      }
    } catch (_) {
      try {
        final prayers = await fetchPrayerTimes(city: 'Sacramento', country: 'US');
        if (mounted) {
          setState(() => _prayers = prayers);
          _scheduleNotifications(prayers);
          _pushWidgetSnapshot(prayers, locationLabel: 'Sacramento, US');
        }
      } catch (_) {
        if (mounted) {
          setState(() => _prayers = todaysPrayers);
          _scheduleNotifications(todaysPrayers);
          _pushWidgetSnapshot(todaysPrayers, locationLabel: 'Sacramento, US');
        }
      }
    }
  }

  void _pushWidgetSnapshot(
    List<Prayer> prayers, {
    required String locationLabel,
    double? lat,
    double? lng,
  }) {
    PrayerState().lastKnownPrayers = prayers;
    AppBlockingService().syncToNative(context, prayers);
    WidgetDataService.pushPrayerTimesSnapshot(
      context: context,
      prayers: prayers,
      locationLabel: locationLabel,
      lat: lat,
      lng: lng,
    );
  }

  void _scheduleNotifications(List<Prayer> prayers) {
    final today = DateTime.now();
    final data = prayers.map<Map<String, dynamic>>((p) {
      return {'name': p.name, 'time': _parseTimeString(p.time, today)};
    }).toList();
    // Share the exact times we scheduled so the foreground adhan controller
    // fires in sync with these notifications (these use the device location).
    PrayerState().setScheduledPrayerTimes(data);

    // Respect the user's notification preference on every load — without
    // this check, simply reopening the app (which re-runs this on every
    // cold start of the Home screen) would silently re-schedule every
    // prayer notification and full-screen alarm even with the bell off.
    if (!PrayerState().masterNotifications) return;

    final adhanId = PrayerState().selectedAdhanId;
    NotificationService().schedulePrayerNotifications(
      data,
      adhanId: adhanId,
    );
    NotificationService().scheduleFullScreenPrayerAlarms(
      data,
      adhanId: adhanId,
    );
    _startKeepAliveServiceIfNeeded();
  }

  /// Keeps the app classified as foreground so prayer alarms and
  /// notifications keep being delivered reliably in the background — only
  /// while the user has prayer notifications turned on at all.
  Future<void> _startKeepAliveServiceIfNeeded() async {
    if (!PrayerState().masterNotifications) return;
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await NotificationService().startKeepAliveService(
      title: l10n.appName,
      text: l10n.keepAliveNotificationText,
      channelName: l10n.keepAliveChannelName,
      channelDescription: l10n.keepAliveChannelDescription,
    );
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
          const SizedBox(height: 6),
          PrayerTimesCard(prayers: _prayers, onNextPrayerTap: widget.onOpenPrayers),
          const HeroCard(),
          const RevertCornerCard(),
          const FeatureGrid(),
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
            color: Colors.black.withValues(alpha: 0.07),
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
                icon: Icons.grid_view_outlined,
                selectedIcon: Icons.grid_view_rounded,
                label: l10n.more,
                isSelected: selectedIndex == 3,
                onTap: () => onTap(3),
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

