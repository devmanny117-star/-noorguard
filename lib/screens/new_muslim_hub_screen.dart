import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../widgets/geometric_pattern_painter.dart';
import 'how_to_pray_screen.dart';
import 'islamic_glossary_screen.dart';
import 'why_do_we_screen.dart';
import 'wudu_guide_screen.dart';

const _navy     = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold     = Color(0xFFC9A84C);
const _cream    = Color(0xFFF5EFE6);

// ── Back to Basics (NewMuslimHubScreen) ───────────────────────────────────────

class NewMuslimHubScreen extends StatelessWidget {
  const NewMuslimHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: _HeroSection(l10n: l10n)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _PillarsCard(l10n: l10n),
                  const SizedBox(height: 12),
                  _FeatureCard(
                    icon: Icons.water_drop_outlined,
                    title: l10n.wuduGuide,
                    subtitle: l10n.wuduGuideSubtitle,
                    onTap: () => _push(context, const WuduGuideScreen()),
                  ),
                  const SizedBox(height: 12),
                  _FeatureCard(
                    icon: Icons.mosque_outlined,
                    title: l10n.howToPray,
                    subtitle: l10n.howToPraySubtitle,
                    onTap: () => _push(context, const HowToPrayScreen()),
                  ),
                  const SizedBox(height: 12),
                  _FeatureCard(
                    icon: Icons.menu_book_outlined,
                    title: l10n.islamicGlossary,
                    subtitle: l10n.islamicGlossaryHubSubtitle,
                    onTap: () => _push(context, const IslamicGlossaryScreen()),
                  ),
                  const SizedBox(height: 12),
                  _FeatureCard(
                    icon: Icons.lightbulb_outline_rounded,
                    title: l10n.whyDoWe,
                    subtitle: l10n.whyDoWeHubSubtitle,
                    onTap: () => _push(context, const WhyDoWeScreen()),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _push(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));

}

// ── Hero Section ───────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  final AppLocalizations l10n;
  const _HeroSection({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: CustomPaint(
            painter: GeometricPatternPainter(color: _gold, alpha: 0.08),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _gold.withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _gold.withValues(alpha: 0.25)),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      size: 16, color: _gold),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _gold.withValues(alpha: 0.28),
                      blurRadius: 28,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: CustomPaint(painter: _CrescentStarPainter()),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.backToBasics,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                  shadows: [
                    Shadow(
                      color: _gold.withValues(alpha: 0.40),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.backToBasicsSubtitle,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: _cream.withValues(alpha: 0.70),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _gold.withValues(alpha: 0.0),
                      _gold.withValues(alpha: 0.55),
                      _gold.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Feature Card ───────────────────────────────────────────────────────────────

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _gold.withValues(alpha: 0.20)),
          boxShadow: [
            BoxShadow(
              color: _gold.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: IntrinsicHeight(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 3px gold left accent bar
              Container(width: 3, color: _gold),
              Expanded(
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: CustomPaint(
                        painter: GeometricPatternPainter(color: _gold, alpha: 0.05),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: _gold.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                              border: Border.all(color: _gold.withValues(alpha: 0.38)),
                              boxShadow: [
                                BoxShadow(
                                  color: _gold.withValues(alpha: 0.22),
                                  blurRadius: 14,
                                ),
                              ],
                            ),
                            child: Icon(icon, color: _gold, size: 26),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _cream,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  subtitle,
                                  style: GoogleFonts.lato(
                                    fontSize: 12.5,
                                    color: _cream.withValues(alpha: 0.52),
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 14, color: _gold.withValues(alpha: 0.55)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

// ── 5 Pillars Card ─────────────────────────────────────────────────────────────

class _PillarsCard extends StatefulWidget {
  final AppLocalizations l10n;
  const _PillarsCard({required this.l10n});

  @override
  State<_PillarsCard> createState() => _PillarsCardState();
}

class _PillarsCardState extends State<_PillarsCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final pillars = [
      (n: 1, arabic: 'الشَّهَادَة', name: l10n.pillar1Name, desc: l10n.pillar1Desc, detail: l10n.pillar1Detail),
      (n: 2, arabic: 'الصَّلاة',   name: l10n.pillar2Name, desc: l10n.pillar2Desc, detail: l10n.pillar2Detail),
      (n: 3, arabic: 'الزَّكاة',   name: l10n.pillar3Name, desc: l10n.pillar3Desc, detail: l10n.pillar3Detail),
      (n: 4, arabic: 'الصَّوْم',   name: l10n.pillar4Name, desc: l10n.pillar4Desc, detail: l10n.pillar4Detail),
      (n: 5, arabic: 'الحَجّ',     name: l10n.pillar5Name, desc: l10n.pillar5Desc, detail: l10n.pillar5Detail),
    ];

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _expanded
                ? _gold.withValues(alpha: 0.40)
                : _gold.withValues(alpha: 0.20),
          ),
          boxShadow: [
            BoxShadow(
              color: _gold.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: IntrinsicHeight(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 3px gold left accent bar
              Container(width: 3, color: _gold),
              Expanded(
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: CustomPaint(
                        painter: GeometricPatternPainter(color: _gold, alpha: 0.05),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Header row ──────────────────────────────────
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: _gold.withValues(alpha: 0.12),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: _gold.withValues(alpha: 0.38)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _gold.withValues(alpha: 0.22),
                                      blurRadius: 14,
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.mosque_rounded,
                                    color: _gold, size: 26),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.fivePillarsOfIslam,
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: _cream,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      l10n.fivePillarsSubtitle,
                                      style: GoogleFonts.lato(
                                        fontSize: 12.5,
                                        color: _cream.withValues(alpha: 0.52),
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              AnimatedRotation(
                                turns: _expanded ? 0.25 : 0,
                                duration: const Duration(milliseconds: 260),
                                curve: Curves.easeInOut,
                                child: Icon(Icons.arrow_forward_ios_rounded,
                                    size: 14,
                                    color: _gold.withValues(alpha: 0.55)),
                              ),
                            ],
                          ),
                        ),

                        // ── Expanded pillars list ────────────────────────
                        if (_expanded) ...[
                          Divider(color: _gold.withValues(alpha: 0.20), height: 1),
                          Container(
                            color: _gold.withValues(alpha: 0.04),
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                            child: Column(
                              children: [
                                for (int i = 0; i < pillars.length; i++) ...[
                                  if (i > 0)
                                    Divider(color: _gold.withValues(alpha: 0.12), height: 1),
                                  _PillarRow(pillar: (n: pillars[i].n, arabic: pillars[i].arabic, name: pillars[i].name, desc: pillars[i].desc, detail: pillars[i].detail)),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _PillarRow extends StatelessWidget {
  final ({int n, String arabic, String name, String desc, String detail}) pillar;
  const _PillarRow({required this.pillar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gold number circle
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _gold.withValues(alpha: 0.14),
              border: Border.all(color: _gold.withValues(alpha: 0.50)),
              boxShadow: [
                BoxShadow(
                  color: _gold.withValues(alpha: 0.18),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${pillar.n}',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pillar.arabic,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                    height: 1.1,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 2),
                Text(
                  pillar.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _cream,
                  ),
                ),
                Text(
                  pillar.desc,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: _cream.withValues(alpha: 0.50),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pillar.detail,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _cream.withValues(alpha: 0.80),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Crescent + Star Painter ────────────────────────────────────────────────────

class _CrescentStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r  = size.width * 0.38;

    canvas.drawCircle(
      Offset(cx, cy), r * 1.2,
      Paint()
        ..color = _gold.withValues(alpha: 0.18)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    final p = Paint()..color = _gold..style = PaintingStyle.fill;

    final outer = Path()
      ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));
    final inner = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(cx + r * 0.32, cy - r * 0.08), radius: r * 0.78));
    final crescent = Path.combine(PathOperation.difference, outer, inner);

    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(-math.pi / 10);
    canvas.translate(-cx, -cy);
    canvas.drawPath(crescent, p);
    canvas.restore();

    _drawStar(canvas, p, Offset(cx + r * 0.70, cy - r * 0.58), r * 0.22);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final a  = i * 2 * math.pi / 5 - math.pi / 2;
      final ia = a + math.pi / 5;
      final x  = center.dx + r * math.cos(a);
      final y  = center.dy + r * math.sin(a);
      final ix = center.dx + r * 0.38 * math.cos(ia);
      final iy = center.dy + r * 0.38 * math.sin(ia);
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CrescentStarPainter _) => false;
}
