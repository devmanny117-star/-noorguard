import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

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
      case 'ar': return ar;
      case 'ur': return ur;
      case 'es': return es;
      default:   return en;
    }
  }
}

enum _TermCategory { pillar, quran, hadith, aqeedah, fiqh, practice, dhikr }

extension _TermCategoryExt on _TermCategory {
  String label(AppLocalizations l10n) {
    switch (this) {
      case _TermCategory.pillar:   return l10n.categoryPillar;
      case _TermCategory.quran:    return l10n.categoryQuran;
      case _TermCategory.hadith:   return l10n.categoryHadith;
      case _TermCategory.aqeedah:  return l10n.categoryAqeedah;
      case _TermCategory.fiqh:     return l10n.categoryFiqh;
      case _TermCategory.practice: return l10n.categoryPractice;
      case _TermCategory.dhikr:    return l10n.categoryDhikr;
    }
  }

  Color get color {
    switch (this) {
      case _TermCategory.pillar:   return const Color(0xFF2E7D32);
      case _TermCategory.quran:    return const Color(0xFF1565C0);
      case _TermCategory.hadith:   return const Color(0xFF4A148C);
      case _TermCategory.aqeedah:  return const Color(0xFF880E4F);
      case _TermCategory.fiqh:     return const Color(0xFFBF360C);
      case _TermCategory.practice: return const Color(0xFF00695C);
      case _TermCategory.dhikr:    return const Color(0xFF4E342E);
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

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () => setState(() => _query = _searchController.text.trim().toLowerCase()),
    );
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
            _SearchBar(controller: _searchController, hint: l10n.searchTermsHint),
            _FilterChips(
              l10n: l10n,
              active: _activeFilter,
              onSelected: (cat) => setState(
                () => _activeFilter = _activeFilter == cat ? null : cat,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: results.isEmpty
                  ? _EmptyState(l10n: l10n, query: _query)
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                      itemCount: results.length,
                      itemBuilder: (context, i) =>
                          _TermCard(term: results[i], lang: lang, l10n: l10n),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: selected
                    ? cat.color
                    : Colors.white.withValues(alpha: 0.07),
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
                    Row(
                      children: [
                        Text(
                          widget.term.transliteration,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: cat.color.withValues(alpha: 0.22),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            cat.label(widget.l10n),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.term.arabic,
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
