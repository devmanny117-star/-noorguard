import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../data/ayah_search_index.dart';
import '../utils/islamic_synonyms.dart';

// ── Public result type ────────────────────────────────────────────────────────

class QuranSearchResult {
  final int surahNumber;
  final String surahName;
  final int ayahNumber;
  final String arabic;
  final String translation; // best available for the current locale

  const QuranSearchResult({
    required this.surahNumber,
    required this.surahName,
    required this.ayahNumber,
    required this.arabic,
    required this.translation,
  });
}

// ── Internal compact entry ────────────────────────────────────────────────────

class _E {
  final int s;  // surahNumber
  final String n; // surahName (englishName)
  final int a;  // ayahNumber (numberInSurah)
  final String ar; // arabic text
  final String en; // english translation

  const _E(this.s, this.n, this.a, this.ar, this.en);
}

// ── Locale → alquran.cloud edition mapping ────────────────────────────────────

const _localeEditions = <String, String>{
  'ur': 'ur.jalandhry',
  'fa': 'fa.ayeh',
  'es': 'es.cortes',
  'fr': 'fr.hamidullah',
  'id': 'id.indonesian',
  'de': 'de.bubenheim',
  'nl': 'nl.keyzer',
  'tr': 'tr.diyanet',
  'bn': 'bn.bengali',
  'zh': 'zh.majian',
  'ja': 'ja.japanese',
  'pt': 'pt.elhayek',
  'it': 'it.piccardo',
  'sw': 'sw.barwani',
};

const _cacheVersion = 3;

// ── QuranFullIndex ─────────────────────────────────────────────────────────────

class QuranFullIndex {
  QuranFullIndex._();

  // Core index: Arabic + English for all 6 236 ayahs.
  static final List<_E> _core = [];

  // Localized translations fetched on demand (key = "s:a").
  static final Map<String, String> _local = {};
  static String? _localLocale;
  static bool _localLoading = false;

  static bool _coreLoading = false;

  /// Fires when the core (Arabic + English) index is ready.
  static final ValueNotifier<bool> isLoadedNotifier = ValueNotifier(false);

  /// Toggles every time localized translations for a new locale arrive.
  static final ValueNotifier<bool> localizedNotifier = ValueNotifier(false);

  static bool get isLoaded => isLoadedNotifier.value;

  // ── Public API ──────────────────────────────────────────────────────────────

  /// Call from didChangeDependencies.  Safe to call repeatedly — idempotent.
  static Future<void> ensure(String locale) async {
    if (!isLoaded && !_coreLoading) {
      _coreLoading = true;
      try {
        final fromCache = await _loadCache();
        if (!fromCache) await _fetchCore();
        isLoadedNotifier.value = true;
      } catch (_) {
        // Core failed; curated fallback still works in search().
      } finally {
        _coreLoading = false;
      }
    }
    _ensureLocalized(locale);
  }

  /// Synchronous search across all loaded ayahs.  Returns up to [maxResults]
  /// ranked results: curated topic matches first, then full-text matches in
  /// Quran order.  Falls back to curated-only when core isn't loaded yet.
  static List<QuranSearchResult> search(
    String query,
    String locale, {
    int maxResults = 50,
  }) {
    final raw = query.toLowerCase().trim();
    if (raw.isEmpty) return const [];

    final rawStripped = IslamicSynonyms.stripArticle(raw);
    final terms = IslamicSynonyms.expandQuery(raw);
    final useLocal = locale != 'en' && locale != 'ar' && locale == _localLocale;

    // ── Priority 1: curated topic-tagged ayahs ────────────────────────────
    final curated = AyahSearchIndex.search(query)
        .map((e) {
          String translation = e.english;
          if (useLocal) {
            final lc = _local['${e.surahNumber}:${e.ayahNumber}'];
            if (lc != null && lc.isNotEmpty) translation = lc;
          }
          return QuranSearchResult(
            surahNumber: e.surahNumber,
            surahName: e.surahName,
            ayahNumber: e.ayahNumber,
            arabic: e.arabic,
            translation: translation,
          );
        })
        .toList();

    if (_core.isEmpty) return curated.take(maxResults).toList();

    final curatedKeys = <String>{
      for (final r in curated) '${r.surahNumber}:${r.ayahNumber}',
    };

    // ── Priority 2: full-text search on all 6 236 ayahs ──────────────────
    // Scored: 2 = whole-word match in translation, 1 = surah/Arabic match.
    // Score 0 results are filtered out as too loosely related.
    final textMatches = <MapEntry<int, QuranSearchResult>>[];
    for (final e in _core) {
      final key = '${e.s}:${e.a}';
      if (curatedKeys.contains(key)) continue;
      final score = _scoreMatch(e, rawStripped, terms, useLocal);
      if (score == 0) continue;

      String displayTranslation = e.en;
      if (useLocal) {
        final lc = _local[key];
        if (lc != null && lc.isNotEmpty) displayTranslation = lc;
      }

      textMatches.add(MapEntry(score, QuranSearchResult(
        surahNumber: e.s,
        surahName: e.n,
        ayahNumber: e.a,
        arabic: e.ar,
        translation: displayTranslation,
      )));
    }

    textMatches.sort((a, b) {
      final scoreCmp = b.key.compareTo(a.key); // higher score first
      if (scoreCmp != 0) return scoreCmp;
      final c = a.value.surahNumber.compareTo(b.value.surahNumber);
      return c != 0 ? c : a.value.ayahNumber.compareTo(b.value.ayahNumber);
    });

    return [...curated, ...textMatches.map((e) => e.value)].take(maxResults).toList();
  }

  // ── Matching / scoring logic ────────────────────────────────────────────────

  // Returns 0 (no match), 1 (surah name / Arabic script), or
  // 2 (whole-word match in English or localized translation).
  // Only results with score >= 1 are included; score drives secondary sort.
  static int _scoreMatch(
    _E e,
    String rawStripped,
    List<String> terms,
    bool useLocal,
  ) {
    // English translation — whole-word boundary match (avoids false positives
    // like story mentions that contain the word but aren't topically relevant).
    final enL = e.en.toLowerCase();
    if (terms.any((t) => t.length >= 3 && _containsWord(enL, t))) return 2;

    // Localized translation — substring match (non-ASCII scripts vary).
    if (useLocal) {
      final lc = _local['${e.s}:${e.a}'];
      if (lc != null && lc.isNotEmpty) {
        final lcL = lc.toLowerCase();
        if (terms.any((t) => t.length >= 2 && lcL.contains(t))) return 2;
      }
    }

    // Surah name (Al- normalised) — lower priority.
    final nameStripped = IslamicSynonyms.stripArticle(e.n.toLowerCase());
    if (rawStripped.length >= 2 && nameStripped.contains(rawStripped)) return 1;

    // Arabic script.
    if (rawStripped.length >= 2 && e.ar.contains(rawStripped)) return 1;

    return 0;
  }

  static bool _containsWord(String text, String word) {
    int i = 0;
    while (true) {
      final pos = text.indexOf(word, i);
      if (pos == -1) return false;
      final before = pos == 0 || !_isWordChar(text.codeUnitAt(pos - 1));
      final after = pos + word.length >= text.length ||
          !_isWordChar(text.codeUnitAt(pos + word.length));
      if (before && after) return true;
      i = pos + 1;
    }
  }

  static bool _isWordChar(int code) =>
      (code >= 65 && code <= 90) ||
      (code >= 97 && code <= 122) ||
      (code >= 48 && code <= 57);

  // ── Localized translation loader ────────────────────────────────────────────

  static void _ensureLocalized(String locale) {
    if (locale == 'en' || locale == 'ar') return; // no extra edition needed
    if (locale == _localLocale) return; // already loaded
    if (_localLoading) return;
    _loadLocalized(locale); // fire-and-forget
  }

  static Future<void> _loadLocalized(String locale) async {
    final edition = _localeEditions[locale];
    if (edition == null) return;
    _localLoading = true;
    try {
      final surahs = await _fetchEdition(edition);
      if (surahs == null) return;
      _local.clear();
      for (final surah in surahs) {
        final sNum = surah['number'] as int;
        for (final ayah in surah['ayahs'] as List) {
          final m = ayah as Map<String, dynamic>;
          _local['$sNum:${m['numberInSurah']}'] = m['text'] as String;
        }
      }
      _localLocale = locale;
      localizedNotifier.value = !localizedNotifier.value; // toggle to notify
    } catch (_) {
      // Silently fall back to English display
    } finally {
      _localLoading = false;
    }
  }

  // ── Core fetch & cache ──────────────────────────────────────────────────────

  static Future<void> _fetchCore() async {
    final results = await Future.wait([
      _fetchEdition('quran-simple'), // Arabic
      _fetchEdition('en.asad'),       // English
    ]);

    final arSurahs = results[0];
    final enSurahs = results[1];
    if (arSurahs == null || enSurahs == null) return;

    _core.clear();
    for (var si = 0; si < arSurahs.length; si++) {
      final arS = arSurahs[si];
      final enS = si < enSurahs.length ? enSurahs[si] : null;
      final sNum = arS['number'] as int;
      final sName = arS['englishName'] as String;
      final arAyahs = arS['ayahs'] as List;
      final enAyahs = enS != null ? enS['ayahs'] as List : null;

      for (var ai = 0; ai < arAyahs.length; ai++) {
        final arA = arAyahs[ai] as Map<String, dynamic>;
        final aNum = arA['numberInSurah'] as int;
        final arabic = arA['text'] as String;
        final english = (enAyahs != null && ai < enAyahs.length)
            ? (enAyahs[ai] as Map<String, dynamic>)['text'] as String
            : '';
        _core.add(_E(sNum, sName, aNum, arabic, english));
      }
    }
    _saveCache(); // fire-and-forget
  }

  // Fetches one quran edition and returns the surahs list, or null on error.
  static Future<List<Map<String, dynamic>>?> _fetchEdition(
      String edition) async {
    try {
      final resp = await http
          .get(Uri.parse('https://api.alquran.cloud/v1/quran/$edition'))
          .timeout(const Duration(seconds: 45));
      if (resp.statusCode != 200) return null;
      final surahs = (jsonDecode(resp.body)['data']['surahs'] as List)
          .cast<Map<String, dynamic>>();
      return surahs;
    } catch (_) {
      return null;
    }
  }

  // ── Cache (file on Android/iOS, skipped on web) ─────────────────────────────

  static Future<bool> _loadCache() async {
    if (kIsWeb) return false;
    try {
      final f = await _cacheFilePath();
      if (!f.existsSync()) return false;
      final raw = await f.readAsString();
      final json = jsonDecode(raw) as Map<String, dynamic>;
      if ((json['v'] as int?) != _cacheVersion) return false;
      final data = json['d'] as List;
      _core.clear();
      for (final item in data) {
        final row = item as List;
        _core.add(_E(
          row[0] as int,
          row[1] as String,
          row[2] as int,
          row[3] as String,
          row[4] as String,
        ));
      }
      return _core.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Future<void> _saveCache() async {
    if (kIsWeb) return;
    try {
      final f = await _cacheFilePath();
      final payload = {
        'v': _cacheVersion,
        'd': [for (final e in _core) [e.s, e.n, e.a, e.ar, e.en]],
      };
      await f.writeAsString(jsonEncode(payload));
    } catch (_) {}
  }

  static Future<File> _cacheFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/quran_full_index_v$_cacheVersion.json');
  }
}
