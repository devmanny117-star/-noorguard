import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../locale_controller.dart';
import '../models/adhan_model.dart';
import '../services/adhan_foreground_controller.dart';
import '../services/notification_service.dart';
import '../services/prayer_state.dart';
import '../theme/app_theme.dart';
import '../theme/theme_controller.dart';

// Navy/gold palette matching the prayer card and dark-mode aesthetic.
// Settings cards use this even in light mode for a premium, consistent feel.
const _cardNavy = Color(0xFF0D1B2A);
const _cardNavySecondary = Color(0xFF1A2A3A);
const _cardNavyBorder = Color(0x26D4AF37);

const _navyCardColors = AppColorScheme(
  background: _cardNavy,
  warmBg: _cardNavy,
  cardBg: _cardNavy,
  secondaryBg: _cardNavySecondary,
  primaryText: Color(0xFFF5F5F0),
  secondaryText: Color(0xFF8A9BB0),
  border: _cardNavyBorder,
);

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
  String _blockDuration = 'Prayer window only';

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

  static const _durations = ['30 min', '1 hour', 'Prayer window only'];

  static const _languages = [
    'English',
    'العربية',
    'اردو',
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
  ];

  static const _localeCodeMap = {
    'English': 'en',
    'العربية': 'ar',
    'اردو': 'ur',
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
  };

  static const _localeNameMap = {
    'en': 'English',
    'ar': 'العربية',
    'ur': 'اردو',
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
      _snack('Could not open Privacy Policy');
    }
  }

  Future<void> _sendFeedbackEmail() async {
    final uri = Uri(scheme: 'mailto', path: 'devmanny117@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (mounted) {
      _snack('Could not open email app');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = context.isDark;
    final cardColors = isDark ? colors : _navyCardColors;
    final themeController = ThemeScope.of(context);
    final prayerState = context.watch<PrayerState>();
    final l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
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
                color: colors.primaryText,
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 1 — PRAYER SETTINGS
        // ══════════════════════════════════════════════════════════════
        _SectionHeader(title: l10n.prayerSettings),

        SliverToBoxAdapter(
          child: _Card(
            colors: cardColors,
            children: [
              _SelectRow(
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
              _Divider(colors: cardColors),
              _SelectRow(
                label: l10n.adhanSound,
                value: adhanStyleName(l10n, prayerState.selectedAdhanId),
                colors: cardColors,
                onTap: _showAdhanPicker,
              ),
              _Divider(colors: cardColors),
              _ToggleRow(
                label: l10n.prayerNotifications,
                value: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: prayerState.toggleMasterNotifications,
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: 'Send Test Notification (10s)',
                icon: Icons.notifications_active_outlined,
                colors: cardColors,
                onTap: () {
                  NotificationService().scheduleTestNotification(
                    adhanId: prayerState.selectedAdhanId,
                  );
                  _snack('Test notification will arrive in 10 seconds');
                },
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: 'Test Adhan In-App (foreground)',
                icon: Icons.volume_up_outlined,
                colors: cardColors,
                onTap: () {
                  AdhanForegroundController().simulateForegroundPrayer();
                  _snack('Playing the full adhan with a silent banner');
                },
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        // Individual prayer toggles
        SliverToBoxAdapter(
          child: _Card(
            colors: cardColors,
            children: [
              _PrayerRow(
                name: l10n.fajr,
                icon: Icons.wb_twilight_rounded,
                value: prayerState.notifications['fajr'] ?? true,
                enabled: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: (v) =>
                    prayerState.togglePrayerNotification('fajr', v),
              ),
              _Divider(colors: cardColors),
              _PrayerRow(
                name: l10n.dhuhr,
                icon: Icons.wb_sunny_rounded,
                value: prayerState.notifications['dhuhr'] ?? true,
                enabled: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: (v) =>
                    prayerState.togglePrayerNotification('dhuhr', v),
              ),
              _Divider(colors: cardColors),
              _PrayerRow(
                name: l10n.asr,
                icon: Icons.light_mode_outlined,
                value: prayerState.notifications['asr'] ?? true,
                enabled: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: (v) =>
                    prayerState.togglePrayerNotification('asr', v),
              ),
              _Divider(colors: cardColors),
              _PrayerRow(
                name: l10n.maghrib,
                icon: Icons.nights_stay_rounded,
                value: prayerState.notifications['maghrib'] ?? true,
                enabled: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: (v) =>
                    prayerState.togglePrayerNotification('maghrib', v),
              ),
              _Divider(colors: cardColors),
              _PrayerRow(
                name: l10n.isha,
                icon: Icons.nightlight_rounded,
                value: prayerState.notifications['isha'] ?? true,
                enabled: prayerState.masterNotifications,
                colors: cardColors,
                onChanged: (v) =>
                    prayerState.togglePrayerNotification('isha', v),
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 2 — APPEARANCE
        // ══════════════════════════════════════════════════════════════
        _SectionHeader(title: l10n.appearance),

        SliverToBoxAdapter(
          child: _Card(
            colors: cardColors,
            children: [
              _ToggleRow(
                label: l10n.darkMode,
                leadingIcon:
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                value: isDark,
                colors: cardColors,
                onChanged: (_) => themeController.toggle(isDark),
              ),
              _Divider(colors: cardColors),
              _SelectRow(
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
              _Divider(colors: cardColors),
              _ToggleRow(
                label: l10n.beginnerMode,
                subtitle: l10n.beginnerModeSubtitle,
                leadingIcon: Icons.eco_outlined,
                value: prayerState.beginnerMode,
                colors: cardColors,
                onChanged: (v) {
                  context.read<PrayerState>().toggleBeginnerMode(v);
                  if (v) _snack(l10n.beginnerModeOn);
                },
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 3 — APP BLOCKING
        // ══════════════════════════════════════════════════════════════
        _SectionHeader(title: l10n.appBlocking),

        SliverToBoxAdapter(
          child: _Card(
            colors: cardColors,
            children: [
              _ToggleRow(
                label: 'Block during prayer times',
                leadingIcon: Icons.security_rounded,
                value: _blockDuringPrayer,
                colors: cardColors,
                onChanged: (v) => setState(() => _blockDuringPrayer = v),
              ),
            ],
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        // Block duration pills
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Block duration',
                  style: GoogleFonts.lato(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: cardColors.secondaryText,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: List.generate(_durations.length, (i) {
                    final d = _durations[i];
                    final selected = _blockDuration == d;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: i < _durations.length - 1 ? 8 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () => setState(() => _blockDuration = d),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                            height: 44,
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.gold.withValues(alpha: 0.12)
                                  : cardColors.cardBg,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: selected
                                    ? AppColors.gold
                                    : cardColors.border,
                                width: selected ? 1.5 : 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                d,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: selected
                                      ? AppColors.gold
                                      : cardColors.secondaryText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 4 — PRIVACY & TRUST
        // ══════════════════════════════════════════════════════════════
        const _SectionHeader(title: 'Privacy & Trust'),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColors.cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.gold.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.shield_rounded,
                        size: 17,
                        color: AppColors.gold,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.privacyPromiseTitle,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.gold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    l10n.privacyPromiseBody,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: cardColors.primaryText,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    height: 0.8,
                    color: AppColors.gold.withValues(alpha: 0.25),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '"If it doesn\'t belong in a masjid,\nit doesn\'t belong in Noor Guard."',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 13.5,
                      fontStyle: FontStyle.italic,
                      color: AppColors.gold,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 28)),

        // ══════════════════════════════════════════════════════════════
        // SECTION 5 — ABOUT
        // ══════════════════════════════════════════════════════════════
        _SectionHeader(title: l10n.aboutNoorGuard),

        SliverToBoxAdapter(
          child: _Card(
            colors: cardColors,
            children: [
              _InfoRow(
                label: l10n.version,
                value: '1.0.0',
                colors: cardColors,
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: l10n.rateApp,
                icon: Icons.star_outline_rounded,
                colors: cardColors,
                onTap: () => _snack('Opening App Store…'),
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: l10n.shareApp,
                icon: Icons.share_outlined,
                colors: cardColors,
                onTap: () => _snack('Opening share sheet…'),
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: l10n.contactSupport,
                icon: Icons.mail_outline_rounded,
                colors: cardColors,
                onTap: () => _snack('Opening support email…'),
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: l10n.privacyPolicy,
                icon: Icons.shield_outlined,
                colors: cardColors,
                onTap: _openPrivacyPolicy,
              ),
              _Divider(colors: cardColors),
              _ActionRow(
                label: l10n.termsOfService,
                icon: Icons.description_outlined,
                colors: cardColors,
                onTap: () => _snack('Opening Terms of Service…'),
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
                  const SizedBox(height: 6),
                  Text(
                    l10n.translationDisclaimer,
                    style: GoogleFonts.lato(
                      fontSize: 12.5,
                      height: 1.4,
                      color: Colors.white.withValues(alpha: 0.7),
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
                            'devmanny117@gmail.com',
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

// ─────────────────────────────────────────────────────────────────────────────
// LAYOUT HELPERS
// ─────────────────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 8),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  final AppColorScheme colors;

  const _Card({required this.children, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: colors.cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  final AppColorScheme colors;
  const _Divider({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.only(left: 20),
      color: colors.border,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ROW TYPES
// ─────────────────────────────────────────────────────────────────────────────

class _ToggleRow extends StatelessWidget {
  final String label;
  final String? subtitle;
  final IconData? leadingIcon;
  final bool value;
  final AppColorScheme colors;
  final ValueChanged<bool> onChanged;

  const _ToggleRow({
    required this.label,
    this.subtitle,
    this.leadingIcon,
    required this.value,
    required this.colors,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 19, color: colors.secondaryText),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: subtitle != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: colors.primaryText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: colors.secondaryText,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  )
                : Text(
                    label,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: colors.primaryText,
                    ),
                  ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.gold;
              }
              return colors.secondaryBg;
            }),
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}

class _SelectRow extends StatelessWidget {
  final String label;
  final String value;
  final AppColorScheme colors;
  final VoidCallback onTap;

  const _SelectRow({
    required this.label,
    required this.value,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: AppColors.gold,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: colors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerRow extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool value;
  final bool enabled;
  final AppColorScheme colors;
  final ValueChanged<bool> onChanged;

  const _PrayerRow({
    required this.name,
    required this.icon,
    required this.value,
    required this.enabled,
    required this.colors,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final active = enabled && value;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: active
                  ? AppColors.gold.withValues(alpha: 0.12)
                  : colors.secondaryBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 17,
              color: active ? AppColors.gold : colors.secondaryText,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: enabled ? colors.primaryText : colors.secondaryText,
              ),
            ),
          ),
          Switch(
            value: active,
            onChanged: enabled ? onChanged : null,
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (!enabled) return colors.border;
              if (states.contains(WidgetState.selected)) return AppColors.gold;
              return colors.secondaryBg;
            }),
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
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

class _ActionRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final AppColorScheme colors;
  final VoidCallback onTap;

  const _ActionRow({
    required this.label,
    required this.icon,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Icon(icon, size: 19, color: colors.secondaryText),
            const SizedBox(width: 12),
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
            Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: colors.secondaryText,
            ),
          ],
        ),
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
    final colors = context.appColors;
    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              // Handle bar
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colors.primaryText,
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
                                  : colors.primaryText,
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
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final selectedId = context.watch<PrayerState>().selectedAdhanId;
    final maxHeight = MediaQuery.of(context).size.height * 0.75;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              // Handle bar
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.adhanSound,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colors.primaryText,
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
                                      : colors.primaryText,
                                ),
                              ),
                              Text(
                                style.arabicName,
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 14,
                                  color: colors.secondaryText,
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
