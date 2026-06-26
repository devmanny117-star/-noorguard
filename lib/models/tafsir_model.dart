/// A Sunni scholar/source whose name is shown on the gold source badge.
class TafsirScholar {
  final Map<String, String> names;
  const TafsirScholar(this.names);

  String name(String locale) => names[locale] ?? names['en']!;
}

/// Known tafsir sources, keyed by an internal id used in [TafsirEntry.scholarKeys].
const Map<String, TafsirScholar> tafsirScholars = {
  'ibnKathir': TafsirScholar({
    'en': 'Ibn Kathir',
    'ar': 'ابن كثير',
    'ur': 'ابن کثیر',
    'es': 'Ibn Kathir',
  }),
  'asSadi': TafsirScholar({
    'en': 'As-Sadi',
    'ar': 'السعدي',
    'ur': 'السعدی',
    'es': 'As-Sadi',
  }),
  'atTabari': TafsirScholar({
    'en': 'At-Tabari',
    'ar': 'الطبري',
    'ur': 'الطبری',
    'es': 'At-Tabari',
  }),
  'tirmidhi': TafsirScholar({
    'en': 'Tirmidhi',
    'ar': 'الترمذي',
    'ur': 'ترمذی',
    'es': 'Tirmidhi',
  }),
  'sahihBukhari': TafsirScholar({
    'en': 'Sahih al-Bukhari',
    'ar': 'صحيح البخاري',
    'ur': 'صحیح بخاری',
    'es': 'Sahih al-Bukhari',
  }),
  'sahihMuslim': TafsirScholar({
    'en': 'Sahih Muslim',
    'ar': 'صحيح مسلم',
    'ur': 'صحیح مسلم',
    'es': 'Sahih Muslim',
  }),
  'abuDawud': TafsirScholar({
    'en': 'Abu Dawud',
    'ar': 'أبو داود',
    'ur': 'ابوداؤد',
    'es': 'Abu Dawud',
  }),
  'alHakim': TafsirScholar({
    'en': 'Al-Hakim',
    'ar': 'الحاكم',
    'ur': 'الحاکم',
    'es': 'Al-Hakim',
  }),
  'ibnAbbas': TafsirScholar({
    'en': 'Ibn Abbas',
    'ar': 'ابن عباس',
    'ur': 'ابن عباس',
    'es': 'Ibn Abbas',
  }),
};

/// Tafsir (commentary) for one ayah or a group of consecutive ayahs.
class TafsirEntry {
  /// The ayah number(s) this commentary covers, e.g. [1] or [6, 7].
  final List<int> verses;

  /// Commentary text keyed by language code ('en', 'ar', 'ur', 'es').
  final Map<String, String> tafsir;

  /// Ids of [tafsirScholars] this commentary is drawn from.
  final List<String> scholarKeys;

  /// Reason for revelation, keyed by language code. Null when not applicable.
  final Map<String, String>? asbabAlNuzul;

  const TafsirEntry({
    required this.verses,
    required this.tafsir,
    required this.scholarKeys,
    this.asbabAlNuzul,
  });

  /// Display label for the verse badge, e.g. "1" or "6-7".
  String get verseLabel =>
      verses.length == 1 ? '${verses.first}' : '${verses.first}-${verses.last}';

  String? tafsirText(String locale) => tafsir[locale];

  String? asbabText(String locale) {
    final entries = asbabAlNuzul;
    if (entries == null) return null;
    return entries[locale];
  }
}
