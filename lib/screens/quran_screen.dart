import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/surah_translations.dart';
import '../models/surah_model.dart';
import '../services/quran_player_controller.dart';
import '../services/quran_service.dart';
import '../services/quran_full_index.dart';
import '../utils/islamic_synonyms.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/quran_mini_player.dart';
import 'surah_screen.dart';
import 'saved_verses_screen.dart';
import '../l10n/app_localizations.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Surah> _surahs = [];
  bool _loading = true;
  bool _failed = false;
  final _searchController = TextEditingController();
  String _query = '';
  String _currentLocale = 'en';
  List<QuranSearchResult> _searchResults = [];

  // True once BannerAdWidget has actually loaded an ad — used to reserve
  // extra bottom padding for the lists so the fixed ad banner (shown above
  // the mini player) never covers the last tile. Never reverts to false:
  // BannerAdWidget itself never un-shows an ad once loaded.
  bool _adVisible = false;

  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);

  @override
  void initState() {
    super.initState();
    _load();
    _searchController.addListener(_onSearch);
    // Re-run search when full index or localized translations finish loading.
    QuranFullIndex.isLoadedNotifier.addListener(_onIndexUpdated);
    QuranFullIndex.localizedNotifier.addListener(_onIndexUpdated);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context).languageCode;
    if (locale != _currentLocale) {
      _currentLocale = locale;
      // Start fetching localized translations for the new language.
      QuranFullIndex.ensure(locale);
      // Re-run the active search immediately so suggestions, headings, and any
      // already-loaded translations reflect the new language without requiring
      // the user to clear and retype.
      if (_query.isNotEmpty) {
        setState(() {
          _searchResults = QuranFullIndex.search(_query, locale);
        });
      }
    } else {
      // Idempotent — safe to call on every rebuild.
      QuranFullIndex.ensure(locale);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    QuranFullIndex.isLoadedNotifier.removeListener(_onIndexUpdated);
    QuranFullIndex.localizedNotifier.removeListener(_onIndexUpdated);
    super.dispose();
  }

  Future<void> _load() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _failed = false;
      });
    }
    final surahs = await fetchSurahs();
    if (mounted) {
      setState(() {
        _surahs = surahs;
        _loading = false;
        _failed = surahs.isEmpty;
      });
    }
  }

  void _onIndexUpdated() {
    if (!mounted) return;
    // Guard: if the notifier fired for a different locale (race condition while
    // language was changing), kick off loading for the locale we actually need.
    QuranFullIndex.ensure(_currentLocale);
    if (_query.isNotEmpty) {
      setState(() {
        _searchResults = QuranFullIndex.search(_query, _currentLocale);
      });
    } else {
      // Trigger a rebuild so the index-status banner disappears.
      setState(() {});
    }
  }

  void _onSearch() {
    final raw = _searchController.text.trim();
    setState(() {
      _query = raw;
      _searchResults =
          raw.isEmpty ? [] : QuranFullIndex.search(raw, _currentLocale);
    });
  }

  void _openSurah(int surahNumber, {int? initialVerse}) {
    final surah = _surahs.firstWhere(
      (s) => s.number == surahNumber,
      orElse: () => _surahs.isEmpty
          ? Surah(
              number: surahNumber,
              name: '',
              englishName: '',
              englishNameTranslation: '',
              numberOfAyahs: 0,
              revelationType: '',
            )
          : _surahs.first,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SurahScreen(
          surah: surah,
          initialVerseNumber: initialVerse,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searching = _query.isNotEmpty;
    final indexReady = QuranFullIndex.isLoaded;

    return Scaffold(
      backgroundColor: _navy,
      body: ListenableBuilder(
        listenable: QuranPlayerController.instance,
        builder: (context, _) {
          final miniPlayerVisible =
              QuranPlayerController.instance.hasActiveSession;
          // Extra bottom clearance so the fixed ad banner / mini player
          // cluster (see the Positioned stack below) never covers the last
          // tile: QuranMiniPlayer's own 64px when a session is active, a
          // ~58px ad once one has actually loaded, plus the 8px gap between
          // them that only exists when both are showing at once.
          final bottomListPadding = 24.0 +
              (miniPlayerVisible ? QuranMiniPlayer.height : 0) +
              (_adVisible ? 58.0 : 0) +
              (_adVisible && miniPlayerVisible ? 8.0 : 0);
          final listPadding =
              EdgeInsets.fromLTRB(16, 4, 16, bottomListPadding);

          return Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    _Header(),
                    _SearchBar(controller: _searchController),
                    // Subtle banner while the full index is being built.
                    if (searching && !indexReady) const _IndexingBanner(),
                    Expanded(
                      child: _loading
                          ? const Center(
                              child:
                                  CircularProgressIndicator(color: _gold),
                            )
                          : _failed && !searching
                              ? _FailedState(onRetry: _load)
                              : searching
                                  ? _searchResults.isEmpty
                                      ? _NoResultsState(query: _query)
                                      : ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          padding: listPadding,
                                          itemCount: _searchResults.length,
                                          itemBuilder: (context, i) =>
                                              _AyahTile(
                                            result: _searchResults[i],
                                            onTap: () => _openSurah(
                                              _searchResults[i].surahNumber,
                                              initialVerse: _searchResults[i]
                                                  .ayahNumber,
                                            ),
                                          ),
                                        )
                                  : _surahs.isEmpty
                                      ? _FailedState(onRetry: _load)
                                      : ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          padding: listPadding,
                                          itemCount: _surahs.length,
                                          itemBuilder: (context, i) =>
                                              _SurahTile(
                                            surah: _surahs[i],
                                            onTap: () =>
                                                _openSurah(_surahs[i].number),
                                          ),
                                        ),
                    ),
                  ],
                ),
              ),
              // Fixed cluster pinned above the floating bottom nav pill.
              // HomeScreen's Scaffold uses extendBody: true, which makes
              // Flutter itself rewrite MediaQuery.padding.bottom for
              // everything inside body to max(rawDeviceInset,
              // bottomNavigationBarHeight) — see _BodyBuilder in the
              // framework's scaffold.dart — specifically so a SafeArea (or,
              // here, this Positioned) can clear the nav bar with no
              // hardcoded height. MediaQuery.of(context).padding.bottom is
              // therefore ALREADY the full ~126px nav-bar clearance (92px
              // pill+gap plus the device's own inset) — adding another 92 on
              // top of it (as this used to) double-counts the nav bar and
              // pushes everything 92px too high, which is exactly the gap
              // that was reported. The mini player sits flush against the
              // nav bar with no gap when no ad is showing; the 8px gap
              // above it only exists once onVisibilityChanged reports an ad
              // is actually rendering, so it never leaves dead space behind
              // for a free user whose ad hasn't loaded (or hasn't cleared
              // the install-date delay) yet.
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).padding.bottom,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BannerAdWidget(
                      onVisibilityChanged: (visible) {
                        if (mounted) setState(() => _adVisible = visible);
                      },
                    ),
                    // Only separate the two when there's actually a mini
                    // player below to separate from — otherwise this would
                    // just reproduce the same dead-space bug against the
                    // nav bar for an ad shown with no session active.
                    if (_adVisible && miniPlayerVisible)
                      const SizedBox(height: 8),
                    const QuranMiniPlayer(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    l10n.alQuran,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'القرآن الكريم',
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 20,
                    color: const Color(0xFFD4AF37),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const _SavedButton(),
        ],
      ),
    );
  }
}

// ─── Saved verses button ────────────────────────────────────────────────────

class _SavedButton extends StatelessWidget {
  const _SavedButton();

  static const _gold = Color(0xFFC9A84C);
  static const _cardColor = Color(0xFF152030);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SavedVersesScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold, width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bookmark_rounded, size: 15, color: _gold),
            const SizedBox(width: 6),
            Text(
              l10n.savedButtonLabel,
              style: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: _gold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Search bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: TextField(
        controller: controller,
        style: GoogleFonts.lato(color: Colors.white),
        decoration: InputDecoration(
          hintText: l10n.searchSurahs,
          hintStyle: GoogleFonts.lato(color: const Color(0xFF8A9BB0)),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8A9BB0)),
          filled: true,
          fillColor: const Color(0xFF152030),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// ─── Indexing progress banner ─────────────────────────────────────────────────

class _IndexingBanner extends StatelessWidget {
  const _IndexingBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF152030),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFD4AF37).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: const Color(0xFFD4AF37).withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context)!.loadingQuranIndex,
            style: GoogleFonts.lato(
              fontSize: 11,
              color: const Color(0xFF8A9BB0),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── No-results state ─────────────────────────────────────────────────────────

class _NoResultsState extends StatelessWidget {
  final String query;
  const _NoResultsState({required this.query});

  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final suggestions = l10n.quranSearchSuggestions
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off_rounded, color: _mutedText, size: 48),
            const SizedBox(height: 16),
            Text(
              l10n.noAyahsFound(query),
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.trySearchingQuran,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 12, color: _mutedText),
            ),
            const SizedBox(height: 14),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 6,
              runSpacing: 6,
              children: suggestions
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _gold.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: _gold.withValues(alpha: 0.3), width: 1),
                        ),
                        child: Text(
                          s,
                          style: GoogleFonts.lato(
                              fontSize: 11,
                              color: _gold.withValues(alpha: 0.9)),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Error / retry state ──────────────────────────────────────────────────────

class _FailedState extends StatelessWidget {
  final VoidCallback onRetry;
  const _FailedState({required this.onRetry});

  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _gold.withValues(alpha: 0.08),
              border:
                  Border.all(color: _gold.withValues(alpha: 0.3), width: 1.5),
            ),
            child: const Icon(Icons.menu_book_rounded, color: _gold, size: 32),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.couldNotLoadSurahs,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.connectionError,
            style: GoogleFonts.lato(fontSize: 13, color: _mutedText),
          ),
          const SizedBox(height: 28),
          GestureDetector(
            onTap: onRetry,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
              decoration: BoxDecoration(
                color: _gold,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                l10n.tryAgain,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0D1B2A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Surah browse tile ────────────────────────────────────────────────────────

class _SurahTile extends StatelessWidget {
  final Surah surah;
  final VoidCallback onTap;

  const _SurahTile({required this.surah, required this.onTap});

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final nameTranslation = surahNameTranslations[surah.number]?[locale] ??
        surah.englishNameTranslation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _gold, width: 1.5),
                color: _gold.withValues(alpha: 0.1),
              ),
              alignment: Alignment.center,
              child: Text(
                '${surah.number}',
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
                  Text(
                    surah.englishName,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    nameTranslation,
                    style: GoogleFonts.lato(fontSize: 12, color: _mutedText),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  surah.name,
                  style:
                      GoogleFonts.scheherazadeNew(fontSize: 18, color: _gold),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.ayahs(surah.numberOfAyahs),
                  style: GoogleFonts.lato(fontSize: 11, color: _mutedText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Ayah search result tile ──────────────────────────────────────────────────

class _AyahTile extends StatelessWidget {
  final QuranSearchResult result;
  final VoidCallback onTap;

  const _AyahTile({required this.result, required this.onTap});

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);
  static const _accentBorder = Color(0xFF1E3048);

  @override
  Widget build(BuildContext context) {
    final ref = '${result.surahNumber}:${result.ayahNumber}';
    final bare = IslamicSynonyms.stripArticle(result.surahName);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _accentBorder, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Header: surah pill + reference ───────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                color: _gold.withValues(alpha: 0.07),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(13)),
              ),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                      color: _gold.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: _gold.withValues(alpha: 0.4), width: 1),
                    ),
                    child: Text(
                      result.surahName,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: _gold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ref,
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    bare,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 15,
                      color: _gold.withValues(alpha: 0.8),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            // ── Arabic text ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
              child: Text(
                result.arabic,
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.8,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            // ── Translation ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
              child: Text(
                result.translation,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  color: _mutedText,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
