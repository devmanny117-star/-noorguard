/// A single dhikr the tasbih counter can cycle through.
///
/// The three built-in dhikr (SubhanAllah, Alhamdulillah, Allahu Akbar) are
/// kept transliterated rather than translated, same as prayer names
/// elsewhere in the app — they're recited terms, not phrases with a
/// meaningful per-language equivalent. Custom dhikr are whatever the user
/// typed, so they never need localization either.
class DhikrItem {
  final String id;
  final String name;
  final String arabic;
  final bool isCustom;
  final int target;

  const DhikrItem({
    required this.id,
    required this.name,
    required this.arabic,
    required this.isCustom,
    this.target = 33,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'arabic': arabic,
        'target': target,
      };

  factory DhikrItem.fromJson(Map<String, dynamic> json) => DhikrItem(
        id: json['id'] as String,
        name: json['name'] as String,
        arabic: json['arabic'] as String? ?? '',
        isCustom: true,
        target: json['target'] as int? ?? 33,
      );
}

const builtInDhikr = [
  DhikrItem(
    id: 'builtin_subhanallah',
    name: 'SubhanAllah',
    arabic: 'سُبْحَانَ اللَّهِ',
    isCustom: false,
  ),
  DhikrItem(
    id: 'builtin_alhamdulillah',
    name: 'Alhamdulillah',
    arabic: 'الْحَمْدُ لِلَّهِ',
    isCustom: false,
  ),
  DhikrItem(
    id: 'builtin_allahuakbar',
    name: 'Allahu Akbar',
    arabic: 'اللَّهُ أَكْبَرُ',
    isCustom: false,
  ),
];
