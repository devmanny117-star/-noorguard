import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah_model.dart';

/// Aborts a request that stalls (e.g. on a flaky mobile connection) so the UI
/// can fall back to its retry state instead of spinning on the loader forever.
const _requestTimeout = Duration(seconds: 15);

Future<List<Surah>> fetchSurahs() async {
  try {
    final response = await http.get(
      Uri.parse('https://api.alquran.cloud/v1/surah'),
    ).timeout(_requestTimeout);
    if (response.statusCode != 200) return [];
    final data = jsonDecode(response.body)['data'] as List<dynamic>;
    return data
        .map((s) => Surah.fromJson(s as Map<String, dynamic>))
        .toList();
  } catch (_) {
    return [];
  }
}

String _localizeTranslation(String translation, String locale) {
  if (locale != 'es') return translation;
  return translation.replaceAll('Alá', 'Allah').replaceAll('Dios', 'Allah');
}

const _translationEditions = {
  'en': 'en.sahih',    // Saheeh International — modern, clear, uses "Allah"
  'ur': 'ur.jalandhry',   // Fateh Muhammad Jalandhry — standard Urdu
  'es': 'es.garcia',      // García — Latin American Spanish (ustedes form)
  'fr': 'fr.hamidullah',  // Hamidullah — only French option
  'id': 'id.indonesian',  // Kemenag — standard Indonesian
  'de': 'de.bubenheim',   // Bubenheim & Elyas — standard German Muslim
  'nl': 'nl.leemhuis',    // Leemhuis — modern Dutch (Keyzer is 1860s archaic)
  'tr': 'tr.diyanet',     // Diyanet — official Turkish religious authority
  'bn': 'bn.bengali',     // Muhiuddin Khan — standard Bangladeshi
  'zh': 'zh.majian',      // Ma Jian — standard Chinese Muslim
  'ja': 'ja.japanese',    // only Japanese option
  'pt': 'pt.elhayek',     // only Portuguese option
  'it': 'it.piccardo',    // only Italian option
  'sw': 'sw.barwani',     // only Swahili option
  'fa': 'fa.fooladvand',  // Fooladvand — modern, widely-respected Persian
  // 'ar' omitted: Arabic text is already the primary display language
};

Future<List<Verse>> fetchVerses(int surahNumber, {String locale = 'en'}) async {
  try {
    final translationEdition = _translationEditions[locale];
    final editionsList = ['quran-simple', 'en.transliteration'];
    if (translationEdition != null) editionsList.add(translationEdition);
    final editions = editionsList.join(',');

    final response = await http.get(
      Uri.parse(
        'https://api.alquran.cloud/v1/surah/$surahNumber/editions/$editions',
      ),
    ).timeout(_requestTimeout);
    if (response.statusCode != 200) return [];

    final data = jsonDecode(response.body)['data'] as List<dynamic>;
    final arabicAyahs = (data[0]['ayahs'] as List<dynamic>);
    final transliterationAyahs = (data[1]['ayahs'] as List<dynamic>);
    final translationAyahs =
        data.length > 2 ? (data[2]['ayahs'] as List<dynamic>) : null;

    return List.generate(arabicAyahs.length, (i) {
      final arabic = arabicAyahs[i] as Map<String, dynamic>;
      final transliteration =
          (transliterationAyahs[i] as Map<String, dynamic>)['text'] as String;
      final translation = translationAyahs == null
          ? ''
          : (translationAyahs[i] as Map<String, dynamic>)['text'] as String;
      return Verse(
        number: arabic['numberInSurah'] as int,
        arabic: arabic['text'] as String,
        translation: _localizeTranslation(translation, locale),
        transliteration: transliteration,
      );
    });
  } catch (_) {
    return [];
  }
}

/// Translation of a single ayah in the SAME edition the Quran reader shows
/// for [locale] (the [_translationEditions] table above), so text quoted
/// elsewhere (e.g. the Noor Guard Live notification) matches the reader
/// word-for-word. Returns null for Arabic (the reader shows no translation
/// line) and on any network failure — callers fall back to their bundled
/// translation.
Future<String?> fetchAyahTranslation(
    int surahNumber, int ayahNumber, String locale) async {
  final edition = _translationEditions[locale];
  if (edition == null) return null;
  try {
    final response = await http.get(
      Uri.parse(
        'https://api.alquran.cloud/v1/ayah/$surahNumber:$ayahNumber/$edition',
      ),
    ).timeout(_requestTimeout);
    if (response.statusCode != 200) return null;
    final text =
        (jsonDecode(response.body)['data'] as Map<String, dynamic>?)?['text']
            as String?;
    if (text == null || text.trim().isEmpty) return null;
    return _localizeTranslation(text.trim(), locale);
  } catch (_) {
    return null;
  }
}
