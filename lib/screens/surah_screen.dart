import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../models/reciter_model.dart';
import '../models/surah_model.dart';
import '../services/quran_service.dart';
import '../widgets/font_size_slider.dart';
import 'tafsir_screen.dart';

const _arabicScaleKey = 'quran_arabic_scale';
const double _minArabicScale = 0.8;
const double _maxArabicScale = 4.0;

class SurahScreen extends StatefulWidget {
  final Surah surah;
  const SurahScreen({super.key, required this.surah});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<Verse> _verses = [];
  bool _loading = true;
  bool _requested = false;

  Reciter _selectedReciter = reciters.first;
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingVerseNumber;
  bool _isPlaying = false;

  int _fontScaleIndex = kDefaultFontScaleIndex;

  // Pinch-to-zoom state for the Arabic verse text.
  double _arabicScale = 1.0;
  final Map<int, Offset> _pointerPositions = {};
  double? _pinchStartDistance;
  double _pinchStartArabicScale = 1.0;

  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _isPlaying = state == PlayerState.playing);
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      _playAdjacent(1);
    });
    _loadFontScale();
    _loadArabicScale();
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('quran');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('quran', index);
  }

  Future<void> _loadArabicScale() async {
    final prefs = await SharedPreferences.getInstance();
    final scale = prefs.getDouble(_arabicScaleKey) ?? 1.0;
    if (mounted) setState(() => _arabicScale = scale);
  }

  Future<void> _saveArabicScale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_arabicScaleKey, _arabicScale);
  }

  void _onPointerDown(PointerDownEvent event) {
    _pointerPositions[event.pointer] = event.position;
    if (_pointerPositions.length == 2) {
      final points = _pointerPositions.values.toList();
      _pinchStartDistance = (points[0] - points[1]).distance;
      _pinchStartArabicScale = _arabicScale;
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (!_pointerPositions.containsKey(event.pointer)) return;
    _pointerPositions[event.pointer] = event.position;
    final startDistance = _pinchStartDistance;
    if (_pointerPositions.length == 2 && startDistance != null && startDistance > 0) {
      final points = _pointerPositions.values.toList();
      final distance = (points[0] - points[1]).distance;
      final newScale = (_pinchStartArabicScale * (distance / startDistance))
          .clamp(_minArabicScale, _maxArabicScale);
      if ((newScale - _arabicScale).abs() > 0.01) {
        setState(() => _arabicScale = newScale);
      }
    }
  }

  void _onPointerUp(PointerEvent event) {
    _pointerPositions.remove(event.pointer);
    if (_pointerPositions.length < 2) {
      _pinchStartDistance = null;
    }
    if (_pointerPositions.isEmpty) {
      _saveArabicScale();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_requested) {
      _requested = true;
      _load(Localizations.localeOf(context).languageCode);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _load(String locale) async {
    final verses = await fetchVerses(widget.surah.number, locale: locale);
    if (mounted) setState(() { _verses = verses; _loading = false; });
  }

  // Surah 9 (At-Tawbah) is the only surah without Bismillah
  bool get _showBismillah => widget.surah.number != 9;

  Future<void> _playVerseAudio(int verseNumber) async {
    if (_playingVerseNumber == verseNumber) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
      return;
    }
    final url = _selectedReciter.audioUrl(widget.surah.number, verseNumber);
    setState(() => _playingVerseNumber = verseNumber);
    await _audioPlayer.play(UrlSource(url));
  }

  Future<void> _playAdjacent(int delta) async {
    final current = _playingVerseNumber;
    if (current == null) return;
    final index = _verses.indexWhere((v) => v.number == current);
    if (index == -1) return;
    final newIndex = index + delta;
    if (newIndex < 0) return;
    if (newIndex >= _verses.length) {
      await _audioPlayer.stop();
      if (mounted) {
        setState(() {
          _playingVerseNumber = null;
          _isPlaying = false;
        });
      }
      return;
    }
    await _playVerseAudio(_verses[newIndex].number);
  }

  Future<void> _onSelectReciter(Reciter reciter) async {
    final verseNumber = _playingVerseNumber;
    if (_isPlaying) {
      await _audioPlayer.stop();
    }
    setState(() {
      _selectedReciter = reciter;
      _isPlaying = false;
    });
    if (verseNumber != null) {
      final url = reciter.audioUrl(widget.surah.number, verseNumber);
      await _audioPlayer.play(UrlSource(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              widget.surah.englishName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              widget.surah.name,
              style: GoogleFonts.scheherazadeNew(
                fontSize: 15,
                color: _gold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_stories_outlined),
            tooltip: AppLocalizations.of(context)!.tafsir,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TafsirScreen(surah: widget.surah),
              ),
            ),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: _gold))
          : Column(
              children: [
                FontSizeSlider(
                  index: _fontScaleIndex,
                  onChanged: _onFontScaleChanged,
                ),
                _ReciterSelector(
                  selected: _selectedReciter,
                  onSelect: _onSelectReciter,
                ),
                Expanded(
                  child: Listener(
                    onPointerDown: _onPointerDown,
                    onPointerMove: _onPointerMove,
                    onPointerUp: _onPointerUp,
                    onPointerCancel: _onPointerUp,
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler:
                            TextScaler.linear(kFontScaleSteps[_fontScaleIndex]),
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
                        itemCount: _verses.length + (_showBismillah ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (_showBismillah && index == 0) {
                            return _BismillahHeader(arabicScale: _arabicScale);
                          }
                          final verse =
                              _verses[_showBismillah ? index - 1 : index];
                          return _VerseTile(
                            verse: verse,
                            arabicScale: _arabicScale,
                            isLast: index ==
                                _verses.length + (_showBismillah ? 0 : -1),
                            isPlaying: _playingVerseNumber == verse.number &&
                                _isPlaying,
                            playTooltip: l10n.playVerse,
                            onPlayTap: () => _playVerseAudio(verse.number),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: _playingVerseNumber == null
          ? null
          : _MiniPlayerBar(
              surahName: widget.surah.name,
              verseNumber: _playingVerseNumber!,
              isPlaying: _isPlaying,
              onPlayPause: () => _playVerseAudio(_playingVerseNumber!),
              onPrevious: () => _playAdjacent(-1),
              onNext: () => _playAdjacent(1),
            ),
    );
  }
}

class _ReciterSelector extends StatelessWidget {
  final Reciter selected;
  final ValueChanged<Reciter> onSelect;

  const _ReciterSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < reciters.length; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              _ReciterChip(
                label: reciters[i].shortName,
                selected: reciters[i].id == selected.id,
                onTap: () => onSelect(reciters[i]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ReciterChip extends StatelessWidget {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ReciterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: selected ? _gold : _cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold.withOpacity(selected ? 1 : 0.3)),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          overflow: TextOverflow.visible,
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: selected ? _navy : _gold,
          ),
        ),
      ),
    );
  }
}

class _MiniPlayerBar extends StatelessWidget {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  final String surahName;
  final int verseNumber;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _MiniPlayerBar({
    required this.surahName,
    required this.verseNumber,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        border: Border(top: BorderSide(color: _gold.withOpacity(0.2))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      surahName,
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 18,
                        color: _gold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '— $verseNumber',
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous_rounded),
                    color: _gold,
                    onPressed: onPrevious,
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: _gold,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      ),
                      color: _navy,
                      onPressed: onPlayPause,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next_rounded),
                    color: _gold,
                    onPressed: onNext,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BismillahHeader extends StatelessWidget {
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  final double arabicScale;

  const _BismillahHeader({this.arabicScale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Text(
          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
          textAlign: TextAlign.center,
          style: GoogleFonts.scheherazadeNew(
            fontSize: 26 * arabicScale,
            color: _gold,
            height: 1.8,
          ),
        ),
      ),
    );
  }
}

class _VerseTile extends StatelessWidget {
  final Verse verse;
  final double arabicScale;
  final bool isLast;
  final bool isPlaying;
  final String playTooltip;
  final VoidCallback onPlayTap;

  const _VerseTile({
    required this.verse,
    this.arabicScale = 1.0,
    required this.isLast,
    required this.isPlaying,
    required this.playTooltip,
    required this.onPlayTap,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Verse number + Arabic text row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Arabic text (expands, RTL)
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        verse.arabic,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 24 * arabicScale,
                          color: Colors.white,
                          height: 1.9,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Gold verse number circle
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
                      '${verse.number}',
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
              if (verse.transliteration.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  verse.transliteration,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    color: _gold,
                    height: 1.5,
                  ),
                ),
              ],
              if (verse.translation.isNotEmpty) ...[
                const SizedBox(height: 12),
                // Gold divider
                Container(
                  height: 1,
                  color: _gold.withOpacity(0.2),
                ),
                const SizedBox(height: 12),
                // Translation (hidden for Arabic — the Arabic text is the original)
                Text(
                  verse.translation,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: _mutedText,
                    height: 1.6,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: _PlayButton(
                  isPlaying: isPlaying,
                  tooltip: playTooltip,
                  onTap: onPlayTap,
                ),
              ),
            ],
          ),
        ),
        if (!isLast) const SizedBox(height: 8),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  static const _gold = Color(0xFFD4AF37);

  final bool isPlaying;
  final String tooltip;
  final VoidCallback onTap;

  const _PlayButton({
    required this.isPlaying,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gold.withOpacity(0.12),
            border: Border.all(color: _gold.withOpacity(0.5)),
          ),
          alignment: Alignment.center,
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: _gold,
            size: 18,
          ),
        ),
      ),
    );
  }
}
