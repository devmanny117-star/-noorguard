import 'dart:math';

// ── Ayah data (parallel to hero_card.dart slide list, indices 0–14) ───────────

const List<String> ayahArabic = [
  'حَافِظُوا عَلَى الصَّلَوَاتِ وَالصَّلَاةِ الْوُسْطَىٰ وَقُومُوا لِلَّهِ قَانِتِينَ',
  'إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا',
  'وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ وَإِنَّهَا لَكَبِيرَةٌ إِلَّا عَلَى الْخَاشِعِينَ',
  'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
  'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
  'إِنَّ أَوَّلَ بَيْتٍ وُضِعَ لِلنَّاسِ لَلَّذِي بِبَكَّةَ مُبَارَكًا وَهُدًى لِّلْعَالَمِينَ',
  'إِنَّ الصَّلَاةَ تَنْهَىٰ عَنِ الْفَحْشَاءِ وَالْمُنكَرِ وَلَذِكْرُ اللَّهِ أَكْبَرُ',
  'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
  'ادْعُونِي أَسْتَجِبْ لَكُمْ',
  'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ',
  'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا',
  'إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
  'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ',
  'وَأَحْسِنُوا إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ',
  'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ فِيهِ هُدًى لِّلْمُتَّقِينَ',
];

const List<String> ayahTranslit = [
  'Ḥāfizū \'alā ṣ-ṣalawāti waṣ-ṣalāti\'l-wusṭā waqūmū lillāhi qānitīn',
  'Inna ṣ-ṣalāta kānat \'alā l-mu\'minīna kitāban mawqūtā',
  'Wasta\'īnū biṣ-ṣabri waṣ-ṣalāh, wa-innahā lakabīratun illā \'alā l-khāshi\'īn',
  'Fadhkurūnī adhkurkum washkurū lī wa-lā takfurūn',
  'Wa-man yatawakkal \'alā Allāh fa-huwa ḥasbuh',
  'Inna awwala baytin wuḍi\'a lin-nāsi lalldhī bi-Bakkata mubārakan wa-hudan lil-\'ālamīn',
  'Inna ṣ-ṣalāta tanhā \'ani l-faḥshā\'i wal-munkar, wa-ladhikru Allāhi akbar',
  'Alā bi-dhikri Allāhi taṭma\'innu l-qulūb',
  'Ud\'ūnī astajib lakum',
  'La\'in shakartum la-azīdannakum',
  'Lā yukalliful-lāhu nafsan illā wus\'ahā',
  'Innallāha ma\'a ṣ-ṣābirīn',
  'Wa-raḥmatī wasi\'at kulla shay\'',
  'Wa-aḥsinū, innallāha yuḥibb ul-muḥsinīn',
  'Dhālikal-kitābu lā rayba fīh, hudal-lil-muttaqīn',
];

const List<String> ayahRefs = [
  'Al-Baqarah 2:238',
  'An-Nisāʼ 4:103',
  'Al-Baqarah 2:45',
  'Al-Baqarah 2:152',
  'At-Talaq 65:3',
  'Āli ʼImrān 3:96',
  'Al-ʻAnkabūt 29:45',
  'Ar-Raʻd 13:28',
  'Ghāfir 40:60',
  'Ibrāhīm 14:7',
  'Al-Baqarah 2:286',
  'Al-Baqarah 2:153',
  'Al-Aʻrāf 7:156',
  'Al-Baqarah 2:195',
  'Al-Baqarah 2:2',
];

/// Index into the 15-slide deck that corresponds to today's date.
int todayAyahIndex() {
  final now = DateTime.now();
  final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
  return dayOfYear % 15;
}

// ── Hadith model ──────────────────────────────────────────────────────────────

class ShareHadith {
  final String arabic;
  final String transliteration;
  final String source;
  final Map<String, String> translations;

  const ShareHadith({
    required this.arabic,
    required this.transliteration,
    required this.source,
    required this.translations,
  });

  String translationFor(String locale) =>
      translations[locale] ?? translations['en']!;
}

// ── 10 authentic Sunni hadiths ────────────────────────────────────────────────

const List<ShareHadith> shareHadiths = [
  ShareHadith(
    arabic: 'إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى',
    transliteration:
        'Innamā l-a\'mālu bin-niyyāt, wa-innamā li-kulli mri\'in mā nawā',
    source: 'Bukhari 1 · Muslim 1907',
    translations: {
      'en': 'Verily, deeds are judged only by intentions, and every person will have what they intended.',
      'es': 'Ciertamente, las obras solo se juzgan por las intenciones, y cada persona obtendrá lo que se propuso.',
      'fr': 'En vérité, les actes ne valent que par les intentions, et chaque personne n\'aura que ce qu\'elle a eu l\'intention de faire.',
      'ur': 'بیشک اعمال کا دارومدار نیتوں پر ہے اور ہر شخص کو وہی ملے گا جس کی اس نے نیت کی۔',
      'id': 'Sesungguhnya amalan-amalan itu dinilai berdasarkan niat, dan seseorang hanya akan mendapatkan apa yang ia niatkan.',
      'zh': '诚然，行为的价值在于其背后的意图，每个人所得到的，将是他所意图的。',
      'ja': 'まことに、行いはその意図によってのみ判断される。そして、人は自分が意図したものを得るであろう。',
      'bn': 'নিশ্চয়ই কাজের মূল্যায়ন নিয়তের উপর নির্ভর করে এবং প্রতিটি মানুষ তাই পাবে যা সে নিয়ত করে।',
      'tr': 'Şüphesiz ameller, yalnızca niyetlere göredir ve herkes, ne niyet etmişse onu elde eder.',
      'sw': 'Hakika, matendo yatathminiwa kulingana na nia, na kila mtu atapata alichokusudia.',
      'de': 'Wahrlich, die Taten werden nur nach den Absichten beurteilt, und jeder Mensch wird das erhalten, was er beabsichtigte.',
      'nl': 'Voorwaar, daden worden slechts beoordeeld naar hun intenties, en elk persoon zal datgene ontvangen wat hij van plan was.',
      'pt': 'De fato, as ações são julgadas apenas pelas intenções, e cada pessoa terá o que ela pretendeu.',
      'it': 'Invero, le azioni vengono giudicate solo in base alle intenzioni, e ogni persona avrà ciò che ha intenzione di fare.',
      'fa': 'همانا اعمال تنها بر اساس نیت‌ها ارزیابی می‌شوند و هر کس آنچه را نیت کرده به دست خواهد آورد.',
    },
  ),
  ShareHadith(
    arabic: 'مِنْ حُسْنِ إِسْلَامِ الْمَرْءِ تَرْكُهُ مَا لَا يَعْنِيهِ',
    transliteration: 'Min ḥusni Islāmi l-mar\'i tarkuhu mā lā ya\'nīh',
    source: 'Tirmidhi 2317 · Ibn Majah 3976',
    translations: {
      'en': 'Part of the perfection of one\'s Islam is leaving that which does not concern him.',
      'es': 'Parte de la perfección del Islam de una persona es abandonar aquello que no le incumbe.',
      'fr': 'Une partie de la perfection de l\'Islam d\'une personne consiste à délaisser ce qui ne la concerne pas.',
      'ur': 'انسان کے اسلام کی خوبی میں سے یہ ہے کہ وہ لایعنی چیزیں چھوڑ دے۔',
      'id': 'Sebagian dari kesempurnaan Islam seseorang adalah meninggalkan apa yang tidak menjadi urusannya.',
      'zh': '一个人伊斯兰完美的一部分，是放弃与自己无关的事情。',
      'ja': '人のイスラームの完成の一部は、自分に関係のないことを捨てることである。',
      'bn': 'মানুষের ইসলামের পরিপূর্ণতার একটি অংশ হলো যা তার সাথে সম্পর্কিত নয় তা ত্যাগ করা।',
      'tr': 'Kişinin İslam\'ının güzelliğinin bir parçası, kendisini ilgilendirmeyen şeyleri terk etmesidir.',
      'sw': 'Sehemu ya ukamilifu wa Uislamu wa mtu ni kuacha mambo yasiyomhusu.',
      'de': 'Ein Teil der Vollkommenheit des Islams einer Person ist, das zu unterlassen, was ihn nicht betrifft.',
      'nl': 'Een deel van de perfectie van iemands islam is het achterlaten van datgene wat hem niet aangaat.',
      'pt': 'Parte da perfeição do Islã de uma pessoa é abandonar o que não lhe diz respeito.',
      'it': 'Parte della perfezione dell\'Islam di una persona è abbandonare ciò che non la riguarda.',
      'fa': 'بخشی از کمال اسلام انسان این است که آنچه را که به او مربوط نیست رها کند.',
    },
  ),
  ShareHadith(
    arabic:
        'لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ',
    transliteration:
        'Lā yu\'minu aḥadukum ḥattā yuḥibba li-akhīhi mā yuḥibbu li-nafsih',
    source: 'Bukhari 13 · Muslim 45',
    translations: {
      'en': 'None of you truly believes until he loves for his brother what he loves for himself.',
      'es': 'Ninguno de vosotros creerá verdaderamente hasta que ame para su hermano lo que ama para sí mismo.',
      'fr': 'Aucun d\'entre vous ne croira vraiment jusqu\'à ce qu\'il aime pour son frère ce qu\'il aime pour lui-même.',
      'ur': 'تم میں سے کوئی مومن نہیں ہوسکتا جب تک وہ اپنے بھائی کے لیے وہی نہ پسند کرے جو اپنے لیے پسند کرتا ہے۔',
      'id': 'Tidak beriman salah seorang dari kalian hingga ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri.',
      'zh': '你们中没有一个人真正信仰，直到他为他的兄弟喜爱他为自己所喜爱的。',
      'ja': 'あなたたちの誰一人も、自分自身のために好むことを兄弟のためにも好むまでは、真に信仰したことにはならない。',
      'bn': 'তোমাদের কেউ ততক্ষণ পর্যন্ত প্রকৃত মুমিন হবে না, যতক্ষণ না সে তার ভাইয়ের জন্য তা ভালোবাসে যা সে নিজের জন্য ভালোবাসে।',
      'tr': 'Hiçbiriniz, kendisi için sevdiğini kardeşi için de sevmedikçe gerçek anlamda iman etmiş olamaz.',
      'sw': 'Hakuna yeyote miongoni mwenu ambaye anaamini kweli kweli mpaka apende kwa ndugu yake anapopenda kwa nafsi yake.',
      'de': 'Keiner von euch glaubt wirklich, bis er für seinen Bruder liebt, was er für sich selbst liebt.',
      'nl': 'Geen van jullie gelooft werkelijk totdat hij voor zijn broeder liefheeft wat hij voor zichzelf liefheeft.',
      'pt': 'Nenhum de vocês realmente crê até que ame para seu irmão o que ama para si mesmo.',
      'it': 'Nessuno di voi crede veramente finché non ama per il suo fratello ciò che ama per se stesso.',
      'fa': 'هیچ‌یک از شما ایمان واقعی ندارد تا اینکه برای برادرش آنچه را برای خودش دوست دارد دوست بدارد.',
    },
  ),
  ShareHadith(
    arabic:
        'لَيْسَ الشَّدِيدُ بِالصُّرَعَةِ إِنَّمَا الشَّدِيدُ الَّذِي يَمْلِكُ نَفْسَهُ عِنْدَ الْغَضَبِ',
    transliteration:
        'Laysa sh-shadīdu biṣ-ṣur\'ah, innamā sh-shadīdulldhī yamliku nafsahu \'inda l-ghaḍab',
    source: 'Bukhari 6114',
    translations: {
      'en': 'The strong person is not the one who is good at wrestling. The strong person is the one who controls himself in a fit of rage.',
      'es': 'El hombre fuerte no es el que lucha bien. El hombre fuerte es el que se controla a sí mismo cuando está enojado.',
      'fr': 'Le fort n\'est pas celui qui est bon lutteur. Le fort est plutôt celui qui se contrôle lors d\'un accès de colère.',
      'ur': 'پہلوان وہ نہیں جو کشتی میں جیتے، بلکہ پہلوان وہ ہے جو غصے کے وقت اپنے نفس پر قابو رکھے۔',
      'id': 'Orang yang kuat bukanlah orang yang pandai bergulat, melainkan orang yang mampu mengendalikan dirinya ketika marah.',
      'zh': '真正的强者不是摔跤能手，而是在愤怒时能控制自己的人。',
      'ja': '強い人とはレスリングが上手い人ではない。強い人とは怒りの時に自分を抑えられる人である。',
      'bn': 'শক্তিশালী ব্যক্তি সেই নয় যে কুস্তিতে ভালো, বরং শক্তিশালী ব্যক্তি সেই যে রাগের সময় নিজেকে নিয়ন্ত্রণ করতে পারে।',
      'tr': 'Güçlü olan, güreşte iyi olan değildir. Aksine güçlü olan, öfkesi anında kendine hakim olandır.',
      'sw': 'Mwenye nguvu si yule ambaye ni bora katika kupiganana. Bali mwenye nguvu ni yule anayejizuia wakati wa hasira.',
      'de': 'Der Starke ist nicht derjenige, der gut im Ringen ist. Vielmehr ist der Starke derjenige, der sich im Zorn beherrscht.',
      'nl': 'De sterke persoon is niet degene die goed is in worstelen. De sterke persoon is degene die zichzelf beheerst in een moment van woede.',
      'pt': 'O forte não é aquele que é bom em luta. O forte é aquele que controla a si mesmo em um momento de raiva.',
      'it': 'L\'uomo forte non è colui che è bravo nella lotta. L\'uomo forte è colui che controlla se stesso in un momento di rabbia.',
      'fa': 'قوی‌مرد آن نیست که در کشتی مهارت دارد، بلکه قوی‌مرد آن است که در هنگام خشم بر نفس خود مسلط است.',
    },
  ),
  ShareHadith(
    arabic:
        'مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ',
    transliteration:
        'Man kāna yu\'minu billāhi wal-yawmi l-ākhiri falyaqul khayran aw liyaṣmut',
    source: 'Bukhari 6018 · Muslim 47',
    translations: {
      'en': 'Whoever believes in Allah and the Last Day, let him say something good or remain silent.',
      'es': 'Quien crea en Alá y en el Día del Juicio, que diga algo bueno o que guarde silencio.',
      'fr': 'Quiconque croit en Allah et au Jour Dernier, qu\'il dise quelque chose de bien ou qu\'il se taise.',
      'ur': 'جو اللہ اور آخرت کے دن پر ایمان رکھتا ہے وہ اچھی بات کہے یا خاموش رہے۔',
      'id': 'Barangsiapa beriman kepada Allah dan Hari Akhir, hendaklah ia berkata baik atau diam.',
      'zh': '凡信仰安拉和末日的人，应当说好话，否则就保持沉默。',
      'ja': 'アッラーと来世を信じる者は、良いことを言うか、さもなければ黙っているべきである。',
      'bn': 'যে আল্লাহ এবং আখিরাতে বিশ্বাস রাখে, সে যেন ভালো কথা বলে অথবা চুপ থাকে।',
      'tr': 'Allah\'a ve Ahiret gününe iman eden kimse, ya hayırlı söz söylesin ya da sussun.',
      'sw': 'Yeyote anayemwamini Allah na Siku ya Mwisho, na aseme jambo jema au anyamaze.',
      'de': 'Wer an Allah und den Jüngsten Tag glaubt, der sage Gutes oder schweige.',
      'nl': 'Wie in Allah en de Laatste Dag gelooft, laat hem iets goeds zeggen of zwijgen.',
      'pt': 'Quem acredita em Allah e no Dia do Juízo, que diga algo bom ou permaneça em silêncio.',
      'it': 'Chiunque creda in Allah e nel Giorno del Giudizio, dica qualcosa di buono o rimanga in silenzio.',
      'fa': 'هر که به خدا و روز آخرت ایمان دارد، باید سخن خیر بگوید یا خاموش باشد.',
    },
  ),
  ShareHadith(
    arabic: 'يَسِّرُوا وَلَا تُعَسِّرُوا وَبَشِّرُوا وَلَا تُنَفِّرُوا',
    transliteration:
        'Yassirū wa-lā tu\'assirū, wa-bashshirū wa-lā tunaffirū',
    source: 'Bukhari 69',
    translations: {
      'en': 'Make things easy and do not make them difficult; give glad tidings and do not make people flee.',
      'es': 'Facilitad las cosas y no las compliquéis; dad buenas noticias y no ahuyentéis a la gente.',
      'fr': 'Facilitez les choses et ne les compliquez pas ; annoncez la bonne nouvelle et ne faites pas fuir les gens.',
      'ur': 'آسانی پیدا کرو، تنگی نہ کرو، خوشخبری دو، نفرت نہ دلاؤ۔',
      'id': 'Permudahlah dan jangan mempersulit; berilah kabar gembira dan jangan membuat orang lari.',
      'zh': '要使事情变得容易，不要使它们变得困难；给人好消息，不要让人逃离。',
      'ja': '物事を容易にし、困難にするな。吉報を伝え、人々を遠ざけるな。',
      'bn': 'সহজ করো, কঠিন করো না; সুসংবাদ দাও, মানুষকে বিমুখ করো না।',
      'tr': 'Kolaylaştırın, zorlaştırmayın; müjdeleyin, nefret ettirmeyin.',
      'sw': 'Rahisishai na msizidishe ugumu; toeni habari njema na msiwafanye watu wakimbie.',
      'de': 'Macht es leicht und macht es nicht schwer; verkündet frohe Botschaften und treibt die Menschen nicht fort.',
      'nl': 'Maak dingen gemakkelijk en maak ze niet moeilijk; breng goed nieuws en jaag de mensen niet weg.',
      'pt': 'Facilitem as coisas e não as dificultem; anunciem boas notícias e não afastem as pessoas.',
      'it': 'Facilitate le cose e non rendetele difficili; date buone notizie e non fate fuggire le persone.',
      'fa': 'آسان کنید و سخت نکنید؛ بشارت دهید و مردم را فراری ندهید.',
    },
  ),
  ShareHadith(
    arabic:
        'إِنَّ اللَّهَ رَفِيقٌ يُحِبُّ الرِّفْقَ وَيُعْطِي عَلَى الرِّفْقِ مَا لَا يُعْطِي عَلَى الْعُنْفِ',
    transliteration:
        'Innallāha rafīqun yuḥibbu r-rifq, wa-yu\'ṭī \'alā r-rifqi mā lā yu\'ṭī \'alā l-\'unf',
    source: 'Muslim 2593',
    translations: {
      'en': 'Indeed, Allah is gentle and He loves gentleness. He gives for gentleness what He does not give for harshness.',
      'es': 'Ciertamente, Alá es clemente y ama la clemencia. Por ella otorga lo que no otorga por la dureza.',
      'fr': 'Allah est doux et Il aime la douceur. Il accorde pour la douceur ce qu\'Il n\'accorde pas pour la dureté.',
      'ur': 'بیشک اللہ نرم خو ہے اور نرمی کو پسند فرماتا ہے اور نرمی پر وہ کچھ عطا کرتا ہے جو سختی پر نہیں کرتا۔',
      'id': 'Sesungguhnya Allah Maha Lembut dan mencintai kelembutan. Dia memberikan atas kelembutan apa yang tidak Dia berikan atas kekerasan.',
      'zh': '诚然，安拉是温和的，并热爱温和。他因温和所给予的，是严厉所得不到的。',
      'ja': '確かに、アッラーは優しく、優しさを愛される。アッラーは厳しさに対して与えないものを、優しさに対して与えてくださる。',
      'bn': 'নিশ্চয়ই আল্লাহ কোমল এবং তিনি কোমলতাকে ভালোবাসেন। তিনি কোমলতার জন্য যা দেন, কঠোরতার জন্য তা দেন না।',
      'tr': 'Şüphesiz Allah, mülayimdir ve mülayimliği sever. Sertliğe vermediğini mülayimliğe verir.',
      'sw': 'Hakika, Allah ni mpole na anao pendo kwa upole. Anatolea upole ambayo hatolei ugumu.',
      'de': 'Wahrlich, Allah ist sanft und liebt die Sanftheit. Er gewährt durch Sanftheit, was er nicht durch Härte gewährt.',
      'nl': 'Voorwaar, Allah is zachtmoedig en houdt van zachtmoedigheid. Hij geeft voor zachtmoedigheid wat Hij niet geeft voor hardheid.',
      'pt': 'De fato, Allah é gentil e ama a gentileza. Ele concede pela gentileza o que não concede pela dureza.',
      'it': 'In verità, Allah è gentile e ama la gentilezza. Egli dona per la gentilezza ciò che non dona per la durezza.',
      'fa': 'همانا خداوند مهربان است و مهربانی را دوست دارد و برای مهربانی آنچه می‌دهد که برای خشونت نمی‌دهد.',
    },
  ),
  ShareHadith(
    arabic: 'خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ',
    transliteration: 'Khayrukum man ta\'allama l-Qur\'āna wa-\'allamah',
    source: 'Bukhari 5027',
    translations: {
      'en': 'The best of you are those who learn the Quran and teach it to others.',
      'es': 'Los mejores de vosotros son los que aprenden el Corán y lo enseñan.',
      'fr': 'Les meilleurs d\'entre vous sont ceux qui apprennent le Coran et l\'enseignent.',
      'ur': 'تم میں سب سے بہتر وہ ہے جو قرآن سیکھے اور دوسروں کو سکھائے۔',
      'id': 'Sebaik-baik kalian adalah yang mempelajari Al-Qur\'an dan mengajarkannya.',
      'zh': '你们中最好的人是学习《古兰经》并教授它的人。',
      'ja': 'あなたたちの中で最良の者は、クルアーンを学び、それを教える人である。',
      'bn': 'তোমাদের মধ্যে সেই সর্বোত্তম যে কুরআন শিক্ষা করে এবং অন্যকে শিক্ষা দেয়।',
      'tr': 'Sizin en hayırlınız, Kur\'an\'ı öğrenen ve öğretendir.',
      'sw': 'Bora zaidi miongoni mwenu ni yule anayejifunza Qur\'an na kuifundisha.',
      'de': 'Die Besten unter euch sind diejenigen, die den Quran lernen und ihn lehren.',
      'nl': 'De besten van jullie zijn degenen die de Koran leren en het aan anderen leren.',
      'pt': 'Os melhores de vocês são aqueles que aprendem o Alcorão e o ensinam aos outros.',
      'it': 'I migliori tra voi sono coloro che imparano il Corano e lo insegnano agli altri.',
      'fa': 'بهترین شما کسی است که قرآن بیاموزد و آن را به دیگران بیاموزاند.',
    },
  ),
  ShareHadith(
    arabic:
        'اتَّقِ اللَّهَ حَيْثُمَا كُنْتَ وَأَتْبِعِ السَّيِّئَةَ الْحَسَنَةَ تَمْحُهَا وَخَالِقِ النَّاسَ بِخُلُقٍ حَسَنٍ',
    transliteration:
        'Ittaqi Allāha ḥaythumā kunt, wa-atbi\'is-sayyi\'ata l-ḥasanata tamḥahā, wa-khāliqi n-nāsa bi-khuluqin ḥasan',
    source: 'Tirmidhi 1987',
    translations: {
      'en': 'Fear Allah wherever you are; follow a bad deed with a good one to erase it; and deal with people with good character.',
      'es': 'Teme a Alá dondequiera que estés; sigue una mala acción con una buena para borrarla; y trata a las personas con buen carácter.',
      'fr': 'Crains Allah où que tu sois ; fais suivre une mauvaise action d\'une bonne pour l\'effacer ; et traite les gens avec un bon caractère.',
      'ur': 'جہاں بھی ہو اللہ سے ڈرتے رہو، برے کام کے بعد نیک کام کرو وہ اسے مٹا دے گا، اور لوگوں کے ساتھ اچھے اخلاق سے پیش آؤ۔',
      'id': 'Bertakwalah kepada Allah di mana pun kamu berada; iringi perbuatan buruk dengan perbuatan baik untuk menghapusnya; dan berinteraksilah dengan manusia dengan akhlak yang baik.',
      'zh': '无论在哪里，都要敬畏安拉；用善行跟随恶行以消除它；并以良好的品德与人相处。',
      'ja': 'どこにいてもアッラーを恐れ、悪い行いの後に良い行いを続けてそれを消し、善い品性で人々と接しなさい。',
      'bn': 'যেখানেই থাকো আল্লাহকে ভয় করো, খারাপ কাজের পর ভালো কাজ করো তা মুছে ফেলার জন্য, এবং মানুষের সাথে সুন্দর আচরণ করো।',
      'tr': 'Nerede olursan ol Allah\'tan kork; kötü bir eylemden sonra onu silmek için iyilik yap; ve insanlarla güzel bir ahlakla muamele et.',
      'sw': 'Mche Allah popote ulipo; fuata kitendo kibaya na kizuri kukifuta; na shughulikiana na watu kwa tabia nzuri.',
      'de': 'Fürchte Allah, wo immer du bist; folge einer schlechten Tat mit einer guten, um sie zu tilgen; und behandle die Menschen mit gutem Charakter.',
      'nl': 'Vrees Allah waar je ook bent; volg een slechte daad op met een goede om het te wissen; en ga om met mensen met een goed karakter.',
      'pt': 'Tema Allah onde quer que esteja; siga um mau ato com um bom para apagá-lo; e lide com as pessoas com bom caráter.',
      'it': 'Temi Allah ovunque tu sia; segui un atto cattivo con uno buono per cancellarlo; e tratta le persone con buon carattere.',
      'fa': 'در هر جا که هستی از خداوند بترس؛ پس از بدی، نیکی انجام بده تا آن را پاک کند؛ و با مردم با اخلاق نیکو رفتار کن.',
    },
  ),
  ShareHadith(
    arabic:
        'الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ',
    transliteration:
        'Al-Muslimu man salima l-Muslimūna min lisānihi wa-yadih',
    source: 'Bukhari 10 · Muslim 40',
    translations: {
      'en': 'A Muslim is the one from whose tongue and hands the Muslims are safe.',
      'es': 'Un musulmán es aquel del cual los demás musulmanes están a salvo de su lengua y sus manos.',
      'fr': 'Un musulman est celui dont les autres musulmans sont à l\'abri de sa langue et de ses mains.',
      'ur': 'مسلمان وہ ہے جس کی زبان اور ہاتھ سے دوسرے مسلمان محفوظ رہیں۔',
      'id': 'Seorang Muslim adalah seseorang yang Muslim lainnya aman dari lidah dan tangannya.',
      'zh': '穆斯林是那个其他穆斯林能免于其舌头和双手伤害的人。',
      'ja': 'ムスリムとは、他のムスリムがその舌と手から安全でいられる人のことである。',
      'bn': 'মুসলমান সেই ব্যক্তি যার জিহ্বা ও হাত থেকে অন্য মুসলমানরা নিরাপদ।',
      'tr': 'Müslüman, diğer Müslümanların dilinden ve elinden güvende olduğu kişidir.',
      'sw': 'Mwislamu ni yule ambaye Waislamu wengine wana usalama kutoka ulimini wake na mikononi mwake.',
      'de': 'Ein Muslim ist derjenige, vor dessen Zunge und Hand die anderen Muslime sicher sind.',
      'nl': 'Een moslim is degene van wiens tong en handen de andere moslims veilig zijn.',
      'pt': 'Um muçulmano é aquele do qual os outros muçulmanos estão seguros de sua língua e de suas mãos.',
      'it': 'Un musulmano è colui dalla cui lingua e dalle cui mani gli altri musulmani sono al sicuro.',
      'fa': 'مسلمان کسی است که سایر مسلمانان از زبان و دست او در امان باشند.',
    },
  ),
];

/// Returns a random hadith index, optionally excluding [exclude].
int randomHadithIndex({int? exclude}) {
  final rng = Random();
  int i;
  do {
    i = rng.nextInt(shareHadiths.length);
  } while (exclude != null && i == exclude && shareHadiths.length > 1);
  return i;
}
