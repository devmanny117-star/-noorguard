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
  'en': 'en.asad',
  'ur': 'ur.jalandhry',
  'es': 'es.cortes',
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
