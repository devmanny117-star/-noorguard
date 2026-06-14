import '../models/dua_model.dart';

// ─── Category model ───────────────────────────────────────────────────────────

class DuaCategory {
  final String id;
  final String label;
  final String emoji;
  final List<CategorizedDua> duas;

  const DuaCategory({
    required this.id,
    required this.label,
    required this.emoji,
    required this.duas,
  });
}

class CategorizedDua extends Dua {
  final String category;

  const CategorizedDua({
    required super.arabic,
    required super.transliteration,
    required super.translation,
    required super.source,
    required this.category,
    super.translationEs,
    super.translationUr,
  });
}

// ─── All duas ────────────────────────────────────────────────────────────────

const _morningEvening = [
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا\nوَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
    transliteration:
        'Allahumma bika asbahna wa bika amsayna,\nwa bika nahya wa bika namutu wa ilayka an-nushur',
    translation:
        'O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die, and to You is the resurrection.',
    translationEs:
        'Oh Allah, por Ti entramos en la mañana y por Ti entramos en la noche; por Ti vivimos y por Ti morimos, y hacia Ti es la resurrección.',
    translationUr:
        'اے اللہ! تیرے ہی سبب ہم نے صبح کی اور تیرے ہی سبب شام کی، تیرے ہی سبب ہم زندہ ہیں اور تیرے ہی سبب مریں گے، اور تیری ہی طرف اٹھنا ہے۔',
    source: 'Abu Dawud 5068 / Tirmidhi 3391',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ\nوَالْحَمْدُ لِلَّهِ لَا شَرِيكَ لَهُ',
    transliteration:
        'Asbahna wa asbahal-mulku lillah,\nwal-hamdu lillahi la sharika lah',
    translation:
        'We have entered the morning and the whole kingdom of Allah has entered the morning; praise be to Allah, He has no partner.',
    translationEs:
        'Hemos entrado en la mañana y todo el reino pertenece a Allah; alabado sea Allah, Él no tiene socio.',
    translationUr:
        'ہم نے صبح کی اور بادشاہی اللہ ہی کی صبح ہوئی، اور تمام تعریفیں اللہ کے لیے ہیں، اس کا کوئی شریک نہیں۔',
    source: 'Muslim 2723',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ\nخَلَقْتَنِي وَأَنَا عَبْدُكَ',
    transliteration:
        'Allahumma anta rabbi la ilaha illa ant,\nkhalaqtani wa ana abduk',
    translation:
        'O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant.',
    translationEs:
        'Oh Allah, Tú eres mi Señor, no hay nadie que merezca ser adorado salvo Tú. Tú me creaste y yo soy Tu siervo.',
    translationUr:
        'اے اللہ! تو میرا رب ہے، تیرے سوا کوئی معبودِ برحق نہیں، تو نے مجھے پیدا کیا اور میں تیرا بندہ ہوں۔',
    source: 'Bukhari 6306',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ\nفِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
    transliteration:
        'Bismillahil-ladhi la yadurru ma\'a ismihi shay\'un\nfil-ardi wa la fis-sama\'i wa Huwas-Sami\'ul-\'Alim',
    translation:
        'In the name of Allah with Whose name nothing can harm in the earth or in the heavens, and He is the All-Hearing, All-Knowing.',
    translationEs:
        'En el nombre de Allah, con cuyo nombre nada puede causar daño ni en la tierra ni en el cielo, y Él es el Oyente, el Conocedor.',
    translationUr:
        'اللہ کے نام سے جس کے نام کے ساتھ زمین و آسمان میں کوئی چیز نقصان نہیں پہنچا سکتی، اور وہ سننے والا، جاننے والا ہے۔',
    source: 'Abu Dawud 5088 / Tirmidhi 3388',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ\nمِنْ شَرِّ مَا خَلَقَ',
    transliteration:
        'A\'udhu bi kalimatillahit-tammati\nmin sharri ma khalaq',
    translation:
        'I seek refuge in the perfect words of Allah from the evil of what He has created.',
    translationEs:
        'Me refugio en las palabras perfectas de Allah del mal de lo que Él ha creado.',
    translationUr:
        'میں اللہ کے کامل کلمات کے ذریعے اس چیز کے شر سے پناہ مانگتا ہوں جو اس نے پیدا کی۔',
    source: 'Muslim 2708',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'اللَّهُمَّ عَافِنِي فِي بَدَنِي\nاللَّهُمَّ عَافِنِي فِي سَمْعِي\nاللَّهُمَّ عَافِنِي فِي بَصَرِي',
    transliteration:
        'Allahumma \'afini fi badani,\nAllahumma \'afini fi sam\'i,\nAllahumma \'afini fi basari',
    translation:
        'O Allah, grant me health in my body. O Allah, grant me health in my hearing. O Allah, grant me health in my sight.',
    translationEs:
        'Oh Allah, concédeme salud en mi cuerpo. Oh Allah, concédeme salud en mi oído. Oh Allah, concédeme salud en mi vista.',
    translationUr:
        'اے اللہ! مجھے میرے بدن میں عافیت عطا فرما۔ اے اللہ! مجھے میرے کان میں عافیت عطا فرما۔ اے اللہ! مجھے میری آنکھ میں عافیت عطا فرما۔',
    source: 'Abu Dawud 5090',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'حَسْبِيَ اللَّهُ لَا إِلَهَ إِلَّا هُوَ\nعَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
    transliteration:
        'Hasbiyallahu la ilaha illa Huwa,\n\'alayhi tawakkaltu wa Huwa Rabbul-\'Arshil-\'Azim',
    translation:
        'Allah is sufficient for me; none has the right to be worshipped except Him. In Him I put my trust, and He is the Lord of the Mighty Throne.',
    translationEs:
        'Allah me basta; no hay nadie que merezca ser adorado salvo Él. En Él deposito mi confianza, y Él es el Señor del Trono Inmenso.',
    translationUr:
        'اللہ مجھے کافی ہے، اس کے سوا کوئی معبود نہیں، میں نے اسی پر بھروسہ کیا اور وہ عرشِ عظیم کا رب ہے۔',
    source: 'Abu Dawud 5081 (7 times morning & evening)',
  ),
  CategorizedDua(
    category: 'morning_evening',
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ\nعَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ\nوَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ',
    transliteration:
        'Subhanallahi wa bihamdih,\n\'adada khalqihi wa rida nafsihi,\nwa zinata \'arshihi wa midade kalimatihi',
    translation:
        'Glory and praise be to Allah, as many times as the number of His creatures, in accordance with His good pleasure, equal to the weight of His Throne and equal to the ink that may be used in recording the words.',
    translationEs:
        'Gloria y alabanza a Allah, tantas veces como el número de Sus criaturas, conforme a Su complacencia, equivalente al peso de Su Trono e igual a la tinta usada para registrar Sus palabras.',
    translationUr:
        'اللہ پاک ہے اور اسی کی حمد ہے، اس کی مخلوق کی تعداد کے برابر، اس کی رضا کے برابر، اس کے عرش کے وزن کے برابر اور اس کے کلمات کی روشنائی کے برابر۔',
    source: 'Muslim 2726',
  ),
];

const _prayerRelated = [
  CategorizedDua(
    category: 'prayer',
    arabic: 'اللَّهُمَّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي\nرَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    transliteration:
        'Allahumma-j\'alni muqimas-salati wa min dhurriyyati,\nRabbana wa taqabbal du\'a\'',
    translation:
        'O Allah, make me one who establishes prayer and also from my offspring. Our Lord, accept my supplication.',
    translationEs:
        'Oh Allah, hazme de los que cumplen la oración, y también a mi descendencia. Señor nuestro, acepta mi súplica.',
    translationUr:
        'اے اللہ! مجھے نماز قائم کرنے والا بنا اور میری اولاد میں سے بھی۔ اے ہمارے رب! میری دعا قبول فرما۔',
    source: 'Ibrahim 14:40',
  ),
  CategorizedDua(
    category: 'prayer',
    arabic: 'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ\nوَلَا تَجْعَلْنِي مِنَ الْغَافِلِينَ',
    transliteration:
        'Rabbi-j\'alni muqimas-salati\nwa la taj\'alni minal-ghafilin',
    translation:
        'My Lord, make me one who establishes prayer, and do not place me among the heedless.',
    translationEs:
        'Señor mío, hazme de los que cumplen la oración, y no me pongas entre los descuidados.',
    translationUr:
        'اے میرے رب! مجھے نماز قائم کرنے والا بنا اور مجھے غافلوں میں شامل نہ کر۔',
    source: 'Ibrahim 14:40 (variant)',
  ),
  CategorizedDua(
    category: 'prayer',
    arabic: 'اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ\nوَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ',
    transliteration:
        'Allahumma a\'inni \'ala dhikrika\nwa shukrika wa husni \'ibadatik',
    translation:
        'O Allah, help me to remember You, to give thanks to You, and to worship You in the best manner.',
    translationEs:
        'Oh Allah, ayúdame a recordarte, a agradecerte y a adorarte de la mejor manera.',
    translationUr:
        'اے اللہ! میری مدد فرما کہ میں تجھے یاد رکھوں، تیرا شکر ادا کروں اور بہترین انداز میں تیری عبادت کروں۔',
    source: 'Abu Dawud 1522',
  ),
  CategorizedDua(
    category: 'prayer',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكَسَلِ\nوَالْهَرَمِ وَالْمَغْرَمِ وَالْمَأْثَمِ',
    transliteration:
        'Allahumma inni a\'udhu bika minal-kasali\nwal-harami wal-maghrami wal-ma\'thami',
    translation:
        'O Allah, I seek Your refuge from laziness, old age, debt, and sin.',
    translationEs:
        'Oh Allah, busco refugio en Ti de la pereza, la vejez, las deudas y el pecado.',
    translationUr:
        'اے اللہ! میں سستی، بڑھاپے، قرض اور گناہ سے تیری پناہ مانگتا ہوں۔',
    source: 'Bukhari 6367',
  ),
  CategorizedDua(
    category: 'prayer',
    arabic: 'رَبَّنَا تَقَبَّلْ مِنَّا\nإِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ',
    transliteration:
        'Rabbana taqabbal minna,\ninnaka Antas-Sami\'ul-\'Alim',
    translation:
        'Our Lord, accept from us. Indeed, You are the Hearing, the Knowing.',
    translationEs:
        'Señor nuestro, acepta de nosotros. En verdad, Tú eres el Oyente, el Conocedor.',
    translationUr:
        'اے ہمارے رب! ہم سے قبول فرما، بے شک تو سننے والا، جاننے والا ہے۔',
    source: 'Al-Baqarah 2:127',
  ),
  CategorizedDua(
    category: 'prayer',
    arabic: 'اللَّهُمَّ لَا تَجْعَلْ قَبْرِي وَثَناً\nلَعَنَ اللَّهُ قَوْمًا اتَّخَذُوا قُبُورَ أَنْبِيَائِهِمْ مَسَاجِدَ',
    transliteration:
        'Allahumma la taj\'al qabri wathan,\nla\'anallahu qawman ittakhadhu qubura anbiya\'ihim masajid',
    translation:
        'O Allah, do not make my grave an idol to be worshipped. Allah cursed the people who took the graves of their prophets as places of worship.',
    translationEs:
        'Oh Allah, no hagas de mi tumba un ídolo que sea adorado. Allah maldijo a la gente que tomó las tumbas de sus profetas como lugares de adoración.',
    translationUr:
        'اے اللہ! میری قبر کو بت نہ بنانا جس کی پوجا کی جائے۔ اللہ نے ان لوگوں پر لعنت کی جنہوں نے اپنے انبیاء کی قبروں کو سجدہ گاہ بنا لیا۔',
    source: 'Muwatta of Malik 1:223',
  ),
];

const _foodDrink = [
  CategorizedDua(
    category: 'food',
    arabic: 'بِسْمِ اللَّهِ',
    transliteration: 'Bismillah',
    translation: 'In the name of Allah.',
    translationEs: 'En el nombre de Allah.',
    translationUr: 'اللہ کے نام سے۔',
    source: 'Abu Dawud 3767',
  ),
  CategorizedDua(
    category: 'food',
    arabic: 'اللَّهُمَّ بَارِكْ لَنَا فِيهِ\nوَأَطْعِمْنَا خَيْرًا مِنْهُ',
    transliteration:
        'Allahumma barik lana fihi\nwa at\'imna khayran minh',
    translation:
        'O Allah, bless us in it and feed us with better than it.',
    translationEs:
        'Oh Allah, bendícenos en ello y aliméntanos con algo mejor que ello.',
    translationUr:
        'اے اللہ! اس میں ہمارے لیے برکت عطا فرما اور ہمیں اس سے بہتر کھلا۔',
    source: 'Tirmidhi 3455',
  ),
  CategorizedDua(
    category: 'food',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا\nوَجَعَلَنَا مُسْلِمِينَ',
    transliteration:
        'Alhamdu lillahil-ladhi at\'amana wa saqana\nwa ja\'alana muslimin',
    translation:
        'All praise is for Allah Who fed us and gave us drink and made us Muslims.',
    translationEs:
        'Toda alabanza es para Allah, Quien nos alimentó, nos dio de beber y nos hizo musulmanes.',
    translationUr:
        'تمام تعریفیں اللہ کے لیے ہیں جس نے ہمیں کھلایا، پلایا اور ہمیں مسلمان بنایا۔',
    source: 'Abu Dawud 3850',
  ),
  CategorizedDua(
    category: 'food',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَ هَذَا الطَّعَامَ\nوَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
    transliteration:
        'Alhamdu lillahil-ladhi at\'ama hadha at-ta\'am\nwa razaqanihi min ghayri hawlin minni wa la quwwah',
    translation:
        'All praise is for Allah Who provided this food and sustained me with it without any power or strength on my part.',
    translationEs:
        'Toda alabanza es para Allah, Quien proveyó este alimento y me sustentó con él sin ningún poder ni fuerza de mi parte.',
    translationUr:
        'تمام تعریفیں اللہ کے لیے ہیں جس نے یہ کھانا عطا کیا اور میری کسی طاقت اور قوت کے بغیر مجھے یہ رزق دیا۔',
    source: 'Abu Dawud 4023, Tirmidhi 3458',
  ),
  CategorizedDua(
    category: 'food',
    arabic: 'اللَّهُمَّ أَطْعِمْ مَنْ أَطْعَمَنِي\nوَاسْقِ مَنْ سَقَانِي',
    transliteration:
        'Allahumma at\'im man at\'amani\nwasqi man saqani',
    translation:
        'O Allah, feed the one who fed me, and give drink to the one who gave me drink.',
    translationEs:
        'Oh Allah, alimenta a quien me alimentó, y da de beber a quien me dio de beber.',
    translationUr:
        'اے اللہ! جس نے مجھے کھلایا اسے کھلا اور جس نے مجھے پلایا اسے پلا۔',
    source: 'Muslim 2055',
  ),
];

const _travel = [
  CategorizedDua(
    category: 'travel',
    arabic: 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا\nوَمَا كُنَّا لَهُ مُقْرِنِينَ\nوَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ',
    transliteration:
        'Subhana-l-ladhi sakhkhara lana hadha\nwa ma kunna lahu muqrinin,\nwa inna ila Rabbina la munqalibun',
    translation:
        'Glory be to Him who has subjected this to us, and we were not capable of doing it ourselves. And indeed, to our Lord we are returning.',
    translationEs:
        'Gloria a Aquel que ha sometido esto a nosotros, pues nosotros no podíamos hacerlo por nosotros mismos. Y en verdad, a nuestro Señor hemos de retornar.',
    translationUr:
        'پاک ہے وہ ذات جس نے اس سواری کو ہمارے بس میں کر دیا اور ہم اسے قابو میں لانے والے نہ تھے، اور بے شک ہم اپنے رب کی طرف لوٹنے والے ہیں۔',
    source: 'Az-Zukhruf 43:13–14 / Abu Dawud 2602',
  ),
  CategorizedDua(
    category: 'travel',
    arabic: 'اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا\nالْبِرَّ وَالتَّقْوَى وَمِنَ الْعَمَلِ مَا تَرْضَى',
    transliteration:
        'Allahumma inna nas\'aluka fi safarina hadha\nal-birra wat-taqwa, wa minal-\'amali ma tarda',
    translation:
        'O Allah, we ask You on this journey for righteousness and piety, and deeds that are pleasing to You.',
    translationEs:
        'Oh Allah, te pedimos en este viaje rectitud y piedad, y obras que sean de Tu agrado.',
    translationUr:
        'اے اللہ! ہم اپنے اس سفر میں تجھ سے نیکی، تقویٰ اور ایسے عمل کا سوال کرتے ہیں جس سے تو راضی ہو۔',
    source: 'Muslim 1342',
  ),
  CategorizedDua(
    category: 'travel',
    arabic: 'اللَّهُمَّ أَنْتَ الصَّاحِبُ فِي السَّفَرِ\nوَالْخَلِيفَةُ فِي الْأَهْلِ',
    transliteration:
        'Allahumma Antas-Sahibu fis-safari\nwal-Khalifatu fil-ahl',
    translation:
        'O Allah, You are the Companion in travel and the Guardian of the family.',
    translationEs:
        'Oh Allah, Tú eres el Compañero en el viaje y el Guardián de la familia.',
    translationUr:
        'اے اللہ! تو سفر میں ساتھی ہے اور گھر والوں میں میرا جانشین ہے۔',
    source: 'Muslim 1342',
  ),
  CategorizedDua(
    category: 'travel',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السَّفَرِ\nوَكَآبَةِ الْمَنْظَرِ وَسُوءِ الْمُنْقَلَبِ',
    transliteration:
        'Allahumma inni a\'udhu bika min wa\'tha\'is-safari\nwa ka\'abatil-manzari wa su\'il-munqalab',
    translation:
        'O Allah, I seek refuge with You from the hardships of travel, from distress upon returning, and from finding loved ones in bad condition.',
    translationEs:
        'Oh Allah, busco refugio en Ti de las dificultades del viaje, de la angustia al regresar, y de encontrar a mis seres queridos en mal estado.',
    translationUr:
        'اے اللہ! میں سفر کی مشقت، واپسی کے غم اور اہلِ خانہ کی بری حالت دیکھنے سے تیری پناہ مانگتا ہوں۔',
    source: 'Bukhari 1804',
  ),
  CategorizedDua(
    category: 'travel',
    arabic: 'آيَبُونَ تَائِبُونَ عَابِدُونَ\nلِرَبِّنَا حَامِدُونَ',
    transliteration:
        'Ayibuna ta\'ibuna \'abidun\nli-Rabbina hamidun',
    translation:
        'We return repentant, worshipping and praising our Lord.',
    translationEs:
        'Regresamos arrepentidos, adorando y alabando a nuestro Señor.',
    translationUr:
        'ہم لوٹنے والے، توبہ کرنے والے، عبادت کرنے والے اور اپنے رب کی حمد کرنے والے ہیں۔',
    source: 'Muslim 1345',
  ),
];

const _home = [
  CategorizedDua(
    category: 'home',
    arabic: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ\nوَخَيْرَ الْمَخْرَجِ',
    transliteration:
        'Allahumma inni as\'aluka khayral-mawliji\nwa khayral-makhraj',
    translation:
        'O Allah, I ask You for a good entry and a good exit.',
    translationEs:
        'Oh Allah, te pido una buena entrada y una buena salida.',
    translationUr:
        'اے اللہ! میں تجھ سے اچھے داخلے اور اچھے خروج کا سوال کرتا ہوں۔',
    source: 'Abu Dawud 5096',
  ),
  CategorizedDua(
    category: 'home',
    arabic: 'بِسْمِ اللَّهِ وَلَجْنَا\nوَبِسْمِ اللَّهِ خَرَجْنَا\nوَعَلَى اللَّهِ رَبِّنَا تَوَكَّلْنَا',
    transliteration:
        'Bismillahi walajna,\nwa bismillahi kharajna,\nwa \'alallahi Rabbina tawakkalna',
    translation:
        'In the name of Allah we enter, in the name of Allah we leave, and upon Allah our Lord we put our trust.',
    translationEs:
        'En el nombre de Allah entramos, en el nombre de Allah salimos, y en Allah, nuestro Señor, depositamos nuestra confianza.',
    translationUr:
        'ہم اللہ کے نام سے داخل ہوئے اور اللہ کے نام سے نکلے اور اللہ ہی پر، جو ہمارا رب ہے، بھروسہ کیا۔',
    source: 'Abu Dawud 5096',
  ),
  CategorizedDua(
    category: 'home',
    arabic: 'رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ\nوَأَخْرِجْنِي مُخْرَجَ صِدْقٍ\nوَاجْعَلْ لِي مِنْ لَدُنْكَ سُلْطَانًا نَصِيرًا',
    transliteration:
        'Rabbi adkhilni mudkhala sidqin\nwa akhrijni mukhraja sidqin\nwaj\'al li min ladunka sultanan nasira',
    translation:
        'My Lord, cause me to enter a sound entrance and to exit a sound exit, and grant me from Yourself a supporting authority.',
    translationEs:
        'Señor mío, haz que entre con una entrada sincera y que salga con una salida sincera, y concédeme de Tu parte una autoridad que me auxilie.',
    translationUr:
        'اے میرے رب! مجھے سچائی کے ساتھ داخل کر اور سچائی کے ساتھ نکال اور اپنی طرف سے میرے لیے مددگار قوت عطا فرما۔',
    source: 'Al-Isra 17:80',
  ),
  CategorizedDua(
    category: 'home',
    arabic: 'اللَّهُمَّ اجْعَلْ فِي قَلْبِي نُورًا\nوَفِي لِسَانِي نُورًا\nوَاجْعَلْ فِي نَفْسِي نُورًا',
    transliteration:
        'Allahumma-j\'al fi qalbi nuran\nwa fi lisani nuran\nwaj\'al fi nafsi nuran',
    translation:
        'O Allah, place light in my heart, and on my tongue light, and within myself light.',
    translationEs:
        'Oh Allah, pon luz en mi corazón, luz en mi lengua y luz dentro de mí mismo.',
    translationUr:
        'اے اللہ! میرے دل میں نور پیدا کر، میری زبان میں نور رکھ اور میری ذات میں نور رکھ۔',
    source: 'Muslim 763',
  ),
];

const _anxietyStress = [
  CategorizedDua(
    category: 'anxiety',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ\nوَالْعَجْزِ وَالْكَسَلِ',
    transliteration:
        'Allahumma inni a\'udhu bika minal-hammi wal-hazan,\nwal-\'ajzi wal-kasal',
    translation:
        'O Allah, I seek refuge in You from grief and anxiety, from incapacity and laziness.',
    translationEs:
        'Oh Allah, busco refugio en Ti de la angustia y la tristeza, de la incapacidad y la pereza.',
    translationUr:
        'اے اللہ! میں غم اور پریشانی سے، اور بے بسی اور سستی سے تیری پناہ مانگتا ہوں۔',
    source: 'Bukhari 6369',
  ),
  CategorizedDua(
    category: 'anxiety',
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ\nلَا إِلَهَ إِلَّا اللَّهُ رَبُّ الْعَرْشِ الْعَظِيمِ',
    transliteration:
        'La ilaha illallahul-\'Azimul-Halim,\nla ilaha illallahu Rabbul-\'Arshil-\'Azim',
    translation:
        'None has the right to be worshipped except Allah, the Magnificent, the Forbearing. None has the right to be worshipped except Allah, Lord of the Mighty Throne.',
    translationEs:
        'No hay nadie que merezca ser adorado salvo Allah, el Magnífico, el Indulgente. No hay nadie que merezca ser adorado salvo Allah, Señor del Trono Inmenso.',
    translationUr:
        'اللہ کے سوا کوئی معبود نہیں، وہ بڑا بردبار اور حلیم ہے۔ اللہ کے سوا کوئی معبود نہیں، وہ عرشِ عظیم کا رب ہے۔',
    source: 'Bukhari 6346',
  ),
  CategorizedDua(
    category: 'anxiety',
    arabic: 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
    transliteration: 'Hasbunallahu wa ni\'mal-Wakil',
    translation:
        'Allah is sufficient for us, and He is the best disposer of affairs.',
    translationEs:
        'Allah nos basta, y Él es el mejor protector.',
    translationUr:
        'ہمیں اللہ کافی ہے اور وہ بہترین کارساز ہے۔',
    source: 'Al-Imran 3:173 / Bukhari 4563',
  ),
  CategorizedDua(
    category: 'anxiety',
    arabic: 'رَبِّ إِنِّي مَسَّنِيَ الضُّرُّ\nوَأَنْتَ أَرْحَمُ الرَّاحِمِينَ',
    transliteration:
        'Rabbi inni massaniyad-durru\nwa Anta arhamur-rahimin',
    translation:
        'My Lord, adversity has touched me, and you are the Most Merciful of the merciful.',
    translationEs:
        'Señor mío, la adversidad me ha afligido, y Tú eres el más Misericordioso de los misericordiosos.',
    translationUr:
        'اے میرے رب! مجھے تکلیف پہنچی ہے اور تو سب رحم کرنے والوں سے زیادہ رحم کرنے والا ہے۔',
    source: 'Al-Anbiya 21:83',
  ),
  CategorizedDua(
    category: 'anxiety',
    arabic: 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو\nفَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ',
    transliteration:
        'Allahumma rahmataka arju\nfala takilni ila nafsi tarfata \'ayn',
    translation:
        'O Allah, it is Your mercy that I hope for, so do not leave me in charge of my affairs even for the blink of an eye.',
    translationEs:
        'Oh Allah, es Tu misericordia lo que espero, así que no me dejes a cargo de mis propios asuntos ni siquiera por un abrir y cerrar de ojos.',
    translationUr:
        'اے اللہ! میں تیری ہی رحمت کا امیدوار ہوں، پس مجھے ایک پلک جھپکنے کے برابر بھی میرے نفس کے سپرد نہ کر۔',
    source: 'Abu Dawud 5090',
  ),
  CategorizedDua(
    category: 'anxiety',
    arabic: 'يَا حَيُّ يَا قَيُّومُ\nبِرَحْمَتِكَ أَسْتَغِيثُ',
    transliteration:
        'Ya Hayyu ya Qayyum\nbiraHmatika astagith',
    translation:
        'O Ever Living, O Self-Subsisting, by Your mercy I seek help.',
    translationEs:
        'Oh Viviente, oh Sustentador, por Tu misericordia imploro ayuda.',
    translationUr:
        'اے ہمیشہ زندہ رہنے والے، اے سب کو قائم رکھنے والے! میں تیری رحمت کے ذریعے مدد مانگتا ہوں۔',
    source: 'Tirmidhi 3524',
  ),
];

const _gratitude = [
  CategorizedDua(
    category: 'gratitude',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِي بِنِعْمَتِهِ تَتِمُّ الصَّالِحَاتُ',
    transliteration:
        'Alhamdu lillahil-ladhi bi ni\'matihi tatimmus-salihat',
    translation:
        'Praise be to Allah by Whose grace and bounty good works are accomplished.',
    translationEs:
        'Alabado sea Allah, por cuya gracia y favor se llevan a cabo las buenas obras.',
    translationUr:
        'تمام تعریفیں اللہ کے لیے ہیں جس کی نعمت سے نیک اعمال مکمل ہوتے ہیں۔',
    source: 'Ibn Majah 3803',
  ),
  CategorizedDua(
    category: 'gratitude',
    arabic: 'رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ\nوَعَلَى وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ',
    transliteration:
        'Rabbi awzi\'ni an ashkura ni\'matakal-lati an\'amta \'alayya\nwa \'ala walidayya wa an a\'mala salihan tardah',
    translation:
        'My Lord, enable me to be grateful for Your favour which You have bestowed upon me and upon my parents, and to do righteousness of which You approve.',
    translationEs:
        'Señor mío, permíteme ser agradecido por Tu favor que me has concedido a mí y a mis padres, y que obre con rectitud de la que Tú estés complacido.',
    translationUr:
        'اے میرے رب! مجھے توفیق دے کہ میں تیری اس نعمت کا شکر ادا کروں جو تو نے مجھ پر اور میرے والدین پر کی ہے، اور یہ کہ میں ایسے نیک عمل کروں جس سے تو راضی ہو۔',
    source: 'An-Naml 27:19',
  ),
  CategorizedDua(
    category: 'gratitude',
    arabic: 'اللَّهُمَّ لَكَ الْحَمْدُ كُلُّهُ\nوَلَكَ الشُّكْرُ كُلُّهُ',
    transliteration:
        'Allahumma lakal-hamdu kulluhu\nwa lakashshukru kulluhu',
    translation:
        'O Allah, all praise belongs to You, and all thanks belong to You.',
    translationEs:
        'Oh Allah, Tuya es toda la alabanza y Tuyo es todo el agradecimiento.',
    translationUr:
        'اے اللہ! ساری تعریف تیرے ہی لیے ہے اور سارا شکر تیرے ہی لیے ہے۔',
    source: 'Ahmad 17311',
  ),
  CategorizedDua(
    category: 'gratitude',
    arabic: 'الْحَمْدُ لِلَّهِ عَلَى كُلِّ حَالٍ',
    transliteration: 'Alhamdu lillahi \'ala kulli hal',
    translation: 'Praise be to Allah in all circumstances.',
    translationEs: 'Alabado sea Allah en toda circunstancia.',
    translationUr: 'ہر حال میں اللہ کی تعریف ہے۔',
    source: 'Ibn Majah 3800',
  ),
];

const _protection = [
  CategorizedDua(
    category: 'protection',
    arabic: 'أَعُوذُ بِاللَّهِ السَّمِيعِ الْعَلِيمِ\nمِنَ الشَّيْطَانِ الرَّجِيمِ',
    transliteration:
        'A\'udhu billahis-Sami\'il-\'Alim\nminas-shayтanir-rajim',
    translation:
        'I seek refuge with Allah, the All-Hearing, All-Knowing, from the accursed Shaitan.',
    translationEs:
        'Busco refugio en Allah, el Oyente, el Conocedor, del maldito Shaitán.',
    translationUr:
        'میں اللہ سننے والے، جاننے والے کی پناہ میں آتا ہوں شیطان مردود سے۔',
    source: 'Abu Dawud 775',
  ),
  CategorizedDua(
    category: 'protection',
    arabic: 'اللَّهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ\nوَمِنْ خَلْفِي وَعَنْ يَمِينِي وَعَنْ شِمَالِي\nوَمِنْ فَوْقِي',
    transliteration:
        'Allahumma-hfazni min bayni yadayya\nwa min khalfi wa \'an yamini wa \'an shimali\nwa min fawqi',
    translation:
        'O Allah, guard me from my front and from behind me, from my right and from my left, and from above me.',
    translationEs:
        'Oh Allah, protégeme de mi frente y de mi espalda, de mi derecha y de mi izquierda, y de encima de mí.',
    translationUr:
        'اے اللہ! میری حفاظت فرما میرے آگے سے اور میرے پیچھے سے، میرے دائیں اور میرے بائیں سے اور میرے اوپر سے۔',
    source: 'Abu Dawud 5074',
  ),
  CategorizedDua(
    category: 'protection',
    arabic: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ\nفِي الْأَرْضِ وَلَا فِي السَّمَاءِ',
    transliteration:
        'Bismillahil-ladhi la yadurru ma\'a ismihi shay\'un\nfil-ardi wa la fis-sama\'',
    translation:
        'In the name of Allah, with Whose name nothing on earth or in heaven can cause harm.',
    translationEs:
        'En el nombre de Allah, con cuyo nombre nada en la tierra ni en el cielo puede causar daño.',
    translationUr:
        'اللہ کے نام سے، جس کے نام کے ساتھ زمین و آسمان میں کوئی چیز نقصان نہیں پہنچا سکتی۔',
    source: 'Tirmidhi 3388',
  ),
  CategorizedDua(
    category: 'protection',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ\nمِنْ شَرِّ مَا عَمِلْتُ\nوَمِنْ شَرِّ مَا لَمْ أَعْمَلْ',
    transliteration:
        'Allahumma inni a\'udhu bika\nmin sharri ma \'amiltu\nwa min sharri ma lam a\'mal',
    translation:
        'O Allah, I seek refuge in You from the evil of what I have done and the evil of what I have not done.',
    translationEs:
        'Oh Allah, busco refugio en Ti del mal de lo que he hecho y del mal de lo que no he hecho.',
    translationUr:
        'اے اللہ! میں اس کے شر سے تیری پناہ مانگتا ہوں جو میں نے کیا اور اس کے شر سے بھی جو میں نے نہیں کیا۔',
    source: 'Muslim 2716',
  ),
  CategorizedDua(
    category: 'protection',
    arabic: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ\nفِي الدُّنْيَا وَالآخِرَةِ',
    transliteration:
        'Allahumma inni as\'aluka al-\'afwa wal-\'afiyah\nfid-dunya wal-akhirah',
    translation:
        'O Allah, I ask You for pardon and well-being in this world and the next.',
    translationEs:
        'Oh Allah, te pido perdón y bienestar en esta vida y en la otra.',
    translationUr:
        'اے اللہ! میں تجھ سے دنیا اور آخرت میں عفو اور عافیت کا سوال کرتا ہوں۔',
    source: 'Ibn Majah 3871',
  ),
];

const _family = [
  CategorizedDua(
    category: 'family',
    arabic: 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ\nوَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا',
    transliteration:
        'Rabbana hab lana min azwajina wa dhurriyyatina qurrata a\'yun\nwaj\'alna lil-muttaqina imama',
    translation:
        'Our Lord, grant us from among our wives and offspring comfort to our eyes, and make us a leader for the righteous.',
    translationEs:
        'Señor nuestro, concédenos de nuestras esposas y descendencia consuelo para nuestros ojos, y haznos guía para los piadosos.',
    translationUr:
        'اے ہمارے رب! ہمیں ہماری بیویوں اور اولاد کی طرف سے آنکھوں کی ٹھنڈک عطا فرما اور ہمیں پرہیزگاروں کا امام بنا۔',
    source: 'Al-Furqan 25:74',
  ),
  CategorizedDua(
    category: 'family',
    arabic: 'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ\nوَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    transliteration:
        'Rabbi-j\'alni muqimas-salati wa min dhurriyyati\nRabbana wa taqabbal du\'a\'',
    translation:
        'My Lord, make me an establisher of prayer, and my descendants. Our Lord, accept my supplication.',
    translationEs:
        'Señor mío, hazme de los que cumplen la oración, y también a mi descendencia. Señor nuestro, acepta mi súplica.',
    translationUr:
        'اے میرے رب! مجھے نماز قائم کرنے والا بنا اور میری اولاد کو بھی۔ اے ہمارے رب! میری دعا قبول فرما۔',
    source: 'Ibrahim 14:40',
  ),
  CategorizedDua(
    category: 'family',
    arabic: 'رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
    transliteration: 'Rabbi-rhamhuma kama rabbayani saghira',
    translation:
        'My Lord, have mercy upon them as they brought me up when I was small.',
    translationEs:
        'Señor mío, ten misericordia de ellos como ellos me criaron cuando era pequeño.',
    translationUr:
        'اے میرے رب! ان دونوں پر رحم فرما جیسا کہ انہوں نے بچپن میں میری پرورش کی۔',
    source: 'Al-Isra 17:24',
  ),
  CategorizedDua(
    category: 'family',
    arabic: 'رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ\nوَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ',
    transliteration:
        'Rabbana-ghfir li wa liwalidayya\nwa lil-mu\'minina yawma yaqumul-hisab',
    translation:
        'Our Lord, forgive me and my parents and the believers the Day the account is established.',
    translationEs:
        'Señor nuestro, perdóname a mí, a mis padres y a los creyentes el Día en que se establezca la cuenta.',
    translationUr:
        'اے ہمارے رب! مجھے اور میرے والدین کو اور تمام مومنوں کو اس دن بخش دے جس دن حساب قائم ہوگا۔',
    source: 'Ibrahim 14:41',
  ),
];

const _forgiveness = [
  CategorizedDua(
    category: 'forgiveness',
    arabic: 'اللَّهُمَّ اغْفِرْ لِي ذَنْبِي كُلَّهُ\nدِقَّهُ وَجِلَّهُ وَأَوَّلَهُ وَآخِرَهُ',
    transliteration:
        'Allahumma-ghfir li dhanbi kullahu,\ndaqqahu wa jallahu wa awwalahu wa akhirah',
    translation:
        'O Allah, forgive me all my sins, the small and the great, the first and the last.',
    translationEs:
        'Oh Allah, perdona todos mis pecados, los pequeños y los grandes, los primeros y los últimos.',
    translationUr:
        'اے اللہ! میرے تمام گناہ معاف فرما، چھوٹے اور بڑے، پہلے اور آخری۔',
    source: 'Muslim 483',
  ),
  CategorizedDua(
    category: 'forgiveness',
    arabic: 'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ\nالَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ وَأَتُوبُ إِلَيْهِ',
    transliteration:
        'Astaghfirullaha al-\'Azima\nalladhi la ilaha illa Huwal-Hayyul-Qayyumu wa atubu ilaYH',
    translation:
        'I seek forgiveness of Allah, the Magnificent, besides Whom none has the right to be worshipped, the Ever-Living, the Self-Sustaining, and I repent to Him.',
    translationEs:
        'Pido perdón a Allah, el Magnífico, fuera de Quien nadie merece ser adorado, el Viviente, el Sustentador, y a Él me arrepiento.',
    translationUr:
        'میں اللہ عظیم سے بخشش مانگتا ہوں جس کے سوا کوئی معبود نہیں، وہ ہمیشہ زندہ رہنے والا اور سب کو قائم رکھنے والا ہے، اور میں اسی کی طرف توبہ کرتا ہوں۔',
    source: 'Abu Dawud 1517 / Tirmidhi 3577',
  ),
  CategorizedDua(
    category: 'forgiveness',
    arabic: 'رَبَّنَا ظَلَمْنَا أَنْفُسَنَا\nوَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا\nلَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
    transliteration:
        'Rabbana zalamna anfusana\nwa in lam taghfir lana wa tarhamna\nlanakununna minal-khassirin',
    translation:
        'Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers.',
    translationEs:
        'Señor nuestro, nos hemos perjudicado a nosotros mismos, y si no nos perdonas y tienes misericordia de nosotros, ciertamente seremos de los perdedores.',
    translationUr:
        'اے ہمارے رب! ہم نے اپنی جانوں پر ظلم کیا، اور اگر تو نے ہمیں نہ بخشا اور ہم پر رحم نہ کیا تو ہم یقیناً نقصان اٹھانے والوں میں سے ہو جائیں گے۔',
    source: 'Al-A\'raf 7:23',
  ),
  CategorizedDua(
    category: 'forgiveness',
    arabic: 'رَبِّ إِنِّي ظَلَمْتُ نَفْسِي\nفَاغْفِرْ لِي',
    transliteration:
        'Rabbi inni zalamtu nafsi\nfaghfir li',
    translation: 'My Lord, I have indeed wronged myself, so forgive me.',
    translationEs:
        'Señor mío, ciertamente me he perjudicado a mí mismo, así que perdóname.',
    translationUr: 'اے میرے رب! میں نے اپنی جان پر ظلم کیا، پس مجھے بخش دے۔',
    source: 'Al-Qasas 28:16',
  ),
  CategorizedDua(
    category: 'forgiveness',
    arabic: 'اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ\nفَاعْفُ عَنِّي',
    transliteration:
        'Allahumma innaka \'Afuwwun tuhibbul-\'afwa\nfa\'fu \'anni',
    translation:
        'O Allah, You are the Pardoner and You love pardon, so pardon me.',
    translationEs:
        'Oh Allah, Tú eres el Perdonador y amas el perdón, así que perdóname.',
    translationUr:
        'اے اللہ! بے شک تو معاف کرنے والا ہے اور معافی کو پسند کرتا ہے، پس مجھے معاف فرما۔',
    source: 'Tirmidhi 3513 / Ibn Majah 3850 (Laylatul Qadr dua)',
  ),
];

// ─── Category list ────────────────────────────────────────────────────────────

const allDuaCategories = [
  DuaCategory(
    id: 'morning_evening',
    label: 'Morning & Evening',
    emoji: '🌅',
    duas: _morningEvening,
  ),
  DuaCategory(
    id: 'prayer',
    label: 'Prayer',
    emoji: '🕌',
    duas: _prayerRelated,
  ),
  DuaCategory(
    id: 'food',
    label: 'Food & Drink',
    emoji: '🍽',
    duas: _foodDrink,
  ),
  DuaCategory(
    id: 'travel',
    label: 'Travel',
    emoji: '✈️',
    duas: _travel,
  ),
  DuaCategory(
    id: 'home',
    label: 'Home',
    emoji: '🏠',
    duas: _home,
  ),
  DuaCategory(
    id: 'anxiety',
    label: 'Anxiety & Stress',
    emoji: '💆',
    duas: _anxietyStress,
  ),
  DuaCategory(
    id: 'gratitude',
    label: 'Gratitude',
    emoji: '🤲',
    duas: _gratitude,
  ),
  DuaCategory(
    id: 'protection',
    label: 'Protection',
    emoji: '🛡',
    duas: _protection,
  ),
  DuaCategory(
    id: 'family',
    label: 'Family',
    emoji: '👨‍👩‍👧',
    duas: _family,
  ),
  DuaCategory(
    id: 'forgiveness',
    label: 'Forgiveness',
    emoji: '🤍',
    duas: _forgiveness,
  ),
];

List<CategorizedDua> get allDuas => allDuaCategories
    .expand((cat) => cat.duas)
    .toList();
