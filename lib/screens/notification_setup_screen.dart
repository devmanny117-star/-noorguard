import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/notification_service.dart';
import '../services/prayer_state.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

// Fixed dark palette — matches the onboarding flow this screen extends.
const _bg = Color(0xFF0D1B2A);
const _cardBg = Color(0xFF152535);
const _cardBorder = Color(0xFF1E3348);
const _white = Color(0xFFF5F5F0);
const _grey = Color(0xFF8A9BB0);
const _green = Color(0xFF2E7D32);

/// One-time (re-visitable) guide that walks the user through every Android
/// permission/toggle the full-screen prayer alarm depends on. Samsung's One
/// UI hides "Pop-up notification" behind its own per-channel setting that
/// stock Android's full-screen-intent permission check can't see, so Step 4
/// always shows manual instructions rather than trusting the OS check alone.
class NotificationSetupScreen extends StatefulWidget {
  final bool isFirstLaunch;
  const NotificationSetupScreen({super.key, this.isFirstLaunch = false});

  @override
  State<NotificationSetupScreen> createState() =>
      _NotificationSetupScreenState();
}

class _NotificationSetupScreenState extends State<NotificationSetupScreen>
    with WidgetsBindingObserver {
  bool? _notificationsEnabled;
  bool? _exactAlarmsEnabled;
  bool? _overlayEnabled;
  bool? _fullScreenEnabled;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshStatuses();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // The user grants these permissions in system Settings, outside the app,
    // so re-check every time they come back to it.
    if (state == AppLifecycleState.resumed) _refreshStatuses();
  }

  Future<void> _refreshStatuses() async {
    final svc = NotificationService();
    final results = await Future.wait([
      svc.areNotificationsEnabled,
      svc.canScheduleExactAlarms,
      svc.canDrawOverlays,
      svc.canUseFullScreenIntent,
    ]);
    if (!mounted) return;
    setState(() {
      _notificationsEnabled = results[0];
      _exactAlarmsEnabled = results[1];
      _overlayEnabled = results[2];
      _fullScreenEnabled = results[3];
    });
  }

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification_setup_complete', true);
    if (!mounted) return;
    if (widget.isFirstLaunch) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final adhanId = PrayerState().selectedAdhanId;
    final allDone = _notificationsEnabled == true &&
        _exactAlarmsEnabled == true &&
        _overlayEnabled == true &&
        _fullScreenEnabled == true;

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            if (!widget.isFirstLaunch)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, color: _grey),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                    20, widget.isFirstLaunch ? 24 : 0, 20, 12),
                children: [
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.gold.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.lock_clock_rounded,
                            color: AppColors.gold, size: 26),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          'Enable Lock Screen Alerts',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: _white,
                            height: 1.15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'So you never miss the adhan — even when your phone is '
                    'locked. Takes about a minute.',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: _grey,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const _SamsungBanner(),
                  const SizedBox(height: 18),
                  _StepCard(
                    number: 1,
                    icon: Icons.notifications_rounded,
                    title: 'Allow Notifications',
                    description:
                        'The basic permission Noor Guard needs to alert you at all.',
                    status: _notificationsEnabled,
                    actionLabel: 'Allow Notifications',
                    onAction: () async {
                      await NotificationService().requestNotificationsPermission();
                      await _refreshStatuses();
                    },
                  ),
                  const SizedBox(height: 12),
                  _StepCard(
                    number: 2,
                    icon: Icons.alarm_rounded,
                    title: 'Alarms & Reminders',
                    description:
                        'Lets prayer alarms fire at the exact prayer time, even '
                        'while your phone is idle or in battery saver.',
                    status: _exactAlarmsEnabled,
                    actionLabel: 'Open Alarm Settings',
                    onAction: () async {
                      await NotificationService().openExactAlarmSettings();
                    },
                  ),
                  const SizedBox(height: 12),
                  _StepCard(
                    number: 3,
                    icon: Icons.layers_rounded,
                    title: 'Display Over Other Apps',
                    description:
                        'Lets the full prayer screen draw on top of the lock '
                        'screen and whatever else is open.',
                    status: _overlayEnabled,
                    actionLabel: 'Open Settings',
                    onAction: () async {
                      await NotificationService().openOverlaySettings();
                    },
                  ),
                  const SizedBox(height: 12),
                  _StepCard(
                    number: 4,
                    icon: Icons.fullscreen_rounded,
                    title: 'Show As Pop-up / Full-Screen Alerts',
                    description:
                        'Lets the adhan screen break through the lock screen '
                        'instead of staying a silent banner.',
                    samsungNote:
                        'On Samsung Galaxy phones (including Fold/Flip): open '
                        'Settings → tap "Prayer Time Alarm", then turn on '
                        '"Pop-up notification" (called "Cover screen pop-up" '
                        'on Fold/Flip). This is a Samsung-only switch — '
                        'turning it on is what actually puts the adhan screen '
                        'over your lock screen.',
                    status: _fullScreenEnabled,
                    actionLabel: 'Open Notification Settings',
                    onAction: () async {
                      await NotificationService()
                          .openAppNotificationSettings(adhanId: adhanId);
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: GestureDetector(
                onTap: _finish,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFD9B45A), AppColors.gold, Color(0xFFA08532)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      allDone
                          ? 'Continue to Noor Guard'
                          : (widget.isFirstLaunch ? "I'll finish this later" : 'Done'),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _bg,
                        letterSpacing: 0.3,
                      ),
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
}

class _SamsungBanner extends StatelessWidget {
  const _SamsungBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, size: 17, color: AppColors.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Using a Samsung Galaxy (including Fold/Flip)? Samsung adds an '
              'extra switch beyond stock Android — Step 4 below shows you '
              'exactly where to find it.',
              style: GoogleFonts.lato(
                fontSize: 12.5,
                color: AppColors.gold,
                fontWeight: FontWeight.w600,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final int number;
  final IconData icon;
  final String title;
  final String description;
  final String? samsungNote;
  final bool? status;
  final String actionLabel;
  final VoidCallback onAction;

  const _StepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    this.samsungNote,
    required this.status,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final isDone = status == true;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDone ? _green.withValues(alpha: 0.45) : _cardBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$number',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Icon(icon, size: 19, color: AppColors.gold),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _white,
                  ),
                ),
              ),
              _StatusChip(status: status),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Text(
              description,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: _grey,
                height: 1.5,
              ),
            ),
          ),
          if (samsungNote != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 42),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.gold.withValues(alpha: 0.18)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('📱', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        samsungNote!,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: _white.withValues(alpha: 0.78),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: onAction,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.gold,
                  side: BorderSide(color: AppColors.gold.withValues(alpha: 0.5)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  actionLabel,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
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

class _StatusChip extends StatelessWidget {
  final bool? status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    late final Color color;
    late final String label;
    if (status == null) {
      color = _grey;
      label = 'Checking…';
    } else if (status == true) {
      color = _green;
      label = 'Enabled';
    } else {
      color = AppColors.gold;
      label = 'Needed';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
