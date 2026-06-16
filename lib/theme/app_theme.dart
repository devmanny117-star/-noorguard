import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const cream = Color(0xFFF5EFE6);
  static const softCream = Color(0xFFFAF5EE);
  static const gold = Color(0xFFC9A84C);
  static const lightGold = Color(0xFFE8D5A3);
  static const mutedGold = Color(0xFFA08532);
  static const deepGreen = Color(0xFF1B5E20);
  static const mediumGreen = Color(0xFF2E7D32);
  static const darkText = Color(0xFF2C2C2A);
  static const mutedText = Color(0xFF7A7570);
  static const divider = Color(0xFFE8DFD0);
  static const cardBackground = Color(0xFFFFFFFF);
  static const heroSkyTop = Color(0xFF1A0A3E);
  static const heroSkyMid = Color(0xFF3D1C6B);
  static const heroHorizon = Color(0xFFB5541A);
  static const heroGlow = Color(0xFFE8841A);
}

// Theme-aware color set registered as a ThemeExtension.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.background,
    required this.warmBg,
    required this.cardBg,
    required this.secondaryBg,
    required this.primaryText,
    required this.secondaryText,
    required this.border,
  });

  final Color background;
  final Color warmBg;     // cream surfaces in light; dark bg in dark
  final Color cardBg;     // white cards in light; #1A1A1A in dark
  final Color secondaryBg;// F5F5F5 pills/search in light; #2A2A2A in dark
  final Color primaryText;
  final Color secondaryText;
  final Color border;

  static const light = AppColorScheme(
    background: Color(0xFFFFFFFF),
    warmBg: Color(0xFFF5EFE6),
    cardBg: Color(0xFFFFFFFF),
    secondaryBg: Color(0xFFF5F5F5),
    primaryText: Color(0xFF2C2C2A),
    secondaryText: Color(0xFF7A7570),
    border: Color(0xFFEEEEEE),
  );

  static const dark = AppColorScheme(
    background: Color(0xFF0D0D0D),
    warmBg: Color(0xFF0D0D0D),
    cardBg: Color(0xFF1A1A1A),
    secondaryBg: Color(0xFF2A2A2A),
    primaryText: Color(0xFFF5F5F0),
    secondaryText: Color(0xFF8A8A8A),
    border: Color(0xFF2A2A2A),
  );

  @override
  AppColorScheme copyWith({
    Color? background,
    Color? warmBg,
    Color? cardBg,
    Color? secondaryBg,
    Color? primaryText,
    Color? secondaryText,
    Color? border,
  }) =>
      AppColorScheme(
        background: background ?? this.background,
        warmBg: warmBg ?? this.warmBg,
        cardBg: cardBg ?? this.cardBg,
        secondaryBg: secondaryBg ?? this.secondaryBg,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
        border: border ?? this.border,
      );

  @override
  AppColorScheme lerp(AppColorScheme? other, double t) {
    if (other == null) return this;
    return AppColorScheme(
      background: Color.lerp(background, other.background, t)!,
      warmBg: Color.lerp(warmBg, other.warmBg, t)!,
      cardBg: Color.lerp(cardBg, other.cardBg, t)!,
      secondaryBg: Color.lerp(secondaryBg, other.secondaryBg, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}

extension AppColorSchemeX on BuildContext {
  AppColorScheme get appColors =>
      Theme.of(this).extension<AppColorScheme>()!;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.gold,
        brightness: Brightness.light,
        surface: Colors.white,
        primary: AppColors.deepGreen,
        secondary: AppColors.gold,
      ),
      scaffoldBackgroundColor: Colors.white,
      extensions: const [AppColorScheme.light],
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.darkText,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColors.darkText,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
        headlineMedium: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.darkText,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          color: AppColors.darkText,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          color: AppColors.mutedText,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lightGold.withValues(alpha: 0.35),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.gold,
            );
          }
          return GoogleFonts.lato(fontSize: 11, color: AppColors.mutedText);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.gold, size: 24);
          }
          return const IconThemeData(color: AppColors.mutedText, size: 22);
        }),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static ThemeData get dark {
    const primaryText = Color(0xFFF5F5F0);
    const secondaryText = Color(0xFF8A8A8A);
    const cardBg = Color(0xFF1A1A1A);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.gold,
        brightness: Brightness.dark,
        surface: cardBg,
        primary: AppColors.deepGreen,
        secondary: AppColors.gold,
      ),
      scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      extensions: const [AppColorScheme.dark],
      textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: primaryText,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineMedium: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
        bodyLarge: GoogleFonts.lato(fontSize: 16, color: primaryText),
        bodyMedium: GoogleFonts.lato(fontSize: 14, color: secondaryText),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cardBg,
        indicatorColor: AppColors.gold.withValues(alpha: 0.15),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.gold,
            );
          }
          return GoogleFonts.lato(fontSize: 11, color: secondaryText);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.gold, size: 24);
          }
          return const IconThemeData(color: secondaryText, size: 22);
        }),
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
