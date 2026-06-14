import 'dart:math' show cos, sin, pi;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/adhan_screen.dart';
import '../../screens/app_blocking_screen.dart';
import '../../screens/asma_ul_husna_screen.dart';
import '../../screens/duas_screen.dart';
import '../../screens/focus_mode_screen.dart';
import '../../screens/islamic_calendar_screen.dart';
import '../../screens/lock_screen.dart';
import '../../screens/new_muslim_hub_screen.dart';
import '../../screens/tafsir_screen.dart';
import '../../models/surah_model.dart';
import '../../theme/app_theme.dart';
import '../../l10n/app_localizations.dart';

// Default surah opened by the "Tafsir" tile — Al-Faatiha, which has full
// Ibn Kathir commentary in tafsirData.
const _alFatiha = Surah(
  number: 1,
  name: 'سُورَةُ الْفَاتِحَة',
  englishName: 'Al-Faatiha',
  englishNameTranslation: 'The Opening',
  numberOfAyahs: 7,
  revelationType: 'Meccan',
);

class _TileData {
  final String id;
  final String label;
  final IconData icon;
  final String subtitle;

  const _TileData({
    required this.id,
    required this.label,
    required this.icon,
    required this.subtitle,
  });
}

List<_TileData> _row1(AppLocalizations l10n) => [
  _TileData(id: 'Tafsir', label: l10n.tafsir, icon: Icons.import_contacts_rounded, subtitle: l10n.commentary),
  _TileData(id: 'Duas', label: l10n.duas, icon: Icons.auto_stories_rounded, subtitle: l10n.dailySupplications),
  _TileData(id: 'Lock Screen', label: l10n.lockScreen, icon: Icons.lock_outline_rounded, subtitle: l10n.reminders),
  _TileData(id: 'Focus Mode', label: l10n.focusMode, icon: Icons.hourglass_empty_rounded, subtitle: l10n.blockDistractions),
];

List<_TileData> _row2(AppLocalizations l10n) => [
  _TileData(id: 'App Blocking', label: l10n.appBlocking, icon: Icons.security_rounded, subtitle: l10n.prayerGuard),
  _TileData(id: 'Islamic Calendar', label: l10n.islamicCalendar, icon: Icons.calendar_month_rounded, subtitle: l10n.importantDates),
  _TileData(id: 'Asma Ul Husna', label: l10n.asmaUlHusnaTile, icon: Icons.star_rounded, subtitle: l10n.asmaUlHusnaTileSubtitle),
  _TileData(id: 'Adhan', label: l10n.adhan, icon: Icons.mosque_rounded, subtitle: l10n.adhanSubtitle),
];


class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Column(
        children: [
          _TileRow(tiles: _row1(l10n)),
          const SizedBox(height: 10),
          _TileRow(tiles: _row2(l10n)),
        ],
      ),
    );
  }
}

class _TileRow extends StatelessWidget {
  final List<_TileData?> tiles;
  const _TileRow({required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tiles.length, (i) {
        final tile = tiles[i];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
            child: tile != null ? _FeatureTile(data: tile) : const SizedBox(),
          ),
        );
      }),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final _TileData data;
  const _FeatureTile({required this.data});

  void _navigate(BuildContext context) {
    Widget? screen;
    if (data.id == 'Tafsir') screen = const TafsirScreen(surah: _alFatiha);
    if (data.id == 'Lock Screen') screen = const LockScreenPreview();
    if (data.id == 'Focus Mode') screen = const FocusModeScreen();
    if (data.id == 'App Blocking') screen = const AppBlockingScreen();
    if (data.id == 'Islamic Calendar') screen = const IslamicCalendarScreen();
    if (data.id == 'Duas') screen = const DuasScreen();
    if (data.id == 'Asma Ul Husna') screen = const AsmaUlHusnaScreen();
    if (data.id == 'Adhan') screen = const AdhanScreen();
    if (screen != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen!));
    } else {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${data.label} — ${l10n.comingSoon}',
            style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: context.appColors.primaryText,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return GestureDetector(
      onTap: () => _navigate(context),
      child: Container(
        height: 108,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(data.icon, color: AppColors.gold, size: 36),
            const SizedBox(height: 7),
            Text(
              data.label,
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: colors.primaryText,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              data.subtitle,
              style: GoogleFonts.lato(
                fontSize: 9.5,
                color: colors.secondaryText,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class RevertCornerCard extends StatelessWidget {
  const RevertCornerCard({super.key});

  Widget _previewBadge(String emoji) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFD4AF37).withValues(alpha: 0.25),
        ),
      ),
      child: Center(
        child: Text(emoji, style: const TextStyle(fontSize: 15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const NewMuslimHubScreen()),
      ),
      child: Container(
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFD4AF37).withValues(alpha: 0.35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // ── Islamic geometric pattern background ───────────────────
              const Positioned.fill(
                child: CustomPaint(
                  painter: _GeometricPatternPainter(),
                ),
              ),
              // ── Content ────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Crescent moon icon
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFD4AF37).withValues(alpha: 0.14),
                        border: Border.all(
                          color: const Color(0xFFD4AF37).withValues(alpha: 0.45),
                        ),
                      ),
                      child: const Icon(
                        Icons.nightlight_rounded,
                        color: Color(0xFFD4AF37),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Title + subtitle
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.revertCorner,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${l10n.subtitleYourGuideToIslam} 🌙',
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              color: const Color(0xFFD4AF37),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Preview emoji badges + arrow
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _previewBadge('📖'),
                            const SizedBox(width: 6),
                            _previewBadge('🧭'),
                            const SizedBox(width: 6),
                            _previewBadge('🤲'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: const Color(0xFFD4AF37).withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Islamic Geometric Pattern Painter ─────────────────────────────────────────

class _GeometricPatternPainter extends CustomPainter {
  const _GeometricPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37).withValues(alpha: 0.07)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    const r = 13.0;
    const spacing = 52.0;

    for (double y = 0; y <= size.height + r; y += spacing) {
      for (double x = 0; x <= size.width + r; x += spacing) {
        _drawEightPointedStar(canvas, Offset(x, y), r, paint);
      }
    }
  }

  void _drawEightPointedStar(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (int i = 0; i < 16; i++) {
      final angle = i * pi / 8 - pi / 2;
      final radius = i.isEven ? r : r * 0.38;
      final x = c.dx + cos(angle) * radius;
      final y = c.dy + sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_GeometricPatternPainter old) => false;
}
