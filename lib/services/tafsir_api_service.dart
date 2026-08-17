import 'dart:convert';
import 'package:http/http.dart' as http;

/// A single ayah's tafsir fetched from quranenc.com.
class TafsirApiResult {
  final String text;
  final String source;

  /// True when [text] is the English tafsir shown in place of one for the
  /// originally requested language, because that language has no source
  /// coverage (see [TafsirApiService._sources]).
  final bool isFallback;

  const TafsirApiResult({
    required this.text,
    required this.source,
    this.isFallback = false,
  });
}

class _TafsirSource {
  final String key;
  final String label;
  const _TafsirSource(this.key, this.label);
}

/// Fetches Quranic tafsir (commentary) from the quranenc.com API for surahs
/// that have no hardcoded tafsir in [tafsirData].
///
/// quranenc.com does not publish a translation_key literally named
/// "ibn_katheer" for every language. Where it doesn't exist we fall back to
/// the closest available scholarly tafsir (Al-Mukhtasar / At-Tafsir
/// Al-Muyassar, both of which draw heavily on Ibn Kathir).
class TafsirApiService {
  TafsirApiService._();
  static final TafsirApiService instance = TafsirApiService._();

  static const _baseUrl = 'https://quranenc.com/api/v1/translation/sura';

  // TODO: Add quranenc.com source keys for the 12 languages currently missing
  // tafsir API coverage — they fall back to the English tafsir (see
  // fetchTafsirVerse below) rather than showing nothing:
  //   fr (French), id (Indonesian), zh (Chinese), ja (Japanese), bn (Bengali),
  //   tr (Turkish), sw (Swahili), de (German), nl (Dutch), pt (Portuguese),
  //   it (Italian), fa (Persian)
  // Browse available keys at: https://quranenc.com/api/v1/translations/list
  static const Map<String, List<_TafsirSource>> _sources = {
    'en': [
      _TafsirSource('english_ibn_katheer', 'Tafsir Ibn Kathir'),
      _TafsirSource('english_mokhtasar', 'Al-Mukhtasar Tafsir'),
    ],
    'ar': [
      _TafsirSource('arabic_ibn_katheer', 'تفسير ابن كثير'),
      _TafsirSource('arabic_mokhtasar', 'التفسير الميسر (المختصر)'),
      _TafsirSource('arabic_moyassar', 'التفسير الميسر'),
    ],
    'ur': [
      _TafsirSource('urdu_ibn_katheer', 'تفسیر ابن کثیر'),
    ],
    'es': [
      _TafsirSource('spanish_montada', 'Tafsir Al-Muntada'),
      _TafsirSource('spanish_mokhtasar', 'Al-Mukhtasar Tafsir'),
      _TafsirSource('spanish_montada_eu', 'Tafsir Al-Muntada'),
    ],
  };

  /// Per-surah cache, keyed as "languageCode-surahNumber".
  /// A `null` value means "fetched, but no tafsir is available".
  final Map<String, Map<int, TafsirApiResult>?> _surahCache = {};
  final Map<String, Future<Map<int, TafsirApiResult>?>> _inFlight = {};

  /// Returns the tafsir for [surahNumber]/[verseNumber] in [language]. If
  /// [language] has no source coverage (or the surah is missing for it),
  /// falls back to the English tafsir — marked via [TafsirApiResult.isFallback]
  /// — so a supported verse is shown instead of nothing. Returns `null` only
  /// when no tafsir is available in English either.
  Future<TafsirApiResult?> fetchTafsirVerse(
    int surahNumber,
    int verseNumber,
    String language,
  ) async {
    final surah = await _fetchSurah(surahNumber, language);
    final result = surah?[verseNumber];
    if (result != null) return result;
    if (language == 'en') return null;

    final fallbackSurah = await _fetchSurah(surahNumber, 'en');
    final fallbackResult = fallbackSurah?[verseNumber];
    if (fallbackResult == null) return null;
    return TafsirApiResult(
      text: fallbackResult.text,
      source: fallbackResult.source,
      isFallback: true,
    );
  }

  Future<Map<int, TafsirApiResult>?> _fetchSurah(
    int surahNumber,
    String language,
  ) {
    final cacheKey = '$language-$surahNumber';
    if (_surahCache.containsKey(cacheKey)) {
      return Future.value(_surahCache[cacheKey]);
    }
    return _inFlight.putIfAbsent(cacheKey, () async {
      final result = await _loadSurah(surahNumber, language);
      _surahCache[cacheKey] = result;
      _inFlight.remove(cacheKey);
      return result;
    });
  }

  Future<Map<int, TafsirApiResult>?> _loadSurah(
    int surahNumber,
    String language,
  ) async {
    final candidates = _sources[language];
    if (candidates == null) return null;
    for (final source in candidates) {
      final result = await _fetchFromKey(source, surahNumber);
      if (result != null && result.isNotEmpty) return result;
    }
    return null;
  }

  Future<Map<int, TafsirApiResult>?> _fetchFromKey(
    _TafsirSource source,
    int surahNumber,
  ) async {
    final uri = Uri.parse('$_baseUrl/${source.key}/$surahNumber');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 15));
      if (response.statusCode != 200) return null;

      final body = response.body.trim();
      if (body.isEmpty || body == '""') return null;

      final decoded = jsonDecode(body);
      if (decoded is! Map<String, dynamic>) return null;
      final result = decoded['result'];
      if (result is! List || result.isEmpty) return null;

      final verses = <int, TafsirApiResult>{};
      for (final item in result) {
        if (item is! Map<String, dynamic>) continue;
        final verseNumber = int.tryParse('${item['aya']}');
        final translation = (item['translation'] as String?)?.trim();
        if (verseNumber == null || translation == null || translation.isEmpty) {
          continue;
        }
        verses[verseNumber] = TafsirApiResult(text: translation, source: source.label);
      }
      return verses.isEmpty ? null : verses;
    } catch (_) {
      return null;
    }
  }
}
