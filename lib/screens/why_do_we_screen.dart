import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

// ── Data ─────────────────────────────────────────────────────────────────────

class _Topic {
  final IconData icon;
  final String Function(AppLocalizations) question;
  final String Function(AppLocalizations) answer;

  const _Topic({
    required this.icon,
    required this.question,
    required this.answer,
  });
}

List<_Topic> _topics(AppLocalizations l10n) => [
  _Topic(
    icon: Icons.access_time_rounded,
    question: (_) => l10n.whyDoWeQ1,
    answer:   (_) => l10n.whyDoWeA1,
  ),
  _Topic(
    icon: Icons.explore_outlined,
    question: (_) => l10n.whyDoWeQ2,
    answer:   (_) => l10n.whyDoWeA2,
  ),
  _Topic(
    icon: Icons.nightlight_round,
    question: (_) => l10n.whyDoWeQ3,
    answer:   (_) => l10n.whyDoWeA3,
  ),
  _Topic(
    icon: Icons.restaurant_outlined,
    question: (_) => l10n.whyDoWeQ4,
    answer:   (_) => l10n.whyDoWeA4,
  ),
  _Topic(
    icon: Icons.house_outlined,
    question: (_) => l10n.whyDoWeQ5,
    answer:   (_) => l10n.whyDoWeA5,
  ),
  _Topic(
    icon: Icons.waving_hand_outlined,
    question: (_) => l10n.whyDoWeQ6,
    answer:   (_) => l10n.whyDoWeA6,
  ),
  _Topic(
    icon: Icons.flight_outlined,
    question: (_) => l10n.whyDoWeQ7,
    answer:   (_) => l10n.whyDoWeA7,
  ),
  _Topic(
    icon: Icons.volunteer_activism_outlined,
    question: (_) => l10n.whyDoWeQ8,
    answer:   (_) => l10n.whyDoWeA8,
  ),
  _Topic(
    icon: Icons.favorite_border_rounded,
    question: (_) => l10n.whyDoWeQ9,
    answer:   (_) => l10n.whyDoWeA9,
  ),
  _Topic(
    icon: Icons.self_improvement_rounded,
    question: (_) => l10n.whyDoWeQ10,
    answer:   (_) => l10n.whyDoWeA10,
  ),
  _Topic(
    icon: Icons.no_food_outlined,
    question: (_) => l10n.whyDoWeQ11,
    answer:   (_) => l10n.whyDoWeA11,
  ),
  _Topic(
    icon: Icons.psychology_outlined,
    question: (_) => l10n.whyDoWeQ12,
    answer:   (_) => l10n.whyDoWeA12,
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class WhyDoWeScreen extends StatefulWidget {
  const WhyDoWeScreen({super.key});

  @override
  State<WhyDoWeScreen> createState() => _WhyDoWeScreenState();
}

class _WhyDoWeScreenState extends State<WhyDoWeScreen> {
  int? _expanded;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final topics = _topics(l10n);

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, l10n),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                itemCount: topics.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final topic = topics[i];
                  final isOpen = _expanded == i;
                  return _TopicCard(
                    number: i + 1,
                    icon: topic.icon,
                    question: topic.question(l10n),
                    answer: topic.answer(l10n),
                    sourceBadge: l10n.whyDoWeSourceBadge,
                    isOpen: isOpen,
                    onTap: () => setState(() => _expanded = isOpen ? null : i),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
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
          const SizedBox(height: 14),
          Text(
            l10n.whyDoWe,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            l10n.whyDoWeScreenSubtitle,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.55),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Topic Card ────────────────────────────────────────────────────────────────

class _TopicCard extends StatelessWidget {
  final int number;
  final IconData icon;
  final String question;
  final String answer;
  final String sourceBadge;
  final bool isOpen;
  final VoidCallback onTap;

  const _TopicCard({
    required this.number,
    required this.icon,
    required this.question,
    required this.answer,
    required this.sourceBadge,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isOpen
                ? _gold.withValues(alpha: 0.45)
                : _gold.withValues(alpha: 0.12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header row ──────────────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _gold.withValues(alpha: 0.13),
                      shape: BoxShape.circle,
                      border: Border.all(color: _gold.withValues(alpha: 0.35)),
                    ),
                    child: Icon(icon, color: _gold, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    child: Icon(Icons.keyboard_arrow_down_rounded,
                        color: _gold.withValues(alpha: 0.7), size: 24),
                  ),
                ],
              ),

              // ── Expanded answer ──────────────────────────────────────────
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 220),
                crossFadeState: isOpen
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: _gold.withValues(alpha: 0.15),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      answer,
                      style: GoogleFonts.lato(
                        fontSize: 13.5,
                        color: Colors.white.withValues(alpha: 0.82),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _gold.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: _gold.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.menu_book_outlined,
                              size: 12, color: _gold.withValues(alpha: 0.85)),
                          const SizedBox(width: 5),
                          Text(
                            sourceBadge,
                            style: GoogleFonts.lato(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: _gold.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
