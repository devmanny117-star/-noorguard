import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/share_data.dart';
import '../l10n/app_localizations.dart';
import '../services/share_helper.dart';
import '../widgets/share_card.dart';

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFD4AF37);
const _cardColor = Color(0xFF152030);

/// Single-hadith detail view — a lightweight destination (not the full
/// browsable list ShareSheet's hadith picker shows) for the "Hadith of the
/// Day" slot in the Noor Guard Live notification's rotating content. Styled
/// after TafsirOfTheDayScreen's single-item layout.
class HadithDetailScreen extends StatelessWidget {
  /// Index into [shareHadiths]; wraps via modulo, mirroring how the
  /// notification itself and [AsmaUlHusnaScreen]/[IslamicGlossaryScreen]
  /// resolve their daily-rotation content by a stable numeric/text key.
  final int hadithIndex;

  const HadithDetailScreen({super.key, required this.hadithIndex});

  Future<void> _share(
      BuildContext context, ShareHadith hadith, String locale) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await shareCardWidget(
        context: context,
        card: HadithShareCardWidget(
          typeLabel: l10n.shareCardHadithLabel,
          hadithText: hadith.translationFor(locale),
          source: hadith.source,
          brandingLabel: l10n.shareViaLabel,
        ),
        shareText: l10n.shareViaLabel,
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l10n.shareError,
            style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final hadith = shareHadiths[hadithIndex % shareHadiths.length];

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: GestureDetector(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _gold.withValues(alpha: 0.12),
                        border: Border.all(
                            color: _gold.withValues(alpha: 0.5), width: 1.5),
                      ),
                      child: const Icon(Icons.menu_book_rounded,
                          color: _gold, size: 24),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      l10n.liveNotifHeaderHadith,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _cardColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color: _gold.withValues(alpha: 0.35), width: 1.2),
                        boxShadow: [
                          BoxShadow(
                            color: _gold.withValues(alpha: 0.06),
                            blurRadius: 16,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            hadith.arabic,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.scheherazadeNew(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: _gold,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            hadith.transliteration,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 12.5,
                              fontStyle: FontStyle.italic,
                              color: Colors.white.withValues(alpha: 0.5),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                              height: 1, color: _gold.withValues(alpha: 0.2)),
                          const SizedBox(height: 16),
                          Text(
                            hadith.translationFor(locale),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.white.withValues(alpha: 0.85),
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: _gold.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: _gold.withValues(alpha: 0.3)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.verified_rounded,
                                    size: 13, color: _gold.withValues(alpha: 0.8)),
                                const SizedBox(width: 5),
                                Text(
                                  hadith.source,
                                  style: GoogleFonts.lato(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: _gold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _share(context, hadith, locale),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _gold,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: _gold.withValues(alpha: 0.35),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.share_rounded,
                                size: 18, color: _navy),
                            const SizedBox(width: 8),
                            Text(
                              l10n.shareThisHadith,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: _navy,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
