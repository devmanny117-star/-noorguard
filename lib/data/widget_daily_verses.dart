/// A small, fully-translated rotation of short, widely-known verses for the
/// home-screen widgets' "daily verse" feature. Kept deliberately short (not
/// the full Quran) since widgets only have room for a line or two of text.
class WidgetDailyVerse {
  final Map<String, String> text;
  final String reference;

  const WidgetDailyVerse({required this.text, required this.reference});

  String forLocale(String localeCode) => text[localeCode] ?? text['en']!;
}

final List<WidgetDailyVerse> widgetDailyVerses = [
  const WidgetDailyVerse(
    reference: "Al-'Ankabut 29:45",
    text: {
      'en': 'Indeed, prayer prohibits immorality and wrongdoing, and the remembrance of Allah is greater.',
      'ar': 'إِنَّ الصَّلَاةَ تَنْهَىٰ عَنِ الْفَحْشَاءِ وَالْمُنْكَرِ وَلَذِكْرُ اللَّهِ أَكْبَرُ',
      'ur': 'بے شک نماز بے حیائی اور برائی سے روکتی ہے، اور اللہ کا ذکر سب سے بڑی چیز ہے۔',
      'es': 'En verdad, la oración prohíbe la inmoralidad y el mal, y el recuerdo de Allah es lo más importante.',
      'de': 'Wahrlich, das Gebet hält von Unsittlichkeit und Bösem ab, und das Gedenken an Allah ist gewiss größer.',
      'nl': 'Voorwaar, het gebed weerhoudt van onzedelijkheid en kwaad, en de gedachtenis aan Allah is zeker groter.',
      'pt': 'Em verdade, a oração proíbe a imoralidade e o mal, e a lembrança de Allah é a maior das coisas.',
      'it': "In verità, la preghiera proibisce l'immoralità e il male, e il ricordo di Allah è certamente più grande.",
      'fr': "En vérité, la prière préserve de la turpitude et du blâmable, et le rappel d'Allah est plus grand encore.",
      'id': 'Sesungguhnya shalat itu mencegah dari perbuatan keji dan munkar, dan mengingat Allah itu lebih besar keutamaannya.',
      'zh': '礁拜确能防止淫乱和罪恶，赞念真主，确是更大的善事。',
      'ja': '本当に礼拝は、みだらな行いと悪事を防ぐ。アッラーを唱念することは、更に偉大である。',
      'bn': 'নিশ্চয় নামাজ অশ্লীলতা ও অসৎ কাজ থেকে বিরত রাখে, এবং আল্লাহর স্মরণই সর্বশ্রেষ্ঠ।',
      'tr': 'Şüphesiz namaz, çirkin işlerden ve kötülükten alıkoyar. Allah\'ı zikretmek elbette en büyük (ibadet)tir.',
      'sw': 'Hakika Sala huzuia uchafu na uovu, na kumtaja Mwenyezi Mungu ni jambo kubwa zaidi.',
      'fa': 'همانا نماز از فحشا و منکر باز می‌دارد و یاد خداوند بزرگ‌تر است.',
    },
  ),
  const WidgetDailyVerse(
    reference: 'At-Talaq 65:3',
    text: {
      'en': 'And whoever relies upon Allah — then He is sufficient for him.',
      'ar': 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
      'ur': 'اور جو اللہ پر بھروسہ کرے تو وہ اس کے لیے کافی ہے۔',
      'es': 'Y quien confíe en Allah, Él le será suficiente.',
      'de': 'Und wer sich auf Allah verlässt, dem ist Er genug.',
      'nl': 'En wie op Allah vertrouwt, voor hem is Hij voldoende.',
      'pt': 'E quem confia em Allah, Ele lhe será suficiente.',
      'it': 'E chi si affida ad Allah, Egli gli basta.',
      'fr': "Et quiconque place sa confiance en Allah, Il lui suffit.",
      'id': 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan keperluannya.',
      'zh': '信赖真主的人，真主对他就足够了。',
      'ja': 'アッラーを信頼する者には、彼で十分である。',
      'bn': 'যে আল্লাহর উপর নির্ভর করে, তার জন্য তিনিই যথেষ্ট।',
      'tr': 'Kim Allah\'a tevekkül ederse, O ona yeter.',
      'sw': 'Na anayemtegemea Mwenyezi Mungu, basi Yeye ndiye anamtosha.',
      'fa': 'و هر کس بر خداوند توکل کند، پس او برایش کافی است.',
    },
  ),
  const WidgetDailyVerse(
    reference: "Ar-Ra'd 13:28",
    text: {
      'en': 'Verily, in the remembrance of Allah do hearts find rest.',
      'ar': 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
      'ur': 'سن لو، اللہ کے ذکر سے ہی دلوں کو سکون ملتا ہے۔',
      'es': 'En verdad, con el recuerdo de Allah se tranquilizan los corazones.',
      'de': 'Wahrlich, im Gedenken an Allah finden die Herzen Ruhe.',
      'nl': 'Voorwaar, door de gedachtenis aan Allah komen de harten tot rust.',
      'pt': 'Em verdade, é com a lembrança de Allah que os corações se tranquilizam.',
      'it': "In verità, è nel ricordo di Allah che i cuori trovano pace.",
      'fr': "En vérité, c'est par le rappel d'Allah que les cœurs se tranquillisent.",
      'id': 'Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.',
      'zh': '真的，记念真主，能使心安。',
      'ja': '本当にアッラーを唱念することで、心は安らぐ。',
      'bn': 'জেনে রাখ, আল্লাহর স্মরণেই অন্তর প্রশান্ত হয়।',
      'tr': 'Bilesiniz ki, kalpler ancak Allah\'ı zikretmekle huzur bulur.',
      'sw': 'Hakika kwa kumtaja Mwenyezi Mungu nyoyo hutulia.',
      'fa': 'آگاه باشید که با یاد خداوند دل‌ها آرام می‌گیرد.',
    },
  ),
];

/// Picks one verse deterministically based on the day of the year, so it
/// stays the same all day but rotates daily.
WidgetDailyVerse widgetVerseForDate(DateTime date) {
  final dayOfYear = int.parse(
    '${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}',
  );
  return widgetDailyVerses[dayOfYear % widgetDailyVerses.length];
}
