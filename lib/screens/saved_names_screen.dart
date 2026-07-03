import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../models/asma_ul_husna_model.dart';
import '../services/bookmark_service.dart';
import 'saved_duas_screen.dart' show SavedEmptyState;

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _cardColor = Color(0xFF152030);
const _mutedText = Color(0xFF8A9BB0);

/// All of the 99 Names the user has bookmarked on the Asma ul Husna screen.
class SavedNamesScreen extends StatefulWidget {
  const SavedNamesScreen({super.key});

  @override
  State<SavedNamesScreen> createState() => _SavedNamesScreenState();
}

class _SavedNamesScreenState extends State<SavedNamesScreen> {
  Set<int> _saved = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final saved = await BookmarkService.loadNameBookmarks();
    if (mounted) {
      setState(() {
        _saved = saved;
        _loading = false;
      });
    }
  }

  Future<void> _unsave(int number) async {
    final saved = await BookmarkService.toggleNameBookmark(number);
    if (mounted) setState(() => _saved = saved);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final names =
        asmaUlHusnaNames.where((n) => _saved.contains(n.number)).toList();

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.savedNames,
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
          : names.isEmpty
              ? SavedEmptyState(message: l10n.noSavedNames)
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
                  itemCount: names.length,
                  itemBuilder: (context, i) => _SavedNameCard(
                    name: names[i],
                    locale: locale,
                    onUnsave: () => _unsave(names[i].number),
                  ),
                ),
    );
  }
}

class _SavedNameCard extends StatelessWidget {
  final AsmaName name;
  final String locale;
  final VoidCallback onUnsave;

  const _SavedNameCard({
    required this.name,
    required this.locale,
    required this.onUnsave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _gold, width: 1.5),
                  color: _gold.withValues(alpha: 0.1),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${name.number}',
                  textScaler: TextScaler.noScaling,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        name.arabic,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: _gold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name.transliteration,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: _gold.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      name.meaningText(locale),
                      style: GoogleFonts.lato(
                        fontSize: 13.5,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onUnsave,
                child:
                    const Icon(Icons.bookmark_rounded, size: 22, color: _gold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(height: 1, color: _gold.withValues(alpha: 0.15)),
          const SizedBox(height: 10),
          Text(
            name.explanationText(locale),
            style: GoogleFonts.lato(
              fontSize: 13,
              color: _mutedText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
