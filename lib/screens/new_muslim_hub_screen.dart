import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import 'community_stories_screen.dart';
import 'how_to_pray_screen.dart';
import 'islamic_glossary_screen.dart';
import 'new_muslim_checklist_screen.dart';
import 'why_do_we_screen.dart';
import 'wudu_guide_screen.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

class _HubItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? destination;

  const _HubItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.destination,
  });
}

class NewMuslimHubScreen extends StatelessWidget {
  const NewMuslimHubScreen({super.key});

  static List<_HubItem> _items(AppLocalizations l10n) => [
    _HubItem(
      title: l10n.wuduGuide,
      subtitle: l10n.wuduGuideSubtitle,
      icon: Icons.water_drop_outlined,
      destination: const WuduGuideScreen(),
    ),
    _HubItem(
      title: l10n.howToPray,
      subtitle: l10n.howToPraySubtitle,
      icon: Icons.mosque_outlined,
      destination: const HowToPrayScreen(),
    ),
    _HubItem(
      title: l10n.newMuslimChecklist,
      subtitle: l10n.newMuslimChecklistSubtitle,
      icon: Icons.checklist_rounded,
      destination: const NewMuslimChecklistScreen(),
    ),
    _HubItem(
      title: l10n.islamicGlossary,
      subtitle: l10n.islamicGlossaryHubSubtitle,
      icon: Icons.menu_book_outlined,
      destination: const IslamicGlossaryScreen(),
    ),
    _HubItem(
      title: l10n.whyDoWe,
      subtitle: l10n.whyDoWeHubSubtitle,
      icon: Icons.lightbulb_outline_rounded,
      destination: const WhyDoWeScreen(),
    ),
    _HubItem(
      title: l10n.communityStories,
      subtitle: l10n.communityStoriesHubSubtitle,
      icon: Icons.diversity_3_outlined,
      destination: const CommunityStoriesScreen(),
    ),
  ];

  void _open(BuildContext context, _HubItem item) {
    if (item.destination != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => item.destination!),
      );
      return;
    }
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} — ${l10n.comingSoon}',
            style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1A1A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = _items(l10n);
    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Row(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.revertCorner,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.revertCornerHubSubtitle,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.6),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _HubCard(item: item, onTap: () => _open(context, item));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  final _HubItem item;
  final VoidCallback onTap;

  const _HubCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _gold.withValues(alpha: 0.16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: _gold.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: Border.all(color: _gold.withValues(alpha: 0.35)),
              ),
              child: Icon(item.icon, color: _gold, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.lato(
                      fontSize: 12.5,
                      color: Colors.white.withValues(alpha: 0.55),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: _gold.withValues(alpha: 0.6)),
          ],
        ),
      ),
    );
  }
}
