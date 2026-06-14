class Dua {
  final String arabic;
  final String transliteration;
  final String translation;
  final String source;
  final String? translationEs;
  final String? translationUr;

  const Dua({
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.source,
    this.translationEs,
    this.translationUr,
  });
}

const List<Dua> lockScreenDuas = [
  Dua(
    arabic: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ\nفِي الدُّنْيَا وَالآخِرَةِ',
    transliteration: 'Allahumma inni as\'aluka al-\'afwa wal-\'afiyah\nfid-dunya wal-akhirah',
    translation: 'O Allah, I ask You for pardon and well-being\nin this world and the next.',
    source: 'Ibn Majah',
  ),
  Dua(
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ\nسُبْحَانَ اللَّهِ الْعَظِيمِ',
    transliteration: 'Subhanallahi wa bihamdih\nSubhanallahil-\'Azim',
    translation: 'Glory be to Allah and His is the praise.\nGlory be to Allah, the Magnificent.',
    source: 'Bukhari & Muslim',
  ),
  Dua(
    arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً\nوَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    transliteration: 'Rabbana atina fid-dunya hasanatan\nwa fil-akhirati hasanatan wa qina \'adhab an-nar',
    translation: 'Our Lord, give us good in this world and good\nin the next, and protect us from the Fire.',
    source: 'Al-Baqarah 2:201',
  ),
  Dua(
    arabic: 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ\nنِعْمَ الْمَوْلَى وَنِعْمَ النَّصِيرُ',
    transliteration: 'Hasbunallahu wa ni\'mal-wakil\nNi\'mal-mawla wa ni\'man-nasir',
    translation: 'Allah is sufficient for us, and He is the best\ndisposer of affairs, the best Protector.',
    source: 'Al-Imran 3:173',
  ),
  Dua(
    arabic: 'رَبِّ اشْرَحْ لِي صَدْرِي\nوَيَسِّرْ لِي أَمْرِي',
    transliteration: 'Rabbi ishrah li sadri\nwa yassir li amri',
    translation: 'My Lord, expand my breast for me\nand ease my task for me.',
    source: 'Ta-Ha 20:25–26',
  ),
];

const List<Dua> focusDuas = [
  Dua(
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    transliteration: 'Subhanallahi wa bihamdih',
    translation: 'Glory be to Allah and His is the praise.',
    source: 'Bukhari & Muslim',
  ),
  Dua(
    arabic: 'اللَّهُ أَكْبَرُ كَبِيرًا\nوَالْحَمْدُ لِلَّهِ كَثِيرًا',
    transliteration: 'Allahu akbaru kabiran\nwal-hamdu lillahi kathiran',
    translation: 'Allah is the greatest, the Most Great.\nAll abundant praise belongs to Allah.',
    source: 'Muslim',
  ),
  Dua(
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ\nوَحْدَهُ لَا شَرِيكَ لَهُ',
    transliteration: 'La ilaha illallahu\nwahdahu la sharika lah',
    translation: 'There is no god but Allah,\nalone without any partner.',
    source: 'Bukhari & Muslim',
  ),
  Dua(
    arabic: 'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ\nالَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ',
    transliteration: 'Astaghfirullaha al-\'Azim\nalladhi la ilaha illa Huwal-Hayyal-Qayyum',
    translation: 'I seek forgiveness of Allah the Magnificent,\nbesides Whom none has the right to be worshipped.',
    source: 'Abu Dawud & Tirmidhi',
  ),
];
