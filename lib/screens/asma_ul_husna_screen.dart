import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../models/asma_ul_husna_model.dart';
import '../widgets/font_size_slider.dart';

class AsmaUlHusnaScreen extends StatefulWidget {
  const AsmaUlHusnaScreen({super.key});

  @override
  State<AsmaUlHusnaScreen> createState() => _AsmaUlHusnaScreenState();
}

class _AsmaUlHusnaScreenState extends State<AsmaUlHusnaScreen> {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _mutedText = Color(0xFF8A9BB0);

  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  int _fontScaleIndex = kDefaultFontScaleIndex;

  @override
  void initState() {
    super.initState();
    _loadFontScale();
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('asma');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('asma', index);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    final query = _query.trim().toLowerCase();
    final names = query.isEmpty
        ? asmaUlHusnaNames
        : asmaUlHusnaNames.where((name) {
            final arabic = name.arabic;
            final translit = name.transliteration.toLowerCase();
            final meaningCurrent = name.meaningText(locale).toLowerCase();
            final meaningEn = name.meaning['en']!.toLowerCase();
            return arabic.contains(_query.trim()) ||
                translit.contains(query) ||
                meaningCurrent.contains(query) ||
                meaningEn.contains(query);
          }).toList();

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          l10n.asmaUlHusna,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _gold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.asmaUlHusnaSubtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _mutedText,
                  ),
                ),
                const SizedBox(height: 14),
                _HadithBanner(
                  hadith: l10n.asmaHadith,
                  source: l10n.asmaHadithSource,
                ),
                const SizedBox(height: 14),
                _SearchField(
                  controller: _searchController,
                  hintText: l10n.asmaSearchHint,
                  onChanged: (value) => setState(() => _query = value),
                ),
              ],
            ),
          ),
          FontSizeSlider(
            index: _fontScaleIndex,
            onChanged: _onFontScaleChanged,
          ),
          Expanded(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(kFontScaleSteps[_fontScaleIndex]),
              ),
              child: names.isEmpty
                  ? Center(
                      child: Text(
                        l10n.asmaNoResults,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: _mutedText,
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        final name = names[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _AsmaCard(
                            name: name,
                            locale: locale,
                            significanceLabel: l10n.asmaSignificance,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HadithBanner extends StatelessWidget {
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  final String hadith;
  final String source;

  const _HadithBanner({required this.hadith, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.format_quote_rounded, color: _gold, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  hadith,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.92),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '— $source',
              style: GoogleFonts.lato(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: _gold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  const _SearchField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _gold.withOpacity(0.25)),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.lato(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
            color: const Color(0xFF8A9BB0),
            fontSize: 14,
          ),
          prefixIcon: const Icon(Icons.search, color: _gold, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

class _AsmaCard extends StatefulWidget {
  final AsmaName name;
  final String locale;
  final String significanceLabel;

  const _AsmaCard({
    required this.name,
    required this.locale,
    required this.significanceLabel,
  });

  @override
  State<_AsmaCard> createState() => _AsmaCardState();
}

class _AsmaCardState extends State<_AsmaCard> {
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final name = widget.name;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _gold.withOpacity(0.15)),
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
                    color: _gold.withOpacity(0.1),
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
                          color: _gold.withOpacity(0.85),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        name.meaningText(widget.locale),
                        style: GoogleFonts.lato(
                          fontSize: 13.5,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: _gold.withOpacity(0.7),
                    size: 22,
                  ),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 220),
              crossFadeState:
                  _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(height: 1, color: _gold.withOpacity(0.15)),
                    const SizedBox(height: 12),
                    Text(
                      widget.significanceLabel,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: _gold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name.explanationText(widget.locale),
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: _mutedText,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
