import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/tafsir_data.dart';
import '../l10n/app_localizations.dart';
import '../models/surah_model.dart';
import '../models/tafsir_model.dart';
import '../services/quran_service.dart';
import '../services/tafsir_api_service.dart';
import '../widgets/font_size_slider.dart';

const _gold = Color(0xFFD4AF37);

class TafsirScreen extends StatefulWidget {
  final Surah surah;
  const TafsirScreen({super.key, required this.surah});

  @override
  State<TafsirScreen> createState() => _TafsirScreenState();
}

class _TafsirScreenState extends State<TafsirScreen> {
  static const _navy = Color(0xFF0D1B2A);

  List<Verse> _verses = [];
  Map<int, TafsirApiResult>? _apiTafsir;
  bool _loading = true;
  bool _requested = false;

  int _fontScaleIndex = kDefaultFontScaleIndex;

  @override
  void initState() {
    super.initState();
    _loadFontScale();
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('tafsir');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('tafsir', index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_requested) {
      _requested = true;
      _load(Localizations.localeOf(context).languageCode);
    }
  }

  Future<void> _load(String locale) async {
    final entries = tafsirData[widget.surah.number];
    final verses = await fetchVerses(widget.surah.number, locale: locale);

    if (entries != null && entries.isNotEmpty) {
      if (mounted) setState(() { _verses = verses; _loading = false; });
      return;
    }

    if (mounted) setState(() => _verses = verses);

    final apiTafsir = <int, TafsirApiResult>{};
    for (final verse in verses) {
      final result = await TafsirApiService.instance.fetchTafsirVerse(
        widget.surah.number,
        verse.number,
        locale,
      );
      if (result != null) apiTafsir[verse.number] = result;
    }

    if (mounted) {
      setState(() {
        _apiTafsir = apiTafsir;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final entries = tafsirData[widget.surah.number];
    final apiTafsir = _apiTafsir;

    Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator(color: _gold));
    } else if (entries != null && entries.isNotEmpty) {
      body = ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final arabic = _arabicFor(entry);
          final translation = _translationFor(entry);
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _TafsirCard(
              entry: entry,
              arabic: arabic,
              translation: translation,
            ),
          );
        },
      );
    } else if (apiTafsir != null && apiTafsir.isNotEmpty) {
      body = ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
        itemCount: _verses.length,
        itemBuilder: (context, index) {
          final verse = _verses[index];
          final tafsir = apiTafsir[verse.number];
          if (tafsir == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ApiTafsirCard(
              verseLabel: '${verse.number}',
              arabic: verse.arabic,
              translation: verse.translation,
              tafsirText: tafsir.text,
              source: tafsir.source,
            ),
          );
        },
      );
    } else {
      body = _ComingSoon(message: l10n.tafsirNotAvailable);
    }

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              l10n.tafsir,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              widget.surah.englishName,
              style: GoogleFonts.lato(
                fontSize: 12,
                color: _gold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FontSizeSlider(
            index: _fontScaleIndex,
            onChanged: _onFontScaleChanged,
          ),
          Expanded(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(kFontScaleSteps[_fontScaleIndex]),
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }

  String _arabicFor(TafsirEntry entry) {
    return _versesFor(entry).map((v) => v.arabic).join('\n');
  }

  String _translationFor(TafsirEntry entry) {
    return _versesFor(entry).map((v) => v.translation).where((t) => t.isNotEmpty).join(' ');
  }

  List<Verse> _versesFor(TafsirEntry entry) {
    return _verses.where((v) => entry.verses.contains(v.number)).toList();
  }
}

class _ComingSoon extends StatelessWidget {
  static const _mutedText = Color(0xFF8A9BB0);

  final String message;
  const _ComingSoon({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu_book_outlined, color: _gold.withOpacity(0.6), size: 48),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: _mutedText,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shared card shell: Arabic verse text + verse number badge + translation,
/// with an expandable tafsir section below. [tafsirBody] supplies the
/// expandable content (tafsir text, source badges, etc.).
class _TafsirCardShell extends StatefulWidget {
  final String verseLabel;
  final String arabic;
  final String translation;
  final Widget tafsirBody;

  const _TafsirCardShell({
    required this.verseLabel,
    required this.arabic,
    required this.translation,
    required this.tafsirBody,
  });

  @override
  State<_TafsirCardShell> createState() => _TafsirCardShellState();
}

class _TafsirCardShellState extends State<_TafsirCardShell> {
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Verse number + Arabic text row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.arabic,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 24,
                      color: Colors.white,
                      height: 1.9,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _gold, width: 1.5),
                  color: _gold.withOpacity(0.1),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.verseLabel,
                  textScaler: TextScaler.noScaling,
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                  ),
                ),
              ),
            ],
          ),
          if (widget.translation.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(height: 1, color: _gold.withOpacity(0.2)),
            const SizedBox(height: 12),
            Text(
              widget.translation,
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: _mutedText,
                height: 1.6,
              ),
            ),
          ],
          const SizedBox(height: 14),
          // Tafsir header (tap to expand/collapse)
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                const Icon(Icons.auto_stories_outlined, color: _gold, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.tafsir,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 220),
            crossFadeState:
                _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: widget.tafsirBody,
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _TafsirCard extends StatelessWidget {
  final TafsirEntry entry;
  final String arabic;
  final String translation;

  const _TafsirCard({
    required this.entry,
    required this.arabic,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final asbab = entry.asbabText(locale);

    return _TafsirCardShell(
      verseLabel: entry.verseLabel,
      arabic: arabic,
      translation: translation,
      tafsirBody: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            entry.tafsirText(locale),
            style: GoogleFonts.lato(
              fontSize: 13.5,
              color: Colors.white.withOpacity(0.85),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: entry.scholarKeys.map((key) {
              final scholar = tafsirScholars[key];
              if (scholar == null) return const SizedBox.shrink();
              return _ScholarBadge(
                label: '${l10n.scholarSource}: ${scholar.name(locale)}',
              );
            }).toList(),
          ),
          if (asbab != null) ...[
            const SizedBox(height: 12),
            _AsbabBox(title: l10n.asbabAlNuzul, text: asbab),
          ],
        ],
      ),
    );
  }
}

/// A tafsir card backed by quranenc.com data for surahs without hardcoded
/// tafsir entries.
class _ApiTafsirCard extends StatelessWidget {
  final String verseLabel;
  final String arabic;
  final String translation;
  final String tafsirText;
  final String source;

  const _ApiTafsirCard({
    required this.verseLabel,
    required this.arabic,
    required this.translation,
    required this.tafsirText,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return _TafsirCardShell(
      verseLabel: verseLabel,
      arabic: arabic,
      translation: translation,
      tafsirBody: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            tafsirText,
            style: GoogleFonts.lato(
              fontSize: 13.5,
              color: Colors.white.withOpacity(0.85),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          _ScholarBadge(label: '${l10n.scholarSource}: $source'),
        ],
      ),
    );
  }
}

class _ScholarBadge extends StatelessWidget {
  final String label;
  const _ScholarBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _gold.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: _gold,
        ),
      ),
    );
  }
}

class _AsbabBox extends StatelessWidget {
  final String title;
  final String text;
  const _AsbabBox({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _gold.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
        border: BorderDirectional(start: BorderSide(color: _gold.withOpacity(0.5), width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 12.5,
              color: Colors.white.withOpacity(0.8),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
