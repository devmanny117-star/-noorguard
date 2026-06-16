import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/surah_translations.dart';
import '../models/surah_model.dart';
import '../services/quran_service.dart';
import 'surah_screen.dart';
import '../l10n/app_localizations.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Surah> _surahs = [];
  List<Surah> _filtered = [];
  bool _loading = true;
  bool _failed = false;
  final _searchController = TextEditingController();

  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  void initState() {
    super.initState();
    _load();
    _searchController.addListener(_onSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (mounted) setState(() { _loading = true; _failed = false; });
    final surahs = await fetchSurahs();
    if (mounted) {
      setState(() {
        _surahs = surahs;
        _filtered = surahs;
        _loading = false;
        _failed = surahs.isEmpty;
      });
    }
  }

  void _onSearch() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      _filtered = q.isEmpty
          ? _surahs
          : _surahs.where((s) {
              return s.englishName.toLowerCase().contains(q) ||
                  s.englishNameTranslation.toLowerCase().contains(q) ||
                  s.name.contains(q);
            }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            _SearchBar(controller: _searchController),
            Expanded(
              child: _loading
                  ? const Center(
                      child: CircularProgressIndicator(color: _gold),
                    )
                  : _failed
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _gold.withValues(alpha: 0.08),
                                  border: Border.all(
                                      color: _gold.withValues(alpha: 0.3), width: 1.5),
                                ),
                                child: const Icon(Icons.menu_book_rounded,
                                    color: _gold, size: 32),
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
                                style: GoogleFonts.lato(
                                    fontSize: 13, color: _mutedText),
                              ),
                              const SizedBox(height: 28),
                              GestureDetector(
                                onTap: _load,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 13),
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
                        )
                      : _filtered.isEmpty
                          ? Center(
                              child: Text(
                                l10n.noSurahsFound,
                                style: GoogleFonts.lato(color: _mutedText),
                              ),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                              itemCount: _filtered.length,
                              itemBuilder: (context, i) => _SurahTile(
                                surah: _filtered[i],
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        SurahScreen(surah: _filtered[i]),
                                  ),
                                ),
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Text(
            l10n.alQuran,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
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
    );
  }
}

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
            // Gold number circle
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
            // English name + translation
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
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: _mutedText,
                    ),
                  ),
                ],
              ),
            ),
            // Arabic name + ayah count
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  surah.name,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 18,
                    color: _gold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.ayahs(surah.numberOfAyahs),
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: _mutedText,
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
