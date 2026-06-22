import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'locale_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/notification_setup_screen.dart';
import 'screens/onboarding_screen.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'package:provider/provider.dart';
import 'services/notification_service.dart';
import 'services/prayer_state.dart';
import 'services/adhan_foreground_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) tz_data.initializeTimeZones();
  await NotificationService().init();
  if (!kIsWeb) {
    // Powers the lock screen / status bar media controls for the Quran
    // reader's background playback (see SurahScreen).
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.noorguard.app.channel.audio',
      androidNotificationChannelName: 'Quran Recitation',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
      // Matches the gold accent used on the Quran reader's player bar.
      notificationColor: const Color(0xFFD4AF37),
    );
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => PrayerState()..loadToday(),
      child: const NoorGuardApp(),
    ),
  );
}

class NoorGuardApp extends StatefulWidget {
  const NoorGuardApp({super.key});

  @override
  State<NoorGuardApp> createState() => _NoorGuardAppState();
}

class _NoorGuardAppState extends State<NoorGuardApp> {
  final _themeController = ThemeController();
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _loadLocale();
    // Plays the full adhan in-app when a prayer reminder fires while the app
    // is open (the closed-app case is handled by scheduled notifications).
    AdhanForegroundController().start();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('app_locale');
    if (code != null && mounted) setState(() => _locale = Locale(code));
  }

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      locale: _locale,
      onLocaleChange: (locale) => setState(() => _locale = locale),
      child: ThemeScope(
        notifier: _themeController,
        child: ListenableBuilder(
          listenable: _themeController,
          builder: (_, __) => MaterialApp(
            locale: _locale,
            title: 'Noor Guard',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
              Locale('ur'),
              Locale('es'),
              Locale('de'),
              Locale('nl'),
              Locale('pt'),
              Locale('it'),
              Locale('fr'),
              Locale('id'),
              Locale('zh'),
              Locale('ja'),
              Locale('bn'),
              Locale('tr'),
              Locale('sw'),
            ],
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: _themeController.mode,
            // Keeps status bar icons correct in both modes and hosts the
            // global floating Stop Adhan button shown while adhan is playing.
            builder: (context, child) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness:
                      isDark ? Brightness.light : Brightness.dark,
                  statusBarBrightness:
                      isDark ? Brightness.dark : Brightness.light,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: child!),
                    ValueListenableBuilder<bool>(
                      valueListenable:
                          AdhanForegroundController().isAdhanPlaying,
                      builder: (ctx, playing, _) {
                        // Position above the bottom nav bar + safe area.
                        final bottomInset =
                            MediaQuery.of(ctx).padding.bottom + 72;
                        return Positioned(
                          left: 0,
                          right: 0,
                          bottom: bottomInset,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 280),
                            switchInCurve: Curves.easeOutCubic,
                            switchOutCurve: Curves.easeInCubic,
                            transitionBuilder: (child, anim) => ScaleTransition(
                              scale: anim,
                              child: FadeTransition(
                                  opacity: anim, child: child),
                            ),
                            child: playing
                                ? const _StopAdhanButton()
                                : const SizedBox.shrink(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _scale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
    _ctrl.forward();

    Future.delayed(const Duration(milliseconds: 2200), () async {
      if (!mounted) return;
      final prefs = await SharedPreferences.getInstance();
      final onboardingComplete = prefs.getBool('onboarding_complete') ?? false;
      final notificationSetupComplete =
          prefs.getBool('notification_setup_complete') ?? false;
      if (!mounted) return;
      // Existing installs that already finished onboarding before this guide
      // existed still get routed through it once, since they're the ones
      // most likely to be missing the Samsung-specific lock screen toggle.
      Widget next;
      if (!onboardingComplete) {
        next = const OnboardingScreen();
      } else if (!kIsWeb && Platform.isAndroid && !notificationSetupComplete) {
        next = const NotificationSetupScreen(isFirstLaunch: true);
      } else {
        next = const HomeScreen();
      }
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => next,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: Stack(
        children: [
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            child: FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _scale,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gold.withValues(alpha: 0.07),
                            ),
                          ),
                          Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gold.withValues(alpha: 0.11),
                              border: Border.all(
                                color: AppColors.gold.withValues(alpha: 0.30),
                                width: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 74,
                            height: 74,
                            child: CustomPaint(painter: _SplashCrescentPainter()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Noor Guard',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Guard your time. Honor your prayers.',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.85),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.gold.withValues(alpha: 0.35),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Floating pill button shown while the foreground adhan is playing.
/// Tapping it stops the adhan immediately and hides the button.
class _StopAdhanButton extends StatelessWidget {
  const _StopAdhanButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.45),
              blurRadius: 18,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          key: const ValueKey('stop_adhan_btn'),
          onPressed: AdhanForegroundController().stopAdhan,
          icon: const Icon(Icons.stop_rounded, size: 22),
          label: Text(
            'Stop Adhan',
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gold,
            foregroundColor: const Color(0xFF1B5E20),
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: const StadiumBorder(),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class _SplashCrescentPainter extends CustomPainter {
  const _SplashCrescentPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.40;

    final paint = Paint()
      ..color = AppColors.gold
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
  bool shouldRepaint(_SplashCrescentPainter old) => false;
}
