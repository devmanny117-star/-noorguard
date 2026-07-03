import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/surah_translations.dart';
import '../l10n/app_localizations.dart';
import '../services/bookmark_service.dart';
import 'saved_duas_screen.dart' show SavedEmptyState;

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _cardColor = Color(0xFF152030);
const _mutedText = Color(0xFF8A9BB0);

/// All Quran ayahs the user has bookmarked in the surah reader.
class SavedVersesScreen extends StatefulWidget {
  const SavedVersesScreen({super.key});

  @override
  State<SavedVersesScreen> createState() => _SavedVersesScreenState();
}

class _SavedVersesScreenState extends State<SavedVersesScreen> {
  List<SavedVerse> _verses = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final verses = await BookmarkService.loadVerseBookmarks();
    verses.sort((a, b) => a.surahNumber != b.surahNumber
        ? a.surahNumber.compareTo(b.surahNumber)
        : a.verseNumber.compareTo(b.verseNumber));
    if (mounted) {
      setState(() {
        _verses = verses;
        _loading = false;
      });
    }
  }

  Future<void> _unsave(SavedVerse verse) async {
    await BookmarkService.toggleVerseBookmark(verse);
    if (mounted) {
      setState(() => _verses.removeWhere((v) => v.key == verse.key));
    }
  }

  String _surahLabel(BuildContext context, SavedVerse verse) {
    final langCode = Localizations.localeOf(context).languageCode;
    if (langCode == 'ar' && verse.surahArabicName.isNotEmpty) {
      return verse.surahArabicName;
    }
    final localized = surahNameTranslations[verse.surahNumber]?[langCode];
    final name = verse.surahEnglishName.isNotEmpty
        ? verse.surahEnglishName
        : 'Surah ${verse.surahNumber}';
    if (localized != null && localized != name) return '$name · $localized';
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.savedVerses,
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: _gold,
          ),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: _gold))
          : _verses.isEmpty
              ? SavedEmptyState(message: l10n.noSavedVerses)
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
                  itemCount: _verses.length,
                  itemBuilder: (context, i) => _SavedVerseCard(
                    verse: _verses[i],
                    surahLabel: _surahLabel(context, _verses[i]),
                    onUnsave: () => _unsave(_verses[i]),
                  ),
                ),
    );
  }
}

class _SavedVerseCard extends StatelessWidget {
  final SavedVerse verse;
  final String surahLabel;
  final VoidCallback onUnsave;

  const _SavedVerseCard({
    required this.verse,
    required this.surahLabel,
    required this.onUnsave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _gold.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _gold.withValues(alpha: 0.45)),
                ),
                child: Text(
                  '$surahLabel · ${verse.verseNumber}',
                  style: GoogleFonts.lato(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onUnsave,
                child:
                    const Icon(Icons.bookmark_rounded, size: 22, color: _gold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              verse.arabic,
              textAlign: TextAlign.right,
              style: GoogleFonts.scheherazadeNew(
                fontSize: 24,
                color: Colors.white,
                height: 2.0,
              ),
            ),
          ),
          if (verse.translation.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(height: 1, color: _gold.withValues(alpha: 0.15)),
            const SizedBox(height: 10),
            Text(
              verse.translation,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: _mutedText,
                height: 1.65,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
