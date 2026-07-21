import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../locale_controller.dart';
import '../models/adhan_model.dart';
import '../services/notification_service.dart';
import '../services/prayer_state.dart';
import '../theme/app_theme.dart';
import '../theme/theme_controller.dart';
import 'notification_setup_screen.dart';
import 'settings_app_blocking_screen.dart';
import 'community_stories_screen.dart';
import 'settings_prayer_notifications_screen.dart';
import 'settings_privacy_screen.dart';
import 'settings_shared.dart';
import 'beginner_home_screen.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Prayer Settings
  String _calculationMethod = 'Muslim World League';

  // App Blocking
  bool _blockDuringPrayer = false;
  String _blockDuration = 'prayerWindow';

  // Appearance
  String _language = 'English';

  static const _calcMethods = [
    'Muslim World League',
    'ISNA',
    'Egyptian',
    'Makkah',
    'Karachi',
    'Tehran',
  ];

  static const _languages = [
    'English',
    'العربية',
    'اردو',
    'فارسی',
    'Español',
    'Deutsch',
    'Nederlands',
    'Português',
    'Italiano',
    'Français',
    'Bahasa Indonesia',
    '中文',
    '日本語',
    'বাংলা',
    'Türkçe',
    'Kiswahili',
    'Русский',
  ];

  static const _localeCodeMap = {
    'English': 'en',
    'العربية': 'ar',
    'اردو': 'ur',
    'فارسی': 'fa',
    'Español': 'es',
    'Deutsch': 'de',
    'Nederlands': 'nl',
    'Português': 'pt',
    'Italiano': 'it',
    'Français': 'fr',
    'Bahasa Indonesia': 'id',
    '中文': 'zh',
    '日本語': 'ja',
    'বাংলা': 'bn',
    'Türkçe': 'tr',
    'Kiswahili': 'sw',
    'Русский': 'ru',
  };

  static const _localeNameMap = {
    'en': 'English',
    'ar': 'العربية',
    'ur': 'اردو',
    'fa': 'فارسی',
    'es': 'Español',
    'de': 'Deutsch',
    'nl': 'Nederlands',
    'pt': 'Português',
    'it': 'Italiano',
    'fr': 'Français',
    'id': 'Bahasa Indonesia',
    'zh': '中文',
    'ja': '日本語',
    'bn': 'বাংলা',
    'tr': 'Türkçe',
    'sw': 'Kiswahili',
    'ru': 'Русский',
  };

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('app_locale') ?? 'en';
    if (mounted) setState(() => _language = _localeNameMap[code] ?? 'English');
  }

  Future<void> _showPicker({
    required String title,
    required List<String> options,
    required String current,
    required ValueChanged<String> onSelect,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _PickerSheet(
        title: title,
        options: options,
        current: current,
        onSelect: onSelect,
      ),
    );
  }

  Future<void> _showAdhanPicker() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _AdhanPickerSheet(),
    );
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1A1A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openPrivacyPolicy() async {
    final uri = Uri.parse(
        'https://devmanny117-star.github.io/-noorguard/privacy-policy');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      _snack(AppLocalizations.of(context)!.couldNotOpenPrivacyPolicy);
    }
  }

  Future<void> _openTermsOfService() async {
    final uri = Uri.parse(
        'https://devmanny117-star.github.io/-noorguard/terms-of-service');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      _snack(AppLocalizations.of(context)!.couldNotOpenTermsOfService);
    }
  }

  Future<void> _contactSupport() async {
    final uri = Uri.parse(
        'mailto:noorguard.support@gmail.com'
        '?subject=${Uri.encodeComponent('Noor Guard Support')}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (mounted) {
      _snack(AppLocalizations.of(context)!.couldNotOpenEmailApp);
    }
  }

  Future<void> _sendFeedbackEmail() async {
    final uri = Uri(scheme: 'mailto', path: 'noorguard.support@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (mounted) {
      _snack(AppLocalizations.of(context)!.couldNotOpenEmailApp);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = context.isDark;
    const cardColors = settingsNavyCardColors;
    final themeController = ThemeScope.of(context);
    final prayerState = context.watch<PrayerState>();
    final l10n = AppLocalizations.of(context)!;

    return ColoredBox(
      color: colors.background,
      child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ── Page title ─────────────────────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 4),
            child: Text(
              l10n.settings,
              style: GoogleFonts.playfairDisplay(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: settingsCream,
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 1 — PRAYER SETTINGS
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(child: SettingsSectionHeader(title: l10n.prayerSettings)),

        SliverToBoxAdapter(
          child: SettingsCard(
            colors: cardColors,
            children: [
              SettingsSelectRow(
                label: l10n.calculationMethod,
                value: _calculationMethod,
                colors: cardColors,
                onTap: () => _showPicker(
                  title: l10n.calculationMethod,
                  options: _calcMethods,
                  current: _calculationMethod,
                  onSelect: (v) => setState(() => _calculationMethod = v),
                ),
              ),
              const SettingsDivider(colors: cardColors),
              SettingsSelectRow(
                label: l10n.adhanSound,
                value: adhanStyleName(l10n, prayerState.selectedAdhanId),
                colors: cardColors,
                onTap: _showAdhanPicker,
              ),
              const SettingsDivider(colors: cardColors),
              SettingsSelectRow(
                label: l10n.prayerNotifications,
                value: prayerState.masterNotifications
                    ? l10n.statusOn
                    : l10n.statusOff,
                colors: cardColors,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        const SettingsPrayerNotificationsScreen(),
                  ),
                ),
              ),
              if (kDebugMode && !kIsWeb && Platform.isAndroid) ...[
                const SettingsDivider(colors: cardColors),
                SettingsActionRow(
                  label: l10n.testLockAlarmButton,
                  icon: Icons.fullscreen_rounded,
                  colors: cardColors,
                  onTap: () {
                    if (!prayerState.masterNotifications) {
                      _snack(l10n.testRequiresNotificationsOn);
                      return;
                    }
                    NotificationService().scheduleTestFullScreenAlarm(
                      adhanId: prayerState.selectedAdhanId,
                      prayers: prayerState.scheduledPrayerTimes ?? [],
                    );
                    _snack(l10n.testLockAlarmSnack);
                  },
                ),
              ],
              if (!kIsWeb && Platform.isAndroid) ...[
                const SettingsDivider(colors: cardColors),
                SettingsActionRow(
                  label: l10n.lockScreenSetupGuideButton,
                  icon: Icons.lock_clock_outlined,
                  colors: cardColors,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const NotificationSetupScreen(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 2 — APPEARANCE
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(child: SettingsSectionHeader(title: l10n.appearance)),

        SliverToBoxAdapter(
          child: SettingsCard(
            colors: cardColors,
            children: [
              SettingsToggleRow(
                label: l10n.darkMode,
                leadingIcon:
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                value: isDark,
                colors: cardColors,
                onChanged: (_) => themeController.toggle(isDark),
              ),
              const SettingsDivider(colors: cardColors),
              SettingsSelectRow(
                label: l10n.language,
                value: _language,
                colors: cardColors,
                onTap: () => _showPicker(
                  title: l10n.language,
                  options: _languages,
                  current: _language,
                  onSelect: (v) async {
                    setState(() => _language = v);
                    final code = _localeCodeMap[v] ?? 'en';
                    final localeScope = LocaleScope.of(context);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('app_locale', code);
                    if (mounted) {
                      localeScope.onLocaleChange(Locale(code));
                    }
                  },
                ),
              ),
              const SettingsDivider(colors: cardColors),
              SettingsToggleRow(
                label: l10n.beginnerMode,
                subtitle: l10n.beginnerModeSubtitle,
                leadingIcon: Icons.eco_outlined,
                value: prayerState.beginnerMode,
                colors: cardColors,
                onChanged: (v) {
                  context.read<PrayerState>().toggleBeginnerMode(v);
                  if (v) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (_) => const BeginnerHomeScreen()),
                      (route) => false,
                    );
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 3 — APP BLOCKING (Android only — no iOS support yet)
        // ══════════════════════════════════════════════════════════════
        if (kIsWeb || !Platform.isIOS) ...[
          SliverToBoxAdapter(
              child: SettingsSectionHeader(title: l10n.appBlocking)),

          SliverToBoxAdapter(
            child: SettingsCard(
              colors: cardColors,
              children: [
                SettingsSelectRow(
                  label: l10n.appBlocking,
                  value: _blockDuringPrayer ? l10n.statusOn : l10n.statusOff,
                  colors: cardColors,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SettingsAppBlockingScreen(
                        blockDuringPrayer: _blockDuringPrayer,
                        blockDuration: _blockDuration,
                        onBlockDuringPrayerChanged: (v) =>
                            setState(() => _blockDuringPrayer = v),
                        onBlockDurationChanged: (v) =>
                            setState(() => _blockDuration = v),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 28)),
        ],

        // ══════════════════════════════════════════════════════════════
        // SECTION 4 — PRIVACY & TRUST
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(child: SettingsSectionHeader(title: l10n.privacyAndTrust)),

        SliverToBoxAdapter(
          child: SettingsCard(
            colors: cardColors,
            children: [
              SettingsActionRow(
                label: l10n.privacyAndTrust,
                icon: Icons.shield_rounded,
                colors: cardColors,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SettingsPrivacyScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 5 — OUR STORIES (community)
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(child: SettingsSectionHeader(title: l10n.ourStories)),

        SliverToBoxAdapter(
          child: SettingsCard(
            colors: cardColors,
            children: [
              SettingsActionRow(
                label: l10n.communityStories,
                icon: Icons.people_alt_outlined,
                colors: cardColors,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CommunityStoriesScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 6 — ABOUT
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(child: SettingsSectionHeader(title: l10n.aboutNoorGuard)),

        SliverToBoxAdapter(
          child: SettingsCard(
            colors: cardColors,
            children: [
              _InfoRow(
                label: l10n.version,
                value: '1.0.0',
                colors: cardColors,
              ),
              const SettingsDivider(colors: cardColors),
              SettingsActionRow(
                label: l10n.rateApp,
                icon: Icons.star_outline_rounded,
                colors: cardColors,
                onTap: () => _snack(l10n.openingAppStore),
              ),
              const SettingsDivider(colors: cardColors),
              SettingsActionRow(
                label: l10n.shareApp,
                icon: Icons.share_outlined,
                colors: cardColors,
                onTap: () => _snack(l10n.openingShareSheet),
              ),
              const SettingsDivider(colors: cardColors),
              SettingsActionRow(
                label: l10n.contactSupport,
                icon: Icons.mail_outline_rounded,
                colors: cardColors,
                onTap: _contactSupport,
              ),
              const SettingsDivider(colors: cardColors),
              SettingsActionRow(
                label: l10n.privacyPolicy,
                icon: Icons.shield_outlined,
                colors: cardColors,
                onTap: _openPrivacyPolicy,
              ),
              const SettingsDivider(colors: cardColors),
              SettingsActionRow(
                label: l10n.termsOfService,
                icon: Icons.description_outlined,
                colors: cardColors,
                onTap: _openTermsOfService,
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // TRANSLATION FEEDBACK BANNER
        // ══════════════════════════════════════════════════════════════
        SliverToBoxAdapter(
          child: _TranslationDisclaimerCard(
            l10n: l10n,
            onEmailTap: _sendFeedbackEmail,
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 52)),
      ],
    ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TRANSLATION FEEDBACK BANNER
// ─────────────────────────────────────────────────────────────────────────────

class _TranslationDisclaimerCard extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onEmailTap;

  const _TranslationDisclaimerCard({
    required this.l10n,
    required this.onEmailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.gold.withValues(alpha: 0.35)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lightbulb_outline,
                size: 18,
                color: AppColors.gold,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.helpUsImprove,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: onEmailTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.mail_outline_rounded,
                            size: 15,
                            color: AppColors.gold,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'noorguard.support@gmail.com',
                            style: GoogleFonts.lato(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final AppColorScheme colors;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: colors.primaryText,
              ),
            ),
          ),
          Text(
            value,
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

// ─────────────────────────────────────────────────────────────────────────────
// OPTION PICKER BOTTOM SHEET
// ─────────────────────────────────────────────────────────────────────────────

class _PickerSheet extends StatelessWidget {
  final String title;
  final List<String> options;
  final String current;
  final ValueChanged<String> onSelect;

  const _PickerSheet({
    required this.title,
    required this.options,
    required this.current,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: settingsBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: settingsCream,
                ),
              ),
              const SizedBox(height: 8),
              ...options.map((opt) {
                final isSelected = opt == current;
                return InkWell(
                  onTap: () {
                    onSelect(opt);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            opt,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColors.gold
                                  : settingsCream,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: AppColors.gold,
                          ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ADHAN PICKER BOTTOM SHEET — shares adhanStyles + PrayerState with AdhanScreen
// ─────────────────────────────────────────────────────────────────────────────

class _AdhanPickerSheet extends StatefulWidget {
  const _AdhanPickerSheet();

  @override
  State<_AdhanPickerSheet> createState() => _AdhanPickerSheetState();
}

class _AdhanPickerSheetState extends State<_AdhanPickerSheet> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _playingId;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _playingId = null);
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _selectAndPreview(AdhanStyle style) async {
    context.read<PrayerState>().setSelectedAdhan(style.id);
    await _audioPlayer.stop();
    setState(() => _playingId = style.id);
    await _audioPlayer.play(UrlSource(style.audioUrl));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedId = context.watch<PrayerState>().selectedAdhanId;
    final maxHeight = MediaQuery.of(context).size.height * 0.75;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: settingsBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.adhanSound,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: settingsCream,
                ),
              ),
              const SizedBox(height: 8),
              ...adhanStyles.map((style) {
                final isSelected = style.id == selectedId;
                final isPlaying = _playingId == style.id;
                return InkWell(
                  onTap: () => _selectAndPreview(style),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isPlaying
                              ? Icons.pause_circle_filled_rounded
                              : Icons.play_circle_fill_rounded,
                          size: 28,
                          color: AppColors.gold,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                adhanStyleName(l10n, style.id),
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.gold
                                      : settingsCream,
                                ),
                              ),
                              Text(
                                style.arabicName,
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 14,
                                  color: settingsCream.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: AppColors.gold,
                          ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }
}
