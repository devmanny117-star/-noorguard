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
  String get islamicMonthRabiAlAwwal => 'ربيع الأول';

  @override
  String get islamicMonthRamadan => 'رمضان';

  @override
  String get islamicMonthShawwal => 'شوال';

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
}
