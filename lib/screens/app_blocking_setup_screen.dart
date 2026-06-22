import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../services/app_blocking_service.dart';
import '../theme/app_theme.dart';

// Same fixed dark palette as notification_setup_screen.dart.
const _bg = Color(0xFF0D1B2A);
const _cardBg = Color(0xFF152535);
const _cardBorder = Color(0xFF1E3348);
const _white = Color(0xFFF5F5F0);
const _grey = Color(0xFF8A9BB0);
const _green = Color(0xFF2E7D32);

/// One-time (re-visitable) walkthrough for the Accessibility permission App
/// Blocking depends on to notice when a blocked app opens. Mirrors
/// `NotificationSetupScreen`'s pattern (dark palette, re-check on resume)
/// since there's only this one permission to grant here.
class AppBlockingSetupScreen extends StatefulWidget {
  const AppBlockingSetupScreen({super.key});

  @override
  State<AppBlockingSetupScreen> createState() => _AppBlockingSetupScreenState();
}

class _AppBlockingSetupScreenState extends State<AppBlockingSetupScreen>
    with WidgetsBindingObserver {
  bool? _accessibilityEnabled;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Accessibility access is granted in system Settings, outside the app.
    if (state == AppLifecycleState.resumed) _refreshStatus();
  }

  Future<void> _refreshStatus() async {
    final enabled = await AppBlockingService().isAccessibilityServiceEnabled();
    if (!mounted) return;
    setState(() => _accessibilityEnabled = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDone = _accessibilityEnabled == true;

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
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
                        child: const Icon(Icons.shield_moon_rounded,
                            color: AppColors.gold, size: 26),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          l10n.appBlockingSetupHeadline,
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
                    l10n.appBlockingSetupBody,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: _grey,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
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
                            const Icon(Icons.accessibility_new_rounded,
                                size: 22, color: AppColors.gold),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                isDone
                                    ? l10n.appBlockingAccessibilityStatusOn
                                    : l10n.appBlockingAccessibilityStatusOff,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: _white,
                                ),
                              ),
                            ),
                            _StatusChip(isDone: isDone),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: OutlinedButton(
                            onPressed: () async {
                              await AppBlockingService().openAccessibilitySettings();
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.gold,
                              side: BorderSide(
                                  color: AppColors.gold.withValues(alpha: 0.5)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              l10n.appBlockingOpenSettings,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(isDone),
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
                      isDone ? l10n.done : l10n.appBlockingSetupNotNow,
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

class _StatusChip extends StatelessWidget {
  final bool isDone;
  const _StatusChip({required this.isDone});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = isDone ? _green : AppColors.gold;
    final label = isDone ? l10n.notifSetupStatusEnabled : l10n.notifSetupStatusNeeded;

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
