// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'نور غارد';

  @override
  String get assalamualaikum => 'السلام عليكم';

  @override
  String get mayAllahBlessYourDay => 'بارك الله في يومك';

  @override
  String get nextPrayer => 'الصلاة القادمة';

  @override
  String get iPrayedButton => 'صلّيت';

  @override
  String get todaysPrayers => 'صلوات اليوم';

  @override
  String get qibla => 'القبلة';

  @override
  String get focusMode => 'وضع التركيز';

  @override
  String get appBlocking => 'حجب التطبيقات';

  @override
  String get islamicCalendar => 'التقويم الإسلامي';

  @override
  String get islamicCalendarSubtitle => 'التواريخ الهجرية والأحداث';

  @override
  String get duas => 'الأدعية';

  @override
  String get quran => 'القرآن الكريم';

  @override
  String get settings => 'الإعدادات';

  @override
  String get complete => 'مكتمل';

  @override
  String get streak => 'تواصل';

  @override
  String get dayStreak => 'أيام متواصلة';

  @override
  String get compassRequiresDevice => 'البوصلة تتطلب جهازاً حقيقياً';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'تمت جميع الصلوات! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 صلوات مكتملة';
  }

  @override
  String get fajr => 'الفجر';

  @override
  String get dhuhr => 'الظهر';

  @override
  String get asr => 'العصر';

  @override
  String get maghrib => 'المغرب';

  @override
  String get isha => 'العشاء';

  @override
  String fardRakats(int count) {
    return '$count ركعات فرض';
  }

  @override
  String sunnahBefore(int count) {
    return '$count سنة قبلية';
  }

  @override
  String sunnahAfter(int count) {
    return '$count سنة بعدية';
  }

  @override
  String prayedAt(String time) {
    return 'تُصلى في $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'الفجر قبل الشروق';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'بعد زوال الشمس عن وسط السماء';

  @override
  String get timePeriodLateAfternoon => 'في أواخر العصر';

  @override
  String get timePeriodJustAfterSunset => 'بعد غروب الشمس مباشرة';

  @override
  String get timePeriodNightBeforeMidnight => 'في الليل قبل منتصفه';

  @override
  String get fajrHadith => 'ركعتا الفجر خير من الدنيا وما فيها. — النبي محمد ﷺ';

  @override
  String get fajrTip =>
      'الفجر هي أول صلاة في اليوم. تذكرنا ببدء يومنا بذكر الله.';

  @override
  String get dhuhrHadith =>
      'من صلى ثنتي عشرة ركعة من السنن، بنى الله له بيتًا في الجنة.';

  @override
  String get dhuhrTip =>
      'الظهر هي صلاة منتصف النهار. لحظة مثالية لتتوقف وتعيد التواصل مع يومك.';

  @override
  String get asrHadith =>
      'من فاتته صلاة العصر فكأنما وُتر أهله وماله. — النبي محمد ﷺ';

  @override
  String get asrTip =>
      'كثيرًا ما تُسمى العصر بالصلاة الوسطى. ذكرها الله خصيصًا في القرآن (2:238).';

  @override
  String get maghribHadith => 'صلاة المغرب وتر النهار.';

  @override
  String get maghribTip =>
      'المغرب تمثل نهاية يوم الصيام في رمضان، وتُصلى فور غروب الشمس.';

  @override
  String get ishaHadith => 'من صلى العشاء في جماعة فكأنما قام نصف الليل.';

  @override
  String get ishaTip =>
      'العشاء هي آخر صلاة في اليوم. إنهاء يومك بالصلاة يجلب السكينة والطمأنينة.';

  @override
  String get newMuslimTip => 'نصيحة للمسلم الجديد';

  @override
  String get notificationsOn => 'الإشعارات مفعلة';

  @override
  String get notificationsOff => 'الإشعارات متوقفة';

  @override
  String get preview => 'معاينة';

  @override
  String get lockPreviewCountdown => 'خلال ساعة و23 دقيقة  ·  4:47 م';

  @override
  String get swipeUpToUnlock => 'اسحب لأعلى لإلغاء القفل';

  @override
  String get searchSurahs => 'ابحث عن سور…';

  @override
  String get noSurahsFound => 'لم يتم العثور على سور';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String ayahs(int count) {
    return '$count آيات';
  }

  @override
  String get searchDuas => 'ابحث عن أدعية…';

  @override
  String supplications(int count) {
    return '$count أدعية';
  }

  @override
  String get prayerSettings => 'إعدادات الصلاة';

  @override
  String get calculationMethod => 'طريقة الحساب';

  @override
  String get adhanSound => 'صوت الأذان';

  @override
  String get prayerNotifications => 'إشعارات الصلاة';

  @override
  String get statusOn => 'تشغيل';

  @override
  String get statusOff => 'إيقاف';

  @override
  String get enableAllNotifications => 'تفعيل جميع الإشعارات';

  @override
  String get individualPrayers => 'الصلوات الفردية';

  @override
  String get appearance => 'المظهر';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get aboutNoorGuard => 'حول';

  @override
  String get version => 'إصدار التطبيق';

  @override
  String get rateApp => 'قيّم نور غارد';

  @override
  String get shareApp => 'شارك نور غارد';

  @override
  String get contactSupport => 'تواصل مع الدعم';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get helpUsImprove => 'ساعدنا على التحسين';

  @override
  String get translationDisclaimer =>
      'ترجماتنا بمساعدة الذكاء الاصطناعي. إذا لاحظت أي أخطاء في لغتك، يسعدنا أن نسمع ملاحظاتك!';

  @override
  String get privacyPromiseTitle => 'وعد نور غارد بالخصوصية';

  @override
  String get privacyPromiseBody =>
      'إيمانك أمر شخصي. وبياناتك تبقى كذلك. نحن لا نبيع أو نشارك أو نستثمر بياناتك أبدًا. لا موقعك. ولا عادات صلاتك. ولا اسمك.';

  @override
  String get directionToSacredHouse => 'الاتجاه إلى البيت الحرام';

  @override
  String towardMecca(String degrees) {
    return '$degrees° نحو مكة';
  }

  @override
  String get defaultLocation => 'ساكرامنتو، كاليفورنيا (افتراضي)';

  @override
  String get prayerHistory => 'سجل الصلوات';

  @override
  String get currentStreak => 'التتابع الحالي';

  @override
  String get longestStreak => 'أطول تتابع';

  @override
  String get legend => 'المفتاح';

  @override
  String get allFivePrayers => 'جميع الصلوات الخمس';

  @override
  String get partialPrayers => 'جزئي (1–4)';

  @override
  String get none => 'لا شيء';

  @override
  String get sun => 'أحد';

  @override
  String get mon => 'إثن';

  @override
  String get tue => 'ثلا';

  @override
  String get wed => 'أرب';

  @override
  String get thu => 'خمي';

  @override
  String get fri => 'جمعة';

  @override
  String get sat => 'سبت';

  @override
  String headingDegrees(String degrees) {
    return 'الاتجاه $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'تعذر تحميل السور';

  @override
  String get connectionError =>
      'يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى';

  @override
  String get alQuran => 'القرآن الكريم';

  @override
  String get dailySupplications => 'الأدعية اليومية';

  @override
  String get all => 'الكل';

  @override
  String get noDuasFound => 'لم يتم العثور على أدعية';

  @override
  String get january => 'يناير';

  @override
  String get february => 'فبراير';

  @override
  String get march => 'مارس';

  @override
  String get april => 'أبريل';

  @override
  String get may => 'مايو';

  @override
  String get june => 'يونيو';

  @override
  String get july => 'يوليو';

  @override
  String get august => 'أغسطس';

  @override
  String get september => 'سبتمبر';

  @override
  String get october => 'أكتوبر';

  @override
  String get november => 'نوفمبر';

  @override
  String get december => 'ديسمبر';

  @override
  String get home => 'الرئيسية';

  @override
  String get prayers => 'الصلوات';

  @override
  String get more => 'المزيد';

  @override
  String get tafsir => 'التفسير';

  @override
  String get lockScreen => 'شاشة القفل';

  @override
  String get readAndListen => 'اقرأ واستمع';

  @override
  String get commentary => 'الشرح والتفسير';

  @override
  String get findDirection => 'تحديد الاتجاه';

  @override
  String get reminders => 'التذكيرات';

  @override
  String get blockDistractions => 'حظر المشتتات';

  @override
  String get prayerGuard => 'حارس الصلاة';

  @override
  String get importantDates => 'تواريخ مهمة';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get morningAndEvening => 'الصباح والمساء';

  @override
  String get prayer => 'الصلاة';

  @override
  String get foodAndDrink => 'الطعام والشراب';

  @override
  String get verityWithHardship => 'إن مع العسر يسرا';

  @override
  String get ashSharh946 => 'الشرح ٩٤:٦';

  @override
  String get guardStrictlyYourPrayers =>
      'حَافِظُوا عَلَى الصَّلَوَاتِ وَالصَّلَاةِ الْوُسْطَىٰ';

  @override
  String get alBaqarah2238 => 'البقرة ٢:٢٣٨';

  @override
  String get pastEvents => 'أحداث سابقة';

  @override
  String get upcomingEvents => 'أحداث قادمة';

  @override
  String get today => 'اليوم';

  @override
  String get next => 'القادم';

  @override
  String hijriYearLabel(int year) {
    return '$year هـ';
  }

  @override
  String get islamicMonthMuharram => 'محرم';

  @override
  String get islamicMonthSafar => 'صفر';

  @override
  String get islamicMonthRabiAlAwwal => 'ربيع الأول';

  @override
  String get islamicMonthRabiAlThani => 'ربيع الآخر';

  @override
  String get islamicMonthJumadaAlAwwal => 'جمادى الأولى';

  @override
  String get islamicMonthJumadaAlThani => 'جمادى الآخرة';

  @override
  String get islamicMonthRajab => 'رجب';

  @override
  String get islamicMonthShaban => 'شعبان';

  @override
  String get islamicMonthRamadan => 'رمضان';

  @override
  String get islamicMonthShawwal => 'شوال';

  @override
  String get islamicMonthDhulQadah => 'ذو القعدة';

  @override
  String get islamicMonthDhulHijjah => 'ذو الحجة';

  @override
  String get islamicNewYear => 'رأس السنة الهجرية';

  @override
  String get ashura => 'عاشوراء';

  @override
  String get mawlidAlNabi => 'المولد النبوي';

  @override
  String get ramadanBegins => 'بداية رمضان';

  @override
  String get laylatAlQadr => 'ليلة القدر';

  @override
  String get eidAlFitr => 'عيد الفطر';

  @override
  String get dayOfArafah => 'يوم عرفة';

  @override
  String get eidAlAdha => 'عيد الأضحى';

  @override
  String get active => 'نشط';

  @override
  String get focusModeSubtitle => 'احمِ تركيزك. تطبيقاتك محظورة حتى تتوقف.';

  @override
  String get remaining => 'متبقٍ';

  @override
  String get ready => 'جاهز';

  @override
  String get duration => 'المدة';

  @override
  String get minutesAbbreviation => 'د';

  @override
  String get blockedDuringFocus => 'محظور أثناء التركيز';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تطبيقات',
      one: '$count تطبيق',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'ابدأ التركيز';

  @override
  String get stopFocus => 'أوقف التركيز';

  @override
  String get alhamdulillah => 'الحمد لله!';

  @override
  String get sessionComplete => 'اكتملت الجلسة';

  @override
  String stayedFocusedFor(String duration) {
    return 'حافظت على تركيزك لمدة $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقيقة',
      one: '$count دقيقة',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '«وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ»\n— البقرة ٢:٤٥';

  @override
  String get done => 'تم';

  @override
  String get socialMedia => 'وسائل التواصل الاجتماعي';

  @override
  String get entertainment => 'الترفيه';

  @override
  String get games => 'الألعاب';

  @override
  String get messaging => 'المراسلة';

  @override
  String get blockDuringPrayerTimes => 'الحظر أثناء أوقات الصلاة';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'سيتم حظر التطبيقات المحددة تلقائيًا\nخلال جميع الصلوات الخمس اليومية.';

  @override
  String get blockedLabel => 'محظور';

  @override
  String get blockAllApps => 'حظر جميع التطبيقات';

  @override
  String get blockingTimingInfo =>
      'يبدأ الحظر قبل كل صلاة بـ 5 دقائق ويُرفع بعدها بـ 15 دقيقة.';

  @override
  String get blockedDuringPrayers => 'محظور أثناء الصلوات';

  @override
  String get notBlocked => 'غير محظور';

  @override
  String get wuduStep1 => 'النِّيَّة';

  @override
  String get wuduStep2 => 'بِسْمِ اللَّه';

  @override
  String get wuduStep3 => 'غَسْلُ الْيَدَيْن';

  @override
  String get wuduStep4 => 'الْمَضْمَضَة';

  @override
  String get wuduStep5 => 'الاِسْتِنْشَاق';

  @override
  String get wuduStep6 => 'غَسْلُ الْوَجْه';

  @override
  String get wuduStep7 => 'غَسْلُ الْيَدَيْن إِلَى الْمِرْفَقَيْن';

  @override
  String get wuduStep8 => 'مَسْحُ الرَّأْس';

  @override
  String get wuduStep9 => 'غَسْلُ الْقَدَمَيْن';

  @override
  String get revertCorner => 'ركن المسلم الجديد';

  @override
  String get revertCornerSubtitle => 'أدلة ودعم للمسلمين الجدد';

  @override
  String get wuduGuide => 'دليل الوضوء';

  @override
  String get howToPray => 'كيفية الصلاة';

  @override
  String get newMuslimChecklist => 'قائمة المسلم الجديد';

  @override
  String get islamicGlossary => 'المصطلحات الإسلامية';

  @override
  String get whyDoWe => 'لماذا نفعل...';

  @override
  String get communityStories => 'قصص المجتمع';

  @override
  String get wuduGuideSubtitle => 'الطهارة قبل الصلاة';

  @override
  String get howToPraySubtitle => 'دليل الصلاة خطوة بخطوة';

  @override
  String get newMuslimChecklistSubtitle => 'رحلتك لمدة 30 يوماً';

  @override
  String get howToPrayStep1Name => 'الوضوء أولاً';

  @override
  String get howToPrayStep1Instruction =>
      'أدِّ الوضوء لتكون في حالة طهارة قبل البدء في الصلاة.';

  @override
  String get howToPrayStep1Tip =>
      'إذا لم تكن متأكداً، افتح دليل الوضوء من مركز المسلم الجديد أولاً.';

  @override
  String get howToPrayStep2Name => 'الوقوف باتجاه القبلة';

  @override
  String get howToPrayStep2Instruction =>
      'قف على سجادة الصلاة مواجهاً القبلة — اتجاه الكعبة في مكة. استخدم بوصلة القبلة في التطبيق للعثور على الاتجاه الدقيق.';

  @override
  String get howToPrayStep2Tip =>
      'لا بأس إذا كنت منحرفاً قليلاً — الله يعلم نيتك. افعل ما بوسعك.';

  @override
  String get howToPrayStep3Name => 'النية';

  @override
  String get howToPrayStep3Instruction =>
      'انوِ في قلبك الصلاة التي أنت على وشك أدائها. لست بحاجة إلى النطق بها.';

  @override
  String get howToPrayStep3Tip =>
      'نيتك بينك وبين الله. فكرة بسيطة مثل \'أصلي الفجر لله\' كافية.';

  @override
  String get howToPrayStep4Name => 'تكبيرة الإحرام';

  @override
  String get howToPrayStep4Instruction =>
      'ارفع كلتا يديك إلى شحمتي أذنيك وقل \'الله أكبر\'. هذا يبدأ صلاتك رسمياً.';

  @override
  String get howToPrayStep4Tip =>
      'أبقِ عينيك متجهتين للأسفل نحو موضع سجودك طوال الصلاة.';

  @override
  String get howToPrayStep5Name => 'القيام';

  @override
  String get howToPrayStep5Instruction =>
      'ضع يدك اليمنى فوق يدك اليسرى على صدرك. اتلُ سورة الفاتحة ثم أي سورة قصيرة أخرى تعرفها.';

  @override
  String get howToPrayStep5Tip =>
      'إذا لم تكن تعرف أي سورة أخرى بعد، فإن تلاوة الفاتحة وحدها مقبولة بينما تتعلم.';

  @override
  String get howToPrayStep6Name => 'الركوع';

  @override
  String get howToPrayStep6Instruction =>
      'اركع بالانحناء من الخصر مع موازاة ظهرك للأرض. ضع يديك على ركبتيك وقل \'سبحان ربي العظيم\' ثلاث مرات.';

  @override
  String get howToPrayStep6Tip =>
      'أبقِ ظهرك مستقيماً وأفقياً — لا منحنياً أو مقوساً.';

  @override
  String get howToPrayStep7Name => 'الاعتدال (الرفع من الركوع)';

  @override
  String get howToPrayStep7Instruction =>
      'ارتفع من الركوع وقف منتصباً. قل \'سمع الله لمن حمده\' وأنت ترتفع، ثم قل \'ربنا لك الحمد\'.';

  @override
  String get howToPrayStep7Tip =>
      'قف منتصباً تماماً واستقر لحظة قبل الانتقال إلى الوضع التالي.';

  @override
  String get howToPrayStep8Name => 'السجود';

  @override
  String get howToPrayStep8Instruction =>
      'اهبط إلى الأرض، ضع جبهتك وأنفك وكفيك وركبتيك وأصابع قدميك على الأرض. قل \'سبحان ربي الأعلى\' ثلاث مرات.';

  @override
  String get howToPrayStep8Tip =>
      'سبعة أعضاء يجب أن تلمس الأرض: الجبهة (مع الأنف)، اليدان، الركبتان، والقدمان.';

  @override
  String get howToPrayStep9Name => 'الجلسة بين السجدتين';

  @override
  String get howToPrayStep9Instruction =>
      'اجلس من السجود مع إبقاء قدمك اليسرى مسطحة وقدمك اليمنى منتصبة. قل \'الله أكبر\' وأنت تجلس. توقف لحظة ثم عد للسجود الثاني.';

  @override
  String get howToPrayStep9Tip =>
      'هذا الجلوس القصير بين السجدتين يسمى الجلسة. وهو جزء واجب من الصلاة.';

  @override
  String get howToPrayStep10Name => 'إكمال الركعات';

  @override
  String get howToPrayStep10Instruction =>
      'بعد إتمام الركعة الأولى، قم وكرر نفس الخطوات للركعة الثانية. عدد الركعات يعتمد على الصلاة التي تؤديها.';

  @override
  String get howToPrayStep10Tip =>
      'الفجر ركعتان، الظهر أربع، العصر أربع، المغرب ثلاث، والعشاء أربع. خذها ركعة ركعة.';

  @override
  String get howToPrayStep11Name => 'التشهد (الجلوس الأخير)';

  @override
  String get howToPrayStep11Instruction =>
      'في وضع الجلوس الأخير، اتلُ التشهد. هذا إقرار بالإيمان تتلوه وأنت جالس بعد آخر ركعة.';

  @override
  String get howToPrayStep11Tip =>
      'أثناء التشهد، ارفع سبابة يدك اليمنى عند قول \'أشهد أن لا إله إلا الله\' دلالةً على وحدانية الله.';

  @override
  String get howToPrayStep12Name => 'التسليم';

  @override
  String get howToPrayStep12Instruction =>
      'أدِر رأسك إلى اليمين وقل \'السلام عليكم ورحمة الله\'، ثم أدِره إلى اليسار وكرر. هذا ينهي صلاتك.';

  @override
  String get howToPrayStep12Tip =>
      'بعد الصلاة، خصص لحظة للدعاء واسأل الله ما تحتاج. هذا وقت جميل للتواصل مع الله.';

  @override
  String get checklistWeek1Title => 'الأسبوع 1';

  @override
  String get checklistWeek2Title => 'الأسبوع 2';

  @override
  String get checklistWeek3Title => 'الأسبوع 3';

  @override
  String get checklistWeek4Title => 'الأسبوع 4';

  @override
  String get checklistWeek1Item1 => 'أداء الشهادة';

  @override
  String get checklistWeek1Item2 => 'تعلم الوضوء';

  @override
  String get checklistWeek1Item3 => 'تعلم سورة الفاتحة';

  @override
  String get checklistWeek1Item4 => 'صلِّ أول صلاة فجر';

  @override
  String get checklistWeek1Item5 => 'احصل على سجادة صلاة';

  @override
  String get checklistWeek1Item6 => 'ابحث عن مسجد قريب';

  @override
  String get checklistWeek2Item1 => 'تعلم أوقات الصلوات الخمس';

  @override
  String get checklistWeek2Item2 => 'تعلم الأدعية الأساسية';

  @override
  String get checklistWeek2Item3 => 'اقرأ عن النبي محمد ﷺ';

  @override
  String get checklistWeek2Item4 => 'تواصل مع المجتمع المسلم';

  @override
  String get checklistWeek3Item1 => 'تعرف على الطعام الحلال';

  @override
  String get checklistWeek3Item2 => 'اقرأ سورة الإخلاص';

  @override
  String get checklistWeek3Item3 => 'تعرف على رمضان';

  @override
  String get checklistWeek3Item4 => 'ابدأ الذكر اليومي';

  @override
  String get checklistWeek4Item1 => 'تعرف على الزكاة';

  @override
  String get checklistWeek4Item2 => 'اقرأ عن أركان الإسلام الخمسة';

  @override
  String get checklistWeek4Item3 => 'فعّل إشعارات الصلاة';

  @override
  String get checklistWeek4Item4 => 'تأمل في رحلتك';

  @override
  String get wuduStep1Instruction => 'انوِ بقلبك أداء الوضوء لله تعالى.';

  @override
  String get wuduStep1Tip =>
      'لا تحتاج إلى النطق بها — النية الصادقة في القلب كافية.';

  @override
  String get wuduStep2Instruction => 'قل بسم الله قبل أن تبدأ.';

  @override
  String get wuduStep2Tip => 'قول بسم الله سنة وتبدأ وضوءك بذكر الله.';

  @override
  String get wuduStep3Instruction =>
      'اغسل كلتا يديك حتى الرسغين ثلاث مرات، مع التأكد من وصول الماء بين الأصابع.';

  @override
  String get wuduStep3Tip =>
      'ابدأ باليد اليمنى ثم اليسرى. هذا الترتيب مستحب في الإسلام.';

  @override
  String get wuduStep4Instruction =>
      'خذ ماءً في فمك وحرّكه ثم ابصقه. افعل ذلك ثلاث مرات.';

  @override
  String get wuduStep4Tip => 'هذا يطهر الفم وهو جزء من عملية التطهير.';

  @override
  String get wuduStep5Instruction =>
      'استنشق الماء في منخريك وانثره برفق. افعل ذلك ثلاث مرات.';

  @override
  String get wuduStep5Tip =>
      'استخدم يدك اليمنى للاستنشاق ويدك اليسرى للاستنثار.';

  @override
  String get wuduStep6Instruction =>
      'اغسل وجهك كاملاً ثلاث مرات، من خط الشعر إلى الذقن ومن أذن إلى أذن.';

  @override
  String get wuduStep6Tip => 'تأكد من عدم ترك أي جزء من وجهك جافاً.';

  @override
  String get wuduStep7Instruction =>
      'اغسل ذراعك الأيمن من أطراف الأصابع إلى المرفق ثلاث مرات، ثم افعل الشيء نفسه مع الذراع الأيسر.';

  @override
  String get wuduStep7Tip => 'ابدأ دائماً بالجانب الأيمن قبل الأيسر في الوضوء.';

  @override
  String get wuduStep8Instruction =>
      'بلّل يديك وامسح على رأسك كله مرة واحدة، من الأمام إلى الخلف ومن الخلف إلى الأمام.';

  @override
  String get wuduStep8Tip => 'خلافاً للغسل، مسح الرأس يُفعل مرة واحدة فقط.';

  @override
  String get wuduStep9Instruction =>
      'اغسل قدمك اليمنى حتى الكعب ثلاث مرات، ثم افعل الشيء نفسه مع القدم اليسرى.';

  @override
  String get wuduStep9Tip =>
      'تأكد من وصول الماء بين أصابع القدم. استخدم إصبعك لتنظيف ما بينها.';

  @override
  String get islamicGlossaryTitle => 'المصطلحات الإسلامية';

  @override
  String get islamicGlossarySubtitle =>
      '٥١ مصطلحاً من القرآن والسنة والفقه الكلاسيكي';

  @override
  String get searchTermsHint => 'ابحث عن المصطلحات أو التعريفات...';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categoryPillar => 'الأركان';

  @override
  String get categoryAqeedah => 'العقيدة';

  @override
  String get categoryPractice => 'العبادة';

  @override
  String get categoryDhikr => 'الذكر';

  @override
  String get categoryQuran => 'القرآن';

  @override
  String get categoryHadith => 'الحديث';

  @override
  String get categoryFiqh => 'الفقه';

  @override
  String get categoryHistory => 'التاريخ';

  @override
  String get noTermsFound => 'لا توجد مصطلحات';

  @override
  String get sourceLabel => 'المصدر';

  @override
  String get revertCornerHubSubtitle =>
      'مركز لطيف يرشدك في خطواتك الأولى كمسلم جديد';

  @override
  String get islamicGlossaryHubSubtitle => 'مصطلحات شائعة بشرح مبسط';

  @override
  String get whyDoWeHubSubtitle => 'الحكمة وراء الممارسات اليومية';

  @override
  String get communityStoriesHubSubtitle =>
      'مسلمون جدد يشاركون رحلاتهم إلى الإسلام';

  @override
  String get whyDoWeScreenSubtitle => 'الحكمة وراء 12 ممارسة إسلامية يومية';

  @override
  String get whyDoWeSourceBadge => 'مصدر سني';

  @override
  String get whyDoWeQ1 => 'لماذا نصلي خمس مرات في اليوم؟';

  @override
  String get whyDoWeA1 =>
      'أوجب الله الصلوات الخمس في القرآن الكريم (2:238)، وفُرضت في ليلة الإسراء والمعراج. قال النبي ﷺ: «أوّل ما يُحاسَب به العبد يوم القيامة الصلاة.» (ابن ماجه). الصلاة تبقينا متصلين بالله طوال اليوم.';

  @override
  String get whyDoWeQ2 => 'لماذا نستقبل مكة في الصلاة؟';

  @override
  String get whyDoWeA2 =>
      'أمر الله في القرآن (2:144): «فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ.» الكعبة في مكة هي أول بيت بُني لعبادة الله (3:96). التوجه نحو اتجاه واحد يوحّد المسلمين في صلاتهم في كل أنحاء العالم.';

  @override
  String get whyDoWeQ3 => 'لماذا نصوم في رمضان؟';

  @override
  String get whyDoWeA3 =>
      'أوجب الله الصيام في القرآن (2:183): «يَا أَيُّهَا الَّذِينَ آمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ كَمَا كُتِبَ عَلَى الَّذِينَ مِنْ قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ.» ورمضان هو شهر نزول القرآن الكريم (2:185).';

  @override
  String get whyDoWeQ4 => 'لماذا نقول بسم الله قبل الأكل؟';

  @override
  String get whyDoWeA4 =>
      'قال النبي ﷺ: «إذا أكل أحدكم طعاماً فليذكر اسم الله، فإن نسي في أوله فليقل: بسم الله أوله وآخره.» (أبو داود). يُذكّرنا ذلك بأن كل النعم من الله.';

  @override
  String get whyDoWeQ5 => 'لماذا نخلع الحذاء قبل دخول المسجد؟';

  @override
  String get whyDoWeA5 =>
      'حين أمر الله موسى عليه السلام: «فَاخْلَعْ نَعْلَيْكَ إِنَّكَ بِالْوَادِ الْمُقَدَّسِ طُوىً.» (القرآن 20:12). خلع النعلين تعبير عن الاحترام لبيت الله والحفاظ على نظافة مكان الصلاة.';

  @override
  String get whyDoWeQ6 => 'لماذا نقول السلام عليكم تحية؟';

  @override
  String get whyDoWeA6 =>
      'قال النبي ﷺ: «لا تدخلون الجنة حتى تؤمنوا، ولا تؤمنوا حتى تحابوا، أفلا أدلكم على شيء إذا فعلتموه تحاببتم؟ أفشوا السلام بينكم.» (مسلم). وهي أيضاً دعاء — أنت تدعو لذلك الشخص بالسلام.';

  @override
  String get whyDoWeQ7 => 'لماذا نؤدي الحج؟';

  @override
  String get whyDoWeA7 =>
      'فرض الله الحج (3:97): «وَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ اسْتَطَاعَ إِلَيْهِ سَبِيلاً.» يُحيي الحج ذكرى ابتلاءات النبي إبراهيم وأسرته، ويجمع المسلمين من كل أمة في عبادة واحدة.';

  @override
  String get whyDoWeQ8 => 'لماذا ندفع الزكاة؟';

  @override
  String get whyDoWeA8 =>
      'الزكاة الركن الثالث من أركان الإسلام، أُمر بها في القرآن أكثر من ثلاثين مرة إلى جانب الصلاة. قال النبي ﷺ إنها تُطهّر المال. وهي تُقلّل التفاوت وتُذكّر المؤمنين بأن الثروة ملك لله.';

  @override
  String get whyDoWeQ9 => 'لماذا نقول الحمد لله عند العطاس؟';

  @override
  String get whyDoWeA9 =>
      'قال النبي ﷺ: «إذا عطس أحدكم فليقل الحمد لله، وليقل له أخوه أو صاحبه: يرحمك الله.» (البخاري). إنها لحظة شكر لله على نعمة الصحة.';

  @override
  String get whyDoWeQ10 => 'لماذا ترتدي المرأة المسلمة الحجاب؟';

  @override
  String get whyDoWeA10 =>
      'أمر الله في القرآن (24:31) المؤمنات بصون حيائهن. الحجاب عبادة وطاعة لله. كثير من المسلمات يرتدينه مصدراً للهوية والكرامة والارتباط الروحي.';

  @override
  String get whyDoWeQ11 => 'لماذا نتجنب لحم الخنزير والكحول؟';

  @override
  String get whyDoWeA11 =>
      'حرّم الله لحم الخنزير في القرآن (2:173) والكحول في (5:90) واصفاً إياه بأنه «رجس من عمل الشيطان.» هذه المحظورات تحمي الصحة والعقل والأسرة. توجيهات الحلال تساعد المؤمنين على الحفاظ على الطهارة الجسدية والروحية.';

  @override
  String get whyDoWeQ12 => 'لماذا نقول إن شاء الله؟';

  @override
  String get whyDoWeA12 =>
      'يأمر الله في القرآن (18:23-24): «وَلا تَقُولَنَّ لِشَيْءٍ إِنِّي فَاعِلٌ ذَلِكَ غَدًا إِلَّا أَنْ يَشَاءَ اللَّهُ.» قول «إن شاء الله» إقرار بأن الله وحده يملك المستقبل ويبقينا متواضعين.';

  @override
  String get communityStoriesScreenSubtitle =>
      'رحلات حقيقية إلى الإسلام من حول العالم';

  @override
  String get communityStoriesTimeLabel => 'مسلم منذ';

  @override
  String get communityStoriesShareBtn => 'شارك قصتك';

  @override
  String get communityStoriesShareSoon => 'قريباً — هذه الميزة في الطريق!';

  @override
  String get communityStory1Name => 'عائشة (سارة سابقاً)';

  @override
  String get communityStory1Location => 'تكساس، الولايات المتحدة';

  @override
  String get communityStory1Time => 'سنتان';

  @override
  String get communityStory1Text =>
      'اكتشفت الإسلام أثناء البحث لورقة جامعية. كنت أتوقع أن أجد ما تقوله وسائل الإعلام. لكنني وجدت سلاماً ومنطقاً وإلهاً مفهوماً. نطقت بالشهادة بعد ستة أشهر. كان أصعب شيء ليس تعلم الصلاة، بل إخبار أسرتي. لكن الحمد لله، بعد سنتين، أمي تسألني عن الإسلام بنفسها.';

  @override
  String get communityStory2Name => 'يوسف (جيمس سابقاً)';

  @override
  String get communityStory2Location => 'لندن، المملكة المتحدة';

  @override
  String get communityStory2Time => '4 سنوات';

  @override
  String get communityStory2Text =>
      'اعتنقت الإسلام بعد سنوات من البحث. المسيحية، البوذية، الإلحاد — لم يملأ أيٌّ منها الفراغ. دعاني زميل مسلم لصلاة الجمعة. جلست في الخلف وبكيت طوال الوقت دون أن أعرف لماذا. نطقت بالشهادة في الأسبوع التالي. احتضنني المجتمع كعائلة لم أكن أعلم أنني أحتاجها.';

  @override
  String get communityStory3Name => 'مريم (ماريا سابقاً)';

  @override
  String get communityStory3Location => 'مكسيكو سيتي، المكسيك';

  @override
  String get communityStory3Time => 'سنة واحدة';

  @override
  String get communityStory3Text =>
      'أشعر أنني لاتينية ومسلمة كأن لديّ قوة خارقة. اكتشفت الإسلام عبر فيديو على يوتيوب في الساعة الثانية صباحاً. مفهوم التوحيد ـ أن الله واحد لا شريك له ـ أثّر فيّ بعمق. أخواتي في المسجد جعلنني أشعر بأنني في بيتي فوراً.';

  @override
  String get communityStory4Name => 'إبراهيم (ديفيد سابقاً)';

  @override
  String get communityStory4Location => 'تورونتو، كندا';

  @override
  String get communityStory4Time => '6 سنوات';

  @override
  String get communityStory4Text =>
      'كنت ابن قسيس. كانت لديّ أسئلة عن التثليث لم يستطع أحد الإجابة عنها. حين قرأت القرآن لأول مرة، شعرت كأنني أقرأ ما كنت أؤمن به في الحقيقة. قلت شهادتي في هدوء وحدي، ثم أعدتها في المسجد. أفضل قرار اتخذته في حياتي.';

  @override
  String get communityStory5Name => 'فاطمة (جينيفر سابقاً)';

  @override
  String get communityStory5Location => 'سيدني، أستراليا';

  @override
  String get communityStory5Time => '3 سنوات';

  @override
  String get communityStory5Text =>
      'بدأت رحلتي مع الحجاب. ارتديته على سبيل التحدي فشعرت... بالحماية. بدأت أقرأ عن الإسلام ولم أستطع التوقف. في غضون ثلاثة أشهر نطقت بالشهادة. يسألني الناس عما تخليت عنه. أقول لهم: تخليت عن الفراغ.';

  @override
  String get communityStory6Name => 'عمر (كيفين سابقاً)';

  @override
  String get communityStory6Location => 'جوهانسبرغ، جنوب أفريقيا';

  @override
  String get communityStory6Time => '5 سنوات';

  @override
  String get communityStory6Text =>
      'كبرت في حي صعب. أعطاني الإسلام الانضباط والهدف والأخوة. أول مرة سجدت، انفتح شيء بداخلي ـ بأجمل طريقة. بكيت ولم أستطع التفسير. الآن أرشد شباباً آخرين يجدون طريقهم إلى الدين.';

  @override
  String get inspiredByRealStories =>
      'مستوحاة من رحلات المسلمين الجدد الحقيقية';

  @override
  String get storyFormTitle => 'شارك قصتك';

  @override
  String get storyFormNameLabel => 'اسمك';

  @override
  String get storyFormNameHint => 'الاسم، أو اكتب \'مجهول\'';

  @override
  String get storyFormCountryLabel => 'البلد';

  @override
  String get storyFormCountryHint => 'من أين أنت؟';

  @override
  String get storyFormTimeLabel => 'مدة إسلامك';

  @override
  String get storyFormTimeHint => 'مثلاً: سنتان، 6 أشهر';

  @override
  String get storyFormStoryLabel => 'قصتك';

  @override
  String get storyFormStoryHint => 'شارك رحلتك إلى الإسلام...';

  @override
  String get storyFormSubmitBtn => 'إرسال القصة';

  @override
  String get storyFormThankYouTitle => 'جزاك الله خيراً!';

  @override
  String get storyFormThankYouBody =>
      'تم استلام قصتك. نراجع جميع الإرسالات قبل النشر.';

  @override
  String get storyFormRequiredError => 'يرجى تعبئة جميع الحقول';

  @override
  String get subtitleYourGuideToIslam => 'دليلك إلى الإسلام';

  @override
  String get beginnerMode => 'وضع المبتدئ';

  @override
  String get beginnerModeSubtitle => 'نصائح وإرشادات إضافية للمسلمين الجدد';

  @override
  String get beginnerModeOn =>
      'وضع المبتدئ مفعّل — تظهر نصائح إضافية في التطبيق';

  @override
  String get beginnerModePrayersTip =>
      'نصيحة: اضغط على كل صلاة لمعرفة المزيد عنها ورؤية السنن';

  @override
  String get tafsirSubtitle => 'تفسير القرآن الكريم';

  @override
  String get tafsirComingSoon => 'تفسير هذه السورة قريباً';

  @override
  String get tafsirNotAvailable => 'التفسير غير متوفر';

  @override
  String get scholarSource => 'المصدر';

  @override
  String get asbabAlNuzul => 'أسباب النزول';

  @override
  String get transliteration => 'النطق';

  @override
  String get selectReciter => 'اختر القارئ';

  @override
  String get playVerse => 'تشغيل الآية';

  @override
  String get asmaUlHusna => 'أسماء الله الحسنى';

  @override
  String get asmaUlHusnaSubtitle => '٩٩ اسماً جميلاً لله';

  @override
  String get asmaHadith => 'إن لله تسعة وتسعين اسماً، من أحصاها دخل الجنة';

  @override
  String get asmaHadithSource => 'صحيح البخاري، 2736';

  @override
  String get asmaSearchHint => 'ابحث عن الأسماء...';

  @override
  String get asmaNoResults => 'لم يتم العثور على أسماء';

  @override
  String get asmaSignificance => 'الدلالة';

  @override
  String get asmaUlHusnaTile => '99 اسماً';

  @override
  String get asmaUlHusnaTileSubtitle => 'أسماء الله';

  @override
  String get onboardingTagline => 'احفظ وقتك. أكرم صلواتك.';

  @override
  String get onboardingChooseLanguage => 'اختر لغتك';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get onboardingLocationTitle => 'مواقيت صلاة دقيقة';

  @override
  String get onboardingLocationDesc =>
      'يحتاج نور غارد إلى موقعك لحساب مواقيت الصلاة الدقيقة لمدينتك. لن يتم تخزين موقعك أو مشاركته أبداً.';

  @override
  String get onboardingPrivacyBanner => 'إيمانك أمر شخصي. وبياناتك كذلك.';

  @override
  String get onboardingAllowLocation => 'السماح بالموقع';

  @override
  String get onboardingSkipForNow => 'تخطي الآن';

  @override
  String get onboardingNotificationTitle => 'لا تفوّت أي صلاة';

  @override
  String get onboardingNotificationDesc =>
      'احصل على تنبيه عند كل وقت صلاة بأذان جميل. خصّص الأصوات والتوقيت من الإعدادات.';

  @override
  String get onboardingAdhanAlerts => 'تنبيهات الأذان';

  @override
  String get onboardingCustomTiming => 'توقيت مخصص';

  @override
  String get onboardingAdjustable => 'قابل للتعديل';

  @override
  String get onboardingEnableNotifications => 'تفعيل الإشعارات';

  @override
  String get onboardingMaybeLater => 'ربما لاحقاً';

  @override
  String get onboardingAllSetTitle => 'كل شيء جاهز!';

  @override
  String get onboardingAllSetDesc =>
      'نور غارد جاهز لحماية وقتك\nوإرشاد يومك بنية خالصة.';

  @override
  String get onboardingPrayerTimesLabel => 'مواقيت الصلاة';

  @override
  String get onboardingPrayerTimesDesc => 'مواقيت دقيقة لمدينتك';

  @override
  String get onboardingLockScreenLabel => 'شاشة القفل الإسلامية';

  @override
  String get onboardingLockScreenDesc =>
      'القرآن والأدعية في كل مرة تفتح فيها هاتفك';

  @override
  String get onboardingPrayerGuardLabel => 'حارس الصلاة';

  @override
  String get onboardingPrayerGuardDesc =>
      'يتم حظر التطبيقات تلقائياً أثناء الصلاة';

  @override
  String get onboardingEnterApp => 'ادخل إلى نور غارد';

  @override
  String get adhan => 'الأذان';

  @override
  String get adhanSubtitle => 'نداء الصلاة';

  @override
  String get adhanDescription =>
      'الأذان هو نداء الصلاة في الإسلام، يُعلن خمس مرات يوميًا لدعوة المؤمنين إلى العبادة.';

  @override
  String get makkahStyle => 'مكة المكرمة';

  @override
  String get madinahStyle => 'المدينة المنورة';

  @override
  String get egyptianStyle => 'المصري';

  @override
  String get adhanPlaying => 'يُشغّل الآن';

  @override
  String get makkahDescription =>
      'النداء التقليدي للصلاة من المسجد الحرام في مكة المكرمة.';

  @override
  String get madinahDescription =>
      'أداء هادئ على طراز المسجد النبوي في المدينة المنورة.';

  @override
  String get egyptianDescription => 'أذان مصري عذب يتميز بتلاوته الغنية.';

  @override
  String get adhanCallToWorship => 'نداء الصلاة';

  @override
  String get adhanDescriptionFull =>
      'الأذان هو نداء الصلاة في الإسلام، يُعلن خمس مرات يوميًا لدعوة المؤمنين إلى العبادة.';

  @override
  String get alafasyStyle => 'مشاري العفاسي';

  @override
  String get alaqsaStyle => 'الأقصى';

  @override
  String get turkishStyle => 'التركي';

  @override
  String get pakistaniStyle => 'الباكستاني';

  @override
  String get indonesianStyle => 'الإندونيسي';

  @override
  String get alafasyDescription =>
      'أداء مؤثر من القارئ المشهور مشاري راشد العفاسي.';

  @override
  String get alaqsaDescription =>
      'نداء الصلاة يتردد صداه من المسجد الأقصى في القدس، ثالث أقدس موقع في الإسلام.';

  @override
  String get turkishDescription =>
      'أذان تقليدي بالطراز التركي بمقامه اللحني المميز.';

  @override
  String get pakistaniDescription =>
      'أذان مؤثر بالطراز الجنوب آسيوي، يُتلى في باكستان.';

  @override
  String get indonesianDescription =>
      'أذان إندونيسي عذب، محبوب في جميع أنحاء الأرخبيل.';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String weeklyProgress(int count) {
    return '$count من 35 صلاة هذا الأسبوع';
  }

  @override
  String get bestDay => 'أفضل يوم';

  @override
  String get prayerStats => 'إحصائيات الصلاة';

  @override
  String get completionRate => 'نسبة الإكمال';

  @override
  String get bestPrayer => 'الصلاة الأكثر التزامًا';

  @override
  String get hardestPrayer => 'الصلاة الأكثر تفويتًا';

  @override
  String totalPrayersCompleted(int count) {
    return '$count صلاة مكتملة';
  }

  @override
  String get last7Days => 'آخر 7 أيام';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String get fullDays => 'أيام كاملة';

  @override
  String get partialDays => 'أيام جزئية';

  @override
  String get missedDays => 'أيام فائتة';

  @override
  String get missedPrayerBadge => 'فائتة';

  @override
  String get makeItUp => 'أدِّها قضاءً';

  @override
  String get qadaExplanation => 'إذا فاتتك صلاة، يمكنك أداؤها كصلاة قضاء.';

  @override
  String get noStatsYet => 'استمر في تسجيل صلواتك لرؤية إحصائياتك هنا.';

  @override
  String get notEnoughData => 'لا توجد بيانات كافية بعد';

  @override
  String get continuousPlay => 'تشغيل متواصل';

  @override
  String get sleepTimer => 'مؤقت النوم';

  @override
  String verseCount(Object total, Object verse) {
    return 'الآية $verse من $total';
  }

  @override
  String get verseTafsir => 'تفسير الآية';

  @override
  String get tafsirOfTheDay => 'تفسير اليوم';

  @override
  String get dailyInsight => 'فكرة يومية';

  @override
  String get keyThemes => 'المواضيع والدروس الرئيسية';

  @override
  String get readFullSurah => 'اقرأ السورة كاملة';

  @override
  String get surahIntroduction => 'مقدمة السورة';

  @override
  String get verses => 'آيات';

  @override
  String get loadingTafsir => 'جاري تحميل التفسير...';

  @override
  String get keepAliveNotificationText => 'إشعارات الصلاة نشطة';

  @override
  String get keepAliveChannelName => 'إشعارات الصلاة';

  @override
  String get keepAliveChannelDescription =>
      'يحافظ على تفعيل نور غارد في الخلفية لضمان عدم تفويت تنبيهات الصلاة.';

  @override
  String get notifSetupTitle => 'تفعيل تنبيهات شاشة القفل';

  @override
  String get notifSetupSubtitle =>
      'لكي لا تفوّت الأذان أبدًا — حتى عندما يكون هاتفك مقفلاً. يستغرق ذلك حوالي دقيقة.';

  @override
  String get notifSetupSamsungBanner =>
      'هل تستخدم هاتف Samsung Galaxy (بما في ذلك Fold/Flip)؟ تضيف Samsung مفاتيح إضافية إلى جانب نظام أندرويد الأساسي — توضح لك الخطوتان 4 و6 أدناه مكانها بالضبط.';

  @override
  String get notifSetupStep1Title => 'السماح بالإشعارات';

  @override
  String get notifSetupStep1Description =>
      'الإذن الأساسي الذي يحتاجه نور غارد لتنبيهك من الأساس.';

  @override
  String get notifSetupStep1Action => 'السماح بالإشعارات';

  @override
  String get notifSetupStep2Title => 'التنبيهات والتذكيرات';

  @override
  String get notifSetupStep2Description =>
      'يتيح لتنبيهات الصلاة العمل في وقت الصلاة بالضبط، حتى عندما يكون هاتفك في وضع الخمول أو توفير البطارية.';

  @override
  String get notifSetupStep2Action => 'فتح إعدادات التنبيهات';

  @override
  String get notifSetupStep3Title => 'العرض فوق التطبيقات الأخرى';

  @override
  String get notifSetupStep3Description =>
      'يتيح لشاشة الصلاة الكاملة الظهور فوق شاشة القفل وأي شيء آخر مفتوح.';

  @override
  String get notifSetupStep3Action => 'فتح الإعدادات';

  @override
  String get notifSetupStep4Title =>
      'الإظهار كنافذة منبثقة / تنبيه على ملء الشاشة';

  @override
  String get notifSetupStep4Description =>
      'يتيح لشاشة الأذان أن تظهر فوق شاشة القفل بدلاً من أن تبقى إشعارًا صامتًا.';

  @override
  String get notifSetupStep4SamsungNote =>
      'على هواتف Samsung Galaxy (بما في ذلك Fold/Flip): افتح الإعدادات ← اضغط على \"Prayer Time Alarm\"، ثم فعّل \"Pop-up notification\" (يسمى \"Cover screen pop-up\" في Fold/Flip). هذا مفتاح خاص بـ Samsung فقط — تفعيله هو ما يجعل شاشة الأذان تظهر فعليًا فوق شاشة القفل.';

  @override
  String get notifSetupStep4Action => 'فتح إعدادات الإشعارات';

  @override
  String get notifSetupStep5Title => 'الحفاظ على موثوقية الإشعارات';

  @override
  String get notifSetupStep5Description =>
      'يمنع أندرويد من إبطاء أو تأخير نور غارد في الخلفية، حتى تصل تنبيهات الصلاة والتذكيرات دائمًا في وقتها.';

  @override
  String get notifSetupStep5Action => 'إيقاف تحسين البطارية';

  @override
  String get notifSetupStep6Title => 'التطبيقات غير الخاضعة للسكون';

  @override
  String get notifSetupStep6Description =>
      'يمكن لمدير البطارية في Samsung أن يجعل نور غارد في وضع السكون ويمنع تنبيهات الصلاة بصمت. إضافته إلى \"Never sleeping apps\" يمنع ذلك.';

  @override
  String get notifSetupStep6SamsungNote =>
      'الإعدادات ← البطارية والعناية بالجهاز ← حدود استخدام الخلفية ← Never sleeping apps ← اضغط على \"+\" ← اختر نور غارد.';

  @override
  String get notifSetupStep6Action => 'فتح إعدادات البطارية';

  @override
  String get notifSetupStatusChecking => 'جارٍ التحقق…';

  @override
  String get notifSetupStatusEnabled => 'مفعّل';

  @override
  String get notifSetupStatusNeeded => 'مطلوب';

  @override
  String get notifSetupStatusManual => 'خطوة يدوية';

  @override
  String get notifSetupContinueButton => 'الاستمرار إلى نور غارد';

  @override
  String get notifSetupLaterButton => 'سأكمل هذا لاحقًا';

  @override
  String get notifSetupDoneButton => 'تم';

  @override
  String get testNotificationButton => 'إرسال إشعار تجريبي (٢٠ ثوانٍ)';

  @override
  String get testNotificationSnack => 'سيصل الإشعار التجريبي خلال ٢٠ ثوانٍ';

  @override
  String get testLockAlarmButton =>
      'اختبار تنبيه القفل بكامل الشاشة (٢٠ ثوانٍ)';

  @override
  String get testLockAlarmSnack =>
      'سينطلق تنبيه القفل خلال ٢٠ ثوانٍ — اقفل هاتفك الآن';

  @override
  String get testAdhanForegroundButton =>
      'اختبار الأذان داخل التطبيق (أثناء الاستخدام)';

  @override
  String get testAdhanForegroundSnack => 'تشغيل الأذان كاملاً مع شعار صامت';

  @override
  String get testRequiresNotificationsOn =>
      'فعّل إشعارات الصلاة أولاً لتجربة هذا';

  @override
  String get lockScreenSetupGuideButton => 'دليل إعداد تنبيهات شاشة القفل';

  @override
  String get couldNotOpenPrivacyPolicy => 'تعذّر فتح سياسة الخصوصية';

  @override
  String get couldNotOpenEmailApp => 'تعذّر فتح تطبيق البريد الإلكتروني';

  @override
  String get blockDurationLabel => 'مدة الحظر';

  @override
  String get privacyAndTrust => 'الخصوصية والثقة';

  @override
  String get noorGuardMotto =>
      '\"إن كان لا مكان له في المسجد،\nفلا مكان له في نور غارد.\"';

  @override
  String get openingAppStore => 'فتح متجر التطبيقات…';

  @override
  String get openingShareSheet => 'فتح قائمة المشاركة…';

  @override
  String get openingSupportEmail => 'فتح البريد الإلكتروني للدعم…';

  @override
  String get openingTermsOfService => 'فتح شروط الخدمة…';

  @override
  String get duration30Min => '٣٠ دقيقة';

  @override
  String get duration1Hour => 'ساعة واحدة';

  @override
  String get durationPrayerWindowOnly => 'نافذة الصلاة فقط';

  @override
  String get hoursAbbreviation => 'س';

  @override
  String get cancelTimerButton => 'إلغاء المؤقت';

  @override
  String get custom => 'مخصص';

  @override
  String get customTimerMinutesTitle => 'مؤقت مخصص (بالدقائق)';

  @override
  String get customTimerHint => 'مثال: ٢٠';

  @override
  String get cancel => 'إلغاء';

  @override
  String get start => 'بدء';

  @override
  String get travel => 'السفر';

  @override
  String get anxietyAndStress => 'القلق والتوتر';

  @override
  String get gratitude => 'الشكر';

  @override
  String get protection => 'الحماية';

  @override
  String get family => 'الأسرة';

  @override
  String get forgiveness => 'المغفرة';

  @override
  String get appBlockingSetupHeadline => 'احفظ وقتك، احفظ صلاتك';

  @override
  String get appBlockingSetupBody =>
      'يستخدم نور جارد خدمة إمكانية الوصول في أندرويد فقط لملاحظة فتح أحد التطبيقات المحظورة وقت الصلاة. لا يقرأ رسائلك أو صورك أو أي بيانات شخصية أبدًا.';

  @override
  String get appBlockingAccessibilityStatusOn => 'تم منح إذن إمكانية الوصول';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'لم يُمنح إذن إمكانية الوصول بعد';

  @override
  String get appBlockingOpenSettings => 'فتح إعدادات إمكانية الوصول';

  @override
  String get appBlockingSetupNotNow => 'ليس الآن';

  @override
  String get appBlockingEnableToggle => 'تفعيل حجب التطبيقات';

  @override
  String get appBlockingModeLabel => 'وضع الحجب';

  @override
  String get appBlockingModeSoft => 'خفيف';

  @override
  String get appBlockingModeSoftDesc =>
      'تذكير لطيف فقط — تبقى التطبيقات مفتوحة';

  @override
  String get appBlockingModeFirm => 'متوسط';

  @override
  String get appBlockingModeFirmDesc => 'يحجب التطبيق، مع إمكانية تجاوز سريعة';

  @override
  String get appBlockingModeHard => 'صارم';

  @override
  String get appBlockingModeHardDesc => 'حجب كامل — لا يفتحه إلا \"صلّيت\"';

  @override
  String get appBlockingSelectPrayersLabel => 'الحجب خلال هذه الصلوات';

  @override
  String get appBlockingBufferBeforeLabel => 'البدء قبل الصلاة';

  @override
  String get appBlockingBufferAfterLabel => 'الرفع بعد الصلاة';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count د';
  }

  @override
  String get appBlockingAppsTitle => 'التطبيقات المحظورة';

  @override
  String get appBlockingSelectAppsButton => 'اختيار التطبيقات للحظر';

  @override
  String get appBlockingSearchHint => 'البحث في التطبيقات المثبتة';

  @override
  String get appBlockingNoAppsSelected => 'لم تُحدَّد تطبيقات بعد';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تطبيقات محظورة',
      one: 'تطبيق واحد محظور',
      zero: 'لا توجد تطبيقات محظورة',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'الاختبار';

  @override
  String get appBlockingTestDescription =>
      'فعّل حظر التطبيقات لمدة دقيقتين للتأكد من أنه يعمل على هذا الجهاز.';

  @override
  String get appBlockingTestButton => 'اختبار حظر التطبيقات (دقيقتان)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'حظر التطبيقات نشط لمدة دقيقتين — جرّب فتح أحد التطبيقات المحظورة';

  @override
  String get appBlockingPermissionNeeded =>
      'فعّل إذن إمكانية الوصول لبدء الحجب';

  @override
  String get appBlockingIosComingSoonTitle => 'إذن وقت الشاشة — قريبًا';

  @override
  String get appBlockingIosComingSoonBody =>
      'يحتاج حجب التطبيقات على iOS إلى إذن وقت الشاشة من Apple، ولا زلنا نعمل على تفعيله. سنخبرك فور أن يصبح جاهزًا.';

  @override
  String get appBlockingHeadline1 => 'حان وقت الصلاة';

  @override
  String get appBlockingHeadline2 => 'احفظ وقتك';

  @override
  String get appBlockingDefaultTitle => 'وقت الصلاة';

  @override
  String get appBlockingIPrayedButton => 'صلّيت';

  @override
  String get appBlockingReadAyahsButton => 'قراءة 3 آيات';

  @override
  String get appBlockingEmergencyBypass => 'تجاوز للطوارئ';

  @override
  String get appBlockingSkipForNow => 'تخطّ الآن';

  @override
  String get appBlockingBypassConfirmTitle => 'إنهاء سلسلتك؟';

  @override
  String get appBlockingBypassConfirmBody =>
      'التجاوز الآن سيُعيد ضبط سلسلة صلواتك. إذا كانت هذه حالة طوارئ حقيقية، يمكنك الاستمرار.';

  @override
  String get appBlockingBypassConfirmContinue => 'تجاوز مع ذلك';

  @override
  String get appBlockingBypassConfirmCancel => 'رجوع';

  @override
  String get appBlockingSoftReminderTitle => 'تذكير لطيف';

  @override
  String get appBlockingSoftReminderBody =>
      'حان وقت الصلاة — فكّر في الانصراف لبرهة.';

  @override
  String get quranChallengeBannerTitle => 'اقرأ 3 آيات لفتح الحظر';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return 'تمت قراءة $count من $total آيات';
  }

  @override
  String get quranChallengeComplete => 'أحسنت — تم فتح التطبيقات';

  @override
  String get focusBlockHeadline1 => 'حافظ على تركيزك';

  @override
  String get focusBlockHeadline2 => 'استمر';

  @override
  String get endFocusSessionButton => 'إنهاء جلسة التركيز';

  @override
  String get focusPaused => 'متوقف للصلاة';

  @override
  String get selectLocationTitle => 'اختر الموقع';

  @override
  String get useCurrentLocation => 'استخدام الموقع الحالي';

  @override
  String get savedLocationsHeader => 'المواقع المحفوظة';

  @override
  String get noSavedLocationsYet =>
      'لا توجد مواقع محفوظة حتى الآن. ابحث أدناه لإضافة موقع.';

  @override
  String get searchCityHint => 'ابحث عن اسم المدينة…';

  @override
  String get addLocationTooltip => 'إضافة موقع';

  @override
  String get deleteLocationTooltip => 'حذف الموقع';

  @override
  String get locationNotFound =>
      'لم يتم العثور على الموقع. حاول بحثًا مختلفًا.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'يمكنك حفظ ما يصل إلى $max مواقع';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'لم يتم تأكيد التغيير — حاول مرة أخرى';

  @override
  String get tasbihCounter => 'عداد التسبيح';

  @override
  String get tasbihCounterSubtitle => 'احصِ ذِكرك';

  @override
  String get tasbihResetButton => 'إعادة تعيين';

  @override
  String get tasbihTotalLabel => 'الإجمالي';

  @override
  String get tasbihCelebrationTitle => 'اكتمل التسبيح!';

  @override
  String get tasbihCelebrationBody => 'لقد أكملت 99 ذكرًا. تقبل الله ذكرك.';

  @override
  String get tasbihStartNewSession => 'ابدأ جلسة جديدة';

  @override
  String get tasbihUndoButton => 'تراجع';

  @override
  String get tasbihTapAnywhereHint => 'اضغط في أي مكان على الشاشة للعد';

  @override
  String get tasbihSoundToggleTooltip => 'صوت اللمس';

  @override
  String get tasbihManageDhikrTooltip => 'إدارة الأذكار';

  @override
  String get tasbihStatsTooltip => 'عرض الإحصائيات';

  @override
  String get tasbihDailyTotalLabel => 'إجمالي اليوم';

  @override
  String get tasbihRoundsTodayLabel => 'الجولات اليوم';

  @override
  String get tasbihManageDhikrTitle => 'إدارة الأذكار';

  @override
  String get tasbihAddCustomDhikrButton => 'إضافة ذكر مخصص';

  @override
  String get tasbihDeleteDhikrTooltip => 'حذف';

  @override
  String get tasbihBuiltInDhikrBadge => 'مدمج';

  @override
  String get tasbihCannotDeleteLastDhikr => 'تحتاج إلى ذكر واحد على الأقل';

  @override
  String get tasbihDhikrNameLabel => 'الاسم';

  @override
  String get tasbihDhikrNameHint => 'مثل: أستغفر الله';

  @override
  String get tasbihDhikrArabicLabel => 'العربية (اختياري)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'يرجى إدخال اسم';

  @override
  String get tasbihSaveDhikrButton => 'حفظ';

  @override
  String get tasbihStatsTitle => 'إحصائيات التسبيح';

  @override
  String get tasbihAllTimeTotalLabel => 'الإجمالي الكلي';

  @override
  String get tasbihNoActivityYetMessage => 'ابدأ العد لترى إحصائياتك هنا.';

  @override
  String get tasbihSoundPickerTitle => 'صوت اللمس';

  @override
  String get tasbihSoundClassicClick => 'نقرة كلاسيكية';

  @override
  String get tasbihSoundSoftChime => 'رنين هادئ';

  @override
  String get tasbihSoundStoneTap => 'نقرة حجرية';

  @override
  String get tasbihCurrentlyReciting => 'يُسبَّح الآن';

  @override
  String tasbihOfTarget(int target) {
    return 'من $target';
  }

  @override
  String get tasbihSoundRainDrop => 'قطرة مطر';

  @override
  String get tasbihSoundSoftFeather => 'ريشة ناعمة';

  @override
  String noAyahsFound(String query) {
    return 'لا توجد آيات لـ \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'جرّب البحث بالعربية أو الإنجليزية، أو استخدم مصطلحاً إسلامياً:';

  @override
  String get loadingQuranIndex => 'جارٍ تحميل فهرس القرآن…';

  @override
  String get quranSearchSuggestions =>
      'صبر, رحمة, صلاة, مغفرة, توبة, جنة, علم, تقوى, دعاء, ذكر';

  @override
  String get heroVerse1 =>
      'حَافِظُوا عَلَى الصَّلَوَاتِ وَالصَّلَاةِ الْوُسْطَى';

  @override
  String get heroVerse2 =>
      'إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا';

  @override
  String get heroVerse3 => 'وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ';

  @override
  String get heroVerse4 =>
      'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ';

  @override
  String get heroVerse5 => 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ';

  @override
  String get heroVerse6 =>
      'إِنَّ أَوَّلَ بَيْتٍ وُضِعَ لِلنَّاسِ لَلَّذِي بِبَكَّةَ مُبَارَكًا وَهُدًى لِّلْعَالَمِينَ';

  @override
  String get heroVerse7 =>
      'إِنَّ الصَّلَاةَ تَنْهَى عَنِ الْفَحْشَاءِ وَالْمُنكَرِ وَلَذِكْرُ اللَّهِ أَكْبَرُ';

  @override
  String get heroVerse8 => 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ';

  @override
  String get heroVerse9 => 'ادْعُونِي أَسْتَجِبْ لَكُمْ';

  @override
  String get heroVerse10 => 'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ';

  @override
  String get heroVerse11 => 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا';

  @override
  String get heroVerse12 => 'إِنَّ اللَّهَ مَعَ الصَّابِرِينَ';

  @override
  String get heroVerse13 => 'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ';

  @override
  String get heroVerse14 => 'وَأَحْسِنُوا إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ';

  @override
  String get heroVerse15 =>
      'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ فِيهِ هُدًى لِّلْمُتَّقِينَ';

  @override
  String get accuracyHigh => 'دقة عالية';

  @override
  String get accuracyMedium => 'دقة متوسطة';

  @override
  String get accuracyLow => 'دقة منخفضة';

  @override
  String get accuracyCalibrating => 'جارٍ المعايرة…';

  @override
  String get compassNeedsCalibration => 'البوصلة تحتاج إلى معايرة';

  @override
  String get compassCalibrationHint =>
      'حرّك هاتفك ببطء في شكل رقم 8 لتحسين الدقة.';

  @override
  String get spiritLevelLabel => 'الميزان';

  @override
  String get spiritLevelLevelText => '✓  مستوٍ';

  @override
  String get spiritLevelTiltText => 'ميّل للمعايرة';

  @override
  String get compassNorth => 'ش';

  @override
  String get compassEast => 'شق';

  @override
  String get compassSouth => 'ج';

  @override
  String get compassWest => 'غ';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'احرص على وقتك. أكرم صلاتك.';

  @override
  String get stopAdhan => 'إيقاف الأذان';

  @override
  String get duasSearchEmpty => 'جرّب فئة مختلفة أو مصطلح بحث آخر.';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingWelcomeTo => 'مرحباً بك في';

  @override
  String get onboardingSubtitle => 'رفيقك في الرحلة الجميلة للإسلام.';

  @override
  String get onboardingLetsGetStarted => 'لنبدأ';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step من $total';
  }

  @override
  String get onboardingWhatsYourName => 'ما اسمك؟';

  @override
  String get onboardingNameSubtitle => 'نودّ أن نعرف كيف نخاطبك.';

  @override
  String get onboardingNameHint => 'أدخل اسمك';

  @override
  String get onboardingContinue => 'متابعة';

  @override
  String get onboardingAreYouNewToIslam => 'هل أنت جديد في الإسلام؟';

  @override
  String get onboardingModeSubtitle => 'سنخصص تجربتك بناءً على مسيرتك.';

  @override
  String get onboardingNewToIslam => 'أنا جديد في الإسلام';

  @override
  String get onboardingNewToIslamDesc => 'وضع المبتدئين مع إرشادات خطوة بخطوة';

  @override
  String get onboardingFamiliarWithIslam => 'أنا على دراية بالإسلام';

  @override
  String get onboardingFamiliarWithIslamDesc => 'الوضع العادي مع جميع الميزات';

  @override
  String greetingWithName(String name) {
    return 'السلام عليكم، $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'اليوم $days كمسلم';
  }

  @override
  String get beginnerEssential1 => 'دليلي كمسلم جديد';

  @override
  String get beginnerEssential2 => 'تعلم الوضوء';

  @override
  String get beginnerEssential3 => 'كيفية الصلاة خطوة بخطوة';

  @override
  String get beginnerEssential4 => 'سورة الفاتحة';

  @override
  String get beginnerEssential5 => 'الأدعية اليومية';

  @override
  String get beginnerEssential6 => 'فهم الشهادة';

  @override
  String get beginnerEssential7 => 'المصطلحات والمعجم الإسلامي';

  @override
  String get beginnerExploreAll => 'استكشف جميع الميزات';

  @override
  String get beginnerExploreSubtitle => 'انتقل إلى تجربة نور غارد الكاملة';

  @override
  String get beginnerExploreFeaturesSubtitle => 'كل ما يقدمه نور جارد';

  @override
  String get beginnerLearnSalah => 'تعلم الصلاة';

  @override
  String get beginnerMayAllahGuide => 'أعانك الله على كل خطوة وبارك في رحلتك.';

  @override
  String get beginnerMuslimEssentials => 'أساسيات المسلم';

  @override
  String get beginnerQuote1 => 'إِنَّ مَعَ الْعُسْرِ يُسْرًا — القرآن ٩٤:٦';

  @override
  String get beginnerQuote2 => 'احفظ الله يحفظك.';

  @override
  String get beginnerQuote3 =>
      'إن الله لا ينظر إلى صوركم وأموالكم، ولكن ينظر إلى قلوبكم وأعمالكم.';

  @override
  String get beginnerQuote4 => 'كل خطوة نحو الصلاة هي خطوة نحو السلام.';

  @override
  String get beginnerQuote5 => 'خيركم من تعلم القرآن وعلمه.';

  @override
  String get beginnerTapToSetShahadaDate => 'اضغط لتعيين تاريخ شهادتك';

  @override
  String get beginnerToolboxSection => 'أدوات المبتدئ';

  @override
  String get beginnerYourJourney => 'رحلتك';

  @override
  String get journeyMonth1Name => 'الشهر الأول: الأساس';

  @override
  String get journeyMonth2Name => 'الشهر الثاني: بناء العادات';

  @override
  String get journeyMonth3Name => 'الشهر الثالث: تعميق الإيمان';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total مكتمل';
  }

  @override
  String get journeyViewFull => 'عرض الرحلة كاملة →';

  @override
  String get journeyTask2_1 => 'أداء الصلوات الخمس لمدة 7 أيام';

  @override
  String get journeyTask2_2 => 'تعلّم 10 أدعية إضافية';

  @override
  String get journeyTask2_3 => 'قراءة الجزء الأول من القرآن الكريم';

  @override
  String get journeyTask2_4 => 'تعلّم أسماء الله الـ 99';

  @override
  String get journeyTask2_5 => 'استخدام عداد التسبيح يومياً لمدة 7 أيام';

  @override
  String get journeyTask2_6 => 'تعلّم صلوات السنة';

  @override
  String get journeyTask2_7 => 'إيجاد المسجد المحلي';

  @override
  String get journeyTask3_1 => 'قراءة سورة البقرة';

  @override
  String get journeyTask3_2 => 'التعرف على الزكاة';

  @override
  String get journeyTask3_3 => 'التعرف على الصيام';

  @override
  String get journeyTask3_4 => 'حفظ 3 سور جديدة';

  @override
  String get journeyTask3_5 => 'التعرف على الحج';

  @override
  String get journeyTask3_6 => 'مشاركة الإسلام مع شخص آخر';

  @override
  String get journeyTask3_7 => 'إتمام المعجم الإسلامي';

  @override
  String get journeyTimelineTitle => 'رحلتي';

  @override
  String get journeyCompleted => 'مكتمل';

  @override
  String get journeyInProgress => 'قيد التنفيذ';

  @override
  String get journeyLocked => 'مقفل';

  @override
  String get wuduThreeTimes => '٣ مرات';

  @override
  String get wuduDuaBefore => 'دعاء قبل الوضوء';

  @override
  String get wuduDuaAfter => 'دعاء بعد الوضوء';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'باسم الله';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'أشهد أن لا إله إلا الله وحده لا شريك له، وأشهد أن محمداً عبده ورسوله. اللهم اجعلني من التوابين واجعلني من المتطهرين.';

  @override
  String get wuduCompleteButton => 'أتممت الوضوء';

  @override
  String get howToPrayStepOpeningDua => 'دُعَاءُ الِاسْتِفْتَاح';

  @override
  String get howToPrayStepAlFatiha => 'سُورَة الفَاتِحَة';

  @override
  String get howToPrayStepSurah => 'سُورَة قَصِيرَة';

  @override
  String get howToPrayStepTashahhudShort => 'التَّشَهُّد (الجِلْسَة الوُسْطَى)';

  @override
  String get howToPrayStepSalawat => 'الصَّلَاة عَلَى النَّبِيِّ ﷺ';

  @override
  String get howToPrayTransTakbir => 'الله أكبر';

  @override
  String get howToPrayTransOpeningDua =>
      'سبحانك اللهم وبحمدك وتبارك اسمك وتعالى جدك ولا إله غيرك.';

  @override
  String get howToPrayTransFatiha =>
      'بسم الله الرحمن الرحيم. الحمد لله رب العالمين. الرحمن الرحيم. مالك يوم الدين. إياك نعبد وإياك نستعين. اهدنا الصراط المستقيم. صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضالين.';

  @override
  String get howToPrayTransRuku => 'سبحان ربي العظيم';

  @override
  String get howToPrayTransItidal => 'سمع الله لمن حمده. ربنا ولك الحمد.';

  @override
  String get howToPrayTransSujood => 'سبحان ربي الأعلى';

  @override
  String get howToPrayTransJalsa => 'رب اغفر لي';

  @override
  String get howToPrayTransTashahhud =>
      'التحيات لله والصلوات والطيبات. السلام عليك أيها النبي ورحمة الله وبركاته. السلام علينا وعلى عباد الله الصالحين. أشهد أن لا إله إلا الله وأشهد أن محمداً عبده ورسوله.';

  @override
  String get howToPrayTransSalawat =>
      'اللهم صلِّ على محمد وعلى آل محمد كما صليت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد. اللهم بارك على محمد وعلى آل محمد كما باركت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد.';

  @override
  String get howToPrayTransTasleem => 'السلام عليكم ورحمة الله';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'اقرأ هذا الدعاء سراً بعد تكبيرة الإحرام، مرة واحدة فقط في بداية الصلاة.';

  @override
  String get howToPraySurahInstruction =>
      'بعد الفاتحة اقرأ أي سورة تحفظها. سورة الإخلاص أعلاه مثالية للمبتدئين — تُقرأ في أول ركعتين فقط.';

  @override
  String get howToPrayItidalInstruction =>
      'قل \'سمع الله لمن حمده\' أثناء الرفع، ثم قف مستقيماً وقل \'ربنا ولك الحمد\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'اجلس بعد الركعة الثانية وأتِ بالتشهد، وارفع سبابتك عند الشهادة. في صلوات الثلاث والأربع ركعات ستقوم بعدها.';

  @override
  String get howToPraySalawatInstruction =>
      'اقرأ الصلاة على النبي ﷺ مباشرةً بعد التشهد الأخير، قبل التسليم، في الجلسة الأخيرة فقط.';

  @override
  String get howToPrayTasleemInstruction =>
      'أدِّر رأسك يميناً وقل \'السلام عليكم ورحمة الله\'، ثم يساراً وكررها. انتهت صلاتك.';

  @override
  String get howToPrayOnceOpens => 'مرة واحدة — تفتتح الصلاة';

  @override
  String get howToPraySayAllahuAkbar => 'قُلْ: اللَّهُ أَكْبَرُ';

  @override
  String get howToPrayFirstRakahOnly => 'الركعة الأولى فقط';

  @override
  String get howToPrayFirst2RakahsOnly => 'أول ركعتين فقط';

  @override
  String get howToPrayEveryRakah => 'كل ركعة';

  @override
  String get howToPrayAfter2ndRakah => 'بعد الركعة الثانية';

  @override
  String get howToPrayFinalSittingOnly => 'الجلسة الأخيرة فقط';

  @override
  String get howToPrayClosesThePrayer => 'تُنهي الصلاة';

  @override
  String get howToPraySectionBefore => 'قبل الصلاة';

  @override
  String get howToPraySectionRakah => 'ركعة';

  @override
  String get howToPraySectionMiddleSitting => 'الجلسة الوسطى';

  @override
  String get howToPraySectionFinalSitting => 'الجلسة الأخيرة';

  @override
  String get howToPrayRakahLabel => 'ركعات';

  @override
  String get howToPrayCompleteButton => 'أكملت صلاتي';

  @override
  String get howToPrayMashaallah => 'ما شاء الله!';

  @override
  String get howToPrayAccepted => 'تقبَّل الله صلاتك.';

  @override
  String get fatihaIntroTitle => 'أم القرآن';

  @override
  String get fatihaIntroBody =>
      'سورة الفاتحة هي أعظم سورة في القرآن الكريم. تُتلى في كل ركعة من ركعات الصلاة — ما لا يقل عن 17 مرة يومياً. وهي حوار كامل بين العبد وربه، وبوابة كل صلاة.';

  @override
  String get fatihaIntroIbnKathir =>
      'قال ابن كثير: «الفاتحة تحتوي على جوهر القرآن كله — فهي دعاء، وإقرار بالعبودية، وطلب للهداية إلى الصراط المستقيم.» — تفسير ابن كثير';

  @override
  String get shahadaScreenTitle => 'الشهادة';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'أشهد أن لا إله إلا الله وأشهد أن محمداً رسول الله';

  @override
  String get shahadaWordBreakdownTitle => 'كلمة كلمة';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'لا يوجد';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'إله / معبود';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'إلا / سوى';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'الله (المعبود الحق)';

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
  String get shahadaWord6Meaning => 'رسول / نبي';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'الله';

  @override
  String get shahadaMeaningTitle => 'المعنى والأهمية';

  @override
  String get shahadaMeaningBody =>
      'الشهادة هي إعلان الإيمان الذي يُشكّل أساس الإسلام. وهي الركن الأول من أركان الإسلام الخمسة. بقول هذه الكلمات بإخلاص وقناعة، يدخل الإنسان في الإسلام. يوضح ابن كثير أن الجزء الأول — \'لا إله إلا الله\' — ينفي جميع الآلهة الباطلة ويؤكد وحدانية الله المطلقة.';

  @override
  String get shahadaMomentTitle => 'لحظة الشهادة';

  @override
  String get shahadaMomentBody =>
      'عندما ينطق شخص بالشهادة للمرة الأولى بإيمان حقيقي في قلبه، يحدث شيء عظيم — يبدأ حياة جديدة. قال النبي ﷺ: \'من قال لا إله إلا الله وكفر بما يعبد من دون الله، حُرّم ماله ودمه\' (صحيح مسلم). تُغفر جميع الذنوب السابقة. يبدأ فصل جديد. مرحباً في الإسلام.';

  @override
  String get shahadaPronunciationTitle => 'دليل النطق';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'دليل خطوة بخطوة';

  @override
  String get toolboxWuduSubtitle => 'الطهارة قبل الصلاة';

  @override
  String get toolboxGlossarySubtitle => '١١٤ مصطلح إسلامي موضّح';

  @override
  String get shareSheetTitle => 'مشاركة';

  @override
  String get shareAnAyah => 'مشاركة آية';

  @override
  String get shareADua => 'مشاركة دعاء';

  @override
  String get shareANameOfAllah => 'مشاركة اسم من أسماء الله';

  @override
  String get shareAHadith => 'مشاركة حديث';

  @override
  String get shareViaLabel => 'تمت المشاركة عبر نور غارد';

  @override
  String get shareCardAyahLabel => '✦ آية اليوم';

  @override
  String get shareCardDuaLabel => '✦ دعاء';

  @override
  String get shareCardNameLabel => '✦ اسم الله';

  @override
  String get shareCardHadithLabel => '✦ حديث';

  @override
  String get sharePickDuaTitle => 'اختر دعاءً للمشاركة';

  @override
  String get shareError => 'تعذّر إنشاء صورة المشاركة';

  @override
  String get shareCardVerseLabel => '✦ آية قرآنية';

  @override
  String get shareCardAsmaLabel => '✦ الأسماء الحسنى';

  @override
  String get shareAyahSubtitle => 'اختر من ٣٠ آية قرآنية';

  @override
  String get shareDuaSubtitle => 'اختر من المكتبة';

  @override
  String get shareNameSubtitle => 'اختر من الأسماء الحسنى التسعة والتسعين';

  @override
  String get shareHadithSubtitle => 'اختر من ٢٠ أحاديث صحيحة';

  @override
  String get shareThisDua => 'شارك هذا الدعاء';

  @override
  String get sharePickAyahTitle => 'اختر آية للمشاركة';

  @override
  String get searchAyahs => 'ابحث عن آيات…';

  @override
  String get noAyahsFoundShort => 'لم يُعثر على آيات';

  @override
  String get shareThisAyah => 'شارك هذه الآية';

  @override
  String get sharePickNameTitle => 'اختر اسمًا للمشاركة';

  @override
  String get shareThisName => 'شارك هذا الاسم';

  @override
  String get sharePickHadithTitle => 'اختر حديثًا للمشاركة';

  @override
  String get searchHadiths => 'ابحث عن أحاديث…';

  @override
  String get noHadithsFound => 'لم يُعثر على أحاديث';

  @override
  String get shareThisHadith => 'شارك هذا الحديث';

  @override
  String get backToBasics => 'العودة إلى الأساسيات';

  @override
  String get backToBasicsSubtitle => 'دليلك إلى أساسيات الإسلام';

  @override
  String get fivePillarsOfIslam => 'أركان الإسلام الخمسة';

  @override
  String get fivePillarsShort => 'الأركان الخمسة';

  @override
  String get fivePillarsSubtitle => 'أسس الإيمان الإسلامي';

  @override
  String get pillarLearnMore => 'اعرف المزيد';

  @override
  String get pillarShowLess => 'أقل';

  @override
  String get pillarsShowDetails => 'عرض التفاصيل';

  @override
  String get pillarsHideDetails => 'إخفاء التفاصيل';

  @override
  String get pillar1Name => 'الشهادة';

  @override
  String get pillar1Desc => 'شهادة الإيمان';

  @override
  String get pillar1Detail =>
      'إعلان الشهادة هو أساس الإسلام. بقول \'لا إله إلا الله ومحمد رسول الله\' بصدق يدخل المرء في الإسلام.';

  @override
  String get pillar2Name => 'الصلاة';

  @override
  String get pillar2Desc => 'الصلوات الخمس اليومية';

  @override
  String get pillar2Detail =>
      'الصلوات الخمس هي الصلة المباشرة بين المسلم وربه. تُصلى عند الفجر والظهر والعصر والمغرب والعشاء وتنظّم يوم المسلم كله حول ذكر الله.';

  @override
  String get pillar3Name => 'الزكاة';

  @override
  String get pillar3Desc => 'الصدقة الواجبة';

  @override
  String get pillar3Detail =>
      'الزكاة هي الصدقة الواجبة سنوياً بنسبة 2.5٪ من المدخرات للمحتاجين، تطهر المال وتوثّق أواصر المجتمع المسلم.';

  @override
  String get pillar4Name => 'الصوم';

  @override
  String get pillar4Desc => 'صيام رمضان';

  @override
  String get pillar4Detail =>
      'الصيام في شهر رمضان المبارك من الفجر حتى المغرب، يمتنع المسلم فيه عن الطعام والشراب والذنوب ابتغاء التقوى والشكر.';

  @override
  String get pillar5Name => 'الحج';

  @override
  String get pillar5Desc => 'الحج إلى مكة المكرمة';

  @override
  String get pillar5Detail =>
      'الحج إلى مكة المكرمة فريضة مرة في العمر على كل مسلم مستطيع جسدياً ومالياً، وهو أكبر تجمع بشري سنوي على وجه الأرض.';

  @override
  String get switchedToNewMuslimMode => 'تم التحويل إلى وضع المسلم الجديد';

  @override
  String get switchedToRegularMode => 'تم التحويل إلى الوضع العادي';

  @override
  String get liveNotifChannelName => 'نور غارد مباشر';

  @override
  String get liveNotifChannelDescription =>
      'العد التنازلي للصلاة ومحتوى إسلامي يومي على شاشة القفل';

  @override
  String get liveNotifHeaderAyah => 'آية اليوم';

  @override
  String get liveNotifHeaderDua => 'دعاء اليوم';

  @override
  String get liveNotifHeaderWord => 'كلمة اليوم';

  @override
  String get liveNotifHeaderName => 'اسم من أسماء الله الحسنى';

  @override
  String get liveNotifHeaderHadith => 'حديث اليوم';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'بعد $hours س $minutes د';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'بعد $minutes د';
  }

  @override
  String get liveNotifCountdownNow => 'حان وقت الصلاة';

  @override
  String get savedDuas => 'الأدعية المحفوظة';

  @override
  String get savedVerses => 'الآيات المحفوظة';

  @override
  String get savedNames => 'الأسماء المحفوظة';

  @override
  String get noSavedDuas => 'لا توجد أدعية محفوظة بعد';

  @override
  String get noSavedVerses => 'لا توجد آيات محفوظة بعد';

  @override
  String get noSavedNames => 'لا توجد أسماء محفوظة بعد';

  @override
  String get heroVerse16 =>
      'رَبَّنَا لَا تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا';

  @override
  String get heroVerse17 => 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ';

  @override
  String get heroVerse18 =>
      'يَا أَيُّهَا الَّذِينَ آمَنُوا آمِنُوا بِاللَّهِ وَرَسُولِهِ';

  @override
  String get heroVerse19 =>
      'يَا أَيُّهَا الَّذِينَ آمَنُوا اتَّقُوا اللَّهَ وَابْتَغُوا إِلَيْهِ الْوَسِيلَةَ';

  @override
  String get heroVerse20 =>
      'إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ';

  @override
  String get heroVerse21 =>
      'وَاكْتُبْ لَنَا فِي هَٰذِهِ الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ إِنَّا هُدْنَا إِلَيْكَ';

  @override
  String get heroVerse22 =>
      'وَاذْكُرُوا اللَّهَ كَثِيرًا لَّعَلَّكُمْ تُفْلِحُونَ';

  @override
  String get heroVerse23 =>
      'قُل لَّن يُصِيبَنَا إِلَّا مَا كَتَبَ اللَّهُ لَنَا هُوَ مَوْلَانَا';

  @override
  String get heroVerse24 =>
      'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ';

  @override
  String get heroVerse25 =>
      'وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ عَلَيْهِ تَوَكَّلْتُ وَإِلَيْهِ أُنِيبُ';

  @override
  String get heroVerse26 => 'وَلَا تَيْأَسُوا مِن رَّوْحِ اللَّهِ';

  @override
  String get heroVerse27 =>
      'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ';

  @override
  String get heroVerse28 =>
      'وَإِذْ تَأَذَّنَ رَبُّكُمْ لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ';

  @override
  String get heroVerse29 => 'وَاعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ الْيَقِينُ';

  @override
  String get heroVerse30 =>
      'إِنَّ اللَّهَ مَعَ الَّذِينَ اتَّقَوا وَّالَّذِينَ هُم مُّحْسِنُونَ';

  @override
  String get focusButtonSubtitle => 'احمِ وقتك لما هو أهم';

  @override
  String get ourStories => 'قصصنا';

  @override
  String get storiesSeeAll => 'عرض الكل';

  @override
  String get storiesReadMore => 'اقرأ المزيد';

  @override
  String get storiesFeaturedLabel => 'قصة مميزة';

  @override
  String get storiesFilterReverts => 'المهتدون';

  @override
  String get storyCategoryRevert => 'مهتدٍ';

  @override
  String get storyCategoryBornMuslim => 'مسلم بالولادة';

  @override
  String get storyCategoryReturning => 'عائد';

  @override
  String get storiesShareYours => 'شارك قصتك';

  @override
  String get storiesEmptyTitle => 'لا توجد قصص بعد';

  @override
  String get storiesEmptySubtitle => 'كن أول من يشارك رحلته';

  @override
  String storyShahadaDate(Object date) {
    return 'الشهادة: $date';
  }

  @override
  String get storiesComments => 'التعليقات';

  @override
  String get storiesAddComment => 'أضف تعليقًا…';

  @override
  String get storiesAnonymous => 'مجهول';

  @override
  String get storiesNameLabel => 'اسمك';

  @override
  String get storiesPostAnonymously => 'النشر كمجهول';

  @override
  String get storiesCountryLabel => 'البلد';

  @override
  String get storiesCategoryLabel => 'الفئة';

  @override
  String get storiesShahadaDateLabel => 'تاريخ الشهادة (اختياري)';

  @override
  String get storiesYourStoryLabel => 'قصتك';

  @override
  String get storiesStoryHint => 'حدثنا عن رحلتك…';

  @override
  String get storiesChooseBackground => 'اختر خلفية';

  @override
  String get storiesBackgroundNone => 'بدون';

  @override
  String get storiesEditTitle => 'تعديل قصتك';

  @override
  String get storiesSaveChanges => 'حفظ التغييرات';

  @override
  String get storiesUpdated => 'تم تحديث قصتك';

  @override
  String get storiesUploadPhoto => 'تحميل صورة (اختياري)';

  @override
  String get storiesChangePhoto => 'تغيير الصورة';

  @override
  String get storiesSubmitButton => 'إرسال';

  @override
  String get storiesSubmitted => 'جزاك الله خيرًا! تم إرسال قصتك للمراجعة.';

  @override
  String get storiesSubmitError => 'حدث خطأ ما. حاول مرة أخرى.';

  @override
  String get storiesFillRequired => 'يرجى إضافة قصتك وبلدك.';

  @override
  String get storiesShareCardLabel => 'قصة من المجتمع';

  @override
  String get storiesPreviewLabel => 'معاينة';

  @override
  String get storiesPendingReview => 'قيد المراجعة';

  @override
  String get storiesFilterSaved => 'المحفوظة';

  @override
  String get storiesSavedEmpty => 'لا توجد قصص محفوظة بعد';

  @override
  String get storiesSearchCountryHint => 'ابحث عن بلدك…';

  @override
  String get storiesChooseAvatar => 'اختر صورة رمزية';

  @override
  String get storiesAvatarInitials => 'الأحرف الأولى';

  @override
  String get storiesAvatarIcon => 'أيقونة';

  @override
  String get storiesAvatarPattern => 'نقش';

  @override
  String get storiesLoadError => 'تعذر تحميل القصص. تحقق من اتصالك.';

  @override
  String get storiesDiscardTitle => 'هل تريد تجاهل قصتك؟';

  @override
  String get storiesDiscard => 'تجاهل';

  @override
  String get storiesKeepWriting => 'متابعة الكتابة';

  @override
  String get storiesSaveDraft => 'حفظ المسودة';

  @override
  String get storiesDraftSaved => 'تم حفظ المسودة';

  @override
  String get storiesDeleteDraft => 'حذف المسودة';

  @override
  String get storiesContinueDraft => 'أكمل مسودتك';

  @override
  String get storiesStartFresh => 'ابدأ من جديد';

  @override
  String get shareCardGlossaryLabel => '✦ المصطلحات الإسلامية';

  @override
  String get shareCardTafsirLabel => '✦ التفسير';

  @override
  String shareCardAyahRef(String number) {
    return 'الآية $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 حان وقت الفجر';

  @override
  String get prayerReminderTitleDhuhr => '☀️ حان وقت الظهر';

  @override
  String get prayerReminderTitleAsr => '🌤️ حان وقت العصر';

  @override
  String get prayerReminderTitleMaghrib => '🌅 حان وقت المغرب';

  @override
  String get prayerReminderTitleIsha => '🌙 حان وقت العشاء';

  @override
  String get prayerReminderBodyFajr => 'قُم وصلِّ. الله يجزي من استيقظ لأجله.';

  @override
  String get prayerReminderBodyDhuhr => 'خذ لحظة لله. صلاة الظهر تنتظرك.';

  @override
  String get prayerReminderBodyAsr =>
      'الصلاة الوسطى، حافظ عليها. — البقرة ٢:٢٣٨';

  @override
  String get prayerReminderBodyMaghrib => 'غربت الشمس. لبِّ نداء الله.';

  @override
  String get prayerReminderBodyIsha => 'اختم يومك مع الله. صلاة العشاء تنتظرك.';

  @override
  String get prayerAlarmMessageFajr => 'قُم وصلِّ. الله يجزي من استيقظ لأجله.';

  @override
  String get prayerAlarmMessageDhuhr => 'خذ لحظة لله. صلاة الظهر تنتظرك.';

  @override
  String get prayerAlarmMessageAsr => 'حافظ على الصلاة الوسطى. — البقرة ٢:٢٣٨';

  @override
  String get prayerAlarmMessageMaghrib => 'غربت الشمس. لبِّ نداء الله.';

  @override
  String get prayerAlarmMessageIsha => 'اختم يومك مع الله. صلاة العشاء تنتظرك.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer بعد ١٥ دقيقة';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'حان وقت الاستعداد لصلاة $prayer';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'حان وقت صلاة $prayer';
  }

  @override
  String get testNotificationTitle => '🔔 إشعار تجريبي';

  @override
  String get testNotificationBody => 'الإشعارات تعمل بشكل صحيح!';

  @override
  String get favoriteRecitersSection => 'المفضلة';

  @override
  String get favoriteRecitersLimit =>
      'يمكنك اختيار ٣ قرّاء مفضلين فقط. أزل واحدًا لإضافة آخر.';

  @override
  String get findQiblaDirection => 'تحديد اتجاه القبلة';

  @override
  String get storyMenuShare => 'مشاركة';

  @override
  String get storyMenuBookmark => 'حفظ';

  @override
  String get storyMenuReport => 'إبلاغ';

  @override
  String get reportSheetTitle => 'الإبلاغ عن هذه القصة';

  @override
  String get reportSheetSubtitle => 'ساعدنا في الحفاظ على أمان نور غارد';

  @override
  String get reportReasonInappropriate => 'محتوى غير لائق';

  @override
  String get reportReasonSpam => 'محتوى مزعج (سبام)';

  @override
  String get reportReasonHateSpeech => 'خطاب كراهية';

  @override
  String get reportReasonOther => 'أخرى';

  @override
  String get reportSubmit => 'إرسال البلاغ';

  @override
  String get reportThankYou => 'جزاك الله خيرًا — شكرًا لإبلاغك';

  @override
  String get adminMode => 'وضع المشرف';

  @override
  String get adminTitle => 'المشرف';

  @override
  String get adminTabPending => 'القصص المعلّقة';

  @override
  String get adminTabReported => 'القصص المُبلَغ عنها';

  @override
  String get adminApprove => 'قبول';

  @override
  String get adminReject => 'رفض';

  @override
  String get adminDeleteStory => 'حذف القصة';

  @override
  String get adminDismiss => 'تجاهل';

  @override
  String get adminEmptyPending => 'لا توجد قصص معلّقة';

  @override
  String get adminEmptyReports => 'لا توجد بلاغات معلّقة';
}
