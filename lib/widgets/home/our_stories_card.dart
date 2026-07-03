import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../models/community_story.dart';
import '../../screens/community_stories_screen.dart';
import '../../services/community_stories_service.dart';

const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF0F1E30);
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

    return GestureDetector(
      onTap: () => _open(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _kGold.withValues(alpha: 0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── "OUR STORIES ·" + See all → ─────────────────────────────
            Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: _kGold,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.ourStories.toUpperCase(),
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.4,
                      color: _kGold,
                    ),
                  ),
                ),
                Text(
                  '${l10n.storiesSeeAll} →',
                  style: GoogleFonts.lato(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: _kGold.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ── Featured quote ──────────────────────────────────────────
            Text(
              '"${story.story}"',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14.5,
                fontStyle: FontStyle.italic,
                color: _kCream.withValues(alpha: 0.92),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),

            // ── Author row + Read More pill ─────────────────────────────
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _kGold.withValues(alpha: 0.12),
                    border: Border.all(color: _kGold.withValues(alpha: 0.55)),
                  ),
                  child: Text(
                    (story.anonymous || story.name.isEmpty)
                        ? l10n.storiesAnonymous.substring(0, 1).toUpperCase()
                        : story.initials,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: _kGold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    [
                      name,
                      story.countryFlag,
                      if (story.shahadaDate != null)
                        '${story.shahadaDate!.year}',
                    ].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _kCream.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _kGold,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    l10n.storiesReadMore,
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: _kNavy,
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
