import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

const settingsBg = Color(0xFF0D1B2A);
const settingsCardNavy = Color(0xFF1B2E45);
const settingsCardNavySecondary = Color(0xFF132338);
const settingsCream = Color(0xFFF5EFE6);

const settingsNavyCardColors = AppColorScheme(
  background: settingsBg,
  warmBg: settingsBg,
  cardBg: settingsCardNavy,
  secondaryBg: settingsCardNavySecondary,
  primaryText: settingsCream,
  secondaryText: Color(0xB3F5EFE6),
  border: Color(0x33C9A84C),
);

// ─────────────────────────────────────────────────────────────────────────────
// SUB-SCREEN SCAFFOLD
// ─────────────────────────────────────────────────────────────────────────────

/// Shared scaffold for Settings sub-screens, keeping the navy/gold premium
/// look consistent with the main Settings page.
class SettingsSubScreenScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSubScreenScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: settingsBg,
      appBar: AppBar(
        backgroundColor: settingsBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.gold),
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: settingsCream,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 12, bottom: 40),
          children: children,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LAYOUT HELPERS
// ─────────────────────────────────────────────────────────────────────────────

class SettingsSectionHeader extends StatelessWidget {
  final String title;
  const SettingsSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.gold,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gold.withValues(alpha: 0.6),
                  AppColors.gold.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final List<Widget> children;
  final AppColorScheme colors;

  const SettingsCard({
    super.key,
    required this.children,
    this.colors = settingsNavyCardColors,
  });

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

class SettingsDivider extends StatelessWidget {
  final AppColorScheme colors;
  const SettingsDivider({super.key, this.colors = settingsNavyCardColors});

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

class SettingsToggleRow extends StatelessWidget {
  final String label;
  final String? subtitle;
  final IconData? leadingIcon;
  final bool value;
  final AppColorScheme colors;
  final ValueChanged<bool> onChanged;

  const SettingsToggleRow({
    super.key,
    required this.label,
    this.subtitle,
    this.leadingIcon,
    required this.value,
    this.colors = settingsNavyCardColors,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 19, color: AppColors.gold),
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

class SettingsSelectRow extends StatelessWidget {
  final String label;
  final String value;
  final AppColorScheme colors;
  final VoidCallback onTap;

  const SettingsSelectRow({
    super.key,
    required this.label,
    required this.value,
    this.colors = settingsNavyCardColors,
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
              color: AppColors.gold.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPrayerRow extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool value;
  final bool enabled;
  final AppColorScheme colors;
  final ValueChanged<bool> onChanged;

  const SettingsPrayerRow({
    super.key,
    required this.name,
    required this.icon,
    required this.value,
    required this.enabled,
    this.colors = settingsNavyCardColors,
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

class SettingsActionRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final AppColorScheme colors;
  final VoidCallback onTap;

  const SettingsActionRow({
    super.key,
    required this.label,
    required this.icon,
    this.colors = settingsNavyCardColors,
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
            Icon(icon, size: 19, color: AppColors.gold),
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
              color: AppColors.gold.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
