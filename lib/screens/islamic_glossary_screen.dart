import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../widgets/font_size_slider.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

// ── Data ─────────────────────────────────────────────────────────────────────

class _Term {
  final String transliteration;
  final String arabic;
  final _TermCategory category;
  final String en;
  final String ar;
  final String ur;
  final String es;

  const _Term({
    required this.transliteration,
    required this.arabic,
    required this.category,
    required this.en,
    required this.ar,
    required this.ur,
    required this.es,
  });

  String definition(String lang) {
    switch (lang) {
      case 'ar':
        return ar;
      case 'ur':
        return ur;
      case 'es':
        return es;
      default:
        return en;
    }
  }
}

enum _TermCategory { pillar, quran, hadith, aqeedah, fiqh, practice, dhikr, history }

extension _TermCategoryExt on _TermCategory {
  String label(AppLocalizations l10n) {
    switch (this) {
      case _TermCategory.pillar:
        return l10n.categoryPillar;
      case _TermCategory.quran:
        return l10n.categoryQuran;
      case _TermCategory.hadith:
        return l10n.categoryHadith;
      case _TermCategory.aqeedah:
        return l10n.categoryAqeedah;
      case _TermCategory.fiqh:
        return l10n.categoryFiqh;
      case _TermCategory.practice:
        return l10n.categoryPractice;
      case _TermCategory.dhikr:
        return l10n.categoryDhikr;
      case _TermCategory.history:
        return l10n.categoryHistory;
    }
  }

  Color get color {
    switch (this) {
      case _TermCategory.pillar:
        return const Color(0xFF2E7D32);
      case _TermCategory.quran:
        return const Color(0xFF1565C0);
      case _TermCategory.hadith:
        return const Color(0xFF4A148C);
      case _TermCategory.aqeedah:
        return const Color(0xFF880E4F);
      case _TermCategory.fiqh:
        return const Color(0xFFBF360C);
      case _TermCategory.practice:
        return const Color(0xFF00695C);
      case _TermCategory.dhikr:
        return const Color(0xFF4E342E);
      case _TermCategory.history:
        return const Color(0xFF1A237E);
    }
  }
}

const List<_Term> _allTerms = [
  _Term(
    transliteration: 'Allah',
    arabic: 'الله',
    category: _TermCategory.aqeedah,
    en: 'The one God, creator of all existence. The Arabic name for God used by Muslims and Arab Christians alike. There is nothing like unto Him. (Quran 42:11)',
    ar: 'الإله الواحد الذي لا شريك له، خالق كل شيء وموجده. اللفظ العربي "الله" يستخدمه المسلمون والمسيحيون العرب للدلالة على الخالق. لَيْسَ كَمِثْلِهِ شَيْءٌ. (القرآن 42:11)',
    ur: 'واحد خدا جو تمام کائنات کا خالق ہے، اس کا کوئی شریک نہیں۔ "اللہ" خدا کا عربی نام ہے جو مسلمان اور عرب مسیحی دونوں استعمال کرتے ہیں۔ اس کے مثل کوئی چیز نہیں۔ (قرآن 42:11)',
    es: 'El único Dios sin asociados, creador de toda la existencia. El nombre árabe para Dios, usado por musulmanes y cristianos árabes por igual. No hay nada semejante a Él. (Corán 42:11)',
  ),
  _Term(
    transliteration: 'Islam',
    arabic: 'الإسلام',
    category: _TermCategory.aqeedah,
    en: 'Means "submission to Allah." The religion revealed to Prophet Muhammad ﷺ and all previous prophets, from Adam to Isa (Jesus). (Quran 3:19)',
    ar: 'تعني "الاستسلام لله". الدين الذي أُنزل على النبي محمد ﷺ وجميع الأنبياء السابقين، من آدم إلى عيسى عليهما السلام. إِنَّ الدِّينَ عِنْدَ اللَّهِ الْإِسْلَامُ. (القرآن 3:19)',
    ur: 'معنی "اللہ کے سامنے سر تسلیم خم کرنا"۔ وہ دین جو نبی محمد ﷺ اور حضرت آدم سے حضرت عیسیٰ تک تمام انبیاء پر نازل کیا گیا۔ (قرآن 3:19)',
    es: 'Significa "sumisión a Allah." La religión revelada al Profeta Muhammad ﷺ y a todos los profetas anteriores, desde Adán hasta Jesús (Isa). (Corán 3:19)',
  ),
  _Term(
    transliteration: 'Muslim',
    arabic: 'مسلم',
    category: _TermCategory.aqeedah,
    en: 'One who submits to Allah. Anyone who sincerely embraces Islam is a Muslim, regardless of race, nationality, or background.',
    ar: 'من يُسلم وجهه لله ويتبع الإسلام. كل من دخل الإسلام بصدق يُعدّ مسلماً، بغض النظر عن جنسه أو أصله.',
    ur: 'جو اللہ کے سامنے سر تسلیم خم کرے اور اسلام کی پیروی کرے۔ کوئی بھی جو سچے دل سے اسلام قبول کرے وہ مسلمان ہے، خواہ کسی بھی نسل یا ملک سے ہو۔',
    es: 'Quien se somete a Allah y sigue el Islam. Cualquier persona que sinceramente abrace el Islam es un musulmán, sin importar su raza, nacionalidad o trasfondo.',
  ),
  _Term(
    transliteration: 'Shahada',
    arabic: 'الشهادة',
    category: _TermCategory.pillar,
    en: 'The declaration of faith: "There is no god but Allah, and Muhammad is His messenger." The first pillar of Islam. Sincerely saying this makes one a Muslim.',
    ar: 'شهادة الإيمان: "أشهد أن لا إله إلا الله وأن محمداً رسول الله". الركن الأول من أركان الإسلام. من قالها بإخلاص ويقين دخل في الإسلام.',
    ur: 'ایمان کا اقرار: "میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں اور محمد ﷺ اللہ کے رسول ہیں۔" اسلام کا پہلا رکن۔ جو اسے سچے دل سے کہے وہ مسلمان ہو جاتا ہے۔',
    es: 'La declaración de fe: "Atestiguo que no hay más dios que Allah y que Muhammad es Su mensajero." El primer pilar del Islam. Decirla sinceramente convierte a alguien en musulmán.',
  ),
  _Term(
    transliteration: 'Salah',
    arabic: 'الصلاة',
    category: _TermCategory.pillar,
    en: 'The five daily prayers, one of the five pillars of Islam: Fajr (dawn), Dhuhr (midday), Asr (afternoon), Maghrib (sunset), and Isha (night). (Quran 2:238)',
    ar: 'الصلوات الخمس اليومية، وهي أحد أركان الإسلام الخمسة: الفجر، والظهر، والعصر، والمغرب، والعشاء. حَافِظُوا عَلَى الصَّلَوَاتِ وَالصَّلَاةِ الْوُسْطَى. (القرآن 2:238)',
    ur: 'پانچ روزانہ نمازیں، جو اسلام کے پانچ ارکان میں سے ایک ہیں: فجر، ظہر، عصر، مغرب اور عشاء۔ (قرآن 2:238)',
    es: 'Las cinco oraciones diarias, uno de los cinco pilares del Islam: Fajr (alba), Dhuhr (mediodía), Asr (tarde), Maghrib (puesta de sol) e Isha (noche). (Corán 2:238)',
  ),
  _Term(
    transliteration: 'Zakat',
    arabic: 'الزكاة',
    category: _TermCategory.pillar,
    en: 'Obligatory charity: 2.5% of savings given annually to those in need. One of the five pillars. It purifies wealth and supports the community. (Quran 9:60)',
    ar: 'الزكاة المفروضة: 2.5% من المدخرات تُعطى سنوياً للمحتاجين. ركن من أركان الإسلام يُطهّر المال ويدعم المجتمع. (القرآن 9:60)',
    ur: 'فرض صدقہ: اپنی بچت کا 2.5% سالانہ ضرورتمندوں کو دینا۔ اسلام کے پانچ ارکان میں سے ایک، مال کو پاک کرتا ہے اور معاشرے کی مدد کرتا ہے۔ (قرآن 9:60)',
    es: 'Limosna obligatoria: el 2.5% de los ahorros entregado anualmente a los necesitados. Uno de los cinco pilares. Purifica la riqueza y apoya a la comunidad. (Corán 9:60)',
  ),
  _Term(
    transliteration: 'Sawm',
    arabic: 'الصوم',
    category: _TermCategory.pillar,
    en: 'Fasting from food, drink, and intimate relations from dawn to sunset during Ramadan. One of the five pillars of Islam. (Quran 2:183)',
    ar: 'الصيام عن الطعام والشراب والجماع من الفجر حتى المغرب في شهر رمضان. ركن من أركان الإسلام الخمسة. يَا أَيُّهَا الَّذِينَ آمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ. (القرآن 2:183)',
    ur: 'رمضان میں طلوع فجر سے غروب آفتاب تک کھانے، پینے اور جماع سے رکنا۔ اسلام کے پانچ ارکان میں سے ایک۔ (قرآن 2:183)',
    es: 'Ayuno de alimentos, bebidas y relaciones íntimas desde el amanecer hasta el atardecer durante el Ramadán. Uno de los cinco pilares del Islam. (Corán 2:183)',
  ),
  _Term(
    transliteration: 'Hajj',
    arabic: 'الحج',
    category: _TermCategory.pillar,
    en: 'The pilgrimage to Makkah. Required once in a lifetime for those physically and financially able. One of the five pillars of Islam. (Quran 3:97)',
    ar: 'الحج إلى مكة المكرمة، يجب مرة واحدة في العمر على من استطاع إليه سبيلاً. ركن من أركان الإسلام. وَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ اسْتَطَاعَ إِلَيْهِ سَبِيلاً. (القرآن 3:97)',
    ur: 'مکہ مکرمہ کا حج، جو جسمانی اور مالی طاقت رکھنے والے ہر مسلمان پر زندگی میں ایک بار فرض ہے۔ اسلام کے پانچ ارکان میں سے ایک۔ (قرآن 3:97)',
    es: 'La peregrinación a La Meca. Obligatoria una vez en la vida para quienes tengan capacidad física y económica. Uno de los cinco pilares del Islam. (Corán 3:97)',
  ),
  _Term(
    transliteration: 'Wudu',
    arabic: 'الوضوء',
    category: _TermCategory.practice,
    en: 'Ritual purification with water before prayer. Includes washing hands, rinsing mouth, cleaning nose, washing face and arms, wiping head, and washing feet. (Quran 5:6)',
    ar: 'الطهارة بالماء قبل الصلاة، وتشمل: غسل اليدين، والمضمضة، والاستنشاق، وغسل الوجه والذراعين، ومسح الرأس، وغسل القدمين. (القرآن 5:6)',
    ur: 'نماز سے پہلے پانی سے طہارت: ہاتھ دھونا، کلی کرنا، ناک میں پانی ڈالنا، منہ، کہنیوں تک بازو دھونا، سر کا مسح اور پاؤں دھونا۔ (قرآن 5:6)',
    es: 'Purificación ritual con agua antes de la oración. Incluye lavar manos, enjuagar boca, limpiar nariz, lavar cara y brazos, limpiar la cabeza y lavar los pies. (Corán 5:6)',
  ),
  _Term(
    transliteration: 'Quran',
    arabic: 'القرآن',
    category: _TermCategory.quran,
    en: 'The holy book of Islam, revealed to Prophet Muhammad ﷺ over 23 years through Angel Jibreel. The direct, preserved word of Allah. (Quran 15:9)',
    ar: 'الكتاب المقدس للإسلام، أُنزل على النبي محمد ﷺ على مدى 23 عاماً بواسطة جبريل عليه السلام. كلام الله المحفوظ إلى يوم الدين. إِنَّا نَحْنُ نَزَّلْنَا الذِّكْرَ وَإِنَّا لَهُ لَحَافِظُونَ. (القرآن 15:9)',
    ur: 'اسلام کی مقدس کتاب، جو نبی محمد ﷺ پر 23 سال میں جبریل علیہ السلام کے ذریعے نازل کی گئی۔ اللہ کا براہ راست اور محفوظ کلام۔ (قرآن 15:9)',
    es: 'El libro sagrado del Islam, revelado al Profeta Muhammad ﷺ durante 23 años a través del Ángel Jibreel. La palabra directa y preservada de Allah. (Corán 15:9)',
  ),
  _Term(
    transliteration: 'Sunnah',
    arabic: 'السنة',
    category: _TermCategory.hadith,
    en: 'The teachings, actions, and approvals of Prophet Muhammad ﷺ. The second source of Islamic guidance after the Quran. Muslims follow it to emulate the Prophet.',
    ar: 'تعاليم النبي محمد ﷺ وأفعاله وتقريراته. المصدر الثاني للشريعة الإسلامية بعد القرآن الكريم. يتبعها المسلمون اقتداءً بالنبي ﷺ.',
    ur: 'نبی محمد ﷺ کی تعلیمات، اعمال اور منظوریاں۔ قرآن کریم کے بعد اسلامی رہنمائی کا دوسرا بڑا ذریعہ۔',
    es: 'Las enseñanzas, acciones y aprobaciones del Profeta Muhammad ﷺ. La segunda fuente de orientación islámica después del Corán. Los musulmanes la siguen para emular al Profeta.',
  ),
  _Term(
    transliteration: 'Hadith',
    arabic: 'الحديث',
    category: _TermCategory.hadith,
    en: 'A recorded saying or action of Prophet Muhammad ﷺ. Collected by scholars after rigorous verification in books like Sahih Bukhari and Sahih Muslim.',
    ar: 'قول أو فعل مروي عن النبي محمد ﷺ، جمعه العلماء بعد تمحيص دقيق في كتب كصحيح البخاري وصحيح مسلم.',
    ur: 'نبی محمد ﷺ کا کوئی فرمان یا عمل جو روایت کیا گیا ہو۔ علماء نے سخت جانچ کے بعد انہیں صحیح بخاری اور صحیح مسلم جیسی کتابوں میں جمع کیا۔',
    es: 'Un dicho o acción registrado del Profeta Muhammad ﷺ. Recopilado por eruditos tras una rigurosa verificación en libros como Sahih Bujari y Sahih Muslim.',
  ),
  _Term(
    transliteration: 'Ummah',
    arabic: 'الأمة',
    category: _TermCategory.aqeedah,
    en: 'The global Muslim community. All 1.8 billion Muslims worldwide are considered one Ummah, united by faith regardless of nationality. (Quran 21:92)',
    ar: 'المجتمع الإسلامي العالمي. يُعدّ جميع مسلمي العالم ـ أكثر من مليار وثمانمئة مليون ـ أمة واحدة يجمعها الإيمان. إِنَّ هَذِهِ أُمَّتُكُمْ أُمَّةً وَاحِدَةً. (القرآن 21:92)',
    ur: 'عالمی مسلم برادری۔ دنیا بھر کے 1.8 ارب مسلمان ایک امت تصور کیے جاتے ہیں، جو ایمان سے بندھے ہیں، قومیت سے قطع نظر۔ (قرآن 21:92)',
    es: 'La comunidad musulmana global. Los 1,800 millones de musulmanes del mundo son considerados una sola Ummah, unidos por la fe sin importar su nacionalidad. (Corán 21:92)',
  ),
  _Term(
    transliteration: 'Iman',
    arabic: 'الإيمان',
    category: _TermCategory.aqeedah,
    en: 'Faith. Belief in six pillars: Allah, His angels, His books, His messengers, the Last Day, and divine decree (qadar). (Hadith Jibril, Sahih Muslim)',
    ar: 'الإيمان بستة أركان: الله، وملائكته، وكتبه، ورسله، واليوم الآخر، والقدر خيره وشره. (حديث جبريل، صحيح مسلم)',
    ur: 'ایمان کے چھ ارکان: اللہ، اس کے فرشتے، اس کی کتابیں، اس کے رسول، آخرت اور تقدیر پر یقین رکھنا۔ (حدیث جبریل، صحیح مسلم)',
    es: 'Fe. Creencia en seis pilares: Allah, Sus ángeles, Sus libros, Sus mensajeros, el Día del Juicio y el decreto divino (qadar). (Hadiz de Jibreel, Sahih Muslim)',
  ),
  _Term(
    transliteration: 'Ihsan',
    arabic: 'الإحسان',
    category: _TermCategory.aqeedah,
    en: 'Excellence in worship. The Prophet ﷺ defined it as: "To worship Allah as if you see Him; if you cannot, know that He sees you." (Hadith Jibril, Sahih Muslim)',
    ar: 'الإحسان: العبادة على أعلى مستوياتها. قال النبي ﷺ: "أن تعبد الله كأنك تراه، فإن لم تكن تراه فإنه يراك." (حديث جبريل، صحيح مسلم)',
    ur: 'عبادت میں کمال۔ نبی ﷺ نے فرمایا: "اللہ کی عبادت اس طرح کرو جیسے تم اسے دیکھ رہے ہو، اور اگر نہیں دیکھ سکتے تو وہ تمہیں ضرور دیکھ رہا ہے۔" (حدیث جبریل، صحیح مسلم)',
    es: 'Excelencia en la adoración. El Profeta ﷺ la definió como: "Adorar a Allah como si lo vieras; si no puedes, sabe que Él te ve." (Hadiz de Jibreel, Sahih Muslim)',
  ),
  _Term(
    transliteration: 'Taqwa',
    arabic: 'التقوى',
    category: _TermCategory.aqeedah,
    en: 'God-consciousness. Being mindful of Allah in all situations — doing what He commands and avoiding what He forbids. Described as the best provision. (Quran 2:197)',
    ar: 'مراقبة الله في السر والعلن، فعل ما أمر به وترك ما نهى عنه. وصفها الله بأنها خير الزاد. وَتَزَوَّدُوا فَإِنَّ خَيْرَ الزَّادِ التَّقْوَى. (القرآن 2:197)',
    ur: 'تمام حالات میں اللہ کی یاد۔ وہ کرنا جو اللہ نے حکم دیا اور وہ چھوڑنا جو اس نے منع کیا۔ اللہ نے اسے بہترین زاد راہ قرار دیا۔ (قرآن 2:197)',
    es: 'Conciencia de Dios. Ser consciente de Allah en todas las situaciones — hacer lo que Él manda y evitar lo que Él prohíbe. Descrito como la mejor provisión. (Corán 2:197)',
  ),
  _Term(
    transliteration: 'Tawbah',
    arabic: 'التوبة',
    category: _TermCategory.practice,
    en: 'Sincere repentance. Turning back to Allah after a sin with genuine remorse and resolving not to repeat it. Allah loves those who repent. (Quran 2:222)',
    ar: 'التوبة الصادقة: الإقلاع عن الذنب بندم حقيقي والعزم على عدم العودة إليه. يُحبّ الله التوابين. إِنَّ اللَّهَ يُحِبُّ التَّوَّابِينَ. (القرآن 2:222)',
    ur: 'سچی توبہ: گناہ سے رک جانا، دل سے شرمندگی محسوس کرنا اور دوبارہ نہ کرنے کا عزم کرنا۔ اللہ توبہ کرنے والوں سے محبت کرتا ہے۔ (قرآن 2:222)',
    es: 'Arrepentimiento sincero. Regresar a Allah después de un pecado con genuino remordimiento y resolución de no repetirlo. Allah ama a quienes se arrepienten. (Corán 2:222)',
  ),
  _Term(
    transliteration: 'Tawakkul',
    arabic: 'التوكل',
    category: _TermCategory.aqeedah,
    en: 'Complete trust in Allah. Doing your best effort, then leaving the outcome to Allah with full confidence in His wisdom and care. (Quran 65:3)',
    ar: 'الاعتماد الكامل على الله بعد بذل الجهد والأسباب، وترك النتيجة لله مع اليقين التام بحكمته ورعايته. وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ. (القرآن 65:3)',
    ur: 'اللہ پر مکمل بھروسہ۔ پوری کوشش کرنے کے بعد نتیجہ اللہ پر چھوڑ دینا، اس کی حکمت اور رحمت پر پورا یقین رکھتے ہوئے۔ (قرآن 65:3)',
    es: 'Confianza plena en Allah. Esforzarse al máximo y luego dejar el resultado a Allah, con plena confianza en Su sabiduría y cuidado. (Corán 65:3)',
  ),
  _Term(
    transliteration: 'Sabr',
    arabic: 'الصبر',
    category: _TermCategory.aqeedah,
    en: 'Patient perseverance through hardship. One of the most praised qualities in the Quran, mentioned over 90 times. "Indeed, Allah is with the patient." (Quran 2:153)',
    ar: 'الصبر على البلاء واليقين بأن الله مع الصابرين. ذُكر في القرآن أكثر من تسعين مرة. إِنَّ اللَّهَ مَعَ الصَّابِرِينَ. (القرآن 2:153)',
    ur: 'مشکلات میں صبر اور استقامت۔ قرآن کریم میں 90 سے زائد مرتبہ اس کا ذکر ہے۔ "بے شک اللہ صبر کرنے والوں کے ساتھ ہے۔" (قرآن 2:153)',
    es: 'Paciencia y perseverancia en la adversidad. Una de las cualidades más elogiadas en el Corán, mencionada más de 90 veces. "En verdad, Allah está con los pacientes." (Corán 2:153)',
  ),
  _Term(
    transliteration: 'Shukr',
    arabic: 'الشكر',
    category: _TermCategory.aqeedah,
    en: 'Gratitude to Allah for His blessings. Expressed in words and by using blessings in His obedience. "If you are grateful, I will increase you." (Quran 14:7)',
    ar: 'شكر الله على نعمه بالقلب واللسان والعمل. قال تعالى: لَئِنْ شَكَرْتُمْ لَأَزِيدَنَّكُمْ. (القرآن 14:7)',
    ur: 'اللہ کی نعمتوں پر شکر، دل، زبان اور عمل سے۔ "اگر تم شکر کرو گے تو میں تمہیں مزید دوں گا۔" (قرآن 14:7)',
    es: 'Gratitud a Allah por Sus bendiciones. Expresada en palabras y usando las bendiciones en Su obediencia. "Si son agradecidos, os daré más." (Corán 14:7)',
  ),
  _Term(
    transliteration: 'Barakah',
    arabic: 'البركة',
    category: _TermCategory.practice,
    en: 'Divine blessing and increase. When Allah places barakah in something — time, food, wealth, or a person — it brings far more good than its apparent amount.',
    ar: 'البركة الإلهية والزيادة في الخير. إذا أحلّ الله البركة في شيء ـ وقت أو رزق أو شخص ـ أعطى أكثر مما يُتوقع منه ظاهراً.',
    ur: 'اللہ کی برکت اور اضافہ۔ جب اللہ کسی چیز میں برکت ڈالے — وقت، رزق یا انسان — تو وہ ظاہری مقدار سے بہت زیادہ فائدہ دیتی ہے۔',
    es: 'Bendición divina e incremento. Cuando Allah pone barakah en algo — tiempo, comida, riqueza o una persona — aporta mucho más bien de lo que su cantidad aparente sugiere.',
  ),
  _Term(
    transliteration: 'Halal',
    arabic: 'الحلال',
    category: _TermCategory.fiqh,
    en: 'Permissible according to Islamic law. Applied to food, actions, earnings, and relationships. Eating halal, earning halal, and living halal is an act of worship.',
    ar: 'ما أحلّه الله، ويشمل المأكل والمشرب والأعمال والمكاسب. تناول الحلال وكسبه عبادة في ذاتها.',
    ur: 'اسلامی شریعت کے مطابق جائز۔ کھانے، پینے، کمائی اور تعلقات پر لاگو ہوتا ہے۔ حلال کھانا، کمانا اور زندگی گزارنا عبادت ہے۔',
    es: 'Permisible según la ley islámica. Aplicado a alimentos, acciones, ganancias y relaciones. Comer halal, ganar halal y vivir halal es un acto de adoración.',
  ),
  _Term(
    transliteration: 'Haram',
    arabic: 'الحرام',
    category: _TermCategory.fiqh,
    en: 'Forbidden according to Islamic law. Actions or things clearly prohibited by Allah. Avoiding haram is itself a form of worship. (Quran 2:173)',
    ar: 'ما حرّمه الله تحريماً صريحاً. تجنّب الحرام عبادة في حد ذاتها. وَقَدْ فَصَّلَ لَكُمْ مَا حَرَّمَ عَلَيْكُمْ. (القرآن 6:119)',
    ur: 'اسلامی شریعت کے مطابق ممنوع، جو اللہ نے واضح طور پر حرام قرار دیا ہے۔ حرام سے بچنا خود ایک عبادت ہے۔ (قرآن 2:173)',
    es: 'Prohibido según la ley islámica. Acciones o cosas claramente prohibidas por Allah. Evitar lo haram es en sí mismo un acto de adoración. (Corán 2:173)',
  ),
  _Term(
    transliteration: 'Fiqh',
    arabic: 'الفقه',
    category: _TermCategory.fiqh,
    en: 'Islamic jurisprudence. The detailed rulings derived by qualified scholars from the Quran and Sunnah. The four main Sunni schools are Hanafi, Maliki, Shafi\'i, and Hanbali.',
    ar: 'الفقه الإسلامي: الأحكام التفصيلية المستنبطة من القرآن والسنة من قِبَل علماء مؤهلين. المذاهب الأربعة السنية: الحنفي، والمالكي، والشافعي، والحنبلي.',
    ur: 'اسلامی فقہ۔ قرآن و سنت سے مستنبط تفصیلی احکام جو اہل علم نے اخذ کیے ہیں۔ چار مشہور سنی مسالک: حنفی، مالکی، شافعی اور حنبلی۔',
    es: 'Jurisprudencia islámica. Las normas detalladas derivadas por eruditos calificados del Corán y la Sunnah. Las cuatro escuelas sunitas principales son Hanafi, Maliki, Shafi\'i y Hanbali.',
  ),
  _Term(
    transliteration: 'Fatwa',
    arabic: 'الفتوى',
    category: _TermCategory.fiqh,
    en: 'A religious ruling issued by a qualified Islamic scholar in response to a specific question. Should only be issued by those with deep knowledge of Quran and Sunnah.',
    ar: 'حكم شرعي يُصدره عالم مسلم مؤهل جواباً على سؤال بعينه. لا تصدر الفتاوى إلا ممن يمتلك علماً راسخاً بالقرآن والسنة وأصول الفقه.',
    ur: 'کسی مخصوص سوال کے جواب میں ایک اہل اسلامی عالم کا مذہبی حکم۔ فتویٰ صرف وہی جاری کر سکتا ہے جسے قرآن، سنت اور اصول فقہ پر گہری مہارت ہو۔',
    es: 'Una resolución religiosa emitida por un erudito islámico calificado en respuesta a una pregunta específica. Solo debe ser emitida por quien tenga profundo conocimiento del Corán y la Sunnah.',
  ),
  _Term(
    transliteration: 'Masjid',
    arabic: 'المسجد',
    category: _TermCategory.practice,
    en: 'A mosque; the place of worship for Muslims. Literally means "place of prostration." The Prophet ﷺ said the whole earth is a place of prayer. (Sahih Bukhari)',
    ar: 'المسجد: مكان العبادة للمسلمين، ومعناه "موضع السجود". قال النبي ﷺ: "جُعِلَت لي الأرض مسجداً وطهوراً." (صحيح البخاري)',
    ur: 'مسجد: مسلمانوں کی عبادت گاہ، لغوی معنی "سجدے کی جگہ"۔ نبی ﷺ نے فرمایا: "میرے لیے پوری زمین مسجد اور پاک بنا دی گئی ہے۔" (صحیح بخاری)',
    es: 'Una mezquita; el lugar de culto para los musulmanes. Literalmente significa "lugar de postración." El Profeta ﷺ dijo que toda la tierra es un lugar de oración. (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Imam',
    arabic: 'الإمام',
    category: _TermCategory.practice,
    en: 'The prayer leader who stands at the front of the congregation. Also used for a Muslim scholar, community leader, or the founders of the four major legal schools.',
    ar: 'من يؤم المصلين في الصلاة الجماعية. ويُطلق أيضاً على العالم المسلم أو الزعيم الديني أو مؤسسي المذاهب الفقهية الأربعة الكبرى.',
    ur: 'نماز میں آگے کھڑا ہونے والا رہنما۔ اسے مسلمان عالم، قائد، یا چار بڑے فقہی مسالک کے بانیوں کے لیے بھی استعمال کیا جاتا ہے۔',
    es: 'El líder de la oración que se coloca al frente de la congregación. También se usa para un erudito musulmán, líder comunitario o los fundadores de las cuatro grandes escuelas jurídicas.',
  ),
  _Term(
    transliteration: 'Adhan',
    arabic: 'الأذان',
    category: _TermCategory.practice,
    en: 'The call to prayer recited by a mu\'adhin to announce each of the five daily prayers. It begins with "Allahu Akbar" and ends with "La ilaha illallah."',
    ar: 'النداء للصلاة الذي يُرفعه المؤذن إعلاناً بدخول وقت كل صلاة. يبدأ بـ"الله أكبر" وينتهي بـ"لا إله إلا الله".',
    ur: 'نماز کی اذان جو موذن ہر نماز کا وقت آنے پر دیتا ہے۔ "اللہ اکبر" سے شروع ہو کر "لا إله إلا الله" پر ختم ہوتی ہے۔',
    es: 'El llamado a la oración recitado por un mu\'adhin para anunciar cada una de las cinco oraciones. Comienza con "Allahu Akbar" y termina con "La ilaha illallah."',
  ),
  _Term(
    transliteration: 'Iqamah',
    arabic: 'الإقامة',
    category: _TermCategory.practice,
    en: 'The second call made immediately before the congregational prayer begins. Shorter than the adhan, it signals that the prayer is about to start.',
    ar: 'الإقامة: النداء الثاني الذي يُرفع قُبيل بدء الصلاة الجماعية مباشرةً، إيذاناً باصطفاف المصلين.',
    ur: 'اقامت: دوسری اذان جو باجماعت نماز شروع ہونے سے فوراً پہلے دی جاتی ہے، صفیں سیدھی کرنے کا اشارہ ہے۔',
    es: 'El segundo llamado realizado justo antes de que comience la oración congregacional. Más corto que el adhan, señala que la oración está a punto de comenzar.',
  ),
  _Term(
    transliteration: 'Qiblah',
    arabic: 'القبلة',
    category: _TermCategory.practice,
    en: 'The direction of the Kaaba in Makkah. Muslims face the qiblah during every prayer. Originally towards Jerusalem, changed to Makkah in the second year of Hijra. (Quran 2:144)',
    ar: 'اتجاه الكعبة المشرفة في مكة المكرمة. يستقبل المسلمون القبلة في جميع صلواتهم. كانت نحو بيت المقدس ثم حُوِّلت إلى مكة. (القرآن 2:144)',
    ur: 'مکہ مکرمہ میں خانہ کعبہ کی سمت۔ مسلمان ہر نماز میں قبلہ کی طرف رخ کرتے ہیں۔ پہلے بیت المقدس، پھر ہجرت کے دوسرے سال مکہ کی طرف تبدیل کیا گیا۔ (قرآن 2:144)',
    es: 'La dirección de la Kaaba en La Meca. Los musulmanes se orientan hacia la qibla en cada oración. Originalmente hacia Jerusalén, fue cambiada hacia La Meca en el segundo año de la Hégira. (Corán 2:144)',
  ),
  _Term(
    transliteration: 'Kaaba',
    arabic: 'الكعبة',
    category: _TermCategory.quran,
    en: 'The cubic stone structure at the center of Masjid al-Haram in Makkah. Built by Prophet Ibrahim and his son Ismail. The first house of worship for mankind. (Quran 3:96)',
    ar: 'البيت الحرام المكعب الشكل في وسط المسجد الحرام بمكة المكرمة، بناه إبراهيم وابنه إسماعيل عليهما السلام. أول بيت وُضع للناس. إِنَّ أَوَّلَ بَيْتٍ وُضِعَ لِلنَّاسِ لَلَّذِي بِبَكَّةَ. (القرآن 3:96)',
    ur: 'مکہ مکرمہ میں مسجد الحرام کے مرکز میں مکعب نما مقدس ڈھانچہ۔ حضرت ابراہیم اور ان کے بیٹے حضرت اسماعیل علیہما السلام نے اسے تعمیر کیا۔ پہلی عبادت گاہ۔ (قرآن 3:96)',
    es: 'La estructura cúbica de piedra en el centro de la Mezquita al-Haram en La Meca. Construida por el Profeta Ibrahim y su hijo Ismail. La primera casa de culto para la humanidad. (Corán 3:96)',
  ),
  _Term(
    transliteration: 'Dua',
    arabic: 'الدعاء',
    category: _TermCategory.practice,
    en: 'Personal supplication to Allah. Can be made at any time, in any language, anywhere. The Prophet ﷺ called it "the essence of worship." (Sunan Abu Dawud)',
    ar: 'الدعاء: مناجاة الله الخاصة في أي وقت وبأي لغة وفي أي مكان. وصفه النبي ﷺ بأنه "مخّ العبادة." (سنن أبي داود)',
    ur: 'اللہ سے ذاتی دعا، کسی بھی وقت، کسی بھی زبان میں، کہیں بھی۔ نبی ﷺ نے فرمایا کہ یہ "عبادت کا مغز" ہے۔ (سنن ابو داؤد)',
    es: 'Súplica personal directa a Allah. Se puede hacer en cualquier momento, en cualquier idioma, en cualquier lugar. El Profeta ﷺ la llamó "la esencia de la adoración." (Sunan Abu Dawud)',
  ),
  _Term(
    transliteration: 'Dhikr',
    arabic: 'الذكر',
    category: _TermCategory.dhikr,
    en: 'Remembrance of Allah through repeated phrases. Common forms: SubhanAllah, Alhamdulillah, Allahu Akbar. "Verily in the remembrance of Allah do hearts find rest." (Quran 13:28)',
    ar: 'ذكر الله بالتسبيح والتحميد والتكبير وغيرها. أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ. (القرآن 13:28)',
    ur: 'سبحان اللہ، الحمد للہ، اللہ اکبر جیسے الفاظ سے اللہ کی یاد۔ "یاد رہے کہ اللہ کی یاد ہی دلوں کو سکون دیتی ہے۔" (قرآن 13:28)',
    es: 'Remembranza de Allah mediante frases repetidas. Formas comunes: SubhanAllah, Alhamdulillah, Allahu Akbar. "En verdad, en el recuerdo de Allah encuentran paz los corazones." (Corán 13:28)',
  ),
  _Term(
    transliteration: 'Seerah',
    arabic: 'السيرة',
    category: _TermCategory.hadith,
    en: 'The biography of Prophet Muhammad ﷺ. Studying his life, character, and decisions is a source of guidance for every aspect of Muslim life.',
    ar: 'السيرة النبوية: تاريخ حياة النبي محمد ﷺ وشخصيته وقراراته. دراستها مصدر هداية لكل جوانب الحياة الإسلامية.',
    ur: 'نبی محمد ﷺ کی سوانح عمری۔ آپ ﷺ کی زندگی، اخلاق اور فیصلوں کا مطالعہ مسلمان زندگی کے ہر پہلو کے لیے رہنمائی کا ذریعہ ہے۔',
    es: 'La biografía del Profeta Muhammad ﷺ. Estudiar su vida, carácter y decisiones es una fuente de orientación para todos los aspectos de la vida musulmana.',
  ),
  _Term(
    transliteration: 'Tafsir',
    arabic: 'التفسير',
    category: _TermCategory.quran,
    en: 'Explanation and interpretation of the Quran. Classical works include those by Ibn Kathir, Al-Tabari, and Al-Qurtubi. Essential for understanding the meaning of verses.',
    ar: 'علم تفسير القرآن وبيان معانيه. ومن أبرز كتبه: تفسير ابن كثير والطبري والقرطبي. ضروري لفهم مراد الآيات الكريمة.',
    ur: 'قرآن کریم کی تفسیر اور تشریح۔ کلاسیکی تفاسیر میں ابن کثیر، الطبری اور القرطبی کی تفاسیر شامل ہیں۔ آیات کا صحیح مفہوم سمجھنے کے لیے ضروری ہے۔',
    es: 'Explicación e interpretación del Corán. Las obras clásicas incluyen las de Ibn Kathir, Al-Tabari y Al-Qurtubi. Esencial para comprender el significado de los versículos.',
  ),
  _Term(
    transliteration: 'Tajweed',
    arabic: 'التجويد',
    category: _TermCategory.quran,
    en: 'The rules of proper Quran recitation. Ensures each letter is pronounced from its correct place with the right characteristics, as the Quran was originally revealed.',
    ar: 'علم أحكام تلاوة القرآن الكريم، يضمن نطق كل حرف من مخرجه الصحيح بصفاته الدقيقة، كما أُنزل القرآن أول مرة.',
    ur: 'قرآن کریم کی درست تلاوت کے قواعد۔ ہر حرف کو اس کے صحیح مخرج سے ادا کرنا تاکہ جس طرح قرآن نازل ہوا اسی طرح پڑھا جائے۔',
    es: 'Las reglas de la recitación correcta del Corán. Asegura que cada letra se pronuncie desde su lugar correcto con las características adecuadas, tal como fue revelado originalmente.',
  ),
  _Term(
    transliteration: 'Jannah',
    arabic: 'الجنة',
    category: _TermCategory.aqeedah,
    en: 'Paradise. The eternal reward for believers — rivers, gardens, companions, and the supreme reward of seeing Allah. Described vividly in the Quran. (Quran 55:46–78)',
    ar: 'الجنة: الثواب الأبدي للمؤمنين. وصفها القرآن بالأنهار والرياض والنعيم المقيم، وأعلى درجاتها رؤية الله سبحانه. (القرآن 55:46-78)',
    ur: 'جنت: مومنوں کا ابدی انعام۔ قرآن کریم میں اسے پانی، دودھ، شہد کی نہریں، باغات، ساتھی اور سب سے بڑا انعام — اللہ کا دیدار — قرار دیا گیا ہے۔ (قرآن 55:46-78)',
    es: 'El Paraíso. La recompensa eterna para los creyentes — ríos, jardines, compañeros y la recompensa suprema de ver a Allah. Descrito vívidamente en el Corán. (Corán 55:46–78)',
  ),
  _Term(
    transliteration: 'Jahannam',
    arabic: 'جهنم',
    category: _TermCategory.aqeedah,
    en: 'Hellfire. The place of punishment described in the Quran as a warning and deterrent for those who reject faith and persist in wrongdoing. (Quran 67:6)',
    ar: 'جهنم: دار العذاب الموصوفة في القرآن بتفصيل، زجراً وتحذيراً لمن يتمادى في الكفر والعصيان. (القرآن 67:6)',
    ur: 'جہنم: عذاب کی جگہ جس کا قرآن کریم میں تفصیل سے ذکر ہے، بطور تنبیہ اور ڈرانے کے لیے۔ (قرآن 67:6)',
    es: 'El Infierno. El lugar de castigo descrito vívidamente en el Corán como advertencia y elemento disuasorio para quienes rechazan la fe. (Corán 67:6)',
  ),
  _Term(
    transliteration: 'Akhirah',
    arabic: 'الآخرة',
    category: _TermCategory.aqeedah,
    en: 'The Hereafter. Life after death, encompassing resurrection, the Day of Judgment, and either eternal paradise or hellfire. A core pillar of Islamic belief. (Quran 2:4)',
    ar: 'الآخرة: الحياة بعد الممات، وتشمل البعث والحساب يوم القيامة والجنة أو النار. ركن أساسي في العقيدة الإسلامية. (القرآن 2:4)',
    ur: 'آخرت: موت کے بعد کی زندگی، جس میں قیامت، حساب، جنت یا جہنم شامل ہے۔ اسلامی عقیدے کا بنیادی رکن۔ (قرآن 2:4)',
    es: 'El Más Allá. La vida después de la muerte: resurrección, el Día del Juicio y el paraíso o el infierno eterno. Un pilar central de la creencia islámica. (Corán 2:4)',
  ),
  _Term(
    transliteration: 'Dunya',
    arabic: 'الدنيا',
    category: _TermCategory.aqeedah,
    en: 'This worldly life. Temporary and a test compared to the eternal Akhirah. The word dunya derives from a root meaning "low" or "close" — a reminder of its fleeting nature.',
    ar: 'الحياة الدنيا الزائلة. يُعلّم الإسلام أنها عابرة وابتلاء مقارنة بالآخرة. وكلمة "دنيا" مشتقة من معنى "الدنيء" أو "القريب" تذكيراً بزوالها.',
    ur: 'دنیوی زندگی۔ اسلام سکھاتا ہے کہ یہ عارضی اور امتحان ہے، آخرت کے مقابلے میں۔ لفظ "دنیا" کا مطلب "نیچا" یا "قریب" ہے، اس کی فانی فطرت کی یاد دہانی۔',
    es: 'Esta vida mundana. Temporal y una prueba comparada con la Akhirah eterna. La palabra dunya proviene de una raíz que significa "bajo" o "cercano" — recordatorio de su naturaleza pasajera.',
  ),
  _Term(
    transliteration: 'Ramadan',
    arabic: 'رمضان',
    category: _TermCategory.practice,
    en: 'The ninth month of the Islamic lunar calendar. A month of obligatory fasting, increased prayer, Quran recitation, and charity. The Quran was first revealed in this month. (Quran 2:185)',
    ar: 'الشهر التاسع في التقويم الهجري. شهر الصيام الواجب والقيام والتلاوة والصدقة. فيه أُنزل القرآن الكريم. شَهْرُ رَمَضَانَ الَّذِي أُنْزِلَ فِيهِ الْقُرْآنُ. (القرآن 2:185)',
    ur: 'اسلامی قمری کیلنڈر کا نواں مہینہ۔ فرض روزوں، رات کی نماز، قرآن کی تلاوت اور صدقے کا مہینہ۔ قرآن کریم اسی مہینے میں نازل ہوا۔ (قرآن 2:185)',
    es: 'El noveno mes del calendario lunar islámico. Un mes de ayuno obligatorio, aumento de la oración, recitación del Corán y caridad. El Corán fue revelado por primera vez en este mes. (Corán 2:185)',
  ),
  _Term(
    transliteration: 'Eid',
    arabic: 'العيد',
    category: _TermCategory.practice,
    en: 'An Islamic celebration. Eid al-Fitr marks the end of Ramadan; Eid al-Adha honors Ibrahim\'s willingness to sacrifice his son. Both begin with a special congregational prayer.',
    ar: 'عيد إسلامي للاحتفال: عيد الفطر يُحتفل به بعد رمضان، وعيد الأضحى في موسم الحج تخليداً لذكرى إبراهيم عليه السلام. يبدأ كل منهما بصلاة جماعية خاصة.',
    ur: 'اسلامی جشن۔ عید الفطر رمضان کے بعد منائی جاتی ہے اور عید الاضحی حضرت ابراہیم کی قربانی کی یاد میں۔ دونوں خصوصی نماز سے شروع ہوتی ہیں۔',
    es: 'Una celebración islámica. Eid al-Fitr marca el fin del Ramadán; Eid al-Adha honra la disposición de Ibrahim a sacrificar a su hijo. Ambas comienzan con una oración congregacional especial.',
  ),
  _Term(
    transliteration: "Jumu'ah",
    arabic: 'الجمعة',
    category: _TermCategory.practice,
    en: 'Friday. The day of congregational prayer. The midday Jumu\'ah prayer replaces Dhuhr and is obligatory for Muslim men. The Quran devotes a full surah to it. (Quran 62:9)',
    ar: 'يوم الجمعة المبارك. صلاة الجمعة تحلّ محل الظهر وهي واجبة على الرجال المسلمين. خصّها الله بسورة كاملة. (القرآن 62:9)',
    ur: 'جمعہ، مبارک دن۔ جمعہ کی نماز ظہر کی جگہ لیتی ہے اور مسلمان مردوں پر فرض ہے۔ قرآن کریم میں اس کے لیے پوری سورہ نازل کی گئی۔ (قرآن 62:9)',
    es: 'Viernes. El día de la oración congregacional. La oración del Jumu\'ah del mediodía reemplaza al Dhuhr y es obligatoria para los hombres musulmanes. El Corán le dedica una surah completa. (Corán 62:9)',
  ),
  _Term(
    transliteration: 'Salawat',
    arabic: 'الصلوات',
    category: _TermCategory.dhikr,
    en: 'Sending blessings upon Prophet Muhammad ﷺ by saying "Allahumma salli ala Muhammad." Allah and His angels do this, and believers are commanded to do likewise. (Quran 33:56)',
    ar: 'الصلاة والسلام على النبي محمد ﷺ بقول "اللهم صلِّ على محمد". يفعل ذلك الله وملائكته، ويُؤمر به المؤمنون. إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ. (القرآن 33:56)',
    ur: 'نبی محمد ﷺ پر درود: "اللہم صلِّ علی محمد"۔ اللہ اور اس کے فرشتے یہ کرتے ہیں، اور مومنین کو بھی اسی کا حکم دیا گیا ہے۔ (قرآن 33:56)',
    es: 'Enviar bendiciones sobre el Profeta Muhammad ﷺ diciendo "Allahumma salli ala Muhammad." Allah y Sus ángeles lo hacen, y los creyentes tienen el mandato de hacerlo. (Corán 33:56)',
  ),
  _Term(
    transliteration: 'Bismillah',
    arabic: 'بسم الله',
    category: _TermCategory.dhikr,
    en: '"In the name of Allah." Said before beginning any action — eating, drinking, reading, cooking — to seek Allah\'s blessing and start with His remembrance.',
    ar: '"بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ" تُقال قبل الشروع في أي عمل من أكل أو شرب أو قراءة، ابتغاء بركة الله والبدء بذكره.',
    ur: '"اللہ کے نام سے جو بڑا مہربان نہایت رحم والا ہے"۔ کوئی بھی کام شروع کرنے سے پہلے کہا جاتا ہے — کھانا، پینا، پڑھنا — اللہ کی برکت اور یاد کے ساتھ آغاز کرنے کے لیے۔',
    es: '"En el nombre de Allah." Dicho antes de comenzar cualquier acción — comer, beber, leer, cocinar — para buscar la bendición de Allah y comenzar con Su recuerdo.',
  ),
  _Term(
    transliteration: 'Alhamdulillah',
    arabic: 'الحمد لله',
    category: _TermCategory.dhikr,
    en: '"All praise is for Allah." Said in gratitude after a blessing or completing something. Also the opening of Surah Al-Fatiha, recited in every unit of prayer.',
    ar: '"الحمد لله" تُقال شكراً على النعم أو عند إتمام أمر ما. وهي مطلع سورة الفاتحة المتلوّة في كل ركعة من الصلاة.',
    ur: '"تمام تعریف اللہ کے لیے ہے"۔ نعمت پر یا کوئی کام مکمل ہونے پر کہا جاتا ہے۔ سورہ الفاتحہ کا آغاز بھی یہی ہے جو ہر رکعت میں پڑھی جاتی ہے۔',
    es: '"Toda la alabanza es para Allah." Dicho en gratitud tras una bendición o al completar algo. También es el comienzo de la Surah Al-Fatiha, recitada en cada unidad de oración.',
  ),
  _Term(
    transliteration: 'Inshallah',
    arabic: 'إن شاء الله',
    category: _TermCategory.dhikr,
    en: '"If Allah wills." Said when referring to future plans, acknowledging that nothing happens except by Allah\'s will. The Quran instructs this usage. (Quran 18:23–24)',
    ar: '"إن شاء الله" تُقال عند الحديث عن أمور مستقبلية إقراراً بأن كل شيء بيد الله. (القرآن 18:23-24)',
    ur: '"اگر اللہ نے چاہا"۔ مستقبل کے منصوبوں کا ذکر کرتے وقت کہا جاتا ہے، اس اعتراف میں کہ کچھ بھی اللہ کی مرضی کے بغیر نہیں ہوتا۔ قرآن نے اس کا حکم دیا ہے۔ (قرآن 18:23-24)',
    es: '"Si Allah quiere." Dicho al hablar de planes futuros, reconociendo que nada ocurre sino por la voluntad de Allah. El Corán instruye este uso. (Corán 18:23–24)',
  ),
  _Term(
    transliteration: 'Subhanallah',
    arabic: 'سبحان الله',
    category: _TermCategory.dhikr,
    en: '"Glory be to Allah." An expression of awe, admiration, and praise. Said when seeing something beautiful or hearing good news, affirming Allah is far above all imperfection.',
    ar: '"سبحان الله" تُقال تعبيراً عن الإجلال والتعجب، وتعني تنزيه الله عن كل نقص حين يُرى شيء جميل أو يُسمع خبر طيب.',
    ur: '"اللہ پاک ہے"۔ حیرت، تعریف یا خوف میں کہا جاتا ہے۔ کچھ خوبصورت دیکھنے یا اچھی خبر سننے پر اللہ کی پاکی بیان کی جاتی ہے۔',
    es: '"Gloria a Allah." Expresión de asombro, admiración y alabanza. Dicho al ver algo hermoso o al escuchar buenas noticias, afirmando que Allah está muy por encima de toda imperfección.',
  ),
  _Term(
    transliteration: 'Astaghfirullah',
    arabic: 'أستغفر الله',
    category: _TermCategory.dhikr,
    en: '"I seek forgiveness from Allah." Said when repenting, after a sin, or witnessing something wrong. The Prophet ﷺ said it over 70 times a day. (Sahih Bukhari)',
    ar: '"أستغفر الله" تُقال استغفاراً عند التوبة أو اقتراف خطأ أو مشاهدة ما يُكره. وكان النبي ﷺ يستغفر أكثر من سبعين مرة في اليوم. (صحيح البخاري)',
    ur: '"میں اللہ سے معافی مانگتا ہوں"۔ توبہ کرتے وقت، گناہ کے بعد، یا کچھ ناپسندیدہ دیکھنے پر کہا جاتا ہے۔ نبی ﷺ روزانہ 70 سے زائد مرتبہ کہتے تھے۔ (صحیح بخاری)',
    es: '"Busco el perdón de Allah." Dicho al arrepentirse, tras un pecado o al presenciar algo malo. El Profeta ﷺ lo decía más de 70 veces al día. (Sahih Bujari)',
  ),
  _Term(
    transliteration: "Masha'Allah",
    arabic: 'ما شاء الله',
    category: _TermCategory.dhikr,
    en: '"Whatever Allah has willed." Said in admiration of something beautiful or impressive, acknowledging all good comes from Allah alone. Also guards against the evil eye. (Quran 18:39)',
    ar: '"ما شاء الله" تُقال إعجاباً بشيء جميل، إقراراً بأن كل خير من عند الله وحده، وهي أيضاً وقاية من العين. (القرآن 18:39)',
    ur: '"جو اللہ نے چاہا"۔ کسی خوبصورت یا متاثر کن چیز کی تعریف میں کہا جاتا ہے، اس اعتراف میں کہ ہر بھلائی اللہ کی طرف سے ہے۔ نظر بد سے بھی حفاظت کرتی ہے۔ (قرآن 18:39)',
    es: '"Lo que Allah ha querido." Dicho en admiración por algo hermoso o impresionante, reconociendo que todo bien viene únicamente de Allah. También protege contra el mal de ojo. (Corán 18:39)',
  ),
  _Term(
    transliteration: 'Qadar',
    arabic: 'القدر',
    category: _TermCategory.aqeedah,
    en: 'Divine decree. The belief that Allah has knowledge of all things and everything occurs by His will. One of the six pillars of iman. "No calamity befalls except by Allah\'s permission." (Quran 64:11)',
    ar: 'القدر: الإيمان بأن الله عالم بكل شيء وأن كل ما يجري بعلمه وإرادته. ركن من أركان الإيمان الستة. مَا أَصَابَ مِنْ مُصِيبَةٍ إِلَّا بِإِذْنِ اللَّهِ. (القرآن 64:11)',
    ur: 'تقدیر الٰہی: یقین کہ اللہ تمام چیزوں کا علم رکھتا ہے اور سب کچھ اس کی مرضی سے ہوتا ہے۔ ایمان کے چھ ارکان میں سے ایک۔ "کوئی مصیبت نہیں آتی مگر اللہ کے حکم سے۔" (قرآن 64:11)',
    es: 'Decreto divino. La creencia de que Allah tiene conocimiento de todas las cosas y todo ocurre por Su voluntad. Uno de los seis pilares del iman. "Ninguna calamidad ocurre sino con permiso de Allah." (Corán 64:11)',
  ),

  // ── Fiqh / Islamic Law ──────────────────────────────────────────────────────

  _Term(
    transliteration: 'Makruh',
    arabic: 'المكروه',
    category: _TermCategory.fiqh,
    en: 'Disliked but not sinful. An action that is better to avoid but carries no punishment if done. For example, wasting water during wudu.',
    ar: 'ما لا يُحبّ فعله شرعاً دون أن يكون حراماً. تركه أفضل ولا إثم على فاعله، كالإسراف في ماء الوضوء.',
    ur: 'ناپسندیدہ مگر گناہ نہیں۔ جس کام سے بچنا بہتر ہے لیکن کرنے پر سزا نہیں۔ مثلاً وضو میں پانی ضائع کرنا۔',
    es: 'Desaconsejado pero no pecaminoso. Una acción que es mejor evitar, pero no conlleva castigo si se realiza. Por ejemplo, desperdiciar agua durante el wudu.',
  ),
  _Term(
    transliteration: 'Mustahabb',
    arabic: 'المستحب',
    category: _TermCategory.fiqh,
    en: 'Recommended. An action that is rewarded if done but not sinful if left. Examples include using the miswak and praying voluntary prayers.',
    ar: 'ما يُثاب فاعله ولا يُعاقب تاركه، كالسواك وصلوات النوافل.',
    ur: 'مستحب: جس کام پر ثواب ملے اور نہ کرنے پر گناہ نہیں، جیسے مسواک اور نفل نمازیں۔',
    es: 'Recomendado. Una acción que es recompensada si se realiza pero no es pecaminosa si se omite. Ejemplos incluyen usar el miswak y rezar oraciones voluntarias.',
  ),
  _Term(
    transliteration: 'Mubah',
    arabic: 'المباح',
    category: _TermCategory.fiqh,
    en: 'Permissible and neutral. An action that carries no reward or sin, such as choosing what color clothes to wear.',
    ar: 'ما لا ثواب في فعله ولا إثم في تركه، كاختيار لون الثياب.',
    ur: 'جائز اور غیر جانبدار۔ جس میں نہ ثواب ہے نہ گناہ، جیسے لباس کا رنگ چننا۔',
    es: 'Permisible y neutral. Una acción que no conlleva recompensa ni pecado, como elegir el color de la ropa.',
  ),
  _Term(
    transliteration: 'Wajib',
    arabic: 'الواجب',
    category: _TermCategory.fiqh,
    en: 'Obligatory. A duty that must be performed. Leaving it without excuse is sinful. In the Hanafi school, wajib is slightly below fard in certainty.',
    ar: 'الواجب: ما يلزم المسلم أداؤه، وتركه بلا عذر إثم. في المذهب الحنفي يقل عن الفرض في قطعية الدليل.',
    ur: 'واجب: جو ضرور کرنا چاہیے، بغیر عذر چھوڑنا گناہ ہے۔ حنفی مسلک میں فرض سے ذرا کم درجے کا۔',
    es: 'Obligatorio. Un deber que debe cumplirse. Dejarlo sin excusa es pecado. En la escuela Hanafi, wajib está ligeramente por debajo de fard en certeza.',
  ),
  _Term(
    transliteration: 'Fard',
    arabic: 'الفرض',
    category: _TermCategory.fiqh,
    en: 'An absolute obligation established by clear evidence from the Quran or Sunnah. Denying a fard takes one outside the fold of Islam. The five daily prayers are fard.',
    ar: 'فريضة قطعية الثبوت والدلالة من القرآن أو السنة. إنكار الفرض يُخرج من الإسلام. الصلوات الخمس فرض.',
    ur: 'قرآن یا سنت سے ثابت قطعی فریضہ۔ فرض کا انکار اسلام سے خارج کر دیتا ہے۔ پانچ وقت کی نمازیں فرض ہیں۔',
    es: 'Una obligación absoluta establecida por evidencia clara del Corán o la Sunnah. Negar un fard saca a la persona del Islam. Las cinco oraciones diarias son fard.',
  ),
  _Term(
    transliteration: 'Sunnah Muakkadah',
    arabic: 'السنة المؤكدة',
    category: _TermCategory.fiqh,
    en: 'A strongly emphasized Sunnah. An act the Prophet ﷺ performed consistently and rarely left. Leaving it habitually is blameworthy, such as the two rakah before Fajr.',
    ar: 'سنة واظب عليها النبي ﷺ ولم يتركها إلا نادراً. تركها عادةً مذموم، كركعتي سنة الفجر.',
    ur: 'وہ سنت جو نبی ﷺ نے ہمیشہ ادا کی اور شاذ ہی چھوڑی۔ عادتاً چھوڑنا قابل مذمت ہے، جیسے فجر سے پہلے کی دو رکعتیں۔',
    es: 'Una Sunnah fuertemente enfatizada. Un acto que el Profeta ﷺ realizaba constantemente y rara vez dejaba. Dejarlo habitualmente es censurable, como las dos rakah antes de Fajr.',
  ),
  _Term(
    transliteration: 'Ghusl',
    arabic: 'الغسل',
    category: _TermCategory.fiqh,
    en: 'Full-body ritual washing required after certain states, such as marital relations or menstruation. Also recommended before Friday prayer and Eid. (Quran 5:6)',
    ar: 'الاغتسال الكامل الواجب بعد الجنابة أو الحيض، والمستحب قبل صلاة الجمعة والعيدين. (القرآن 5:6)',
    ur: 'جنابت یا حیض کے بعد واجب مکمل غسل۔ جمعہ اور عید سے پہلے بھی مستحب ہے۔ (قرآن 5:6)',
    es: 'Lavado ritual de todo el cuerpo requerido tras ciertos estados, como las relaciones conyugales o la menstruación. También recomendado antes de la oración del viernes y el Eid. (Corán 5:6)',
  ),
  _Term(
    transliteration: 'Tayammum',
    arabic: 'التيمم',
    category: _TermCategory.fiqh,
    en: 'Dry purification using clean earth or dust when water is unavailable or harmful to use. A mercy from Allah that allows prayer in any circumstance. (Quran 4:43)',
    ar: 'التطهر بالتراب الطاهر عند فقدان الماء أو العجز عن استعماله. رخصة من الله تُتيح الصلاة في كل حال. (القرآن 4:43)',
    ur: 'پانی نہ ملنے یا استعمال نہ کر سکنے پر پاک مٹی سے طہارت۔ اللہ کی رحمت جو ہر حال میں نماز ممکن بناتی ہے۔ (قرآن 4:43)',
    es: 'Purificación seca usando tierra limpia cuando el agua no está disponible o su uso es dañino. Una misericordia de Allah que permite orar en cualquier circunstancia. (Corán 4:43)',
  ),
  _Term(
    transliteration: 'Najis',
    arabic: 'النجس',
    category: _TermCategory.fiqh,
    en: 'Ritually impure. Substances like blood, urine, or alcohol that must be cleaned before prayer. Knowing what is najis helps Muslims maintain ritual purity.',
    ar: 'ما كان نجساً شرعاً كالدم والبول والخمر، يجب إزالته قبل الصلاة. معرفة النجاسات تُعين المسلم على الطهارة.',
    ur: 'شرعی طور پر ناپاک، جیسے خون، پیشاب، شراب۔ نماز سے پہلے صاف کرنا ضروری ہے۔',
    es: 'Ritualmente impuro. Sustancias como sangre, orina o alcohol que deben limpiarse antes de la oración. Saber qué es najis ayuda a los musulmanes a mantener la pureza ritual.',
  ),

  // ── Prayer Terms ────────────────────────────────────────────────────────────

  _Term(
    transliteration: "Rak'ah",
    arabic: 'الركعة',
    category: _TermCategory.practice,
    en: 'One unit of prayer. Each rakah includes standing, bowing, and two prostrations. Fajr has 2 rakah, Dhuhr 4, Asr 4, Maghrib 3, and Isha 4.',
    ar: 'وحدة الصلاة الواحدة، وتشمل القيام والركوع وسجدتين. الفجر ركعتان، والظهر والعصر والعشاء أربع، والمغرب ثلاث.',
    ur: 'نماز کی ایک اکائی۔ ہر رکعت میں قیام، رکوع اور دو سجدے شامل ہیں۔ فجر 2، ظہر 4، عصر 4، مغرب 3، عشاء 4 رکعات۔',
    es: 'Una unidad de oración. Cada rakah incluye estar de pie, inclinarse y dos postraciones. Fajr tiene 2, Dhuhr 4, Asr 4, Maghrib 3 e Isha 4 rakah.',
  ),
  _Term(
    transliteration: 'Sujood',
    arabic: 'السجود',
    category: _TermCategory.practice,
    en: 'Prostration. Placing the forehead, nose, palms, knees, and toes on the ground. The closest a servant is to Allah. Done twice in each rakah. (Sahih Muslim)',
    ar: 'السجود: وضع الجبهة والأنف والكفين والركبتين وأطراف القدمين على الأرض. أقرب ما يكون العبد من ربه وهو ساجد. يُفعل مرتين في كل ركعة. (صحيح مسلم)',
    ur: 'سجدہ: پیشانی، ناک، ہتھیلیاں، گھٹنے اور پاؤں کی انگلیاں زمین پر رکھنا۔ بندہ اللہ سے سب سے قریب سجدے میں ہوتا ہے۔ ہر رکعت میں دو بار۔ (صحیح مسلم)',
    es: 'Postración. Colocar la frente, nariz, palmas, rodillas y dedos de los pies en el suelo. El momento más cercano del siervo a Allah. Se realiza dos veces en cada rakah. (Sahih Muslim)',
  ),
  _Term(
    transliteration: "Ruku'",
    arabic: 'الركوع',
    category: _TermCategory.practice,
    en: 'Bowing. Bending at the waist with hands on the knees, saying "Subhana Rabbiyal Adheem" (Glory to my Lord, the Magnificent). Done once in each rakah.',
    ar: 'الانحناء في الصلاة مع وضع اليدين على الركبتين وقول "سبحان ربي العظيم". يُفعل مرة في كل ركعة.',
    ur: 'رکوع: کمر سے جھکنا، ہاتھ گھٹنوں پر رکھنا اور "سبحان ربی العظیم" کہنا۔ ہر رکعت میں ایک بار۔',
    es: 'Inclinación. Doblarse por la cintura con las manos sobre las rodillas, diciendo "Subhana Rabbiyal Adheem" (Gloria a mi Señor, el Magnífico). Se hace una vez en cada rakah.',
  ),
  _Term(
    transliteration: "Khushu'",
    arabic: 'الخشوع',
    category: _TermCategory.practice,
    en: 'Deep concentration and humility in prayer. Being fully present with your heart and mind before Allah. The believers who have khushu in prayer are described as successful. (Quran 23:1–2)',
    ar: 'الخشوع: حضور القلب والتواضع في الصلاة. وصف الله المؤمنين الخاشعين بالفلاح. قَدْ أَفْلَحَ الْمُؤْمِنُونَ الَّذِينَ هُمْ فِي صَلَاتِهِمْ خَاشِعُونَ. (القرآن 23:1-2)',
    ur: 'نماز میں دل کی حاضری اور عاجزی۔ اللہ کے سامنے دل و دماغ سے مکمل حاضر ہونا۔ قرآن میں خشوع والے نمازیوں کو کامیاب کہا گیا ہے۔ (قرآن 23:1-2)',
    es: 'Concentración profunda y humildad en la oración. Estar completamente presente con el corazón y la mente ante Allah. Los creyentes con khushu son descritos como exitosos. (Corán 23:1–2)',
  ),
  _Term(
    transliteration: 'Takbir',
    arabic: 'التكبير',
    category: _TermCategory.practice,
    en: 'Saying "Allahu Akbar" (Allah is the Greatest). Said when starting prayer, transitioning between positions, and during Eid celebrations.',
    ar: 'قول "الله أكبر"، يُقال عند تكبيرة الإحرام والانتقال بين أركان الصلاة وفي تكبيرات العيد.',
    ur: '"اللہ اکبر" کہنا (اللہ سب سے بڑا ہے)۔ نماز شروع کرتے وقت، ارکان کے درمیان اور عید کی تکبیرات میں کہا جاتا ہے۔',
    es: 'Decir "Allahu Akbar" (Allah es el Más Grande). Dicho al iniciar la oración, al transitar entre posiciones y durante las celebraciones del Eid.',
  ),
  _Term(
    transliteration: 'Tashahhud',
    arabic: 'التشهد',
    category: _TermCategory.practice,
    en: 'The testimony recited while sitting in prayer after the second and final rakah. Begins with "At-Tahiyyatu lillahi" and includes sending peace upon the Prophet ﷺ.',
    ar: 'التشهد: ما يُقرأ في الجلوس بعد الركعة الثانية والأخيرة. يبدأ بـ"التحيات لله" ويتضمن الصلاة على النبي ﷺ.',
    ur: 'تشہد: دوسری اور آخری رکعت کے بعد بیٹھ کر پڑھا جانے والا کلام۔ "التحیات للہ" سے شروع ہوتا ہے اور نبی ﷺ پر درود شامل ہے۔',
    es: 'El testimonio recitado sentado en la oración después de la segunda y última rakah. Comienza con "At-Tahiyyatu lillahi" e incluye enviar paz al Profeta ﷺ.',
  ),

  // ── Quran Terms ─────────────────────────────────────────────────────────────

  _Term(
    transliteration: 'Ayah',
    arabic: 'الآية',
    category: _TermCategory.quran,
    en: 'A verse of the Quran. Literally means "sign" or "miracle." The Quran contains over 6,200 ayat across 114 surahs.',
    ar: 'آية من آيات القرآن الكريم. معناها اللغوي "علامة" أو "معجزة". يحتوي القرآن على أكثر من 6200 آية في 114 سورة.',
    ur: 'قرآن کی ایک آیت۔ لغوی معنی "نشانی" یا "معجزہ"۔ قرآن میں 114 سورتوں میں 6200 سے زائد آیات ہیں۔',
    es: 'Un versículo del Corán. Literalmente significa "signo" o "milagro." El Corán contiene más de 6,200 ayat en 114 surahs.',
  ),
  _Term(
    transliteration: 'Surah',
    arabic: 'السورة',
    category: _TermCategory.quran,
    en: 'A chapter of the Quran. There are 114 surahs, ranging from 3 verses (Al-Kawthar) to 286 verses (Al-Baqarah). Each has a name and theme.',
    ar: 'سورة من سور القرآن الكريم. عدد السور 114، تتراوح من 3 آيات (الكوثر) إلى 286 آية (البقرة). لكل سورة اسم وموضوع.',
    ur: 'قرآن کا ایک باب۔ کل 114 سورتیں ہیں، 3 آیات (الکوثر) سے 286 آیات (البقرہ) تک۔ ہر ایک کا نام اور موضوع ہے۔',
    es: 'Un capítulo del Corán. Hay 114 surahs, desde 3 versículos (Al-Kawthar) hasta 286 (Al-Baqarah). Cada una tiene un nombre y un tema.',
  ),
  _Term(
    transliteration: 'Juz',
    arabic: 'الجزء',
    category: _TermCategory.quran,
    en: 'One of 30 equal parts of the Quran. Dividing the Quran into 30 juz makes it easy to complete the entire Quran in one month, especially during Ramadan.',
    ar: 'واحد من ثلاثين جزءاً متساوياً من القرآن. يُسهّل تقسيم القرآن ختمه في شهر، خاصة في رمضان.',
    ur: 'قرآن کے 30 برابر حصوں میں سے ایک۔ اس تقسیم سے ایک مہینے میں، خاص طور پر رمضان میں، پورا قرآن ختم کرنا آسان ہوتا ہے۔',
    es: 'Una de las 30 partes iguales del Corán. Dividir el Corán en 30 juz facilita completarlo en un mes, especialmente durante el Ramadán.',
  ),
  _Term(
    transliteration: 'Hizb',
    arabic: 'الحزب',
    category: _TermCategory.quran,
    en: 'Half of a juz. The Quran is divided into 60 hizb. Some Muslims use hizb markers to plan their daily Quran reading schedule.',
    ar: 'نصف الجزء. يُقسَم القرآن إلى ستين حزباً. يستخدم بعض المسلمين علامات الأحزاب لتنظيم ورد التلاوة اليومي.',
    ur: 'ایک جز کا آدھا حصہ۔ قرآن 60 احزاب میں تقسیم ہے۔ کچھ مسلمان روزانہ تلاوت کے لیے حزب کی تقسیم استعمال کرتے ہیں۔',
    es: 'La mitad de un juz. El Corán se divide en 60 hizb. Algunos musulmanes usan los marcadores de hizb para planificar su lectura diaria del Corán.',
  ),
  _Term(
    transliteration: 'Makhraj',
    arabic: 'المخرج',
    category: _TermCategory.quran,
    en: 'The point of articulation for each Arabic letter. Learning makhraj is essential for correct Quran recitation and tajweed, so each letter sounds as it was revealed.',
    ar: 'موضع خروج الحرف العربي من الفم أو الحلق. تعلّم المخارج ضروري لتلاوة القرآن الصحيحة وتطبيق أحكام التجويد.',
    ur: 'ہر عربی حرف کا ادائیگی کا مقام۔ مخارج سیکھنا قرآن کی درست تلاوت اور تجوید کے لیے ضروری ہے۔',
    es: 'El punto de articulación de cada letra árabe. Aprender los makhraj es esencial para la recitación correcta del Corán y el tajweed.',
  ),
  _Term(
    transliteration: 'Tarteel',
    arabic: 'الترتيل',
    category: _TermCategory.quran,
    en: 'Slow, measured, and beautiful recitation of the Quran. Allah commands: "Recite the Quran with tarteel." It allows reflection on the meaning of each verse. (Quran 73:4)',
    ar: 'تلاوة القرآن بتأنٍّ وتدبر وتحسين. أمر الله بها: وَرَتِّلِ الْقُرْآنَ تَرْتِيلاً. تُمكّن من التفكر في معاني الآيات. (القرآن 73:4)',
    ur: 'قرآن کی سست رفتار، منضبط اور خوبصورت تلاوت۔ اللہ کا حکم: "قرآن کو ترتیل سے پڑھو۔" ہر آیت پر غور و فکر ممکن بناتی ہے۔ (قرآن 73:4)',
    es: 'Recitación lenta, medida y hermosa del Corán. Allah ordena: "Recita el Corán con tarteel." Permite reflexionar sobre el significado de cada versículo. (Corán 73:4)',
  ),
  _Term(
    transliteration: "I'jaz",
    arabic: 'الإعجاز',
    category: _TermCategory.quran,
    en: 'The miraculous inimitability of the Quran. No human or jinn can produce anything like it in language, meaning, or structure. Allah challenges all creation to try. (Quran 17:88)',
    ar: 'إعجاز القرآن: عجز الإنس والجن عن الإتيان بمثله لغةً ومعنىً وبياناً. تحدى الله الخلق أجمعين بذلك. (القرآن 17:88)',
    ur: 'قرآن کا اعجاز: کوئی انسان یا جن اس جیسا کلام نہیں بنا سکتا، نہ زبان میں نہ معنی میں۔ اللہ نے تمام مخلوق کو چیلنج کیا ہے۔ (قرآن 17:88)',
    es: 'La inimitabilidad milagrosa del Corán. Ningún humano ni jinn puede producir algo similar en lenguaje, significado o estructura. Allah desafía a toda la creación a intentarlo. (Corán 17:88)',
  ),

  // ── Islamic History ─────────────────────────────────────────────────────────

  _Term(
    transliteration: 'Hijra',
    arabic: 'الهجرة',
    category: _TermCategory.history,
    en: 'The migration of Prophet Muhammad ﷺ and his companions from Makkah to Madinah in 622 CE. It marks the start of the Islamic calendar and was a turning point for Islam.',
    ar: 'هجرة النبي محمد ﷺ وأصحابه من مكة إلى المدينة عام 622م. تُمثّل بداية التقويم الهجري ونقطة تحول في تاريخ الإسلام.',
    ur: 'نبی محمد ﷺ اور صحابہ کا مکہ سے مدینہ ہجرت کرنا 622ء میں۔ اسلامی کیلنڈر کا آغاز اور اسلام کی تاریخ کا اہم موڑ۔',
    es: 'La migración del Profeta Muhammad ﷺ y sus compañeros de La Meca a Medina en 622 d.C. Marca el inicio del calendario islámico y fue un punto de inflexión para el Islam.',
  ),
  _Term(
    transliteration: 'Sahaba',
    arabic: 'الصحابة',
    category: _TermCategory.history,
    en: 'The companions of Prophet Muhammad ﷺ who met him, believed in him, and died as Muslims. They are the best generation of this Ummah and the primary transmitters of Islam.',
    ar: 'أصحاب النبي ﷺ الذين لقوه مؤمنين به وماتوا على الإسلام. هم خير القرون وأوائل ناقلي الإسلام.',
    ur: 'نبی محمد ﷺ کے صحابہ جنہوں نے آپ سے ملاقات کی، ایمان لائے اور اسلام پر فوت ہوئے۔ اس امت کی بہترین نسل اور اسلام کے اولین ناقلین۔',
    es: 'Los compañeros del Profeta Muhammad ﷺ que lo conocieron, creyeron en él y murieron como musulmanes. Son la mejor generación de esta Ummah y los principales transmisores del Islam.',
  ),
  _Term(
    transliteration: "Tabi'een",
    arabic: 'التابعون',
    category: _TermCategory.history,
    en: 'The generation after the Sahaba. They learned Islam directly from the companions and are considered the second-best generation in Islamic history. (Sahih Bukhari)',
    ar: 'الجيل الذي تلا الصحابة وتعلّم الإسلام منهم مباشرة. هم ثاني خير القرون في تاريخ الإسلام. (صحيح البخاري)',
    ur: 'صحابہ کے بعد کی نسل جنہوں نے براہ راست صحابہ سے اسلام سیکھا۔ اسلامی تاریخ کی دوسری بہترین نسل۔ (صحیح بخاری)',
    es: 'La generación posterior a los Sahaba. Aprendieron el Islam directamente de los compañeros y son considerados la segunda mejor generación en la historia islámica. (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Ansar',
    arabic: 'الأنصار',
    category: _TermCategory.history,
    en: 'The "Helpers" — the Muslims of Madinah who welcomed and supported the Prophet ﷺ and the Muhajireen after the Hijra. Allah praised them for their generosity. (Quran 59:9)',
    ar: 'مسلمو المدينة الذين آووا النبي ﷺ والمهاجرين ونصروهم. أثنى الله عليهم لسخائهم وإيثارهم. (القرآن 59:9)',
    ur: '"انصار" — مدینہ کے مسلمان جنہوں نے ہجرت کے بعد نبی ﷺ اور مہاجرین کا استقبال اور مدد کی۔ اللہ نے ان کی سخاوت کی تعریف کی۔ (قرآن 59:9)',
    es: 'Los "Auxiliadores" — los musulmanes de Medina que acogieron y apoyaron al Profeta ﷺ y a los Muhajireen tras la Hégira. Allah los elogió por su generosidad. (Corán 59:9)',
  ),
  _Term(
    transliteration: 'Muhajireen',
    arabic: 'المهاجرون',
    category: _TermCategory.history,
    en: 'The "Emigrants" — the early Muslims who left their homes, families, and wealth in Makkah to migrate to Madinah for the sake of Allah. (Quran 59:8)',
    ar: 'المسلمون الأوائل الذين تركوا ديارهم وأموالهم وأهلهم في مكة وهاجروا إلى المدينة في سبيل الله. (القرآن 59:8)',
    ur: '"مہاجرین" — ابتدائی مسلمان جنہوں نے اللہ کی خاطر مکہ میں اپنے گھر، خاندان اور مال چھوڑ کر مدینہ ہجرت کی۔ (قرآن 59:8)',
    es: 'Los "Emigrantes" — los primeros musulmanes que dejaron sus hogares, familias y riquezas en La Meca para migrar a Medina por la causa de Allah. (Corán 59:8)',
  ),
  _Term(
    transliteration: 'Khulafa al-Rashideen',
    arabic: 'الخلفاء الراشدون',
    category: _TermCategory.history,
    en: 'The Rightly Guided Caliphs: Abu Bakr, Umar, Uthman, and Ali (may Allah be pleased with them). They led the Muslim community after the Prophet ﷺ with justice and wisdom.',
    ar: 'الخلفاء الراشدون الأربعة: أبو بكر وعمر وعثمان وعلي رضي الله عنهم. قادوا الأمة بعد النبي ﷺ بالعدل والحكمة.',
    ur: 'خلفائے راشدین: ابوبکر، عمر، عثمان اور علی رضی اللہ عنہم۔ نبی ﷺ کے بعد انہوں نے عدل اور حکمت سے مسلم امت کی قیادت کی۔',
    es: 'Los Califas Bien Guiados: Abu Bakr, Umar, Uzman y Ali (que Allah esté complacido con ellos). Lideraron la comunidad musulmana después del Profeta ﷺ con justicia y sabiduría.',
  ),

  // ── Aqeedah / Belief ────────────────────────────────────────────────────────

  _Term(
    transliteration: 'Tawheed',
    arabic: 'التوحيد',
    category: _TermCategory.aqeedah,
    en: 'The oneness of Allah — the most fundamental belief in Islam. Allah alone deserves worship, has no partners, and there is nothing like Him. (Quran 112:1–4)',
    ar: 'توحيد الله: أساس العقيدة الإسلامية. الله وحده يستحق العبادة، لا شريك له ولَيْسَ كَمِثْلِهِ شَيْءٌ. قُلْ هُوَ اللَّهُ أَحَدٌ. (القرآن 112:1-4)',
    ur: 'اللہ کی وحدانیت — اسلام کا سب سے بنیادی عقیدہ۔ صرف اللہ عبادت کا مستحق ہے، اس کا کوئی شریک نہیں اور اس جیسا کوئی نہیں۔ (قرآن 112:1-4)',
    es: 'La unicidad de Allah — la creencia más fundamental del Islam. Solo Allah merece adoración, no tiene asociados y nada se le asemeja. (Corán 112:1–4)',
  ),
  _Term(
    transliteration: 'Shirk',
    arabic: 'الشرك',
    category: _TermCategory.aqeedah,
    en: 'Associating partners with Allah. The gravest sin in Islam, which Allah does not forgive if one dies upon it. It includes worshipping anything besides Allah. (Quran 4:48)',
    ar: 'الإشراك بالله: أعظم الذنوب في الإسلام، لا يُغفر لمن مات عليه. يشمل عبادة أي شيء غير الله. إِنَّ اللَّهَ لَا يَغْفِرُ أَنْ يُشْرَكَ بِهِ. (القرآن 4:48)',
    ur: 'اللہ کے ساتھ شریک ٹھہرانا۔ اسلام میں سب سے بڑا گناہ جسے اللہ معاف نہیں کرتا اگر اس پر مرے۔ اللہ کے سوا کسی کی عبادت شرک ہے۔ (قرآن 4:48)',
    es: 'Asociar socios con Allah. El pecado más grave en el Islam, que Allah no perdona si se muere en él. Incluye adorar cualquier cosa además de Allah. (Corán 4:48)',
  ),
  _Term(
    transliteration: 'Kufr',
    arabic: 'الكفر',
    category: _TermCategory.aqeedah,
    en: 'Disbelief or rejection of faith. Denying what Allah has clearly revealed. Muslims are taught to seek knowledge, avoid arrogance, and ask Allah for steadfastness.',
    ar: 'الكفر: إنكار ما أنزل الله أو الجحود به. يُعلَّم المسلم طلب العلم واجتناب الكبر وسؤال الله الثبات.',
    ur: 'کفر: اللہ کے واضح احکامات کا انکار۔ مسلمانوں کو سکھایا جاتا ہے کہ علم حاصل کریں، تکبر سے بچیں اور اللہ سے ثابت قدمی مانگیں۔',
    es: 'Incredulidad o rechazo de la fe. Negar lo que Allah ha revelado claramente. Se enseña a los musulmanes a buscar conocimiento, evitar la arrogancia y pedir a Allah firmeza.',
  ),
  _Term(
    transliteration: 'Nifaq',
    arabic: 'النفاق',
    category: _TermCategory.aqeedah,
    en: 'Hypocrisy. Outwardly claiming faith while hiding disbelief in the heart. The Quran warns that hypocrites will be in the lowest depths of the Fire. (Quran 4:145)',
    ar: 'النفاق: إظهار الإيمان وإبطان الكفر. حذّر القرآن بأن المنافقين في الدرك الأسفل من النار. إِنَّ الْمُنَافِقِينَ فِي الدَّرْكِ الْأَسْفَلِ مِنَ النَّارِ. (القرآن 4:145)',
    ur: 'منافقت: ظاہری طور پر ایمان کا دعویٰ اور دل میں کفر چھپانا۔ قرآن نے خبردار کیا کہ منافقین جہنم کے سب سے نچلے درجے میں ہوں گے۔ (قرآن 4:145)',
    es: 'Hipocresía. Profesar fe exteriormente mientras se oculta la incredulidad en el corazón. El Corán advierte que los hipócritas estarán en lo más profundo del Fuego. (Corán 4:145)',
  ),
  _Term(
    transliteration: 'Barzakh',
    arabic: 'البرزخ',
    category: _TermCategory.aqeedah,
    en: 'The barrier between this life and the Hereafter. The realm where the soul resides after death until the Day of Resurrection. (Quran 23:100)',
    ar: 'الحاجز بين الدنيا والآخرة. عالم تستقر فيه الروح بعد الموت حتى يوم القيامة. حَتَّى إِذَا جَاءَ أَحَدَهُمُ الْمَوْتُ قَالَ رَبِّ ارْجِعُونِ. (القرآن 23:100)',
    ur: 'دنیا اور آخرت کے درمیان کا پردہ۔ موت کے بعد روح قیامت تک اس عالم میں رہتی ہے۔ (قرآن 23:100)',
    es: 'La barrera entre esta vida y el Más Allá. El reino donde el alma reside después de la muerte hasta el Día de la Resurrección. (Corán 23:100)',
  ),
  _Term(
    transliteration: 'Ruh',
    arabic: 'الروح',
    category: _TermCategory.aqeedah,
    en: 'The soul. The essence of life breathed into every person by Allah. Its true nature is known only to Allah. "They ask you about the soul. Say: the soul is from the command of my Lord." (Quran 17:85)',
    ar: 'الروح: جوهر الحياة الذي نفخه الله في كل إنسان. حقيقتها لا يعلمها إلا الله. وَيَسْأَلُونَكَ عَنِ الرُّوحِ قُلِ الرُّوحُ مِنْ أَمْرِ رَبِّي. (القرآن 17:85)',
    ur: 'روح: زندگی کا جوہر جو اللہ نے ہر انسان میں پھونکا۔ اس کی حقیقت صرف اللہ جانتا ہے۔ "وہ آپ سے روح کے بارے میں پوچھتے ہیں، کہیے: روح میرے رب کے حکم سے ہے۔" (قرآن 17:85)',
    es: 'El alma. La esencia de la vida insuflada en cada persona por Allah. Su verdadera naturaleza solo es conocida por Allah. "Te preguntan sobre el alma. Di: el alma es asunto de mi Señor." (Corán 17:85)',
  ),
  _Term(
    transliteration: 'Fitrah',
    arabic: 'الفطرة',
    category: _TermCategory.aqeedah,
    en: 'The natural disposition. Every person is born with an innate awareness of Allah and inclination toward good. Islam is seen as the religion of fitrah. (Quran 30:30, Sahih Muslim)',
    ar: 'الفطرة: الطبيعة السوية التي خُلق عليها كل إنسان ـ معرفة فطرية بالله وميل للخير. الإسلام دين الفطرة. فَأَقِمْ وَجْهَكَ لِلدِّينِ حَنِيفاً فِطْرَتَ اللَّهِ. (القرآن 30:30)',
    ur: 'فطرت: ہر انسان میں پیدائشی طور پر اللہ کی پہچان اور نیکی کی طرف جھکاؤ۔ اسلام فطرت کا دین ہے۔ (قرآن 30:30، صحیح مسلم)',
    es: 'La disposición natural. Cada persona nace con una conciencia innata de Allah y una inclinación hacia el bien. El Islam es visto como la religión de la fitrah. (Corán 30:30, Sahih Muslim)',
  ),

  // ── Daily Life & Character ──────────────────────────────────────────────────

  _Term(
    transliteration: 'Rizq',
    arabic: 'الرزق',
    category: _TermCategory.practice,
    en: 'Sustenance and provision from Allah. Includes food, wealth, health, knowledge, and even good relationships. All rizq is determined and provided by Allah alone. (Quran 11:6)',
    ar: 'ما يرزق الله به عباده من طعام ومال وصحة وعلم وعلاقات طيبة. كل الرزق مقدّر من الله وحده. وَمَا مِنْ دَابَّةٍ فِي الْأَرْضِ إِلَّا عَلَى اللَّهِ رِزْقُهَا. (القرآن 11:6)',
    ur: 'اللہ کی طرف سے رزق: کھانا، مال، صحت، علم، اچھے رشتے سب شامل ہیں۔ تمام رزق صرف اللہ مقرر کرتا ہے اور دیتا ہے۔ (قرآن 11:6)',
    es: 'Sustento y provisión de Allah. Incluye alimento, riqueza, salud, conocimiento e incluso buenas relaciones. Todo rizq es determinado y provisto solo por Allah. (Corán 11:6)',
  ),
  _Term(
    transliteration: 'Sadaqah',
    arabic: 'الصدقة',
    category: _TermCategory.practice,
    en: 'Voluntary charity given for the sake of Allah. It can be money, a kind word, a smile, or removing harm from a path. Even a smile is sadaqah. (Sahih Muslim)',
    ar: 'صدقة تطوعية لوجه الله، تشمل المال والكلمة الطيبة والابتسامة وإماطة الأذى عن الطريق. حتى التبسم في وجه أخيك صدقة. (صحيح مسلم)',
    ur: 'اللہ کی خاطر رضاکارانہ صدقہ۔ پیسے، اچھی بات، مسکراہٹ، یا راستے سے تکلیف دہ چیز ہٹانا — سب صدقہ ہے۔ مسکرانا بھی صدقہ ہے۔ (صحیح مسلم)',
    es: 'Caridad voluntaria dada por Allah. Puede ser dinero, una palabra amable, una sonrisa o quitar un obstáculo del camino. Incluso una sonrisa es sadaqah. (Sahih Muslim)',
  ),
  _Term(
    transliteration: 'Istighfar',
    arabic: 'الاستغفار',
    category: _TermCategory.dhikr,
    en: 'Seeking forgiveness from Allah repeatedly. Beyond single repentance, it is a constant practice. The Prophet ﷺ sought forgiveness more than 70 times daily despite being sinless. (Sahih Bukhari)',
    ar: 'طلب المغفرة من الله بصفة مستمرة. كان النبي ﷺ يستغفر أكثر من سبعين مرة في اليوم رغم عصمته. (صحيح البخاري)',
    ur: 'اللہ سے بار بار معافی مانگنا۔ نبی ﷺ معصوم ہونے کے باوجود روزانہ 70 سے زائد بار استغفار کرتے تھے۔ (صحیح بخاری)',
    es: 'Buscar el perdón de Allah repetidamente. Más allá del arrepentimiento único, es una práctica constante. El Profeta ﷺ lo hacía más de 70 veces al día a pesar de ser infalible. (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Umrah',
    arabic: 'العمرة',
    category: _TermCategory.practice,
    en: 'The lesser pilgrimage to Makkah. Unlike Hajj, it can be performed at any time of year. It includes ihram, tawaf around the Kaaba, and sa\'i between Safa and Marwa.',
    ar: 'الحج الأصغر إلى مكة المكرمة، ويمكن أداؤه في أي وقت من العام. يشمل الإحرام والطواف بالكعبة والسعي بين الصفا والمروة.',
    ur: 'مکہ مکرمہ کا چھوٹا حج۔ حج کے برعکس سال میں کسی بھی وقت ادا کیا جا سکتا ہے۔ احرام، طواف اور صفا مروہ کے درمیان سعی شامل ہے۔',
    es: 'La peregrinación menor a La Meca. A diferencia del Hajj, se puede realizar en cualquier época del año. Incluye ihram, tawaf alrededor de la Kaaba y sa\'i entre Safa y Marwa.',
  ),
  _Term(
    transliteration: 'Tawaf',
    arabic: 'الطواف',
    category: _TermCategory.practice,
    en: 'Walking seven times around the Kaaba in a counter-clockwise direction. A central rite of both Hajj and Umrah, symbolizing the unity of believers in worshipping Allah.',
    ar: 'الطواف بالكعبة سبعة أشواط عكس عقارب الساعة. ركن أساسي في الحج والعمرة، يرمز إلى وحدة المؤمنين في عبادة الله.',
    ur: 'خانہ کعبہ کے گرد سات مرتبہ چکر لگانا۔ حج اور عمرہ کا بنیادی رکن، مومنین کی اللہ کی عبادت میں وحدت کی علامت۔',
    es: 'Caminar siete veces alrededor de la Kaaba en sentido contrario a las agujas del reloj. Un rito central tanto del Hajj como de la Umrah, simbolizando la unidad de los creyentes en adorar a Allah.',
  ),
  _Term(
    transliteration: 'Ihram',
    arabic: 'الإحرام',
    category: _TermCategory.practice,
    en: 'The sacred state entered for Hajj or Umrah. Men wear two white unstitched cloths; women wear modest clothing. Certain actions like cutting nails or using perfume are forbidden during ihram.',
    ar: 'حالة الإحرام للحج أو العمرة. يلبس الرجل ثوبين أبيضين غير مخيطين، وتلبس المرأة ملابس محتشمة. يُحظر تقليم الأظافر والتطيب أثناء الإحرام.',
    ur: 'حج یا عمرہ کی مقدس حالت۔ مرد دو سفید بغیر سلی چادریں پہنتے ہیں؛ خواتین شائستہ لباس۔ احرام میں ناخن کاٹنا اور خوشبو لگانا منع ہے۔',
    es: 'El estado sagrado para el Hajj o la Umrah. Los hombres visten dos telas blancas sin coser; las mujeres ropa modesta. Ciertos actos como cortar uñas o usar perfume están prohibidos durante el ihram.',
  ),
  _Term(
    transliteration: 'Akhlaq',
    arabic: 'الأخلاق',
    category: _TermCategory.practice,
    en: 'Good character and manners. The Prophet ﷺ said: "I was sent to perfect good character." A Muslim\'s behavior is an expression of their faith. (Muwatta Imam Malik)',
    ar: 'حسن الخلق والأدب. قال النبي ﷺ: "إنما بُعثت لأُتمّم مكارم الأخلاق." سلوك المسلم تعبير عن إيمانه. (موطأ الإمام مالك)',
    ur: 'اچھے اخلاق اور آداب۔ نبی ﷺ نے فرمایا: "مجھے اچھے اخلاق کی تکمیل کے لیے بھیجا گیا ہے۔" مسلمان کا برتاؤ اس کے ایمان کا اظہار ہے۔ (موطا امام مالک)',
    es: 'Buen carácter y modales. El Profeta ﷺ dijo: "Fui enviado para perfeccionar el buen carácter." El comportamiento de un musulmán es una expresión de su fe. (Muwatta Imam Malik)',
  ),
  _Term(
    transliteration: 'Ikhlas',
    arabic: 'الإخلاص',
    category: _TermCategory.aqeedah,
    en: 'Sincerity. Doing every action purely for the sake of Allah, without seeking praise or recognition from people. A condition for all worship to be accepted.',
    ar: 'الإخلاص: أن يكون كل عمل خالصاً لوجه الله دون طلب ثناء أو شهرة. شرط لقبول كل عبادة.',
    ur: 'اخلاص: ہر کام خالصتاً اللہ کی رضا کے لیے کرنا، لوگوں کی تعریف یا شہرت کی خواہش کے بغیر۔ ہر عبادت کی قبولیت کی شرط۔',
    es: 'Sinceridad. Realizar cada acción puramente por Allah, sin buscar elogio o reconocimiento de la gente. Una condición para que toda adoración sea aceptada.',
  ),
  _Term(
    transliteration: 'Adab',
    arabic: 'الأدب',
    category: _TermCategory.practice,
    en: 'Islamic etiquette and proper conduct. Includes manners of eating, greeting, visiting, and treating parents, neighbors, and guests with kindness and respect.',
    ar: 'الآداب الإسلامية والسلوك القويم، تشمل آداب الأكل والسلام والزيارة وبر الوالدين وإكرام الجار والضيف.',
    ur: 'اسلامی آداب اور درست سلوک۔ کھانے، سلام، ملاقات، والدین، پڑوسیوں اور مہمانوں کے ساتھ نرمی اور احترام شامل ہے۔',
    es: 'Etiqueta islámica y conducta apropiada. Incluye modales al comer, saludar, visitar y tratar a los padres, vecinos y huéspedes con amabilidad y respeto.',
  ),
  _Term(
    transliteration: 'Niyyah',
    arabic: 'النية',
    category: _TermCategory.practice,
    en: 'Intention. Every act of worship begins with a sincere intention in the heart. The Prophet ﷺ said: "Actions are judged by their intentions." (Sahih Bukhari)',
    ar: 'النية في القلب. كل عبادة تبدأ بنية صادقة. قال النبي ﷺ: "إنما الأعمال بالنيات." (صحيح البخاري)',
    ur: 'نیت: ہر عبادت دل میں سچی نیت سے شروع ہوتی ہے۔ نبی ﷺ نے فرمایا: "اعمال کا دارومدار نیتوں پر ہے۔" (صحیح بخاری)',
    es: 'Intención. Todo acto de adoración comienza con una intención sincera en el corazón. El Profeta ﷺ dijo: "Las acciones se juzgan por sus intenciones." (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Hayaa',
    arabic: 'الحياء',
    category: _TermCategory.practice,
    en: 'Modesty and shyness. A branch of faith that guides a Muslim to avoid shameful actions. The Prophet ﷺ said: "Modesty brings nothing but good." (Sahih Muslim)',
    ar: 'الحياء: خلق إسلامي يمنع المسلم من الفحشاء. قال النبي ﷺ: "الحياء لا يأتي إلا بخير." (صحيح مسلم)',
    ur: 'حیا اور شرم: ایمان کی شاخ جو مسلمان کو شرمناک کاموں سے روکتی ہے۔ نبی ﷺ نے فرمایا: "حیا خیر ہی لاتی ہے۔" (صحیح مسلم)',
    es: 'Modestia y pudor. Una rama de la fe que guía al musulmán a evitar acciones vergonzosas. El Profeta ﷺ dijo: "La modestia no trae sino bien." (Sahih Muslim)',
  ),
  _Term(
    transliteration: 'Tafakkur',
    arabic: 'التفكر',
    category: _TermCategory.practice,
    en: 'Deep reflection and contemplation on Allah\'s creation and signs. The Quran repeatedly encourages thinking about the heavens, earth, and one\'s own creation. (Quran 3:190–191)',
    ar: 'التأمل العميق في خلق الله وآياته. يحث القرآن على التفكر في السماوات والأرض وخلق الإنسان. إِنَّ فِي خَلْقِ السَّمَاوَاتِ وَالْأَرْضِ لَآيَاتٍ. (القرآن 3:190-191)',
    ur: 'اللہ کی تخلیق اور نشانیوں پر گہرا غور و فکر۔ قرآن بار بار آسمانوں، زمین اور انسان کی تخلیق پر سوچنے کی ترغیب دیتا ہے۔ (قرآن 3:190-191)',
    es: 'Reflexión y contemplación profunda sobre la creación y los signos de Allah. El Corán alienta repetidamente a pensar sobre los cielos, la tierra y la propia creación. (Corán 3:190–191)',
  ),
  _Term(
    transliteration: 'Birr',
    arabic: 'البر',
    category: _TermCategory.practice,
    en: 'Righteousness and goodness. A comprehensive term covering faith, worship, charity, patience, and fulfilling promises. (Quran 2:177)',
    ar: 'البر: كلمة شاملة تضم الإيمان والعبادة والإنفاق والصبر والوفاء بالعهد. لَيْسَ الْبِرَّ أَنْ تُوَلُّوا وُجُوهَكُمْ... (القرآن 2:177)',
    ur: 'نیکی اور بھلائی: ایک جامع لفظ جو ایمان، عبادت، صدقہ، صبر اور وعدے پورے کرنا سب شامل کرتا ہے۔ (قرآن 2:177)',
    es: 'Rectitud y bondad. Un término integral que abarca fe, adoración, caridad, paciencia y cumplimiento de promesas. (Corán 2:177)',
  ),
  _Term(
    transliteration: 'Israf',
    arabic: 'الإسراف',
    category: _TermCategory.fiqh,
    en: 'Extravagance and wastefulness, which Islam forbids. Applies to food, money, water, and resources. "Eat and drink but do not be excessive." (Quran 7:31)',
    ar: 'الإسراف والتبذير المنهي عنه في الإسلام. يشمل الطعام والمال والماء والموارد. كُلُوا وَاشْرَبُوا وَلَا تُسْرِفُوا. (القرآن 7:31)',
    ur: 'فضول خرچی اور اسراف جس سے اسلام منع کرتا ہے۔ کھانے، پیسے، پانی اور وسائل میں لاگو۔ "کھاؤ پیو لیکن اسراف نہ کرو۔" (قرآن 7:31)',
    es: 'Extravagancia y desperdicio, que el Islam prohíbe. Se aplica a comida, dinero, agua y recursos. "Coman y beban, pero no sean excesivos." (Corán 7:31)',
  ),
  _Term(
    transliteration: 'Qiyam al-Layl',
    arabic: 'قيام الليل',
    category: _TermCategory.practice,
    en: 'Night prayer. Voluntary prayers performed in the last third of the night, when Allah descends to the lowest heaven. One of the most beloved acts of worship. (Quran 17:79)',
    ar: 'صلاة الليل التطوعية في الثلث الأخير من الليل حين ينزل الله إلى السماء الدنيا. من أحب العبادات إلى الله. (القرآن 17:79)',
    ur: 'رات کی نماز: رات کے آخری تہائی میں ادا ہونے والی نفل نماز جب اللہ آسمان دنیا پر نزول فرماتا ہے۔ سب سے محبوب عبادات میں سے ایک۔ (قرآن 17:79)',
    es: 'Oración nocturna. Oraciones voluntarias realizadas en el último tercio de la noche, cuando Allah desciende al cielo más bajo. Uno de los actos de adoración más amados. (Corán 17:79)',
  ),
  _Term(
    transliteration: 'Siyam',
    arabic: 'الصيام',
    category: _TermCategory.practice,
    en: 'Fasting. Beyond Ramadan, voluntary fasts include Mondays and Thursdays, the white days (13th, 14th, 15th of each lunar month), and the Day of Arafah.',
    ar: 'الصيام: إلى جانب رمضان، يُستحب صيام الاثنين والخميس والأيام البيض (13، 14، 15 من كل شهر هجري) ويوم عرفة.',
    ur: 'روزہ: رمضان کے علاوہ سوموار، جمعرات، ایام بیض (ہر قمری مہینے کی 13، 14، 15) اور عرفہ کے دن کے نفلی روزے مستحب ہیں۔',
    es: 'Ayuno. Además del Ramadán, los ayunos voluntarios incluyen lunes y jueves, los días blancos (13, 14 y 15 de cada mes lunar) y el Día de Arafah.',
  ),
  _Term(
    transliteration: 'Shura',
    arabic: 'الشورى',
    category: _TermCategory.practice,
    en: 'Consultation. Islam encourages making decisions through mutual consultation. Allah praised the believers "whose affairs are conducted through consultation among them." (Quran 42:38)',
    ar: 'الشورى: يحث الإسلام على التشاور في القرارات. أثنى الله على المؤمنين: وَأَمْرُهُمْ شُورَى بَيْنَهُمْ. (القرآن 42:38)',
    ur: 'مشاورت: اسلام باہمی مشاورت سے فیصلے کرنے کی ترغیب دیتا ہے۔ اللہ نے مومنین کی تعریف کی: "ان کے معاملات باہمی مشورے سے طے ہوتے ہیں۔" (قرآن 42:38)',
    es: 'Consulta. El Islam alienta a tomar decisiones mediante consulta mutua. Allah elogió a los creyentes "cuyos asuntos se conducen por consulta mutua entre ellos." (Corán 42:38)',
  ),
  _Term(
    transliteration: 'Wali',
    arabic: 'الولي',
    category: _TermCategory.aqeedah,
    en: 'A close friend of Allah. A righteous person devoted to Allah through worship, obedience, and sincerity. "Indeed, the allies of Allah — no fear will there be upon them." (Quran 10:62)',
    ar: 'وليّ الله: عبد صالح قريب من الله بعبادته وطاعته وإخلاصه. أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ. (القرآن 10:62)',
    ur: 'اللہ کا ولی: نیک بندہ جو عبادت، اطاعت اور اخلاص سے اللہ کا قرب حاصل کرے۔ "اللہ کے دوستوں پر نہ خوف ہوگا نہ غم۔" (قرآن 10:62)',
    es: 'Un amigo cercano de Allah. Una persona justa dedicada a Allah a través de la adoración, obediencia y sinceridad. "En verdad, los aliados de Allah — no tendrán temor." (Corán 10:62)',
  ),
  _Term(
    transliteration: 'Fitnah',
    arabic: 'الفتنة',
    category: _TermCategory.aqeedah,
    en: 'Trial, temptation, or civil strife. Allah tests believers through hardship and ease. "We test you with evil and good as a trial." (Quran 21:35)',
    ar: 'الابتلاء أو الفتنة. يمتحن الله المؤمنين بالشدة والرخاء. وَنَبْلُوكُمْ بِالشَّرِّ وَالْخَيْرِ فِتْنَةً. (القرآن 21:35)',
    ur: 'آزمائش، فتنہ یا خانہ جنگی۔ اللہ مومنین کو تکلیف اور آسانی دونوں سے آزماتا ہے۔ "ہم تمہیں برائی اور بھلائی سے آزمائش کے طور پر جانچتے ہیں۔" (قرآن 21:35)',
    es: 'Prueba, tentación o discordia civil. Allah prueba a los creyentes con dificultad y facilidad. "Os probamos con el mal y el bien como prueba." (Corán 21:35)',
  ),
  _Term(
    transliteration: 'Miswak',
    arabic: 'المسواك',
    category: _TermCategory.practice,
    en: 'A natural teeth-cleaning twig from the Arak tree. The Prophet ﷺ strongly encouraged using it before prayer and frequently throughout the day. (Sahih Bukhari)',
    ar: 'عود طبيعي من شجرة الأراك لتنظيف الأسنان. حثّ عليه النبي ﷺ بشدة قبل الصلاة وفي أوقات كثيرة من اليوم. (صحيح البخاري)',
    ur: 'اراک کے درخت سے بنی قدرتی دانتوں کی صفائی کی لکڑی۔ نبی ﷺ نے نماز سے پہلے اور دن بھر اس کی سختی سے تاکید فرمائی۔ (صحیح بخاری)',
    es: 'Una ramita natural para limpiar los dientes del árbol Arak. El Profeta ﷺ alentó fuertemente su uso antes de la oración y frecuentemente durante el día. (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Tarbiyah',
    arabic: 'التربية',
    category: _TermCategory.practice,
    en: 'Islamic upbringing and character development. Nurturing a person — especially children — in faith, knowledge, and good manners according to the Quran and Sunnah.',
    ar: 'التنشئة الإسلامية وبناء الشخصية. تربية الإنسان ـ وخاصة الأطفال ـ على الإيمان والعلم والأخلاق وفق القرآن والسنة.',
    ur: 'اسلامی تربیت اور کردار سازی۔ انسان کو — خاص طور پر بچوں کو — ایمان، علم اور اچھے اخلاق پر قرآن و سنت کے مطابق پالنا۔',
    es: 'Crianza islámica y desarrollo del carácter. Nutrir a una persona — especialmente a los niños — en fe, conocimiento y buenos modales según el Corán y la Sunnah.',
  ),
  _Term(
    transliteration: 'Hilm',
    arabic: 'الحلم',
    category: _TermCategory.practice,
    en: 'Forbearance and gentleness. Controlling anger and responding with calmness. The Prophet ﷺ told a man who asked for advice: "Do not get angry," repeating it three times. (Sahih Bukhari)',
    ar: 'الحلم والأناة: ضبط النفس عند الغضب والردّ بالهدوء. قال النبي ﷺ لمن طلب وصيته: "لا تغضب" وكررها ثلاثاً. (صحيح البخاري)',
    ur: 'بردباری اور نرمی: غصے پر قابو اور سکون سے جواب دینا۔ نبی ﷺ نے نصیحت مانگنے والے سے فرمایا: "غصہ نہ کرو" اور تین بار دہرایا۔ (صحیح بخاری)',
    es: 'Tolerancia y gentileza. Controlar la ira y responder con calma. El Profeta ﷺ le dijo a un hombre que pidió consejo: "No te enojes," repitiéndolo tres veces. (Sahih Bujari)',
  ),
  _Term(
    transliteration: 'Muhasabah',
    arabic: 'المحاسبة',
    category: _TermCategory.practice,
    en: 'Self-accountability. Reflecting on one\'s daily actions and intentions. Umar ibn al-Khattab said: "Hold yourselves accountable before you are held accountable."',
    ar: 'محاسبة النفس: مراجعة الأعمال والنيات يومياً. قال عمر بن الخطاب رضي الله عنه: "حاسبوا أنفسكم قبل أن تُحاسبوا."',
    ur: 'نفس کا محاسبہ: روزانہ اپنے اعمال اور نیتوں پر غور کرنا۔ عمر بن الخطاب نے فرمایا: "اپنا حساب خود کرو اس سے پہلے کہ تمہارا حساب لیا جائے۔"',
    es: 'Auto-responsabilidad. Reflexionar sobre las acciones e intenciones diarias. Umar ibn al-Jattab dijo: "Rindan cuentas de sí mismos antes de que se les pidan cuentas."',
  ),
  _Term(
    transliteration: 'Nafs',
    arabic: 'النفس',
    category: _TermCategory.aqeedah,
    en: 'The self or ego. The Quran describes three states: the soul that commands evil, the self-reproaching soul, and the soul at peace. (Quran 12:53, 75:2, 89:27)',
    ar: 'النفس: ذكر القرآن ثلاثة أحوال لها: النفس الأمّارة بالسوء، والنفس اللوّامة، والنفس المطمئنة. (القرآن 12:53، 75:2، 89:27)',
    ur: 'نفس: قرآن نے تین حالتیں بیان کیں: نفس امارہ (برائی کا حکم دینے والا)، نفس لوامہ (ملامت کرنے والا) اور نفس مطمئنہ (مطمئن)۔ (قرآن 12:53، 75:2، 89:27)',
    es: 'El yo o ego. El Corán describe tres estados: el alma que ordena el mal, el alma auto-reprochante y el alma en paz. (Corán 12:53, 75:2, 89:27)',
  ),
  _Term(
    transliteration: 'Shafaah',
    arabic: 'الشفاعة',
    category: _TermCategory.aqeedah,
    en: 'Intercession. On the Day of Judgment, Prophet Muhammad ﷺ will be granted the great intercession by Allah\'s permission to intercede for the believers. (Quran 2:255)',
    ar: 'الشفاعة: يوم القيامة يُؤذن للنبي محمد ﷺ بالشفاعة العظمى بإذن الله ليشفع للمؤمنين. مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ. (القرآن 2:255)',
    ur: 'شفاعت: قیامت کے دن نبی محمد ﷺ کو اللہ کی اجازت سے مومنین کی شفاعت کا اعزاز عطا ہوگا۔ (قرآن 2:255)',
    es: 'Intercesión. El Día del Juicio, al Profeta Muhammad ﷺ se le concederá la gran intercesión con el permiso de Allah para interceder por los creyentes. (Corán 2:255)',
  ),
  _Term(
    transliteration: 'Isnad',
    arabic: 'الإسناد',
    category: _TermCategory.hadith,
    en: 'The chain of narrators transmitting a hadith back to the Prophet ﷺ. Scholars carefully verified each narrator\'s honesty and memory to authenticate hadiths.',
    ar: 'سلسلة الرواة الذين نقلوا الحديث إلى النبي ﷺ. فحص العلماء صدق كل راوٍ وضبطه لتصحيح الأحاديث.',
    ur: 'حدیث کو نبی ﷺ تک پہنچانے والے راویوں کا سلسلہ۔ علماء نے ہر راوی کی دیانت اور حافظے کی احتیاط سے جانچ کی۔',
    es: 'La cadena de narradores que transmiten un hadiz hasta el Profeta ﷺ. Los eruditos verificaron cuidadosamente la honestidad y memoria de cada narrador para autenticar los hadices.',
  ),
  _Term(
    transliteration: 'Matn',
    arabic: 'المتن',
    category: _TermCategory.hadith,
    en: 'The actual text or content of a hadith, as opposed to the isnad (chain of narration). Scholars examine both the chain and the text to verify authenticity.',
    ar: 'نص الحديث ومحتواه، مقابل السند. يفحص العلماء السند والمتن معاً للتحقق من صحة الحديث.',
    ur: 'حدیث کا اصل متن، سند کے برعکس۔ علماء صحت کی جانچ کے لیے سند اور متن دونوں کا جائزہ لیتے ہیں۔',
    es: 'El texto o contenido real de un hadiz, a diferencia del isnad (cadena de narración). Los eruditos examinan tanto la cadena como el texto para verificar la autenticidad.',
  ),
  _Term(
    transliteration: 'Sahih',
    arabic: 'الصحيح',
    category: _TermCategory.hadith,
    en: 'Authentic. The highest classification of hadith, meaning the chain is unbroken, all narrators are trustworthy, and the text has no hidden defects. Sahih Bukhari and Sahih Muslim are the two most trusted collections.',
    ar: 'أعلى درجات تصنيف الحديث: سلسلة رواة متصلة ثقات دون علة خفية. صحيح البخاري وصحيح مسلم أوثق المجموعات.',
    ur: 'صحیح: حدیث کی اعلیٰ ترین درجہ بندی، سلسلہ مکمل اور تمام راوی قابل اعتماد۔ صحیح بخاری اور صحیح مسلم سب سے معتبر مجموعے ہیں۔',
    es: 'Auténtico. La clasificación más alta de hadiz, donde la cadena es ininterrumpida, todos los narradores son confiables y el texto no tiene defectos ocultos. Sahih Bujari y Sahih Muslim son las dos colecciones más confiables.',
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class IslamicGlossaryScreen extends StatefulWidget {
  const IslamicGlossaryScreen({super.key});

  @override
  State<IslamicGlossaryScreen> createState() => _IslamicGlossaryScreenState();
}

class _IslamicGlossaryScreenState extends State<IslamicGlossaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  _TermCategory? _activeFilter;

  int _fontScaleIndex = kDefaultFontScaleIndex;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () =>
          setState(() => _query = _searchController.text.trim().toLowerCase()),
    );
    _loadFontScale();
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('glossary');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('glossary', index);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_Term> _filtered(String lang) {
    var terms = _allTerms;
    if (_activeFilter != null) {
      terms = terms.where((t) => t.category == _activeFilter).toList();
    }
    if (_query.isEmpty) return terms;
    return terms.where((t) {
      return t.transliteration.toLowerCase().contains(_query) ||
          t.arabic.contains(_query) ||
          t.definition(lang).toLowerCase().contains(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final results = _filtered(lang);

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(l10n: l10n, onBack: () => Navigator.pop(context)),
            _SearchBar(
                controller: _searchController, hint: l10n.searchTermsHint),
            _FilterChips(
              l10n: l10n,
              active: _activeFilter,
              onSelected: (cat) => setState(
                () => _activeFilter = _activeFilter == cat ? null : cat,
              ),
            ),
            FontSizeSlider(
              index: _fontScaleIndex,
              onChanged: _onFontScaleChanged,
            ),
            Expanded(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler:
                      TextScaler.linear(kFontScaleSteps[_fontScaleIndex]),
                ),
                child: results.isEmpty
                    ? _EmptyState(l10n: l10n, query: _query)
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                        itemCount: results.length,
                        itemBuilder: (context, i) =>
                            _TermCard(term: results[i], lang: lang, l10n: l10n),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onBack;
  const _Header({required this.l10n, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _gold.withValues(alpha: 0.25)),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 16, color: _gold),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.islamicGlossaryTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            l10n.islamicGlossarySubtitle,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.55),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const _SearchBar({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _gold.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            Icon(Icons.search_rounded,
                size: 20, color: Colors.white.withValues(alpha: 0.45)),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                style: GoogleFonts.lato(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.35),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                cursorColor: _gold,
              ),
            ),
            if (controller.text.isNotEmpty)
              GestureDetector(
                onTap: controller.clear,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.close_rounded,
                      size: 16, color: Colors.white.withValues(alpha: 0.45)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  final AppLocalizations l10n;
  final _TermCategory? active;
  final ValueChanged<_TermCategory> onSelected;

  const _FilterChips({
    required this.l10n,
    required this.active,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        children: _TermCategory.values.map((cat) {
          final selected = active == cat;
          return GestureDetector(
            onTap: () => onSelected(cat),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color:
                    selected ? cat.color : Colors.white.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected
                      ? cat.color
                      : Colors.white.withValues(alpha: 0.15),
                ),
              ),
              child: Text(
                cat.label(l10n),
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _TermCard extends StatefulWidget {
  final _Term term;
  final String lang;
  final AppLocalizations l10n;
  const _TermCard({required this.term, required this.lang, required this.l10n});

  @override
  State<_TermCard> createState() => _TermCardState();
}

class _TermCardState extends State<_TermCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cat = widget.term.category;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _gold.withValues(alpha: 0.12)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 4,
                      children: [
                        Text(
                          widget.term.transliteration,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: cat.color.withValues(alpha: 0.22),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            cat.label(widget.l10n),
                            textScaler: TextScaler.noScaling,
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    AnimatedCrossFade(
                      firstChild: Text(
                        widget.term.definition(widget.lang),
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.65),
                          height: 1.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      secondChild: Text(
                        widget.term.definition(widget.lang),
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.65),
                          height: 1.5,
                        ),
                      ),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 220),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.term.arabic,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: _gold,
                        height: 1.2,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final AppLocalizations l10n;
  final String query;
  const _EmptyState({required this.l10n, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded,
                size: 48, color: Colors.white.withValues(alpha: 0.25)),
            const SizedBox(height: 16),
            Text(
              l10n.noTermsFound,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            if (query.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                '"$query"',
                style: GoogleFonts.lato(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.35),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
