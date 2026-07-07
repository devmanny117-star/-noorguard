import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'geometric_pattern_painter.dart';
import 'crescent_star_painter.dart';
import 'story_avatar.dart';

const _kNavy   = Color(0xFF0D1B2A);
const _kGold   = Color(0xFFC9A84C);
const _kCream  = Color(0xFFF5EFE6);

/// Classic serif ("Georgia") matching the in-app story cards. Georgia is
/// bundled on iOS/macOS/web; Android falls back to its system serif.
TextStyle _storySerif({required Color color, double fontSize = 14.5}) =>
    TextStyle(
      fontFamily: 'Georgia',
      fontFamilyFallback: const ['Times New Roman', 'serif'],
      fontStyle: FontStyle.italic,
      fontSize: fontSize,
      height: 1.7,
      color: color,
    );

/// Oversized decorative quote mark, same treatment as the featured story card.
TextStyle _quoteMarkStyle() => TextStyle(
      fontFamily: 'Georgia',
      fontFamilyFallback: const ['Times New Roman', 'serif'],
      fontSize: 52,
      height: 0.6,
      fontWeight: FontWeight.w700,
      color: _kGold.withValues(alpha: 0.4),
    );

/// Rendered off-screen and captured by [ScreenshotController].
/// All localised strings must be resolved by the caller and passed in.
class ShareCardWidget extends StatelessWidget {
  final String typeLabel;      // e.g. "✦ Ayah of the Day"
  final String arabic;
  final String transliteration;
  final String translation;
  final String source;
  final String brandingLabel;  // e.g. "Shared via Noor Guard"

  const ShareCardWidget({
    super.key,
    required this.typeLabel,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.source,
    required this.brandingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _kGold.withValues(alpha: 0.55), width: 1.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Stack(
            children: [
              // Geometric watermark
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.09),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Type label
                    Text(
                      typeLabel,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _kGold,
                        letterSpacing: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Arabic text
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        arabic,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 26,
                          color: _kGold,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Gold divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.8,
                            color: _kGold.withValues(alpha: 0.45),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: _kGold,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 0.8,
                            color: _kGold.withValues(alpha: 0.45),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Transliteration
                    Text(
                      transliteration,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: _kCream.withValues(alpha: 0.75),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Translation
                    Text(
                      translation,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: _kCream,
                        height: 1.55,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    // Source
                    Text(
                      source,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: _kGold.withValues(alpha: 0.80),
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Divider before branding
                    Container(
                      height: 0.5,
                      color: _kGold.withValues(alpha: 0.25),
                    ),
                    const SizedBox(height: 16),
                    // Branding row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 22,
                          height: 22,
                          child: CustomPaint(painter: CrescentStarPainter()),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          'NOOR GUARD',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          brandingLabel,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            color: _kCream.withValues(alpha: 0.50),
                          ),
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

/// Shared navy frame with gold border + geometric watermark used by the
/// smaller share cards (glossary, tafsir, hadith).
class _ShareCardFrame extends StatelessWidget {
  final List<Widget> children;
  const _ShareCardFrame({required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _kGold.withValues(alpha: 0.55), width: 1.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.09),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _typeLabelText(String typeLabel) => Text(
      typeLabel,
      style: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: _kGold,
        letterSpacing: 1.6,
      ),
      textAlign: TextAlign.center,
    );

Widget _goldDivider() => Row(
      children: [
        Expanded(
          child: Container(height: 0.8, color: _kGold.withValues(alpha: 0.45)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: 4,
            height: 4,
            decoration:
                const BoxDecoration(color: _kGold, shape: BoxShape.circle),
          ),
        ),
        Expanded(
          child: Container(height: 0.8, color: _kGold.withValues(alpha: 0.45)),
        ),
      ],
    );

/// Thin divider + crescent logo + "NOOR GUARD" + branding label, identical to
/// the footer of [ShareCardWidget].
List<Widget> _brandingFooter(String brandingLabel) => [
      const SizedBox(height: 24),
      Container(height: 0.5, color: _kGold.withValues(alpha: 0.25)),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 22,
            height: 22,
            child: CustomPaint(painter: CrescentStarPainter()),
          ),
          const SizedBox(width: 7),
          Text(
            'NOOR GUARD',
            style: GoogleFonts.playfairDisplay(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            brandingLabel,
            style: GoogleFonts.lato(
              fontSize: 10,
              color: _kCream.withValues(alpha: 0.50),
            ),
          ),
        ],
      ),
    ];

/// Share card for an Islamic Glossary term: term in gold, Arabic script,
/// definition in cream. Rendered off-screen and captured, like
/// [ShareCardWidget].
class GlossaryShareCardWidget extends StatelessWidget {
  final String typeLabel;      // e.g. "✦ Islamic Glossary" — already localised
  final String term;           // transliterated term, e.g. "Taqwa"
  final String arabic;
  final String definition;     // localised definition
  final String brandingLabel;  // e.g. "Shared via Noor Guard"

  const GlossaryShareCardWidget({
    super.key,
    required this.typeLabel,
    required this.term,
    required this.arabic,
    required this.definition,
    required this.brandingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return _ShareCardFrame(
      children: [
        _typeLabelText(typeLabel),
        const SizedBox(height: 20),
        Text(
          term,
          style: GoogleFonts.playfairDisplay(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            arabic,
            style: GoogleFonts.scheherazadeNew(
              fontSize: 30,
              color: _kGold,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 18),
        _goldDivider(),
        const SizedBox(height: 16),
        Text(
          definition,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: _kCream,
            height: 1.55,
          ),
          textAlign: TextAlign.center,
        ),
        ..._brandingFooter(brandingLabel),
      ],
    );
  }
}

/// Share card for a Tafsir entry: surah name, ayah reference and a tafsir
/// excerpt. Rendered off-screen and captured, like [ShareCardWidget].
class TafsirShareCardWidget extends StatelessWidget {
  final String typeLabel;      // e.g. "✦ Tafsir" — already localised
  final String surahName;
  final String ayahRef;        // e.g. "Ayah 5" — already localised
  final String excerpt;        // tafsir text, truncated by the caller
  final String brandingLabel;

  const TafsirShareCardWidget({
    super.key,
    required this.typeLabel,
    required this.surahName,
    required this.ayahRef,
    required this.excerpt,
    required this.brandingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return _ShareCardFrame(
      children: [
        _typeLabelText(typeLabel),
        const SizedBox(height: 20),
        Text(
          surahName,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: _kGold.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _kGold.withValues(alpha: 0.45)),
          ),
          child: Text(
            ayahRef,
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _kGold,
              letterSpacing: 0.4,
            ),
          ),
        ),
        const SizedBox(height: 18),
        _goldDivider(),
        const SizedBox(height: 16),
        Text(
          excerpt,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: _kCream,
            height: 1.55,
          ),
          textAlign: TextAlign.center,
        ),
        ..._brandingFooter(brandingLabel),
      ],
    );
  }
}

/// Share card for a hadith: hadith text in cream with its source/reference in
/// gold. Rendered off-screen and captured, like [ShareCardWidget].
class HadithShareCardWidget extends StatelessWidget {
  final String typeLabel;      // e.g. "✦ Hadith" — already localised
  final String hadithText;     // localised hadith text
  final String source;         // reference line, e.g. "Fajr • الفجر"
  final String brandingLabel;

  const HadithShareCardWidget({
    super.key,
    required this.typeLabel,
    required this.hadithText,
    required this.source,
    required this.brandingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return _ShareCardFrame(
      children: [
        _typeLabelText(typeLabel),
        const SizedBox(height: 20),
        Text(
          '"$hadithText"',
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: _kCream,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        _goldDivider(),
        const SizedBox(height: 14),
        Text(
          source,
          style: GoogleFonts.lato(
            fontSize: 11,
            fontStyle: FontStyle.italic,
            color: _kGold.withValues(alpha: 0.80),
            letterSpacing: 0.3,
          ),
          textAlign: TextAlign.center,
        ),
        ..._brandingFooter(brandingLabel),
      ],
    );
  }
}

/// Premium share card for Community Stories — mirrors the in-app story card:
/// background image with dark overlay (or navy + geometric pattern), gold
/// category pill, serif quote with decorative quote marks, author avatar.
/// Rendered off-screen and captured, like [ShareCardWidget].
class StoryShareCardWidget extends StatelessWidget {
  final String categoryLabel;   // e.g. "Revert" — already localised
  final String storyText;       // excerpt, no surrounding quotes
  final String authorName;      // display name or localised "Anonymous"
  final String countryLine;     // e.g. "🇺🇸 United States"
  final String brandingLabel;   // e.g. "Shared via Noor Guard"
  final String? backgroundImage;
  final String avatarType;      // 'initials' | 'icon' | 'pattern'
  final String? avatarData;
  final String initials;

  const StoryShareCardWidget({
    super.key,
    required this.categoryLabel,
    required this.storyText,
    required this.authorName,
    required this.countryLine,
    required this.brandingLabel,
    required this.backgroundImage,
    required this.avatarType,
    required this.avatarData,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Padding(
        // Breathing room inside the capture bounds so the glow isn't clipped.
        padding: const EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            color: _kNavy,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _kGold, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: _kGold.withValues(alpha: 0.28),
                blurRadius: 18,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Stack(
              children: [
                if (backgroundImage != null) ...[
                  Positioned.fill(
                    child: Image.asset(
                      backgroundImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(color: Colors.black.withValues(alpha: 0.5)),
                  ),
                ] else
                  const Positioned.fill(
                    child: CustomPaint(
                      painter:
                          GeometricPatternPainter(color: _kGold, alpha: 0.09),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 26, 28, 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Category badge — gold pill, as in the app.
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: _kGold.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: _kGold.withValues(alpha: 0.55)),
                        ),
                        child: Text(
                          categoryLabel,
                          style: GoogleFonts.lato(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                      if (backgroundImage == null) ...[
                        const SizedBox(height: 18),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'بِسْمِ اللَّهِ',
                            style: GoogleFonts.scheherazadeNew(
                              fontSize: 30,
                              color: _kGold,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      // Opening quote mark
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('“', style: _quoteMarkStyle()),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        storyText,
                        style: _storySerif(color: _kCream),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      // Closing quote mark
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text('”', style: _quoteMarkStyle()),
                      ),
                      const SizedBox(height: 4),
                      // Gold divider
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 0.8,
                              color: _kGold.withValues(alpha: 0.45),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: _kGold,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 0.8,
                              color: _kGold.withValues(alpha: 0.45),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Author capsule — avatar + name + country flag on a
                      // dark pill, matching the in-app story cards.
                      Container(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 14, 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StoryAvatar(
                              avatarType: avatarType,
                              avatarData: avatarData,
                              initials: initials,
                              size: 36,
                              borderWidth: 1.5,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    authorName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: _kGold,
                                    ),
                                  ),
                                  if (countryLine.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      countryLine,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                        fontSize: 11.5,
                                        color:
                                            _kCream.withValues(alpha: 0.75),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        height: 0.5,
                        color: _kGold.withValues(alpha: 0.25),
                      ),
                      const SizedBox(height: 14),
                      // Branding row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 22,
                            height: 22,
                            child: CustomPaint(painter: CrescentStarPainter()),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'NOOR GUARD',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: _kGold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            brandingLabel,
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              color: _kCream.withValues(alpha: 0.50),
                            ),
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
      ),
    );
  }
}
