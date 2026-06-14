/// One of the 99 Beautiful Names of Allah (Asma ul Husna).
class AsmaName {
  final int number;
  final String arabic;
  final String transliteration;
  final Map<String, String> meaning;
  final Map<String, String> explanation;

  const AsmaName({
    required this.number,
    required this.arabic,
    required this.transliteration,
    required this.meaning,
    required this.explanation,
  });

  /// Short translated meaning, e.g. "The Most Gracious".
  String meaningText(String locale) => meaning[locale] ?? meaning['en']!;

  /// Longer explanation of the name's significance.
  String explanationText(String locale) =>
      explanation[locale] ?? explanation['en']!;
}

const List<AsmaName> asmaUlHusnaNames = [
  AsmaName(
    number: 1,
    arabic: 'الرَّحْمَنُ',
    transliteration: 'Ar-Rahman',
    meaning: {
      'en': 'The Most Gracious',
      'ar': 'ذو الرحمة الواسعة لجميع الخلق',
      'ur': 'نہایت رحم کرنے والا',
      'es': 'El Sumamente Clemente',
    },
    explanation: {
      'en':
          "Allah's mercy encompasses all of creation, believers and non-believers alike, sustaining every living being with His boundless compassion.",
      'ar':
          'رحمة الله تشمل جميع المخلوقين، المؤمنين وغير المؤمنين، فهو يرزق كل كائن حي برحمته الواسعة.',
      'ur':
          'اللہ کی رحمت تمام مخلوقات کو شامل ہے، مومن ہوں یا غیر مومن، وہ اپنی وسیع رحمت سے ہر جاندار کو رزق دیتا ہے۔',
      'es':
          'La misericordia de Allah abarca a toda la creación, creyentes y no creyentes por igual, sustentando a cada ser vivo con Su compasión infinita.',
    },
  ),
  AsmaName(
    number: 2,
    arabic: 'الرَّحِيمُ',
    transliteration: 'Ar-Raheem',
    meaning: {
      'en': 'The Most Merciful',
      'ar': 'الرحيم بعباده المؤمنين خاصة',
      'ur': 'بہت رحم فرمانے والا',
      'es': 'El Muy Misericordioso',
    },
    explanation: {
      'en':
          'This mercy is reserved especially for the believers, both in this life and eternally in the Hereafter.',
      'ar':
          'هذه الرحمة خاصة بالمؤمنين، في الدنيا وعلى وجه الخصوص في الآخرة بشكل دائم.',
      'ur':
          'یہ رحمت خاص طور پر مومنوں کے لیے ہے، دنیا میں بھی اور آخرت میں ہمیشہ کے لیے بھی۔',
      'es':
          'Esta misericordia está reservada especialmente para los creyentes, tanto en esta vida como eternamente en el Más Allá.',
    },
  ),
  AsmaName(
    number: 3,
    arabic: 'الْمَلِكُ',
    transliteration: 'Al-Malik',
    meaning: {
      'en': 'The King',
      'ar': 'المالك المتصرف في كل شيء',
      'ur': 'بادشاہِ حقیقی',
      'es': 'El Rey',
    },
    explanation: {
      'en':
          'Allah is the true and absolute Sovereign of all creation, owning and controlling everything without need for any partner or minister.',
      'ar':
          'الله هو المالك الحقيقي والمطلق لكل الكون، يملك ويتصرف في كل شيء دون شريك أو وزير.',
      'ur':
          'اللہ تمام کائنات کا حقیقی اور مطلق بادشاہ ہے، وہ ہر چیز کا مالک ہے اور بغیر کسی شریک کے ہر چیز پر تصرف رکھتا ہے۔',
      'es':
          'Allah es el Soberano verdadero y absoluto de toda la creación, posee y controla todo sin necesidad de socio o ministro alguno.',
    },
  ),
  AsmaName(
    number: 4,
    arabic: 'الْقُدُّوسُ',
    transliteration: 'Al-Quddus',
    meaning: {
      'en': 'The Most Holy',
      'ar': 'المنزّه عن كل نقص وعيب',
      'ur': 'ہر عیب سے پاک',
      'es': 'El Santísimo',
    },
    explanation: {
      'en':
          'Allah is utterly free from any imperfection, flaw, or resemblance to His creation, perfectly pure in His essence and attributes.',
      'ar':
          'الله منزّه تمامًا عن أي نقص أو عيب أو مشابهة لخلقه، فهو كامل في ذاته وصفاته.',
      'ur':
          'اللہ ہر قسم کی کمی، عیب اور مخلوق سے مشابہت سے پاک ہے، وہ اپنی ذات اور صفات میں کامل ہے۔',
      'es':
          'Allah está completamente libre de toda imperfección, defecto o semejanza con Su creación; es perfecto en Su esencia y atributos.',
    },
  ),
  AsmaName(
    number: 5,
    arabic: 'السَّلَامُ',
    transliteration: 'As-Salam',
    meaning: {
      'en': 'The Source of Peace',
      'ar': 'السالم من كل عيب ومصدر السلام',
      'ur': 'سلامتی والا',
      'es': 'La Fuente de la Paz',
    },
    explanation: {
      'en':
          'Allah Himself is free from every defect, and He is the source from which all safety, peace, and well-being flow to His creation.',
      'ar':
          'الله سالم من كل عيب ونقص، وهو مصدر السلامة والأمان والطمأنينة لكل مخلوقاته.',
      'ur':
          'اللہ خود ہر عیب سے پاک ہے اور وہی اپنی مخلوق کے لیے سلامتی، امن اور سکون کا سرچشمہ ہے۔',
      'es':
          'Allah mismo está libre de todo defecto, y Él es la fuente de la cual fluyen toda seguridad, paz y bienestar hacia Su creación.',
    },
  ),
  AsmaName(
    number: 6,
    arabic: 'الْمُؤْمِنُ',
    transliteration: "Al-Mu'min",
    meaning: {
      'en': 'The Guardian of Faith',
      'ar': 'مانح الأمان والإيمان',
      'ur': 'امن دینے والا',
      'es': 'El Dador de Seguridad',
    },
    explanation: {
      'en':
          'Allah grants security to those who fear Him and instills faith in the hearts of believers, protecting them from injustice.',
      'ar':
          'الله يمنح الأمان لمن يخافه ويغرس الإيمان في قلوب المؤمنين ويحميهم من الظلم.',
      'ur':
          'اللہ اپنے سے ڈرنے والوں کو امن عطا کرتا ہے اور مومنوں کے دلوں میں ایمان پیدا کرتا ہے اور انہیں ظلم سے بچاتا ہے۔',
      'es':
          'Allah otorga seguridad a quienes Le temen e infunde fe en los corazones de los creyentes, protegiéndolos de la injusticia.',
    },
  ),
  AsmaName(
    number: 7,
    arabic: 'الْمُهَيْمِنُ',
    transliteration: 'Al-Muhaymin',
    meaning: {
      'en': 'The Protector',
      'ar': 'الرقيب الحافظ على كل شيء',
      'ur': 'نگہبان',
      'es': 'El Protector Supremo',
    },
    explanation: {
      'en':
          'Allah watches over and safeguards all of creation, witnessing every action and ensuring all affairs proceed according to His will.',
      'ar':
          'الله يراقب ويحفظ كل المخلوقات، يشهد كل عمل ويتأكد من سير جميع الأمور وفق إرادته.',
      'ur':
          'اللہ تمام مخلوقات کی نگرانی اور حفاظت کرتا ہے، ہر عمل کا گواہ ہے اور تمام معاملات اپنی مرضی کے مطابق چلاتا ہے۔',
      'es':
          'Allah vigila y protege toda la creación, es testigo de cada acción y se asegura de que todos los asuntos sigan Su voluntad.',
    },
  ),
  AsmaName(
    number: 8,
    arabic: 'الْعَزِيزُ',
    transliteration: 'Al-Aziz',
    meaning: {
      'en': 'The Almighty',
      'ar': 'العزيز الذي لا يُغلب',
      'ur': 'زبردست',
      'es': 'El Todopoderoso',
    },
    explanation: {
      'en':
          'Allah possesses absolute might and honor; nothing can overpower Him, and He grants honor or disgrace to whomever He wills.',
      'ar':
          'الله يملك العزة والقوة المطلقة، لا يغلبه شيء، ويعز من يشاء ويذل من يشاء.',
      'ur':
          'اللہ مکمل عزت اور طاقت کا مالک ہے، کوئی چیز اسے زیر نہیں کر سکتی، وہ جسے چاہے عزت دے اور جسے چاہے ذلیل کرے۔',
      'es':
          'Allah posee poder y honor absolutos; nada puede vencerlo, y otorga honor o deshonra a quien Él quiere.',
    },
  ),
  AsmaName(
    number: 9,
    arabic: 'الْجَبَّارُ',
    transliteration: 'Al-Jabbar',
    meaning: {
      'en': 'The Compeller',
      'ar': 'الجبار القاهر الذي يجبر الكسير',
      'ur': 'زبردست حکم چلانے والا',
      'es': 'El Compelente',
    },
    explanation: {
      'en':
          "Allah's will overcomes all resistance, and He mends what is broken, restoring the hearts of the brokenhearted and setting affairs right.",
      'ar':
          'إرادة الله تتغلب على كل مقاومة، وهو يجبر الكسير ويُصلح أحوال عباده.',
      'ur':
          'اللہ کی مرضی ہر مزاحمت پر غالب آتی ہے، وہ ٹوٹے دلوں کو جوڑتا ہے اور معاملات کو درست کرتا ہے۔',
      'es':
          'La voluntad de Allah vence toda resistencia, y Él repara lo que está roto, restaurando los corazones quebrantados y enderezando los asuntos.',
    },
  ),
  AsmaName(
    number: 10,
    arabic: 'الْمُتَكَبِّرُ',
    transliteration: 'Al-Mutakabbir',
    meaning: {
      'en': 'The Supreme',
      'ar': 'المتكبر صاحب الكبرياء والعظمة',
      'ur': 'بڑائی والا',
      'es': 'El Supremo',
    },
    explanation: {
      'en':
          "Allah alone deserves greatness and majesty in every sense; pride belongs to Him alone, far above any creature's arrogance.",
      'ar':
          'الله وحده يستحق العظمة والكبرياء على الإطلاق، فالكبرياء له وحده، وهو فوق كل تشبه بتكبر المخلوقين.',
      'ur':
          'اللہ ہی ہر لحاظ سے عظمت اور بڑائی کا حقدار ہے، بڑائی صرف اسی کے لیے ہے، وہ مخلوق کے تکبر سے بلند تر ہے۔',
      'es':
          'Solo Allah merece grandeza y majestad en todo sentido; el orgullo Le pertenece únicamente a Él, muy por encima de la arrogancia de cualquier criatura.',
    },
  ),
  AsmaName(
    number: 11,
    arabic: 'الْخَالِقُ',
    transliteration: 'Al-Khaliq',
    meaning: {
      'en': 'The Creator',
      'ar': 'الخالق المُبدع لكل شيء من العدم',
      'ur': 'پیدا کرنے والا',
      'es': 'El Creador',
    },
    explanation: {
      'en':
          'Allah brought all of existence into being from nothing, designing and creating every creature according to a precise plan.',
      'ar':
          'الله أوجد كل الكائنات من العدم، وقدّر وخلق كل مخلوق بحكمة ودقة.',
      'ur':
          'اللہ نے تمام مخلوقات کو عدم سے وجود میں لایا اور ہر چیز کو حکمت اور درستگی کے ساتھ پیدا کیا۔',
      'es':
          'Allah trajo toda la existencia desde la nada, diseñando y creando cada criatura según un plan preciso.',
    },
  ),
  AsmaName(
    number: 12,
    arabic: 'الْبَارِئُ',
    transliteration: 'Al-Bari',
    meaning: {
      'en': 'The Evolver',
      'ar': 'البارئ المنشئ بلا مثال سابق',
      'ur': 'بغیر نمونے کے بنانے والا',
      'es': 'El Originador',
    },
    explanation: {
      'en':
          'Allah originates each creation with a unique design, free from any flaw, giving every soul and species its distinct form.',
      'ar':
          'الله ينشئ كل مخلوق بتصميم فريد وخالٍ من العيوب، ويعطي كل نفس ونوع شكله المميز.',
      'ur':
          'اللہ ہر مخلوق کو منفرد ڈیزائن کے ساتھ، بغیر کسی عیب کے بناتا ہے اور ہر جان اور نوع کو اس کی الگ شکل دیتا ہے۔',
      'es':
          'Allah origina cada creación con un diseño único, libre de todo defecto, dando a cada alma y especie su forma distintiva.',
    },
  ),
  AsmaName(
    number: 13,
    arabic: 'الْمُصَوِّرُ',
    transliteration: 'Al-Musawwir',
    meaning: {
      'en': 'The Fashioner',
      'ar': 'المصور الذي يعطي كل مخلوق صورته',
      'ur': 'صورت بنانے والا',
      'es': 'El Formador',
    },
    explanation: {
      'en':
          'Allah shapes every creature in the womb and beyond, giving each its unique appearance, features, and characteristics.',
      'ar':
          'الله يصوّر كل مخلوق في الأرحام وغيرها، ويعطي كل واحد شكله وملامحه وصفاته الخاصة.',
      'ur':
          'اللہ ہر مخلوق کو رحمِ مادر میں اور اس کے علاوہ بھی صورت دیتا ہے اور ہر ایک کو اس کی منفرد شکل اور خصوصیات عطا کرتا ہے۔',
      'es':
          'Allah da forma a cada criatura en el vientre y más allá, otorgando a cada una su apariencia, rasgos y características únicas.',
    },
  ),
  AsmaName(
    number: 14,
    arabic: 'الْغَفَّارُ',
    transliteration: 'Al-Ghaffar',
    meaning: {
      'en': 'The Ever-Forgiving',
      'ar': 'الغفار الذي يغفر الذنوب مهما كثرت',
      'ur': 'بار بار معاف کرنے والا',
      'es': 'El Perdonador Constante',
    },
    explanation: {
      'en':
          'Allah repeatedly forgives the sins of His servants, no matter how often they fall short, for those who turn back to Him.',
      'ar':
          'الله يغفر ذنوب عباده مرارًا وتكرارًا مهما كثرت زلاتهم، لمن يتوب إليه ويرجع.',
      'ur':
          'اللہ اپنے بندوں کے گناہوں کو بار بار معاف کرتا ہے، چاہے وہ کتنی ہی بار کوتاہی کریں، بشرطیکہ وہ اس کی طرف رجوع کریں۔',
      'es':
          'Allah perdona repetidamente los pecados de Sus siervos, sin importar cuántas veces fallen, para quienes se vuelven hacia Él.',
    },
  ),
  AsmaName(
    number: 15,
    arabic: 'الْقَهَّارُ',
    transliteration: 'Al-Qahhar',
    meaning: {
      'en': 'The Subduer',
      'ar': 'القهار الغالب على كل شيء',
      'ur': 'زبردست غالب',
      'es': 'El Dominador Absoluto',
    },
    explanation: {
      'en':
          "Allah's power dominates over everything in existence; all creatures are utterly subdued and powerless before His will.",
      'ar':
          'قدرة الله تهيمن على كل شيء في الوجود، وكل المخلوقات خاضعة وعاجزة أمام إرادته.',
      'ur':
          'اللہ کی قدرت ہر چیز پر غالب ہے، تمام مخلوقات اس کی مرضی کے سامنے بے بس اور مغلوب ہیں۔',
      'es':
          'El poder de Allah domina todo lo existente; todas las criaturas están completamente sometidas e impotentes ante Su voluntad.',
    },
  ),
  AsmaName(
    number: 16,
    arabic: 'الْوَهَّابُ',
    transliteration: 'Al-Wahhab',
    meaning: {
      'en': 'The Bestower',
      'ar': 'الوهاب المعطي بلا مقابل',
      'ur': 'بے غرض عطا کرنے والا',
      'es': 'El Dador Generoso',
    },
    explanation: {
      'en':
          'Allah gives generously and continuously without expecting anything in return, granting blessings out of pure grace.',
      'ar':
          'الله يعطي بسخاء ودوام دون أن ينتظر مقابلاً، ويهب النعم من فضله المحض.',
      'ur':
          'اللہ بے غرض اور مسلسل سخاوت سے عطا کرتا ہے، نعمتیں اپنے فضل سے دیتا ہے بغیر کسی بدلے کی توقع کے۔',
      'es':
          'Allah da generosa y continuamente sin esperar nada a cambio, concediendo bendiciones por pura gracia.',
    },
  ),
  AsmaName(
    number: 17,
    arabic: 'الرَّزَّاقُ',
    transliteration: 'Ar-Razzaq',
    meaning: {
      'en': 'The Provider',
      'ar': 'الرزاق الذي يرزق كل مخلوق',
      'ur': 'رزق دینے والا',
      'es': 'El Proveedor',
    },
    explanation: {
      'en':
          'Allah provides sustenance for every living creature on earth, ensuring no soul is left without its decreed provision.',
      'ar':
          'الله يرزق كل كائن حي على الأرض، ولا يترك نفسًا بدون رزقها المقدر.',
      'ur':
          'اللہ زمین پر ہر جاندار کو رزق دیتا ہے اور کوئی جان اپنے مقررہ رزق سے محروم نہیں رہتی۔',
      'es':
          'Allah provee sustento a cada criatura viviente en la tierra, asegurando que ningún alma quede sin su provisión decretada.',
    },
  ),
  AsmaName(
    number: 18,
    arabic: 'الْفَتَّاحُ',
    transliteration: 'Al-Fattah',
    meaning: {
      'en': 'The Opener',
      'ar': 'الفتاح الحاكم الذي يفتح أبواب الرحمة',
      'ur': 'فیصلہ کرنے اور کھولنے والا',
      'es': 'El Abridor',
    },
    explanation: {
      'en':
          'Allah opens the doors of mercy, guidance, and provision for His servants, and judges between people with perfect justice.',
      'ar':
          'الله يفتح أبواب الرحمة والهداية والرزق لعباده، ويحكم بين الناس بالعدل التام.',
      'ur':
          'اللہ اپنے بندوں کے لیے رحمت، ہدایت اور رزق کے دروازے کھولتا ہے اور لوگوں کے درمیان مکمل انصاف سے فیصلہ کرتا ہے۔',
      'es':
          'Allah abre las puertas de la misericordia, la guía y el sustento para Sus siervos, y juzga entre las personas con perfecta justicia.',
    },
  ),
  AsmaName(
    number: 19,
    arabic: 'الْعَلِيمُ',
    transliteration: 'Al-Alim',
    meaning: {
      'en': 'The All-Knowing',
      'ar': 'العليم المحيط علمه بكل شيء',
      'ur': 'ہر چیز کا علم رکھنے والا',
      'es': 'El Omnisciente',
    },
    explanation: {
      'en':
          "Allah's knowledge encompasses everything, the seen and unseen, past, present, and future, down to the smallest detail.",
      'ar':
          'علم الله محيط بكل شيء، الظاهر والباطن، الماضي والحاضر والمستقبل، إلى أدق التفاصيل.',
      'ur':
          'اللہ کا علم ہر چیز کا احاطہ کیے ہوئے ہے، ظاہر و باطن، ماضی، حال اور مستقبل، چھوٹی سے چھوٹی تفصیل تک۔',
      'es':
          'El conocimiento de Allah abarca todo, lo visible y lo oculto, el pasado, presente y futuro, hasta el más mínimo detalle.',
    },
  ),
  AsmaName(
    number: 20,
    arabic: 'الْقَابِضُ',
    transliteration: 'Al-Qabid',
    meaning: {
      'en': 'The Withholder',
      'ar': 'القابض الذي يقبض الأرزاق والأرواح',
      'ur': 'تنگی کرنے والا',
      'es': 'El Restrictor',
    },
    explanation: {
      'en':
          'Allah restricts provision, sustenance, or the soul as He wills, with perfect wisdom, often as a test or mercy.',
      'ar':
          'الله يقبض الرزق أو الأرواح بحكمته البالغة، وذلك أحيانًا اختبارًا أو رحمة.',
      'ur':
          'اللہ اپنی کامل حکمت کے ساتھ رزق یا روحیں روکتا ہے، جو کبھی آزمائش اور کبھی رحمت ہوتی ہے۔',
      'es':
          'Allah restringe el sustento o el alma según Su voluntad, con perfecta sabiduría, a menudo como prueba o misericordia.',
    },
  ),
  AsmaName(
    number: 21,
    arabic: 'الْبَاسِطُ',
    transliteration: 'Al-Basit',
    meaning: {
      'en': 'The Expander',
      'ar': 'الباسط الذي يوسع الرزق والأرواح',
      'ur': 'کشادگی دینے والا',
      'es': 'El Expansor',
    },
    explanation: {
      'en':
          'Allah expands provision, mercy, and the soul for whomever He wills, opening doors of ease after hardship.',
      'ar':
          'الله يوسع الرزق والرحمة والنفس لمن يشاء، ويفتح أبواب اليسر بعد العسر.',
      'ur':
          'اللہ جس کے لیے چاہے رزق، رحمت اور دل کشادہ کر دیتا ہے اور تنگی کے بعد آسانی کے دروازے کھولتا ہے۔',
      'es':
          'Allah expande el sustento, la misericordia y el alma de quien Él quiere, abriendo puertas de alivio después de la dificultad.',
    },
  ),
  AsmaName(
    number: 22,
    arabic: 'الْخَافِضُ',
    transliteration: 'Al-Khafid',
    meaning: {
      'en': 'The Abaser',
      'ar': 'الخافض الذي يخفض الجبارين',
      'ur': 'پست کرنے والا',
      'es': 'El Humillador',
    },
    explanation: {
      'en':
          'Allah lowers the arrogant and tyrants, bringing down those who exalt themselves unjustly above others.',
      'ar':
          'الله يخفض المتكبرين والطغاة، ويذل من يتعالى على الناس ظلمًا.',
      'ur':
          'اللہ متکبروں اور ظالموں کو پست کرتا ہے اور ان لوگوں کو نیچا دکھاتا ہے جو ناحق دوسروں پر برتری جتاتے ہیں۔',
      'es':
          'Allah humilla a los soberbios y tiranos, derribando a quienes se exaltan injustamente sobre los demás.',
    },
  ),
  AsmaName(
    number: 23,
    arabic: 'الرَّافِعُ',
    transliteration: 'Ar-Rafi',
    meaning: {
      'en': 'The Exalter',
      'ar': 'الرافع الذي يرفع المؤمنين',
      'ur': 'بلند کرنے والا',
      'es': 'El Exaltador',
    },
    explanation: {
      'en':
          'Allah raises the ranks of the righteous and humble, elevating those who submit sincerely to Him.',
      'ar':
          'الله يرفع درجات الصالحين والمتواضعين، ويعلي شأن من يخلص له.',
      'ur':
          'اللہ نیک اور عاجز لوگوں کے درجات بلند کرتا ہے اور جو اس کے سامنے خلوص سے جھکتے ہیں انہیں عزت دیتا ہے۔',
      'es':
          'Allah eleva el rango de los justos y humildes, ensalzando a quienes se someten sinceramente a Él.',
    },
  ),
  AsmaName(
    number: 24,
    arabic: 'الْمُعِزُّ',
    transliteration: "Al-Mu'izz",
    meaning: {
      'en': 'The Honourer',
      'ar': 'المعز الذي يهب العزة',
      'ur': 'عزت دینے والا',
      'es': 'El Honrador',
    },
    explanation: {
      'en':
          'Allah grants honor and dignity to whomever He chooses, regardless of worldly status or lineage.',
      'ar':
          'الله يمنح العزة والكرامة لمن يشاء، بغض النظر عن المكانة الدنيوية أو النسب.',
      'ur':
          'اللہ جسے چاہے عزت اور وقار عطا کرتا ہے، چاہے دنیاوی حیثیت یا نسب کچھ بھی ہو۔',
      'es':
          'Allah otorga honor y dignidad a quien Él elige, sin importar el estatus mundano o el linaje.',
    },
  ),
  AsmaName(
    number: 25,
    arabic: 'الْمُذِلُّ',
    transliteration: 'Al-Mudhill',
    meaning: {
      'en': 'The Humiliator',
      'ar': 'المذل الذي يهين من يشاء بعدله',
      'ur': 'ذلیل کرنے والا',
      'es': 'El Deshonrador',
    },
    explanation: {
      'en':
          'Allah brings disgrace upon those who turn away from Him in arrogance, by His perfect justice and wisdom.',
      'ar':
          'الله يذل من يعرض عنه متكبرًا، بعدله وحكمته البالغة.',
      'ur':
          'اللہ ان لوگوں کو ذلیل کرتا ہے جو تکبر کے ساتھ اس سے روگردانی کرتے ہیں، اپنے کامل عدل اور حکمت کے ساتھ۔',
      'es':
          'Allah trae deshonra sobre quienes se alejan de Él con arrogancia, por Su perfecta justicia y sabiduría.',
    },
  ),
  AsmaName(
    number: 26,
    arabic: 'السَّمِيعُ',
    transliteration: 'As-Sami',
    meaning: {
      'en': 'The All-Hearing',
      'ar': 'السميع الذي يسمع كل شيء',
      'ur': 'سب کچھ سننے والا',
      'es': 'El que Todo lo Oye',
    },
    explanation: {
      'en':
          'Allah hears every sound, spoken or silent, including the quiet whispers of the heart and prayers of every soul.',
      'ar':
          'الله يسمع كل صوت، الجهر منه والخفي، حتى وساوس القلوب ودعاء كل نفس.',
      'ur':
          'اللہ ہر آواز سنتا ہے، چاہے ظاہر ہو یا خفیہ، یہاں تک کہ دل کی سرگوشیاں اور ہر جان کی دعا بھی۔',
      'es':
          'Allah escucha cada sonido, dicho o silencioso, incluyendo los susurros silenciosos del corazón y las súplicas de cada alma.',
    },
  ),
  AsmaName(
    number: 27,
    arabic: 'الْبَصِيرُ',
    transliteration: 'Al-Basir',
    meaning: {
      'en': 'The All-Seeing',
      'ar': 'البصير الذي يرى كل شيء',
      'ur': 'سب کچھ دیکھنے والا',
      'es': 'El que Todo lo Ve',
    },
    explanation: {
      'en':
          'Allah sees everything, even the smallest movement of an ant on a dark night, with perfect and complete vision.',
      'ar':
          'الله يرى كل شيء، حتى دبيب النملة في الليلة الظلماء، برؤية كاملة لا تخطئ.',
      'ur':
          'اللہ ہر چیز دیکھتا ہے، حتیٰ کہ تاریک رات میں چیونٹی کی حرکت بھی، اس کی نظر مکمل اور کامل ہے۔',
      'es':
          'Allah ve todo, incluso el más mínimo movimiento de una hormiga en una noche oscura, con visión perfecta y completa.',
    },
  ),
  AsmaName(
    number: 28,
    arabic: 'الْحَكَمُ',
    transliteration: 'Al-Hakam',
    meaning: {
      'en': 'The Judge',
      'ar': 'الحكم الفاصل بين الخلق بالحق',
      'ur': 'فیصلہ کرنے والا',
      'es': 'El Juez',
    },
    explanation: {
      'en':
          'Allah is the ultimate Judge whose rulings between His creation are final, perfectly just, and beyond appeal.',
      'ar':
          'الله هو الحكم الأخير الذي أحكامه بين خلقه نهائية وعادلة تمامًا ولا يُعترض عليها.',
      'ur':
          'اللہ حتمی منصف ہے جس کے فیصلے اس کی مخلوق کے درمیان آخری، مکمل طور پر منصفانہ اور ناقابلِ اعتراض ہیں۔',
      'es':
          'Allah es el Juez supremo cuyas decisiones entre Su creación son finales, perfectamente justas e inapelables.',
    },
  ),
  AsmaName(
    number: 29,
    arabic: 'الْعَدْلُ',
    transliteration: 'Al-Adl',
    meaning: {
      'en': 'The Just',
      'ar': 'العدل الذي لا يظلم أحداً',
      'ur': 'انصاف کرنے والا',
      'es': 'El Justo',
    },
    explanation: {
      'en':
          "Allah's justice is absolute and perfect; He never wrongs anyone, even by the weight of an atom.",
      'ar':
          'عدل الله مطلق وكامل، فهو لا يظلم أحدًا ولو بمقدار ذرة.',
      'ur':
          'اللہ کا عدل مطلق اور کامل ہے، وہ کسی پر ذرہ برابر بھی ظلم نہیں کرتا۔',
      'es':
          'La justicia de Allah es absoluta y perfecta; nunca perjudica a nadie, ni siquiera en el peso de un átomo.',
    },
  ),
  AsmaName(
    number: 30,
    arabic: 'اللَّطِيفُ',
    transliteration: 'Al-Latif',
    meaning: {
      'en': 'The Subtle One',
      'ar': 'اللطيف العالم بدقائق الأمور',
      'ur': 'باریک بین مہربان',
      'es': 'El Sutil',
    },
    explanation: {
      'en':
          'Allah is aware of the finest details of every matter and is gentle and kind to His servants in subtle, often unseen ways.',
      'ar':
          'الله عالم بأدق تفاصيل كل أمر، ولطيف بعباده برفق وكرم غالبًا بطرق خفية لا يلاحظونها.',
      'ur':
          'اللہ ہر معاملے کی باریک سے باریک تفصیل جانتا ہے اور اپنے بندوں پر نرمی اور مہربانی کرتا ہے، اکثر ایسے طریقوں سے جو نظر نہیں آتے۔',
      'es':
          'Allah conoce los detalles más finos de cada asunto y es gentil y bondadoso con Sus siervos de maneras sutiles, a menudo invisibles.',
    },
  ),
  AsmaName(
    number: 31,
    arabic: 'الْخَبِيرُ',
    transliteration: 'Al-Khabir',
    meaning: {
      'en': 'The All-Aware',
      'ar': 'الخبير المطلع على بواطن الأمور',
      'ur': 'باخبر',
      'es': 'El Bien Informado',
    },
    explanation: {
      'en':
          'Allah is fully aware of the hidden realities and inner workings of all things; nothing escapes His knowledge.',
      'ar':
          'الله مطلع تمامًا على بواطن الأمور وحقائقها الخفية، ولا يفوته شيء من علمه.',
      'ur':
          'اللہ ہر چیز کی پوشیدہ حقیقتوں اور باطنی معاملات سے پوری طرح باخبر ہے، کوئی چیز اس کے علم سے باہر نہیں۔',
      'es':
          'Allah está completamente al tanto de las realidades ocultas y el funcionamiento interno de todas las cosas; nada escapa a Su conocimiento.',
    },
  ),
  AsmaName(
    number: 32,
    arabic: 'الْحَلِيمُ',
    transliteration: 'Al-Halim',
    meaning: {
      'en': 'The Forbearing',
      'ar': 'الحليم الذي لا يعاجل بالعقوبة',
      'ur': 'بردبار',
      'es': 'El Indulgente',
    },
    explanation: {
      'en':
          'Allah is patient with the disobedience of His creation, delaying punishment to give people time to repent.',
      'ar':
          'الله يتحمل عصيان خلقه ولا يعاجلهم بالعقوبة، ليمنحهم فرصة للتوبة.',
      'ur':
          'اللہ اپنی مخلوق کی نافرمانی پر تحمل کرتا ہے اور سزا میں جلدی نہیں کرتا تاکہ لوگوں کو توبہ کا موقع ملے۔',
      'es':
          'Allah es paciente con la desobediencia de Su creación, retrasando el castigo para dar a las personas tiempo de arrepentirse.',
    },
  ),
  AsmaName(
    number: 33,
    arabic: 'الْعَظِيمُ',
    transliteration: 'Al-Azim',
    meaning: {
      'en': 'The Magnificent',
      'ar': 'العظيم الذي لا أعظم منه',
      'ur': 'عظمت والا',
      'es': 'El Magnífico',
    },
    explanation: {
      'en':
          "Allah's greatness is beyond comprehension; nothing in existence compares to His majesty and immense power.",
      'ar':
          'عظمة الله فوق كل إدراك، ولا شيء في الوجود يضاهي جلاله وقدرته العظيمة.',
      'ur':
          'اللہ کی عظمت ادراک سے باہر ہے، کائنات میں کوئی چیز اس کی شان اور بے پایاں قدرت کا مقابلہ نہیں کر سکتی۔',
      'es':
          'La grandeza de Allah está más allá de toda comprensión; nada en la existencia se compara con Su majestad e inmenso poder.',
    },
  ),
  AsmaName(
    number: 34,
    arabic: 'الْغَفُورُ',
    transliteration: 'Al-Ghafur',
    meaning: {
      'en': 'The Forgiving',
      'ar': 'الغفور الساتر للذنوب',
      'ur': 'گناہ معاف کرنے والا',
      'es': 'El Perdonador',
    },
    explanation: {
      'en':
          'Allah covers and conceals the sins of His servants while forgiving them, sparing them from disgrace.',
      'ar':
          'الله يستر ذنوب عباده ويغفرها، فيقيهم العار والفضيحة.',
      'ur':
          'اللہ اپنے بندوں کے گناہوں کو چھپاتا ہے اور انہیں معاف کرتا ہے، اور انہیں رسوائی سے بچاتا ہے۔',
      'es':
          'Allah cubre y oculta los pecados de Sus siervos mientras los perdona, librándolos de la deshonra.',
    },
  ),
  AsmaName(
    number: 35,
    arabic: 'الشَّكُورُ',
    transliteration: 'Ash-Shakur',
    meaning: {
      'en': 'The Appreciative',
      'ar': 'الشكور الذي يجازي على القليل بالكثير',
      'ur': 'قدر کرنے والا',
      'es': 'El Agradecido',
    },
    explanation: {
      'en':
          'Allah rewards even small good deeds abundantly and multiplies the reward for sincere acts of worship.',
      'ar':
          'الله يجازي على العمل القليل بالأجر الكثير، ويضاعف ثواب العبادات المخلصة.',
      'ur':
          'اللہ چھوٹے سے چھوٹے نیک عمل پر بھی بہت زیادہ اجر دیتا ہے اور خالص عبادتوں کا ثواب کئی گنا بڑھا دیتا ہے۔',
      'es':
          'Allah recompensa abundantemente incluso las pequeñas buenas acciones y multiplica la recompensa de los actos sinceros de adoración.',
    },
  ),
  AsmaName(
    number: 36,
    arabic: 'الْعَلِيُّ',
    transliteration: 'Al-Ali',
    meaning: {
      'en': 'The Most High',
      'ar': 'العلي المتعالي عن الخلق',
      'ur': 'سب سے بلند',
      'es': 'El Altísimo',
    },
    explanation: {
      'en':
          'Allah is exalted above all of creation in His essence, power, and majesty, with nothing comparable to Him.',
      'ar':
          'الله متعالٍ عن خلقه في ذاته وقدرته وعظمته، ولا شيء يماثله.',
      'ur':
          'اللہ اپنی ذات، قدرت اور عظمت میں اپنی تمام مخلوق سے بلند تر ہے، اور کوئی چیز اس کے مثل نہیں۔',
      'es':
          'Allah está exaltado por encima de toda la creación en Su esencia, poder y majestad, sin nada comparable a Él.',
    },
  ),
  AsmaName(
    number: 37,
    arabic: 'الْكَبِيرُ',
    transliteration: 'Al-Kabir',
    meaning: {
      'en': 'The Greatest',
      'ar': 'الكبير الذي كل شيء دونه',
      'ur': 'سب سے بڑا',
      'es': 'El Más Grande',
    },
    explanation: {
      'en':
          'Allah is greater than everything in existence; all creation is small and insignificant before His magnitude.',
      'ar':
          'الله أكبر من كل شيء في الوجود، وكل المخلوقات صغيرة وحقيرة أمام عظمته.',
      'ur':
          'اللہ کائنات کی ہر چیز سے بڑا ہے، تمام مخلوقات اس کی عظمت کے سامنے چھوٹی اور حقیر ہیں۔',
      'es':
          'Allah es más grande que todo lo existente; toda la creación es pequeña e insignificante ante Su magnitud.',
    },
  ),
  AsmaName(
    number: 38,
    arabic: 'الْحَفِيظُ',
    transliteration: 'Al-Hafiz',
    meaning: {
      'en': 'The Preserver',
      'ar': 'الحفيظ الذي يحفظ كل شيء',
      'ur': 'حفاظت کرنے والا',
      'es': 'El Preservador',
    },
    explanation: {
      'en':
          'Allah preserves and protects His creation, the heavens, the earth, and the deeds of every soul, from loss or harm.',
      'ar':
          'الله يحفظ ويحمي مخلوقاته والسماوات والأرض وأعمال كل نفس من الضياع أو الأذى.',
      'ur':
          'اللہ اپنی مخلوق، آسمانوں، زمین اور ہر جان کے اعمال کو ضائع ہونے یا نقصان سے محفوظ رکھتا ہے۔',
      'es':
          'Allah preserva y protege Su creación, los cielos, la tierra y las obras de cada alma, de la pérdida o el daño.',
    },
  ),
  AsmaName(
    number: 39,
    arabic: 'الْمُقِيتُ',
    transliteration: 'Al-Muqit',
    meaning: {
      'en': 'The Sustainer',
      'ar': 'المقيت الذي يعطي القوت',
      'ur': 'روزی پہنچانے والا',
      'es': 'El Sustentador',
    },
    explanation: {
      'en':
          'Allah provides the nourishment and means needed for every creature to survive and thrive in this world.',
      'ar':
          'الله يوفر القوت والوسائل التي يحتاجها كل مخلوق ليعيش ويزدهر في هذه الدنيا.',
      'ur':
          'اللہ ہر مخلوق کو زندہ رہنے اور پھلنے پھولنے کے لیے ضروری خوراک اور وسائل فراہم کرتا ہے۔',
      'es':
          'Allah proporciona el alimento y los medios necesarios para que cada criatura sobreviva y prospere en este mundo.',
    },
  ),
  AsmaName(
    number: 40,
    arabic: 'الْحَسِيبُ',
    transliteration: 'Al-Hasib',
    meaning: {
      'en': 'The Reckoner',
      'ar': 'الحسيب الذي يحاسب الخلق على أعمالهم',
      'ur': 'حساب لینے والا',
      'es': 'El Contador',
    },
    explanation: {
      'en':
          'Allah is sufficient for His servants and will hold every soul accountable for its deeds with perfect precision.',
      'ar':
          'الله كافٍ لعباده، وسيحاسب كل نفس على أعمالها بدقة تامة.',
      'ur':
          'اللہ اپنے بندوں کے لیے کافی ہے اور ہر جان کا اس کے اعمال پر مکمل درستگی کے ساتھ حساب لے گا۔',
      'es':
          'Allah es suficiente para Sus siervos y pedirá cuentas a cada alma por sus actos con perfecta precisión.',
    },
  ),
  AsmaName(
    number: 41,
    arabic: 'الْجَلِيلُ',
    transliteration: 'Al-Jalil',
    meaning: {
      'en': 'The Majestic',
      'ar': 'الجليل صاحب الجلال والعظمة',
      'ur': 'جلال والا',
      'es': 'El Majestuoso',
    },
    explanation: {
      'en':
          'Allah possesses absolute majesty and grandeur, deserving of the deepest reverence and awe from all His creation.',
      'ar':
          'الله يملك الجلال والعظمة المطلقة، ويستحق أعمق التعظيم والإجلال من كل خلقه.',
      'ur':
          'اللہ مطلق جلال اور عظمت کا مالک ہے اور اپنی تمام مخلوق کی طرف سے گہری تعظیم اور احترام کا حقدار ہے۔',
      'es':
          'Allah posee majestad y grandeza absolutas, mereciendo la más profunda reverencia y asombro de toda Su creación.',
    },
  ),
  AsmaName(
    number: 42,
    arabic: 'الْكَرِيمُ',
    transliteration: 'Al-Karim',
    meaning: {
      'en': 'The Generous',
      'ar': 'الكريم الجواد المعطي بلا حساب',
      'ur': 'بہت کرم کرنے والا',
      'es': 'El Generoso',
    },
    explanation: {
      'en':
          'Allah gives generously and graciously, overlooking faults and bestowing favors that exceed what His servants deserve.',
      'ar':
          'الله يعطي بكرم وسخاء، ويتجاوز عن الأخطاء، ويمنح من الفضل ما يفوق استحقاق عباده.',
      'ur':
          'اللہ نہایت سخاوت اور کرم سے عطا کرتا ہے، خطاؤں سے درگزر کرتا ہے اور اپنے بندوں کے استحقاق سے بڑھ کر نوازتا ہے۔',
      'es':
          'Allah da con generosidad y gracia, pasando por alto las faltas y otorgando favores que exceden lo que merecen Sus siervos.',
    },
  ),
  AsmaName(
    number: 43,
    arabic: 'الرَّقِيبُ',
    transliteration: 'Ar-Raqib',
    meaning: {
      'en': 'The Watchful',
      'ar': 'الرقيب المراقب لكل شيء',
      'ur': 'نگران',
      'es': 'El Vigilante',
    },
    explanation: {
      'en':
          'Allah constantly observes every soul, its intentions and actions, never an instant unaware of what occurs.',
      'ar':
          'الله يراقب كل نفس باستمرار، نياتها وأعمالها، فلا تغيب عنه لحظة واحدة.',
      'ur':
          'اللہ ہر جان اور اس کی نیتوں اور اعمال کی مسلسل نگرانی کرتا ہے، ایک لمحہ بھی اس سے غافل نہیں ہوتا۔',
      'es':
          'Allah observa constantemente a cada alma, sus intenciones y acciones, sin perder de vista ni un instante lo que ocurre.',
    },
  ),
  AsmaName(
    number: 44,
    arabic: 'الْمُجِيبُ',
    transliteration: 'Al-Mujib',
    meaning: {
      'en': 'The Responsive',
      'ar': 'المجيب الذي يستجيب الدعاء',
      'ur': 'دعا قبول کرنے والا',
      'es': 'El que Responde',
    },
    explanation: {
      'en':
          'Allah answers the prayers and supplications of His servants, responding to their calls in the way and time that is best for them.',
      'ar':
          'الله يستجيب دعاء عباده، ويرد على ندائهم بالطريقة والوقت الأنسب لهم.',
      'ur':
          'اللہ اپنے بندوں کی دعائیں سنتا اور قبول کرتا ہے اور ان کی پکار کا جواب اس طریقے اور وقت پر دیتا ہے جو ان کے لیے بہترین ہو۔',
      'es':
          'Allah responde a las oraciones y súplicas de Sus siervos, respondiendo a sus llamados de la manera y en el momento que es mejor para ellos.',
    },
  ),
  AsmaName(
    number: 45,
    arabic: 'الْوَاسِعُ',
    transliteration: 'Al-Wasi',
    meaning: {
      'en': 'The All-Encompassing',
      'ar': 'الواسع الذي وسع علمه ورحمته كل شيء',
      'ur': 'وسعت والا',
      'es': 'El Omniabarcante',
    },
    explanation: {
      'en':
          "Allah's knowledge, mercy, and provision are vast beyond limit, encompassing all needs and reaching every corner of creation.",
      'ar':
          'علم الله ورحمته ورزقه واسعة بلا حدود، تشمل كل الحاجات وتصل إلى كل ركن من أركان الخلق.',
      'ur':
          'اللہ کا علم، رحمت اور رزق بے حد وسیع ہے، جو ہر ضرورت کو شامل ہے اور مخلوق کے ہر گوشے تک پہنچتا ہے۔',
      'es':
          'El conocimiento, la misericordia y el sustento de Allah son vastos sin límite, abarcando todas las necesidades y llegando a cada rincón de la creación.',
    },
  ),
  AsmaName(
    number: 46,
    arabic: 'الْحَكِيمُ',
    transliteration: 'Al-Hakim',
    meaning: {
      'en': 'The Wise',
      'ar': 'الحكيم صاحب الحكمة في كل شيء',
      'ur': 'حکمت والا',
      'es': 'El Sabio',
    },
    explanation: {
      'en':
          'Allah places everything in its proper place with perfect wisdom; nothing He does or decrees is without purpose.',
      'ar':
          'الله يضع كل شيء في موضعه بحكمة بالغة، ولا يفعل أو يقدر شيئًا إلا لحكمة.',
      'ur':
          'اللہ ہر چیز کو اس کی صحیح جگہ پر رکھتا ہے، نہایت حکمت کے ساتھ، اور جو کچھ وہ کرتا یا مقدر کرتا ہے وہ بے مقصد نہیں ہوتا۔',
      'es':
          'Allah pone todo en su lugar correspondiente con perfecta sabiduría; nada de lo que hace o decreta carece de propósito.',
    },
  ),
  AsmaName(
    number: 47,
    arabic: 'الْوَدُودُ',
    transliteration: 'Al-Wadud',
    meaning: {
      'en': 'The Loving',
      'ar': 'الودود المحب لعباده الصالحين',
      'ur': 'محبت کرنے والا',
      'es': 'El Amoroso',
    },
    explanation: {
      'en':
          'Allah loves His righteous servants and is deeply beloved by those whose hearts turn to Him in devotion.',
      'ar':
          'الله يحب عباده الصالحين، وهو محبوب في قلوب من يخلصون له العبادة.',
      'ur':
          'اللہ اپنے نیک بندوں سے محبت کرتا ہے اور ان دلوں میں محبوب ہے جو خلوص کے ساتھ اس کی عبادت کرتے ہیں۔',
      'es':
          'Allah ama a Sus siervos justos y es profundamente amado por aquellos cuyos corazones se vuelven hacia Él con devoción.',
    },
  ),
  AsmaName(
    number: 48,
    arabic: 'الْمَجِيدُ',
    transliteration: 'Al-Majid',
    meaning: {
      'en': 'The Glorious',
      'ar': 'المجيد العظيم الكريم في ذاته وأفعاله',
      'ur': 'بزرگی والا',
      'es': 'El Glorioso',
    },
    explanation: {
      'en':
          'Allah is glorious in His essence, attributes, and deeds, combining perfect majesty with boundless generosity.',
      'ar':
          'الله مجيد في ذاته وصفاته وأفعاله، يجمع بين العظمة الكاملة والكرم الواسع.',
      'ur':
          'اللہ اپنی ذات، صفات اور افعال میں بزرگی والا ہے، جو کامل عظمت اور بے پایاں سخاوت کا مجموعہ ہے۔',
      'es':
          'Allah es glorioso en Su esencia, atributos y obras, combinando majestad perfecta con generosidad infinita.',
    },
  ),
  AsmaName(
    number: 49,
    arabic: 'الْبَاعِثُ',
    transliteration: "Al-Ba'ith",
    meaning: {
      'en': 'The Resurrector',
      'ar': 'الباعث الذي يبعث الخلق يوم القيامة',
      'ur': 'دوبارہ زندہ کرنے والا',
      'es': 'El Resucitador',
    },
    explanation: {
      'en':
          'Allah will raise all of creation back to life on the Day of Judgment to be held accountable for their deeds.',
      'ar':
          'الله سيبعث كل الخلق يوم القيامة ليُحاسبوا على أعمالهم.',
      'ur':
          'اللہ قیامت کے دن تمام مخلوقات کو دوبارہ زندہ کرے گا تاکہ ان کے اعمال کا حساب لیا جائے۔',
      'es':
          'Allah resucitará a toda la creación en el Día del Juicio para que rindan cuentas de sus actos.',
    },
  ),
  AsmaName(
    number: 50,
    arabic: 'الشَّهِيدُ',
    transliteration: 'Ash-Shahid',
    meaning: {
      'en': 'The Witness',
      'ar': 'الشهيد الحاضر الذي لا يغيب عنه شيء',
      'ur': 'گواہ',
      'es': 'El Testigo',
    },
    explanation: {
      'en':
          'Allah witnesses everything that occurs in creation at every moment, present and aware of all that is said and done.',
      'ar':
          'الله شاهد على كل ما يحدث في الخلق في كل لحظة، حاضر ومطلع على كل ما يُقال ويُفعل.',
      'ur':
          'اللہ مخلوق میں ہونے والی ہر چیز کا ہر لمحے گواہ ہے، ہر کہی اور کی گئی بات سے واقف اور حاضر ہے۔',
      'es':
          'Allah es testigo de todo lo que ocurre en la creación en cada momento, presente y consciente de todo lo que se dice y se hace.',
    },
  ),
  AsmaName(
    number: 51,
    arabic: 'الْحَقُّ',
    transliteration: 'Al-Haqq',
    meaning: {
      'en': 'The Truth',
      'ar': 'الحق الثابت الذي لا يزول',
      'ur': 'سچا',
      'es': 'La Verdad',
    },
    explanation: {
      'en':
          "Allah's existence, promises, and words are absolute truth and reality, while everything else may pass away.",
      'ar':
          'وجود الله ووعوده وكلماته حق ثابت لا يتغير، بينما كل شيء آخر زائل.',
      'ur':
          'اللہ کا وجود، اس کے وعدے اور اس کے کلمات حقیقی اور غیر متغیر سچائی ہیں، جبکہ باقی سب کچھ فانی ہے۔',
      'es':
          'La existencia, las promesas y las palabras de Allah son verdad y realidad absolutas, mientras que todo lo demás puede desaparecer.',
    },
  ),
  AsmaName(
    number: 52,
    arabic: 'الْوَكِيلُ',
    transliteration: 'Al-Wakil',
    meaning: {
      'en': 'The Trustee',
      'ar': 'الوكيل الذي يكفي من توكل عليه',
      'ur': 'کارساز',
      'es': 'El Administrador',
    },
    explanation: {
      'en':
          'Allah is sufficient as a guardian and disposer of affairs for those who place their trust completely in Him.',
      'ar':
          'الله كافٍ كوكيل ومدبّر لأمور من يتوكل عليه توكلاً تامًا.',
      'ur':
          'اللہ ان لوگوں کے لیے کافی کارساز اور نگہبان ہے جو مکمل طور پر اس پر بھروسہ کرتے ہیں۔',
      'es':
          'Allah es suficiente como guardián y administrador de los asuntos de quienes depositan completamente su confianza en Él.',
    },
  ),
  AsmaName(
    number: 53,
    arabic: 'الْقَوِيُّ',
    transliteration: 'Al-Qawi',
    meaning: {
      'en': 'The Most Strong',
      'ar': 'القوي صاحب القوة المطلقة',
      'ur': 'زبردست طاقتور',
      'es': 'El Fortísimo',
    },
    explanation: {
      'en':
          'Allah possesses absolute strength that never weakens or tires, by which He sustains and governs all of existence.',
      'ar':
          'الله يملك قوة مطلقة لا تضعف ولا تتعب، بها يدبر ويحكم الوجود كله.',
      'ur':
          'اللہ مطلق طاقت کا مالک ہے جو کبھی کمزور یا تھکتی نہیں، جس کے ذریعے وہ پوری کائنات کو سنبھالتا اور چلاتا ہے۔',
      'es':
          'Allah posee una fuerza absoluta que nunca se debilita ni se cansa, mediante la cual sostiene y gobierna toda la existencia.',
    },
  ),
  AsmaName(
    number: 54,
    arabic: 'الْمَتِينُ',
    transliteration: 'Al-Matin',
    meaning: {
      'en': 'The Firm',
      'ar': 'المتين الشديد القوة الثابت',
      'ur': 'مضبوط',
      'es': 'El Firme',
    },
    explanation: {
      'en':
          "Allah's power and resolve are unshakeable and steadfast, requiring no effort to carry out His will.",
      'ar':
          'قوة الله وعزمه ثابتان لا يتزعزعان، ولا يحتاج إلى جهد لتنفيذ إرادته.',
      'ur':
          'اللہ کی قوت اور ارادہ غیر متزلزل اور ثابت ہیں، اور اپنی مرضی نافذ کرنے کے لیے اسے کسی کوشش کی ضرورت نہیں۔',
      'es':
          'El poder y la determinación de Allah son inquebrantables y firmes, sin requerir esfuerzo alguno para llevar a cabo Su voluntad.',
    },
  ),
  AsmaName(
    number: 55,
    arabic: 'الْوَلِيُّ',
    transliteration: 'Al-Wali',
    meaning: {
      'en': 'The Protecting Friend',
      'ar': 'الولي ناصر المؤمنين ومتولي أمورهم',
      'ur': 'مددگار دوست',
      'es': 'El Amigo Protector',
    },
    explanation: {
      'en':
          'Allah is the close friend and protector of the believers, taking charge of their affairs and supporting them in difficulty.',
      'ar':
          'الله هو الولي القريب والناصر للمؤمنين، يتولى أمورهم ويسندهم في الشدائد.',
      'ur':
          'اللہ مومنوں کا قریبی دوست اور مددگار ہے، ان کے معاملات کی ذمہ داری لیتا ہے اور مشکل میں ان کا سہارا بنتا ہے۔',
      'es':
          'Allah es el amigo cercano y protector de los creyentes, encargándose de sus asuntos y apoyándolos en la dificultad.',
    },
  ),
  AsmaName(
    number: 56,
    arabic: 'الْحَمِيدُ',
    transliteration: 'Al-Hamid',
    meaning: {
      'en': 'The Praiseworthy',
      'ar': 'الحميد المستحق للحمد على كل حال',
      'ur': 'تعریف کے لائق',
      'es': 'El Loable',
    },
    explanation: {
      'en':
          'Allah is worthy of all praise in every circumstance, for His perfect attributes and countless blessings upon creation.',
      'ar':
          'الله يستحق كل الحمد في كل حال، لكمال صفاته ونعمه التي لا تُحصى على الخلق.',
      'ur':
          'اللہ ہر حال میں تمام تعریفوں کا مستحق ہے، اپنی کامل صفات اور مخلوق پر بے شمار نعمتوں کی وجہ سے۔',
      'es':
          'Allah es digno de toda alabanza en cada circunstancia, por Sus atributos perfectos e incontables bendiciones sobre la creación.',
    },
  ),
  AsmaName(
    number: 57,
    arabic: 'الْمُحْصِيُ',
    transliteration: 'Al-Muhsi',
    meaning: {
      'en': 'The Counter',
      'ar': 'المحصي الذي أحصى كل شيء عدداً',
      'ur': 'شمار کرنے والا',
      'es': 'El Contador Exacto',
    },
    explanation: {
      'en':
          "Allah's knowledge encompasses the exact number and detail of everything in creation, leaving nothing uncounted.",
      'ar':
          'علم الله يحيط بعدد وتفاصيل كل شيء في الخلق بدقة تامة، فلا يفوته شيء.',
      'ur':
          'اللہ کا علم کائنات کی ہر چیز کی تعداد اور تفصیل کا مکمل احاطہ کیے ہوئے ہے، کچھ بھی شمار سے باہر نہیں۔',
      'es':
          'El conocimiento de Allah abarca el número exacto y los detalles de todo en la creación, sin dejar nada sin contar.',
    },
  ),
  AsmaName(
    number: 58,
    arabic: 'الْمُبْدِئُ',
    transliteration: 'Al-Mubdi',
    meaning: {
      'en': 'The Originator',
      'ar': 'المبدئ الذي بدأ الخلق من العدم',
      'ur': 'ابتدا کرنے والا',
      'es': 'El Iniciador',
    },
    explanation: {
      'en':
          'Allah began creation from nothing without any prior model, demonstrating His limitless creative power.',
      'ar':
          'الله بدأ الخلق من العدم بلا مثال سابق، مما يدل على قدرته الإبداعية اللامحدودة.',
      'ur':
          'اللہ نے بغیر کسی پہلے سے موجود نمونے کے، عدم سے تخلیق کا آغاز کیا، جو اس کی لامحدود تخلیقی قدرت کو ظاہر کرتا ہے۔',
      'es':
          'Allah comenzó la creación desde la nada sin ningún modelo previo, demostrando Su poder creativo ilimitado.',
    },
  ),
  AsmaName(
    number: 59,
    arabic: 'الْمُعِيدُ',
    transliteration: "Al-Mu'id",
    meaning: {
      'en': 'The Restorer',
      'ar': 'المعيد الذي يعيد الخلق بعد الموت',
      'ur': 'دوبارہ پیدا کرنے والا',
      'es': 'El Restaurador',
    },
    explanation: {
      'en':
          'Allah will restore and recreate all of creation after death, just as He originated it the first time.',
      'ar':
          'الله سيعيد ويخلق كل الخلق بعد الموت، كما أنشأه أول مرة.',
      'ur':
          'اللہ موت کے بعد تمام مخلوقات کو دوبارہ پیدا کرے گا، جیسے اس نے انہیں پہلی بار پیدا کیا تھا۔',
      'es':
          'Allah restaurará y recreará a toda la creación después de la muerte, tal como la originó la primera vez.',
    },
  ),
  AsmaName(
    number: 60,
    arabic: 'الْمُحْيِي',
    transliteration: 'Al-Muhyi',
    meaning: {
      'en': 'The Giver of Life',
      'ar': 'المحيي الذي يهب الحياة',
      'ur': 'زندگی دینے والا',
      'es': 'El Dador de Vida',
    },
    explanation: {
      'en':
          'Allah gives life to lifeless matter, brings the dead to life, and revives hearts with faith and guidance.',
      'ar':
          'الله يهب الحياة للجماد، ويحيي الموتى، ويحيي القلوب بالإيمان والهداية.',
      'ur':
          'اللہ بے جان مادے کو زندگی دیتا ہے، مردوں کو زندہ کرتا ہے اور دلوں کو ایمان اور ہدایت سے زندہ کرتا ہے۔',
      'es':
          'Allah da vida a la materia inerte, resucita a los muertos y revive los corazones con fe y guía.',
    },
  ),
  AsmaName(
    number: 61,
    arabic: 'الْمُمِيتُ',
    transliteration: 'Al-Mumit',
    meaning: {
      'en': 'The Taker of Life',
      'ar': 'المميت الذي يقبض الأرواح',
      'ur': 'موت دینے والا',
      'es': 'El que da la Muerte',
    },
    explanation: {
      'en':
          'Allah determines the death of every soul at its appointed time, returning all of creation to Him.',
      'ar':
          'الله يقدر موت كل نفس في وقتها المحدد، ويُرجع كل الخلق إليه.',
      'ur':
          'اللہ ہر جان کی موت کو اس کے مقررہ وقت پر طے کرتا ہے اور تمام مخلوق کو اپنی طرف لوٹاتا ہے۔',
      'es':
          'Allah determina la muerte de cada alma en su momento señalado, devolviendo a toda la creación hacia Él.',
    },
  ),
  AsmaName(
    number: 62,
    arabic: 'الْحَيُّ',
    transliteration: 'Al-Hayy',
    meaning: {
      'en': 'The Ever-Living',
      'ar': 'الحي الذي لا يموت أبداً',
      'ur': 'ہمیشہ زندہ رہنے والا',
      'es': 'El Eternamente Vivo',
    },
    explanation: {
      'en':
          "Allah's life is eternal, with neither beginning nor end, and is the source of life for everything that lives.",
      'ar':
          'حياة الله أزلية أبدية، لا بداية لها ولا نهاية، وهي مصدر الحياة لكل حي.',
      'ur':
          'اللہ کی زندگی ازلی اور ابدی ہے، نہ اس کی کوئی ابتدا ہے نہ انتہا، اور وہی ہر زندہ چیز کی زندگی کا سرچشمہ ہے۔',
      'es':
          'La vida de Allah es eterna, sin principio ni fin, y es la fuente de vida para todo lo que vive.',
    },
  ),
  AsmaName(
    number: 63,
    arabic: 'الْقَيُّومُ',
    transliteration: 'Al-Qayyum',
    meaning: {
      'en': 'The Self-Subsisting',
      'ar': 'القيوم القائم بنفسه المقيم لغيره',
      'ur': 'خود قائم رہنے والا',
      'es': 'El Subsistente por Sí Mismo',
    },
    explanation: {
      'en':
          'Allah needs nothing to exist, while everything in creation depends entirely on Him for its existence and continuity.',
      'ar':
          'الله لا يحتاج إلى شيء في وجوده، بينما كل المخلوقات تعتمد عليه كليًا في وجودها واستمرارها.',
      'ur':
          'اللہ کو اپنے وجود کے لیے کسی چیز کی ضرورت نہیں، جبکہ تمام مخلوقات اپنے وجود اور بقا کے لیے مکمل طور پر اس پر منحصر ہیں۔',
      'es':
          'Allah no necesita nada para existir, mientras que todo en la creación depende enteramente de Él para su existencia y continuidad.',
    },
  ),
  AsmaName(
    number: 64,
    arabic: 'الْوَاجِدُ',
    transliteration: 'Al-Wajid',
    meaning: {
      'en': 'The Finder',
      'ar': 'الواجد الغني الذي لا يفتقر',
      'ur': 'بے نیاز پانے والا',
      'es': 'El que Todo lo Posee',
    },
    explanation: {
      'en':
          'Allah lacks nothing and finds whatever He wills instantly, possessing everything He desires without any deficiency.',
      'ar':
          'الله لا ينقصه شيء، ويجد ما يشاء فورًا، ويملك كل ما يريد دون أي نقص.',
      'ur':
          'اللہ کو کسی چیز کی کمی نہیں، وہ جو چاہے فوراً پا لیتا ہے اور بغیر کسی کمی کے ہر مطلوبہ چیز کا مالک ہے۔',
      'es':
          'Allah no carece de nada y encuentra lo que quiere al instante, poseyendo todo lo que desea sin deficiencia alguna.',
    },
  ),
  AsmaName(
    number: 65,
    arabic: 'الْمَاجِدُ',
    transliteration: 'Al-Majid',
    meaning: {
      'en': 'The Noble',
      'ar': 'الماجد صاحب المجد والكرم الواسع',
      'ur': 'بزرگ و عالی شان',
      'es': 'El Noble',
    },
    explanation: {
      'en':
          "Allah's nobility and generosity are vast and abundant, surpassing all bounds in honor and magnificence.",
      'ar':
          'مجد الله وكرمه واسعان وفائضان، يفوقان كل حد في الشرف والعظمة.',
      'ur':
          'اللہ کی بزرگی اور سخاوت وسیع اور بے پایاں ہیں، جو شرف اور عظمت میں ہر حد سے بڑھ کر ہیں۔',
      'es':
          'La nobleza y generosidad de Allah son vastas y abundantes, sobrepasando todos los límites en honor y magnificencia.',
    },
  ),
  AsmaName(
    number: 66,
    arabic: 'الْوَاحِدُ',
    transliteration: 'Al-Wahid',
    meaning: {
      'en': 'The One',
      'ar': 'الواحد الذي لا شريك له',
      'ur': 'اکیلا',
      'es': 'El Único',
    },
    explanation: {
      'en':
          'Allah is one in His essence, attributes, and actions, with no partner, equal, or rival in His divinity.',
      'ar':
          'الله واحد في ذاته وصفاته وأفعاله، لا شريك له ولا مثيل ولا ند في ألوهيته.',
      'ur':
          'اللہ اپنی ذات، صفات اور افعال میں یکتا ہے، اس کی الوہیت میں کوئی شریک، مثل یا مدمقابل نہیں۔',
      'es':
          'Allah es uno en Su esencia, atributos y acciones, sin socio, igual o rival en Su divinidad.',
    },
  ),
  AsmaName(
    number: 67,
    arabic: 'الْأَحَدُ',
    transliteration: 'Al-Ahad',
    meaning: {
      'en': 'The Unique',
      'ar': 'الأحد المتفرد في ذاته',
      'ur': 'یکتا',
      'es': 'El Singular',
    },
    explanation: {
      'en':
          'Allah is singularly unique, with an essence and nature that cannot be shared, divided, or compared to anything else.',
      'ar':
          'الله متفرد بذاته، وهي ذات لا تُقسم ولا تُشارك ولا تُقارن بأي شيء آخر.',
      'ur':
          'اللہ اپنی ذات میں منفرد ہے، جو نہ تقسیم ہو سکتی ہے، نہ کسی کے ساتھ مشترک، اور نہ کسی چیز سے موازنہ کے قابل۔',
      'es':
          'Allah es singularmente único, con una esencia y naturaleza que no se puede compartir, dividir ni comparar con nada más.',
    },
  ),
  AsmaName(
    number: 68,
    arabic: 'الصَّمَدُ',
    transliteration: 'As-Samad',
    meaning: {
      'en': 'The Eternal Refuge',
      'ar': 'الصمد الذي يُقصد في الحوائج',
      'ur': 'بے نیاز سہارا',
      'es': 'El Refugio Eterno',
    },
    explanation: {
      'en':
          'Allah is the eternal refuge upon whom all creation depends, while He depends on nothing and no one.',
      'ar':
          'الله هو الملجأ الأبدي الذي يعتمد عليه كل الخلق، بينما هو لا يعتمد على أحد.',
      'ur':
          'اللہ وہ ابدی سہارا ہے جس پر تمام مخلوق انحصار کرتی ہے، جبکہ وہ کسی پر منحصر نہیں۔',
      'es':
          'Allah es el refugio eterno del cual depende toda la creación, mientras que Él no depende de nada ni de nadie.',
    },
  ),
  AsmaName(
    number: 69,
    arabic: 'الْقَادِرُ',
    transliteration: 'Al-Qadir',
    meaning: {
      'en': 'The Capable',
      'ar': 'القادر على كل شيء',
      'ur': 'قدرت رکھنے والا',
      'es': 'El Capaz',
    },
    explanation: {
      'en':
          'Allah has full power over all things; nothing is beyond His ability, and He can do whatever He wills instantly.',
      'ar':
          'الله قادر على كل شيء، فلا يعجزه شيء، ويفعل ما يشاء فورًا.',
      'ur':
          'اللہ ہر چیز پر مکمل قدرت رکھتا ہے، کوئی چیز اسے عاجز نہیں کر سکتی، اور وہ جو چاہے فوراً کر سکتا ہے۔',
      'es':
          'Allah tiene pleno poder sobre todas las cosas; nada está fuera de Su capacidad, y puede hacer lo que quiera al instante.',
    },
  ),
  AsmaName(
    number: 70,
    arabic: 'الْمُقْتَدِرُ',
    transliteration: 'Al-Muqtadir',
    meaning: {
      'en': 'The Powerful',
      'ar': 'المقتدر صاحب القدرة التامة',
      'ur': 'پوری قدرت والا',
      'es': 'El Todopoderoso Determinante',
    },
    explanation: {
      'en':
          "Allah's power is complete and decisive; He determines and executes the outcome of every matter with total control.",
      'ar':
          'قدرة الله كاملة وحاسمة، يقدر وينفذ نتيجة كل أمر بسيطرة تامة.',
      'ur':
          'اللہ کی قدرت مکمل اور فیصلہ کن ہے، وہ ہر معاملے کا نتیجہ مکمل کنٹرول کے ساتھ طے اور نافذ کرتا ہے۔',
      'es':
          'El poder de Allah es completo y decisivo; Él determina y ejecuta el resultado de cada asunto con control total.',
    },
  ),
  AsmaName(
    number: 71,
    arabic: 'الْمُقَدِّمُ',
    transliteration: 'Al-Muqaddim',
    meaning: {
      'en': 'The Expediter',
      'ar': 'المقدم الذي يقدم من يشاء',
      'ur': 'آگے کرنے والا',
      'es': 'El que Adelanta',
    },
    explanation: {
      'en':
          'Allah advances and gives precedence to whomever and whatever He wills, in rank, time, or favor, by His wisdom.',
      'ar':
          'الله يقدم من يشاء ويعطي الأسبقية لمن أو لما يشاء في المكانة أو الزمان أو الفضل، بحكمته.',
      'ur':
          'اللہ جسے چاہے درجے، وقت یا فضل میں آگے کرتا ہے، اپنی حکمت کے مطابق۔',
      'es':
          'Allah adelanta y da precedencia a quien y a lo que Él quiere, en rango, tiempo o favor, por Su sabiduría.',
    },
  ),
  AsmaName(
    number: 72,
    arabic: 'الْمُؤَخِّرُ',
    transliteration: "Al-Mu'akhkhir",
    meaning: {
      'en': 'The Delayer',
      'ar': 'المؤخر الذي يؤخر من يشاء',
      'ur': 'پیچھے کرنے والا',
      'es': 'El que Atrasa',
    },
    explanation: {
      'en':
          'Allah delays and postpones whomever and whatever He wills, with perfect wisdom and timing in every matter.',
      'ar':
          'الله يؤخر من يشاء ويؤجل ما يشاء بحكمة وتوقيت كاملين في كل أمر.',
      'ur':
          'اللہ جسے چاہے پیچھے کرتا ہے اور جو چاہے مؤخر کرتا ہے، ہر معاملے میں کامل حکمت اور وقت کے ساتھ۔',
      'es':
          'Allah retrasa y posterga a quien y lo que Él quiere, con perfecta sabiduría y oportunidad en cada asunto.',
    },
  ),
  AsmaName(
    number: 73,
    arabic: 'الْأَوَّلُ',
    transliteration: 'Al-Awwal',
    meaning: {
      'en': 'The First',
      'ar': 'الأول الذي ليس قبله شيء',
      'ur': 'سب سے پہلا',
      'es': 'El Primero',
    },
    explanation: {
      'en':
          'Allah existed before all things, with nothing preceding Him; He is the beginning without any prior cause.',
      'ar':
          'الله موجود قبل كل شيء، ولم يسبقه شيء، فهو البداية بلا سبب سابق.',
      'ur':
          'اللہ ہر چیز سے پہلے موجود تھا، اس سے پہلے کچھ نہیں تھا، وہ بغیر کسی سابقہ سبب کے ابتدا ہے۔',
      'es':
          'Allah existía antes de todas las cosas, nada Le precede; Él es el principio sin causa anterior.',
    },
  ),
  AsmaName(
    number: 74,
    arabic: 'الْآخِرُ',
    transliteration: 'Al-Akhir',
    meaning: {
      'en': 'The Last',
      'ar': 'الآخر الذي ليس بعده شيء',
      'ur': 'سب سے آخر',
      'es': 'El Último',
    },
    explanation: {
      'en':
          'Allah will remain after all of creation ceases to exist; He is the end without any succession after Him.',
      'ar':
          'الله سيبقى بعد فناء كل الخلق، فهو النهاية ولا شيء بعده.',
      'ur':
          'اللہ تمام مخلوق کے فنا ہونے کے بعد بھی باقی رہے گا، وہ انتہا ہے اور اس کے بعد کچھ نہیں۔',
      'es':
          'Allah permanecerá después de que toda la creación deje de existir; Él es el fin sin nada después de Él.',
    },
  ),
  AsmaName(
    number: 75,
    arabic: 'الظَّاهِرُ',
    transliteration: 'Az-Zahir',
    meaning: {
      'en': 'The Manifest',
      'ar': 'الظاهر الذي ظهر فوق كل شيء بقدرته',
      'ur': 'ظاہر',
      'es': 'El Manifiesto',
    },
    explanation: {
      'en':
          "Allah's existence is manifest through the clear signs of His creation, evident to anyone who reflects upon the universe.",
      'ar':
          'وجود الله ظاهر من خلال آيات خلقه الواضحة، الجلية لكل من يتأمل في الكون.',
      'ur':
          'اللہ کا وجود اس کی تخلیق کی واضح نشانیوں کے ذریعے ظاہر ہے، جو ہر اس شخص کے لیے عیاں ہے جو کائنات پر غور کرے۔',
      'es':
          'La existencia de Allah se manifiesta a través de los claros signos de Su creación, evidentes para quien reflexiona sobre el universo.',
    },
  ),
  AsmaName(
    number: 76,
    arabic: 'الْبَاطِنُ',
    transliteration: 'Al-Batin',
    meaning: {
      'en': 'The Hidden',
      'ar': 'الباطن الذي لا تدركه الأبصار',
      'ur': 'پوشیدہ',
      'es': 'El Oculto',
    },
    explanation: {
      'en':
          "Allah's true essence is hidden from human perception, beyond the reach of sight, imagination, or full comprehension.",
      'ar':
          'ذات الله الحقيقية محجوبة عن الإدراك البشري، فوق مدى البصر والخيال والفهم الكامل.',
      'ur':
          'اللہ کی حقیقی ذات انسانی ادراک سے پوشیدہ ہے، نظر، تخیل اور مکمل فہم کی پہنچ سے باہر۔',
      'es':
          'La verdadera esencia de Allah está oculta a la percepción humana, más allá del alcance de la vista, la imaginación o la comprensión total.',
    },
  ),
  AsmaName(
    number: 77,
    arabic: 'الْوَالِي',
    transliteration: 'Al-Wali',
    meaning: {
      'en': 'The Governor',
      'ar': 'الوالي المتولي لتدبير الخلق وأمورهم',
      'ur': 'حاکم و کارساز',
      'es': 'El Gobernante',
    },
    explanation: {
      'en':
          'Allah governs and manages the affairs of all creation, directing every matter with complete authority and care.',
      'ar':
          'الله يدبر ويتولى أمور كل الخلق، ويوجه كل أمر بسلطة تامة وعناية.',
      'ur':
          'اللہ تمام مخلوق کے معاملات کی تدبیر اور انتظام کرتا ہے اور ہر معاملے کو مکمل اختیار اور توجہ سے چلاتا ہے۔',
      'es':
          'Allah gobierna y administra los asuntos de toda la creación, dirigiendo cada cuestión con total autoridad y cuidado.',
    },
  ),
  AsmaName(
    number: 78,
    arabic: 'الْمُتَعَالِي',
    transliteration: "Al-Muta'ali",
    meaning: {
      'en': 'The Most Exalted',
      'ar': 'المتعالي عن صفات النقص والمخلوقات',
      'ur': 'بہت بلند و بالا',
      'es': 'El Sumamente Exaltado',
    },
    explanation: {
      'en':
          'Allah is exalted far above any imperfection or attribute of His creation, transcending all limitations completely.',
      'ar':
          'الله متعالٍ تمامًا عن أي نقص أو صفة من صفات المخلوقات، متجاوزًا كل القيود.',
      'ur':
          'اللہ مخلوقات کی کسی بھی کمی یا صفت سے بہت بلند ہے، ہر قسم کی حد بندی سے ماورا ہے۔',
      'es':
          'Allah está exaltado muy por encima de cualquier imperfección o atributo de Su creación, trascendiendo completamente toda limitación.',
    },
  ),
  AsmaName(
    number: 79,
    arabic: 'الْبَرُّ',
    transliteration: 'Al-Barr',
    meaning: {
      'en': 'The Source of Goodness',
      'ar': 'البر المحسن إلى خلقه',
      'ur': 'بہت احسان کرنے والا',
      'es': 'La Fuente de la Bondad',
    },
    explanation: {
      'en':
          'Allah is kind and good to His creation in countless ways, treating His servants with gentleness far beyond their merit.',
      'ar':
          'الله لطيف ومحسن إلى خلقه بطرق لا تُحصى، ويعامل عباده برفق يفوق استحقاقهم.',
      'ur':
          'اللہ اپنی مخلوق پر بے شمار طریقوں سے مہربان اور احسان کرنے والا ہے، اور اپنے بندوں کے ساتھ ان کے استحقاق سے بڑھ کر نرمی سے پیش آتا ہے۔',
      'es':
          'Allah es bondadoso y bueno con Su creación de innumerables maneras, tratando a Sus siervos con una gentileza que supera su mérito.',
    },
  ),
  AsmaName(
    number: 80,
    arabic: 'التَّوَّابُ',
    transliteration: 'At-Tawwab',
    meaning: {
      'en': 'The Acceptor of Repentance',
      'ar': 'التواب الذي يقبل توبة عباده',
      'ur': 'توبہ قبول کرنے والا',
      'es': 'El Aceptador del Arrepentimiento',
    },
    explanation: {
      'en':
          'Allah continually turns toward His servants in forgiveness, accepting their repentance no matter how many times they return to Him.',
      'ar':
          'الله يتوب على عباده باستمرار، ويقبل توبتهم مهما عادوا إليه.',
      'ur':
          'اللہ مسلسل اپنے بندوں کی طرف رحمت کے ساتھ متوجہ ہوتا ہے اور ان کی توبہ قبول کرتا ہے چاہے وہ کتنی بار اس کی طرف لوٹیں۔',
      'es':
          'Allah se vuelve continuamente hacia Sus siervos con perdón, aceptando su arrepentimiento sin importar cuántas veces regresen a Él.',
    },
  ),
  AsmaName(
    number: 81,
    arabic: 'الْمُنْتَقِمُ',
    transliteration: 'Al-Muntaqim',
    meaning: {
      'en': 'The Avenger',
      'ar': 'المنتقم الذي ينتقم من الظالمين بعدله',
      'ur': 'بدلہ لینے والا',
      'es': 'El Vengador',
    },
    explanation: {
      'en':
          'Allah justly punishes wrongdoers and tyrants who persist in oppression and reject His guidance, after giving them ample chances.',
      'ar':
          'الله يعاقب الظالمين والطغاة الذين يصرون على الظلم ويرفضون هدايته، بعد أن يمنحهم فرصًا كثيرة.',
      'ur':
          'اللہ ان ظالموں اور سرکشوں کو منصفانہ سزا دیتا ہے جو ظلم پر اصرار کرتے اور اس کی ہدایت کو رد کرتے ہیں، انہیں کافی مواقع دینے کے بعد۔',
      'es':
          'Allah castiga con justicia a los opresores y tiranos que persisten en la injusticia y rechazan Su guía, después de darles amplias oportunidades.',
    },
  ),
  AsmaName(
    number: 82,
    arabic: 'الْعَفُوُّ',
    transliteration: 'Al-Afuw',
    meaning: {
      'en': 'The Pardoner',
      'ar': 'العفو الذي يمحو السيئات بفضله',
      'ur': 'معاف کرنے والا',
      'es': 'El Indultador',
    },
    explanation: {
      'en':
          'Allah erases the sins of His servants entirely, as if they never happened, out of His grace and generosity.',
      'ar':
          'الله يمحو ذنوب عباده تمامًا، وكأنها لم تكن، من فضله وكرمه.',
      'ur':
          'اللہ اپنے بندوں کے گناہوں کو مکمل طور پر مٹا دیتا ہے، جیسے وہ کبھی ہوئے ہی نہ ہوں، اپنے فضل اور کرم سے۔',
      'es':
          'Allah borra completamente los pecados de Sus siervos, como si nunca hubieran ocurrido, por Su gracia y generosidad.',
    },
  ),
  AsmaName(
    number: 83,
    arabic: 'الرَّؤُوفُ',
    transliteration: "Ar-Ra'uf",
    meaning: {
      'en': 'The Compassionate',
      'ar': 'الرؤوف شديد الرحمة واللطف',
      'ur': 'بہت شفقت کرنے والا',
      'es': 'El Compasivo',
    },
    explanation: {
      'en':
          'Allah shows tender compassion and gentleness to His servants, sparing them from hardships out of His deep care.',
      'ar':
          'الله يظهر لعباده رحمة ورأفة شديدتين، ويصرف عنهم المشقات من شدة عنايته بهم.',
      'ur':
          'اللہ اپنے بندوں پر گہری شفقت اور نرمی کا اظہار کرتا ہے اور اپنی گہری توجہ کی وجہ سے انہیں مشکلات سے بچاتا ہے۔',
      'es':
          'Allah muestra una tierna compasión y dulzura hacia Sus siervos, librándolos de dificultades por Su profundo cuidado.',
    },
  ),
  AsmaName(
    number: 84,
    arabic: 'مَالِكُ الْمُلْكِ',
    transliteration: 'Malik-ul-Mulk',
    meaning: {
      'en': 'The Owner of Sovereignty',
      'ar': 'مالك الملك يعطي الملك ويسلبه',
      'ur': 'بادشاہی کا مالک',
      'es': 'El Dueño de la Soberanía',
    },
    explanation: {
      'en':
          'Allah owns all dominion and sovereignty, granting power and kingdoms to whomever He wills and removing it as He wills.',
      'ar':
          'الله يملك كل السلطان والملك، يعطي الحكم والممالك لمن يشاء وينزعها ممن يشاء.',
      'ur':
          'اللہ تمام حکمرانی اور بادشاہی کا مالک ہے، جسے چاہے اقتدار اور سلطنت دیتا ہے اور جس سے چاہے چھین لیتا ہے۔',
      'es':
          'Allah posee todo el dominio y la soberanía, otorgando poder y reinos a quien Él quiere y retirándolos según Su voluntad.',
    },
  ),
  AsmaName(
    number: 85,
    arabic: 'ذُو الْجَلَالِ وَالْإِكْرَامِ',
    transliteration: 'Dhul-Jalali-wal-Ikram',
    meaning: {
      'en': 'The Lord of Majesty and Generosity',
      'ar': 'ذو الجلال والإكرام صاحب العظمة والكرم',
      'ur': 'جلال اور اکرام والا',
      'es': 'El Señor de la Majestad y la Generosidad',
    },
    explanation: {
      'en':
          'Allah combines supreme majesty with abundant generosity, deserving of glorification while showering His creation with honor.',
      'ar':
          'الله يجمع بين العظمة العليا والكرم الواسع، يستحق التعظيم وفي نفس الوقت يغمر خلقه بالكرامة.',
      'ur':
          'اللہ بلند ترین عظمت اور وسیع سخاوت کا حامل ہے، تعظیم کا حقدار ہے اور ساتھ ہی اپنی مخلوق کو عزت سے نوازتا ہے۔',
      'es':
          'Allah combina la majestad suprema con abundante generosidad, mereciendo glorificación mientras colma a Su creación de honor.',
    },
  ),
  AsmaName(
    number: 86,
    arabic: 'الْمُقْسِطُ',
    transliteration: 'Al-Muqsit',
    meaning: {
      'en': 'The Equitable',
      'ar': 'المقسط الذي يقيم العدل بين خلقه',
      'ur': 'انصاف قائم کرنے والا',
      'es': 'El Equitativo',
    },
    explanation: {
      'en':
          'Allah establishes perfect fairness and equity among His creation, ensuring every right is restored on the Day of Judgment.',
      'ar':
          'الله يقيم العدل والإنصاف الكامل بين خلقه، ويرد كل حق إلى صاحبه يوم القيامة.',
      'ur':
          'اللہ اپنی مخلوق کے درمیان مکمل عدل اور انصاف قائم کرتا ہے اور قیامت کے دن ہر حق اس کے مالک کو لوٹاتا ہے۔',
      'es':
          'Allah establece una equidad perfecta entre Su creación, asegurando que cada derecho sea restituido en el Día del Juicio.',
    },
  ),
  AsmaName(
    number: 87,
    arabic: 'الْجَامِعُ',
    transliteration: 'Al-Jami',
    meaning: {
      'en': 'The Gatherer',
      'ar': 'الجامع الذي يجمع الخلق ليوم الحساب',
      'ur': 'جمع کرنے والا',
      'es': 'El Reunidor',
    },
    explanation: {
      'en':
          'Allah will gather all of creation together on the Day of Judgment, and He brings together whatever and whomever He wills in this life.',
      'ar':
          'الله سيجمع كل الخلق يوم الحساب، ويجمع في هذه الدنيا ما ومن يشاء.',
      'ur':
          'اللہ قیامت کے دن تمام مخلوقات کو جمع کرے گا، اور اس دنیا میں جو اور جسے چاہے اکٹھا کرتا ہے۔',
      'es':
          'Allah reunirá a toda la creación en el Día del Juicio, y en esta vida une lo que y a quien Él quiere.',
    },
  ),
  AsmaName(
    number: 88,
    arabic: 'الْغَنِيُّ',
    transliteration: 'Al-Ghani',
    meaning: {
      'en': 'The Self-Sufficient',
      'ar': 'الغني الذي لا يحتاج إلى أحد',
      'ur': 'بے نیاز',
      'es': 'El Autosuficiente',
    },
    explanation: {
      'en':
          'Allah is completely free of need from anyone or anything, while all of creation is in constant need of Him.',
      'ar':
          'الله غني تمامًا عن كل أحد وكل شيء، بينما كل الخلق في حاجة دائمة إليه.',
      'ur':
          'اللہ ہر کسی اور ہر چیز سے مکمل طور پر بے نیاز ہے، جبکہ تمام مخلوق ہمیشہ اس کی محتاج ہے۔',
      'es':
          'Allah es completamente independiente de cualquier persona o cosa, mientras que toda la creación tiene una necesidad constante de Él.',
    },
  ),
  AsmaName(
    number: 89,
    arabic: 'الْمُغْنِي',
    transliteration: 'Al-Mughni',
    meaning: {
      'en': 'The Enricher',
      'ar': 'المغني الذي يغني من يشاء من خلقه',
      'ur': 'غنی کرنے والا',
      'es': 'El Enriquecedor',
    },
    explanation: {
      'en':
          'Allah enriches whomever He wills among His creation, granting sufficiency of wealth, contentment, or spirit.',
      'ar':
          'الله يغني من يشاء من خلقه، فيمنح الكفاية في المال أو القناعة أو الروح.',
      'ur':
          'اللہ اپنی مخلوق میں سے جسے چاہے غنی کرتا ہے، مال، قناعت یا روح میں کفایت عطا کرتا ہے۔',
      'es':
          'Allah enriquece a quien Él quiere de Su creación, otorgando suficiencia de riqueza, satisfacción o espíritu.',
    },
  ),
  AsmaName(
    number: 90,
    arabic: 'الْمَانِعُ',
    transliteration: 'Al-Mani',
    meaning: {
      'en': 'The Preventer',
      'ar': 'المانع الذي يمنع الضر عمن يشاء',
      'ur': 'روکنے والا',
      'es': 'El Prevenidor',
    },
    explanation: {
      'en':
          'Allah withholds harm or undesired outcomes from His servants and prevents what is not beneficial for them, by His wisdom.',
      'ar':
          'الله يمنع الضر أو ما لا ينفع عن عباده، وذلك بحكمته البالغة.',
      'ur':
          'اللہ اپنی حکمت کے مطابق اپنے بندوں سے نقصان یا غیر مفید چیزوں کو روکتا ہے۔',
      'es':
          'Allah retiene el daño o los resultados no deseados de Sus siervos y previene lo que no les beneficia, por Su sabiduría.',
    },
  ),
  AsmaName(
    number: 91,
    arabic: 'الضَّارُّ',
    transliteration: 'Ad-Darr',
    meaning: {
      'en': 'The Distresser',
      'ar': 'الضار الذي يقدر الضر بحكمته',
      'ur': 'نقصان پہنچانے کی قدرت رکھنے والا',
      'es': 'El que Causa Aflicción',
    },
    explanation: {
      'en':
          'Allah has the power to decree harm or hardship as a test, consequence, or means of drawing His servants closer to Him.',
      'ar':
          'الله له القدرة على تقدير الضر أو الشدة كاختبار أو نتيجة أو وسيلة لتقريب عباده إليه.',
      'ur':
          'اللہ کے پاس نقصان یا مشکل کو بطور آزمائش، نتیجہ یا اپنے بندوں کو اپنے قریب لانے کے ذریعے کے طور پر مقرر کرنے کی قدرت ہے۔',
      'es':
          'Allah tiene el poder de decretar daño o dificultad como prueba, consecuencia o medio para acercar a Sus siervos a Él.',
    },
  ),
  AsmaName(
    number: 92,
    arabic: 'النَّافِعُ',
    transliteration: 'An-Nafi',
    meaning: {
      'en': 'The Benefiter',
      'ar': 'النافع الذي يوصل النفع لمن يشاء',
      'ur': 'نفع پہنچانے والا',
      'es': 'El Benefactor',
    },
    explanation: {
      'en':
          'Allah is the source of all benefit, directing good and advantage to whomever He wills among His creation.',
      'ar':
          'الله هو مصدر كل نفع، يوجه الخير والفائدة لمن يشاء من خلقه.',
      'ur':
          'اللہ ہر فائدے کا سرچشمہ ہے، اپنی مخلوق میں سے جسے چاہے بھلائی اور فائدہ پہنچاتا ہے۔',
      'es':
          'Allah es la fuente de todo beneficio, dirigiendo el bien y la ventaja hacia quien Él quiere de Su creación.',
    },
  ),
  AsmaName(
    number: 93,
    arabic: 'النُّورُ',
    transliteration: 'An-Nur',
    meaning: {
      'en': 'The Light',
      'ar': 'النور الذي ينور السماوات والأرض والقلوب',
      'ur': 'نور والا',
      'es': 'La Luz',
    },
    explanation: {
      'en':
          'Allah is the Light of the heavens and the earth, illuminating the physical world and guiding hearts out of the darkness of ignorance.',
      'ar':
          'الله نور السماوات والأرض، ينير العالم المادي ويهدي القلوب من ظلمات الجهل.',
      'ur':
          'اللہ آسمانوں اور زمین کا نور ہے، وہ مادی دنیا کو روشن کرتا ہے اور دلوں کو جہالت کی تاریکیوں سے نکال کر ہدایت دیتا ہے۔',
      'es':
          'Allah es la Luz de los cielos y la tierra, iluminando el mundo físico y guiando los corazones fuera de la oscuridad de la ignorancia.',
    },
  ),
  AsmaName(
    number: 94,
    arabic: 'الْهَادِي',
    transliteration: 'Al-Hadi',
    meaning: {
      'en': 'The Guide',
      'ar': 'الهادي الذي يهدي من يشاء إلى الصراط المستقيم',
      'ur': 'ہدایت دینے والا',
      'es': 'El Guía',
    },
    explanation: {
      'en':
          'Allah guides whomever He wills to the straight path of truth, leading hearts towards faith and righteous action.',
      'ar':
          'الله يهدي من يشاء إلى صراطه المستقيم، ويقود القلوب نحو الإيمان والعمل الصالح.',
      'ur':
          'اللہ جسے چاہے سیدھے راستے کی ہدایت دیتا ہے اور دلوں کو ایمان اور نیک عمل کی طرف لے جاتا ہے۔',
      'es':
          'Allah guía a quien Él quiere hacia el camino recto de la verdad, llevando los corazones hacia la fe y la acción correcta.',
    },
  ),
  AsmaName(
    number: 95,
    arabic: 'الْبَدِيعُ',
    transliteration: 'Al-Badi',
    meaning: {
      'en': 'The Originator of Beauty',
      'ar': 'البديع المبدع لخلقه على غير مثال',
      'ur': 'انوکھی تخلیق کرنے والا',
      'es': 'El Originador de la Belleza',
    },
    explanation: {
      'en':
          'Allah created the heavens, the earth, and all things with unmatched originality and beauty, without any prior example to follow.',
      'ar':
          'الله خلق السماوات والأرض وكل شيء بإبداع وجمال لا مثيل له، دون أي مثال سابق يحتذى به.',
      'ur':
          'اللہ نے آسمانوں، زمین اور ہر چیز کو بے مثال انفرادیت اور خوبصورتی کے ساتھ پیدا کیا، بغیر کسی پہلے سے موجود نمونے کے۔',
      'es':
          'Allah creó los cielos, la tierra y todas las cosas con una originalidad y belleza incomparables, sin ningún ejemplo previo que seguir.',
    },
  ),
  AsmaName(
    number: 96,
    arabic: 'الْبَاقِي',
    transliteration: 'Al-Baqi',
    meaning: {
      'en': 'The Everlasting',
      'ar': 'الباقي الذي لا يفنى أبداً',
      'ur': 'ہمیشہ باقی رہنے والا',
      'es': 'El Eterno',
    },
    explanation: {
      'en':
          "Allah's existence continues forever without end, while everything else in creation will eventually perish.",
      'ar':
          'وجود الله مستمر إلى الأبد بلا نهاية، بينما كل شيء آخر في الخلق سيفنى.',
      'ur':
          'اللہ کا وجود ہمیشہ کے لیے بغیر کسی انتہا کے قائم ہے، جبکہ مخلوق کی ہر چیز بالآخر فنا ہو جائے گی۔',
      'es':
          'La existencia de Allah continúa para siempre sin fin, mientras que todo lo demás en la creación eventualmente perecerá.',
    },
  ),
  AsmaName(
    number: 97,
    arabic: 'الْوَارِثُ',
    transliteration: 'Al-Warith',
    meaning: {
      'en': 'The Inheritor',
      'ar': 'الوارث الباقي بعد فناء الخلق',
      'ur': 'وارث',
      'es': 'El Heredero',
    },
    explanation: {
      'en':
          'Allah will remain the sole owner of everything after all of creation perishes, inheriting all that exists.',
      'ar':
          'سيبقى الله المالك الوحيد لكل شيء بعد فناء كل الخلق، فيرث كل ما هو موجود.',
      'ur':
          'تمام مخلوق کے فنا ہونے کے بعد اللہ ہی ہر چیز کا واحد مالک رہے گا اور ہر موجود چیز کا وارث بنے گا۔',
      'es':
          'Allah seguirá siendo el único dueño de todo después de que toda la creación perezca, heredando todo lo que existe.',
    },
  ),
  AsmaName(
    number: 98,
    arabic: 'الرَّشِيدُ',
    transliteration: 'Ar-Rashid',
    meaning: {
      'en': 'The Guide to the Right Path',
      'ar': 'الرشيد الذي يرشد خلقه إلى مصالحهم',
      'ur': 'صحیح راستہ دکھانے والا',
      'es': 'El Guía hacia el Camino Recto',
    },
    explanation: {
      'en':
          'Allah directs His creation towards what benefits them, guiding affairs to their proper and best outcomes with perfect wisdom.',
      'ar':
          'الله يوجه خلقه إلى ما ينفعهم، ويقود الأمور إلى أفضل نتائجها بحكمة كاملة.',
      'ur':
          'اللہ اپنی مخلوق کو ان کے فائدے کی طرف رہنمائی کرتا ہے اور معاملات کو کامل حکمت کے ساتھ ان کے بہترین انجام تک پہنچاتا ہے۔',
      'es':
          'Allah dirige a Su creación hacia lo que les beneficia, guiando los asuntos hacia sus mejores resultados con perfecta sabiduría.',
    },
  ),
  AsmaName(
    number: 99,
    arabic: 'الصَّبُورُ',
    transliteration: 'As-Sabur',
    meaning: {
      'en': 'The Patient',
      'ar': 'الصبور الذي لا يعجل بالعقوبة على العصاة',
      'ur': 'بہت صبر کرنے والا',
      'es': 'El Paciente',
    },
    explanation: {
      'en':
          'Allah is patient with the disobedience of His servants, withholding punishment and giving ample time for repentance and return.',
      'ar':
          'الله صبور على عصيان عباده، يؤخر العقوبة ويمنحهم وقتًا كافيًا للتوبة والرجوع إليه.',
      'ur':
          'اللہ اپنے بندوں کی نافرمانی پر صبر کرتا ہے، سزا کو مؤخر کرتا ہے اور توبہ اور واپسی کے لیے کافی وقت دیتا ہے۔',
      'es':
          'Allah es paciente con la desobediencia de Sus siervos, reteniendo el castigo y dando tiempo suficiente para el arrepentimiento y el retorno.',
    },
  ),
];
