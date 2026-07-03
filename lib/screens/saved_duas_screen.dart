import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/duas_data.dart';
import '../l10n/app_localizations.dart';
import '../services/bookmark_service.dart';
import '../widgets/geometric_pattern_painter.dart';

const _kNavy  = Color(0xFF0D1B2A);
const _kCard  = Color(0xFF152840);
const _kGold  = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

/// All duas the user has bookmarked on the Duas screen.
class SavedDuasScreen extends StatefulWidget {
  const SavedDuasScreen({super.key});

  @override
  State<SavedDuasScreen> createState() => _SavedDuasScreenState();
}

class _SavedDuasScreenState extends State<SavedDuasScreen> {
  Set<String> _saved = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final saved = await BookmarkService.loadDuaBookmarks();
    if (mounted) {
      setState(() {
        _saved = saved;
        _loading = false;
      });
    }
  }

  Future<void> _unsave(String arabic) async {
    final saved = await BookmarkService.toggleDuaBookmark(arabic);
    if (mounted) setState(() => _saved = saved);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final duas = allDuas.where((d) => _saved.contains(d.arabic)).toList();

    return Scaffold(
      backgroundColor: _kNavy,
      appBar: AppBar(
        backgroundColor: _kNavy,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _kCard,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _kGold.withValues(alpha: 0.3)),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                size: 16, color: _kGold),
          ),
        ),
        title: Text(
          l10n.savedDuas,
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: _kGold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(
              painter: GeometricPatternPainter(color: _kGold, alpha: 0.04),
            ),
          ),
          if (_loading)
            const Center(child: CircularProgressIndicator(color: _kGold))
          else if (duas.isEmpty)
            SavedEmptyState(message: l10n.noSavedDuas)
          else
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
              itemCount: duas.length,
              itemBuilder: (context, i) => _SavedDuaCard(
                dua: duas[i],
                onUnsave: () => _unsave(duas[i].arabic),
              ),
            ),
        ],
      ),
    );
  }
}

class _SavedDuaCard extends StatelessWidget {
  final CategorizedDua dua;
  final VoidCallback onUnsave;

  const _SavedDuaCard({required this.dua, required this.onUnsave});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final translation = locale == 'ar' ? null : dua.translationFor(locale);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    dua.arabic,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 26,
                      color: _kGold,
                      height: 1.85,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onUnsave,
                  child: const Icon(Icons.bookmark_rounded,
                      size: 22, color: _kGold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              dua.transliteration,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: _kCream.withValues(alpha: 0.6),
                height: 1.6,
              ),
            ),
          ),
          if (translation != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                translation,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: _kCream.withValues(alpha: 0.88),
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              color: _kNavy.withValues(alpha: 0.5),
              border: Border(
                top: BorderSide(color: _kGold.withValues(alpha: 0.15)),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.menu_book_outlined,
                    size: 13, color: _kGold.withValues(alpha: 0.8)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dua.source,
                    style: GoogleFonts.lato(
                      fontSize: 11.5,
                      color: _kGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shared empty state for the three Saved screens: gold bookmark icon over a
/// localized "nothing saved yet" message.
class SavedEmptyState extends StatelessWidget {
  final String message;
  const SavedEmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _kGold.withValues(alpha: 0.08),
                border: Border.all(color: _kGold.withValues(alpha: 0.35)),
              ),
              child: const Icon(Icons.bookmark_rounded,
                  size: 40, color: _kGold),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _kCream.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
