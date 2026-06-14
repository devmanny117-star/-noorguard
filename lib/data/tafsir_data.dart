import '../models/tafsir_model.dart';

/// Tafsir entries keyed by surah number. Only surahs with authored
/// commentary are present here — screens should fall back to a
/// "coming soon" message for surahs not in this map.
const Map<int, List<TafsirEntry>> tafsirData = {
  1: _alFatiha,
  2: _alBaqara,
  18: _alKahf,
  36: _yaSin,
  55: _arRahman,
  67: _alMulk,
  109: _alKafirun,
  110: _anNasr,
  111: _alMasad,
  112: _alIkhlas,
  113: _alFalaq,
  114: _anNas,
};

const _alFatiha = [
  // Verse 1 — Bismillah
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "The Bismillah is not just an opening phrase — it is a declaration that everything we do is done seeking Allah's blessing and guidance. Ibn Kathir explains that beginning with Allah's name means acknowledging that all power, ability, and blessing comes from Him alone. The name 'Allah' is the greatest of all names, encompassing all divine attributes. 'Ar-Rahman' (the Most Gracious) refers to Allah's mercy that encompasses all creation. 'Ar-Raheem' (the Most Merciful) refers to His special mercy reserved for the believers.",
      'ar':
          "إن البسملة ليست مجرد عبارة افتتاحية، بل هي إعلان بأن كل ما نقوم به إنما نقوم به طلباً لبركة الله وهدايته. يوضح ابن كثير أن البدء باسم الله يعني الإقرار بأن كل قوة وقدرة وبركة إنما تأتي منه وحده. واسم 'الله' هو أعظم الأسماء جميعاً، فهو يشمل جميع الصفات الإلهية. و'الرحمن' تشير إلى رحمة الله التي تسع جميع الخلق. أما 'الرحيم' فتشير إلى رحمته الخاصة التي خصّ بها المؤمنين.",
      'ur':
          "بسم اللہ محض ایک ابتدائی جملہ نہیں ہے بلکہ یہ ایک اعلان ہے کہ ہم جو کچھ بھی کرتے ہیں وہ اللہ کی برکت اور رہنمائی حاصل کرنے کے لیے کرتے ہیں۔ ابن کثیر بیان کرتے ہیں کہ اللہ کے نام سے آغاز کرنے کا مطلب یہ تسلیم کرنا ہے کہ ہر قوت، قابلیت اور برکت صرف اسی کی طرف سے آتی ہے۔ نام 'اللہ' تمام ناموں میں سب سے عظیم ہے، جو تمام الٰہی صفات کو سمیٹے ہوئے ہے۔ 'الرحمن' (نہایت مہربان) اللہ کی اس رحمت کی طرف اشارہ کرتا ہے جو تمام مخلوقات کو گھیرے ہوئے ہے۔ 'الرحیم' (نہایت رحم کرنے والا) اس کی خاص رحمت کی طرف اشارہ کرتا ہے جو مومنوں کے لیے مخصوص ہے۔",
      'es':
          "El Bismillah no es solo una frase de apertura — es una declaración de que todo lo que hacemos lo hacemos buscando la bendición y la guía de Allah. Ibn Kathir explica que comenzar con el nombre de Allah significa reconocer que todo poder, capacidad y bendición proviene únicamente de Él. El nombre 'Allah' es el más grande de todos los nombres, y abarca todos los atributos divinos. 'Ar-Rahman' (el Clementísimo) se refiere a la misericordia de Allah que abarca a toda la creación. 'Ar-Raheem' (el Misericordiosísimo) se refiere a Su misericordia especial reservada para los creyentes.",
    },
  ),

  // Verse 2 — Alhamdulillah
  TafsirEntry(
    verses: [2],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "All praise belongs to Allah alone — not to any created being. Ibn Kathir explains that 'Al-Hamd' means perfect praise that encompasses gratitude, love, and glorification. We praise Allah for His beautiful names and attributes, for His blessings upon us, and for His mercy. The word 'Rabb' (Lord) means the One who created, sustains, and nurtures all of existence. 'Al-Alameen' means all the worlds — humans, jinn, angels, animals, and everything that exists.",
      'ar':
          "الحمد كله لله وحده، لا يستحقه أحد من المخلوقات. يوضح ابن كثير أن 'الحمد' هو الثناء الكامل الذي يشمل الشكر والمحبة والتعظيم. نحمد الله على أسمائه وصفاته الحسنى، وعلى نعمه علينا، وعلى رحمته. وكلمة 'رب' تعني الذي خلق كل شيء وأمدّه بأسباب بقائه ونمّاه ورعاه. أما 'العالمين' فتعني جميع الخلق - الإنس والجن والملائكة والحيوانات وكل ما هو موجود.",
      'ur':
          "تمام تعریفیں صرف اللہ ہی کے لیے ہیں، کسی مخلوق کے لیے نہیں۔ ابن کثیر بیان کرتے ہیں کہ 'الحمد' کا مطلب ہے کامل تعریف جس میں شکر، محبت اور تعظیم سب شامل ہیں۔ ہم اللہ کی تعریف اس کے خوبصورت ناموں اور صفات کی وجہ سے، اس کی نعمتوں کی وجہ سے، اور اس کی رحمت کی وجہ سے کرتے ہیں۔ لفظ 'رب' کا مطلب ہے وہ ذات جس نے پیدا کیا، قائم رکھا، اور ساری کائنات کی پرورش کی۔ 'العالمین' کا مطلب ہے تمام جہان - انسان، جن، فرشتے، جانور اور ہر وہ چیز جو موجود ہے۔",
      'es':
          "Toda alabanza pertenece únicamente a Allah — no a ningún ser creado. Ibn Kathir explica que 'Al-Hamd' significa una alabanza perfecta que abarca gratitud, amor y glorificación. Alabamos a Allah por Sus hermosos nombres y atributos, por Sus bendiciones sobre nosotros, y por Su misericordia. La palabra 'Rabb' (Señor) significa Aquel que creó, sostiene y cuida toda la existencia. 'Al-Alameen' significa todos los mundos — los humanos, los yinn, los ángeles, los animales y todo lo que existe.",
    },
  ),

  // Verse 3 — Ar-Rahman Ar-Raheem
  TafsirEntry(
    verses: [3],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "Allah repeats His attributes of mercy after the praise to emphasize that His lordship over all creation is built on mercy and compassion — not only power and authority. As-Sadi explains that mentioning mercy twice emphasizes that the foundation of Allah's relationship with His creation is mercy. Ar-Rahman is broader — encompassing all creation. Ar-Raheem is specific — the deep, lasting mercy for the believers.",
      'ar':
          "يكرر الله صفات رحمته بعد الحمد للتأكيد على أن ربوبيته لجميع الخلق مبنية على الرحمة والرأفة، لا على القوة والسلطان فقط. يوضح السعدي أن ذكر الرحمة مرتين يؤكد أن أساس علاقة الله بخلقه هو الرحمة. فـ'الرحمن' أوسع - تشمل جميع الخلق. أما 'الرحيم' فهي أخص - وهي الرحمة العميقة الدائمة للمؤمنين.",
      'ur':
          "اللہ تعریف کے بعد اپنی رحمت کی صفات کو دہراتا ہے تاکہ یہ واضح ہو کہ تمام مخلوقات پر اس کی ربوبیت رحمت اور شفقت پر مبنی ہے، نہ کہ صرف طاقت اور اقتدار پر۔ السعدی بیان کرتے ہیں کہ رحمت کا دو بار ذکر اس بات پر زور دیتا ہے کہ اللہ کے اپنی مخلوق کے ساتھ تعلق کی بنیاد رحمت ہے۔ 'الرحمن' وسیع تر ہے - جو تمام مخلوقات کو شامل ہے۔ 'الرحیم' خاص ہے - وہ گہری اور دائمی رحمت جو مومنوں کے لیے ہے۔",
      'es':
          "Allah repite Sus atributos de misericordia después de la alabanza para enfatizar que Su señorío sobre toda la creación está fundado en la misericordia y la compasión — no solo en el poder y la autoridad. As-Sadi explica que mencionar la misericordia dos veces enfatiza que la base de la relación de Allah con Su creación es la misericordia. Ar-Rahman es más amplio — abarca a toda la creación. Ar-Raheem es específico — la misericordia profunda y duradera para los creyentes.",
    },
  ),

  // Verse 4 — Maliki Yawm id-Deen
  TafsirEntry(
    verses: [4],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Allah is the Master and Owner of the Day of Judgment. Ibn Kathir explains that while Allah owns everything in this world and the next, on the Day of Judgment His ownership and authority will be manifest to all. No king, no wealth, no influence will matter. Only deeds done for Allah's sake will count. This verse instills both hope — that the Most Merciful is the Judge — and accountability — that every deed will be weighed.",
      'ar':
          "الله هو مالك يوم الدين وصاحب السلطان فيه. يوضح ابن كثير أنه على الرغم من أن الله يملك كل شيء في الدنيا والآخرة، إلا أنه في يوم الدين سيظهر ملكه وسلطانه للجميع. فلن ينفع حينئذ ملك ولا مال ولا جاه، ولن يُعتدّ إلا بالأعمال التي أُريد بها وجه الله. وهذه الآية تغرس في القلب الأمل - بأن الحَكَم هو أرحم الراحمين - والمسؤولية - بأن كل عمل سيُوزن.",
      'ur':
          "اللہ ہی روزِ قیامت کا مالک اور حاکم ہے۔ ابن کثیر بیان کرتے ہیں کہ اگرچہ اللہ دنیا اور آخرت میں ہر چیز کا مالک ہے، لیکن قیامت کے دن اس کی مالکیت اور اقتدار سب پر ظاہر ہو جائے گا۔ اس دن نہ کوئی بادشاہت کام آئے گی، نہ مال، نہ اثر و رسوخ۔ صرف وہی اعمال شمار ہوں گے جو اللہ کی رضا کے لیے کیے گئے ہوں۔ یہ آیت دل میں امید بھی پیدا کرتی ہے - کہ سب سے زیادہ رحم کرنے والا ہی منصف ہے - اور جوابدہی کا احساس بھی - کہ ہر عمل کو تولا جائے گا۔",
      'es':
          "Allah es el Soberano y Dueño del Día del Juicio. Ibn Kathir explica que, aunque Allah posee todo en este mundo y en el próximo, en el Día del Juicio Su soberanía y autoridad se manifestarán ante todos. Ningún rey, ninguna riqueza, ninguna influencia importará. Solo contarán las obras hechas por causa de Allah. Este versículo infunde tanto esperanza — que el Más Misericordioso es el Juez — como responsabilidad — que cada obra será pesada.",
    },
  ),

  // Verse 5 — Iyyaka Na'budu
  TafsirEntry(
    verses: [5],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "This is the central declaration of the entire surah and of Islamic theology. 'You alone we worship' establishes tawheed — the absolute oneness of Allah. Ibn Kathir says the shift from third person (verses 1-4) to second person ('You') represents the believer turning directly to face Allah in intimate conversation. 'You alone we seek for help' acknowledges complete dependence on Allah. This verse is the dividing point — the first half of Al-Fatiha is praise of Allah, the second half is the believer's supplication.",
      'ar':
          "هذه هي الإعلان المحوري في السورة كلها وفي العقيدة الإسلامية. فقوله 'إياك نعبد' يؤسس للتوحيد - أي وحدانية الله المطلقة. يقول ابن كثير إن الانتقال من صيغة الغائب (في الآيات 1-4) إلى صيغة المخاطب ('إياك') يمثل توجه المؤمن مباشرة إلى الله في مناجاة حميمة. وقوله 'وإياك نستعين' يقر بالاعتماد الكامل على الله. وهذه الآية هي نقطة الفصل - فالنصف الأول من الفاتحة ثناء على الله، والنصف الثاني دعاء العبد.",
      'ur':
          "یہ پوری سورت اور اسلامی عقیدے کا مرکزی اعلان ہے۔ 'ہم صرف تیری ہی عبادت کرتے ہیں' توحید کی بنیاد رکھتا ہے - یعنی اللہ کی مطلق وحدانیت۔ ابن کثیر کہتے ہیں کہ آیات 1 سے 4 میں غائب کے صیغے سے 'تو' (مخاطب) کی طرف منتقل ہونا اس بات کی علامت ہے کہ مومن براہِ راست اللہ کی طرف متوجہ ہو کر قریبی گفتگو کر رہا ہے۔ 'اور ہم صرف تجھ ہی سے مدد مانگتے ہیں' اللہ پر مکمل انحصار کا اقرار ہے۔ یہ آیت ایک تقسیم کا نقطہ ہے - سورہ فاتحہ کا پہلا نصف اللہ کی تعریف ہے، اور دوسرا نصف مومن کی دعا ہے۔",
      'es':
          "Esta es la declaración central de toda la surah y de la teología islámica. 'A Ti solo adoramos' establece el tawhid — la unicidad absoluta de Allah. Ibn Kathir dice que el cambio de la tercera persona (versículos 1-4) a la segunda persona ('Ti') representa al creyente volviéndose directamente hacia Allah en una conversación íntima. 'Y a Ti solo pedimos ayuda' reconoce la dependencia total en Allah. Este versículo es el punto divisorio — la primera mitad de Al-Fatiha es alabanza a Allah, la segunda mitad es la súplica del creyente.",
    },
  ),

  // Verses 6-7 — Ihdinas Siraat
  TafsirEntry(
    verses: [6, 7],
    scholarKeys: ['ibnKathir', 'tirmidhi'],
    tafsir: {
      'en':
          "The greatest dua a Muslim can make — asking Allah for guidance to the straight path. Ibn Kathir explains that the straight path is Islam in its complete form — the path of the Prophets, the truthful, the martyrs, and the righteous. 'Those you have blessed' refers to the prophets, companions, and scholars. 'Not those who have earned anger' refers to those who knew the truth but rejected it. 'Nor those who are astray' refers to those who worshipped Allah without knowledge or correct guidance. The Prophet ‏ﷺ confirmed this interpretation. (Tirmidhi)",
      'ar':
          "هذه أعظم دعاء يمكن أن يدعو به المسلم - أن يطلب من الله الهداية إلى الصراط المستقيم. يوضح ابن كثير أن الصراط المستقيم هو الإسلام بكامل معناه - طريق الأنبياء والصديقين والشهداء والصالحين. و'الذين أنعمت عليهم' يشير إلى الأنبياء والصحابة والعلماء. أما 'المغضوب عليهم' فيشير إلى الذين عرفوا الحق ثم رفضوه. و'الضالين' يشير إلى الذين عبدوا الله بغير علم أو هداية صحيحة. وقد أكد النبي ﷺ هذا التفسير. (الترمذي)",
      'ur':
          "یہ سب سے عظیم دعا ہے جو ایک مسلمان مانگ سکتا ہے - اللہ سے سیدھے راستے کی ہدایت طلب کرنا۔ ابن کثیر بیان کرتے ہیں کہ سیدھا راستہ اسلام ہے اپنی مکمل شکل میں - یہ انبیاء، صدیقین، شہداء اور صالحین کا راستہ ہے۔ 'جن پر تو نے انعام کیا' سے مراد انبیاء، صحابہ اور علماء ہیں۔ 'جن پر غضب کیا گیا' سے مراد وہ لوگ ہیں جنہوں نے حق جان کر اسے رد کر دیا۔ 'اور نہ گمراہوں کا' سے مراد وہ لوگ ہیں جنہوں نے علم یا صحیح ہدایت کے بغیر اللہ کی عبادت کی۔ نبی کریم ﷺ نے اس تفسیر کی تصدیق فرمائی۔ (ترمذی)",
      'es':
          "Esta es la súplica más grande que un musulmán puede hacer — pedirle a Allah la guía hacia el camino recto. Ibn Kathir explica que el camino recto es el Islam en su forma completa — el camino de los Profetas, los veraces, los mártires y los justos. 'Aquellos a quienes has agraciado' se refiere a los profetas, los compañeros y los sabios. 'No los que han incurrido en Tu ira' se refiere a quienes conocieron la verdad y la rechazaron. 'Ni los extraviados' se refiere a quienes adoraron a Allah sin conocimiento ni guía correcta. El Profeta ‏ﷺ confirmó esta interpretación. (Tirmidhi)",
    },
  ),
];

const _alBaqara = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['sahihMuslim'],
    tafsir: {
      'en':
          "Al-Baqara is the longest surah in the Quran, with 286 verses. The Prophet ﷺ said: 'Recite Al-Baqara, for taking it brings blessing and leaving it brings regret, and the sorcerers cannot face it.' (Muslim). It contains Ayat al-Kursi (verse 255) — the greatest verse in the Quran — as well as the last two verses, which serve as a comprehensive protection. The surah covers Islamic law, the story of Adam, Bani Israel, and the direction of prayer.",
      'ar':
          "البقرة هي أطول سورة في القرآن الكريم، وتحتوي على 286 آية. قال النبي ﷺ: 'اقرؤوا سورة البقرة، فإن أخذها بركة، وتركها حسرة، ولا يستطيعها البطلة.' (مسلم). وتحتوي على آية الكرسي (الآية 255) - وهي أعظم آية في القرآن - بالإضافة إلى آخر آيتين منها اللتين تُعدّان حماية شاملة. وتتناول السورة الشريعة الإسلامية، وقصة آدم، وبني إسرائيل، واتجاه القبلة.",
      'ur':
          "البقرہ قرآن کی سب سے طویل سورت ہے جس میں 286 آیات ہیں۔ نبی کریم ﷺ نے فرمایا: 'سورہ بقرہ پڑھا کرو، کیونکہ اسے اپنانا برکت ہے اور اسے چھوڑنا حسرت ہے، اور جادوگر اس کا مقابلہ نہیں کر سکتے۔' (مسلم)۔ اس میں آیت الکرسی (آیت 255) موجود ہے - جو قرآن کی سب سے عظیم آیت ہے - اور اس کی آخری دو آیات بھی جو مکمل حفاظت کا ذریعہ ہیں۔ یہ سورت اسلامی شریعت، آدم علیہ السلام کے قصے، بنی اسرائیل، اور قبلے کی سمت جیسے موضوعات پر مشتمل ہے۔",
      'es':
          "Al-Baqara es la surah más larga del Corán, con 286 versículos. El Profeta ﷺ dijo: 'Reciten Al-Baqara, pues tomarla es una bendición y dejarla es un motivo de pesar, y los hechiceros no pueden enfrentarla.' (Muslim). Contiene Ayat al-Kursi (versículo 255) — el versículo más grande del Corán — así como los dos últimos versículos, que sirven como una protección integral. La surah trata la ley islámica, la historia de Adán, los Hijos de Israel, y la dirección de la oración.",
    },
  ),
];

const _alKahf = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['alHakim', 'sahihMuslim'],
    tafsir: {
      'en':
          "Al-Kahf was revealed in Mecca. The Prophet ﷺ said: 'Whoever reads Surah Al-Kahf on Friday, a light will shine for him between the two Fridays.' (Al-Hakim). It contains four main stories: The People of the Cave, The Two Men and Their Gardens, Musa and Al-Khidr, and Dhul-Qarnayn. Each story teaches protection from a different trial: the trial of faith, wealth, knowledge, and power. The first and last 10 verses protect from the Dajjal (Antichrist).",
      'ar':
          "نزلت سورة الكهف بمكة. قال النبي ﷺ: 'من قرأ سورة الكهف يوم الجمعة أضاء له من النور ما بين الجمعتين.' (الحاكم). وتحتوي السورة على أربع قصص رئيسية: أصحاب الكهف، وصاحبا الجنتين، وموسى مع الخضر، وذو القرنين. وكل قصة تُعلّم الحماية من فتنة مختلفة: فتنة الدين، والمال، والعلم، والسلطان. وتحفظ الآيات العشر الأولى والأخيرة من فتنة الدجال.",
      'ur':
          "سورہ کہف مکہ میں نازل ہوئی۔ نبی کریم ﷺ نے فرمایا: 'جو شخص جمعہ کے دن سورہ کہف پڑھے، اس کے لیے دونوں جمعوں کے درمیان نور روشن ہو جائے گا۔' (الحاکم)۔ اس سورت میں چار اہم قصے بیان ہوئے ہیں: اصحابِ کہف، دو باغوں والے، موسیٰ علیہ السلام اور خضر علیہ السلام، اور ذوالقرنین۔ ہر قصہ ایک مختلف آزمائش سے حفاظت سکھاتا ہے: ایمان کی آزمائش، مال کی آزمائش، علم کی آزمائش، اور اقتدار کی آزمائش۔ سورت کی پہلی اور آخری دس آیات دجال کے فتنے سے حفاظت کرتی ہیں۔",
      'es':
          "Al-Kahf fue revelada en La Meca. El Profeta ﷺ dijo: 'Quien recite la Surah Al-Kahf el viernes, una luz brillará para él entre los dos viernes.' (Al-Hakim). Contiene cuatro historias principales: la Gente de la Cueva, los Dos Hombres y sus Jardines, Musa y Al-Khidr, y Dhul-Qarnayn. Cada historia enseña protección contra una prueba diferente: la prueba de la fe, la riqueza, el conocimiento y el poder. Los primeros y los últimos diez versículos protegen del Dajjal (Anticristo).",
    },
  ),

  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "All praise is due to Allah who revealed the Book to His servant. Ibn Kathir explains that opening with praise establishes that the Quran is a perfect, complete guidance from Allah — not authored by any human. 'His servant' refers to Prophet Muhammad ﷺ, emphasizing his humanity while honoring his prophethood. The Quran was sent as a straight, unerring guidance with no crookedness.",
      'ar':
          "الحمد لله الذي أنزل على عبده الكتاب. يوضح ابن كثير أن افتتاح السورة بالحمد يقرر أن القرآن هداية كاملة لا اعوجاج فيها من عند الله - وليس من تأليف بشر. و'عبده' تشير إلى النبي محمد ﷺ، فتؤكد بشريته وتُكرّم نبوته في آن واحد. وقد أُنزل القرآن هداية مستقيمة لا عوج فيها.",
      'ur':
          "تمام تعریفیں اللہ کے لیے ہیں جس نے اپنے بندے پر یہ کتاب نازل فرمائی۔ ابن کثیر بیان کرتے ہیں کہ سورت کا آغاز تعریف سے ہونا یہ ثابت کرتا ہے کہ قرآن اللہ کی طرف سے ایک کامل اور مکمل ہدایت ہے - نہ کہ کسی انسان کی تصنیف۔ 'اپنے بندے' سے مراد نبی کریم محمد ﷺ ہیں، جس میں آپ کی بشریت کا اظہار اور آپ کی نبوت کا اعزاز دونوں شامل ہیں۔ قرآن ایک سیدھی اور بے کجی ہدایت بنا کر بھیجا گیا۔",
      'es':
          "Toda alabanza pertenece a Allah, quien reveló el Libro a Su siervo. Ibn Kathir explica que comenzar con alabanza establece que el Corán es una guía perfecta y completa de Allah — no escrita por ningún ser humano. 'Su siervo' se refiere al Profeta Muhammad ﷺ, enfatizando su humanidad y a la vez honrando su profecía. El Corán fue enviado como una guía recta y sin desviación, libre de toda tortuosidad.",
    },
  ),

  // Verse 2
  TafsirEntry(
    verses: [2],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "Straight, to warn of severe punishment and give good tidings to the believers. As-Sadi explains the Quran serves two purposes simultaneously — it warns those who reject faith of severe consequences, and it gives glad tidings to the believers of great reward. This dual role makes the Quran both a warning and a mercy.",
      'ar':
          "قيّماً لينذر بأساً شديداً من لدنه ويبشر المؤمنين. يوضح السعدي أن القرآن يؤدي وظيفتين في آن واحد - فهو ينذر من كفر بعقاب شديد، ويبشر المؤمنين بالأجر العظيم. وهذا الدور المزدوج يجعل القرآن إنذاراً ورحمة معاً.",
      'ur':
          "سیدھی بات کرنے والی، تاکہ سخت عذاب سے ڈرائے اور مومنوں کو خوشخبری دے۔ السعدی بیان کرتے ہیں کہ قرآن بیک وقت دو مقاصد پورے کرتا ہے - یہ کفر کرنے والوں کو سخت انجام سے ڈراتا ہے، اور مومنوں کو عظیم اجر کی خوشخبری دیتا ہے۔ یہ دوہرا کردار قرآن کو ایک ہی وقت میں انذار اور رحمت بناتا ہے۔",
      'es':
          "Recta, para advertir de un castigo severo y dar buenas nuevas a los creyentes. As-Sadi explica que el Corán cumple dos funciones simultáneamente — advierte a quienes rechazan la fe de consecuencias severas, y da buenas nuevas a los creyentes de una gran recompensa. Este doble papel hace que el Corán sea tanto una advertencia como una misericordia.",
    },
  ),

  // Verse 10 — The People of the Cave
  TafsirEntry(
    verses: [10],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "When the youths took refuge in the cave and said: Our Lord, grant us mercy from Yourself. Ibn Kathir describes the People of the Cave as young men who believed in Allah in a time of disbelief and persecution. They fled to a cave to protect their faith. Allah honored their sincere supplication by putting them to sleep for 309 years as a miracle and a sign for future generations. Their story teaches that sincere faith and dua can move mountains.",
      'ar':
          "إذ أوى الفتية إلى الكهف فقالوا ربنا آتنا من لدنك رحمة. يصف ابن كثير أصحاب الكهف بأنهم فتية آمنوا بالله في زمن الكفر والاضطهاد. ففروا إلى كهف ليحفظوا دينهم. وقد أكرمهم الله على دعائهم الصادق فأنامهم 309 سنين، آية ومعجزة للأجيال القادمة. وقصتهم تُعلّم أن الإيمان الصادق والدعاء يمكن أن يُحرّكا الجبال.",
      'ur':
          "جب چند نوجوانوں نے غار میں پناہ لی اور کہا: اے ہمارے رب، ہمیں اپنی طرف سے رحمت عطا فرما۔ ابن کثیر بیان کرتے ہیں کہ اصحابِ کہف وہ نوجوان تھے جو کفر اور ظلم کے دور میں اللہ پر ایمان لائے۔ وہ اپنے دین کی حفاظت کے لیے ایک غار میں جا چھپے۔ اللہ نے ان کی مخلصانہ دعا کا اکرام کرتے ہوئے انہیں 309 سال تک سلا دیا، جو آنے والی نسلوں کے لیے ایک معجزہ اور نشانی بن گیا۔ ان کا قصہ سکھاتا ہے کہ سچا ایمان اور دعا پہاڑوں کو بھی ہلا سکتے ہیں۔",
      'es':
          "Cuando los jóvenes se refugiaron en la cueva y dijeron: Señor nuestro, concédenos misericordia de Tu parte. Ibn Kathir describe a la Gente de la Cueva como jóvenes que creyeron en Allah en una época de incredulidad y persecución. Huyeron a una cueva para proteger su fe. Allah honró su súplica sincera haciéndolos dormir durante 309 años como un milagro y una señal para las generaciones futuras. Su historia enseña que la fe sincera y la súplica pueden mover montañas.",
    },
  ),
];

const _yaSin = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['tirmidhi'],
    tafsir: {
      'en':
          "Ya-Sin is known as the heart of the Quran. The Prophet ﷺ said: 'Everything has a heart, and the heart of the Quran is Ya-Sin. Whoever reads Ya-Sin, Allah will record for him the reward of reading the Quran ten times.' (Tirmidhi). It was revealed in Mecca and focuses on the proofs of Allah's existence, the Day of Resurrection, and the stories of previous nations. It is commonly recited for the dying and at funerals in the Sunni tradition.",
      'ar':
          "يس تُعرف بأنها قلب القرآن. قال النبي ﷺ: 'إن لكل شيء قلباً، وقلب القرآن يس، ومن قرأ يس كتب الله له بقراءتها قراءة القرآن عشر مرات.' (الترمذي). نزلت هذه السورة في مكة، وتركز على أدلة وجود الله، ويوم القيامة، وقصص الأمم السابقة. وهي تُتلى عادة عند المحتضرين وفي الجنائز في التقاليد السنية.",
      'ur':
          "یٰسٓ کو قرآن کا دل کہا جاتا ہے۔ نبی کریم ﷺ نے فرمایا: 'ہر چیز کا ایک دل ہوتا ہے، اور قرآن کا دل یٰسٓ ہے۔ جو یٰسٓ پڑھے، اللہ اس کے لیے قرآن کو دس بار پڑھنے کا ثواب لکھ دے گا۔' (ترمذی)۔ یہ سورت مکہ میں نازل ہوئی اور اللہ کے وجود کے دلائل، روزِ قیامت، اور پچھلی قوموں کے قصوں پر مرکوز ہے۔ اہلِ سنت کی روایت میں یہ عام طور پر مرنے والوں کے پاس اور جنازوں میں پڑھی جاتی ہے۔",
      'es':
          "Ya-Sin es conocida como el corazón del Corán. El Profeta ﷺ dijo: 'Todo tiene un corazón, y el corazón del Corán es Ya-Sin. Quien recite Ya-Sin, Allah le registrará la recompensa de leer el Corán diez veces.' (Tirmidhi). Fue revelada en La Meca y se centra en las pruebas de la existencia de Allah, el Día de la Resurrección, y las historias de naciones anteriores. En la tradición suní se recita comúnmente para los moribundos y en los funerales.",
    },
  ),
];

const _arRahman = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir', 'tirmidhi'],
    tafsir: {
      'en':
          "Ar-Rahman is one of the most beautiful surahs in the Quran, known for its rhythmic refrain 'Fabi-ayyi alaa-i Rabbikuma tukaththibaan' — 'So which of the favors of your Lord would you deny?' repeated 31 times. Ibn Kathir says this surah was recited by the Prophet ﷺ to the jinn who were moved to tears. It catalogues Allah's countless blessings upon mankind and jinn, and describes the two paradises prepared for the believers.",
      'ar':
          "الرحمن من أجمل سور القرآن، وتشتهر بتكرار اللازمة الإيقاعية 'فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ' - والتي تكررت 31 مرة. يقول ابن كثير إن النبي ﷺ تلا هذه السورة على الجن فتأثروا حتى بكوا. وتُعدد السورة نعم الله التي لا تُحصى على الإنس والجن، وتصف الجنتين المُعدّتين للمؤمنين.",
      'ur':
          "الرحمن قرآن کی خوبصورت ترین سورتوں میں سے ایک ہے، جو اپنے بار بار دہرائے جانے والے فقرے 'فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ' - یعنی 'تو تم اپنے رب کی کن کن نعمتوں کو جھٹلاؤ گے؟' - کے لیے مشہور ہے، جو 31 بار دہرایا گیا ہے۔ ابن کثیر فرماتے ہیں کہ نبی کریم ﷺ نے یہ سورت جنوں کو سنائی تو وہ رو پڑے۔ یہ سورت انسانوں اور جنوں پر اللہ کی بے شمار نعمتوں کا ذکر کرتی ہے، اور مومنوں کے لیے تیار کی گئی دو جنتوں کو بیان کرتی ہے۔",
      'es':
          "Ar-Rahman es una de las surahs más hermosas del Corán, conocida por su estribillo rítmico 'Fabi-ayyi alaa-i Rabbikuma tukaththibaan' — '¿Cuál, pues, de los favores de su Señor negarán?' — repetido 31 veces. Ibn Kathir dice que esta surah fue recitada por el Profeta ﷺ a los yinn, quienes se conmovieron hasta las lágrimas. Enumera las incontables bendiciones de Allah sobre la humanidad y los yinn, y describe los dos paraísos preparados para los creyentes.",
    },
  ),

  // Verses 1-2
  TafsirEntry(
    verses: [1, 2],
    scholarKeys: ['ibnKathir', 'asSadi'],
    tafsir: {
      'en':
          "The Most Gracious — He taught the Quran. Ibn Kathir explains that Allah begins this surah by mentioning His greatest blessing: teaching the Quran to mankind. Before mentioning the creation of humans, Allah mentions the Quran — showing that divine guidance is the greatest gift. As-Sadi adds that 'teaching' here includes making it easy to recite, memorize, understand, and act upon.",
      'ar':
          "الرحمن، علّم القرآن. يوضح ابن كثير أن الله يبدأ هذه السورة بذكر أعظم نعمة: تعليم القرآن للإنسان. فقبل ذكر خلق الإنسان، ذكر الله القرآن - إشارةً إلى أن الهداية الإلهية هي أعظم هبة. ويضيف السعدي أن 'التعليم' هنا يشمل تيسير القرآن للتلاوة والحفظ والفهم والعمل به.",
      'ur':
          "رحمن نے قرآن سکھایا۔ ابن کثیر بیان کرتے ہیں کہ اللہ نے اس سورت کا آغاز اپنی سب سے بڑی نعمت کے ذکر سے کیا: انسان کو قرآن سکھانا۔ انسان کی تخلیق کا ذکر کرنے سے پہلے اللہ نے قرآن کا ذکر کیا - جو اس بات کی دلیل ہے کہ الٰہی ہدایت سب سے بڑی نعمت ہے۔ السعدی مزید بیان کرتے ہیں کہ 'سکھانے' میں قرآن کی تلاوت، حفظ، سمجھ اور اس پر عمل کو آسان بنانا بھی شامل ہے۔",
      'es':
          "El Clementísimo enseñó el Corán. Ibn Kathir explica que Allah comienza esta surah mencionando Su mayor bendición: enseñar el Corán a la humanidad. Antes de mencionar la creación del ser humano, Allah menciona el Corán — mostrando que la guía divina es el mayor regalo. As-Sadi añade que 'enseñar' aquí incluye hacer que sea fácil de recitar, memorizar, comprender y poner en práctica.",
    },
  ),

  // Verse 13 — repeated refrain
  TafsirEntry(
    verses: [13],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "So which of the favors of your Lord would you deny? This rhetorical question, repeated 31 times in the surah, addresses both jinn and mankind. Ibn Kathir explains it is a challenge — after listing each blessing of Allah, He asks: which of these can you deny? The answer is: none. It is a reminder that all goodness in existence comes from Allah's mercy and generosity. When the companions heard this verse, they responded: 'Nothing of Your blessings do we deny, our Lord, and to You belongs all praise.'",
      'ar':
          "فبأي آلاء ربكما تكذبان؟ هذا السؤال البلاغي، المتكرر 31 مرة في السورة، يخاطب الجن والإنس معاً. يوضح ابن كثير أنه تحدٍ - فبعد ذكر كل نعمة من نعم الله، يسأل: أي هذه النعم يمكن أن تُنكروه؟ والجواب: لا شيء منها. وهو تذكير بأن كل خير في الوجود إنما هو من رحمة الله وكرمه. وقد كان الصحابة إذا سمعوا هذه الآية يقولون: 'لا بشيء من نعمك ربنا نكذب، فلك الحمد.'",
      'ur':
          "تو تم اپنے رب کی کن کن نعمتوں کو جھٹلاؤ گے؟ یہ بلاغی سوال، جو سورت میں 31 بار دہرایا گیا ہے، جنوں اور انسانوں دونوں سے خطاب کرتا ہے۔ ابن کثیر بیان کرتے ہیں کہ یہ ایک چیلنج ہے - اللہ کی ہر نعمت کا ذکر کرنے کے بعد، وہ پوچھتا ہے: ان میں سے کس نعمت کا تم انکار کر سکتے ہو؟ اور جواب ہے: کسی کا بھی نہیں۔ یہ یاد دہانی ہے کہ کائنات میں موجود ہر بھلائی اللہ کی رحمت اور سخاوت سے ہے۔ صحابہ کرام جب یہ آیت سنتے تو کہتے: 'اے ہمارے رب، ہم تیری کسی نعمت کا انکار نہیں کرتے، اور تمام تعریفیں تیرے ہی لیے ہیں۔'",
      'es':
          "¿Cuál, pues, de los favores de su Señor negarán? Esta pregunta retórica, repetida 31 veces en la surah, se dirige tanto a los yinn como a la humanidad. Ibn Kathir explica que es un desafío — después de mencionar cada bendición de Allah, pregunta: ¿cuál de estas pueden negar? La respuesta es: ninguna. Es un recordatorio de que todo el bien que existe proviene de la misericordia y generosidad de Allah. Cuando los compañeros escuchaban este versículo, respondían: 'No negamos ninguna de Tus bendiciones, Señor nuestro, y a Ti pertenece toda alabanza.'",
    },
  ),

  // Verses 26-27
  TafsirEntry(
    verses: [26, 27],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "All that exists on earth will perish. And there will remain the Face of your Lord, Owner of Majesty and Honor. As-Sadi explains this verse brings everything into perspective — the entire created world is temporary. Only Allah is eternal. This is not meant to create despair, but to liberate the believer from attachment to the temporary world and focus their heart on the eternal. The 'Face of Allah' refers to Allah Himself in a manner that befits His majesty.",
      'ar':
          "كل من عليها فان، ويبقى وجه ربك ذو الجلال والإكرام. يوضح السعدي أن هذه الآية تضع كل شيء في منظوره الصحيح - فكل العالم المخلوق فانٍ زائل، ولا يبقى إلا الله. وليس المقصود من هذا اليأس، بل تحرير قلب المؤمن من التعلق بالدنيا الفانية وتوجيهه نحو الباقي الأبدي. و'وجه الله' يشير إلى ذات الله سبحانه على الوجه اللائق بجلاله.",
      'ur':
          "جو کوئی بھی زمین پر ہے فنا ہونے والا ہے۔ اور باقی رہے گی تیرے رب کی ذات، جو عظمت اور بزرگی والی ہے۔ السعدی بیان کرتے ہیں کہ یہ آیت ہر چیز کو صحیح تناظر میں رکھتی ہے - پوری مخلوق دنیا عارضی ہے۔ صرف اللہ ہی ہمیشہ رہنے والا ہے۔ اس کا مقصد مایوسی پیدا کرنا نہیں بلکہ مومن کے دل کو اس عارضی دنیا کی محبت سے آزاد کر کے ابدی ذات کی طرف متوجہ کرنا ہے۔ 'تیرے رب کا چہرہ' سے مراد اللہ کی ذات ہے، اس کی عظمت کے شایانِ شان طریقے سے۔",
      'es':
          "Todo lo que existe en la tierra perecerá. Y permanecerá el Rostro de tu Señor, Poseedor de Majestad y Honor. As-Sadi explica que este versículo pone todo en perspectiva — todo el mundo creado es temporal. Solo Allah es eterno. Esto no pretende causar desesperación, sino liberar al creyente del apego al mundo temporal y enfocar su corazón en lo eterno. El 'Rostro de Allah' se refiere a Allah mismo, de una manera que corresponde a Su majestad.",
    },
  ),
];

const _alMulk = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['abuDawud', 'tirmidhi'],
    tafsir: {
      'en':
          "Al-Mulk is known as Al-Mani'ah (the Protector) and Al-Munjiyah (the Savior). The Prophet ﷺ said: 'There is a surah in the Quran of thirty verses that will intercede for its companion until he is forgiven — it is Tabarakalladhi biyadihi al-Mulk.' (Abu Dawud, Tirmidhi). It was a practice of the Prophet ﷺ never to sleep until he recited Al-Mulk and As-Sajdah. It protects the believer from the punishment of the grave.",
      'ar':
          "تُعرف سورة الملك بـ'المانعة' و'المنجية'. قال النبي ﷺ: 'إن سورة من القرآن ثلاثون آية شفعت لصاحبها حتى غُفر له، وهي تبارك الذي بيده الملك.' (أبو داود والترمذي). وكان من عادة النبي ﷺ ألا ينام حتى يقرأ سورتي الملك والسجدة. وهي تحمي المؤمن من عذاب القبر.",
      'ur':
          "سورہ ملک کو 'المانعہ' اور 'المنجیہ' کہا جاتا ہے۔ نبی کریم ﷺ نے فرمایا: 'قرآن میں تیس آیات کی ایک سورت ہے جو اپنے پڑھنے والے کی شفاعت کرتی رہے گی یہاں تک کہ اسے بخش دیا جائے، اور وہ ہے تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ۔' (ابوداؤد، ترمذی)۔ نبی کریم ﷺ کا معمول تھا کہ آپ سورہ ملک اور سورہ سجدہ پڑھے بغیر کبھی نہیں سوتے تھے۔ یہ سورت مومن کو عذابِ قبر سے حفاظت دیتی ہے۔",
      'es':
          "Al-Mulk es conocida como Al-Mani'ah (la Protectora) y Al-Munjiyah (la Salvadora). El Profeta ﷺ dijo: 'Hay una surah en el Corán de treinta versículos que intercederá por su compañero hasta que sea perdonado — es Tabarakalladhi biyadihi al-Mulk.' (Abu Dawud, Tirmidhi). Era costumbre del Profeta ﷺ no dormir nunca sin recitar Al-Mulk y As-Sajdah. Protege al creyente del castigo de la tumba.",
    },
  ),

  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Blessed is He in whose hand is dominion. Ibn Kathir explains 'Tabaraka' means Allah is the source of all blessing and goodness, exalted and glorified above all. 'In whose hand is dominion' means all of creation, all events, and all outcomes are entirely in Allah's control. No king, no government, no power has true sovereignty — only Allah. This opening verse grounds the believer in the reality of divine sovereignty.",
      'ar':
          "تبارك الذي بيده الملك. يوضح ابن كثير أن 'تبارك' تعني أن الله هو مصدر كل بركة وخير، المتعالي المُنزَّه عن كل شيء. و'بيده الملك' تعني أن كل الخلق وكل الأحداث وكل النتائج بيد الله وحده. فلا ملك، ولا حكومة، ولا قوة تملك سيادة حقيقية - إلا الله. وهذه الآية الافتتاحية ترسخ في قلب المؤمن حقيقة السيادة الإلهية.",
      'ur':
          "بابرکت ہے وہ ذات جس کے ہاتھ میں بادشاہی ہے۔ ابن کثیر بیان کرتے ہیں کہ 'تبارک' کا مطلب یہ ہے کہ اللہ ہر برکت اور بھلائی کا سرچشمہ ہے، جو ہر چیز سے بلند و بالا اور پاک ہے۔ 'جس کے ہاتھ میں بادشاہی ہے' کا مطلب یہ ہے کہ ساری مخلوق، تمام واقعات اور تمام نتائج مکمل طور پر اللہ کے اختیار میں ہیں۔ کوئی بادشاہ، کوئی حکومت، کوئی طاقت حقیقی حاکمیت نہیں رکھتی - سوائے اللہ کے۔ یہ ابتدائی آیت مومن کے دل میں الٰہی حاکمیت کی حقیقت کو پختہ کرتی ہے۔",
      'es':
          "Bendito sea Aquel en cuya mano está el dominio. Ibn Kathir explica que 'Tabaraka' significa que Allah es la fuente de toda bendición y bondad, exaltado y glorificado por encima de todo. 'En cuya mano está el dominio' significa que toda la creación, todos los acontecimientos y todos los resultados están enteramente bajo el control de Allah. Ningún rey, ningún gobierno, ningún poder tiene una soberanía verdadera — solo Allah. Este versículo inicial afianza al creyente en la realidad de la soberanía divina.",
    },
  ),

  // Verse 2
  TafsirEntry(
    verses: [2],
    scholarKeys: ['asSadi', 'ibnKathir'],
    tafsir: {
      'en':
          "Who created death and life to test you as to which of you is best in deed. As-Sadi explains that Allah created death and life as a test — not to see who does the most deeds, but who does the best deeds. Quality over quantity. Ibn Kathir notes that death is mentioned before life to remind us of the purpose of our existence. The believer who remembers death is more likely to make their deeds sincere and excellent.",
      'ar':
          "الذي خلق الموت والحياة ليبلوكم أيكم أحسن عملاً. يوضح السعدي أن الله خلق الموت والحياة ابتلاءً - ليس ليرى من يعمل أكثر، بل من يعمل أحسن. فالعبرة بالجودة لا بالكثرة. ويلاحظ ابن كثير أن الموت ذُكر قبل الحياة لتذكيرنا بالغاية من وجودنا. والمؤمن الذي يتذكر الموت أقرب إلى أن يُخلص عمله ويُحسّنه.",
      'ur':
          "جس نے موت اور زندگی کو پیدا کیا تاکہ تمہیں آزمائے کہ تم میں سے کون عمل میں بہتر ہے۔ السعدی بیان کرتے ہیں کہ اللہ نے موت اور زندگی کو ایک آزمائش کے طور پر پیدا کیا - یہ دیکھنے کے لیے نہیں کہ کون زیادہ عمل کرتا ہے، بلکہ یہ دیکھنے کے لیے کہ کون بہتر عمل کرتا ہے۔ یعنی معیار، مقدار سے زیادہ اہم ہے۔ ابن کثیر بیان کرتے ہیں کہ موت کا ذکر زندگی سے پہلے کیا گیا تاکہ ہمیں ہمارے وجود کے مقصد کی یاد دلائی جائے۔ جو مومن موت کو یاد رکھتا ہے وہ اپنے اعمال کو مخلص اور بہترین بنانے کا زیادہ امکان رکھتا ہے۔",
      'es':
          "Quien creó la muerte y la vida para probarlos y ver quién de ustedes es mejor en obras. As-Sadi explica que Allah creó la muerte y la vida como una prueba — no para ver quién hace más obras, sino quién hace las mejores obras. Calidad sobre cantidad. Ibn Kathir señala que la muerte se menciona antes que la vida para recordarnos el propósito de nuestra existencia. El creyente que recuerda la muerte es más propenso a hacer sus obras sinceras y excelentes.",
    },
  ),

  // Verse 3
  TafsirEntry(
    verses: [3],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Who created seven heavens in layers. Look again — do you see any breaks? Ibn Kathir says this verse invites the believer to look at the sky with contemplation. The seven heavens are perfectly constructed without any flaws, cracks, or inconsistencies. The challenge 'do you see any breaks' is a testament to Allah's perfect creation. No human technology has found any flaw in the structure of the universe — it is perfectly balanced by its Creator.",
      'ar':
          "الذي خلق سبع سماوات طباقاً. ارجع البصر، هل ترى من فطور؟ يقول ابن كثير إن هذه الآية تدعو المؤمن إلى النظر في السماء بتأمل. فالسماوات السبع مبنية بإتقان تام، بلا عيب ولا شق ولا تفاوت. والتحدي 'هل ترى من فطور' شهادة على كمال خلق الله. ولم تجد التكنولوجيا البشرية أي عيب في بنية الكون - فهو متوازن تماماً بصنع خالقه.",
      'ur':
          "جس نے سات آسمان تہہ بہ تہہ بنائے۔ دوبارہ نظر اٹھا کر دیکھو، کیا تجھے کوئی شگاف نظر آتا ہے؟ ابن کثیر فرماتے ہیں کہ یہ آیت مومن کو غور و فکر کے ساتھ آسمان کی طرف دیکھنے کی دعوت دیتی ہے۔ سات آسمان کسی بھی نقص، شگاف یا بے ربطی کے بغیر کامل طریقے سے بنائے گئے ہیں۔ 'کیا تجھے کوئی شگاف نظر آتا ہے' کا چیلنج اللہ کی کامل تخلیق پر گواہی ہے۔ انسانی ٹیکنالوجی کو کائنات کی ساخت میں آج تک کوئی نقص نہیں ملا - یہ اپنے خالق کی طرف سے مکمل طور پر متوازن ہے۔",
      'es':
          "Quien creó siete cielos en capas. Mira de nuevo — ¿ves alguna fisura? Ibn Kathir dice que este versículo invita al creyente a contemplar el cielo con reflexión. Los siete cielos están construidos con perfección absoluta, sin ningún defecto, grieta o inconsistencia. El desafío '¿ves alguna fisura?' es un testimonio de la creación perfecta de Allah. Ninguna tecnología humana ha encontrado defecto alguno en la estructura del universo — está perfectamente equilibrado por su Creador.",
    },
  ),
];

const _alKafirun = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Al-Kafirun is called the surah of disavowal. The Prophet ﷺ said it equals one quarter of the Quran. It was revealed when the Quraysh of Mecca offered Prophet Muhammad ﷺ a compromise — worship our gods for one year and we will worship yours for one year. This surah was the decisive response.",
      'ar':
          "تُسمى سورة الكافرون سورة البراءة. قال النبي ﷺ إنها تعدل ربع القرآن. نزلت حين عرضت قريش على النبي محمد ﷺ مساومة - أن يعبد آلهتهم سنة ويعبدوا إلهه سنة. وكانت هذه السورة الرد الحاسم على ذلك العرض.",
      'ur':
          "سورہ کافرون کو براءت کی سورت کہا جاتا ہے۔ نبی کریم ﷺ نے فرمایا کہ یہ قرآن کے ایک چوتھائی حصے کے برابر ہے۔ یہ اس وقت نازل ہوئی جب قریشِ مکہ نے نبی کریم محمد ﷺ کو ایک سمجھوتہ پیش کیا - کہ آپ ایک سال ان کے معبودوں کی عبادت کریں اور وہ ایک سال آپ کے معبود کی عبادت کریں گے۔ یہ سورت اس پیشکش کا حتمی جواب تھی۔",
      'es':
          "Al-Kafirun es llamada la surah del repudio. El Profeta ﷺ dijo que equivale a una cuarta parte del Corán. Fue revelada cuando los Quraish de La Meca le ofrecieron al Profeta Muhammad ﷺ un compromiso — adorar a sus dioses durante un año y ellos adorarían al suyo durante un año. Esta surah fue la respuesta decisiva a esa oferta.",
    },
  ),

  // Verses 1-2
  TafsirEntry(
    verses: [1, 2],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Say: O disbelievers, I do not worship what you worship. Ibn Kathir explains this is a clear declaration of disavowal — the Prophet ﷺ is commanded to announce publicly that there is absolutely no compromise in the matter of worship. This was the most powerful answer to the Quraysh's offer of religious compromise. True tawheed cannot be mixed with any form of polytheism.",
      'ar':
          "قل يا أيها الكافرون، لا أعبد ما تعبدون. يوضح ابن كثير أن هذا إعلان واضح بالبراءة - حيث أُمر النبي ﷺ أن يعلن للجميع أنه لا مساومة على الإطلاق في أمر العبادة. وكان هذا أقوى رد على عرض قريش للمساومة الدينية. فالتوحيد الحق لا يمكن أن يُمزج بأي شكل من أشكال الشرك.",
      'ur':
          "کہہ دیجیے: اے کافرو، میں ان چیزوں کی عبادت نہیں کرتا جن کی تم عبادت کرتے ہو۔ ابن کثیر بیان کرتے ہیں کہ یہ براءت کا واضح اعلان ہے - نبی کریم ﷺ کو حکم دیا گیا کہ آپ سب کے سامنے یہ اعلان کریں کہ عبادت کے معاملے میں کوئی سمجھوتہ ممکن نہیں۔ یہ قریش کی مذہبی سمجھوتے کی پیشکش کا سب سے طاقتور جواب تھا۔ حقیقی توحید کو کسی بھی قسم کے شرک کے ساتھ نہیں ملایا جا سکتا۔",
      'es':
          "Di: ¡Oh, incrédulos! No adoro lo que ustedes adoran. Ibn Kathir explica que esta es una clara declaración de repudio — se ordena al Profeta ﷺ anunciar públicamente que no existe absolutamente ningún compromiso en materia de adoración. Esta fue la respuesta más poderosa a la oferta de los Quraish de un compromiso religioso. El verdadero tawhid no puede mezclarse con ninguna forma de politeísmo.",
    },
  ),

  // Verses 3-4
  TafsirEntry(
    verses: [3, 4],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "Nor do you worship what I worship. As-Sadi explains the repetition emphasizes the complete separation between Islamic monotheism and polytheism — in the past, present, and future. The disbelievers had no intention of truly worshipping Allah alone, and the Prophet ﷺ had no intention of ever worshipping their idols. The repetition removes any possibility of misunderstanding.",
      'ar':
          "ولا أنتم عابدون ما أعبد. يوضح السعدي أن هذا التكرار يؤكد الفصل التام بين التوحيد الإسلامي والشرك - في الماضي والحاضر والمستقبل. فالكافرون لم يكن لديهم أي نية لعبادة الله وحده حقاً، والنبي ﷺ لم يكن لديه أي نية لعبادة أصنامهم أبداً. وهذا التكرار يزيل أي احتمال لسوء الفهم.",
      'ur':
          "اور نہ تم اس کی عبادت کرنے والے ہو جس کی میں عبادت کرتا ہوں۔ السعدی بیان کرتے ہیں کہ یہ تکرار اسلامی توحید اور شرک کے درمیان مکمل علیحدگی پر زور دیتا ہے - ماضی، حال اور مستقبل میں۔ کافروں کی کبھی یہ نیت نہیں تھی کہ وہ واقعی صرف اللہ کی عبادت کریں، اور نبی کریم ﷺ کی کبھی یہ نیت نہیں تھی کہ وہ ان کے بتوں کی عبادت کریں۔ یہ تکرار غلط فہمی کے ہر امکان کو ختم کر دیتا ہے۔",
      'es':
          "Ni ustedes adoran lo que yo adoro. As-Sadi explica que la repetición enfatiza la separación completa entre el monoteísmo islámico y el politeísmo — en el pasado, el presente y el futuro. Los incrédulos no tenían ninguna intención de adorar verdaderamente a Allah solo, y el Profeta ﷺ no tenía ninguna intención de adorar jamás sus ídolos. La repetición elimina cualquier posibilidad de malentendido.",
    },
  ),

  // Verse 6
  TafsirEntry(
    verses: [6],
    scholarKeys: ['ibnKathir', 'asSadi'],
    tafsir: {
      'en':
          "For you is your religion and for me is my religion. Ibn Kathir explains this is not a verse of religious pluralism but of disavowal — the Prophet ﷺ is declaring complete separation from the religion of the polytheists. However, scholars note it also establishes that there is no compulsion in religion — people have the right to practice their faith while Muslims maintain the right to practice theirs purely. As-Sadi says this verse closes the door on any religious compromise.",
      'ar':
          "لكم دينكم ولي دين. يوضح ابن كثير أن هذه الآية ليست آية تعددية دينية بل آية براءة - فالنبي ﷺ يعلن الانفصال التام عن دين المشركين. ومع ذلك، يلاحظ العلماء أنها تؤسس أيضاً لمبدأ أنه لا إكراه في الدين - فللناس الحق في ممارسة عقيدتهم، بينما يحتفظ المسلمون بحقهم في ممارسة دينهم خالصاً. ويقول السعدي إن هذه الآية تغلق الباب أمام أي مساومة دينية.",
      'ur':
          "تمہارے لیے تمہارا دین ہے اور میرے لیے میرا دین۔ ابن کثیر بیان کرتے ہیں کہ یہ آیت مذہبی تکثیریت کی آیت نہیں بلکہ براءت کی آیت ہے - نبی کریم ﷺ مشرکین کے دین سے مکمل علیحدگی کا اعلان فرما رہے ہیں۔ تاہم، علماء بیان کرتے ہیں کہ یہ آیت اس اصول کی بنیاد بھی رکھتی ہے کہ دین میں کوئی زبردستی نہیں - لوگوں کو اپنے عقیدے پر عمل کرنے کا حق ہے، جبکہ مسلمان اپنے دین پر خالص طریقے سے عمل کرنے کا حق رکھتے ہیں۔ السعدی فرماتے ہیں کہ یہ آیت کسی بھی مذہبی سمجھوتے کا دروازہ ہمیشہ کے لیے بند کر دیتی ہے۔",
      'es':
          "Para ustedes su religión, y para mí la mía. Ibn Kathir explica que este no es un versículo de pluralismo religioso sino de repudio — el Profeta ﷺ declara la separación completa de la religión de los politeístas. Sin embargo, los eruditos señalan que también establece que no hay compulsión en la religión — las personas tienen derecho a practicar su fe mientras los musulmanes mantienen el derecho de practicar la suya de forma pura. As-Sadi dice que este versículo cierra la puerta a cualquier compromiso religioso.",
    },
  ),
];

const _anNasr = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnAbbas', 'sahihBukhari'],
    tafsir: {
      'en':
          "An-Nasr was one of the last surahs revealed. Ibn Abbas said when it was revealed, the Prophet ﷺ knew his time was near. It marked the completion of his mission — the conquest of Mecca and the entry of people into Islam in multitudes.",
      'ar':
          "النصر من آخر السور نزولاً. قال ابن عباس إنه لما نزلت هذه السورة عَلِم النبي ﷺ أن أجله قد اقترب. وقد كانت علامة على اكتمال رسالته - فتح مكة ودخول الناس في دين الله أفواجاً.",
      'ur':
          "سورہ نصر آخری نازل ہونے والی سورتوں میں سے ایک ہے۔ ابن عباس رضی اللہ عنہ نے فرمایا کہ جب یہ سورت نازل ہوئی تو نبی کریم ﷺ کو معلوم ہو گیا کہ آپ کا وقت قریب آ گیا ہے۔ یہ سورت آپ ﷺ کے مشن کی تکمیل کی علامت تھی - فتحِ مکہ اور لوگوں کا جوق در جوق اسلام میں داخل ہونا۔",
      'es':
          "An-Nasr fue una de las últimas surahs reveladas. Ibn Abbas dijo que cuando fue revelada, el Profeta ﷺ supo que su tiempo estaba cerca. Marcó la culminación de su misión — la conquista de La Meca y la entrada de la gente al Islam en multitudes.",
    },
  ),

  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "When Allah's help comes and the conquest. Ibn Kathir explains this refers to the conquest of Mecca in 8 AH — the greatest victory in Islamic history. After years of persecution and migration, the Muslims returned to Mecca victorious without significant bloodshed. This was the fulfillment of Allah's promise to His Prophet ﷺ.",
      'ar':
          "إذا جاء نصر الله والفتح. يوضح ابن كثير أن هذا يشير إلى فتح مكة في السنة الثامنة للهجرة - أعظم انتصار في التاريخ الإسلامي. فبعد سنوات من الاضطهاد والهجرة، عاد المسلمون إلى مكة منتصرين دون إراقة دماء تُذكر. وكان ذلك تحقيقاً لوعد الله لنبيه ﷺ.",
      'ur':
          "جب اللہ کی مدد اور فتح آ جائے۔ ابن کثیر بیان کرتے ہیں کہ اس سے مراد 8 ہجری میں فتحِ مکہ ہے - جو اسلامی تاریخ کی سب سے بڑی فتح ہے۔ ظلم و ستم اور ہجرت کے کئی سالوں کے بعد، مسلمان بغیر کسی بڑی خونریزی کے فاتحانہ طور پر مکہ واپس آئے۔ یہ اللہ کے اپنے نبی ﷺ سے کیے گئے وعدے کی تکمیل تھی۔",
      'es':
          "Cuando llegue la ayuda de Allah y la conquista. Ibn Kathir explica que esto se refiere a la conquista de La Meca en el año 8 de la Hégira — la mayor victoria en la historia islámica. Después de años de persecución y emigración, los musulmanes regresaron a La Meca victoriosos sin derramamiento de sangre significativo. Esto fue el cumplimiento de la promesa de Allah a Su Profeta ﷺ.",
    },
  ),

  // Verse 2
  TafsirEntry(
    verses: [2],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "And you see the people entering into the religion of Allah in multitudes. As-Sadi explains that after the conquest of Mecca, Islam spread rapidly across Arabia. Tribes that had been waiting to see the outcome now embraced Islam in large numbers. This verse is a miracle — it was revealed before the conquest as a prophecy that was fulfilled.",
      'ar':
          "ورأيت الناس يدخلون في دين الله أفواجاً. يوضح السعدي أنه بعد فتح مكة، انتشر الإسلام بسرعة في أنحاء الجزيرة العربية. فالقبائل التي كانت تنتظر لترى النتيجة دخلت الآن في الإسلام بأعداد كبيرة. وهذه الآية معجزة - فقد نزلت قبل الفتح كنبوءة تحققت.",
      'ur':
          "اور تو دیکھے گا کہ لوگ اللہ کے دین میں جوق در جوق داخل ہو رہے ہیں۔ السعدی بیان کرتے ہیں کہ فتحِ مکہ کے بعد اسلام تیزی سے پورے عرب میں پھیل گیا۔ وہ قبائل جو نتیجہ دیکھنے کا انتظار کر رہے تھے، اب بڑی تعداد میں اسلام میں داخل ہونے لگے۔ یہ آیت ایک معجزہ ہے - یہ فتح سے پہلے ایک پیشین گوئی کے طور پر نازل ہوئی جو پوری ہوئی۔",
      'es':
          "Y veas a la gente entrar en la religión de Allah en multitudes. As-Sadi explica que, tras la conquista de La Meca, el Islam se extendió rápidamente por toda Arabia. Las tribus que habían estado esperando para ver el resultado ahora abrazaban el Islam en gran número. Este versículo es un milagro — fue revelado antes de la conquista como una profecía que se cumplió.",
    },
  ),

  // Verse 3
  TafsirEntry(
    verses: [3],
    scholarKeys: ['ibnKathir', 'sahihBukhari', 'sahihMuslim'],
    tafsir: {
      'en':
          "Then exalt Him with praise and ask His forgiveness. Ibn Kathir explains that even in the moment of greatest victory, the Prophet ﷺ is commanded to glorify Allah and seek forgiveness — not to celebrate personal achievement. Aisha reported that after this surah was revealed, the Prophet ﷺ would frequently say 'Subhanakallahumma wa bihamdika, astaghfiruka wa atubu ilayk' in his prayer. (Bukhari, Muslim)",
      'ar':
          "فسبح بحمد ربك واستغفره. يوضح ابن كثير أنه حتى في لحظة أعظم انتصار، أُمر النبي ﷺ بتسبيح الله وطلب المغفرة - لا بالاحتفال بالإنجاز الشخصي. وروت عائشة رضي الله عنها أنه بعد نزول هذه السورة كان النبي ﷺ يكثر من قول 'سبحانك اللهم وبحمدك، أستغفرك وأتوب إليك' في صلاته. (البخاري ومسلم)",
      'ur':
          "تو اپنے رب کی حمد کے ساتھ تسبیح کرو اور اس سے بخشش مانگو۔ ابن کثیر بیان کرتے ہیں کہ سب سے بڑی فتح کے لمحے میں بھی نبی کریم ﷺ کو حکم دیا گیا کہ اللہ کی تسبیح کریں اور بخشش مانگیں - نہ کہ ذاتی کامیابی کا جشن منائیں۔ حضرت عائشہ رضی اللہ عنہا نے بیان کیا کہ اس سورت کے نازل ہونے کے بعد نبی کریم ﷺ اپنی نماز میں کثرت سے فرماتے تھے: 'سبحانک اللھم وبحمدک، استغفرک واتوب الیک۔' (بخاری، مسلم)",
      'es':
          "Entonces glorifícalo con alabanzas y pide Su perdón. Ibn Kathir explica que, incluso en el momento de la mayor victoria, se ordena al Profeta ﷺ glorificar a Allah y pedir perdón — no celebrar un logro personal. Aisha relató que después de que esta surah fue revelada, el Profeta ﷺ decía frecuentemente en su oración: 'Subhanak Allahumma wa bihamdika, astaghfiruka wa atubu ilayk.' (Bujari, Muslim)",
    },
  ),
];

const _alMasad = [
  // Surah overview
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Al-Masad was revealed about Abu Lahab, the Prophet's uncle, who was one of his fiercest enemies. This is the only surah that mentions a specific person by name as condemned. It is a miracle — Abu Lahab died as a disbeliever, fulfilling the surah's prophecy.",
      'ar':
          "نزلت سورة المسد في أبي لهب، عم النبي ﷺ، الذي كان من أشد أعدائه. وهي السورة الوحيدة التي تذكر شخصاً بعينه بالاسم وتدينه. وهي معجزة - فقد مات أبو لهب كافراً، مُحققاً نبوءة السورة.",
      'ur':
          "سورہ مسد ابو لہب کے بارے میں نازل ہوئی، جو نبی کریم ﷺ کے چچا اور ان کے سب سے سخت دشمنوں میں سے ایک تھے۔ یہ واحد سورت ہے جس میں کسی مخصوص شخص کا نام لے کر اسے ملعون قرار دیا گیا ہے۔ یہ ایک معجزہ ہے - ابو لہب کفر کی حالت میں مرا، اور سورت کی پیشین گوئی پوری ہوئی۔",
      'es':
          "Al-Masad fue revelada acerca de Abu Lahab, el tío del Profeta, quien era uno de sus enemigos más feroces. Esta es la única surah que menciona a una persona específica por su nombre como condenada. Es un milagro — Abu Lahab murió como incrédulo, cumpliendo la profecía de la surah.",
    },
  ),

  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "May the hands of Abu Lahab be ruined, and ruined is he. Ibn Kathir explains Abu Lahab was the Prophet's uncle who violently opposed Islam from the beginning. When the Prophet ﷺ called his family to Islam, Abu Lahab said 'May you perish!' — this surah was the divine response. 'His hands' refers to his power and wealth, both of which failed to protect him.",
      'ar':
          "تبت يدا أبي لهب وتب. يوضح ابن كثير أن أبا لهب كان عم النبي ﷺ الذي عارض الإسلام بشدة منذ البداية. فحين دعا النبي ﷺ أهله إلى الإسلام، قال أبو لهب: 'تباً لك!' - فكانت هذه السورة الرد الإلهي على ذلك. و'يداه' تشير إلى قوته وماله، وكلاهما لم يُغنِ عنه شيئاً.",
      'ur':
          "ابو لہب کے دونوں ہاتھ ٹوٹ جائیں اور وہ خود ہلاک ہو جائے۔ ابن کثیر بیان کرتے ہیں کہ ابو لہب نبی کریم ﷺ کے چچا تھے جنہوں نے شروع ہی سے اسلام کی شدید مخالفت کی۔ جب نبی کریم ﷺ نے اپنے خاندان کو اسلام کی دعوت دی تو ابو لہب نے کہا: 'تجھ پر ہلاکت ہو!' - تو یہ سورت اس کا الٰہی جواب تھی۔ 'اس کے ہاتھ' سے مراد اس کی طاقت اور اس کا مال ہے، اور دونوں میں سے کوئی بھی چیز اسے نہ بچا سکی۔",
      'es':
          "¡Que perezcan las manos de Abu Lahab, y que perezca él! Ibn Kathir explica que Abu Lahab era el tío del Profeta que se opuso violentamente al Islam desde el principio. Cuando el Profeta ﷺ llamó a su familia al Islam, Abu Lahab dijo: '¡Que perezcas!' — esta surah fue la respuesta divina a eso. 'Sus manos' se refiere a su poder y su riqueza, ninguno de los cuales pudo protegerlo.",
    },
  ),

  // Verses 2-3
  TafsirEntry(
    verses: [2, 3],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "His wealth will not avail him or that which he gained. He will enter a Fire of blazing flame. As-Sadi explains that Abu Lahab's name literally means 'Father of Flame' — and this surah predicted he would enter the flame of hellfire. He had great wealth and influence in Mecca, yet neither protected him. This is a warning for all who use their resources against Allah's religion.",
      'ar':
          "ما أغنى عنه ماله وما كسب، سيصلى ناراً ذات لهب. يوضح السعدي أن اسم أبي لهب يعني حرفياً 'أبو اللهب' - وقد تنبأت هذه السورة بأنه سيدخل لهب نار جهنم. فقد كان له مال ونفوذ كبيران في مكة، لكن لم يُغنِ عنه أي منهما. وهذا تحذير لكل من يستخدم موارده ضد دين الله.",
      'ur':
          "اس کا مال اور جو کچھ اس نے کمایا، اس کے کسی کام نہ آیا۔ عنقریب وہ شعلے والی آگ میں جائے گا۔ السعدی بیان کرتے ہیں کہ ابو لہب کے نام کا لفظی مطلب ہے 'شعلے والا باپ' - اور اس سورت نے پیشین گوئی کی کہ وہ جہنم کے شعلے میں داخل ہو گا۔ مکہ میں اس کے پاس بہت مال اور اثر و رسوخ تھا، لیکن ان میں سے کوئی چیز اسے نہ بچا سکی۔ یہ ہر اس شخص کے لیے انتباہ ہے جو اپنے وسائل اللہ کے دین کے خلاف استعمال کرتا ہے۔",
      'es':
          "De nada le servirán su riqueza ni lo que ganó. Entrará en un Fuego de llamas ardientes. As-Sadi explica que el nombre de Abu Lahab significa literalmente 'Padre de la Llama' — y esta surah predijo que entraría en la llama del infierno. Tenía gran riqueza e influencia en La Meca, pero ninguna de las dos lo protegió. Esto es una advertencia para todos los que usan sus recursos contra la religión de Allah.",
    },
  ),

  // Verses 4-5
  TafsirEntry(
    verses: [4, 5],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "And his wife shall carry the firewood, around her neck a rope of palm fiber. Ibn Kathir explains Abu Lahab's wife Umm Jamil was equally fierce in her opposition to the Prophet ﷺ. She would place thorns on the Prophet's path. The 'firewood' she carries refers to her spreading slander and enmity. In the Hereafter she will carry actual firewood to fuel her husband's fire, with a rope of twisted fiber around her neck — the same material she used to carry thorns.",
      'ar':
          "وامرأته حمالة الحطب، في جيدها حبل من مسد. يوضح ابن كثير أن زوجة أبي لهب، أم جميل، كانت لا تقل عنه عداوة للنبي ﷺ. فكانت تضع الشوك في طريقه. و'حمل الحطب' يشير إلى نشرها للنميمة والعداوة. وفي الآخرة ستحمل حطباً حقيقياً لتأجيج نار زوجها، وفي عنقها حبل مفتول من ليف - وهو نفس المادة التي كانت تستخدمها لحمل الشوك.",
      'ur':
          "اور اس کی بیوی، جو لکڑیاں ڈھونے والی ہے، اس کی گردن میں مونج کی رسی ہو گی۔ ابن کثیر بیان کرتے ہیں کہ ابو لہب کی بیوی، ام جمیل، نبی کریم ﷺ کی مخالفت میں اس سے کم نہیں تھی۔ وہ نبی کریم ﷺ کے راستے میں کانٹے بچھایا کرتی تھی۔ 'لکڑیاں ڈھونا' سے مراد اس کا چغل خوری اور دشمنی پھیلانا ہے۔ آخرت میں وہ اپنے شوہر کی آگ بھڑکانے کے لیے حقیقی لکڑیاں اٹھائے گی، اور اس کی گردن میں بٹی ہوئی رسی ہو گی - وہی مواد جو وہ کانٹے ڈھونے کے لیے استعمال کیا کرتی تھی۔",
      'es':
          "Y su mujer, acarreadora de leña, llevará en su cuello una cuerda de fibra de palma. Ibn Kathir explica que la esposa de Abu Lahab, Umm Jamil, era igualmente feroz en su oposición al Profeta ﷺ. Solía colocar espinas en el camino del Profeta. La 'leña' que carga se refiere a la difusión de calumnias y enemistad. En el Más Allá cargará leña real para alimentar el fuego de su esposo, con una cuerda de fibra retorcida alrededor de su cuello — el mismo material que usaba para cargar las espinas.",
    },
  ),
];

const _alIkhlas = [
  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Say: He is Allah, the One. Ibn Kathir explains that 'Ahad' means Allah is uniquely One — there is nothing like Him, no partner, no equal, no rival. This verse establishes the foundation of Islamic theology: pure monotheism (tawheed). Allah is not one of many gods — He is the only God, singular in His essence and attributes.",
      'ar':
          "قل: هو الله الواحد الأحد. يوضح ابن كثير أن 'الأحد' تعني أن الله واحد لا نظير له - لا شبيه له، ولا شريك، ولا مثيل، ولا منازع. وهذه الآية تؤسس لأساس العقيدة الإسلامية: التوحيد الخالص. فالله ليس واحداً من آلهة متعددة - بل هو الإله الواحد الأحد، المتفرد في ذاته وصفاته.",
      'ur':
          "فرما دیجیے: وہ اللہ ایک ہے۔ ابن کثیر بیان کرتے ہیں کہ 'احد' کا مطلب ہے کہ اللہ یکتا اور واحد ہے - اس جیسا کوئی نہیں، نہ اس کا کوئی شریک ہے، نہ کوئی برابر، نہ کوئی مدِمقابل۔ یہ آیت اسلامی عقیدے کی بنیاد قائم کرتی ہے: خالص توحید۔ اللہ بہت سے معبودوں میں سے ایک نہیں ہے - وہ واحد معبود ہے، اپنی ذات اور صفات میں یکتا۔",
      'es':
          "Di: Él es Allah, el Único. Ibn Kathir explica que 'Ahad' significa que Allah es Uno de manera exclusiva — no hay nada semejante a Él, ningún socio, ningún igual, ningún rival. Este versículo establece el fundamento de la teología islámica: el monoteísmo puro (tawhid). Allah no es uno entre muchos dioses — Él es el único Dios, singular en Su esencia y Sus atributos.",
    },
  ),

  // Verse 2
  TafsirEntry(
    verses: [2],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "'As-Samad' means the One upon whom all creation depends for their needs, while He depends on no one. Ibn Kathir says As-Samad is the Master who is perfect in His sovereignty, the Most Noble who is perfect in His honor, the Most Magnificent who is perfect in His might. Every created being needs Allah, but Allah needs nothing. He is self-sufficient and eternal.",
      'ar':
          "'الصمد' هو الذي تفتقر إليه جميع المخلوقات في حوائجها، وهو لا يفتقر إلى أحد. يقول ابن كثير إن الصمد هو السيد الذي كمل في سؤدده، والشريف الذي كمل في شرفه، والعظيم الذي كمل في عظمته. فكل مخلوق محتاج إلى الله، أما الله فهو غني عن كل شيء، قائم بذاته، أزلي أبدي.",
      'ur':
          "'الصمد' وہ ذات ہے جس کی طرف ساری مخلوق اپنی ضروریات میں محتاج ہے، جبکہ وہ کسی کا محتاج نہیں۔ ابن کثیر فرماتے ہیں کہ الصمد وہ سردار ہے جو اپنی سیادت میں کامل ہے، وہ شریف ہے جو اپنی شرافت میں کامل ہے، وہ عظیم ہے جو اپنی عظمت میں کامل ہے۔ ہر مخلوق اللہ کی محتاج ہے، لیکن اللہ کسی چیز کا محتاج نہیں۔ وہ بے نیاز اور ازلی و ابدی ہے۔",
      'es':
          "'As-Samad' significa Aquel de quien toda la creación depende para sus necesidades, mientras que Él no depende de nadie. Ibn Kathir dice que As-Samad es el Soberano perfecto en Su dominio, el Noble perfecto en Su honor, el Magnífico perfecto en Su grandeza. Toda criatura necesita a Allah, pero Allah no necesita nada. Él es autosuficiente y eterno.",
    },
  ),

  // Verse 3
  TafsirEntry(
    verses: [3],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "He neither begets nor was He begotten. Ibn Kathir explains this refutes those who claim Allah has children or parents. Allah transcends biological relationships entirely. He was not born from anything, and nothing was born from Him in the divine sense. This verse directly addresses the beliefs of those who attributed sons or daughters to Allah.",
      'ar':
          "لم يلد ولم يولد. يوضح ابن كثير أن هذه الآية ترد على من زعم أن لله ولداً أو والداً. فالله منزه تماماً عن العلاقات الجسدية. لم يُولد من شيء، ولم يولد منه شيء بالمعنى الإلهي. وهذه الآية ترد مباشرة على معتقدات من نسبوا لله أبناءً أو بنات.",
      'ur':
          "نہ اس نے کسی کو جنا اور نہ وہ کسی سے جنا گیا۔ ابن کثیر بیان کرتے ہیں کہ یہ آیت ان لوگوں کے دعوے کو رد کرتی ہے جو اللہ کے لیے اولاد یا والدین کا تصور رکھتے ہیں۔ اللہ ہر قسم کے جسمانی رشتوں سے بالکل پاک ہے۔ نہ وہ کسی چیز سے پیدا ہوا، اور نہ اس سے کوئی چیز الٰہی معنوں میں پیدا ہوئی۔ یہ آیت ان عقائد کا براہِ راست جواب ہے جنہوں نے اللہ کی طرف بیٹے یا بیٹیاں منسوب کیں۔",
      'es':
          "Él no engendra ni fue engendrado. Ibn Kathir explica que esto refuta a quienes afirman que Allah tiene hijos o padres. Allah trasciende por completo las relaciones biológicas. No nació de nada, y nada nació de Él en el sentido divino. Este versículo responde directamente a las creencias de quienes atribuyeron a Allah hijos o hijas.",
    },
  ),

  // Verse 4
  TafsirEntry(
    verses: [4],
    scholarKeys: ['asSadi', 'sahihBukhari'],
    tafsir: {
      'en':
          "And there is none comparable to Him. As-Sadi explains that nothing in creation resembles Allah in any way — not in His essence, His attributes, or His actions. This completes the picture of pure tawheed: Allah is One, self-sufficient, unborn and unbegotten, and incomparable. The Prophet ﷺ said whoever recites this surah has recited the equivalent of one third of the Quran. (Sahih Bukhari 5013)",
      'ar':
          "ولم يكن له كفواً أحد. يوضح السعدي أنه لا يماثل الله شيء من مخلوقاته بأي وجه - لا في ذاته، ولا في صفاته، ولا في أفعاله. وبهذا تكتمل صورة التوحيد الخالص: فالله واحد، صمد، لم يلد ولم يولد، ولا كفء له. وقد قال النبي ﷺ: من قرأ هذه السورة فكأنما قرأ ثلث القرآن. (صحيح البخاري 5013)",
      'ur':
          "اور اس کا کوئی ہمسر نہیں۔ السعدی بیان کرتے ہیں کہ مخلوقات میں سے کوئی چیز کسی بھی طرح اللہ سے مشابہت نہیں رکھتی - نہ اس کی ذات میں، نہ صفات میں، نہ افعال میں۔ اس کے ساتھ ہی خالص توحید کی تصویر مکمل ہو جاتی ہے: اللہ ایک ہے، بے نیاز ہے، نہ اس نے کسی کو جنا نہ وہ کسی سے جنا گیا، اور اس کا کوئی ہمسر نہیں۔ نبی کریم ﷺ نے فرمایا کہ جس نے یہ سورت پڑھی گویا اس نے قرآن کا تہائی حصہ پڑھ لیا۔ (صحیح بخاری 5013)",
      'es':
          "Y no hay nadie comparable a Él. As-Sadi explica que nada en la creación se asemeja a Allah de ninguna manera — ni en Su esencia, ni en Sus atributos, ni en Sus acciones. Esto completa el panorama del tawhid puro: Allah es Uno, autosuficiente, no engendra ni fue engendrado, y no tiene semejante. El Profeta ﷺ dijo que quien recite esta surah habrá recitado el equivalente a un tercio del Corán. (Sahih al-Bukhari 5013)",
    },
  ),
];

const _alFalaq = [
  // Verse 1
  TafsirEntry(
    verses: [1],
    scholarKeys: ['ibnKathir', 'abuDawud'],
    tafsir: {
      'en':
          "Say: I seek refuge in the Lord of the daybreak. Ibn Kathir explains that Al-Falaq refers to the break of dawn — the splitting of darkness by light. Seeking refuge in the Lord of the daybreak means turning to Allah, who controls the cycles of night and day, darkness and light. This surah and An-Nas were revealed together, and the Prophet ﷺ would recite them every morning and evening for protection. (Abu Dawud)",
      'ar':
          "قل: أعوذ برب الفلق. يوضح ابن كثير أن 'الفلق' هو الصبح - أي انشقاق الظلام عن النور. والاستعاذة برب الفلق تعني التوجه إلى الله الذي يدبر تعاقب الليل والنهار، والظلمة والنور. وقد نزلت هذه السورة مع سورة الناس معاً، وكان النبي ﷺ يقرأهما كل صباح ومساء طلباً للحماية. (أبو داود)",
      'ur':
          "فرما دیجیے: میں صبح کے پروردگار کی پناہ مانگتا ہوں۔ ابن کثیر بیان کرتے ہیں کہ 'الفلق' سے مراد صبح کا طلوع ہونا ہے - یعنی روشنی کا اندھیرے کو چیر کر نکلنا۔ صبح کے رب کی پناہ مانگنے کا مطلب ہے اس اللہ کی طرف رجوع کرنا جو رات اور دن، اندھیرے اور روشنی کے چکر کو چلاتا ہے۔ یہ سورت اور سورہ الناس ساتھ نازل ہوئیں، اور نبی کریم ﷺ ہر صبح و شام حفاظت کے لیے انہیں پڑھتے تھے۔ (ابوداؤد)",
      'es':
          "Di: Me refugio en el Señor del amanecer. Ibn Kathir explica que Al-Falaq se refiere al despuntar del alba — la ruptura de la oscuridad por la luz. Buscar refugio en el Señor del amanecer significa volverse hacia Allah, quien controla los ciclos de la noche y el día, la oscuridad y la luz. Esta surah y An-Nas fueron reveladas juntas, y el Profeta ﷺ las recitaba cada mañana y cada noche para protegerse. (Abu Dawud)",
    },
  ),

  // Verse 2
  TafsirEntry(
    verses: [2],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "From the evil of what He has created. This is a comprehensive refuge from all created evils — whether from humans, jinn, animals, diseases, or any harmful thing. Ibn Kathir notes that this verse seeks protection from the evil of every created thing, making it a complete shield against all worldly harms.",
      'ar':
          "من شر ما خلق. هذه استعاذة شاملة من كل شر مخلوق - سواء كان من الإنس أو الجن أو الحيوانات أو الأمراض أو أي شيء مؤذٍ. يلاحظ ابن كثير أن هذه الآية تطلب الحماية من شر كل مخلوق، فتكون درعاً كاملاً من جميع أضرار الدنيا.",
      'ur':
          "اس کے شر سے جو اس نے پیدا کیا۔ یہ ہر اس مخلوق کے شر سے ایک جامع پناہ ہے - چاہے وہ انسانوں سے ہو، جنوں سے، جانوروں سے، بیماریوں سے، یا کسی بھی نقصان دہ چیز سے۔ ابن کثیر بیان کرتے ہیں کہ یہ آیت ہر پیدا کی گئی چیز کے شر سے حفاظت طلب کرتی ہے، جس سے یہ دنیا کے تمام نقصانات کے خلاف ایک مکمل ڈھال بن جاتی ہے۔",
      'es':
          "Del mal de lo que Él ha creado. Esta es una protección integral contra todo mal creado — ya sea de humanos, yinn, animales, enfermedades o cualquier cosa dañina. Ibn Kathir señala que este versículo busca protección del mal de toda cosa creada, convirtiéndose en un escudo completo contra todos los daños de este mundo.",
    },
  ),

  // Verse 3
  TafsirEntry(
    verses: [3],
    scholarKeys: ['ibnKathir', 'tirmidhi'],
    tafsir: {
      'en':
          "And from the evil of darkness when it settles. Ibn Kathir explains this refers to the darkness of night, when harmful creatures emerge, evildoers operate, and jinn are more active. The Prophet ﷺ pointed to the moon one night and said 'Seek refuge from the evil of this when it sets, for this is the ghasiq when it enters.' (Tirmidhi)",
      'ar':
          "ومن شر غاسق إذا وقب. يوضح ابن كثير أن هذا يشير إلى ظلام الليل حين تخرج المخلوقات المؤذية، ويعمل أهل الشر، ويزداد نشاط الجن. وقد أشار النبي ﷺ ذات ليلة إلى القمر وقال: 'تعوذي بالله من شر هذا، فهذا هو الغاسق إذا وقب.' (الترمذي)",
      'ur':
          "اور رات کے اندھیرے کے شر سے جب وہ چھا جائے۔ ابن کثیر بیان کرتے ہیں کہ اس سے مراد رات کا اندھیرا ہے جب نقصان دہ مخلوقات نکلتی ہیں، شریر لوگ سرگرم ہوتے ہیں، اور جنات کی سرگرمی بڑھ جاتی ہے۔ نبی کریم ﷺ نے ایک رات چاند کی طرف اشارہ کرتے ہوئے فرمایا: 'اس کے شر سے پناہ مانگو جب یہ غروب ہو، کیونکہ یہی وہ غاسق ہے جب وہ داخل ہوتا ہے۔' (ترمذی)",
      'es':
          "Y del mal de la oscuridad cuando se asienta. Ibn Kathir explica que esto se refiere a la oscuridad de la noche, cuando emergen las criaturas dañinas, actúan los malhechores y los yinn están más activos. Una noche, el Profeta ﷺ señaló la luna y dijo: 'Busca refugio del mal de esto cuando se oculta, pues esto es el ghasiq cuando entra.' (Tirmidhi)",
    },
  ),

  // Verse 4
  TafsirEntry(
    verses: [4],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "And from the evil of the blowers in knots. This refers to witchcraft and black magic — specifically those who blow on knots as part of sorcery. Ibn Kathir confirms this refers to sihr (black magic), which is real and which Islam firmly prohibits practicing. Seeking refuge from it in Allah is the believer's protection.",
      'ar':
          "ومن شر النفاثات في العقد. يشير هذا إلى السحر - وتحديداً اللواتي ينفثن في العقد كجزء من السحر. يؤكد ابن كثير أن هذا يشير إلى السحر، وهو أمر حقيقي حرّمه الإسلام تحريماً قاطعاً. والاستعاذة بالله منه هي حماية المؤمن.",
      'ur':
          "اور گرہوں میں پھونکنے والیوں کے شر سے۔ اس سے مراد جادو اور کالا جادو ہے - خاص طور پر وہ لوگ جو جادو کے طور پر گرہوں پر پھونکتے ہیں۔ ابن کثیر تصدیق کرتے ہیں کہ اس سے مراد سحر (کالا جادو) ہے جو حقیقت ہے اور جسے اسلام سختی سے حرام قرار دیتا ہے۔ اس سے اللہ کی پناہ مانگنا مومن کی حفاظت ہے۔",
      'es':
          "Y del mal de las que soplan en los nudos. Esto se refiere a la brujería y la magia negra — específicamente a quienes soplan sobre nudos como parte de la hechicería. Ibn Kathir confirma que esto se refiere al sihr (magia negra), que es real y que el Islam prohíbe terminantemente practicar. Buscar refugio de ello en Allah es la protección del creyente.",
    },
  ),

  // Verse 5
  TafsirEntry(
    verses: [5],
    scholarKeys: ['asSadi', 'sahihMuslim'],
    tafsir: {
      'en':
          "And from the evil of an envier when he envies. As-Sadi explains that hasad (envy) is wishing for the removal of a blessing from another person. The evil eye (ayn) is real — the Prophet ﷺ said 'The evil eye is real.' (Muslim 2188). Seeking refuge in Allah from the envier is an important protection that Muslims are encouraged to practice regularly.",
      'ar':
          "ومن شر حاسد إذا حسد. يوضح السعدي أن الحسد هو تمني زوال نعمة عن الغير. والعين حق - فقد قال النبي ﷺ: 'العين حق.' (مسلم 2188). والاستعاذة بالله من الحاسد حماية مهمة يُستحب للمسلمين المداومة عليها.",
      'ur':
          "اور حسد کرنے والے کے شر سے جب وہ حسد کرے۔ السعدی بیان کرتے ہیں کہ حسد یہ ہے کہ کسی دوسرے سے کسی نعمت کے زوال کی تمنا کی جائے۔ نظرِ بد حق ہے - نبی کریم ﷺ نے فرمایا: 'نظرِ بد حق ہے۔' (مسلم 2188)۔ حاسد کے شر سے اللہ کی پناہ مانگنا ایک اہم حفاظت ہے جس کی مسلمانوں کو باقاعدگی سے پابندی کی ترغیب دی گئی ہے۔",
      'es':
          "Y del mal de un envidioso cuando envidia. As-Sadi explica que el hasad (envidia) es desear que una bendición sea quitada a otra persona. El mal de ojo (ayn) es real — el Profeta ﷺ dijo: 'El mal de ojo es real.' (Muslim 2188). Buscar refugio en Allah del envidioso es una protección importante que se anima a los musulmanes a practicar con regularidad.",
    },
  ),
];

const _anNas = [
  // Verses 1-3
  TafsirEntry(
    verses: [1, 2, 3],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "Say: I seek refuge in the Lord of mankind, the King of mankind, the God of mankind. Ibn Kathir explains these three attributes — Rabb (Lord/Sustainer), Malik (King/Owner), Ilah (God/Deity) — describe Allah's complete authority over humanity. Seeking refuge using all three names is seeking the most comprehensive protection possible. This surah specifically addresses protection of the inner self and the heart.",
      'ar':
          "قل: أعوذ برب الناس، ملك الناس، إله الناس. يوضح ابن كثير أن هذه الصفات الثلاث - الرب (المربي والمدبر)، والملك (المالك والحاكم)، والإله (المعبود) - تصف سلطان الله الكامل على البشرية. والاستعاذة بهذه الأسماء الثلاثة جميعاً هي طلب لأشمل حماية ممكنة. وهذه السورة تتناول بالتحديد حماية النفس الداخلية والقلب.",
      'ur':
          "فرما دیجیے: میں لوگوں کے رب، لوگوں کے بادشاہ، لوگوں کے معبود کی پناہ مانگتا ہوں۔ ابن کثیر بیان کرتے ہیں کہ یہ تین صفات - رب (پالنے والا اور مدبر)، ملک (مالک اور حاکم)، اور الٰہ (معبود) - انسانیت پر اللہ کے مکمل اختیار کو بیان کرتی ہیں۔ ان تینوں ناموں کے ساتھ پناہ مانگنا سب سے جامع ممکن حفاظت طلب کرنا ہے۔ یہ سورت خاص طور پر باطنی نفس اور دل کی حفاظت سے متعلق ہے۔",
      'es':
          "Di: Me refugio en el Señor de la humanidad, el Rey de la humanidad, el Dios de la humanidad. Ibn Kathir explica que estos tres atributos — Rabb (Señor/Sustentador), Malik (Rey/Dueño) e Ilah (Dios/Deidad) — describen la autoridad completa de Allah sobre la humanidad. Buscar refugio usando los tres nombres es buscar la protección más completa posible. Esta surah trata específicamente la protección del ser interior y del corazón.",
    },
  ),

  // Verse 4
  TafsirEntry(
    verses: [4],
    scholarKeys: ['ibnKathir'],
    tafsir: {
      'en':
          "From the evil of the retreating whisperer. Al-Waswas Al-Khannas refers to Shaytan (Satan), who whispers evil thoughts into the hearts of people, then retreats when Allah is remembered. Ibn Kathir explains that Khannas means 'the one who retreats' — Shaytan flees when the name of Allah is mentioned. This is why dhikr (remembrance of Allah) is the most powerful weapon against waswasa (whispered doubts and evil thoughts).",
      'ar':
          "من شر الوسواس الخناس. 'الوسواس الخناس' يشير إلى الشيطان الذي يوسوس بالشر في قلوب الناس، ثم ينسحب عند ذكر الله. يوضح ابن كثير أن 'الخناس' تعني 'المنسحب المتراجع' - فالشيطان يفر عند ذكر اسم الله. ولهذا فإن الذكر هو أقوى سلاح ضد الوسوسة (الشكوك والأفكار الشريرة الموسوسة).",
      'ur':
          "وسوسہ ڈالنے والے، پیچھے ہٹ جانے والے کے شر سے۔ 'الوسواس الخناس' سے مراد شیطان ہے جو لوگوں کے دلوں میں برے خیالات کا وسوسہ ڈالتا ہے، پھر اللہ کے ذکر پر پیچھے ہٹ جاتا ہے۔ ابن کثیر بیان کرتے ہیں کہ 'خناس' کا مطلب ہے 'پیچھے ہٹنے والا' - شیطان اللہ کا نام لینے پر بھاگ جاتا ہے۔ یہی وجہ ہے کہ ذکرِ الٰہی وسوسے (شکوک اور برے خیالات) کے خلاف سب سے طاقتور ہتھیار ہے۔",
      'es':
          "Del mal del susurrador que se retira. Al-Waswas Al-Khannas se refiere a Shaytán (Satanás), quien susurra malos pensamientos en los corazones de las personas y luego se retira cuando se recuerda a Allah. Ibn Kathir explica que Khannas significa 'el que se retira' — Shaytán huye cuando se menciona el nombre de Allah. Por eso el dhikr (recuerdo de Allah) es el arma más poderosa contra el waswasa (dudas y malos pensamientos susurrados).",
    },
  ),

  // Verse 5
  TafsirEntry(
    verses: [5],
    scholarKeys: ['asSadi'],
    tafsir: {
      'en':
          "Who whispers in the hearts of mankind. As-Sadi explains that the whispering of Shaytan targets the chest — the seat of the heart and mind. The whispers can come as doubts about faith, temptations toward sin, or distracting thoughts during prayer. The cure is immediate remembrance of Allah, seeking His refuge, and staying firm in worship.",
      'ar':
          "الذي يوسوس في صدور الناس. يوضح السعدي أن وسوسة الشيطان تستهدف الصدر - مقر القلب والعقل. وقد تأتي هذه الوساوس على شكل شكوك في الإيمان، أو إغراءات نحو المعصية، أو أفكار مشتتة أثناء الصلاة. والعلاج هو المبادرة بذكر الله، والاستعاذة به، والثبات على العبادة.",
      'ur':
          "جو لوگوں کے سینوں میں وسوسہ ڈالتا ہے۔ السعدی بیان کرتے ہیں کہ شیطان کا وسوسہ سینے کو نشانہ بناتا ہے - جو دل اور دماغ کا مقام ہے۔ یہ وسوسے ایمان کے بارے میں شکوک، گناہ کی طرف ترغیب، یا نماز کے دوران توجہ ہٹانے والے خیالات کی شکل میں آ سکتے ہیں۔ علاج یہ ہے کہ فوراً اللہ کا ذکر کیا جائے، اس کی پناہ مانگی جائے، اور عبادت پر ثابت قدم رہا جائے۔",
      'es':
          "Que susurra en los pechos de la humanidad. As-Sadi explica que el susurro de Shaytán se dirige al pecho — la sede del corazón y la mente. Estos susurros pueden presentarse como dudas sobre la fe, tentaciones hacia el pecado, o pensamientos que distraen durante la oración. La cura es el recuerdo inmediato de Allah, buscar Su refugio y permanecer firme en la adoración.",
    },
  ),

  // Verse 6
  TafsirEntry(
    verses: [6],
    scholarKeys: ['ibnKathir', 'sahihMuslim'],
    tafsir: {
      'en':
          "From among the jinn and mankind. Ibn Kathir explains that evil whispering can come from both jinn (invisible beings) and humans who spread doubts, misguidance, and temptation. The Prophet ﷺ said there is a shaytan among jinn and a shaytan among humans. (Muslim). Reciting Al-Falaq and An-Nas together — called Al-Mu'awwidhatain — is a complete protection from both external and internal evil.",
      'ar':
          "من الجنة والناس. يوضح ابن كثير أن الوسوسة الشريرة قد تأتي من الجن (مخلوقات غير مرئية) ومن الإنس الذين ينشرون الشكوك والضلال والإغراء. وقد قال النبي ﷺ إن هناك شيطاناً من الجن وشيطاناً من الإنس. (مسلم). وقراءة سورتي الفلق والناس معاً - وتُسميان 'المعوذتين' - حماية كاملة من الشر الخارجي والداخلي معاً.",
      'ur':
          "جنوں اور انسانوں میں سے۔ ابن کثیر بیان کرتے ہیں کہ برا وسوسہ جنوں (غیر مرئی مخلوقات) اور انسانوں دونوں کی طرف سے آ سکتا ہے جو شکوک، گمراہی اور ترغیب پھیلاتے ہیں۔ نبی کریم ﷺ نے فرمایا کہ جنوں میں سے بھی شیطان ہے اور انسانوں میں سے بھی۔ (مسلم)۔ سورہ الفلق اور سورہ الناس کو ساتھ پڑھنا - جنہیں 'معوذتین' کہا جاتا ہے - بیرونی اور باطنی دونوں طرح کے شر سے مکمل حفاظت ہے۔",
      'es':
          "De entre los yinn y los hombres. Ibn Kathir explica que el susurro maligno puede provenir tanto de los yinn (seres invisibles) como de los humanos que difunden dudas, desviación y tentación. El Profeta ﷺ dijo que hay un shaytán entre los yinn y un shaytán entre los humanos. (Muslim). Recitar Al-Falaq y An-Nas juntas — llamadas Al-Mu'awwidhatain — es una protección completa contra el mal externo e interno.",
    },
  ),
];
