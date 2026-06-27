import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../geometric_pattern_painter.dart';
import '../../screens/adhan_screen.dart';
import '../../screens/app_blocking_screen.dart';
import '../../screens/asma_ul_husna_screen.dart';
import '../../screens/duas_screen.dart';
import '../../screens/focus_mode_screen.dart';
import '../../screens/islamic_calendar_screen.dart';
import '../../screens/new_muslim_hub_screen.dart';
import '../../screens/tafsir_of_the_day_screen.dart';
import '../../screens/tasbih_screen.dart';
import '../../theme/app_theme.dart';
import '../../l10n/app_localizations.dart';

// ── Constants ─────────────────────────────────────────────────────────────────

const _kGold        = Color(0xFFD4AF37);
const _kBorderGold  = Color(0xFFC9A84C);
const _kCardTop     = Color(0xFF101E31);
const _kCardBottom  = Color(0xFF081321);
const _kBg          = Color(0xFF0D1B2A);

// ── Public API ────────────────────────────────────────────────────────────────

/// Premium feature grid: two rows of four cards, separated by a gold divider.
class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  void _navigate(BuildContext context, String id, String label) {
    Widget? screen;
    if (id == 'Tafsir')           screen = const TafsirOfTheDayScreen();
    if (id == 'Duas')             screen = const DuasScreen();
    if (id == 'Tasbih Counter')   screen = const TasbihScreen();
    if (id == 'Focus Mode')       screen = const FocusModeScreen();
    if (id == 'App Blocking')     screen = const AppBlockingScreen();
    if (id == 'Islamic Calendar') screen = const IslamicCalendarScreen();
    if (id == 'Asma Ul Husna')   screen = const AsmaUlHusnaScreen();
    if (id == 'Adhan')            screen = const AdhanScreen();

    if (screen != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen!));
    } else {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$label — ${l10n.comingSoon}',
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
    final l10n = AppLocalizations.of(context)!;

    final row1 = [
      (id: 'Tafsir',         icon: Icons.auto_stories_rounded,    label: l10n.tafsirOfTheDay),
      (id: 'Duas',           icon: Icons.volunteer_activism_rounded, label: l10n.duas),
      (id: 'Tasbih Counter', icon: Icons.touch_app_rounded,        label: l10n.tasbihCounter),
      (id: 'Focus Mode',     icon: Icons.hourglass_empty_rounded,  label: l10n.focusMode),
    ];

    final row2 = [
      (id: 'App Blocking',     icon: Icons.security_rounded,       label: l10n.appBlocking),
      (id: 'Islamic Calendar', icon: Icons.calendar_month_rounded, label: l10n.islamicCalendar),
      (id: 'Asma Ul Husna',   icon: Icons.star_rounded,           label: l10n.asmaUlHusnaTile),
      (id: 'Adhan',            icon: Icons.mosque_rounded,         label: l10n.adhan),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _kBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _kBorderGold.withValues(alpha: 0.60),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            _CardRow(
              items: row1,
              onTap: (id, label) => _navigate(context, id, label),
            ),
            const SizedBox(height: 16),
            // Gold divider with diamond ornament
            const _GoldDivider(),
            const SizedBox(height: 16),
            // Row 2
            _CardRow(
              items: row2,
              onTap: (id, label) => _navigate(context, id, label),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single premium feature card — square, dark gradient, gold icon + label.
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_kCardTop, _kCardBottom],
            ),
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              Icon(icon, color: _kGold, size: 32),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: _kGold,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    letterSpacing: 0.3,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private helpers ───────────────────────────────────────────────────────────

class _CardRow extends StatelessWidget {
  final List<({String id, IconData icon, String label})> items;
  final void Function(String id, String label) onTap;

  const _CardRow({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          Expanded(
            child: FeatureCard(
              icon: items[i].icon,
              label: items[i].label,
              onTap: () => onTap(items[i].id, items[i].label),
            ),
          ),
        ],
      ],
    );
  }
}

class _GoldDivider extends StatelessWidget {
  const _GoldDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: _kBorderGold.withValues(alpha: 0.30),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '◆',
            style: TextStyle(color: _kBorderGold, fontSize: 10),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: _kBorderGold.withValues(alpha: 0.30),
          ),
        ),
      ],
    );
  }
}

// ── Revert Corner Card (unchanged) ────────────────────────────────────────────

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
                  painter: GeometricPatternPainter(),
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${l10n.subtitleYourGuideToIslam} 🌙',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
