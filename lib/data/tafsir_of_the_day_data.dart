import '../models/surah_model.dart';

class DailyTafsirEntry {
  final Surah surah;
  final Map<String, String> introduction;
  final Map<String, List<String>> themes;

  const DailyTafsirEntry({
    required this.surah,
    required this.introduction,
    required this.themes,
  });

  String introText(String locale) => introduction[locale] ?? introduction['en']!;
  List<String> themeList(String locale) => themes[locale] ?? themes['en']!;
}

Surah _s(int n, String name, String en, String enTr, int ayahs, String rev) =>
    Surah(number: n, name: name, englishName: en, englishNameTranslation: enTr, numberOfAyahs: ayahs, revelationType: rev);

final List<DailyTafsirEntry> dailyTafsirEntries = [
  DailyTafsirEntry(
    surah: _s(1, 'سُورَةُ الْفَاتِحَة', 'Al-Faatiha', 'The Opening', 7, 'Meccan'),
    introduction: {
      'en': 'Al-Fatiha is the greatest surah in the Quran, as stated by the Prophet (peace be upon him). Ibn Kathir explains that it is called "The Opening" because the Quran begins with it, and prayers are opened with its recitation. It is also called Umm Al-Kitab (Mother of the Book) and Al-Sab\' Al-Mathani (The Seven Oft-Repeated Verses). It encompasses praise of Allah, affirmation of His Lordship, and a supplication for guidance to the straight path.',
      'ar': 'الفاتحة هي أعظم سورة في القرآن كما أخبر النبي ﷺ. يشرح ابن كثير أنها سُميت بالفاتحة لأن القرآن يُفتتح بها وتُفتتح بها الصلاة. وتُسمى أيضاً أم الكتاب والسبع المثاني. وهي تتضمن حمد الله وإثبات ربوبيته والدعاء بالهداية إلى الصراط المستقيم.',
      'es': 'Al-Fatiha es la sura más grande del Corán, como afirmó el Profeta (la paz sea con él). Ibn Kathir explica que se llama "La Apertura" porque el Corán comienza con ella y las oraciones se abren con su recitación. También se la llama Umm Al-Kitab (Madre del Libro). Abarca la alabanza a Allah, la afirmación de Su señorío y una súplica de guía al camino recto.',
      'ur': 'الفاتحہ قرآن کی سب سے عظیم سورت ہے جیسا کہ نبی ﷺ نے فرمایا۔ ابن کثیر بیان کرتے ہیں کہ اسے "الفاتحہ" اس لیے کہا جاتا ہے کیونکہ قرآن اس سے شروع ہوتا ہے اور نماز اس کی تلاوت سے کھولی جاتی ہے۔ اسے ام الکتاب اور سبع المثانی بھی کہا جاتا ہے۔',
    },
    themes: {
      'en': ['Praise and gratitude to Allah', 'Seeking guidance to the straight path', 'The distinction between those blessed and those astray', 'Foundation of the relationship between servant and Lord'],
      'ar': ['الحمد والشكر لله', 'طلب الهداية إلى الصراط المستقيم', 'التمييز بين المُنعم عليهم والضالين', 'أساس العلاقة بين العبد والرب'],
      'es': ['Alabanza y gratitud a Allah', 'Búsqueda de la guía al camino recto', 'Distinción entre los bendecidos y los extraviados', 'Fundamento de la relación entre siervo y Señor'],
      'ur': ['اللہ کی حمد و شکر', 'سیدھے راستے کی ہدایت کی دعا', 'نعمت والوں اور گمراہوں کی تمیز', 'بندے اور رب کے رشتے کی بنیاد'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(2, 'سُورَةُ البَقَرَة', 'Al-Baqara', 'The Cow', 286, 'Medinan'),
    introduction: {
      'en': 'Al-Baqara is the longest surah in the Quran. Ibn Kathir notes that it was revealed in Madinah and covers the foundations of Islamic legislation. It addresses the believers, hypocrites, and People of the Book. It contains Ayat Al-Kursi (the Verse of the Throne), the longest verse in the Quran about financial transactions, and the story of Ibrahim rebuilding the Ka\'bah. The Prophet said that Shaytan flees from the house in which Al-Baqara is recited.',
      'ar': 'البقرة هي أطول سورة في القرآن. يذكر ابن كثير أنها نزلت في المدينة وتتناول أسس التشريع الإسلامي. تخاطب المؤمنين والمنافقين وأهل الكتاب. وفيها آية الكرسي وأطول آية في القرآن عن المعاملات المالية وقصة إبراهيم في بناء الكعبة.',
      'es': 'Al-Baqara es la sura más larga del Corán. Ibn Kathir señala que fue revelada en Medina y cubre los fundamentos de la legislación islámica. Se dirige a los creyentes, hipócritas y la Gente del Libro. Contiene Ayat Al-Kursi (el Versículo del Trono) y la historia de Ibrahim reconstruyendo la Ka\'bah.',
      'ur': 'البقرہ قرآن کی سب سے طویل سورت ہے۔ ابن کثیر بیان کرتے ہیں کہ یہ مدینہ میں نازل ہوئی اور اسلامی قانون سازی کی بنیادیں بیان کرتی ہے۔ اس میں آیت الکرسی، مالی معاملات کی سب سے لمبی آیت اور ابراہیم علیہ السلام کی کعبہ تعمیر کی کہانی ہے۔',
    },
    themes: {
      'en': ['Foundations of Islamic law and guidance', 'The story of creation and Adam', 'Ayat Al-Kursi — the greatest verse', 'Patience, prayer, and trust in Allah\'s plan'],
      'ar': ['أسس الشريعة الإسلامية', 'قصة الخلق وآدم', 'آية الكرسي — أعظم آية', 'الصبر والصلاة والتوكل على الله'],
      'es': ['Fundamentos de la ley islámica', 'La historia de la creación y Adán', 'Ayat Al-Kursi — el versículo más grande', 'Paciencia, oración y confianza en Allah'],
      'ur': ['اسلامی شریعت کی بنیادیں', 'تخلیق اور آدم کی کہانی', 'آیت الکرسی — سب سے عظیم آیت', 'صبر، نماز اور اللہ پر بھروسا'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(3, 'سُورَةُ آلِ عِمْرَان', 'Aal-i-Imraan', 'The Family of Imran', 200, 'Medinan'),
    introduction: {
      'en': 'Aal-i-Imran was revealed in Madinah and centers on the family of Imran, including Maryam (Mary) and Isa (Jesus). Ibn Kathir explains it refutes Christian theological claims while honoring Isa as a prophet. It also covers the Battle of Uhud, patience in adversity, and the importance of unity among Muslims. The Prophet paired it with Al-Baqara, calling them "Az-Zahrawain" (the two bright ones).',
    },
    themes: {
      'en': ['The true nature of Prophet Isa (Jesus)', 'Lessons from the Battle of Uhud', 'Patience and steadfastness in trials', 'Unity of the Muslim Ummah'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(12, 'سُورَةُ يُوسُف', 'Yusuf', 'Joseph', 111, 'Meccan'),
    introduction: {
      'en': 'Surah Yusuf tells the most beautiful story in the Quran — the life of Prophet Yusuf (Joseph). Ibn Kathir details how this surah was revealed to comfort the Prophet Muhammad during a time of great sadness. It covers Yusuf\'s journey from being thrown into a well by his brothers, to being sold into slavery in Egypt, to resisting temptation, to imprisonment, and finally to becoming the minister of Egypt. It is a story of patience, trust in Allah, and ultimate triumph.',
    },
    themes: {
      'en': ['The beauty of patience (sabr) through hardship', 'Trust in Allah\'s plan even when things seem hopeless', 'Resisting temptation and maintaining righteousness', 'Forgiveness and family reconciliation'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(18, 'سُورَةُ الكَهْف', 'Al-Kahf', 'The Cave', 110, 'Meccan'),
    introduction: {
      'en': 'Al-Kahf contains four major stories that serve as protection from trials. Ibn Kathir explains the story of the Companions of the Cave (protection from trials of faith), the story of the man with two gardens (trials of wealth), the story of Musa and Al-Khidr (trials of knowledge), and the story of Dhul-Qarnayn (trials of power). The Prophet recommended reading it every Friday as a light between two Fridays.',
      'ar': 'سورة الكهف تحتوي على أربع قصص رئيسية تحمي من الفتن. يشرح ابن كثير قصة أصحاب الكهف (الحماية من فتنة الدين) وقصة صاحب الجنتين (فتنة المال) وقصة موسى والخضر (فتنة العلم) وقصة ذي القرنين (فتنة السلطة).',
      'es': 'Al-Kahf contiene cuatro historias principales que sirven como protección contra las pruebas. Ibn Kathir explica la historia de los Compañeros de la Cueva (protección contra pruebas de fe), el hombre con dos jardines (pruebas de riqueza), Musa y Al-Khidr (pruebas de conocimiento) y Dhul-Qarnayn (pruebas de poder).',
      'ur': 'سورۃ الکہف میں چار بڑی کہانیاں ہیں جو فتنوں سے حفاظت کا ذریعہ ہیں۔ ابن کثیر اصحاب کہف کی کہانی (ایمان کا فتنہ)، دو باغوں والے کی کہانی (مال کا فتنہ)، موسیٰ اور خضر کی کہانی (علم کا فتنہ) اور ذوالقرنین کی کہانی (طاقت کا فتنہ) بیان کرتے ہیں۔',
    },
    themes: {
      'en': ['Protection from the four great trials of life', 'The power of faith in the face of persecution', 'Humility in seeking knowledge', 'Reading Al-Kahf every Friday as a Sunnah'],
      'ar': ['الحماية من الفتن الأربع الكبرى', 'قوة الإيمان في مواجهة الاضطهاد', 'التواضع في طلب العلم', 'قراءة الكهف كل جمعة سنة'],
      'es': ['Protección contra las cuatro grandes pruebas', 'El poder de la fe ante la persecución', 'Humildad en la búsqueda del conocimiento', 'Leer Al-Kahf cada viernes como Sunnah'],
      'ur': ['زندگی کے چار بڑے فتنوں سے حفاظت', 'ظلم کے سامنے ایمان کی طاقت', 'علم حاصل کرنے میں عاجزی', 'ہر جمعہ الکہف پڑھنا سنت ہے'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(19, 'سُورَةُ مَرْيَم', 'Maryam', 'Mary', 98, 'Meccan'),
    introduction: {
      'en': 'Surah Maryam is named after the blessed mother of Prophet Isa (Jesus). Ibn Kathir explains it begins with the miraculous story of Zakariyya being granted a son (Yahya/John) in old age, then the even greater miracle of Maryam giving birth to Isa without a father. The surah powerfully refutes the claim that Allah has a son, declaring His absolute oneness. It also recounts stories of Ibrahim, Musa, Ismail, and Idris.',
    },
    themes: {
      'en': ['The miraculous birth of Isa (Jesus)', 'Allah\'s mercy to His righteous servants', 'The absolute oneness of Allah (Tawhid)', 'The virtue of Maryam as the best of women'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(24, 'سُورَةُ النُّور', 'An-Noor', 'The Light', 64, 'Medinan'),
    introduction: {
      'en': 'An-Noor (The Light) contains vital social legislation for the Muslim community. Ibn Kathir explains that it addresses modesty, the lowering of the gaze, the hijab, and the punishment for slander. It contains the famous "Verse of Light" (Ayat An-Nur) comparing Allah\'s guidance to a lamp in a niche. The surah establishes the principles of a morally upright society.',
    },
    themes: {
      'en': ['Modesty and lowering the gaze', 'The Light of Allah — Ayat An-Nur', 'Protection of honor and punishment for slander', 'Building a morally upright community'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(30, 'سُورَةُ الرُّوم', 'Ar-Room', 'The Romans', 60, 'Meccan'),
    introduction: {
      'en': 'Ar-Room opens with a prophecy that the Romans, after being defeated by the Persians, would be victorious within a few years — a prophecy that was fulfilled exactly as stated. Ibn Kathir highlights this as one of the Quran\'s miracles. The surah then reflects on the signs of Allah in creation: the heavens, the earth, the diversity of languages and colors, and the cycle of life and death.',
    },
    themes: {
      'en': ['A fulfilled Quranic prophecy — proof of divine origin', 'Signs of Allah in the natural world', 'The cycle of rise and fall of civilizations', 'Reflection on creation as worship'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(31, 'سُورَةُ لُقْمَان', 'Luqman', 'Luqman', 34, 'Meccan'),
    introduction: {
      'en': 'Surah Luqman is named after the wise man Luqman, whom Allah granted wisdom. Ibn Kathir explains that the heart of this surah is Luqman\'s advice to his son — a timeless parenting guide. He advises against shirk (associating partners with Allah), commands prayer, enjoins good conduct, warns against arrogance, and teaches moderation in speech. These verses are considered among the most beautiful parental advice in all of scripture.',
    },
    themes: {
      'en': ['Luqman\'s timeless parenting wisdom', 'The gravity of shirk (polytheism)', 'Gratitude to parents and to Allah', 'Modesty, humility, and good character'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(36, 'سُورَةُ يس', 'Ya-Sin', 'Ya-Sin', 83, 'Meccan'),
    introduction: {
      'en': 'Ya-Sin is called "the heart of the Quran" by the Prophet (peace be upon him). Ibn Kathir explains it addresses the three fundamentals of faith: Tawhid (oneness of Allah), Risalah (prophethood), and the Hereafter. It tells the story of the messengers sent to a city and the believing man who supported them. The surah contains powerful arguments for resurrection and signs of Allah in creation.',
      'ar': 'يس تُسمى قلب القرآن كما قال النبي ﷺ. يشرح ابن كثير أنها تتناول أسس الإيمان الثلاثة: التوحيد والرسالة والآخرة. وتروي قصة الرسل الذين أُرسلوا إلى قرية والرجل المؤمن الذي ناصرهم.',
      'es': 'Ya-Sin es llamada "el corazón del Corán" por el Profeta. Ibn Kathir explica que aborda los tres fundamentos de la fe: Tawhid (unicidad de Allah), Risalah (profecía) y el Más Allá. Cuenta la historia de los mensajeros enviados a una ciudad y el creyente que los apoyó.',
      'ur': 'یٰس کو نبی ﷺ نے قرآن کا دل کہا ہے۔ ابن کثیر بیان کرتے ہیں کہ یہ ایمان کی تین بنیادوں کو بیان کرتی ہے: توحید، رسالت اور آخرت۔ اس میں ایک شہر میں بھیجے گئے رسولوں اور ان کی مدد کرنے والے مومن کی کہانی ہے۔',
    },
    themes: {
      'en': ['The three pillars of faith: Tawhid, Prophethood, Hereafter', 'Courage in standing for truth', 'Signs of Allah in the natural world', 'The reality of resurrection'],
      'ar': ['أركان الإيمان الثلاثة: التوحيد والرسالة والآخرة', 'الشجاعة في الدفاع عن الحق', 'آيات الله في الطبيعة', 'حقيقة البعث'],
      'es': ['Los tres pilares de la fe: Tawhid, Profecía, Más Allá', 'Valentía en defender la verdad', 'Señales de Allah en la naturaleza', 'La realidad de la resurrección'],
      'ur': ['ایمان کے تین ستون: توحید، نبوت، آخرت', 'حق کی حمایت میں ہمت', 'فطرت میں اللہ کی نشانیاں', 'قیامت کی حقیقت'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(49, 'سُورَةُ الحُجُرَات', 'Al-Hujuraat', 'The Rooms', 18, 'Medinan'),
    introduction: {
      'en': 'Al-Hujuraat establishes the etiquette of the Muslim community. Ibn Kathir explains it teaches respect for the Prophet, verification of news before acting on it, reconciliation between disputing parties, and the prohibition of mockery, suspicion, spying, and backbiting. It declares that the most honored in Allah\'s sight is the most righteous, regardless of race or status.',
    },
    themes: {
      'en': ['Verify news before acting — don\'t spread rumors', 'The prohibition of mockery and backbiting', 'All humans are equal — only taqwa distinguishes', 'Etiquette of a healthy Muslim community'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(55, 'سُورَةُ الرَّحْمَن', 'Ar-Rahman', 'The Most Gracious', 78, 'Medinan'),
    introduction: {
      'en': 'Ar-Rahman is called "the Bride of the Quran" for its beauty. Ibn Kathir explains it enumerates the countless blessings of Allah upon humanity and jinn, repeatedly asking "Which of the favors of your Lord will you deny?" It describes the creation of humans from clay, the jinn from fire, the balance in nature, and the rewards of Paradise for those who fear Allah.',
      'ar': 'الرحمن تُلقب بعروس القرآن لجمالها. يشرح ابن كثير أنها تُعدد نعم الله على الإنس والجن متسائلة "فبأي آلاء ربكما تكذبان". تصف خلق الإنسان من طين والجن من نار والتوازن في الطبيعة وجزاء الجنة.',
      'es': 'Ar-Rahman es llamada "la Novia del Corán" por su belleza. Ibn Kathir explica que enumera las incontables bendiciones de Allah, preguntando repetidamente "¿Cuál de las mercedes de vuestro Señor negaréis?". Describe la creación, el equilibrio en la naturaleza y las recompensas del Paraíso.',
      'ur': 'الرحمٰن کو قرآن کی دلہن کہا جاتا ہے۔ ابن کثیر بیان کرتے ہیں کہ یہ اللہ کی بےشمار نعمتوں کو بیان کرتی ہے اور بار بار پوچھتی ہے "تم اپنے رب کی کون کون سی نعمتوں کو جھٹلاؤ گے"۔',
    },
    themes: {
      'en': ['Gratitude for Allah\'s countless blessings', 'The beauty and balance in creation', 'Accountability for humans and jinn', 'The rewards of Paradise for the righteous'],
      'ar': ['الشكر على نعم الله', 'جمال وتوازن الخلق', 'محاسبة الإنس والجن', 'جزاء الجنة للصالحين'],
      'es': ['Gratitud por las bendiciones de Allah', 'Belleza y equilibrio en la creación', 'Responsabilidad de humanos y yinn', 'Recompensas del Paraíso'],
      'ur': ['اللہ کی بےشمار نعمتوں کا شکر', 'تخلیق میں خوبصورتی اور توازن', 'انسانوں اور جنات کی جوابدہی', 'نیک لوگوں کے لیے جنت کا انعام'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(56, 'سُورَةُ الوَاقِعَة', 'Al-Waqi\'a', 'The Inevitable', 96, 'Meccan'),
    introduction: {
      'en': 'Al-Waqi\'a describes the Day of Judgment and divides humanity into three groups: the forerunners (As-Sabiqun), the companions of the right, and the companions of the left. Ibn Kathir explains it vividly describes the rewards of Paradise and the punishment of Hell. The Prophet said: "Whoever recites Surah Al-Waqi\'a every night will never be afflicted by poverty." It contains powerful reminders about death and the origin of creation.',
    },
    themes: {
      'en': ['The three groups of humanity on Judgment Day', 'Vivid descriptions of Paradise and Hellfire', 'Protection from poverty through regular recitation', 'Reflecting on death and our ultimate return to Allah'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(67, 'سُورَةُ المُلْك', 'Al-Mulk', 'The Sovereignty', 30, 'Meccan'),
    introduction: {
      'en': 'Al-Mulk is the surah that intercedes for its reciter in the grave. Ibn Kathir explains that the Prophet said it protects from the punishment of the grave and recommended reciting it every night before sleep. It opens by declaring Allah\'s sovereignty over all creation and the purpose of life and death as a test. It challenges disbelievers to reflect on the perfection of the heavens and the provision of Allah.',
      'ar': 'الملك هي السورة التي تشفع لقارئها في القبر. يشرح ابن كثير أن النبي ﷺ قال إنها تقي من عذاب القبر وأوصى بقراءتها كل ليلة. تفتتح بإعلان سيادة الله على الخلق والغرض من الحياة والموت كاختبار.',
      'es': 'Al-Mulk es la sura que intercede por quien la recita en la tumba. Ibn Kathir explica que el Profeta dijo que protege del castigo de la tumba y recomendó recitarla cada noche. Abre declarando la soberanía de Allah sobre toda la creación.',
      'ur': 'الملک وہ سورت ہے جو قبر میں اپنے پڑھنے والے کی شفاعت کرتی ہے۔ ابن کثیر بیان کرتے ہیں کہ نبی ﷺ نے فرمایا یہ عذاب قبر سے بچاتی ہے اور ہر رات پڑھنے کی تاکید فرمائی۔',
    },
    themes: {
      'en': ['Protection from the punishment of the grave', 'Life and death as a test from Allah', 'The perfection of Allah\'s creation', 'Nightly recitation as a Sunnah practice'],
      'ar': ['الحماية من عذاب القبر', 'الحياة والموت اختبار من الله', 'كمال خلق الله', 'قراءتها كل ليلة سنة نبوية'],
      'es': ['Protección del castigo de la tumba', 'La vida y la muerte como prueba de Allah', 'La perfección de la creación de Allah', 'Recitación nocturna como práctica Sunnah'],
      'ur': ['عذاب قبر سے حفاظت', 'زندگی اور موت اللہ کی آزمائش', 'اللہ کی تخلیق کا کمال', 'ہر رات پڑھنا سنت ہے'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(78, 'سُورَةُ النَّبَإ', 'An-Naba', 'The Tidings', 40, 'Meccan'),
    introduction: {
      'en': 'An-Naba opens the 30th Juz of the Quran. Ibn Kathir explains it addresses those who doubted the Day of Resurrection, asking "About what are they asking one another?" It answers by listing the signs of Allah\'s power: the earth made as a bed, mountains as stakes, the creation of pairs, night for rest and day for livelihood. It then gives a vivid description of the Day of Judgment and the consequences for deniers and believers.',
    },
    themes: {
      'en': ['The certainty of the Day of Resurrection', 'Signs of Allah\'s power in everyday creation', 'The consequences of denial vs. belief', 'The reward of gardens and companionship in Paradise'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(87, 'سُورَةُ الأَعْلَى', 'Al-A\'la', 'The Most High', 19, 'Meccan'),
    introduction: {
      'en': 'Al-A\'la was one of the Prophet\'s favorite surahs. Ibn Kathir explains that the Prophet used to recite it in the Eid prayers and the Friday prayer. It commands glorifying Allah by His highest name, reminds that Allah creates and guides all things, and promises that the Prophet will not forget the revelation. It concludes by reminding that success comes to those who purify their souls and remember their Lord.',
    },
    themes: {
      'en': ['Glorifying Allah Most High', 'The ease of the Quran — Allah makes it easy to remember', 'Purification of the soul leads to success', 'The superiority of the Hereafter over worldly life'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(93, 'سُورَةُ الضُّحَىٰ', 'Ad-Duhaa', 'The Morning Hours', 11, 'Meccan'),
    introduction: {
      'en': 'Ad-Duhaa was revealed during a period when revelation had paused and the Prophet was deeply distressed. Ibn Kathir explains that Allah comforted His Messenger, swearing by the morning light and the stillness of night that He had not abandoned him. It reminds the Prophet of Allah\'s past blessings: finding him an orphan and sheltering him, finding him lost and guiding him, finding him poor and enriching him. This surah is a powerful comfort for anyone going through difficulty.',
    },
    themes: {
      'en': ['Allah never abandons those who turn to Him', 'Comfort during dark times — relief always comes', 'Gratitude for past blessings as proof of future care', 'Kindness to orphans, seekers, and the needy'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(94, 'سُورَةُ الشَّرْح', 'Ash-Sharh', 'The Relief', 8, 'Meccan'),
    introduction: {
      'en': 'Ash-Sharh is a continuation of the comfort begun in Ad-Duhaa. Ibn Kathir explains that Allah expanded the Prophet\'s chest (filling it with light and wisdom), removed his burden, and raised his mention — so that whenever Allah is mentioned, Muhammad is mentioned alongside Him. The surah contains the famous promise: "Indeed, with hardship comes ease" — repeated twice for emphasis. It teaches that every difficulty carries within it the seed of relief.',
    },
    themes: {
      'en': ['With every hardship comes ease — a divine promise', 'Allah elevates those who carry His message', 'Turning to Allah in devotion after completing tasks', 'The expansion of the heart through faith'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(103, 'سُورَةُ العَصْر', 'Al-Asr', 'The Declining Day', 3, 'Meccan'),
    introduction: {
      'en': 'Al-Asr is one of the shortest yet most profound surahs. Imam Ash-Shafi\'i said: "If people reflected on this surah alone, it would be sufficient for them." Ibn Kathir explains that Allah swears by time that all of humanity is in loss — except those who have four qualities: faith, righteous deeds, encouraging each other toward truth, and encouraging each other toward patience. These four qualities form the complete roadmap to salvation.',
    },
    themes: {
      'en': ['The four conditions for salvation', 'The preciousness of time', 'Mutual encouragement toward truth and patience', 'A complete life philosophy in three verses'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(105, 'سُورَةُ الفِيل', 'Al-Fil', 'The Elephant', 5, 'Meccan'),
    introduction: {
      'en': 'Al-Fil recounts the miraculous event of the Year of the Elephant — the year the Prophet was born. Ibn Kathir explains that Abraha, the Abyssinian ruler of Yemen, marched with a great army and elephants to destroy the Ka\'bah. Allah sent flocks of birds (Ababil) carrying stones of baked clay that destroyed the entire army. This event demonstrated Allah\'s protection of His Sacred House and set the stage for the birth of the final Prophet.',
    },
    themes: {
      'en': ['Allah\'s miraculous protection of the Ka\'bah', 'The insignificance of worldly power before Allah', 'Divine intervention in defense of sacred places', 'A sign preceding the birth of the Prophet'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(108, 'سُورَةُ الكَوْثَر', 'Al-Kawthar', 'The Abundance', 3, 'Meccan'),
    introduction: {
      'en': 'Al-Kawthar is the shortest surah in the Quran. Ibn Kathir explains that Al-Kawthar is a river in Paradise granted exclusively to the Prophet. It was revealed to comfort him when his enemies mocked him for having no surviving sons. Allah declares that it is the Prophet\'s enemy who is "cut off" — without legacy — while Muhammad\'s legacy is eternal. It teaches that praying and sacrificing for Allah\'s sake is the response to those who wish ill.',
    },
    themes: {
      'en': ['Al-Kawthar — a river of Paradise for the Prophet', 'Allah\'s comfort in the face of mockery', 'Prayer and sacrifice as the believer\'s response', 'The eternal legacy of the Prophet Muhammad'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(109, 'سُورَةُ الكَافِرُون', 'Al-Kafirun', 'The Disbelievers', 6, 'Meccan'),
    introduction: {
      'en': 'Al-Kafirun establishes the principle of religious clarity. Ibn Kathir explains it was revealed when the Quraysh proposed that the Prophet worship their gods for a year and they would worship Allah for a year. Allah commanded a definitive rejection: "I do not worship what you worship, nor do you worship what I worship." The surah draws a clear line of Tawhid while declaring "to you your religion, and to me mine" — a statement of coexistence without compromise on faith.',
    },
    themes: {
      'en': ['Absolute clarity in matters of faith (Tawhid)', 'No compromise on worship of Allah alone', 'Coexistence without religious syncretism', 'Recommended to recite before sleep — a Sunnah'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(110, 'سُورَةُ النَّصْر', 'An-Nasr', 'The Divine Support', 3, 'Medinan'),
    introduction: {
      'en': 'An-Nasr was the last surah revealed to the Prophet. Ibn Kathir explains that it announced the approaching completion of his mission and hinted at his passing. When the conquest of Makkah came and people entered Islam in multitudes, the Prophet was commanded to glorify Allah and seek His forgiveness. Umar and Ibn Abbas understood this as a signal of the Prophet\'s approaching departure from this world.',
    },
    themes: {
      'en': ['The completion of the Prophet\'s mission', 'Victory belongs to Allah — glorify Him upon success', 'Seeking forgiveness at the height of achievement', 'The impermanence of life and the permanence of faith'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(112, 'سُورَةُ الإِخْلَاص', 'Al-Ikhlas', 'The Sincerity', 4, 'Meccan'),
    introduction: {
      'en': 'Al-Ikhlas is equivalent to one-third of the Quran in meaning. Ibn Kathir explains it was revealed when the polytheists asked the Prophet to describe his Lord. Allah responded with four verses that define pure monotheism (Tawhid): Allah is One, Allah is the Eternal Refuge (As-Samad), He begets not nor was He begotten, and there is nothing comparable to Him. The Prophet said that loving this surah will earn a person entry into Paradise.',
      'ar': 'الإخلاص تعادل ثلث القرآن في المعنى. يشرح ابن كثير أنها نزلت عندما سأل المشركون النبي ﷺ أن يصف ربه. فأجاب الله بأربع آيات تحدد التوحيد الخالص.',
      'es': 'Al-Ikhlas equivale a un tercio del Corán en significado. Ibn Kathir explica que fue revelada cuando los politeístas pidieron al Profeta que describiera a su Señor. Allah respondió con cuatro versículos que definen el monoteísmo puro (Tawhid).',
      'ur': 'الاخلاص معنی میں قرآن کے ایک تہائی کے برابر ہے۔ ابن کثیر بیان کرتے ہیں کہ یہ اس وقت نازل ہوئی جب مشرکوں نے نبی ﷺ سے کہا کہ اپنے رب کی صفت بیان کریں۔ اللہ نے چار آیات سے جواب دیا جو خالص توحید کی تعریف کرتی ہیں۔',
    },
    themes: {
      'en': ['Pure monotheism (Tawhid) in its simplest form', 'Allah is As-Samad — the Eternal Refuge', 'Equal to one-third of the Quran', 'A surah that guarantees Paradise for those who love it'],
      'ar': ['التوحيد الخالص في أبسط صوره', 'الله هو الصمد', 'تعادل ثلث القرآن', 'سورة تضمن الجنة لمن أحبها'],
      'es': ['Monoteísmo puro en su forma más simple', 'Allah es As-Samad — el Refugio Eterno', 'Equivale a un tercio del Corán', 'Una sura que garantiza el Paraíso para quien la ame'],
      'ur': ['خالص توحید اپنی سادہ ترین شکل میں', 'اللہ الصمد ہے — ابدی پناہ گاہ', 'قرآن کے ایک تہائی کے برابر', 'اس سورت سے محبت جنت کی ضمانت'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(113, 'سُورَةُ الفَلَق', 'Al-Falaq', 'The Daybreak', 5, 'Meccan'),
    introduction: {
      'en': 'Al-Falaq is one of the two surahs of protection (Al-Mu\'awwidhatayn). Ibn Kathir explains it teaches the believer to seek refuge in Allah from four evils: the evil of what He created, the evil of darkness as it settles, the evil of those who blow on knots (witchcraft), and the evil of an envier. The Prophet used to recite it along with An-Nas every night before sleep, blowing into his hands and wiping them over his body.',
    },
    themes: {
      'en': ['Seeking protection from evil through Allah', 'The reality of envy and witchcraft in Islam', 'Nightly recitation for protection — a Sunnah', 'Complete reliance on Allah as the ultimate protector'],
    },
  ),
  DailyTafsirEntry(
    surah: _s(114, 'سُورَةُ النَّاس', 'An-Naas', 'Mankind', 6, 'Meccan'),
    introduction: {
      'en': 'An-Nas is the final surah of the Quran and the second of the two surahs of protection. Ibn Kathir explains it teaches seeking refuge in Allah — as the Lord of mankind, the King of mankind, and the God of mankind — from the whisperer who retreats (Shaytan). The whisperer whispers into the hearts of people, and it comes from both jinn and humans. This surah is the ultimate spiritual shield against the invisible enemy.',
    },
    themes: {
      'en': ['Protection from the whispers of Shaytan', 'Allah as Lord, King, and God of all mankind', 'The nature of Shaytan\'s deception — he retreats when Allah is remembered', 'The Quran begins and ends with seeking Allah'],
    },
  ),
];

/// Returns the tafsir entry for today based on the day of the year.
DailyTafsirEntry getTodaysTafsir() {
  final now = DateTime.now();
  final dayOfYear = now.difference(DateTime(now.year)).inDays;
  return dailyTafsirEntries[dayOfYear % dailyTafsirEntries.length];
}
