import '../utils/islamic_synonyms.dart';

class AyahSearchEntry {
  final int surahNumber;
  final String surahName; // English transliteration, e.g. "Al-Baqarah"
  final int ayahNumber;
  final String arabic;
  final String english;
  final List<String> topics; // lowercase; matched against expandQuery output

  const AyahSearchEntry({
    required this.surahNumber,
    required this.surahName,
    required this.ayahNumber,
    required this.arabic,
    required this.english,
    required this.topics,
  });
}

// ─── Curated notable ayahs ───────────────────────────────────────────────────
// ~120 high-value entries covering the most common search topics.
const List<AyahSearchEntry> _kAyahs = [
  // ── Al-Fatiha (1) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 1, surahName: 'Al-Fatiha', ayahNumber: 1,
    arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    english: 'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
    topics: ['prayer', 'mercy', 'blessing', 'worship', 'bismillah'],
  ),
  AyahSearchEntry(
    surahNumber: 1, surahName: 'Al-Fatiha', ayahNumber: 2,
    arabic: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    english: '[All] praise is [due] to Allah, Lord of the worlds.',
    topics: ['gratitude', 'shukr', 'prayer', 'worship', 'god'],
  ),
  AyahSearchEntry(
    surahNumber: 1, surahName: 'Al-Fatiha', ayahNumber: 5,
    arabic: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    english: 'It is You we worship and You we ask for help.',
    topics: ['worship', 'prayer', 'ibadah', 'tawhid', 'dua'],
  ),
  // ── Al-Baqarah (2) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 2,
    arabic: 'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ ۛ فِيهِ ۛ هُدًى لِّلْمُتَّقِينَ',
    english: 'This is the Book about which there is no doubt, a guidance for those conscious of Allah.',
    topics: ['quran', 'faith', 'guidance', 'revelation'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 25,
    arabic: 'وَبَشِّرِ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ أَنَّ لَهُمْ جَنَّاتٍ تَجْرِي مِن تَحْتِهَا الْأَنْهَارُ',
    english: 'Give good tidings to those who believe and do righteous deeds that they will have gardens [in Paradise] beneath which rivers flow.',
    topics: ['paradise', 'jannah', 'faith', 'good deeds'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 30,
    arabic: 'وَإِذْ قَالَ رَبُّكَ لِلْمَلَائِكَةِ إِنِّي جَاعِلٌ فِي الْأَرْضِ خَلِيفَةً',
    english: 'And when your Lord said to the angels: Indeed, I will make upon the earth a successive authority.',
    topics: ['angels', 'creation', 'adam'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 45,
    arabic: 'وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ وَإِنَّهَا لَكَبِيرَةٌ إِلَّا عَلَى الْخَاشِعِينَ',
    english: 'Seek help through patience and prayer; it is indeed difficult except for the humbly submissive.',
    topics: ['patience', 'sabr', 'prayer', 'salah'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 124,
    arabic: 'وَإِذِ ابْتَلَىٰ إِبْرَاهِيمَ رَبُّهُ بِكَلِمَاتٍ فَأَتَمَّهُنَّ',
    english: 'And when Abraham was tried by his Lord with commands and he fulfilled them.',
    topics: ['abraham', 'ibrahim', 'faith', 'prophets'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 152,
    arabic: 'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
    english: 'So remember Me; I will remember you. And be grateful to Me and do not deny Me.',
    topics: ['dhikr', 'remembrance', 'gratitude', 'shukr'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 153,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
    english: 'O you who believe! Seek help through patience and prayer. Indeed, Allah is with the patient.',
    topics: ['patience', 'sabr', 'prayer', 'salah', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 155,
    arabic: 'وَلَنَبْلُوَنَّكُم بِشَيْءٍ مِّنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِّنَ الْأَمْوَالِ وَالْأَنفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ',
    english: 'We will surely test you with something of fear and hunger and a loss of wealth and lives and fruits, but give good tidings to the patient.',
    topics: ['patience', 'sabr', 'faith', 'test'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 156,
    arabic: 'الَّذِينَ إِذَا أَصَابَتْهُم مُّصِيبَةٌ قَالُوا إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ',
    english: 'Who, when disaster strikes them, say: Indeed we belong to Allah, and indeed to Him we will return.',
    topics: ['patience', 'death', 'faith', 'inna lillahi'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 183,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ كَمَا كُتِبَ عَلَى الَّذِينَ مِن قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ',
    english: 'O you who believe! Fasting is prescribed for you as it was prescribed for those before you, that you may achieve God-consciousness.',
    topics: ['fasting', 'sawm', 'siyam', 'ramadan', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 185,
    arabic: 'شَهْرُ رَمَضَانَ الَّذِي أُنزِلَ فِيهِ الْقُرْآنُ هُدًى لِّلنَّاسِ',
    english: 'The month of Ramadan in which was revealed the Quran, a guidance for the people.',
    topics: ['ramadan', 'fasting', 'sawm', 'quran', 'revelation'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 221,
    arabic: 'وَلَا تَنكِحُوا الْمُشْرِكَاتِ حَتَّىٰ يُؤْمِنَّ ۚ وَلَأَمَةٌ مُّؤْمِنَةٌ خَيْرٌ مِّن مُّشْرِكَةٍ وَلَوْ أَعْجَبَتْكُمْ',
    english: 'Do not marry polytheistic women until they believe. A believing slave woman is better than a polytheist even though she might please you.',
    topics: ['marriage', 'nikah', 'wife', 'faith', 'spouse'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 229,
    arabic: 'الطَّلَاقُ مَرَّتَانِ ۖ فَإِمْسَاكٌ بِمَعْرُوفٍ أَوْ تَسْرِيحٌ بِإِحْسَانٍ',
    english: 'Divorce is twice. Then either keep her in kindness or release her with good treatment.',
    topics: ['divorce', 'talaq', 'wife', 'husband', 'marriage'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 232,
    arabic: 'وَإِذَا طَلَّقْتُمُ النِّسَاءَ فَبَلَغْنَ أَجَلَهُنَّ فَلَا تَعْضُلُوهُنَّ أَن يَنكِحْنَ أَزْوَاجَهُنَّ',
    english: 'When you divorce women and they reach their term, do not prevent them from remarrying their husbands if they agree among themselves in an acceptable way.',
    topics: ['divorce', 'talaq', 'wife', 'husband', 'marriage', 'nikah'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 255,
    arabic: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ',
    english: 'Allah — there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep.',
    topics: ['tawhid', 'faith', 'god', 'protection', 'ayat al-kursi'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 261,
    arabic: 'مَّثَلُ الَّذِينَ يُنفِقُونَ أَمْوَالَهُمْ فِي سَبِيلِ اللَّهِ كَمَثَلِ حَبَّةٍ أَنبَتَتْ سَبْعَ سَنَابِلَ',
    english: 'The example of those who spend their wealth in the way of Allah is like a seed that sprouts seven spikes, each having a hundred grains.',
    topics: ['charity', 'sadaqah', 'zakat', 'good deeds'],
  ),
  AyahSearchEntry(
    surahNumber: 2, surahName: 'Al-Baqarah', ayahNumber: 286,
    arabic: 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا',
    english: 'Allah does not burden a soul beyond that it can bear.',
    topics: ['patience', 'mercy', 'faith', 'hope'],
  ),
  // ── Al-Imran (3) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 42,
    arabic: 'وَإِذْ قَالَتِ الْمَلَائِكَةُ يَا مَرْيَمُ إِنَّ اللَّهَ اصْطَفَاكِ وَطَهَّرَكِ',
    english: 'And when the angels said: O Mary, indeed Allah has chosen you and purified you above the women of the worlds.',
    topics: ['mary', 'maryam', 'angels', 'women'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 45,
    arabic: 'إِذْ قَالَتِ الْمَلَائِكَةُ يَا مَرْيَمُ إِنَّ اللَّهَ يُبَشِّرُكِ بِكَلِمَةٍ مِّنْهُ اسْمُهُ الْمَسِيحُ عِيسَى ابْنُ مَرْيَمَ',
    english: 'The angels said: O Mary, indeed Allah gives you good tidings of a word from Him, whose name will be the Messiah, Jesus, the son of Mary.',
    topics: ['jesus', 'isa', 'mary', 'maryam', 'angels', 'prophets'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 102,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اتَّقُوا اللَّهَ حَقَّ تُقَاتِهِ',
    english: 'O you who believe! Fear Allah as He should be feared, and do not die except in a state of Islam.',
    topics: ['faith', 'taqwa', 'belief'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 135,
    arabic: 'وَالَّذِينَ إِذَا فَعَلُوا فَاحِشَةً أَوْ ظَلَمُوا أَنفُسَهُمْ ذَكَرُوا اللَّهَ فَاسْتَغْفَرُوا لِذُنُوبِهِمْ',
    english: 'Those who, when they commit an immorality or wrong themselves, remember Allah and seek forgiveness for their sins.',
    topics: ['forgiveness', 'repentance', 'tawbah', 'dhikr', 'sin'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 159,
    arabic: 'فَإِذَا عَزَمْتَ فَتَوَكَّلْ عَلَى اللَّهِ ۚ إِنَّ اللَّهَ يُحِبُّ الْمُتَوَكِّلِينَ',
    english: 'And when you have decided, then rely upon Allah. Indeed, Allah loves those who rely upon Him.',
    topics: ['tawakkul', 'trust', 'reliance', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 185,
    arabic: 'كُلُّ نَفْسٍ ذَائِقَةُ الْمَوْتِ',
    english: 'Every soul will taste death, and you will only be given your compensation on the Day of Resurrection.',
    topics: ['death', 'soul', 'hereafter', 'judgment day'],
  ),
  AyahSearchEntry(
    surahNumber: 3, surahName: 'Al-Imran', ayahNumber: 200,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اصْبِرُوا وَصَابِرُوا وَرَابِطُوا وَاتَّقُوا اللَّهَ',
    english: 'O you who believe! Persevere and endure, remain stationed, and fear Allah that you may be successful.',
    topics: ['patience', 'sabr', 'faith'],
  ),
  // ── An-Nisa (4) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 3,
    arabic: 'وَإِنْ خِفْتُمْ أَلَّا تُقْسِطُوا فِي الْيَتَامَىٰ فَانكِحُوا مَا طَابَ لَكُم مِّنَ النِّسَاءِ مَثْنَىٰ وَثُلَاثَ وَرُبَاعَ',
    english: 'If you fear you will not deal fairly with orphan girls, then marry those that please you of other women, two or three or four.',
    topics: ['marriage', 'nikah', 'wife', 'spouse'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 19,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا يَحِلُّ لَكُمْ أَن تَرِثُوا النِّسَاءَ كَرْهًا',
    english: 'O you who believe! It is not lawful for you to inherit women by compulsion. And live with them in kindness.',
    topics: ['marriage', 'wife', 'rights', 'women', 'family'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 21,
    arabic: 'وَكَيْفَ تَأْخُذُونَهُ وَقَدْ أَفْضَىٰ بَعْضُكُمْ إِلَىٰ بَعْضٍ وَأَخَذْنَ مِنكُم مِّيثَاقًا غَلِيظًا',
    english: 'How could you take it back while you have gone in unto each other and they have taken from you a solemn covenant?',
    topics: ['marriage', 'mahr', 'covenant', 'wife', 'husband'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 34,
    arabic: 'الرِّجَالُ قَوَّامُونَ عَلَى النِّسَاءِ بِمَا فَضَّلَ اللَّهُ بَعْضَهُمْ عَلَىٰ بَعْضٍ',
    english: 'Men are the protectors and maintainers of women, as Allah has given one more strength than the other and because they spend from their wealth.',
    topics: ['marriage', 'family', 'husband', 'wife', 'women'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 103,
    arabic: 'إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا',
    english: 'Indeed, prayer has been decreed upon the believers a decree of specified times.',
    topics: ['prayer', 'salah', 'salat', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 110,
    arabic: 'وَمَن يَعْمَلْ سُوءًا أَوْ يَظْلِمْ نَفْسَهُ ثُمَّ يَسْتَغْفِرِ اللَّهَ يَجِدِ اللَّهَ غَفُورًا رَّحِيمًا',
    english: 'Whoever does a wrong or wrongs himself but then seeks forgiveness of Allah will find Allah Forgiving and Merciful.',
    topics: ['forgiveness', 'repentance', 'mercy', 'sin'],
  ),
  AyahSearchEntry(
    surahNumber: 4, surahName: 'An-Nisa', ayahNumber: 135,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا كُونُوا قَوَّامِينَ بِالْقِسْطِ',
    english: 'O you who believe! Be persistently standing firm in justice, witnesses for Allah.',
    topics: ['justice', 'equality', 'faith'],
  ),
  // ── Al-Maida (5) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 5, surahName: 'Al-Maida', ayahNumber: 8,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا كُونُوا قَوَّامِينَ لِلَّهِ شُهَدَاءَ بِالْقِسْطِ',
    english: 'O you who believe! Be persistently standing firm for Allah, witnesses in justice.',
    topics: ['justice', 'equality', 'faith'],
  ),
  // ── Al-Anam (6) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 6, surahName: 'Al-Anam', ayahNumber: 12,
    arabic: 'كَتَبَ عَلَىٰ نَفْسِهِ الرَّحْمَةَ',
    english: 'He has decreed upon Himself mercy. He will surely assemble you for the Day of Resurrection.',
    topics: ['mercy', 'rahma', 'god', 'hereafter'],
  ),
  // ── Al-Araf (7) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 7, surahName: 'Al-Araf', ayahNumber: 156,
    arabic: 'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ',
    english: 'My mercy encompasses all things.',
    topics: ['mercy', 'rahma', 'god', 'hope'],
  ),
  // ── At-Tawbah (9) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 9, surahName: 'At-Tawbah', ayahNumber: 51,
    arabic: 'قُل لَّن يُصِيبَنَا إِلَّا مَا كَتَبَ اللَّهُ لَنَا هُوَ مَوْلَانَا',
    english: 'Say: Never will we be struck except by what Allah has decreed for us; He is our protector.',
    topics: ['tawakkul', 'trust', 'faith', 'patience'],
  ),
  AyahSearchEntry(
    surahNumber: 9, surahName: 'At-Tawbah', ayahNumber: 104,
    arabic: 'أَلَمْ يَعْلَمُوا أَنَّ اللَّهَ هُوَ يَقْبَلُ التَّوْبَةَ عَنْ عِبَادِهِ',
    english: 'Do they not know that it is Allah who accepts repentance from His servants?',
    topics: ['repentance', 'tawbah', 'forgiveness'],
  ),
  // ── Yusuf (12) ─────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 12, surahName: 'Yusuf', ayahNumber: 64,
    arabic: 'فَاللَّهُ خَيْرٌ حَافِظًا ۖ وَهُوَ أَرْحَمُ الرَّاحِمِينَ',
    english: 'But Allah is the best guardian, and He is the most merciful of the merciful.',
    topics: ['mercy', 'joseph', 'yusuf', 'trust', 'tawakkul'],
  ),
  AyahSearchEntry(
    surahNumber: 12, surahName: 'Yusuf', ayahNumber: 87,
    arabic: 'إِنَّهُ لَا يَيْأَسُ مِن رَّوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ',
    english: 'Indeed, no one despairs of relief from Allah except the disbelieving people.',
    topics: ['hope', 'mercy', 'joseph', 'yusuf', 'faith'],
  ),
  // ── Ar-Rad (13) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 13, surahName: 'Ar-Rad', ayahNumber: 28,
    arabic: 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
    english: 'Unquestionably, by the remembrance of Allah hearts are assured.',
    topics: ['dhikr', 'remembrance', 'heart', 'peace', 'tranquility'],
  ),
  // ── Ibrahim (14) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 14, surahName: 'Ibrahim', ayahNumber: 7,
    arabic: 'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ',
    english: 'If you are grateful, I will surely increase you [in favor]; but if you deny, My punishment is indeed severe.',
    topics: ['gratitude', 'shukr', 'blessing', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 14, surahName: 'Ibrahim', ayahNumber: 40,
    arabic: 'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي ۚ رَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    english: 'My Lord, make me an establisher of prayer, and [many] from my descendants. Our Lord, and accept my supplication.',
    topics: ['prayer', 'salah', 'dua', 'supplication', 'abraham', 'ibrahim', 'family'],
  ),
  // ── An-Nahl (16) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 16, surahName: 'An-Nahl', ayahNumber: 18,
    arabic: 'وَإِن تَعُدُّوا نِعْمَةَ اللَّهِ لَا تُحْصُوهَا',
    english: 'And if you should count the favors of Allah, you could not enumerate them.',
    topics: ['blessing', 'gratitude', 'shukr', 'grace'],
  ),
  AyahSearchEntry(
    surahNumber: 16, surahName: 'An-Nahl', ayahNumber: 90,
    arabic: 'إِنَّ اللَّهَ يَأْمُرُ بِالْعَدْلِ وَالْإِحْسَانِ',
    english: 'Indeed, Allah orders justice and good conduct and giving to relatives.',
    topics: ['justice', 'equality', 'good deeds', 'charity'],
  ),
  AyahSearchEntry(
    surahNumber: 16, surahName: 'An-Nahl', ayahNumber: 127,
    arabic: 'وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ',
    english: 'And be patient, and your patience is only [possible] through Allah.',
    topics: ['patience', 'sabr', 'trust', 'prophet'],
  ),
  // ── Al-Isra (17) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 17, surahName: 'Al-Isra', ayahNumber: 23,
    arabic: 'وَقَضَىٰ رَبُّكَ أَلَّا تَعْبُدُوا إِلَّا إِيَّاهُ وَبِالْوَالِدَيْنِ إِحْسَانًا',
    english: 'Your Lord has decreed that you not worship except Him, and to parents, good treatment.',
    topics: ['family', 'parents', 'tawhid', 'worship'],
  ),
  AyahSearchEntry(
    surahNumber: 17, surahName: 'Al-Isra', ayahNumber: 24,
    arabic: 'وَاخْفِضْ لَهُمَا جَنَاحَ الذُّلِّ مِنَ الرَّحْمَةِ وَقُل رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
    english: 'Lower to them the wing of humility out of mercy and say: My Lord, have mercy upon them as they brought me up [when I was] small.',
    topics: ['family', 'parents', 'mercy', 'dua'],
  ),
  AyahSearchEntry(
    surahNumber: 17, surahName: 'Al-Isra', ayahNumber: 78,
    arabic: 'أَقِمِ الصَّلَاةَ لِدُلُوكِ الشَّمْسِ إِلَىٰ غَسَقِ اللَّيْلِ وَقُرْآنَ الْفَجْرِ',
    english: 'Establish prayer at the decline of the sun [from its meridian] until the darkness of the night and [also] the Quran of dawn.',
    topics: ['prayer', 'salah', 'fajr', 'times'],
  ),
  // ── Maryam (19) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 19, surahName: 'Maryam', ayahNumber: 19,
    arabic: 'قَالَ إِنَّمَا أَنَا رَسُولُ رَبِّكِ لِأَهَبَ لَكِ غُلَامًا زَكِيًّا',
    english: 'He said: I am only the messenger of your Lord to give you [news of] a pure boy.',
    topics: ['mary', 'maryam', 'jesus', 'isa', 'prophets', 'angels'],
  ),
  AyahSearchEntry(
    surahNumber: 19, surahName: 'Maryam', ayahNumber: 30,
    arabic: 'قَالَ إِنِّي عَبْدُ اللَّهِ آتَانِيَ الْكِتَابَ وَجَعَلَنِي نَبِيًّا',
    english: 'He said: Indeed, I am the servant of Allah. He has given me the Scripture and made me a prophet.',
    topics: ['jesus', 'isa', 'prophets', 'quran', 'revelation'],
  ),
  // ── Ta-Ha (20) ─────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 20, surahName: 'Ta-Ha', ayahNumber: 14,
    arabic: 'إِنَّنِي أَنَا اللَّهُ لَا إِلَٰهَ إِلَّا أَنَا فَاعْبُدْنِي وَأَقِمِ الصَّلَاةَ لِذِكْرِي',
    english: 'Indeed, I am Allah. There is no deity except Me, so worship Me and establish prayer for My remembrance.',
    topics: ['tawhid', 'prayer', 'salah', 'moses', 'musa', 'dhikr', 'worship'],
  ),
  AyahSearchEntry(
    surahNumber: 20, surahName: 'Ta-Ha', ayahNumber: 114,
    arabic: 'رَّبِّ زِدْنِي عِلْمًا',
    english: 'My Lord, increase me in knowledge.',
    topics: ['knowledge', 'ilm', 'dua', 'wisdom'],
  ),
  // ── Al-Anbiya (21) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 21, surahName: 'Al-Anbiya', ayahNumber: 30,
    arabic: 'أَوَلَمْ يَرَ الَّذِينَ كَفَرُوا أَنَّ السَّمَاوَاتِ وَالْأَرْضَ كَانَتَا رَتْقًا فَفَتَقْنَاهُمَا ۖ وَجَعَلْنَا مِنَ الْمَاءِ كُلَّ شَيْءٍ حَيٍّ',
    english: 'Do the disbelievers not see that the heavens and earth were a joined entity then We separated them, and We made every living thing from water?',
    topics: ['creation', 'science', 'water', 'nature'],
  ),
  AyahSearchEntry(
    surahNumber: 21, surahName: 'Al-Anbiya', ayahNumber: 107,
    arabic: 'وَمَا أَرْسَلْنَاكَ إِلَّا رَحْمَةً لِّلْعَالَمِينَ',
    english: 'And We have not sent you, [O Muhammad], except as a mercy to the worlds.',
    topics: ['prophet', 'muhammad', 'mercy', 'rahma'],
  ),
  // ── Al-Hajj (22) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 22, surahName: 'Al-Hajj', ayahNumber: 7,
    arabic: 'وَأَنَّ السَّاعَةَ آتِيَةٌ لَّا رَيْبَ فِيهَا وَأَنَّ اللَّهَ يَبْعَثُ مَن فِي الْقُبُورِ',
    english: 'And that the Hour is coming — no doubt about it — and that Allah will resurrect those in the graves.',
    topics: ['judgment day', 'qiyamah', 'resurrection', 'hereafter'],
  ),
  AyahSearchEntry(
    surahNumber: 22, surahName: 'Al-Hajj', ayahNumber: 27,
    arabic: 'وَأَذِّن فِي النَّاسِ بِالْحَجِّ يَأْتُوكَ رِجَالًا وَعَلَىٰ كُلِّ ضَامِرٍ',
    english: 'And proclaim to the people the Hajj; they will come to you on foot and on every lean camel.',
    topics: ['hajj', 'pilgrimage', 'ibrahim', 'abraham'],
  ),
  // ── Al-Muminun (23) ────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 23, surahName: 'Al-Muminun', ayahNumber: 2,
    arabic: 'الَّذِينَ هُمْ فِي صَلَاتِهِمْ خَاشِعُونَ',
    english: 'Those who are humble in their prayers.',
    topics: ['prayer', 'salah', 'faith', 'believers'],
  ),
  // ── An-Nur (24) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 24, surahName: 'An-Nur', ayahNumber: 32,
    arabic: 'وَأَنكِحُوا الْأَيَامَىٰ مِنكُمْ وَالصَّالِحِينَ مِنْ عِبَادِكُمْ وَإِمَائِكُمْ',
    english: 'Marry the unmarried among you and the righteous among your male and female slaves. If they are poor, Allah will enrich them from His bounty.',
    topics: ['marriage', 'nikah', 'spouse', 'wed'],
  ),
  AyahSearchEntry(
    surahNumber: 24, surahName: 'An-Nur', ayahNumber: 35,
    arabic: 'اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ',
    english: 'Allah is the light of the heavens and the earth.',
    topics: ['light', 'nur', 'god', 'creation'],
  ),
  // ── Al-Furqan (25) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 25, surahName: 'Al-Furqan', ayahNumber: 63,
    arabic: 'وَعِبَادُ الرَّحْمَٰنِ الَّذِينَ يَمْشُونَ عَلَى الْأَرْضِ هَوْنًا',
    english: 'And the servants of the Most Merciful are those who walk upon the earth easily.',
    topics: ['mercy', 'humility', 'good deeds', 'believers'],
  ),
  // ── Al-Qasas (28) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 28, surahName: 'Al-Qasas', ayahNumber: 7,
    arabic: 'وَأَوْحَيْنَا إِلَىٰ أُمِّ مُوسَىٰ أَنْ أَرْضِعِيهِ',
    english: 'And We inspired to the mother of Moses: Suckle him; but when you fear for him, cast him into the river.',
    topics: ['moses', 'musa', 'family', 'prophets'],
  ),
  // ── Al-Ankabut (29) ────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 29, surahName: 'Al-Ankabut', ayahNumber: 45,
    arabic: 'اتْلُ مَا أُوحِيَ إِلَيْكَ مِنَ الْكِتَابِ وَأَقِمِ الصَّلَاةَ ۖ إِنَّ الصَّلَاةَ تَنْهَىٰ عَنِ الْفَحْشَاءِ وَالْمُنكَرِ',
    english: 'Recite what has been revealed to you of the Book and establish prayer. Indeed, prayer prohibits immorality and wrongdoing.',
    topics: ['prayer', 'salah', 'quran', 'recitation'],
  ),
  // ── Ar-Rum (30) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 30, surahName: 'Ar-Rum', ayahNumber: 21,
    arabic: 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُم مَّوَدَّةً وَرَحْمَةً',
    english: 'And of His signs is that He created for you from yourselves mates that you may find tranquility in them; and He placed between you affection and mercy.',
    topics: ['marriage', 'spouse', 'family', 'love', 'mercy', 'wife', 'husband'],
  ),
  // ── Luqman (31) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 31, surahName: 'Luqman', ayahNumber: 12,
    arabic: 'وَلَقَدْ آتَيْنَا لُقْمَانَ الْحِكْمَةَ أَنِ اشْكُرْ لِلَّهِ',
    english: 'We had certainly given Luqman wisdom, [saying]: Be grateful to Allah.',
    topics: ['gratitude', 'shukr', 'wisdom', 'hikmah'],
  ),
  AyahSearchEntry(
    surahNumber: 31, surahName: 'Luqman', ayahNumber: 14,
    arabic: 'وَوَصَّيْنَا الْإِنسَانَ بِوَالِدَيْهِ',
    english: 'And We have enjoined upon man [care] for his parents.',
    topics: ['family', 'parents', 'gratitude'],
  ),
  // ── Al-Ahzab (33) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 33, surahName: 'Al-Ahzab', ayahNumber: 21,
    arabic: 'لَّقَدْ كَانَ لَكُمْ فِي رَسُولِ اللَّهِ أُسْوَةٌ حَسَنَةٌ',
    english: 'There has certainly been for you in the Messenger of Allah an excellent pattern.',
    topics: ['prophet', 'muhammad', 'sunnah', 'guidance'],
  ),
  AyahSearchEntry(
    surahNumber: 33, surahName: 'Al-Ahzab', ayahNumber: 40,
    arabic: 'مَّا كَانَ مُحَمَّدٌ أَبَا أَحَدٍ مِّن رِّجَالِكُمْ وَلَٰكِن رَّسُولَ اللَّهِ وَخَاتَمَ النَّبِيِّينَ',
    english: 'Muhammad is not the father of any of your men, but he is the Messenger of Allah and last of the prophets.',
    topics: ['prophet', 'muhammad', 'prophets', 'revelation'],
  ),
  AyahSearchEntry(
    surahNumber: 33, surahName: 'Al-Ahzab', ayahNumber: 41,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اذْكُرُوا اللَّهَ ذِكْرًا كَثِيرًا',
    english: 'O you who believe! Remember Allah with much remembrance.',
    topics: ['dhikr', 'remembrance', 'faith', 'prayer'],
  ),
  // ── Az-Zumar (39) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 39, surahName: 'Az-Zumar', ayahNumber: 10,
    arabic: 'إِنَّمَا يُوَفَّى الصَّابِرُونَ أَجْرَهُم بِغَيْرِ حِسَابٍ',
    english: 'Indeed, the patient will be given their reward without account.',
    topics: ['patience', 'sabr', 'reward', 'hereafter'],
  ),
  AyahSearchEntry(
    surahNumber: 39, surahName: 'Az-Zumar', ayahNumber: 53,
    arabic: 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنفُسِهِمْ لَا تَقْنَطُوا مِن رَّحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا',
    english: 'Say: O My servants who have transgressed against themselves — do not despair of the mercy of Allah. Indeed, Allah forgives all sins.',
    topics: ['mercy', 'rahma', 'repentance', 'tawbah', 'forgiveness', 'hope'],
  ),
  // ── Ghafir (40) ────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 40, surahName: 'Ghafir', ayahNumber: 3,
    arabic: 'غَافِرِ الذَّنبِ وَقَابِلِ التَّوْبِ شَدِيدِ الْعِقَابِ',
    english: 'Forgiver of sin, acceptor of repentance, severe in punishment, owner of abundance.',
    topics: ['forgiveness', 'repentance', 'tawbah', 'god'],
  ),
  // ── Al-Hujurat (49) ────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 49, surahName: 'Al-Hujurat', ayahNumber: 13,
    arabic: 'يَا أَيُّهَا النَّاسُ إِنَّا خَلَقْنَاكُم مِّن ذَكَرٍ وَأُنثَىٰ وَجَعَلْنَاكُمْ شُعُوبًا وَقَبَائِلَ لِتَعَارَفُوا',
    english: 'O mankind, We have created you from male and female and made you peoples and tribes that you may know one another.',
    topics: ['equality', 'community', 'ummah', 'creation', 'justice'],
  ),
  AyahSearchEntry(
    surahNumber: 49, surahName: 'Al-Hujurat', ayahNumber: 15,
    arabic: 'إِنَّمَا الْمُؤْمِنُونَ الَّذِينَ آمَنُوا بِاللَّهِ وَرَسُولِهِ ثُمَّ لَمْ يَرْتَابُوا',
    english: 'The believers are only those who have believed in Allah and His Messenger and then doubt not.',
    topics: ['faith', 'iman', 'belief', 'certainty'],
  ),
  // ── Adh-Dhariyat (51) ──────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 51, surahName: 'Adh-Dhariyat', ayahNumber: 56,
    arabic: 'وَمَا خَلَقْتُ الْجِنَّ وَالْإِنسَ إِلَّا لِيَعْبُدُونِ',
    english: 'And I did not create the jinn and mankind except to worship Me.',
    topics: ['worship', 'ibadah', 'creation', 'tawhid'],
  ),
  // ── Ar-Rahman (55) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 55, surahName: 'Ar-Rahman', ayahNumber: 1,
    arabic: 'الرَّحْمَٰنُ',
    english: 'The Most Merciful —',
    topics: ['mercy', 'rahma', 'god', 'names of allah'],
  ),
  AyahSearchEntry(
    surahNumber: 55, surahName: 'Ar-Rahman', ayahNumber: 13,
    arabic: 'فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ',
    english: 'So which of the favors of your Lord would you deny?',
    topics: ['blessing', 'gratitude', 'grace', 'mercy'],
  ),
  AyahSearchEntry(
    surahNumber: 55, surahName: 'Ar-Rahman', ayahNumber: 46,
    arabic: 'وَلِمَنْ خَافَ مَقَامَ رَبِّهِ جَنَّتَانِ',
    english: 'But for he who has feared the position of his Lord are two gardens.',
    topics: ['paradise', 'jannah', 'faith', 'reward'],
  ),
  // ── Al-Hadid (57) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 57, surahName: 'Al-Hadid', ayahNumber: 3,
    arabic: 'هُوَ الْأَوَّلُ وَالْآخِرُ وَالظَّاهِرُ وَالْبَاطِنُ',
    english: 'He is the First and the Last, the Ascendant and the Intimate, and He is, of all things, Knowing.',
    topics: ['god', 'tawhid', 'names of allah', 'faith'],
  ),
  // ── Al-Mujadila (58) ───────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 58, surahName: 'Al-Mujadila', ayahNumber: 11,
    arabic: 'يَرْفَعِ اللَّهُ الَّذِينَ آمَنُوا مِنكُمْ وَالَّذِينَ أُوتُوا الْعِلْمَ دَرَجَاتٍ',
    english: 'Allah will raise those who have believed among you and those who were given knowledge, by degrees.',
    topics: ['knowledge', 'ilm', 'faith', 'wisdom'],
  ),
  // ── Al-Jummah (62) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 62, surahName: 'Al-Jummah', ayahNumber: 9,
    arabic: 'يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا نُودِيَ لِلصَّلَاةِ مِن يَوْمِ الْجُمُعَةِ فَاسْعَوْا إِلَىٰ ذِكْرِ اللَّهِ',
    english: 'O you who believe! When the call to prayer is made on Friday, then proceed to the remembrance of Allah.',
    topics: ['prayer', 'friday', 'jummah', 'dhikr', 'faith'],
  ),
  // ── At-Talaq (65) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 65, surahName: 'At-Talaq', ayahNumber: 1,
    arabic: 'يَا أَيُّهَا النَّبِيُّ إِذَا طَلَّقْتُمُ النِّسَاءَ فَطَلِّقُوهُنَّ لِعِدَّتِهِنَّ وَأَحْصُوا الْعِدَّةَ',
    english: 'O Prophet, when you divorce women, divorce them at the commencement of their waiting periods and keep count of the waiting period.',
    topics: ['divorce', 'talaq', 'wife', 'marriage'],
  ),
  AyahSearchEntry(
    surahNumber: 65, surahName: 'At-Talaq', ayahNumber: 2,
    arabic: 'فَإِذَا بَلَغْنَ أَجَلَهُنَّ فَأَمْسِكُوهُنَّ بِمَعْرُوفٍ أَوْ فَارِقُوهُنَّ بِمَعْرُوفٍ',
    english: 'When they have reached their term, either retain them in fairness or let them go in fairness.',
    topics: ['divorce', 'talaq', 'wife', 'husband', 'marriage'],
  ),
  AyahSearchEntry(
    surahNumber: 65, surahName: 'At-Talaq', ayahNumber: 3,
    arabic: 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
    english: 'And whoever relies upon Allah — then He is sufficient for him.',
    topics: ['tawakkul', 'trust', 'reliance', 'faith'],
  ),
  // ── Al-Mulk (67) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 67, surahName: 'Al-Mulk', ayahNumber: 2,
    arabic: 'الَّذِي خَلَقَ الْمَوْتَ وَالْحَيَاةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلًا',
    english: 'Who created death and life to test you as to which of you is best in deed.',
    topics: ['death', 'creation', 'good deeds', 'faith'],
  ),
  // ── Nuh (71) ───────────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 71, surahName: 'Nuh', ayahNumber: 10,
    arabic: 'فَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا',
    english: 'And said: Ask forgiveness of your Lord. Indeed, He is ever a Perpetual Forgiver.',
    topics: ['forgiveness', 'repentance', 'noah', 'nuh', 'istighfar'],
  ),
  // ── Al-Qiyamah (75) ────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 75, surahName: 'Al-Qiyamah', ayahNumber: 1,
    arabic: 'لَا أُقْسِمُ بِيَوْمِ الْقِيَامَةِ',
    english: 'I swear by the Day of Resurrection.',
    topics: ['judgment day', 'qiyamah', 'resurrection', 'hereafter'],
  ),
  // ── Al-Insan (76) ──────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 76, surahName: 'Al-Insan', ayahNumber: 8,
    arabic: 'وَيُطْعِمُونَ الطَّعَامَ عَلَىٰ حُبِّهِ مِسْكِينًا وَيَتِيمًا وَأَسِيرًا',
    english: 'And they give food in spite of love for it to the needy, the orphan, and the captive.',
    topics: ['charity', 'sadaqah', 'good deeds', 'paradise'],
  ),
  // ── Al-Fajr (89) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 89, surahName: 'Al-Fajr', ayahNumber: 27,
    arabic: 'يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ',
    english: 'O reassured soul,',
    topics: ['soul', 'nafs', 'peace', 'paradise'],
  ),
  AyahSearchEntry(
    surahNumber: 89, surahName: 'Al-Fajr', ayahNumber: 28,
    arabic: 'ارْجِعِي إِلَىٰ رَبِّكِ رَاضِيَةً مَّرْضِيَّةً',
    english: 'Return to your Lord, well-pleased and pleasing [to Him].',
    topics: ['soul', 'nafs', 'paradise', 'hereafter', 'death'],
  ),
  // ── Ash-Shams (91) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 91, surahName: 'Ash-Shams', ayahNumber: 9,
    arabic: 'قَدْ أَفْلَحَ مَن زَكَّاهَا',
    english: 'He has succeeded who purifies it [the soul].',
    topics: ['soul', 'nafs', 'purification', 'good deeds'],
  ),
  // ── Ad-Duha (93) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 93, surahName: 'Ad-Duha', ayahNumber: 11,
    arabic: 'وَأَمَّا بِنِعْمَةِ رَبِّكَ فَحَدِّثْ',
    english: 'But as for the favor of your Lord, report it.',
    topics: ['gratitude', 'blessing', 'shukr', 'prophet'],
  ),
  // ── Al-Alaq (96) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 96, surahName: 'Al-Alaq', ayahNumber: 1,
    arabic: 'اقْرَأْ بِاسْمِ رَبِّكَ الَّذِي خَلَقَ',
    english: 'Read in the name of your Lord who created.',
    topics: ['knowledge', 'ilm', 'quran', 'revelation', 'creation', 'read'],
  ),
  AyahSearchEntry(
    surahNumber: 96, surahName: 'Al-Alaq', ayahNumber: 5,
    arabic: 'عَلَّمَ الْإِنسَانَ مَا لَمْ يَعْلَمْ',
    english: 'Taught man that which he knew not.',
    topics: ['knowledge', 'ilm', 'creation', 'education'],
  ),
  // ── Al-Qadr (97) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 97, surahName: 'Al-Qadr', ayahNumber: 1,
    arabic: 'إِنَّا أَنزَلْنَاهُ فِي لَيْلَةِ الْقَدْرِ',
    english: 'Indeed, We sent the Quran down during the Night of Decree.',
    topics: ['quran', 'revelation', 'night of power', 'laylatul', 'qadr', 'ramadan'],
  ),
  AyahSearchEntry(
    surahNumber: 97, surahName: 'Al-Qadr', ayahNumber: 3,
    arabic: 'لَيْلَةُ الْقَدْرِ خَيْرٌ مِّنْ أَلْفِ شَهْرٍ',
    english: 'The Night of Decree is better than a thousand months.',
    topics: ['night of power', 'laylatul', 'qadr', 'ramadan', 'blessed'],
  ),
  // ── Az-Zalzalah (99) ───────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 99, surahName: 'Az-Zalzalah', ayahNumber: 7,
    arabic: 'فَمَن يَعْمَلْ مِثْقَالَ ذَرَّةٍ خَيْرًا يَرَهُ',
    english: 'So whoever does an atom\'s weight of good will see it.',
    topics: ['good deeds', 'judgment day', 'accountability', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 99, surahName: 'Az-Zalzalah', ayahNumber: 8,
    arabic: 'وَمَن يَعْمَلْ مِثْقَالَ ذَرَّةٍ شَرًّا يَرَهُ',
    english: 'And whoever does an atom\'s weight of evil will see it.',
    topics: ['sin', 'judgment day', 'accountability'],
  ),
  // ── Al-Asr (103) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 103, surahName: 'Al-Asr', ayahNumber: 1,
    arabic: 'وَالْعَصْرِ',
    english: 'By time,',
    topics: ['time', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 103, surahName: 'Al-Asr', ayahNumber: 3,
    arabic: 'إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ',
    english: 'Except those who believed and did righteous deeds and advised each other to truth and to patience.',
    topics: ['patience', 'sabr', 'faith', 'good deeds', 'truth', 'time'],
  ),
  // ── Al-Kawthar (108) ───────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 108, surahName: 'Al-Kawthar', ayahNumber: 2,
    arabic: 'فَصَلِّ لِرَبِّكَ وَانْحَرْ',
    english: 'So pray to your Lord and sacrifice [to Him alone].',
    topics: ['prayer', 'salah', 'worship', 'prophet'],
  ),
  // ── Al-Ikhlas (112) ────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 112, surahName: 'Al-Ikhlas', ayahNumber: 1,
    arabic: 'قُلْ هُوَ اللَّهُ أَحَدٌ',
    english: 'Say: He is Allah, [who is] One.',
    topics: ['tawhid', 'monotheism', 'god', 'unity', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 112, surahName: 'Al-Ikhlas', ayahNumber: 2,
    arabic: 'اللَّهُ الصَّمَدُ',
    english: 'Allah, the Absolute, the Self-Sufficient.',
    topics: ['tawhid', 'god', 'faith'],
  ),
  AyahSearchEntry(
    surahNumber: 112, surahName: 'Al-Ikhlas', ayahNumber: 4,
    arabic: 'وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
    english: 'Nor is there to Him any equivalent.',
    topics: ['tawhid', 'god', 'faith', 'unity'],
  ),
  // ── Al-Falaq (113) ─────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 113, surahName: 'Al-Falaq', ayahNumber: 1,
    arabic: 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ',
    english: 'Say: I seek refuge in the Lord of daybreak',
    topics: ['protection', 'refuge', 'evil'],
  ),
  // ── An-Nas (114) ───────────────────────────────────────────────────────────
  AyahSearchEntry(
    surahNumber: 114, surahName: 'An-Nas', ayahNumber: 1,
    arabic: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ',
    english: 'Say: I seek refuge in the Lord of mankind,',
    topics: ['protection', 'refuge', 'evil'],
  ),
];

// ─── Search logic ─────────────────────────────────────────────────────────────

class AyahSearchIndex {
  const AyahSearchIndex._();

  /// Returns ayahs matching [query] sorted by surah/ayah order.
  /// Matches against: topic tags (with synonym expansion), English translation
  /// text, and surah name (with Al- article normalisation).
  static List<AyahSearchEntry> search(String query) {
    final raw = query.toLowerCase().trim();
    if (raw.isEmpty) return const [];

    final rawStripped = IslamicSynonyms.stripArticle(raw);
    final expandedTerms = IslamicSynonyms.expandQuery(raw);

    final seen = <String>{};
    final results = <AyahSearchEntry>[];

    void add(AyahSearchEntry e) {
      final key = '${e.surahNumber}:${e.ayahNumber}';
      if (seen.add(key)) results.add(e);
    }

    for (final entry in _kAyahs) {
      // 1. Topic tag match (uses synonym expansion for cross-language support).
      if (entry.topics.any((t) => expandedTerms.contains(t))) {
        add(entry);
        continue;
      }

      // 2. Surah name match with Al- normalisation.
      final nameStripped =
          IslamicSynonyms.stripArticle(entry.surahName.toLowerCase());
      if (nameStripped.contains(rawStripped) && rawStripped.length >= 2) {
        add(entry);
        continue;
      }

      // 3. English translation text match — whole-word only to avoid false
      // positives from short synonym-group terms (e.g. 'fe' inside 'wife').
      final enL = entry.english.toLowerCase();
      if (expandedTerms.any((t) => t.length >= 3 && _containsWord(enL, t))) {
        add(entry);
        continue;
      }

      // 4. Arabic script match.
      if (raw.length >= 2 && entry.arabic.contains(raw)) {
        add(entry);
        continue;
      }
    }

    results.sort((a, b) {
      final c = a.surahNumber.compareTo(b.surahNumber);
      return c != 0 ? c : a.ayahNumber.compareTo(b.ayahNumber);
    });
    return results;
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
}
