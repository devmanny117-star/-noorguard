import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../widgets/geometric_pattern_painter.dart';
import 'how_to_pray_screen.dart';
import 'islamic_glossary_screen.dart';
import 'shahada_screen.dart';
import 'wudu_guide_screen.dart';
import 'why_do_we_screen.dart';

const _navy    = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold    = Color(0xFFC9A84C);
const _cream   = Color(0xFFF5EFE6);

// ── Back to Basics Screen ──────────────────────────────────────────────────────

class BackToBasicsScreen extends StatelessWidget {
  const BackToBasicsScreen({super.key});

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
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _FeatureCard(
                    icon: Icons.record_voice_over_outlined,
                    title: l10n.shahadaScreenTitle,
                    subtitle: l10n.pillar1Desc,
                    onTap: () => _push(context, const ShahadaScreen()),
                  ),
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
                  const SizedBox(height: 28),
                  _PillarsSection(l10n: l10n),
                  const SizedBox(height: 32),
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
        // Background geometric pattern
        const Positioned.fill(
          child: CustomPaint(
            painter: GeometricPatternPainter(
              color: _gold,
              alpha: 0.08,
            ),
          ),
        ),
        // Radial glow at top-center
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
              // Back button
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
              // Crescent + star icon
              SizedBox(
                width: 56,
                height: 56,
                child: CustomPaint(painter: _CrescentStarPainter()),
              ),
              const SizedBox(height: 16),
              // Title
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
              // Subtitle
              Text(
                l10n.backToBasicsSubtitle,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: _cream.withValues(alpha: 0.70),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              // Gold divider
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
              color: _gold.withValues(alpha: 0.06),
              blurRadius: 12,
              spreadRadius: 0,
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
          child: Stack(
            children: [
              // Geometric watermark
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _gold, alpha: 0.05),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Gold icon circle
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _gold.withValues(alpha: 0.10),
                        shape: BoxShape.circle,
                        border: Border.all(color: _gold.withValues(alpha: 0.32)),
                      ),
                      child: Icon(icon, color: _gold, size: 24),
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
      ),
    );
  }
}

// ── 5 Pillars Section ──────────────────────────────────────────────────────────

class _PillarsSection extends StatelessWidget {
  final AppLocalizations l10n;
  const _PillarsSection({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final pillars = [
      _PillarData(
        arabicName: 'الشَّهَادَة',
        number: 1,
        name: l10n.pillar1Name,
        desc: l10n.pillar1Desc,
        detail: l10n.pillar1Detail,
      ),
      _PillarData(
        arabicName: 'الصَّلاة',
        number: 2,
        name: l10n.pillar2Name,
        desc: l10n.pillar2Desc,
        detail: l10n.pillar2Detail,
      ),
      _PillarData(
        arabicName: 'الزَّكاة',
        number: 3,
        name: l10n.pillar3Name,
        desc: l10n.pillar3Desc,
        detail: l10n.pillar3Detail,
      ),
      _PillarData(
        arabicName: 'الصَّوْم',
        number: 4,
        name: l10n.pillar4Name,
        desc: l10n.pillar4Desc,
        detail: l10n.pillar4Detail,
      ),
      _PillarData(
        arabicName: 'الحَجّ',
        number: 5,
        name: l10n.pillar5Name,
        desc: l10n.pillar5Desc,
        detail: l10n.pillar5Detail,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            Container(
              width: 3,
              height: 20,
              decoration: BoxDecoration(
                color: _gold,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.50),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              l10n.fivePillarsOfIslam,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: _gold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < pillars.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          _PillarCard(pillar: pillars[i], l10n: l10n),
        ],
      ],
    );
  }
}

class _PillarData {
  final String arabicName;
  final int number;
  final String name;
  final String desc;
  final String detail;

  const _PillarData({
    required this.arabicName,
    required this.number,
    required this.name,
    required this.desc,
    required this.detail,
  });
}

class _PillarCard extends StatefulWidget {
  final _PillarData pillar;
  final AppLocalizations l10n;

  const _PillarCard({required this.pillar, required this.l10n});

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _ctrl;
  late final Animation<double> _expand;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _expand = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    _expanded ? _ctrl.forward() : _ctrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardNavy,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _expanded
              ? _gold.withValues(alpha: 0.40)
              : _gold.withValues(alpha: 0.18),
        ),
        boxShadow: [
          if (_expanded)
            BoxShadow(
              color: _gold.withValues(alpha: 0.10),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
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
                // Main row (always visible)
                GestureDetector(
                  onTap: _toggle,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Numbered circle
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _gold.withValues(alpha: 0.12),
                            border: Border.all(
                                color: _gold.withValues(alpha: 0.45)),
                          ),
                          child: Center(
                            child: Text(
                              '${widget.pillar.number}',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _gold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Arabic name
                              Text(
                                widget.pillar.arabicName,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: _gold,
                                  height: 1.2,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(height: 2),
                              // English name
                              Text(
                                widget.pillar.name,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: _cream,
                                ),
                              ),
                              const SizedBox(height: 2),
                              // Short description
                              Text(
                                widget.pillar.desc,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  color: _cream.withValues(alpha: 0.55),
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        AnimatedRotation(
                          turns: _expanded ? 0.25 : 0,
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: _gold.withValues(alpha: 0.60),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Expandable detail
                SizeTransition(
                  sizeFactor: _expand,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: _gold.withValues(alpha: 0.15),
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16, 14, 16, 16),
                        child: Text(
                          widget.pillar.detail,
                          style: GoogleFonts.lato(
                            fontSize: 13.5,
                            color: _cream.withValues(alpha: 0.78),
                            height: 1.6,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggle,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16, 0, 16, 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.l10n.pillarShowLess,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  color: _gold,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.expand_less_rounded,
                                  size: 16, color: _gold),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // "Learn more" shown when collapsed
                if (!_expanded)
                  GestureDetector(
                    onTap: _toggle,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.l10n.pillarLearnMore,
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: _gold.withValues(alpha: 0.75),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.expand_more_rounded,
                              size: 16,
                              color: _gold.withValues(alpha: 0.75)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Crescent + Star Painter ───────────────────────────────────────────────────

class _CrescentStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r  = size.width * 0.38;

    // Soft glow
    canvas.drawCircle(
      Offset(cx, cy), r * 1.2,
      Paint()
        ..color = _gold.withValues(alpha: 0.18)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    final p = Paint()..color = _gold..style = PaintingStyle.fill;

    // Crescent
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

    // Star
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
