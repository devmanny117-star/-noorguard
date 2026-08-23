class Surah {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json['number'] as int,
        name: json['name'] as String,
        englishName: json['englishName'] as String,
        englishNameTranslation: json['englishNameTranslation'] as String,
        numberOfAyahs: json['numberOfAyahs'] as int,
        revelationType: json['revelationType'] as String,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'englishName': englishName,
        'englishNameTranslation': englishNameTranslation,
        'numberOfAyahs': numberOfAyahs,
        'revelationType': revelationType,
      };
}

class Verse {
  final int number;
  final String arabic;
  final String translation;
  final String transliteration;

  const Verse({
    required this.number,
    required this.arabic,
    required this.translation,
    this.transliteration = '',
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json['numberInSurah'] as int,
        arabic: json['text'] as String,
        translation: json['translation'] as String,
        transliteration: json['transliteration'] as String? ?? '',
      );
}
