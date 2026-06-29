import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../widgets/geometric_pattern_painter.dart';

const _navy  = Color(0xFF0D1B2A);
const _card  = Color(0xFF152840);
const _gold  = Color(0xFFC9A84C);
const _cream = Color(0xFFF5EFE6);

// ── Word model ─────────────────────────────────────────────────────────────────

class _Word {
  final int number;
  const _Word(this.number);

  String arabic(AppLocalizations l) => [
    l.shahadaWord1Arabic,
    l.shahadaWord2Arabic,
    l.shahadaWord3Arabic,
    l.shahadaWord4Arabic,
    l.shahadaWord5Arabic,
    l.shahadaWord6Arabic,
    l.shahadaWord7Arabic,
  ][number - 1];

  String trans(AppLocalizations l) => [
    l.shahadaWord1Trans,
    l.shahadaWord2Trans,
    l.shahadaWord3Trans,
    l.shahadaWord4Trans,
    l.shahadaWord5Trans,
    l.shahadaWord6Trans,
    l.shahadaWord7Trans,
  ][number - 1];

  String meaning(AppLocalizations l) => [
    l.shahadaWord1Meaning,
    l.shahadaWord2Meaning,
    l.shahadaWord3Meaning,
    l.shahadaWord4Meaning,
    l.shahadaWord5Meaning,
    l.shahadaWord6Meaning,
    l.shahadaWord7Meaning,
  ][number - 1];
}

const _words = [_Word(1), _Word(2), _Word(3), _Word(4), _Word(5), _Word(6), _Word(7)];

// ── Screen ─────────────────────────────────────────────────────────────────────

class ShahadaScreen extends StatelessWidget {
  const ShahadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: Stack(
        children: [
          // Subtle geometric background
          const Positioned.fill(
            child: CustomPaint(
              painter: GeometricPatternPainter(
                color: _gold,
                alpha: 0.05,
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildAppBar(context, l10n),
                SliverToBoxAdapter(child: _buildHeader(l10n)),
                SliverToBoxAdapter(child: _buildWordBreakdown(l10n)),
                SliverToBoxAdapter(child: _buildMeaningSection(l10n)),
                SliverToBoxAdapter(child: _buildMomentSection(l10n)),
                SliverToBoxAdapter(child: _buildPronunciationSection(l10n)),
                const SliverToBoxAdapter(child: SizedBox(height: 48)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── App bar ──────────────────────────────────────────────────────────────────

  Widget _buildAppBar(BuildContext context, AppLocalizations l10n) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _gold.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: _gold, size: 18),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                l10n.shahadaScreenTitle,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────────────────────────

  Widget _buildHeader(AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Decorative gold line
          Container(
            width: 60,
            height: 2,
            decoration: BoxDecoration(
              color: _gold,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 24),

          // Arabic text
          Text(
            l10n.shahadaArabicText,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.scheherazadeNew(
              fontSize: 34,
              color: _gold,
              height: 1.8,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 16),

          // Divider
          Row(
            children: [
              Expanded(child: Container(height: 1, color: _gold.withValues(alpha: 0.25))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(Icons.star_rounded, color: _gold.withValues(alpha: 0.6), size: 14),
              ),
              Expanded(child: Container(height: 1, color: _gold.withValues(alpha: 0.25))),
            ],
          ),
          const SizedBox(height: 16),

          // Transliteration
          Text(
            l10n.shahadaTransliteration,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: _cream.withValues(alpha: 0.85),
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),

          // Translation
          Text(
            l10n.shahadaTranslation,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: _cream.withValues(alpha: 0.65),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Decorative gold line
          Container(
            width: 60,
            height: 2,
            decoration: BoxDecoration(
              color: _gold,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }

  // ── Word breakdown ───────────────────────────────────────────────────────────

  Widget _buildWordBreakdown(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.shahadaWordBreakdownTitle),
          const SizedBox(height: 16),
          ..._words.map((w) => _buildWordCard(w, l10n)),
        ],
      ),
    );
  }

  Widget _buildWordCard(_Word word, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Number badge
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: _gold.withValues(alpha: 0.5)),
            ),
            alignment: Alignment.center,
            child: Text(
              '${word.number}',
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _gold,
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Arabic + transliteration + meaning
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.arabic(l10n),
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 26,
                    color: _gold,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  word.trans(l10n),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _cream.withValues(alpha: 0.7),
                    fontStyle: FontStyle.italic,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          // Meaning tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _gold.withValues(alpha: 0.3)),
            ),
            child: Text(
              word.meaning(l10n),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 12,
                color: _cream,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Meaning & significance ───────────────────────────────────────────────────

  Widget _buildMeaningSection(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.shahadaMeaningTitle),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withValues(alpha: 0.2)),
            ),
            child: Text(
              l10n.shahadaMeaningBody,
              style: GoogleFonts.lato(
                fontSize: 15,
                color: _cream.withValues(alpha: 0.88),
                height: 1.75,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Moment of Shahada ────────────────────────────────────────────────────────

  Widget _buildMomentSection(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.shahadaMomentTitle),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _gold.withValues(alpha: 0.12),
                  _card,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withValues(alpha: 0.35), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_awesome, color: _gold.withValues(alpha: 0.8), size: 18),
                    const SizedBox(width: 8),
                    Text(
                      l10n.shahadaMomentTitle,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 15,
                        color: _gold,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.shahadaMomentBody,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    color: _cream.withValues(alpha: 0.9),
                    height: 1.75,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Pronunciation guide ──────────────────────────────────────────────────────

  Widget _buildPronunciationSection(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.shahadaPronunciationTitle),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withValues(alpha: 0.2)),
            ),
            child: Column(
              children: [
                _pronunciationRow('1', l10n.shahadaTransliteration.split(',').first.trim(), l10n.shahadaPronunciationPart1),
                const SizedBox(height: 12),
                Divider(color: _gold.withValues(alpha: 0.2), height: 1),
                const SizedBox(height: 12),
                _pronunciationRow('2', l10n.shahadaTransliteration.split(',').last.trim(), l10n.shahadaPronunciationPart2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronunciationRow(String number, String arabic, String phonetic) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: _gold.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: _gold.withValues(alpha: 0.5)),
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                arabic,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: _cream.withValues(alpha: 0.7),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phonetic,
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: _gold,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: _gold,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _cream,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
