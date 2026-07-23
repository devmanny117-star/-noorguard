import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../models/prayer_model.dart';
import '../models/surah_model.dart';
import '../data/prayer_times_data.dart';
import '../services/app_blocking_service.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';
import '../services/prayer_scheduler.dart';
import '../services/prayer_state.dart';
import '../services/prayer_times_cache.dart';
import '../services/widget_data_service.dart';
import '../widgets/city_picker_dialog.dart';
import '../widgets/home/header_section.dart';
import '../widgets/home/hero_card.dart';
import '../widgets/home/prayer_times_card.dart';
import '../widgets/home/feature_grid.dart';
import '../widgets/home/our_stories_card.dart';
import '../widgets/home/premium_bottom_nav.dart';
import 'prayers_screen.dart';
import 'qibla_screen.dart';
import 'quran_screen.dart';
import 'settings_screen.dart';
import 'surah_screen.dart';
import '../l10n/app_localizations.dart';
import '../widgets/share_sheet.dart';
import 'beginner_home_screen.dart';

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
        extendBody: true,
        backgroundColor: colors.background,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _HomeBody(
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
        bottomNavigationBar: PremiumBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
        ),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  final VoidCallback onOpenPrayers;

  const _HomeBody({required this.onOpenPrayers});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with WidgetsBindingObserver {
  List<Prayer>? _prayers;
  String _userName = '';
  late DateTime _lastKnownDate;

  @override
  void initState() {
    super.initState();
    _lastKnownDate = DateTime.now();
    WidgetsBinding.instance.addObserver(this);
    _loadAppBlockingThenPrayerTimes();
    _applyPendingPrayerMarks();
    _checkAyahChallenge();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) setState(() => _userName = prefs.getString('user_name') ?? '');
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
    // Fire-and-forget: warms the installed-apps cache now (the native fetch
    // runs off Android's main thread) so the App Blocking and Focus Mode
    // apps pickers open instantly instead of paying for it the first time
    // either is opened.
    AppBlockingService().getInstalledApps();
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
    if (state == AppLifecycleState.resumed) {
      _checkAyahChallenge();

      // The capsules and scheduled notifications are only refreshed on a
      // cold start, so a resume that crosses midnight would keep showing
      // yesterday's completion state and leave no alarms queued for today.
      final now = DateTime.now();
      final dayChanged = now.year != _lastKnownDate.year ||
          now.month != _lastKnownDate.month ||
          now.day != _lastKnownDate.day;
      if (dayChanged) {
        context.read<PrayerState>().loadToday();
        final prayers = _prayers;
        // Only mark the day-change as handled once scheduling actually ran —
        // if the prayer list isn't loaded yet, leave _lastKnownDate stale so
        // the next resume retries instead of silently skipping today.
        if (prayers != null) {
          _scheduleNotifications(prayers);
          _lastKnownDate = now;
        }
      }
    }
  }

  Future<void> _toggleMode() async {
    final l10n = AppLocalizations.of(context)!;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('beginner_mode', true);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(l10n.switchedToNewMuslimMode,
          style: GoogleFonts.lato(color: Colors.white)),
      backgroundColor: const Color(0xFF1B3A2D),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ));
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => BeginnerHomeScreen(switchToHome: () => const HomeScreen()),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
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
    // 0) Last successful fetch, straight from disk — painted immediately so
    //    the card never sits on a spinner. Yesterday's cache still shows
    //    (clock times drift only a minute or two per day); the live chain
    //    below runs regardless and silently replaces it when the fresh
    //    fetch lands. Display only: notifications are never scheduled from
    //    the cache.
    try {
      final cached = await PrayerTimesCache.load();
      if (cached != null && mounted && _prayers == null) {
        setState(() => _prayers = cached.prayers);
      }
    } catch (_) {}

    // 1) Live GPS.
    try {
      await Geolocator.requestPermission();
      final position = await Geolocator.getCurrentPosition();
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;
      final city = (placemark.locality?.isNotEmpty ?? false)
          ? placemark.locality!
          : (placemark.subAdministrativeArea ?? '');
      final country = placemark.isoCountryCode ?? '';
      if (city.isEmpty || country.isEmpty) {
        throw Exception('reverse geocode returned no city');
      }
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
      return;
    } catch (_) {}

    // 2) The city saved on the Qibla screen.
    try {
      final saved = await LocationService().savedPrayerCity();
      if (saved != null) {
        final prayers =
            await fetchPrayerTimes(city: saved.city, country: saved.country);
        if (mounted) {
          setState(() => _prayers = prayers);
          _scheduleNotifications(prayers);
          _pushWidgetSnapshot(prayers, locationLabel: saved.label);
        }
        return;
      }
    } catch (_) {}

    // 3) No location at all — ask the user instead of guessing. The picked
    //    city is persisted as a saved Qibla location, so this only ever has
    //    to be answered once.
    if (!mounted) return;
    final picked = await showCityPickerDialog(context);
    if (picked != null) {
      try {
        final city = await LocationService()
            .cityFromLatLng(picked.latitude, picked.longitude);
        if (city != null) {
          final prayers =
              await fetchPrayerTimes(city: city.city, country: city.country);
          if (mounted) {
            setState(() => _prayers = prayers);
            _scheduleNotifications(prayers);
            _pushWidgetSnapshot(
              prayers,
              locationLabel: picked.name,
              lat: picked.latitude,
              lng: picked.longitude,
            );
          }
          return;
        }
      } catch (_) {}
    }

    // Dismissed or unresolvable: keep the cached times if they're showing,
    // else fall back to sample times so the screen isn't empty. Either way
    // deliberately schedule nothing — wrong-city notifications are worse
    // than none. The picker asks again on the next load.
    if (mounted && _prayers == null) setState(() => _prayers = todaysPrayers);
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

  // Scheduling itself lives in PrayerScheduler so Beginner Mode's home
  // screen arms notifications through the identical path.
  void _scheduleNotifications(List<Prayer> prayers) =>
      PrayerScheduler.scheduleFromPrayers(context, prayers);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          HeaderSection(
            onShare: () => showShareSheet(context),
            userName: _userName,
            isBeginnerMode: false,
            onModeToggle: _toggleMode,
          ),
          const SizedBox(height: 6),
          PrayerTimesCard(prayers: _prayers, onNextPrayerTap: widget.onOpenPrayers),
          const HeroCard(),
          const RevertCornerCard(),
          const OurStoriesCard(),
          const FeatureGrid(),
        ],
      ),
    );
  }
}

