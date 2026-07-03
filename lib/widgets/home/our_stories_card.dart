import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../models/community_story.dart';
import '../../screens/community_stories_screen.dart';
import '../../services/community_stories_service.dart';
import '../geometric_pattern_painter.dart';

const _kNavy = Color(0xFF0D1B2A);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

/// Home screen preview of the latest featured community story, pulled from
/// Firestore in real time. Renders nothing at all until Firebase is
/// configured and at least one approved story is marked featured.
class OurStoriesCard extends StatelessWidget {
  const OurStoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    if (!CommunityStoriesService.firebaseAvailable) {
      return const SizedBox.shrink();
    }
    return StreamBuilder<CommunityStory?>(
      stream: CommunityStoriesService().featuredStory(),
      builder: (context, snap) {
        final story = snap.data;
        if (story == null) return const SizedBox.shrink();
        return _CardBody(story: story);
      },
    );
  }
}

class _CardBody extends StatelessWidget {
  final CommunityStory story;
  const _CardBody({required this.story});

  void _open(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CommunityStoriesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = storyDisplayName(l10n, story);
    final initial = (story.anonymous || story.name.isEmpty)
        ? l10n.storiesAnonymous.substring(0, 1).toUpperCase()
        : story.initials;
    final meta = [
      story.countryFlag,
      if (story.shahadaDate != null) '${story.shahadaDate!.year}',
    ].join(' · ');

    return GestureDetector(
      onTap: () => _open(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0x44C9A84C)),
          boxShadow: [
            BoxShadow(
              color: _kGold.withValues(alpha: 0.16),
              blurRadius: 22,
              spreadRadius: 1,
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF13273F), Color(0xFF0D1B2A), Color(0xFF081221)],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.05),
                ),
              ),
              PositionedDirectional(
                top: -26,
                end: -18,
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: CustomPaint(
                    painter:
                        _CrescentWatermarkPainter(_kGold.withValues(alpha: 0.07)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headerRow(l10n),
                    const SizedBox(height: 18),
                    _quoteBlock(),
                    const SizedBox(height: 20),
                    _authorRow(l10n, name, initial, meta),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── "◆ OUR STORIES" + See all → ───────────────────────────────────────────
  Widget _headerRow(AppLocalizations l10n) {
    return Row(
      children: [
        Text(
          '◆',
          style: TextStyle(
            fontSize: 8,
            color: _kGold.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            l10n.ourStories.toUpperCase(),
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 2.2,
              color: _kGold,
            ),
          ),
        ),
        Text(
          '${l10n.storiesSeeAll} →',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: _kGold.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }

  // ── Featured quote framed by large decorative quote marks ─────────────────
  Widget _quoteBlock() {
    final markStyle = GoogleFonts.playfairDisplay(
      fontSize: 56,
      height: 0.9,
      fontWeight: FontWeight.w700,
      color: _kGold.withValues(alpha: 0.45),
    );
    return Stack(
      children: [
        PositionedDirectional(start: 0, top: 0, child: Text('“', style: markStyle)),
        PositionedDirectional(end: 0, bottom: 0, child: Text('”', style: markStyle)),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 22, 30, 22),
          child: Text(
            story.story,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.playfairDisplay(
              fontSize: 16.5,
              fontStyle: FontStyle.italic,
              color: _kCream.withValues(alpha: 0.94),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  // ── Avatar + name / flag · year + Read More pill ──────────────────────────
  Widget _authorRow(
      AppLocalizations l10n, String name, String initial, String meta) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _kGold.withValues(alpha: 0.28),
                _kGold.withValues(alpha: 0.08),
              ],
            ),
            border: Border.all(color: _kGold.withValues(alpha: 0.7)),
          ),
          child: Text(
            initial,
            style: GoogleFonts.playfairDisplay(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: _kGold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                  color: _kCream,
                ),
              ),
              if (meta.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  meta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _kCream.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _kGold,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _kGold.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            l10n.storiesReadMore,
            style: GoogleFonts.lato(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              color: _kNavy,
            ),
          ),
        ),
      ],
    );
  }
}

/// Faint crescent watermark tucked into the card's top corner.
class _CrescentWatermarkPainter extends CustomPainter {
  final Color color;
  const _CrescentWatermarkPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.shortestSide * 0.42;
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final crescent = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: center, radius: r)),
      Path()
        ..addOval(Rect.fromCircle(
          center: center.translate(r * 0.45, -r * 0.2),
          radius: r * 0.85,
        )),
    );
    canvas.drawPath(crescent, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_CrescentWatermarkPainter old) => old.color != color;
}
