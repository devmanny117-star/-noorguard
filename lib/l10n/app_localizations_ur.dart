// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'نور گارڈ';

  @override
  String get assalamualaikum => 'السلام علیکم';

  @override
  String get mayAllahBlessYourDay => 'اللہ آپ کا دن بابرکت کرے';

  @override
  String get nextPrayer => 'اگلی نماز';

  @override
  String get iPrayedButton => 'میں نے نماز پڑھی';

  @override
  String get todaysPrayers => 'آج کی نمازیں';

  @override
  String get qibla => 'قبلہ';

  @override
  String get focusMode => 'توجہ موڈ';

  @override
  String get appBlocking => 'ایپ بلاکنگ';

  @override
  String get islamicCalendar => 'اسلامی تقویم';

  @override
  String get islamicCalendarSubtitle => 'ہجری تاریخیں اور تقریبات';

  @override
  String get duas => 'دعائیں';

  @override
  String get quran => 'قرآن مجید';

  @override
  String get settings => 'ترتیبات';

  @override
  String get complete => 'مکمل';

  @override
  String get streak => 'سلسلہ';

  @override
  String get dayStreak => 'دن کا سلسلہ';

  @override
  String get compassRequiresDevice => 'قبلہ نما کے لیے حقیقی آلہ درکار ہے';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دن',
      one: '$count دن',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'تمام نمازیں مکمل ہو گئیں! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 نمازیں مکمل';
  }

  @override
  String get fajr => 'فجر';

  @override
  String get dhuhr => 'ظہر';

  @override
  String get asr => 'عصر';

  @override
  String get maghrib => 'مغرب';

  @override
  String get isha => 'عشاء';

  @override
  String fardRakats(int count) {
    return '$count فرض رکعات';
  }

  @override
  String sunnahBefore(int count) {
    return '$count سنت پہلے';
  }

  @override
  String sunnahAfter(int count) {
    return '$count سنت بعد';
  }

  @override
  String prayedAt(String time) {
    return '$time پر ادا کی جاتی ہے';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'طلوعِ آفتاب سے پہلے فجر کے وقت';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'سورج کے سب سے اونچے مقام سے گزرنے کے بعد';

  @override
  String get timePeriodLateAfternoon => 'سہ پہر کے آخر میں';

  @override
  String get timePeriodJustAfterSunset => 'غروبِ آفتاب کے فوراً بعد';

  @override
  String get timePeriodNightBeforeMidnight => 'آدھی رات سے پہلے رات کے وقت';

  @override
  String get fajrHadith =>
      'فجر کی دو رکعتیں دنیا اور اس کی ہر چیز سے بہتر ہیں۔ — نبی محمد ﷺ';

  @override
  String get fajrTip =>
      'فجر دن کی پہلی نماز ہے۔ یہ ہمیں اللہ کو یاد کرتے ہوئے دن کا آغاز کرنے کی یاد دلاتی ہے۔';

  @override
  String get dhuhrHadith =>
      'جو شخص بارہ سنت رکعتیں ادا کرے، اللہ اس کے لیے جنت میں ایک گھر بنائے گا۔';

  @override
  String get dhuhrTip =>
      'ظہر دوپہر کی نماز ہے۔ اپنے دن میں وقفہ لینے اور دوبارہ جڑنے کا بہترین لمحہ۔';

  @override
  String get asrHadith =>
      'جس کی عصر کی نماز چھوٹ گئی، گویا اس کے گھر والے اور مال ضائع ہو گئے۔ — نبی محمد ﷺ';

  @override
  String get asrTip =>
      'عصر کو اکثر درمیانی نماز کہا جاتا ہے۔ اللہ نے قرآن میں خاص طور پر اس کا ذکر کیا ہے (2:238)۔';

  @override
  String get maghribHadith => 'مغرب کی نماز دن کا وتر ہے۔';

  @override
  String get maghribTip =>
      'مغرب رمضان میں روزے کے دن کے اختتام کی علامت ہے۔ یہ سورج غروب ہوتے ہی ادا کی جاتی ہے۔';

  @override
  String get ishaHadith =>
      'جس نے باجماعت عشاء کی نماز پڑھی، گویا اس نے آدھی رات قیام کیا۔';

  @override
  String get ishaTip =>
      'عشاء دن کی آخری نماز ہے۔ نماز کے ساتھ دن کا اختتام سکون اور قرار لاتا ہے۔';

  @override
  String get newMuslimTip => 'نئے مسلمان کے لیے تجویز';

  @override
  String get notificationsOn => 'اطلاعات آن ہیں';

  @override
  String get notificationsOff => 'اطلاعات آف ہیں';

  @override
  String get preview => 'پیش نظارہ';

  @override
  String get lockPreviewCountdown => '1 گھنٹہ 23 منٹ میں  ·  4:47 PM';

  @override
  String get swipeUpToUnlock => 'غیر مقفل کرنے کے لیے اوپر سوائپ کریں';

  @override
  String get searchSurahs => 'سورتیں تلاش کریں…';

  @override
  String get noSurahsFound => 'کوئی سورت نہیں ملی';

  @override
  String get tryAgain => 'دوبارہ کوشش کریں';

  @override
  String ayahs(int count) {
    return '$count آیات';
  }

  @override
  String get searchDuas => 'دعائیں تلاش کریں…';

  @override
  String supplications(int count) {
    return '$count دعائیں';
  }

  @override
  String get prayerSettings => 'نماز کی ترتیبات';

  @override
  String get calculationMethod => 'حساب کا طریقہ';

  @override
  String get adhanSound => 'اذان کی آواز';

  @override
  String get prayerNotifications => 'نماز کی اطلاعات';

  @override
  String get statusOn => 'آن';

  @override
  String get statusOff => 'آف';

  @override
  String get enableAllNotifications => 'تمام اطلاعات فعال کریں';

  @override
  String get individualPrayers => 'انفرادی نمازیں';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get darkMode => 'ڈارک موڈ';

  @override
  String get language => 'زبان';

  @override
  String get aboutNoorGuard => 'ایپ کے بارے میں';

  @override
  String get version => 'ایپ کا ورژن';

  @override
  String get rateApp => 'نور گارڈ کو ریٹ کریں';

  @override
  String get shareApp => 'نور گارڈ شیئر کریں';

  @override
  String get contactSupport => 'سپورٹ سے رابطہ کریں';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get termsOfService => 'شرائط خدمت';

  @override
  String get helpUsImprove => 'ہماری بہتری میں مدد کریں';

  @override
  String get translationDisclaimer =>
      'ہمارے تراجم مصنوعی ذہانت کی مدد سے تیار کیے گئے ہیں۔ اگر آپ کو اپنی زبان میں کوئی غلطی نظر آئے تو ہمیں آپ کی رائے جان کر خوشی ہوگی!';

  @override
  String get privacyPromiseTitle => 'نور گارڈ کا رازداری کا وعدہ';

  @override
  String get privacyPromiseBody =>
      'آپ کا ایمان ذاتی ہے۔ آپ کا ڈیٹا بھی ایسا ہی رہے گا۔ ہم کبھی آپ کا ڈیٹا فروخت، شیئر یا کمائی کے لیے استعمال نہیں کرتے۔ نہ آپ کا مقام، نہ آپ کی نماز کی عادات، نہ آپ کا نام۔';

  @override
  String get directionToSacredHouse => 'خانہ کعبہ کی سمت';

  @override
  String towardMecca(String degrees) {
    return '$degrees° مکہ کی طرف';
  }

  @override
  String get defaultLocation => 'سیکرامینٹو، کیلیفورنیا (پہلے سے طے شدہ)';

  @override
  String get prayerHistory => 'نماز کی تاریخ';

  @override
  String get currentStreak => 'موجودہ تسلسل';

  @override
  String get longestStreak => 'طویل ترین تسلسل';

  @override
  String get legend => 'علامت';

  @override
  String get allFivePrayers => 'تمام 5 نمازیں';

  @override
  String get partialPrayers => 'جزوی (1–4)';

  @override
  String get none => 'کوئی نہیں';

  @override
  String get sun => 'اتوار';

  @override
  String get mon => 'پیر';

  @override
  String get tue => 'منگل';

  @override
  String get wed => 'بدھ';

  @override
  String get thu => 'جمعرات';

  @override
  String get fri => 'جمعہ';

  @override
  String get sat => 'ہفتہ';

  @override
  String headingDegrees(String degrees) {
    return 'سمت $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'سورتیں لوڈ نہیں ہو سکیں';

  @override
  String get connectionError =>
      'براہ کرم اپنا انٹرنیٹ کنکشن چیک کریں اور دوبارہ کوشش کریں';

  @override
  String get alQuran => 'القرآن الکریم';

  @override
  String get dailySupplications => 'روزانہ کی دعائیں';

  @override
  String get all => 'تمام';

  @override
  String get noDuasFound => 'کوئی دعا نہیں ملی';

  @override
  String get january => 'جنوری';

  @override
  String get february => 'فروری';

  @override
  String get march => 'مارچ';

  @override
  String get april => 'اپریل';

  @override
  String get may => 'مئی';

  @override
  String get june => 'جون';

  @override
  String get july => 'جولائی';

  @override
  String get august => 'اگست';

  @override
  String get september => 'ستمبر';

  @override
  String get october => 'اکتوبر';

  @override
  String get november => 'نومبر';

  @override
  String get december => 'دسمبر';

  @override
  String get home => 'ہوم';

  @override
  String get prayers => 'نمازیں';

  @override
  String get more => 'مزید';

  @override
  String get tafsir => 'تفسیر';

  @override
  String get lockScreen => 'لاک اسکرین';

  @override
  String get readAndListen => 'پڑھیں اور سنیں';

  @override
  String get commentary => 'تشریح';

  @override
  String get findDirection => 'سمت معلوم کریں';

  @override
  String get reminders => 'یاد دہانیاں';

  @override
  String get blockDistractions => 'خلفشار کو روکیں';

  @override
  String get prayerGuard => 'نماز گارڈ';

  @override
  String get importantDates => 'اہم تاریخیں';

  @override
  String get comingSoon => 'جلد آرہا ہے';

  @override
  String get morningAndEvening => 'صبح و شام';

  @override
  String get prayer => 'نماز';

  @override
  String get foodAndDrink => 'کھانا اور مشروبات';

  @override
  String get verityWithHardship => 'بے شک تنگی کے ساتھ آسانی ہے۔';

  @override
  String get ashSharh946 => 'سورۃ الشرح 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'نمازوں کی حفاظت کرو، خاص طور پر درمیانی نماز کی';

  @override
  String get alBaqarah2238 => 'البقرہ ٢:٢٣٨';

  @override
  String get pastEvents => 'گزشتہ تقریبات';

  @override
  String get upcomingEvents => 'آنے والی تقریبات';

  @override
  String get today => 'آج';

  @override
  String get next => 'اگلا';

  @override
  String hijriYearLabel(int year) {
    return '$year ہجری';
  }

  @override
  String get islamicMonthMuharram => 'محرم';

  @override
  String get islamicMonthSafar => 'صفر';

  @override
  String get islamicMonthRabiAlAwwal => 'ربیع الاول';

  @override
  String get islamicMonthRabiAlThani => 'ربیع الثانی';

  @override
  String get islamicMonthJumadaAlAwwal => 'جمادی الاول';

  @override
  String get islamicMonthJumadaAlThani => 'جمادی الثانی';

  @override
  String get islamicMonthRajab => 'رجب';

  @override
  String get islamicMonthShaban => 'شعبان';

  @override
  String get islamicMonthRamadan => 'رمضان';

  @override
  String get islamicMonthShawwal => 'شوال';

  @override
  String get islamicMonthDhulQadah => 'ذی قعدہ';

  @override
  String get islamicMonthDhulHijjah => 'ذوالحجہ';

  @override
  String get islamicNewYear => 'اسلامی نیا سال';

  @override
  String get ashura => 'عاشورہ';

  @override
  String get mawlidAlNabi => 'میلاد النبی';

  @override
  String get ramadanBegins => 'رمضان کا آغاز';

  @override
  String get laylatAlQadr => 'لیلۃ القدر';

  @override
  String get eidAlFitr => 'عید الفطر';

  @override
  String get dayOfArafah => 'یوم عرفہ';

  @override
  String get eidAlAdha => 'عید الاضحی';

  @override
  String get active => 'فعال';

  @override
  String get focusModeSubtitle =>
      'اپنی توجہ کی حفاظت کریں۔ روکنے تک آپ کی ایپس مسدود رہیں گی۔';

  @override
  String get remaining => 'باقی';

  @override
  String get ready => 'تیار';

  @override
  String get duration => 'دورانیہ';

  @override
  String get minutesAbbreviation => 'منٹ';

  @override
  String get blockedDuringFocus => 'فوکس کے دوران مسدود';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ایپس',
      one: '$count ایپ',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'فوکس شروع کریں';

  @override
  String get stopFocus => 'فوکس روکیں';

  @override
  String get alhamdulillah => 'الحمدللہ!';

  @override
  String get sessionComplete => 'سیشن مکمل ہوا';

  @override
  String stayedFocusedFor(String duration) {
    return 'آپ نے $duration تک توجہ مرکوز رکھی۔';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منٹ',
      one: '$count منٹ',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"اور صبر اور نماز سے مدد طلب کرو۔\"\n— البقرہ ٢:٤٥';

  @override
  String get done => 'ہو گیا';

  @override
  String get socialMedia => 'سوشل میڈیا';

  @override
  String get entertainment => 'تفریح';

  @override
  String get games => 'گیمز';

  @override
  String get messaging => 'میسجنگ';

  @override
  String get blockDuringPrayerTimes => 'نماز کے اوقات میں مسدود کریں';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'منتخب ایپس خودکار طور پر مسدود ہو جائیں گی\nپانچوں روزانہ نمازوں کے دوران۔';

  @override
  String get blockedLabel => 'مسدود';

  @override
  String get blockAllApps => 'تمام ایپس مسدود کریں';

  @override
  String get blockingTimingInfo =>
      'ہر نماز سے 5 منٹ پہلے مسدودی شروع ہوتی ہے اور 15 منٹ بعد ختم ہو جاتی ہے۔';

  @override
  String get blockedDuringPrayers => 'نمازوں کے دوران مسدود';

  @override
  String get notBlocked => 'غیر مسدود';

  @override
  String get wuduStep1 => 'نیت';

  @override
  String get wuduStep2 => 'بسم اللہ';

  @override
  String get wuduStep3 => 'ہاتھ دھونا';

  @override
  String get wuduStep4 => 'کلی کرنا';

  @override
  String get wuduStep5 => 'ناک صاف کرنا';

  @override
  String get wuduStep6 => 'چہرہ دھونا';

  @override
  String get wuduStep7 => 'بازو دھونا';

  @override
  String get wuduStep8 => 'سر کا مسح';

  @override
  String get wuduStep9 => 'پاؤں دھونا';

  @override
  String get revertCorner => 'نئے مسلمان کا کونہ';

  @override
  String get revertCornerSubtitle => 'نئے مسلمانوں کے لیے رہنمائی اور مدد';

  @override
  String get wuduGuide => 'وضو گائیڈ';

  @override
  String get howToPray => 'نماز کا طریقہ';

  @override
  String get newMuslimChecklist => 'نئے مسلمان کی فہرست';

  @override
  String get islamicGlossary => 'اسلامی لغت';

  @override
  String get whyDoWe => 'ہم کیوں کرتے ہیں...';

  @override
  String get communityStories => 'کمیونٹی کی کہانیاں';

  @override
  String get wuduGuideSubtitle => 'نماز سے پہلے طہارت';

  @override
  String get howToPraySubtitle => 'نماز کا مرحلہ وار گائیڈ';

  @override
  String get newMuslimChecklistSubtitle => 'آپ کا 30 دن کا سفر';

  @override
  String get howToPrayStep1Name => 'پہلے وضو';

  @override
  String get howToPrayStep1Instruction =>
      'نماز سے پہلے وضو کریں تاکہ آپ پاکی کی حالت میں ہوں۔';

  @override
  String get howToPrayStep1Tip =>
      'اگر یقین نہ ہو تو پہلے نئے مسلمان کے مرکز سے وضو گائیڈ کھولیں۔';

  @override
  String get howToPrayStep2Name => 'قبلہ رخ کھڑے ہوں';

  @override
  String get howToPrayStep2Instruction =>
      'اپنی جائے نماز پر قبلے کی طرف منہ کرکے کھڑے ہوں۔ درست سمت جاننے کے لیے ایپ میں قبلہ کمپاس استعمال کریں۔';

  @override
  String get howToPrayStep2Tip =>
      'اگر تھوڑا غلط ہو تو ٹھیک ہے — اللہ آپ کی نیت جانتا ہے۔ پوری کوشش کریں۔';

  @override
  String get howToPrayStep3Name => 'نیت';

  @override
  String get howToPrayStep3Instruction =>
      'دل میں اس نماز کی نیت کریں جو آپ ادا کرنے والے ہیں۔ زبان سے کہنا ضروری نہیں۔';

  @override
  String get howToPrayStep3Tip =>
      'آپ کی نیت آپ کے اور اللہ کے درمیان ہے۔ ایک سادہ خیال جیسے \'میں اللہ کے لیے فجر پڑھ رہا ہوں\' کافی ہے۔';

  @override
  String get howToPrayStep4Name => 'تکبیرِ تحریمہ';

  @override
  String get howToPrayStep4Instruction =>
      'دونوں ہاتھ کانوں تک اٹھائیں اور \'اللہ اکبر\' کہیں۔ اس سے آپ کی نماز باضابطہ شروع ہوتی ہے۔';

  @override
  String get howToPrayStep4Tip => 'پوری نماز میں نظریں سجدے کی جگہ پر رکھیں۔';

  @override
  String get howToPrayStep5Name => 'قیام';

  @override
  String get howToPrayStep5Instruction =>
      'دائیں ہاتھ کو بائیں ہاتھ پر سینے پر رکھیں۔ سورہ الفاتحہ پڑھیں پھر کوئی اور مختصر سورہ جو آپ کو یاد ہو۔';

  @override
  String get howToPrayStep5Tip =>
      'اگر ابھی کوئی اور سورہ یاد نہیں تو صرف الفاتحہ پڑھنا قابل قبول ہے جب تک آپ سیکھ رہے ہیں۔';

  @override
  String get howToPrayStep6Name => 'رکوع';

  @override
  String get howToPrayStep6Instruction =>
      'کمر سے جھک کر رکوع کریں، کمر زمین کے متوازی ہو۔ ہاتھ گھٹنوں پر رکھیں اور \'سبحان ربی العظیم\' تین بار کہیں۔';

  @override
  String get howToPrayStep6Tip =>
      'کمر سیدھی اور افقی رکھیں — نہ جھکی ہوئی نہ خمیدہ۔';

  @override
  String get howToPrayStep7Name => 'اعتدال (رکوع سے اٹھنا)';

  @override
  String get howToPrayStep7Instruction =>
      'رکوع سے اٹھیں اور سیدھے کھڑے ہوں۔ اٹھتے ہوئے \'سمع اللہ لمن حمدہ\' کہیں، پھر \'ربنا لک الحمد\' کہیں۔';

  @override
  String get howToPrayStep7Tip =>
      'پوری طرح سیدھے کھڑے ہوں اور اگلی پوزیشن پر جانے سے پہلے ایک لمحے کے لیے ساکن رہیں۔';

  @override
  String get howToPrayStep8Name => 'سجدہ';

  @override
  String get howToPrayStep8Instruction =>
      'زمین پر جائیں، پیشانی، ناک، دونوں ہتھیلیاں، گھٹنے اور پاؤں کی انگلیاں زمین پر رکھیں۔ \'سبحان ربی الاعلیٰ\' تین بار کہیں۔';

  @override
  String get howToPrayStep8Tip =>
      'سات اعضاء زمین سے لگنے چاہئیں: پیشانی (ناک سمیت)، دونوں ہاتھ، دونوں گھٹنے اور دونوں پاؤں۔';

  @override
  String get howToPrayStep9Name => 'دو سجدوں کے درمیان بیٹھنا (جلسہ)';

  @override
  String get howToPrayStep9Instruction =>
      'سجدے سے اٹھ کر بیٹھیں، بایاں پاؤں بچھا کر اور دایاں پاؤں کھڑا رکھیں۔ بیٹھتے ہوئے \'اللہ اکبر\' کہیں۔ مختصر وقفہ کریں پھر دوسرے سجدے میں جائیں۔';

  @override
  String get howToPrayStep9Tip =>
      'دونوں سجدوں کے درمیان یہ مختصر بیٹھنا جلسہ کہلاتا ہے۔ یہ نماز کا لازمی حصہ ہے۔';

  @override
  String get howToPrayStep10Name => 'رکعتیں مکمل کریں';

  @override
  String get howToPrayStep10Instruction =>
      'پہلی رکعت مکمل کرنے کے بعد کھڑے ہوں اور دوسری رکعت کے لیے وہی اقدامات دہرائیں۔ رکعات کی تعداد نماز کے حساب سے ہوتی ہے۔';

  @override
  String get howToPrayStep10Tip =>
      'فجر 2 رکعت، ظہر 4، عصر 4، مغرب 3 اور عشاء 4 رکعت ہے۔ ایک ایک رکعت کریں۔';

  @override
  String get howToPrayStep11Name => 'تشہد (آخری بیٹھک)';

  @override
  String get howToPrayStep11Instruction =>
      'آخری بیٹھنے کی پوزیشن میں تشہد پڑھیں۔ یہ ایمان کا اعلان ہے جو آخری رکعت کے بعد بیٹھ کر پڑھا جاتا ہے۔';

  @override
  String get howToPrayStep11Tip =>
      'تشہد کے دوران جب \'اشہد ان لا الہ الا اللہ\' کہیں تو دائیں ہاتھ کی شہادت کی انگلی اٹھائیں، اللہ کی وحدانیت کی علامت کے طور پر۔';

  @override
  String get howToPrayStep12Name => 'سلام (اختتام)';

  @override
  String get howToPrayStep12Instruction =>
      'سر دائیں طرف پھیریں اور \'السلام علیکم ورحمۃ اللہ\' کہیں، پھر بائیں طرف پھیریں اور دہرائیں۔ اس سے نماز ختم ہوتی ہے۔';

  @override
  String get howToPrayStep12Tip =>
      'نماز کے بعد دعا کریں اور اللہ سے جو چاہیں مانگیں۔ یہ اللہ سے جڑنے کا خوبصورت وقت ہے۔';

  @override
  String get checklistWeek1Title => 'ہفتہ 1';

  @override
  String get checklistWeek2Title => 'ہفتہ 2';

  @override
  String get checklistWeek3Title => 'ہفتہ 3';

  @override
  String get checklistWeek4Title => 'ہفتہ 4';

  @override
  String get checklistWeek1Item1 => 'شہادت پڑھیں';

  @override
  String get checklistWeek1Item2 => 'وضو سیکھیں';

  @override
  String get checklistWeek1Item3 => 'الفاتحہ سیکھیں';

  @override
  String get checklistWeek1Item4 => 'پہلی فجر کی نماز ادا کریں';

  @override
  String get checklistWeek1Item5 => 'جائے نماز حاصل کریں';

  @override
  String get checklistWeek1Item6 => 'قریبی مسجد تلاش کریں';

  @override
  String get checklistWeek2Item1 => 'پانچوں نمازوں کے اوقات سیکھیں';

  @override
  String get checklistWeek2Item2 => 'بنیادی دعائیں سیکھیں';

  @override
  String get checklistWeek2Item3 => 'نبی محمدﷺ کے بارے میں پڑھیں';

  @override
  String get checklistWeek2Item4 => 'مسلم کمیونٹی سے رابطہ کریں';

  @override
  String get checklistWeek3Item1 => 'حلال کھانے کے بارے میں جانیں';

  @override
  String get checklistWeek3Item2 => 'سورۃ الاخلاص پڑھیں';

  @override
  String get checklistWeek3Item3 => 'رمضان کے بارے میں جانیں';

  @override
  String get checklistWeek3Item4 => 'روزانہ ذکر شروع کریں';

  @override
  String get checklistWeek4Item1 => 'زکوٰۃ کے بارے میں جانیں';

  @override
  String get checklistWeek4Item2 => 'اسلام کے پانچ ارکان کے بارے میں پڑھیں';

  @override
  String get checklistWeek4Item3 => 'نماز کی اطلاعات ترتیب دیں';

  @override
  String get checklistWeek4Item4 => 'اپنے سفر پر غور کریں';

  @override
  String get wuduStep1Instruction =>
      'دل میں وضو کرنے کی نیت کریں، اللہ کی خاطر۔';

  @override
  String get wuduStep1Tip =>
      'اسے زبان سے کہنا ضروری نہیں — دل کی سچی نیت کافی ہے۔';

  @override
  String get wuduStep2Instruction => 'شروع کرنے سے پہلے بسم اللہ کہیں۔';

  @override
  String get wuduStep2Tip =>
      'بسم اللہ کہنا سنت ہے اور اللہ کے ذکر سے وضو شروع ہوتا ہے۔';

  @override
  String get wuduStep3Instruction =>
      'دونوں ہاتھ کلائیوں تک تین بار دھوئیں، انگلیوں کے درمیان پانی پہنچائیں۔';

  @override
  String get wuduStep3Tip =>
      'پہلے دائیں ہاتھ سے شروع کریں، پھر بائیں سے۔ اسلام میں یہ ترتیب مستحب ہے۔';

  @override
  String get wuduStep4Instruction =>
      'منہ میں پانی لیں، گھمائیں اور تھوک دیں۔ تین بار کریں۔';

  @override
  String get wuduStep4Tip =>
      'یہ منہ کو صاف کرتا ہے اور طہارت کے عمل کا حصہ ہے۔';

  @override
  String get wuduStep5Instruction =>
      'ناک میں پانی چڑھائیں اور آہستہ سے نکالیں۔ تین بار کریں۔';

  @override
  String get wuduStep5Tip =>
      'دائیں ہاتھ سے پانی چڑھائیں اور بائیں ہاتھ سے نکالیں۔';

  @override
  String get wuduStep6Instruction =>
      'پورا چہرہ تین بار دھوئیں، بالوں کی جڑ سے ٹھوڑی تک اور ایک کان سے دوسرے تک۔';

  @override
  String get wuduStep6Tip => 'یقینی بنائیں کہ چہرے کا کوئی حصہ خشک نہ رہے۔';

  @override
  String get wuduStep7Instruction =>
      'دائیں بازو کو انگلیوں سے کہنی تک تین بار دھوئیں، پھر بائیں بازو سے بھی ایسا کریں۔';

  @override
  String get wuduStep7Tip =>
      'وضو میں ہمیشہ دائیں طرف سے بائیں طرف سے پہلے شروع کریں۔';

  @override
  String get wuduStep8Instruction =>
      'ہاتھ گیلے کریں اور پورے سر پر ایک بار مسح کریں، آگے سے پیچھے اور پیچھے سے آگے۔';

  @override
  String get wuduStep8Tip =>
      'دھونے کے برخلاف، سر کا مسح صرف ایک بار کیا جاتا ہے۔';

  @override
  String get wuduStep9Instruction =>
      'دائیں پاؤں کو ٹخنے سمیت تین بار دھوئیں، پھر بائیں پاؤں سے بھی ایسا کریں۔';

  @override
  String get wuduStep9Tip =>
      'یقینی بنائیں کہ پانی انگلیوں کے درمیان پہنچے۔ انگلی سے درمیان صاف کریں۔';

  @override
  String get islamicGlossaryTitle => 'اسلامی لغت';

  @override
  String get islamicGlossarySubtitle =>
      'قرآن، سنت اور کلاسیکی علمی ورثے سے ٥١ اصطلاحات';

  @override
  String get searchTermsHint => 'اصطلاحات یا تعریفیں تلاش کریں...';

  @override
  String get categoryAll => 'سب';

  @override
  String get categoryPillar => 'ارکان';

  @override
  String get categoryAqeedah => 'عقیدہ';

  @override
  String get categoryPractice => 'عبادت';

  @override
  String get categoryDhikr => 'ذکر';

  @override
  String get categoryQuran => 'قرآن';

  @override
  String get categoryHadith => 'حدیث';

  @override
  String get categoryFiqh => 'فقہ';

  @override
  String get categoryHistory => 'تاریخ';

  @override
  String get noTermsFound => 'کوئی اصطلاح نہیں ملی';

  @override
  String get sourceLabel => 'ماخذ';

  @override
  String get revertCornerHubSubtitle =>
      'نئے مسلمان کے پہلے قدموں کی رہنمائی کا مرکز';

  @override
  String get islamicGlossaryHubSubtitle => 'عام اصطلاحات کی آسان وضاحت';

  @override
  String get whyDoWeHubSubtitle => 'روزمرہ کے اعمال کی حکمت';

  @override
  String get communityStoriesHubSubtitle =>
      'نئے مسلمان اسلام کی طرف اپنے سفر بیان کرتے ہیں';

  @override
  String get whyDoWeScreenSubtitle => '12 روزمرہ اسلامی اعمال کی حکمت';

  @override
  String get whyDoWeSourceBadge => 'سنی ماخذ';

  @override
  String get whyDoWeQ1 => 'ہم دن میں پانچ بار نماز کیوں پڑھتے ہیں؟';

  @override
  String get whyDoWeA1 =>
      'اللہ نے قرآن کریم (2:238) میں پانچ نمازیں فرض کی ہیں اور یہ اسراء و معراج کی رات مقرر ہوئیں۔ نبی ﷺ نے فرمایا: «قیامت کے دن بندے سے سب سے پہلے نماز کا حساب لیا جائے گا۔» (ابن ماجہ)۔ نماز ہمیں سارا دن اللہ سے جوڑے رکھتی ہے۔';

  @override
  String get whyDoWeQ2 => 'ہم نماز میں مکہ کی طرف کیوں رخ کرتے ہیں؟';

  @override
  String get whyDoWeA2 =>
      'اللہ نے قرآن (2:144) میں حکم دیا: «اپنا چہرہ مسجد الحرام کی طرف پھیر لو۔» مکہ میں کعبہ اللہ کی عبادت کے لیے بنایا گیا پہلا گھر ہے (3:96)۔ ایک ہی سمت میں منہ کرنا پوری دنیا کے مسلمانوں کو نماز میں متحد کرتا ہے۔';

  @override
  String get whyDoWeQ3 => 'ہم رمضان میں روزہ کیوں رکھتے ہیں؟';

  @override
  String get whyDoWeA3 =>
      'اللہ نے قرآن (2:183) میں روزے فرض کیے: «اے ایمان والو! تم پر روزے فرض کیے گئے جیسے تم سے پہلے لوگوں پر فرض کیے گئے تھے، تاکہ تم تقوی حاصل کرو۔» رمضان وہ مہینہ ہے جس میں قرآن نازل ہوا (2:185)۔';

  @override
  String get whyDoWeQ4 => 'ہم کھانے سے پہلے بسم اللہ کیوں کہتے ہیں؟';

  @override
  String get whyDoWeA4 =>
      'نبی ﷺ نے فرمایا: «جب تم میں سے کوئی کھائے تو اللہ کا نام لے، اگر شروع میں بھول جائے تو کہے: بسم الله أوله وآخره۔» (ابو داؤد)۔ یہ ہمیں یاد دلاتا ہے کہ تمام نعمتیں اللہ کی طرف سے ہیں۔';

  @override
  String get whyDoWeQ5 => 'ہم مسجد میں داخل ہونے سے پہلے جوتے کیوں اتارتے ہیں؟';

  @override
  String get whyDoWeA5 =>
      'جب اللہ نے حضرت موسیٰ علیہ السلام کو حکم دیا: «اپنی جوتیاں اتار دو، بے شک تم مقدس وادی طویٰ میں ہو۔» (قرآن 20:12)۔ جوتے اتارنا اللہ کے گھر کی تعظیم اور نماز کی جگہ کو صاف رکھنے کا طریقہ ہے۔';

  @override
  String get whyDoWeQ6 => 'ہم بطور سلام السلام علیکم کیوں کہتے ہیں؟';

  @override
  String get whyDoWeA6 =>
      'نبی ﷺ نے فرمایا: «تم جنت میں داخل نہیں ہو سکتے جب تک ایمان نہ لاؤ، اور ایمان نہیں آ سکتا جب تک آپس میں محبت نہ کرو۔ کیا میں تمہیں ایسی چیز نہ بتاؤں جو محبت پیدا کرے؟ آپس میں سلام پھیلاؤ۔» (مسلم)۔ یہ ایک دعا بھی ہے۔';

  @override
  String get whyDoWeQ7 => 'ہم حج کیوں کرتے ہیں؟';

  @override
  String get whyDoWeA7 =>
      'اللہ نے حج فرض کیا (3:97): «لوگوں پر اللہ کا یہ حق ہے کہ جو بیت اللہ تک پہنچنے کی استطاعت رکھتا ہو وہ حج کرے۔» حج نبی ابراہیم اور ان کے خاندان کی آزمائشوں کی یاد تازہ کرتا ہے اور ہر قوم کے مسلمانوں کو متحد کرتا ہے۔';

  @override
  String get whyDoWeQ8 => 'ہم زکاۃ کیوں دیتے ہیں؟';

  @override
  String get whyDoWeA8 =>
      'زکاۃ اسلام کا تیسرا رکن ہے، قرآن میں 30 سے زائد مرتبہ نماز کے ساتھ اس کا حکم دیا گیا ہے۔ نبی ﷺ نے فرمایا یہ مال کو پاک کرتی ہے۔ یہ ناہمواری کو کم کرتی ہے اور مومنین کو یاد دلاتی ہے کہ دولت اللہ کی ہے۔';

  @override
  String get whyDoWeQ9 => 'ہم چھینکنے کے بعد الحمد للہ کیوں کہتے ہیں؟';

  @override
  String get whyDoWeA9 =>
      'نبی ﷺ نے فرمایا: «جب تم میں سے کوئی چھینکے تو الحمد للہ کہے، اور اس کا بھائی یا ساتھی کہے: یرحمک اللہ۔» (بخاری)۔ یہ اللہ کی صحت کی نعمت پر شکر کا لمحہ ہے۔';

  @override
  String get whyDoWeQ10 => 'مسلمان خواتین حجاب کیوں پہنتی ہیں؟';

  @override
  String get whyDoWeA10 =>
      'اللہ نے قرآن (24:31) میں مومن خواتین کو اپنی عصمت کی حفاظت کا حکم دیا۔ حجاب اللہ کی عبادت اور اطاعت ہے۔ بہت سی مسلمان خواتین اسے شناخت، وقار اور روحانی تعلق کے ذریعے کے طور پر پہنتی ہیں۔';

  @override
  String get whyDoWeQ11 => 'ہم سور کا گوشت اور شراب کیوں نہیں کھاتے پیتے؟';

  @override
  String get whyDoWeA11 =>
      'اللہ نے قرآن (2:173) میں سور کا گوشت اور (5:90) میں شراب حرام کی، اسے «شیطانی عمل کی گندگی» قرار دیا۔ یہ پابندیاں صحت، ذہن اور خاندان کی حفاظت کرتی ہیں۔ حلال ہدایات مومنین کو طہارت برقرار رکھنے میں مدد کرتی ہیں۔';

  @override
  String get whyDoWeQ12 => 'ہم ان شاء اللہ کیوں کہتے ہیں؟';

  @override
  String get whyDoWeA12 =>
      'اللہ قرآن (18:23-24) میں حکم دیتا ہے: «کسی چیز کے بارے میں کبھی نہ کہو: میں یہ کل کروں گا، مگر یہ کہ اللہ چاہے۔» ان شاء اللہ کہنا اعتراف ہے کہ صرف اللہ مستقبل کو کنٹرول کرتا ہے اور ہمیں عاجزی میں رکھتا ہے۔';

  @override
  String get communityStoriesScreenSubtitle =>
      'دنیا بھر سے اسلام کی طرف حقیقی سفر';

  @override
  String get communityStoriesTimeLabel => 'مسلمان ہوئے';

  @override
  String get communityStoriesShareBtn => 'اپنی کہانی شیئر کریں';

  @override
  String get communityStoriesShareSoon =>
      'جلد آ رہا ہے — یہ فیچر راستے میں ہے!';

  @override
  String get communityStory1Name => 'عائشہ (پہلے سارہ)';

  @override
  String get communityStory1Location => 'ٹیکساس، امریکہ';

  @override
  String get communityStory1Time => '2 سال';

  @override
  String get communityStory1Text =>
      'میں نے اسلام کالج کے ایک مقالے کے لیے تحقیق کرتے ہوئے دریافت کیا۔ مجھے وہی ملنے کی توقع تھی جو میڈیا بتاتا ہے۔ لیکن مجھے سکون، منطق اور ایک سمجھ میں آنے والا خدا ملا۔ چھ ماہ بعد میں نے شہادت لی۔ سب سے مشکل حصہ نماز سیکھنا نہیں تھا — اپنے خاندان کو بتانا تھا۔ لیکن الحمد للہ، دو سال بعد میری ماں خود مجھ سے اسلام کے بارے میں سوال کرتی ہیں۔';

  @override
  String get communityStory2Name => 'یوسف (پہلے جیمز)';

  @override
  String get communityStory2Location => 'لندن، برطانیہ';

  @override
  String get communityStory2Time => '4 سال';

  @override
  String get communityStory2Text =>
      'میں برسوں کی تلاش کے بعد مسلمان ہوا۔ مسیحیت، بدھ مت، الحاد — کسی نے بھی وہ خلا نہیں بھرا۔ ایک مسلمان ساتھی نے مجھے جمعہ کی نماز کی دعوت دی۔ میں پیچھے بیٹھا اور پوری نماز میں روتا رہا۔ مجھے خود نہیں معلوم کیوں۔ اگلے ہفتے میں نے شہادت لی۔ برادری نے مجھے اس خاندان کی طرح اپنا لیا جس کی مجھے ضرورت تھی۔';

  @override
  String get communityStory3Name => 'مریم (پہلے ماریا)';

  @override
  String get communityStory3Location => 'میکسیکو سٹی، میکسیکو';

  @override
  String get communityStory3Time => '1 سال';

  @override
  String get communityStory3Text =>
      'لاطینی اور مسلمان ہونا ایک سپر پاور جیسا لگتا ہے۔ مجھے رات 2 بجے یوٹیوب ویڈیو سے اسلام ملا۔ گھنٹوں دیکھتی رہی۔ توحید کا تصور — کہ اللہ ایک ہے، کوئی شریک نہیں — گہرائی سے دل میں اتر گیا۔ مسجد میں بہنوں نے مجھے فوراً گھر جیسا محسوس کرایا۔';

  @override
  String get communityStory4Name => 'ابراہیم (پہلے ڈیوڈ)';

  @override
  String get communityStory4Location => 'ٹورنٹو، کینیڈا';

  @override
  String get communityStory4Time => '6 سال';

  @override
  String get communityStory4Text =>
      'میں ایک پادری کا بیٹا تھا۔ میرے ذہن میں تثلیث کے بارے میں ایسے سوالات تھے جن کا کوئی جواب نہیں دے سکا۔ جب میں نے پہلی بار قرآن پڑھا تو ایسا لگا جیسے وہی پڑھ رہا ہوں جس پر پہلے سے یقین رکھتا تھا۔ میں نے اکیلے خاموشی سے شہادت کہی، پھر مسجد میں دوبارہ۔ میری زندگی کا سب سے بہترین فیصلہ۔';

  @override
  String get communityStory5Name => 'فاطمہ (پہلے جینیفر)';

  @override
  String get communityStory5Location => 'سڈنی، آسٹریلیا';

  @override
  String get communityStory5Time => '3 سال';

  @override
  String get communityStory5Text =>
      'میری سفر حجاب سے شروع ہوئی۔ میں نے اسے مذاق میں پہنا اور... محفوظ محسوس کی۔ اسلام کے بارے میں پڑھنا شروع کیا اور رک نہ سکی۔ تین ماہ کے اندر میں نے شہادت لے لی۔ لوگ پوچھتے ہیں کہ میں نے کیا چھوڑا۔ میں کہتی ہوں: میں نے خالی پن چھوڑا۔';

  @override
  String get communityStory6Name => 'عمر (پہلے کیون)';

  @override
  String get communityStory6Location => 'جوہانسبرگ، جنوبی افریقہ';

  @override
  String get communityStory6Time => '5 سال';

  @override
  String get communityStory6Text =>
      'میں ایک مشکل محلے میں پلا بڑھا۔ اسلام نے مجھے نظم و ضبط، مقصد اور بھائی چارہ دیا۔ پہلی بار سجدہ کیا تو میرے اندر کچھ کھل گیا — بہترین طریقے سے۔ میں روتا رہا اور وضاحت نہ کر سکا۔ اب میں دوسرے نوجوانوں کو دین کی راہ پر رہنمائی کرتا ہوں۔';

  @override
  String get inspiredByRealStories => 'حقیقی نو مسلموں کے سفر سے متاثر';

  @override
  String get storyFormTitle => 'اپنی کہانی شیئر کریں';

  @override
  String get storyFormNameLabel => 'آپ کا نام';

  @override
  String get storyFormNameHint => 'نام، یا لکھیں \'گمنام\'';

  @override
  String get storyFormCountryLabel => 'ملک';

  @override
  String get storyFormCountryHint => 'آپ کہاں سے ہیں؟';

  @override
  String get storyFormTimeLabel => 'مسلمان ہوئے کتنا عرصہ ہوا';

  @override
  String get storyFormTimeHint => 'مثلاً: 2 سال، 6 ماہ';

  @override
  String get storyFormStoryLabel => 'آپ کی کہانی';

  @override
  String get storyFormStoryHint => 'اسلام کی طرف اپنا سفر بیان کریں...';

  @override
  String get storyFormSubmitBtn => 'کہانی جمع کریں';

  @override
  String get storyFormThankYouTitle => 'جزاک اللہ خیراً!';

  @override
  String get storyFormThankYouBody =>
      'آپ کی کہانی موصول ہو گئی ہے۔ ہم شائع کرنے سے پہلے تمام جمع شدہ کہانیاں جانچتے ہیں۔';

  @override
  String get storyFormRequiredError => 'براہ کرم تمام خانے بھریں';

  @override
  String get subtitleYourGuideToIslam => 'اسلام کی طرف آپ کا رہنما';

  @override
  String get beginnerMode => 'ابتدائی موڈ';

  @override
  String get beginnerModeSubtitle =>
      'نئے مسلمانوں کے لیے اضافی نکات اور رہنمائی';

  @override
  String get beginnerModeOn =>
      'ابتدائی موڈ آن ہے — پوری ایپ میں اضافی نکات دکھائے جا رہے ہیں';

  @override
  String get beginnerModePrayersTip =>
      'نکتہ: ہر نماز پر ٹیپ کریں اس کے بارے میں مزید جاننے اور سنتیں دیکھنے کے لیے';

  @override
  String get tafsirSubtitle => 'قرآنی تفسیر';

  @override
  String get tafsirComingSoon => 'اس سورہ کی تفسیر جلد آ رہی ہے';

  @override
  String get tafsirNotAvailable => 'تفسیر دستیاب نہیں ہے';

  @override
  String get scholarSource => 'ماخذ';

  @override
  String get asbabAlNuzul => 'شان نزول';

  @override
  String get transliteration => 'تلفظ';

  @override
  String get selectReciter => 'قاری منتخب کریں';

  @override
  String get playVerse => 'آیت چلائیں';

  @override
  String get asmaUlHusna => 'اسماء الحسنیٰ';

  @override
  String get asmaUlHusnaSubtitle => 'اللہ کے ٩٩ خوبصورت نام';

  @override
  String get asmaHadith =>
      'اللہ کے ننانوے نام ہیں، جو انہیں یاد کرے وہ جنت میں داخل ہوگا';

  @override
  String get asmaHadithSource => 'صحیح بخاری، 2736';

  @override
  String get asmaSearchHint => 'نام تلاش کریں...';

  @override
  String get asmaNoResults => 'کوئی نام نہیں ملا';

  @override
  String get asmaSignificance => 'اہمیت';

  @override
  String get asmaUlHusnaTile => '99 نام';

  @override
  String get asmaUlHusnaTileSubtitle => 'اللہ کے نام';

  @override
  String get onboardingTagline =>
      'اپنے وقت کی حفاظت کریں۔ اپنی نمازوں کی عزت کریں۔';

  @override
  String get onboardingChooseLanguage => 'اپنی زبان منتخب کریں';

  @override
  String get onboardingGetStarted => 'شروع کریں';

  @override
  String get onboardingLocationTitle => 'درست اوقاتِ نماز';

  @override
  String get onboardingLocationDesc =>
      'نور گارڈ کو آپ کے شہر کے درست نماز کے اوقات معلوم کرنے کے لیے آپ کے مقام کی ضرورت ہے۔ آپ کا مقام کبھی محفوظ یا شیئر نہیں کیا جاتا۔';

  @override
  String get onboardingPrivacyBanner =>
      'آپ کا ایمان ذاتی ہے۔ آپ کا ڈیٹا بھی ایسا ہی رہتا ہے۔';

  @override
  String get onboardingAllowLocation => 'مقام کی اجازت دیں';

  @override
  String get onboardingSkipForNow => 'ابھی کے لیے چھوڑیں';

  @override
  String get onboardingNotificationTitle => 'کوئی نماز نہ چھوٹے';

  @override
  String get onboardingNotificationDesc =>
      'ہر نماز کے وقت خوبصورت اذان کے ساتھ اطلاع پائیں۔ آوازیں اور وقت سیٹنگز میں تبدیل کریں۔';

  @override
  String get onboardingAdhanAlerts => 'اذان کی اطلاعات';

  @override
  String get onboardingCustomTiming => 'مخصوص وقت';

  @override
  String get onboardingAdjustable => 'قابلِ ترتیب';

  @override
  String get onboardingEnableNotifications => 'اطلاعات فعال کریں';

  @override
  String get onboardingMaybeLater => 'شاید بعد میں';

  @override
  String get onboardingAllSetTitle => 'سب کچھ تیار ہے!';

  @override
  String get onboardingAllSetDesc =>
      'نور گارڈ آپ کے وقت کی حفاظت\nاور نیت کے ساتھ آپ کے دن کی رہنمائی کے لیے تیار ہے۔';

  @override
  String get onboardingPrayerTimesLabel => 'اوقاتِ نماز';

  @override
  String get onboardingPrayerTimesDesc => 'آپ کے شہر کے درست اوقات';

  @override
  String get onboardingLockScreenLabel => 'اسلامی لاک اسکرین';

  @override
  String get onboardingLockScreenDesc =>
      'ہر بار اَن لاک کرنے پر قرآن اور دعائیں';

  @override
  String get onboardingPrayerGuardLabel => 'نماز گارڈ';

  @override
  String get onboardingPrayerGuardDesc =>
      'نماز کے دوران ایپس خودکار طور پر بلاک ہو جاتی ہیں';

  @override
  String get onboardingEnterApp => 'نور گارڈ میں داخل ہوں';

  @override
  String get adhan => 'اذان';

  @override
  String get adhanSubtitle => 'نماز کی پکار';

  @override
  String get adhanDescription =>
      'اذان اسلامی نماز کی پکار ہے، جو مومنوں کو عبادت کی دعوت دینے کے لیے روزانہ پانچ بار دی جاتی ہے۔';

  @override
  String get makkahStyle => 'مکہ';

  @override
  String get madinahStyle => 'مدینہ';

  @override
  String get egyptianStyle => 'مصری';

  @override
  String get adhanPlaying => 'ابھی چل رہا ہے';

  @override
  String get makkahDescription => 'مکہ کی مسجد الحرام سے نماز کی روایتی پکار۔';

  @override
  String get madinahDescription =>
      'مدینہ کی مسجد نبوی کے انداز میں ایک پُرسکون تلاوت۔';

  @override
  String get egyptianDescription =>
      'ایک خوش الحان مصری انداز کی اذان، جو اپنی شاندار تلاوت کے لیے مشہور ہے۔';

  @override
  String get adhanCallToWorship => 'نماز کی پکار';

  @override
  String get adhanDescriptionFull =>
      'اذان اسلامی نماز کی پکار ہے، جو مومنوں کو عبادت کی دعوت دینے کے لیے روزانہ پانچ بار دی جاتی ہے۔';

  @override
  String get alafasyStyle => 'مشاری العفاسی';

  @override
  String get alaqsaStyle => 'الاقصیٰ';

  @override
  String get turkishStyle => 'ترکی';

  @override
  String get pakistaniStyle => 'پاکستانی';

  @override
  String get indonesianStyle => 'انڈونیشیائی';

  @override
  String get alafasyDescription =>
      'معروف قاری مشاری راشد العفاسی کی دل کو چھو لینے والی تلاوت۔';

  @override
  String get alaqsaDescription =>
      'یروشلم میں مسجد اقصیٰ سے گونجتی ہوئی نماز کی پکار، اسلام کا تیسرا مقدس ترین مقام۔';

  @override
  String get turkishDescription =>
      'اپنے منفرد سُریلے مقام کے ساتھ روایتی ترک طرز کی اذان۔';

  @override
  String get pakistaniDescription =>
      'جنوبی ایشیائی روایت میں دل کو چھو لینے والی اذان، پاکستان بھر میں پڑھی جاتی ہے۔';

  @override
  String get indonesianDescription =>
      'خوش الحان انڈونیشیائی طرز کی اذان، جو پورے جزائر میں پسند کی جاتی ہے۔';

  @override
  String get thisWeek => 'اس ہفتے';

  @override
  String weeklyProgress(int count) {
    return 'اس ہفتے 35 میں سے $count نمازیں';
  }

  @override
  String get bestDay => 'بہترین دن';

  @override
  String get prayerStats => 'نماز کے اعداد و شمار';

  @override
  String get completionRate => 'تکمیل کی شرح';

  @override
  String get bestPrayer => 'سب سے زیادہ پابندی والی نماز';

  @override
  String get hardestPrayer => 'سب سے زیادہ چھوڑی جانے والی نماز';

  @override
  String totalPrayersCompleted(int count) {
    return '$count نمازیں مکمل ہوئیں';
  }

  @override
  String get last7Days => 'پچھلے 7 دن';

  @override
  String get thisMonth => 'اس مہینے';

  @override
  String get fullDays => 'مکمل دن';

  @override
  String get partialDays => 'جزوی دن';

  @override
  String get missedDays => 'چھوٹے ہوئے دن';

  @override
  String get missedPrayerBadge => 'چھوٹ گئی';

  @override
  String get makeItUp => 'قضا ادا کریں';

  @override
  String get qadaExplanation =>
      'اگر آپ سے کوئی نماز چھوٹ جائے تو آپ اسے قضا کے طور پر ادا کر سکتے ہیں۔';

  @override
  String get noStatsYet =>
      'اپنے اعداد و شمار دیکھنے کے لیے اپنی نمازیں نشان زد کرتے رہیں۔';

  @override
  String get notEnoughData => 'ابھی کافی ڈیٹا موجود نہیں ہے';

  @override
  String get continuousPlay => 'مسلسل';

  @override
  String get sleepTimer => 'نیند ٹائمر';

  @override
  String verseCount(Object total, Object verse) {
    return 'آیت $verse از $total';
  }

  @override
  String get verseTafsir => 'آیت کی تفسیر';

  @override
  String get tafsirOfTheDay => 'آج کی تفسیر';

  @override
  String get dailyInsight => 'روزانہ بصیرت';

  @override
  String get keyThemes => 'اہم موضوعات اور اسباق';

  @override
  String get readFullSurah => 'پوری سورت پڑھیں';

  @override
  String get surahIntroduction => 'سورت کا تعارف';

  @override
  String get verses => 'آیات';

  @override
  String get loadingTafsir => 'تفسیر لوڈ ہو رہی ہے...';

  @override
  String get keepAliveNotificationText => 'نماز کی اطلاعات فعال ہیں';

  @override
  String get keepAliveChannelName => 'نماز کی اطلاعات';

  @override
  String get keepAliveChannelDescription =>
      'نور گارڈ کو پس منظر میں فعال رکھتا ہے تاکہ نماز کے الارم کبھی نہ چھوٹیں۔';

  @override
  String get notifSetupTitle => 'لاک سکرین الرٹس فعال کریں';

  @override
  String get notifSetupSubtitle =>
      'تاکہ آپ اذان کبھی نہ چھوڑیں — چاہے آپ کا فون لاک ہی کیوں نہ ہو۔ اس میں تقریباً ایک منٹ لگتا ہے۔';

  @override
  String get notifSetupSamsungBanner =>
      'Samsung Galaxy استعمال کر رہے ہیں (Fold/Flip سمیت)؟ Samsung اسٹاک اینڈرائیڈ سے زیادہ اضافی سوئچز شامل کرتا ہے — نیچے مرحلہ 4 اور 6 آپ کو بالکل بتاتے ہیں کہ وہ کہاں ہیں۔';

  @override
  String get notifSetupStep1Title => 'اطلاعات کی اجازت دیں';

  @override
  String get notifSetupStep1Description =>
      'بنیادی اجازت جو نور گارڈ کو آپ کو مطلع کرنے کے لیے درکار ہے۔';

  @override
  String get notifSetupStep1Action => 'اطلاعات کی اجازت دیں';

  @override
  String get notifSetupStep2Title => 'الارمز اور یاد دہانیاں';

  @override
  String get notifSetupStep2Description =>
      'نماز کے الارم کو بالکل وقت پر بجنے دیتا ہے، چاہے آپ کا فون غیر فعال ہو یا بیٹری سیور میں ہو۔';

  @override
  String get notifSetupStep2Action => 'الارم کی ترتیبات کھولیں';

  @override
  String get notifSetupStep3Title => 'دوسری ایپس کے اوپر دکھائیں';

  @override
  String get notifSetupStep3Description =>
      'مکمل نماز اسکرین کو لاک سکرین اور جو کچھ بھی کھلا ہو اس کے اوپر دکھنے دیتا ہے۔';

  @override
  String get notifSetupStep3Action => 'ترتیبات کھولیں';

  @override
  String get notifSetupStep4Title =>
      'پاپ اپ / فل اسکرین الرٹ کے طور پر دکھائیں';

  @override
  String get notifSetupStep4Description =>
      'اذان اسکرین کو خاموش بینر کے بجائے لاک سکرین کے اوپر نمودار ہونے دیتا ہے۔';

  @override
  String get notifSetupStep4SamsungNote =>
      'Samsung Galaxy فونز پر (Fold/Flip سمیت): ترتیبات کھولیں ← \"Prayer Time Alarm\" پر ٹیپ کریں، پھر \"Pop-up notification\" آن کریں (Fold/Flip پر \"Cover screen pop-up\" کہلاتا ہے)۔ یہ صرف Samsung کا سوئچ ہے — اسے آن کرنا ہی اذان اسکرین کو لاک سکرین کے اوپر لاتا ہے۔';

  @override
  String get notifSetupStep4Action => 'اطلاعاتی ترتیبات کھولیں';

  @override
  String get notifSetupStep5Title => 'اطلاعات کو قابل اعتماد رکھیں';

  @override
  String get notifSetupStep5Description =>
      'اینڈرائیڈ کو نور گارڈ کو پس منظر میں سست یا تاخیر کا شکار کرنے سے روکتا ہے، تاکہ نماز کے الارم اور یاد دہانیاں ہمیشہ وقت پر پہنچیں۔';

  @override
  String get notifSetupStep5Action => 'بیٹری آپٹیمائزیشن بند کریں';

  @override
  String get notifSetupStep6Title => 'کبھی نہ سونے والی ایپس';

  @override
  String get notifSetupStep6Description =>
      'Samsung کا بیٹری مینیجر نور گارڈ کو سو سکتا ہے اور خاموشی سے نماز کے الارم بلاک کر سکتا ہے۔ اسے \"Never sleeping apps\" میں شامل کرنا اسے روکتا ہے۔';

  @override
  String get notifSetupStep6SamsungNote =>
      'ترتیبات ← بیٹری اور ڈیوائس کیئر ← بیک گراؤنڈ استعمال کی حدیں ← Never sleeping apps ← \"+\" پر ٹیپ کریں ← نور گارڈ منتخب کریں۔';

  @override
  String get notifSetupStep6Action => 'بیٹری کی ترتیبات کھولیں';

  @override
  String get notifSetupStatusChecking => 'جانچا جا رہا ہے…';

  @override
  String get notifSetupStatusEnabled => 'فعال';

  @override
  String get notifSetupStatusNeeded => 'درکار';

  @override
  String get notifSetupStatusManual => 'دستی مرحلہ';

  @override
  String get notifSetupContinueButton => 'نور گارڈ کی طرف جائیں';

  @override
  String get notifSetupLaterButton => 'میں یہ بعد میں مکمل کروں گا';

  @override
  String get notifSetupDoneButton => 'ہو گیا';

  @override
  String get testNotificationButton => 'ٹیسٹ نوٹیفیکیشن بھیجیں (10 سیکنڈ)';

  @override
  String get testNotificationSnack => 'ٹیسٹ نوٹیفیکیشن 10 سیکنڈ میں آئے گا';

  @override
  String get testLockAlarmButton => 'فل اسکرین لاک الارم ٹیسٹ کریں (10 سیکنڈ)';

  @override
  String get testLockAlarmSnack =>
      'لاک الارم 10 سیکنڈ میں بجے گا — ابھی اپنا فون لاک کریں';

  @override
  String get testAdhanForegroundButton => 'ان ایپ اذان ٹیسٹ کریں (فورگراؤنڈ)';

  @override
  String get testAdhanForegroundSnack =>
      'خاموش بینر کے ساتھ مکمل اذان چلائی جا رہی ہے';

  @override
  String get testRequiresNotificationsOn =>
      'اسے آزمانے کے لیے پہلے نماز کی اطلاعات آن کریں';

  @override
  String get lockScreenSetupGuideButton => 'لاک اسکرین الرٹ سیٹ اپ گائیڈ';

  @override
  String get couldNotOpenPrivacyPolicy => 'رازداری کی پالیسی نہیں کھل سکی';

  @override
  String get couldNotOpenEmailApp => 'ای میل ایپ نہیں کھل سکی';

  @override
  String get blockDurationLabel => 'بلاک کا دورانیہ';

  @override
  String get privacyAndTrust => 'رازداری اور اعتماد';

  @override
  String get noorGuardMotto =>
      '\"اگر یہ مسجد میں جائز نہیں،\nتو یہ نور گارڈ میں بھی جائز نہیں۔\"';

  @override
  String get openingAppStore => 'ایپ سٹور کھولا جا رہا ہے…';

  @override
  String get openingShareSheet => 'شیئر شیٹ کھولی جا رہی ہے…';

  @override
  String get openingSupportEmail => 'سپورٹ ای میل کھولا جا رہا ہے…';

  @override
  String get openingTermsOfService => 'شرائط خدمت کھولی جا رہی ہیں…';

  @override
  String get duration30Min => '30 منٹ';

  @override
  String get duration1Hour => '1 گھنٹہ';

  @override
  String get durationPrayerWindowOnly => 'صرف نماز کا وقفہ';

  @override
  String get hoursAbbreviation => 'گھنٹہ';

  @override
  String get cancelTimerButton => 'ٹائمر منسوخ کریں';

  @override
  String get custom => 'حسب ضرورت';

  @override
  String get customTimerMinutesTitle => 'حسب ضرورت ٹائمر (منٹ)';

  @override
  String get customTimerHint => 'مثلاً 20';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get start => 'شروع کریں';

  @override
  String get travel => 'سفر';

  @override
  String get anxietyAndStress => 'بے چینی اور تناؤ';

  @override
  String get gratitude => 'شکر';

  @override
  String get protection => 'حفاظت';

  @override
  String get family => 'خاندان';

  @override
  String get forgiveness => 'بخشش';

  @override
  String get appBlockingSetupHeadline =>
      'اپنا وقت محفوظ رکھیں، اپنی نماز محفوظ رکھیں';

  @override
  String get appBlockingSetupBody =>
      'نور گارڈ اینڈرائیڈ کی ایکسیسبیلٹی سروس صرف یہ جاننے کے لیے استعمال کرتا ہے کہ نماز کے وقت کوئی مسدود ایپ کھولی گئی ہے۔ یہ آپ کے پیغامات، تصاویر یا کوئی ذاتی معلومات کبھی نہیں پڑھتا۔';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'ایکسیسبیلٹی رسائی دی جا چکی ہے';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'ایکسیسبیلٹی رسائی ابھی نہیں دی گئی';

  @override
  String get appBlockingOpenSettings => 'ایکسیسبیلٹی سیٹنگز کھولیں';

  @override
  String get appBlockingSetupNotNow => 'ابھی نہیں';

  @override
  String get appBlockingEnableToggle => 'ایپ بلاکنگ فعال کریں';

  @override
  String get appBlockingModeLabel => 'بلاکنگ موڈ';

  @override
  String get appBlockingModeSoft => 'نرم';

  @override
  String get appBlockingModeSoftDesc =>
      'صرف ہلکی یاددہانی — ایپس کھلی رہتی ہیں';

  @override
  String get appBlockingModeFirm => 'درمیانہ';

  @override
  String get appBlockingModeFirmDesc =>
      'ایپ کو مسدود کرتا ہے، فوری نظرانداز کے ساتھ';

  @override
  String get appBlockingModeHard => 'سخت';

  @override
  String get appBlockingModeHardDesc =>
      'مکمل بندش — صرف \"میں نے نماز پڑھی\" اسے کھولتا ہے';

  @override
  String get appBlockingSelectPrayersLabel => 'ان نمازوں کے دوران مسدود کریں';

  @override
  String get appBlockingBufferBeforeLabel => 'نماز سے پہلے شروع کریں';

  @override
  String get appBlockingBufferAfterLabel => 'نماز کے بعد ہٹائیں';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count منٹ';
  }

  @override
  String get appBlockingAppsTitle => 'مسدود ایپس';

  @override
  String get appBlockingSelectAppsButton => 'مسدود کرنے کے لیے ایپس منتخب کریں';

  @override
  String get appBlockingSearchHint => 'انسٹال شدہ ایپس تلاش کریں';

  @override
  String get appBlockingNoAppsSelected => 'ابھی تک کوئی ایپ منتخب نہیں کی گئی';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ایپس مسدود',
      one: '1 ایپ مسدود',
      zero: 'کوئی ایپ مسدود نہیں',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'ٹیسٹنگ';

  @override
  String get appBlockingTestDescription =>
      'اس ڈیوائس پر اس کے کام کرنے کی تصدیق کے لیے ایپ بلاکنگ کو 2 منٹ کے لیے فعال کریں۔';

  @override
  String get appBlockingTestButton => 'ایپ بلاکنگ ٹیسٹ کریں (2 منٹ)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'ایپ بلاکنگ 2 منٹ کے لیے فعال ہے — کوئی بلاک شدہ ایپ کھولنے کی کوشش کریں';

  @override
  String get appBlockingPermissionNeeded =>
      'بلاکنگ شروع کرنے کے لیے ایکسیسبیلٹی رسائی آن کریں';

  @override
  String get appBlockingIosComingSoonTitle => 'اسکرین ٹائم رسائی — جلد آرہی ہے';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOS پر ایپ بلاکنگ کے لیے ایپل کی اسکرین ٹائم اجازت درکار ہے، جس پر ہم کام کر رہے ہیں۔ تیار ہوتے ہی آپ کو بتا دیں گے۔';

  @override
  String get appBlockingHeadline1 => 'نماز کا وقت ہے';

  @override
  String get appBlockingHeadline2 => 'اپنا وقت محفوظ رکھیں';

  @override
  String get appBlockingDefaultTitle => 'نماز کا وقت';

  @override
  String get appBlockingIPrayedButton => 'میں نے نماز پڑھی';

  @override
  String get appBlockingReadAyahsButton => '3 آیات پڑھیں';

  @override
  String get appBlockingEmergencyBypass => 'ہنگامی نظرانداز';

  @override
  String get appBlockingSkipForNow => 'ابھی کے لیے نظرانداز کریں';

  @override
  String get appBlockingBypassConfirmTitle => 'اپنا سلسلہ ختم کریں؟';

  @override
  String get appBlockingBypassConfirmBody =>
      'ابھی نظرانداز کرنے سے آپ کی نماز کا سلسلہ ری سیٹ ہو جائے گا۔ اگر یہ حقیقی ہنگامی صورتحال ہے تو آپ جاری رکھ سکتے ہیں۔';

  @override
  String get appBlockingBypassConfirmContinue => 'پھر بھی نظرانداز کریں';

  @override
  String get appBlockingBypassConfirmCancel => 'واپس جائیں';

  @override
  String get appBlockingSoftReminderTitle => 'ایک نرم یاددہانی';

  @override
  String get appBlockingSoftReminderBody =>
      'نماز کا وقت ہے — ایک لمحے کے لیے دور ہونے پر غور کریں۔';

  @override
  String get quranChallengeBannerTitle => 'کھولنے کے لیے 3 آیات پڑھیں';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$total میں سے $count آیات پڑھی گئیں';
  }

  @override
  String get quranChallengeComplete => 'بہت خوب — ایپس کھل گئیں';

  @override
  String get focusBlockHeadline1 => 'توجہ مرکوز رکھیں';

  @override
  String get focusBlockHeadline2 => 'جاری رکھیں';

  @override
  String get endFocusSessionButton => 'فوکس سیشن ختم کریں';

  @override
  String get focusPaused => 'نماز کے لیے رکا ہوا';

  @override
  String get selectLocationTitle => 'مقام منتخب کریں';

  @override
  String get useCurrentLocation => 'موجودہ مقام استعمال کریں';

  @override
  String get savedLocationsHeader => 'محفوظ مقامات';

  @override
  String get noSavedLocationsYet =>
      'ابھی تک کوئی مقام محفوظ نہیں ہے۔ شامل کرنے کے لیے نیچے تلاش کریں۔';

  @override
  String get searchCityHint => 'شہر کا نام تلاش کریں…';

  @override
  String get addLocationTooltip => 'مقام شامل کریں';

  @override
  String get deleteLocationTooltip => 'مقام حذف کریں';

  @override
  String get locationNotFound => 'مقام نہیں ملا۔ مختلف تلاش آزمائیں۔';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'آپ زیادہ سے زیادہ $max مقامات محفوظ کر سکتے ہیں';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'تبدیلی کی تصدیق نہیں ہو سکی — دوبارہ کوشش کریں';

  @override
  String get tasbihCounter => 'تسبیح کاؤنٹر';

  @override
  String get tasbihCounterSubtitle => 'اپنا ذکر شمار کریں';

  @override
  String get tasbihResetButton => 'ری سیٹ';

  @override
  String get tasbihTotalLabel => 'کل';

  @override
  String get tasbihCelebrationTitle => 'تسبیح مکمل ہوگئی!';

  @override
  String get tasbihCelebrationBody =>
      'آپ نے تمام 99 اذکار مکمل کر لیے۔ اللہ آپ کا ذکر قبول فرمائے۔';

  @override
  String get tasbihStartNewSession => 'نیا سیشن شروع کریں';

  @override
  String get tasbihUndoButton => 'کالعدم کریں';

  @override
  String get tasbihTapAnywhereHint =>
      'شمار کرنے کے لیے اسکرین پر کہیں بھی تھپتھپائیں';

  @override
  String get tasbihSoundToggleTooltip => 'ٹیپ کی آواز';

  @override
  String get tasbihManageDhikrTooltip => 'ذکر کا انتظام کریں';

  @override
  String get tasbihStatsTooltip => 'اعداد و شمار دیکھیں';

  @override
  String get tasbihDailyTotalLabel => 'آج کی کل تعداد';

  @override
  String get tasbihRoundsTodayLabel => 'آج کے دور';

  @override
  String get tasbihManageDhikrTitle => 'ذکر کا انتظام';

  @override
  String get tasbihAddCustomDhikrButton => 'ذاتی ذکر شامل کریں';

  @override
  String get tasbihDeleteDhikrTooltip => 'حذف کریں';

  @override
  String get tasbihBuiltInDhikrBadge => 'پہلے سے شامل';

  @override
  String get tasbihCannotDeleteLastDhikr =>
      'آپ کو کم از کم ایک ذکر کی ضرورت ہے';

  @override
  String get tasbihDhikrNameLabel => 'نام';

  @override
  String get tasbihDhikrNameHint => 'مثلاً: استغفر اللہ';

  @override
  String get tasbihDhikrArabicLabel => 'عربی (اختیاری)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'براہ کرم نام درج کریں';

  @override
  String get tasbihSaveDhikrButton => 'محفوظ کریں';

  @override
  String get tasbihStatsTitle => 'تسبیح کے اعداد و شمار';

  @override
  String get tasbihAllTimeTotalLabel => 'مجموعی کل تعداد';

  @override
  String get tasbihNoActivityYetMessage =>
      'اپنے اعداد و شمار یہاں دیکھنے کے لیے شمار کرنا شروع کریں۔';

  @override
  String get tasbihSoundPickerTitle => 'ٹیپ کی آواز';

  @override
  String get tasbihSoundClassicClick => 'کلاسک کلک';

  @override
  String get tasbihSoundSoftChime => 'نرم گھنٹی';

  @override
  String get tasbihSoundStoneTap => 'پتھر کی ٹھک';

  @override
  String get tasbihCurrentlyReciting => 'ابھی پڑھا جا رہا ہے';

  @override
  String tasbihOfTarget(int target) {
    return '$target میں سے';
  }

  @override
  String get tasbihSoundRainDrop => 'بارش کا قطرہ';

  @override
  String get tasbihSoundSoftFeather => 'نرم پر';

  @override
  String noAyahsFound(String query) {
    return '\"$query\" کے لیے کوئی آیت نہیں ملی';
  }

  @override
  String get trySearchingQuran =>
      'اردو، انگریزی یا عربی میں تلاش کریں، یا اسلامی اصطلاح استعمال کریں:';

  @override
  String get loadingQuranIndex => 'قرآن کا اشاریہ لوڈ ہو رہا ہے…';

  @override
  String get quranSearchSuggestions =>
      'صبر, رحمت, نماز, معافی, توبہ, جنت, علم, دعا, ذکر, شکر';

  @override
  String get heroVerse1 =>
      'اپنی نمازوں کی حفاظت کرو، خاص طور پر درمیانی نماز کی۔';

  @override
  String get heroVerse2 => 'بے شک نماز مومنوں پر وقت مقرر کر کے فرض کی گئی ہے۔';

  @override
  String get heroVerse3 => 'صبر اور نماز سے مدد مانگو۔';

  @override
  String get heroVerse4 =>
      'پس مجھے یاد کرو، میں تمہیں یاد کروں گا۔ اور میرا شکر کرو اور ناشکری مت کرو۔';

  @override
  String get heroVerse5 => 'اور جو اللہ پر توکل کرے تو وہ اسے کافی ہے۔';

  @override
  String get heroVerse6 =>
      'بے شک سب سے پہلا گھر جو لوگوں کے لیے بنایا گیا وہ مکہ میں ہے، برکت والا اور سارے جہان کے لیے ہدایت۔';

  @override
  String get heroVerse7 =>
      'بے شک نماز بے حیائی اور برائی سے روکتی ہے، اور اللہ کا ذکر سب سے بڑا ہے۔';

  @override
  String get heroVerse8 => 'یاد رکھو! اللہ کی یاد سے ہی دل اطمینان پاتے ہیں۔';

  @override
  String get heroVerse9 => 'مجھ سے دعا کرو، میں قبول کروں گا۔';

  @override
  String get heroVerse10 =>
      'اگر تم شکر گزار ہو گے تو میں تمہیں اور زیادہ دوں گا۔';

  @override
  String get heroVerse11 =>
      'اللہ کسی نفس کو اس کی طاقت سے زیادہ تکلیف نہیں دیتا۔';

  @override
  String get heroVerse12 => 'بے شک اللہ صبر کرنے والوں کے ساتھ ہے۔';

  @override
  String get heroVerse13 => 'میری رحمت ہر چیز کو گھیرے ہوئے ہے۔';

  @override
  String get heroVerse14 =>
      'اور نیکی کرو، بے شک اللہ نیکی کرنے والوں کو پسند کرتا ہے۔';

  @override
  String get heroVerse15 =>
      'یہ وہ کتاب ہے جس میں کوئی شک نہیں، پرہیزگاروں کے لیے ہدایت ہے۔';

  @override
  String get accuracyHigh => 'اعلیٰ درستگی';

  @override
  String get accuracyMedium => 'درمیانی درستگی';

  @override
  String get accuracyLow => 'کم درستگی';

  @override
  String get accuracyCalibrating => 'کیلیبریشن ہو رہی ہے…';

  @override
  String get compassNeedsCalibration => 'قطب نما کو کیلیبریشن کی ضرورت ہے';

  @override
  String get compassCalibrationHint =>
      'درستگی بہتر کرنے کے لیے فون کو آہستہ آہستہ 8 کی شکل میں حرکت دیں۔';

  @override
  String get spiritLevelLabel => 'بلبلہ پیمانہ';

  @override
  String get spiritLevelLevelText => '✓  برابر';

  @override
  String get spiritLevelTiltText => 'سیدھا کریں';

  @override
  String get compassNorth => 'ش';

  @override
  String get compassEast => 'م';

  @override
  String get compassSouth => 'ج';

  @override
  String get compassWest => 'مغ';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'اپنا وقت بچاؤ۔ اپنی نماز کا احترام کرو۔';

  @override
  String get stopAdhan => 'اذان بند کریں';

  @override
  String get duasSearchEmpty => 'کوئی اور زمرہ یا تلاش کی اصطلاح آزمائیں۔';

  @override
  String get onboardingSkip => 'چھوڑیں';

  @override
  String get onboardingWelcomeTo => 'خوش آمدید';

  @override
  String get onboardingSubtitle => 'اسلام کے خوبصورت سفر میں آپ کا ساتھی۔';

  @override
  String get onboardingLetsGetStarted => 'چلیں شروع کریں';

  @override
  String onboardingStepOf(int step, int total) {
    return '$total میں سے $step';
  }

  @override
  String get onboardingWhatsYourName => 'آپ کا نام کیا ہے؟';

  @override
  String get onboardingNameSubtitle =>
      'ہم جاننا چاہتے ہیں کہ آپ کو کیسے مخاطب کریں۔';

  @override
  String get onboardingNameHint => 'اپنا نام درج کریں';

  @override
  String get onboardingContinue => 'جاری رکھیں';

  @override
  String get onboardingAreYouNewToIslam => 'کیا آپ اسلام میں نئے ہیں؟';

  @override
  String get onboardingModeSubtitle =>
      'ہم آپ کے سفر کی بنیاد پر آپ کا تجربہ ذاتی بنائیں گے۔';

  @override
  String get onboardingNewToIslam => 'میں اسلام میں نیا ہوں';

  @override
  String get onboardingNewToIslamDesc => 'مبتدی موڈ قدم بقدم رہنمائی کے ساتھ';

  @override
  String get onboardingFamiliarWithIslam => 'میں اسلام سے واقف ہوں';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'تمام خصوصیات کے ساتھ باقاعدہ موڈ';

  @override
  String greetingWithName(String name) {
    return 'السلام علیکم، $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'مسلمان کے طور پر $days واں دن';
  }

  @override
  String get beginnerEssential1 => 'نئے مسلمان کی رہنمائی';

  @override
  String get beginnerEssential2 => 'وضو سیکھیں';

  @override
  String get beginnerEssential3 => 'نماز کا طریقہ (قدم بہ قدم)';

  @override
  String get beginnerEssential4 => 'سورۃ الفاتحہ';

  @override
  String get beginnerEssential5 => 'روزانہ کی دعائیں';

  @override
  String get beginnerEssential6 => 'شہادت کو سمجھنا';

  @override
  String get beginnerEssential7 => 'اسلامی اصطلاحات اور لغت';

  @override
  String get beginnerExploreAll => 'تمام خصوصیات دیکھیں';

  @override
  String get beginnerExploreSubtitle => 'مکمل نور گارڈ تجربے میں تبدیل ہوں';

  @override
  String get beginnerExploreFeaturesSubtitle => 'نور گارڈ کی تمام سہولیات';

  @override
  String get beginnerLearnSalah => 'نماز سیکھیں';

  @override
  String get beginnerMayAllahGuide =>
      'اللہ آپ کے ہر قدم کی رہنمائی فرمائے اور آپ کے سفر کو مبارک کرے۔';

  @override
  String get beginnerMuslimEssentials => 'مسلمان کی بنیادی باتیں';

  @override
  String get beginnerQuote1 => 'بے شک تکلیف کے ساتھ آسانی ہے۔ — قرآن ٩٤:٦';

  @override
  String get beginnerQuote2 =>
      'اللہ کے احکام کی حفاظت کرو، وہ تمہاری حفاظت کرے گا۔';

  @override
  String get beginnerQuote3 =>
      'اللہ تعالیٰ تمہاری صورتوں اور مالوں کو نہیں دیکھتا، بلکہ وہ تمہارے دلوں اور اعمال کو دیکھتا ہے۔';

  @override
  String get beginnerQuote4 => 'نماز کی طرف ہر قدم امن کی طرف ایک قدم ہے۔';

  @override
  String get beginnerQuote5 =>
      'تم میں سے بہترین وہ ہے جو قرآن سیکھے اور سکھائے۔';

  @override
  String get beginnerTapToSetShahadaDate =>
      'شہادت کی تاریخ سیٹ کرنے کے لیے ٹیپ کریں';

  @override
  String get beginnerToolboxSection => 'ابتدائی ٹول باکس';

  @override
  String get beginnerYourJourney => 'آپ کا سفر';

  @override
  String get journeyMonth1Name => 'مہینہ 1: بنیاد';

  @override
  String get journeyMonth2Name => 'مہینہ 2: عادات بنانا';

  @override
  String get journeyMonth3Name => 'مہینہ 3: ایمان گہرا کرنا';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total مکمل';
  }

  @override
  String get journeyViewFull => 'پوری سفر دیکھیں →';

  @override
  String get journeyTask2_1 => '7 دن تمام 5 نمازیں ادا کریں';

  @override
  String get journeyTask2_2 => '10 مزید دعائیں سیکھیں';

  @override
  String get journeyTask2_3 => 'قرآن کا پہلا جزء پڑھیں';

  @override
  String get journeyTask2_4 => 'اللہ کے 99 نام سیکھیں';

  @override
  String get journeyTask2_5 => '7 دن روزانہ تسبیح کاؤنٹر استعمال کریں';

  @override
  String get journeyTask2_6 => 'سنت نمازیں سیکھیں';

  @override
  String get journeyTask2_7 => 'اپنی مقامی مسجد تلاش کریں';

  @override
  String get journeyTask3_1 => 'سورہ البقرہ پڑھیں';

  @override
  String get journeyTask3_2 => 'زکوۃ کے بارے میں جانیں';

  @override
  String get journeyTask3_3 => 'روزے کے بارے میں جانیں';

  @override
  String get journeyTask3_4 => '3 نئی سورتیں حفظ کریں';

  @override
  String get journeyTask3_5 => 'حج کے بارے میں جانیں';

  @override
  String get journeyTask3_6 => 'کسی کے ساتھ اسلام شیئر کریں';

  @override
  String get journeyTask3_7 => 'اسلامی لغت مکمل کریں';

  @override
  String get journeyTimelineTitle => 'میرا سفر';

  @override
  String get journeyCompleted => 'مکمل';

  @override
  String get journeyInProgress => 'جاری';

  @override
  String get journeyLocked => 'بند';

  @override
  String get wuduThreeTimes => '۳ مرتبہ';

  @override
  String get wuduDuaBefore => 'وضو سے پہلے کی دعا';

  @override
  String get wuduDuaAfter => 'وضو کے بعد کی دعا';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'اللہ کے نام سے';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں، وہ اکیلا ہے اور اس کا کوئی شریک نہیں، اور میں گواہی دیتا ہوں کہ محمد ﷺ اس کے بندے اور رسول ہیں۔ یا اللہ، مجھے توبہ کرنے والوں اور پاکیزگی اختیار کرنے والوں میں شامل فرما۔';

  @override
  String get wuduCompleteButton => 'میں نے وضو مکمل کر لیا';

  @override
  String get howToPrayStepOpeningDua => 'افتتاحی دعا';

  @override
  String get howToPrayStepAlFatiha => 'سورۃ الفاتحہ';

  @override
  String get howToPrayStepSurah => 'مختصر سورت';

  @override
  String get howToPrayStepTashahhudShort => 'تشہد (درمیانی بیٹھک)';

  @override
  String get howToPrayStepSalawat => 'نبی ﷺ پر درود';

  @override
  String get howToPrayTransTakbir => 'اللہ سب سے بڑا ہے';

  @override
  String get howToPrayTransOpeningDua =>
      'اے اللہ! تو پاک ہے اور تیری تعریف کرتا ہوں، تیرا نام بابرکت ہے، تیری شان بلند ہے، اور تیرے سوا کوئی معبود نہیں۔';

  @override
  String get howToPrayTransFatiha =>
      'اللہ کے نام سے جو بڑا مہربان اور رحم والا ہے۔ سب تعریفیں اللہ کے لیے ہیں جو تمام جہانوں کا رب ہے۔ بڑا مہربان اور رحم والا۔ روزِ جزا کا مالک۔ ہم صرف تیری عبادت کرتے ہیں اور صرف تجھ سے مدد مانگتے ہیں۔ ہمیں سیدھا راستہ دکھا — ان لوگوں کا راستہ جن پر تو نے انعام کیا، نہ ان کا جن پر غضب ہوا، اور نہ ان کا جو گمراہ ہوئے۔';

  @override
  String get howToPrayTransRuku => 'میرا رب بہت بزرگ ہے، اس کی پاکی ہو';

  @override
  String get howToPrayTransItidal =>
      'اللہ نے اس کی سن لی جس نے اس کی تعریف کی۔ اے ہمارے رب، ساری تعریفیں تیری ہیں۔';

  @override
  String get howToPrayTransSujood => 'میرا رب سب سے اعلیٰ ہے، اس کی پاکی ہو';

  @override
  String get howToPrayTransJalsa => 'اے میرے رب، مجھے معاف فرما';

  @override
  String get howToPrayTransTashahhud =>
      'تمام تعریفیں، نمازیں اور نیک اعمال اللہ کے لیے ہیں۔ اے نبی ﷺ، آپ پر سلام ہو اور اللہ کی رحمت اور برکت۔ ہم پر اور اللہ کے نیک بندوں پر سلام۔ میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں اور محمد ﷺ اس کے بندے اور رسول ہیں۔';

  @override
  String get howToPrayTransSalawat =>
      'اے اللہ، محمد ﷺ پر اور آلِ محمد پر رحمت بھیج جیسے تو نے ابراہیم ؑ اور آلِ ابراہیم پر رحمت بھیجی — بے شک تو قابلِ تعریف اور بزرگ ہے۔ اے اللہ، محمد ﷺ پر اور آلِ محمد پر برکت نازل فرما جیسے تو نے ابراہیم ؑ اور آلِ ابراہیم پر برکت نازل فرمائی — بے شک تو قابلِ تعریف اور بزرگ ہے۔';

  @override
  String get howToPrayTransTasleem => 'آپ پر سلام اور اللہ کی رحمت ہو';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'تکبیرِ تحریمہ کے فوراً بعد یہ دعا آہستہ پڑھیں۔ یہ صرف ایک بار، نماز کے آغاز میں پڑھی جاتی ہے۔';

  @override
  String get howToPraySurahInstruction =>
      'الفاتحہ کے بعد کوئی بھی یاد سورت پڑھیں۔ سورۃ الإخلاص (اوپر) مبتدیوں کے لیے بہترین ہے — صرف پہلی دو رکعتوں میں پڑھی جاتی ہے۔';

  @override
  String get howToPrayItidalInstruction =>
      'رکوع سے اٹھتے ہوئے \'سمع اللہ لمن حمدہ\' کہیں، پھر سیدھے کھڑے ہو کر \'ربنا ولک الحمد\' کہیں۔';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'دوسری رکعت کے بعد بیٹھ کر تشہد پڑھیں، شہادت کے وقت سبابہ انگلی اٹھائیں۔ تین اور چار رکعت نمازوں میں اس کے بعد اٹھ کھڑے ہوں۔';

  @override
  String get howToPraySalawatInstruction =>
      'آخری تشہد کے فوراً بعد درود ابراہیمی پڑھیں، سلام سے پہلے، صرف آخری بیٹھک میں۔';

  @override
  String get howToPrayTasleemInstruction =>
      'دائیں طرف منہ کر کے \'السلام علیکم ورحمۃ اللہ\' کہیں، پھر بائیں طرف۔ آپ کی نماز مکمل ہو گئی۔';

  @override
  String get howToPrayOnceOpens => 'ایک بار — نماز شروع کرتی ہے';

  @override
  String get howToPrayFirstRakahOnly => 'صرف پہلی رکعت';

  @override
  String get howToPrayFirst2RakahsOnly => 'صرف پہلی دو رکعتیں';

  @override
  String get howToPrayEveryRakah => 'ہر رکعت میں';

  @override
  String get howToPrayAfter2ndRakah => 'دوسری رکعت کے بعد';

  @override
  String get howToPrayFinalSittingOnly => 'صرف آخری بیٹھک';

  @override
  String get howToPrayClosesThePrayer => 'نماز ختم کرتی ہے';

  @override
  String get howToPraySectionBefore => 'نماز سے پہلے';

  @override
  String get howToPraySectionRakah => 'رکعت';

  @override
  String get howToPraySectionMiddleSitting => 'درمیانی بیٹھک';

  @override
  String get howToPraySectionFinalSitting => 'آخری بیٹھک';

  @override
  String get howToPrayRakahLabel => 'رکعتیں';

  @override
  String get howToPrayCompleteButton => 'میں نے نماز مکمل کر لی';

  @override
  String get howToPrayMashaallah => 'ما شاء اللہ!';

  @override
  String get howToPrayAccepted => 'اللہ آپ کی نماز قبول فرمائے۔';

  @override
  String get fatihaIntroTitle => 'قرآن کی ماں';

  @override
  String get fatihaIntroBody =>
      'سورۃ الفاتحہ قرآن کریم کی عظیم ترین سورت ہے۔ یہ نماز کی ہر رکعت میں پڑھی جاتی ہے — روزانہ کم از کم 17 مرتبہ۔ یہ بندے اور اللہ کے درمیان ایک مکمل گفتگو ہے، اور ہر نماز کا دروازہ ہے۔';

  @override
  String get fatihaIntroIbnKathir =>
      'ابن کثیر لکھتے ہیں: \'الفاتحہ میں پورے قرآن کا جوہر موجود ہے — یہ دعا ہے، بندگی کا اقرار ہے، اور سیدھے راستے کی طرف ہدایت کی درخواست ہے۔\' — تفسیر ابن کثیر';

  @override
  String get shahadaScreenTitle => 'شہادت';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں، اور میں گواہی دیتا ہوں کہ محمد اللہ کے رسول ہیں';

  @override
  String get shahadaWordBreakdownTitle => 'لفظ بلفظ';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'کوئی نہیں';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'معبود / خدا';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'سوائے';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'اللہ (تنہا معبود)';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Muḥammadun';

  @override
  String get shahadaWord5Meaning => 'محمد';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Rasūlu';

  @override
  String get shahadaWord6Meaning => 'رسول / نبی';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'اللہ کے';

  @override
  String get shahadaMeaningTitle => 'معنی اور اہمیت';

  @override
  String get shahadaMeaningBody =>
      'شہادت ایمان کا وہ اعلان ہے جو اسلام کی بنیاد بناتا ہے۔ یہ پانچ ارکانِ اسلام میں سے پہلا رکن ہے۔ ان کلمات کو خلوص اور یقین کے ساتھ کہنے سے انسان اسلام میں داخل ہوتا ہے۔ ابن کثیر وضاحت کرتے ہیں کہ پہلا حصہ تمام جھوٹے معبودوں کی نفی کرتا ہے اور اللہ کی مطلق وحدانیت کا اثبات کرتا ہے۔';

  @override
  String get shahadaMomentTitle => 'شہادت کا لمحہ';

  @override
  String get shahadaMomentBody =>
      'جب کوئی شخص پہلی بار سچے دل کے یقین کے ساتھ شہادت پڑھتا ہے، تو کچھ گہرا واقع ہوتا ہے — وہ ایک نئی زندگی شروع کرتا ہے۔ نبیﷺ نے فرمایا: \'جس نے لا إله إلا الله کہا اور اس کے سوا جو بھی پوجا جاتا ہے اس سے انکار کیا، اس کا مال اور خون محفوظ ہو گیا۔\' (صحیح مسلم)۔ ماضی کے تمام گناہ معاف ہو جاتے ہیں۔ اسلام کے دامن میں خوش آمدید۔';

  @override
  String get shahadaPronunciationTitle => 'تلفظ کی رہنمائی';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'قدم بہ قدم رہنما';

  @override
  String get toolboxWuduSubtitle => 'نماز سے پہلے طہارت';

  @override
  String get toolboxGlossarySubtitle => '١١٤ اسلامی اصطلاحات کی وضاحت';

  @override
  String get shareSheetTitle => 'شیئر کریں';

  @override
  String get shareAnAyah => 'ایک آیت شیئر کریں';

  @override
  String get shareADua => 'ایک دعا شیئر کریں';

  @override
  String get shareANameOfAllah => 'اللہ کا ایک نام شیئر کریں';

  @override
  String get shareAHadith => 'ایک حدیث شیئر کریں';

  @override
  String get shareViaLabel => 'نور گارڈ کے ذریعے شیئر کیا گیا';

  @override
  String get shareCardAyahLabel => '✦ آج کی آیت';

  @override
  String get shareCardDuaLabel => '✦ دعا';

  @override
  String get shareCardNameLabel => '✦ اللہ کا نام';

  @override
  String get shareCardHadithLabel => '✦ حدیث';

  @override
  String get sharePickDuaTitle => 'شیئر کرنے کے لیے دعا چنیں';

  @override
  String get shareError => 'تصویر بنانے میں ناکامی';

  @override
  String get shareCardVerseLabel => '✦ قرآنی آیت';

  @override
  String get shareCardAsmaLabel => '✦ اسماء الحسنیٰ';

  @override
  String get shareAyahSubtitle => '٣٠ قرآنی آیات میں سے چنیں';

  @override
  String get shareDuaSubtitle => 'لائبریری سے چنیں';

  @override
  String get shareNameSubtitle => 'تمام ٩٩ اسمائے حسنیٰ میں سے چنیں';

  @override
  String get shareHadithSubtitle => '٢٠ مستند احادیث میں سے چنیں';

  @override
  String get shareThisDua => 'یہ دعا شیئر کریں';

  @override
  String get sharePickAyahTitle => 'شیئر کرنے کے لیے آیت چنیں';

  @override
  String get searchAyahs => 'آیات تلاش کریں…';

  @override
  String get noAyahsFoundShort => 'کوئی آیت نہیں ملی';

  @override
  String get shareThisAyah => 'یہ آیت شیئر کریں';

  @override
  String get sharePickNameTitle => 'شیئر کرنے کے لیے نام چنیں';

  @override
  String get shareThisName => 'یہ نام شیئر کریں';

  @override
  String get sharePickHadithTitle => 'شیئر کرنے کے لیے حدیث چنیں';

  @override
  String get searchHadiths => 'احادیث تلاش کریں…';

  @override
  String get noHadithsFound => 'کوئی حدیث نہیں ملی';

  @override
  String get shareThisHadith => 'یہ حدیث شیئر کریں';

  @override
  String get backToBasics => 'بنیادی باتوں کی طرف واپسی';

  @override
  String get backToBasicsSubtitle => 'اسلام کی بنیادی باتوں کی رہنمائی';

  @override
  String get fivePillarsOfIslam => 'اسلام کے پانچ ارکان';

  @override
  String get fivePillarsSubtitle => 'اسلامی ایمان کی بنیادیں';

  @override
  String get pillarLearnMore => 'مزید جانیں';

  @override
  String get pillarShowLess => 'کم دکھائیں';

  @override
  String get pillarsShowDetails => 'تفصیلات دکھائیں';

  @override
  String get pillarsHideDetails => 'تفصیلات چھپائیں';

  @override
  String get pillar1Name => 'شہادت';

  @override
  String get pillar1Desc => 'ایمان کا اقرار';

  @override
  String get pillar1Detail =>
      'ایمان کا اقرار اسلام کی بنیاد ہے۔ دل سے \'لا إله إلا الله ومحمد رسول الله\' کہنے سے انسان اسلام میں داخل ہوتا ہے۔';

  @override
  String get pillar2Name => 'نماز';

  @override
  String get pillar2Desc => 'پانچ وقت کی نماز';

  @override
  String get pillar2Detail =>
      'پانچ وقت کی نمازیں مسلمان اور اللہ کے درمیان براہ راست تعلق ہیں۔ فجر، ظہر، عصر، مغرب اور عشاء میں ادا کی جاتی ہیں اور پورا دن اللہ کی یاد میں گزارنے کا ذریعہ ہیں۔';

  @override
  String get pillar3Name => 'زکوٰۃ';

  @override
  String get pillar3Desc => 'واجب صدقہ';

  @override
  String get pillar3Detail =>
      'زکاۃ ایک سال کی بچت کا ڈھائی فیصد ضرورت مندوں کو دینے کی واجب عبادت ہے جو مال کو پاک کرتی اور امت کے رشتوں کو مضبوط بناتی ہے۔';

  @override
  String get pillar4Name => 'روزہ';

  @override
  String get pillar4Desc => 'رمضان میں روزہ';

  @override
  String get pillar4Detail =>
      'ماہ مبارک رمضان میں فجر سے غروب تک روزہ رکھا جاتا ہے۔ مسلمان کھانے، پینے اور گناہ سے پرہیز کرتے ہیں تاکہ تقوی اور شکر گزاری حاصل ہو۔';

  @override
  String get pillar5Name => 'حج';

  @override
  String get pillar5Desc => 'مکہ مکرمہ کا سفر';

  @override
  String get pillar5Detail =>
      'مکہ مکرمہ کا حج ہر اس مسلمان پر زندگی میں ایک بار فرض ہے جو جسمانی اور مالی طور پر قادر ہو اور یہ دنیا کا سب سے بڑا سالانہ انسانی اجتماع ہے۔';

  @override
  String get switchedToNewMuslimMode => 'نئے مسلم موڈ پر سوئچ کیا گیا';

  @override
  String get switchedToRegularMode => 'باقاعدہ موڈ پر سوئچ کیا گیا';

  @override
  String get liveNotifChannelName => 'نور گارڈ لائیو';

  @override
  String get liveNotifChannelDescription =>
      'لاک اسکرین پر نماز کا کاؤنٹ ڈاؤن اور روزانہ اسلامی مواد';

  @override
  String get liveNotifHeaderAyah => 'آج کی آیت';

  @override
  String get liveNotifHeaderDua => 'آج کی دعا';

  @override
  String get liveNotifHeaderWord => 'آج کا لفظ';

  @override
  String get liveNotifHeaderName => 'اللہ کا نام';

  @override
  String get liveNotifHeaderHadith => 'آج کی حدیث';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return '$hours گھنٹے $minutes منٹ میں';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return '$minutes منٹ میں';
  }

  @override
  String get liveNotifCountdownNow => 'نماز کا وقت ہو گیا';

  @override
  String get savedDuas => 'محفوظ دعائیں';

  @override
  String get savedVerses => 'محفوظ آیات';

  @override
  String get savedNames => 'محفوظ نام';

  @override
  String get noSavedDuas => 'ابھی کوئی محفوظ دعا نہیں';

  @override
  String get noSavedVerses => 'ابھی کوئی محفوظ آیت نہیں';

  @override
  String get noSavedNames => 'ابھی کوئی محفوظ نام نہیں';

  @override
  String get heroVerse16 =>
      'اے ہمارے رب! اگر ہم بھول جائیں یا خطا کریں تو ہماری گرفت نہ فرما۔';

  @override
  String get heroVerse17 => 'ہمیں اللہ کافی ہے اور وہ بہترین کارساز ہے۔';

  @override
  String get heroVerse18 => 'اے ایمان والو! اللہ اور اس کے رسول پر ایمان لاؤ۔';

  @override
  String get heroVerse19 =>
      'اے ایمان والو! اللہ سے ڈرو اور اس کا قرب تلاش کرو۔';

  @override
  String get heroVerse20 =>
      'بیشک میری نماز، میری قربانی، میرا جینا اور میرا مرنا سب اللہ رب العالمین کے لیے ہے۔';

  @override
  String get heroVerse21 =>
      'ہمارے لیے اس دنیا میں بھی بھلائی لکھ دے اور آخرت میں بھی، ہم تیری طرف رجوع کرتے ہیں۔';

  @override
  String get heroVerse22 => 'اللہ کو کثرت سے یاد کرو تاکہ تم کامیاب ہو جاؤ۔';

  @override
  String get heroVerse23 =>
      'ہمیں ہرگز کچھ نہیں پہنچے گا مگر وہی جو اللہ نے ہمارے لیے لکھ دیا ہے، وہی ہمارا مولیٰ ہے۔';

  @override
  String get heroVerse24 =>
      'سن لو! اللہ کے دوستوں کو نہ کوئی خوف ہوگا اور نہ وہ غمگین ہوں گے۔';

  @override
  String get heroVerse25 =>
      'میری توفیق صرف اللہ ہی سے ہے، اسی پر میں نے بھروسا کیا اور اسی کی طرف رجوع کرتا ہوں۔';

  @override
  String get heroVerse26 => 'اللہ کی رحمت سے مایوس نہ ہو۔';

  @override
  String get heroVerse27 =>
      'وہ لوگ جو ایمان لائے اور ان کے دل اللہ کے ذکر سے مطمئن ہوتے ہیں۔';

  @override
  String get heroVerse28 =>
      'اور جب تمہارے رب نے اعلان فرمایا: اگر تم شکر کرو گے تو میں تمہیں اور زیادہ دوں گا۔';

  @override
  String get heroVerse29 =>
      'اور اپنے رب کی عبادت کرتے رہو یہاں تک کہ تمہیں یقین آ جائے۔';

  @override
  String get heroVerse30 =>
      'بیشک اللہ ان کے ساتھ ہے جو تقویٰ اختیار کرتے ہیں اور جو نیکی کرتے ہیں۔';

  @override
  String get focusButtonSubtitle => 'اپنا وقت اہم چیزوں کے لیے محفوظ رکھیں';
}
