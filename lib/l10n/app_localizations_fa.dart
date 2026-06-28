// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'نور گارد';

  @override
  String get assalamualaikum => 'السلام علیکم';

  @override
  String get mayAllahBlessYourDay => 'خداوند روزت را مبارک کناد';

  @override
  String get nextPrayer => 'نماز بعدی';

  @override
  String get iPrayedButton => 'نماز خواندم';

  @override
  String get todaysPrayers => 'نمازهای امروز';

  @override
  String get qibla => 'قبله';

  @override
  String get focusMode => 'حالت تمرکز';

  @override
  String get appBlocking => 'مسدودسازی برنامه';

  @override
  String get islamicCalendar => 'تقویم اسلامی';

  @override
  String get duas => 'دعاها';

  @override
  String get quran => 'قرآن';

  @override
  String get settings => 'تنظیمات';

  @override
  String get complete => 'تکمیل';

  @override
  String get streak => 'روزهای متوالی';

  @override
  String get dayStreak => 'روز متوالی';

  @override
  String get compassRequiresDevice => 'قطب‌نما به دستگاه واقعی نیاز دارد';

  @override
  String streakDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString روز',
      one: '$countString روز',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'همه نمازها کامل شد! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 نماز کامل';
  }

  @override
  String get fajr => 'فجر';

  @override
  String get dhuhr => 'ظهر';

  @override
  String get asr => 'عصر';

  @override
  String get maghrib => 'مغرب';

  @override
  String get isha => 'عشاء';

  @override
  String fardRakats(int count) {
    return '$count رکعت فرض';
  }

  @override
  String sunnahBefore(int count) {
    return '$count سنت قبل';
  }

  @override
  String sunnahAfter(int count) {
    return '$count سنت بعد';
  }

  @override
  String prayedAt(String time) {
    return 'خواندن در $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'سپیده‌دم قبل از طلوع آفتاب';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'پس از گذشتن خورشید از بالاترین نقطه';

  @override
  String get timePeriodLateAfternoon => 'اواخر بعدازظهر';

  @override
  String get timePeriodJustAfterSunset => 'درست بعد از غروب آفتاب';

  @override
  String get timePeriodNightBeforeMidnight => 'شب قبل از نیمه شب';

  @override
  String get fajrHadith =>
      'دو رکعت نماز فجر از دنیا و آنچه در آن است بهتر است. — پیامبر محمد ﷺ';

  @override
  String get fajrTip =>
      'فجر اولین نماز روز است. به ما یادآوری می‌کند که روز را با یاد خداوند آغاز کنیم.';

  @override
  String get dhuhrHadith =>
      'هر کس دوازده رکعت سنت بخواند، خداوند برای او خانه‌ای در بهشت می‌سازد.';

  @override
  String get dhuhrTip =>
      'ظهر نماز نیمروز است. لحظه‌ای عالی برای مکث در روز و ارتباط دوباره با خداوند.';

  @override
  String get asrHadith =>
      'هر کس نماز عصر را از دست بدهد، گویا اهل و مال خود را از دست داده است. — پیامبر محمد ﷺ';

  @override
  String get asrTip =>
      'عصر اغلب «نماز میانه» نامیده می‌شود. خداوند در قرآن به‌طور خاص از آن یاد کرده است (2:238).';

  @override
  String get maghribHadith => 'نماز مغرب وتر روز است.';

  @override
  String get maghribTip =>
      'مغرب نشانه پایان روزه در ماه رمضان است. درست هنگام غروب آفتاب خوانده می‌شود.';

  @override
  String get ishaHadith =>
      'هر کس نماز عشاء را با جماعت بخواند، گویا نصف شب را نماز خوانده است.';

  @override
  String get ishaTip =>
      'عشاء آخرین نماز روز است. پایان دادن روز با نماز آرامش و آسودگی می‌آورد.';

  @override
  String get newMuslimTip => 'نکته برای مسلمانان تازه';

  @override
  String get notificationsOn => 'اعلان‌ها روشن';

  @override
  String get notificationsOff => 'اعلان‌ها خاموش';

  @override
  String get preview => 'پیش‌نمایش';

  @override
  String get lockPreviewCountdown => 'در ۱ ساعت ۲۳ دقیقه  ·  ۴:۴۷ بعدازظهر';

  @override
  String get swipeUpToUnlock => 'برای باز کردن به بالا بکشید';

  @override
  String get searchSurahs => 'جستجوی سوره‌ها...';

  @override
  String get noSurahsFound => 'سوره‌ای یافت نشد';

  @override
  String get tryAgain => 'تلاش مجدد';

  @override
  String ayahs(int count) {
    return '$count آیه';
  }

  @override
  String get searchDuas => 'جستجوی دعاها...';

  @override
  String supplications(int count) {
    return '$count دعا';
  }

  @override
  String get prayerSettings => 'تنظیمات نماز';

  @override
  String get calculationMethod => 'روش محاسبه';

  @override
  String get adhanSound => 'صدای اذان';

  @override
  String get prayerNotifications => 'اعلان‌های نماز';

  @override
  String get statusOn => 'روشن';

  @override
  String get statusOff => 'خاموش';

  @override
  String get enableAllNotifications => 'فعال کردن همه اعلان‌ها';

  @override
  String get individualPrayers => 'نمازهای جداگانه';

  @override
  String get appearance => 'ظاهر';

  @override
  String get darkMode => 'حالت تاریک';

  @override
  String get language => 'زبان';

  @override
  String get aboutNoorGuard => 'درباره';

  @override
  String get version => 'نسخه برنامه';

  @override
  String get rateApp => 'امتیازدهی به نور گارد';

  @override
  String get shareApp => 'اشتراک‌گذاری نور گارد';

  @override
  String get contactSupport => 'تماس با پشتیبانی';

  @override
  String get privacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get termsOfService => 'شرایط خدمات';

  @override
  String get helpUsImprove => 'به بهبود ما کمک کنید';

  @override
  String get translationDisclaimer =>
      'ترجمه‌های ما با کمک هوش مصنوعی انجام شده است. اگر خطایی در زبانتان مشاهده کردید، خوشحال می‌شویم نظرتان را بشنویم!';

  @override
  String get privacyPromiseTitle => 'تعهد حریم خصوصی نور گارد';

  @override
  String get privacyPromiseBody =>
      'ایمانتان شخصی است. داده‌هایتان همین‌طور باقی می‌ماند. ما هرگز داده‌های شما را نمی‌فروشیم، به اشتراک نمی‌گذاریم یا از آنها کسب درآمد نمی‌کنیم. نه موقعیت مکانی شما. نه عادات نمازتان. نه نامتان.';

  @override
  String get directionToSacredHouse => 'جهت به سوی خانه مقدس';

  @override
  String towardMecca(String degrees) {
    return '$degrees° به سمت مکه';
  }

  @override
  String get defaultLocation => 'سکرامنتو، کالیفرنیا (پیش‌فرض)';

  @override
  String get prayerHistory => 'تاریخچه نماز';

  @override
  String get currentStreak => 'روزهای متوالی فعلی';

  @override
  String get longestStreak => 'طولانی‌ترین روزهای متوالی';

  @override
  String get legend => 'راهنما';

  @override
  String get allFivePrayers => 'هر ۵ نماز';

  @override
  String get partialPrayers => 'جزئی (۱–۴)';

  @override
  String get none => 'هیچ';

  @override
  String get sun => 'ش';

  @override
  String get mon => 'ی';

  @override
  String get tue => 'د';

  @override
  String get wed => 'س';

  @override
  String get thu => 'چ';

  @override
  String get fri => 'پ';

  @override
  String get sat => 'ج';

  @override
  String headingDegrees(String degrees) {
    return 'جهت $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'بارگذاری سوره‌ها ممکن نبود';

  @override
  String get connectionError =>
      'لطفاً اتصال اینترنت خود را بررسی کرده و دوباره تلاش کنید';

  @override
  String get alQuran => 'القرآن';

  @override
  String get dailySupplications => 'دعاهای روزانه';

  @override
  String get all => 'همه';

  @override
  String get noDuasFound => 'دعایی یافت نشد';

  @override
  String get january => 'ژانویه';

  @override
  String get february => 'فوریه';

  @override
  String get march => 'مارس';

  @override
  String get april => 'آوریل';

  @override
  String get may => 'مه';

  @override
  String get june => 'ژوئن';

  @override
  String get july => 'ژوئیه';

  @override
  String get august => 'اوت';

  @override
  String get september => 'سپتامبر';

  @override
  String get october => 'اکتبر';

  @override
  String get november => 'نوامبر';

  @override
  String get december => 'دسامبر';

  @override
  String get home => 'خانه';

  @override
  String get prayers => 'نمازها';

  @override
  String get more => 'بیشتر';

  @override
  String get tafsir => 'تفسیر';

  @override
  String get lockScreen => 'صفحه قفل';

  @override
  String get readAndListen => 'خواندن و گوش دادن';

  @override
  String get commentary => 'تفسیر';

  @override
  String get findDirection => 'پیدا کردن جهت';

  @override
  String get reminders => 'یادآوری‌ها';

  @override
  String get blockDistractions => 'مسدودسازی حواس‌پرتی‌ها';

  @override
  String get prayerGuard => 'محافظ نماز';

  @override
  String get importantDates => 'تاریخ‌های مهم';

  @override
  String get comingSoon => 'به زودی';

  @override
  String get morningAndEvening => 'صبح و عصر';

  @override
  String get prayer => 'نماز';

  @override
  String get foodAndDrink => 'غذا و نوشیدنی';

  @override
  String get verityWithHardship => 'بی‌شک با هر سختی آسانی است.';

  @override
  String get ashSharh946 => 'الشرح 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'بر نمازهایتان محافظت کنید، به‌ویژه نماز میانه.';

  @override
  String get alBaqarah2238 => 'البقرة 2:238';

  @override
  String get pastEvents => 'رویدادهای گذشته';

  @override
  String get upcomingEvents => 'رویدادهای آینده';

  @override
  String get today => 'امروز';

  @override
  String get next => 'بعدی';

  @override
  String hijriYearLabel(int year) {
    return '$year هجری';
  }

  @override
  String get islamicMonthMuharram => 'محرم';

  @override
  String get islamicMonthSafar => 'صفر';

  @override
  String get islamicMonthRabiAlAwwal => 'ربیع‌الاول';

  @override
  String get islamicMonthRabiAlThani => 'ربیع‌الثانی';

  @override
  String get islamicMonthJumadaAlAwwal => 'جمادی‌الاول';

  @override
  String get islamicMonthJumadaAlThani => 'جمادی‌الثانی';

  @override
  String get islamicMonthRajab => 'رجب';

  @override
  String get islamicMonthShaban => 'شعبان';

  @override
  String get islamicMonthRamadan => 'رمضان';

  @override
  String get islamicMonthShawwal => 'شوال';

  @override
  String get islamicMonthDhulQadah => 'ذوالقعده';

  @override
  String get islamicMonthDhulHijjah => 'ذوالحجه';

  @override
  String get islamicNewYear => 'سال نو اسلامی';

  @override
  String get ashura => 'عاشورا';

  @override
  String get mawlidAlNabi => 'میلاد النبی';

  @override
  String get ramadanBegins => 'آغاز رمضان';

  @override
  String get laylatAlQadr => 'لیلة القدر';

  @override
  String get eidAlFitr => 'عید الفطر';

  @override
  String get dayOfArafah => 'روز عرفه';

  @override
  String get eidAlAdha => 'عید الأضحی';

  @override
  String get active => 'فعال';

  @override
  String get focusModeSubtitle =>
      'تمرکزتان را حفظ کنید. برنامه‌هایتان تا زمان توقف مسدود هستند.';

  @override
  String get remaining => 'باقیمانده';

  @override
  String get ready => 'آماده';

  @override
  String get duration => 'مدت';

  @override
  String get minutesAbbreviation => 'دقیقه';

  @override
  String get blockedDuringFocus => 'مسدود در حین تمرکز';

  @override
  String appsBlockedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString برنامه',
      one: '$countString برنامه',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'شروع تمرکز';

  @override
  String get stopFocus => 'توقف تمرکز';

  @override
  String get alhamdulillah => 'الحمدلله!';

  @override
  String get sessionComplete => 'جلسه تکمیل شد';

  @override
  String stayedFocusedFor(String duration) {
    return 'شما برای $duration متمرکز ماندید.';
  }

  @override
  String focusSessionMinutes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString دقیقه',
      one: '$countString دقیقه',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '«و از طریق صبر و نماز کمک بخواهید.»\n— البقرة 2:45';

  @override
  String get done => 'تمام';

  @override
  String get socialMedia => 'شبکه‌های اجتماعی';

  @override
  String get entertainment => 'سرگرمی';

  @override
  String get games => 'بازی‌ها';

  @override
  String get messaging => 'پیام‌رسانی';

  @override
  String get blockDuringPrayerTimes => 'مسدود در زمان نماز';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'برنامه‌های انتخابی به‌طور خودکار\nدر تمام ۵ نماز روزانه مسدود می‌شوند.';

  @override
  String get blockedLabel => 'مسدود';

  @override
  String get blockAllApps => 'مسدود کردن همه برنامه‌ها';

  @override
  String get blockingTimingInfo =>
      'مسدودسازی ۵ دقیقه قبل از هر نماز فعال و ۱۵ دقیقه بعد از آن رفع می‌شود.';

  @override
  String get blockedDuringPrayers => 'مسدود در زمان نمازها';

  @override
  String get notBlocked => 'مسدود نشده';

  @override
  String get wuduStep1 => 'نیت';

  @override
  String get wuduStep2 => 'بسم‌الله';

  @override
  String get wuduStep3 => 'شستن دست‌ها';

  @override
  String get wuduStep4 => 'آب در دهان';

  @override
  String get wuduStep5 => 'تمیز کردن بینی';

  @override
  String get wuduStep6 => 'شستن صورت';

  @override
  String get wuduStep7 => 'شستن بازوها';

  @override
  String get wuduStep8 => 'مسح سر';

  @override
  String get wuduStep9 => 'شستن پاها';

  @override
  String get revertCorner => 'گوشه مسلمان جدید';

  @override
  String get revertCornerSubtitle => 'راهنماها و حمایت برای مسلمانان تازه';

  @override
  String get wuduGuide => 'راهنمای وضو';

  @override
  String get howToPray => 'نحوه نماز خواندن';

  @override
  String get newMuslimChecklist => 'فهرست مسلمان جدید';

  @override
  String get islamicGlossary => 'واژه‌نامه اسلامی';

  @override
  String get whyDoWe => 'چرا ما...';

  @override
  String get communityStories => 'داستان‌های جامعه';

  @override
  String get wuduGuideSubtitle => 'طهارت قبل از نماز';

  @override
  String get howToPraySubtitle => 'راهنمای گام‌به‌گام نماز';

  @override
  String get newMuslimChecklistSubtitle => 'سفر ۳۰ روزه شما';

  @override
  String get howToPrayStep1Name => 'ابتدا وضو';

  @override
  String get howToPrayStep1Instruction =>
      'وضو بگیرید تا در حالت طهارت نماز بخوانید.';

  @override
  String get howToPrayStep1Tip =>
      'اگر مطمئن نیستید، ابتدا راهنمای وضو را در مرکز مسلمانان جدید باز کنید.';

  @override
  String get howToPrayStep2Name => 'رو به قبله بایستید';

  @override
  String get howToPrayStep2Instruction =>
      'روی سجاده خود رو به قبله — جهت کعبه در مکه — بایستید. برای یافتن جهت دقیق از قطب‌نمای قبله در برنامه استفاده کنید.';

  @override
  String get howToPrayStep2Tip =>
      'اگر کمی انحراف داشتید اشکالی ندارد — خداوند نیت شما را می‌داند. بهترین تلاشتان را بکنید.';

  @override
  String get howToPrayStep3Name => 'نیت';

  @override
  String get howToPrayStep3Instruction =>
      'در قلب خود نیت نمازی که می‌خواهید بخوانید را مشخص کنید. نیازی نیست آن را با صدای بلند بگویید.';

  @override
  String get howToPrayStep3Tip =>
      'نیت شما بین شما و خداوند است. فکر ساده‌ای مانند «می‌خواهم نماز فجر برای خداوند بخوانم» کافی است.';

  @override
  String get howToPrayStep4Name => 'تکبیر (آغاز)';

  @override
  String get howToPrayStep4Instruction =>
      'هر دو دست را تا لاله گوش بالا بیاورید و بگویید «الله أکبر». این به‌طور رسمی نمازتان را آغاز می‌کند.';

  @override
  String get howToPrayStep4Tip =>
      'در طول نماز چشمان خود را به سمت پایین، به جای سجده، متمرکز نگه دارید.';

  @override
  String get howToPrayStep5Name => 'قیام (ایستادن)';

  @override
  String get howToPrayStep5Instruction =>
      'دست راست را روی دست چپ روی سینه بگذارید. سوره الفاتحه را بخوانید، سپس هر سوره کوتاه یا آیاتی که می‌دانید.';

  @override
  String get howToPrayStep5Tip =>
      'اگر هنوز سوره دیگری بلد نیستید، فقط خواندن الفاتحه در حین یادگیری قابل قبول است.';

  @override
  String get howToPrayStep6Name => 'رکوع (خم شدن)';

  @override
  String get howToPrayStep6Instruction =>
      'با کمر خم شوید، پشت موازی زمین. دست‌هایتان را روی زانوها بگذارید و سه بار «سبحان ربی العظیم» بگویید.';

  @override
  String get howToPrayStep6Tip =>
      'پشت را صاف و افقی نگه دارید — نه خمیده و نه گوژ.';

  @override
  String get howToPrayStep7Name => 'اعتدال (بازگشت از رکوع)';

  @override
  String get howToPrayStep7Instruction =>
      'از رکوع بازگردید و کاملاً بایستید. هنگام بلند شدن «سمع الله لمن حمده» بگویید، سپس «ربنا لک الحمد» بگویید.';

  @override
  String get howToPrayStep7Tip =>
      'کاملاً بایستید و یک لحظه ثابت بمانید قبل از اینکه به موضع بعدی بروید.';

  @override
  String get howToPrayStep8Name => 'سجده';

  @override
  String get howToPrayStep8Instruction =>
      'به زمین بروید، پیشانی، بینی، هر دو کف دست، زانوها و انگشتان پا را روی زمین بگذارید. سه بار «سبحان ربی الأعلی» بگویید.';

  @override
  String get howToPrayStep8Tip =>
      'هفت عضو بدن باید با زمین تماس داشته باشد: پیشانی (با بینی)، دو دست، دو زانو و دو پا.';

  @override
  String get howToPrayStep9Name => 'جلسه (نشستن بین دو سجده)';

  @override
  String get howToPrayStep9Instruction =>
      'از سجده بنشینید، پای چپ صاف و پای راست بلند. هنگام نشستن «الله أکبر» بگویید. کوتاه مکث کنید، سپس برای سجده دوم برگردید.';

  @override
  String get howToPrayStep9Tip =>
      'این نشستن کوتاه بین دو سجده جلسه نامیده می‌شود و رکن واجب نماز است.';

  @override
  String get howToPrayStep10Name => 'تکمیل رکعات';

  @override
  String get howToPrayStep10Instruction =>
      'پس از رکعت اول، بایستید و همان مراحل را برای رکعت دوم تکرار کنید. تعداد رکعات بستگی به نمازی دارد که می‌خوانید.';

  @override
  String get howToPrayStep10Tip =>
      'فجر ۲ رکعت، ظهر ۴، عصر ۴، مغرب ۳ و عشاء ۴ رکعت دارد. یک رکعت در یک زمان.';

  @override
  String get howToPrayStep11Name => 'تشهد (نشستن آخر)';

  @override
  String get howToPrayStep11Instruction =>
      'در موضع آخر نشستن، تشهد بخوانید. این اعلام ایمان است که بعد از رکعت آخر در حال نشستن می‌خوانید.';

  @override
  String get howToPrayStep11Tip =>
      'در حین تشهد، هنگامی که می‌گویید «أشهد أن لا إله إلا الله» انگشت اشاره راست را بالا بیاورید.';

  @override
  String get howToPrayStep12Name => 'تسلیم (پایان)';

  @override
  String get howToPrayStep12Instruction =>
      'سر را به راست بچرخانید و «السلام علیکم و رحمة الله» بگویید، سپس به چپ بچرخانید و تکرار کنید. نماز شما تمام شد.';

  @override
  String get howToPrayStep12Tip =>
      'بعد از نماز، لحظه‌ای برای دعا و درخواست از خداوند وقت بگذارید. این زمان زیبایی برای ارتباط با خداوند است.';

  @override
  String get checklistWeek1Title => 'هفته ۱';

  @override
  String get checklistWeek2Title => 'هفته ۲';

  @override
  String get checklistWeek3Title => 'هفته ۳';

  @override
  String get checklistWeek4Title => 'هفته ۴';

  @override
  String get checklistWeek1Item1 => 'شهادتین';

  @override
  String get checklistWeek1Item2 => 'یاد گرفتن وضو';

  @override
  String get checklistWeek1Item3 => 'یاد گرفتن الفاتحه';

  @override
  String get checklistWeek1Item4 => 'اولین نماز فجر';

  @override
  String get checklistWeek1Item5 => 'تهیه سجاده';

  @override
  String get checklistWeek1Item6 => 'پیدا کردن مسجد محلی';

  @override
  String get checklistWeek2Item1 => 'یاد گرفتن تمام ۵ وقت نماز';

  @override
  String get checklistWeek2Item2 => 'یاد گرفتن دعاهای پایه';

  @override
  String get checklistWeek2Item3 => 'مطالعه درباره پیامبر محمد';

  @override
  String get checklistWeek2Item4 => 'ارتباط با جامعه مسلمانان';

  @override
  String get checklistWeek3Item1 => 'یاد گرفتن درباره غذای حلال';

  @override
  String get checklistWeek3Item2 => 'خواندن سوره اخلاص';

  @override
  String get checklistWeek3Item3 => 'یاد گرفتن درباره رمضان';

  @override
  String get checklistWeek3Item4 => 'شروع ذکر روزانه';

  @override
  String get checklistWeek4Item1 => 'یاد گرفتن درباره زکات';

  @override
  String get checklistWeek4Item2 => 'مطالعه درباره ارکان پنجگانه';

  @override
  String get checklistWeek4Item3 => 'تنظیم اعلان‌های نماز';

  @override
  String get checklistWeek4Item4 => 'تأمل در سفرتان';

  @override
  String get wuduStep1Instruction =>
      'در قلب خود نیت وضو گرفتن برای خداوند را داشته باشید.';

  @override
  String get wuduStep1Tip =>
      'نیازی نیست آن را با صدای بلند بگویید — نیت صادقانه در قلب کافی است.';

  @override
  String get wuduStep2Instruction => 'قبل از شروع «بسم‌الله» بگویید.';

  @override
  String get wuduStep2Tip =>
      'گفتن بسم‌الله سنت است و وضوی شما را با یاد خداوند آغاز می‌کند.';

  @override
  String get wuduStep3Instruction =>
      'هر دو دست را تا مچ سه بار بشویید و مطمئن شوید آب بین انگشتان برسد.';

  @override
  String get wuduStep3Tip =>
      'با دست راست شروع کنید، سپس دست چپ. این ترتیب در اسلام توصیه شده است.';

  @override
  String get wuduStep4Instruction =>
      'آب را در دهان بگیرید، بچرخانید و بیرون بریزید. این کار را سه بار انجام دهید.';

  @override
  String get wuduStep4Tip =>
      'این دهان را تمیز می‌کند و بخشی از فرایند طهارت است.';

  @override
  String get wuduStep5Instruction =>
      'آب را به بینی بکشید و آرام بیرون دهید. این کار را سه بار انجام دهید.';

  @override
  String get wuduStep5Tip => 'با دست راست آب بکشید و با دست چپ بیرون دهید.';

  @override
  String get wuduStep6Instruction =>
      'تمام صورت خود را سه بار بشویید، از خط مو تا چانه و از گوش تا گوش.';

  @override
  String get wuduStep6Tip =>
      'مطمئن شوید که هیچ قسمتی از صورتتان خشک نمانده است.';

  @override
  String get wuduStep7Instruction =>
      'بازوی راست را از نوک انگشتان تا آرنج سه بار بشویید، سپس همین کار را با بازوی چپ انجام دهید.';

  @override
  String get wuduStep7Tip => 'در وضو همیشه از سمت راست قبل از چپ شروع کنید.';

  @override
  String get wuduStep8Instruction =>
      'دست‌هایتان را مرطوب کنید و یک بار از جلو به عقب و از عقب به جلو روی سر بکشید.';

  @override
  String get wuduStep8Tip => 'برخلاف شستن، مسح سر فقط یک بار انجام می‌شود.';

  @override
  String get wuduStep9Instruction =>
      'پای راست را تا مچ و شامل آن سه بار بشویید، سپس همین کار را با پای چپ انجام دهید.';

  @override
  String get wuduStep9Tip =>
      'مطمئن شوید آب بین انگشتان پا برسد. از انگشتتان برای تمیز کردن بین آنها استفاده کنید.';

  @override
  String get islamicGlossaryTitle => 'واژه‌نامه اسلامی';

  @override
  String get islamicGlossarySubtitle => '۵۱ اصطلاح از قرآن، سنت و علم کلاسیک';

  @override
  String get searchTermsHint => 'جستجوی اصطلاحات، عربی، تعاریف...';

  @override
  String get categoryAll => 'همه';

  @override
  String get categoryPillar => 'رکن';

  @override
  String get categoryAqeedah => 'عقیده';

  @override
  String get categoryPractice => 'عمل';

  @override
  String get categoryDhikr => 'ذکر';

  @override
  String get categoryQuran => 'قرآن';

  @override
  String get categoryHadith => 'حدیث';

  @override
  String get categoryFiqh => 'فقه';

  @override
  String get categoryHistory => 'تاریخ';

  @override
  String get noTermsFound => 'اصطلاحی یافت نشد';

  @override
  String get sourceLabel => 'منبع';

  @override
  String get revertCornerHubSubtitle =>
      'راهنمایی ملایم برای اولین قدم‌های شما به عنوان مسلمان جدید';

  @override
  String get islamicGlossaryHubSubtitle =>
      'اصطلاحات رایج به‌سادگی توضیح داده شده';

  @override
  String get whyDoWeHubSubtitle => 'حکمت پشت اعمال روزمره';

  @override
  String get communityStoriesHubSubtitle =>
      'مسلمانان جدید سفرهای خود را به اسلام به اشتراک می‌گذارند';

  @override
  String get whyDoWeScreenSubtitle => 'حکمت پشت ۱۲ عمل روزمره اسلامی';

  @override
  String get whyDoWeSourceBadge => 'منبع سنی';

  @override
  String get whyDoWeQ1 => 'چرا روزی ۵ بار نماز می‌خوانیم؟';

  @override
  String get whyDoWeA1 =>
      'خداوند نمازهای پنجگانه را در قرآن (2:238) فرمان داده است و در شب معراج (اسراء و معراج) برقرار شد. پیامبر فرمود: اولین چیزی که بنده در روز قیامت درباره آن محاسبه می‌شود نماز است. (ابن ماجه). نماز ما را در طول روز با خداوند پیوند می‌دهد.';

  @override
  String get whyDoWeQ2 => 'چرا هنگام نماز رو به مکه می‌ایستیم؟';

  @override
  String get whyDoWeA2 =>
      'خداوند در قرآن (2:144) فرمان داد: «رویتان را به سمت مسجدالحرام بگردانید.» کعبه در مکه اولین خانه‌ای است که برای پرستش خداوند ساخته شد (3:96). روبرو شدن به یک سمت همه مسلمانان جهان را در نماز متحد می‌کند.';

  @override
  String get whyDoWeQ3 => 'چرا در رمضان روزه می‌گیریم؟';

  @override
  String get whyDoWeA3 =>
      'خداوند در قرآن (2:183) روزه را فرمان داد: «ای کسانی که ایمان آوردید، روزه بر شما نوشته شد همانطور که بر پیشینیانتان نوشته شد، تا شاید تقوا پیشه کنید.» رمضان ماهی است که قرآن نازل شد (2:185).';

  @override
  String get whyDoWeQ4 => 'چرا قبل از غذا بسم‌الله می‌گوییم؟';

  @override
  String get whyDoWeA4 =>
      'پیامبر فرمود: «هرگاه یکی از شما غذا می‌خورد، باید نام خداوند را ببرد. اگر در ابتدا فراموش کرد، باید بگوید بسم‌الله أوله و آخره.» (ابوداود). این به ما یادآوری می‌کند که همه نعمت‌ها از خداوند است.';

  @override
  String get whyDoWeQ5 => 'چرا قبل از ورود به مسجد کفش‌هایمان را در می‌آوریم؟';

  @override
  String get whyDoWeA5 =>
      'هنگامی که خداوند به موسی فرمان داد: «کفش‌هایت را دربیاور، زیرا تو در وادی مقدس طوا هستی.» (قرآن 20:12). درآوردن کفش نشانه احترام به خانه خداوند است و محل نماز را تمیز نگه می‌دارد.';

  @override
  String get whyDoWeQ6 => 'چرا «السلام علیکم» را به‌عنوان احوال‌پرسی می‌گوییم؟';

  @override
  String get whyDoWeA6 =>
      'پیامبر فرمود: «به بهشت نخواهید رفت تا ایمان بیاورید، و ایمان نخواهید آورد تا یکدیگر را دوست داشته باشید. آیا چیزی به شما بگویم که یکدیگر را دوست بدارید؟ سلام را بین خود گسترش دهید.» (مسلم). این یک دعا نیز هست — شما برای آن شخص آرزوی سلامتی می‌کنید.';

  @override
  String get whyDoWeQ7 => 'چرا حج انجام می‌دهیم؟';

  @override
  String get whyDoWeA7 =>
      'حج توسط خداوند (3:97) فرمان داده شد: «زیارت این خانه بر هر کسی که توانایی داشته باشد واجب است.» این زیارت یادآور آزمایش‌های حضرت ابراهیم و خانواده‌اش است و مسلمانان هر ملتی را در عبادت متحد می‌کند.';

  @override
  String get whyDoWeQ8 => 'چرا زکات می‌دهیم؟';

  @override
  String get whyDoWeA8 =>
      'زکات رکن سوم اسلام است که در قرآن بیش از ۳۰ بار همراه با نماز ذکر شده است. پیامبر فرمود این ثروت را پاک می‌کند. زکات نابرابری را کاهش می‌دهد و به مؤمنان یادآوری می‌کند که ثروت به خداوند تعلق دارد.';

  @override
  String get whyDoWeQ9 => 'چرا بعد از عطسه الحمدلله می‌گوییم؟';

  @override
  String get whyDoWeA9 =>
      'پیامبر فرمود: «هرگاه یکی از شما عطسه زد، باید الحمدلله بگوید، و برادر یا همراهش باید یرحمک‌الله بگوید.» (بخاری). این لحظه‌ای از شکرگزاری برای نعمت سلامتی است.';

  @override
  String get whyDoWeQ10 => 'چرا زنان مسلمان حجاب می‌پوشند؟';

  @override
  String get whyDoWeA10 =>
      'خداوند در قرآن (24:31) به زنان مؤمن فرمان داده که عفت خود را حفظ کنند. حجاب عمل عبادی و اطاعت از خداوند است. بسیاری از زنان مسلمان آن را به‌عنوان منبع هویت، کرامت و ارتباط معنوی می‌پوشند.';

  @override
  String get whyDoWeQ11 =>
      'چرا از خوردن گوشت خوک و نوشیدن الکل خودداری می‌کنیم؟';

  @override
  String get whyDoWeA11 =>
      'خداوند گوشت خوک را در قرآن (2:173) و الکل را در (5:90) حرام کرده و آن را «پلیدی از کار شیطان» نامیده است. این محرمات از سلامتی، ذهن و خانواده محافظت می‌کند. دستورالعمل‌های حلال به مؤمنان کمک می‌کند طهارت جسمی و معنوی را حفظ کنند.';

  @override
  String get whyDoWeQ12 => 'چرا «ان‌شاءالله» می‌گوییم؟';

  @override
  String get whyDoWeA12 =>
      'خداوند در قرآن (18:23-24) فرمان می‌دهد: «هرگز درباره چیزی نگو: من فردا این کار را خواهم کرد، مگر اینکه اضافه کنی: اگر خداوند بخواهد.» گفتن ان‌شاءالله اعتراف به این است که تنها خداوند آینده را کنترل می‌کند و ما را فروتن نگه می‌دارد.';

  @override
  String get communityStoriesScreenSubtitle =>
      'سفرهای واقعی به اسلام از سرتاسر جهان';

  @override
  String get communityStoriesTimeLabel => 'مدت مسلمان بودن';

  @override
  String get communityStoriesShareBtn => 'داستانتان را به اشتراک بگذارید';

  @override
  String get communityStoriesShareSoon => 'به زودی — این قابلیت در راه است!';

  @override
  String get communityStory1Name => 'عایشه (سابقاً سارا)';

  @override
  String get communityStory1Location => 'تگزاس، آمریکا';

  @override
  String get communityStory1Time => '۲ سال';

  @override
  String get communityStory1Text =>
      'در حین تحقیق برای یک مقاله دانشگاهی با اسلام آشنا شدم. انتظار داشتم همان چیزی را بیابم که رسانه‌ها می‌گویند. اما به جای آن آرامش، منطق و خدایی که واقعاً معنا داشت یافتم. ۶ ماه بعد شهادتم را گرفتم. سخت‌ترین قسمت یاد گرفتن نماز نبود — گفتن به خانواده‌ام بود. اما الحمدلله، دو سال بعد مادرم خودش از من درباره اسلام سؤال می‌کند.';

  @override
  String get communityStory2Name => 'یوسف (سابقاً جیمز)';

  @override
  String get communityStory2Location => 'لندن، بریتانیا';

  @override
  String get communityStory2Time => '۴ سال';

  @override
  String get communityStory2Text =>
      'بعد از سال‌ها جستجو مسلمان شدم. مسیحیت، بودایی، الحاد — هیچ‌کدام خلأ را پر نکرد. یک همکار مسلمان مرا به نماز جمعه دعوت کرد. در پشت نشستم و تمام مدت گریه کردم. حتی نمی‌دانستم چرا. هفته بعد شهادتم را گرفتم. جامعه مانند خانواده‌ای که هرگز نمی‌دانستم به آن نیاز دارم مرا در آغوش گرفت.';

  @override
  String get communityStory3Name => 'مریم (سابقاً ماریا)';

  @override
  String get communityStory3Location => 'مکزیکوسیتی، مکزیک';

  @override
  String get communityStory3Time => '۱ سال';

  @override
  String get communityStory3Text =>
      'مسلمان بودن لاتین مانند ابرقدرت داشتن است. از طریق یک ویدیوی یوتیوب در ساعت ۲ بامداد با اسلام آشنا شدم. ساعت‌ها تماشا کردم. مفهوم توحید — اینکه خداوند یکی است، شریکی ندارد، تصویری ندارد — بسیار عمیق در من طنین انداخت. خواهران اسپانیایی‌زبانم در مسجد بلافاصله احساس خانه می‌دادند.';

  @override
  String get communityStory4Name => 'ابراهیم (سابقاً دیوید)';

  @override
  String get communityStory4Location => 'تورنتو، کانادا';

  @override
  String get communityStory4Time => '۶ سال';

  @override
  String get communityStory4Text =>
      'پسر یک کشیش بودم. سؤالاتی درباره تثلیث داشتم که کسی نمی‌توانست پاسخ دهد. وقتی برای اولین بار قرآن را خواندم، احساس کردم چیزی را می‌خوانم که قبلاً به آن ایمان داشتم. شهادتم را آرام، تنها و سپس در مسجد گرفتم. بهترین تصمیم زندگی‌ام.';

  @override
  String get communityStory5Name => 'فاطمه (سابقاً جنیفر)';

  @override
  String get communityStory5Location => 'سیدنی، استرالیا';

  @override
  String get communityStory5Time => '۳ سال';

  @override
  String get communityStory5Text =>
      'سفرم با یک حجاب آغاز شد. آن را به‌عنوان یک شوخی پوشیدم و احساس... حمایت کردم. شروع به مطالعه درباره اسلام کردم و نمی‌توانستم متوقف شوم. در عرض سه ماه شهادتم را گرفتم. مردم می‌پرسند چه چیزی را از دست دادم. می‌گویم خلأ را.';

  @override
  String get communityStory6Name => 'عمر (سابقاً کوین)';

  @override
  String get communityStory6Location => 'ژوهانسبورگ، آفریقای جنوبی';

  @override
  String get communityStory6Time => '۵ سال';

  @override
  String get communityStory6Text =>
      'در محله‌ای سخت بزرگ شدم. اسلام به من انضباط، هدف و برادری داد. اولین بار که سجده کردم، چیزی در من شکست — به بهترین شکل. گریه کردم و نمی‌توانستم توضیح دهم. حالا جوانان دیگری که راهشان به دین را می‌یابند را راهنمایی می‌کنم.';

  @override
  String get inspiredByRealStories =>
      'الهام گرفته از سفرهای واقعی مسلمانان جدید';

  @override
  String get storyFormTitle => 'داستانتان را به اشتراک بگذارید';

  @override
  String get storyFormNameLabel => 'نامتان';

  @override
  String get storyFormNameHint => 'نام، یا بنویسید «ناشناس»';

  @override
  String get storyFormCountryLabel => 'کشور';

  @override
  String get storyFormCountryHint => 'اهل کجا هستید؟';

  @override
  String get storyFormTimeLabel => 'مدت مسلمان بودن';

  @override
  String get storyFormTimeHint => 'مثلاً ۲ سال، ۶ ماه';

  @override
  String get storyFormStoryLabel => 'داستانتان';

  @override
  String get storyFormStoryHint => 'سفرتان به اسلام را به اشتراک بگذارید...';

  @override
  String get storyFormSubmitBtn => 'ارسال داستان';

  @override
  String get storyFormThankYouTitle => 'جزاک‌الله خیراً!';

  @override
  String get storyFormThankYouBody =>
      'داستانتان دریافت شد. ما همه ارسال‌ها را قبل از انتشار بررسی می‌کنیم.';

  @override
  String get storyFormRequiredError => 'لطفاً همه فیلدها را پر کنید';

  @override
  String get subtitleYourGuideToIslam => 'راهنمای شما به اسلام';

  @override
  String get beginnerMode => 'حالت مبتدی';

  @override
  String get beginnerModeSubtitle => 'نکات و راهنمایی اضافی برای مسلمانان جدید';

  @override
  String get beginnerModeOn =>
      'حالت مبتدی روشن است — نکات اضافی در سراسر برنامه نمایش داده می‌شوند';

  @override
  String get beginnerModePrayersTip =>
      'نکته: روی هر نماز ضربه بزنید تا بیشتر بدانید و نمازهای سنت را ببینید';

  @override
  String get tafsirSubtitle => 'تفسیر قرآنی';

  @override
  String get tafsirComingSoon => 'تفسیر این سوره به زودی می‌آید';

  @override
  String get tafsirNotAvailable => 'تفسیر در دسترس نیست';

  @override
  String get scholarSource => 'منبع';

  @override
  String get asbabAlNuzul => 'سبب نزول';

  @override
  String get transliteration => 'آوانگاری';

  @override
  String get selectReciter => 'انتخاب قاری';

  @override
  String get playVerse => 'پخش آیه';

  @override
  String get asmaUlHusna => 'اسماء الحسنی';

  @override
  String get asmaUlHusnaSubtitle => '۹۹ اسم زیبای خداوند';

  @override
  String get asmaHadith =>
      'خداوند ۹۹ نام دارد. هر کس آنها را حفظ کند وارد بهشت می‌شود.';

  @override
  String get asmaHadithSource => 'صحیح البخاری، ۲۷۳۶';

  @override
  String get asmaSearchHint => 'جستجوی اسامی...';

  @override
  String get asmaNoResults => 'اسمی یافت نشد';

  @override
  String get asmaSignificance => 'اهمیت';

  @override
  String get asmaUlHusnaTile => '۹۹ نام';

  @override
  String get asmaUlHusnaTileSubtitle => 'اسامی خداوند';

  @override
  String get onboardingTagline =>
      'از وقتتان محافظت کنید. نمازهایتان را گرامی بدارید.';

  @override
  String get onboardingChooseLanguage => 'زبانتان را انتخاب کنید';

  @override
  String get onboardingGetStarted => 'شروع';

  @override
  String get onboardingLocationTitle => 'اوقات نماز دقیق';

  @override
  String get onboardingLocationDesc =>
      'نور گارد برای محاسبه اوقات نماز دقیق در شهر شما به موقعیت مکانی‌تان نیاز دارد. موقعیت مکانی شما هرگز ذخیره یا به اشتراک گذاشته نمی‌شود.';

  @override
  String get onboardingPrivacyBanner =>
      'ایمانتان شخصی است. داده‌هایتان همین‌طور باقی می‌ماند.';

  @override
  String get onboardingAllowLocation => 'اجازه دسترسی به موقعیت';

  @override
  String get onboardingSkipForNow => 'فعلاً رد کنید';

  @override
  String get onboardingNotificationTitle => 'هیچ نمازی را از دست ندهید';

  @override
  String get onboardingNotificationDesc =>
      'در هر وقت نماز با یک اذان زیبا آگاه شوید. صدا و زمان‌بندی را در تنظیمات سفارشی کنید.';

  @override
  String get onboardingAdhanAlerts => 'هشدارهای اذان';

  @override
  String get onboardingCustomTiming => 'زمان‌بندی سفارشی';

  @override
  String get onboardingAdjustable => 'قابل تنظیم';

  @override
  String get onboardingEnableNotifications => 'فعال کردن اعلان‌ها';

  @override
  String get onboardingMaybeLater => 'شاید بعداً';

  @override
  String get onboardingAllSetTitle => 'همه چیز آماده است!';

  @override
  String get onboardingAllSetDesc =>
      'نور گارد آماده است وقتتان را محافظت کرده\nو روزتان را با نیت راهنمایی کند.';

  @override
  String get onboardingPrayerTimesLabel => 'اوقات نماز';

  @override
  String get onboardingPrayerTimesDesc => 'اوقات دقیق برای شهر شما';

  @override
  String get onboardingLockScreenLabel => 'صفحه قفل اسلامی';

  @override
  String get onboardingLockScreenDesc => 'قرآن و دعا در هر باز کردن قفل';

  @override
  String get onboardingPrayerGuardLabel => 'محافظ نماز';

  @override
  String get onboardingPrayerGuardDesc =>
      'برنامه‌ها به‌طور خودکار در زمان نماز مسدود می‌شوند';

  @override
  String get onboardingEnterApp => 'ورود به نور گارد';

  @override
  String get adhan => 'اذان';

  @override
  String get adhanSubtitle => 'ندای نماز';

  @override
  String get adhanDescription =>
      'اذان ندای اسلامی به نماز است که ۵ بار در روز اعلام می‌شود تا مؤمنان را به عبادت فراخواند.';

  @override
  String get makkahStyle => 'مکه';

  @override
  String get madinahStyle => 'مدینه';

  @override
  String get egyptianStyle => 'مصری';

  @override
  String get adhanPlaying => 'در حال پخش';

  @override
  String get makkahDescription => 'ندای سنتی نماز از مسجدالحرام در مکه.';

  @override
  String get madinahDescription =>
      'نسخه‌ای آرامش‌بخش به سبک مسجد النبی در مدینه.';

  @override
  String get egyptianDescription => 'اذانی با لحن مصری و قرائت غنی.';

  @override
  String get adhanCallToWorship => 'ندای نماز';

  @override
  String get adhanDescriptionFull =>
      'اذان ندای اسلامی به نماز است که ۵ بار در روز اعلام می‌شود تا مؤمنان را به عبادت فراخواند.';

  @override
  String get alafasyStyle => 'مشاری العفاسی';

  @override
  String get alaqsaStyle => 'مسجد الأقصی';

  @override
  String get turkishStyle => 'ترکی';

  @override
  String get pakistaniStyle => 'پاکستانی';

  @override
  String get indonesianStyle => 'اندونزیایی';

  @override
  String get alafasyDescription =>
      'نسخه‌ای صمیمی از قاری مشهور مشاری راشد العفاسی.';

  @override
  String get alaqsaDescription =>
      'ندای نماز طنین‌انداز از مسجد الأقصی در اورشلیم، سومین مکان مقدس اسلام.';

  @override
  String get turkishDescription =>
      'اذان سنتی ترکی با مقام موسیقایی منحصربه‌فرد.';

  @override
  String get pakistaniDescription =>
      'اذانی صمیمی به سبک آسیای جنوبی که در سرتاسر پاکستان خوانده می‌شود.';

  @override
  String get indonesianDescription =>
      'اذانی با لحن اندونزیایی که در سرتاسر این کشور محبوب است.';

  @override
  String get thisWeek => 'این هفته';

  @override
  String weeklyProgress(int count) {
    return '$count از ۳۵ نماز این هفته';
  }

  @override
  String get bestDay => 'بهترین روز';

  @override
  String get prayerStats => 'آمار نماز';

  @override
  String get completionRate => 'نرخ تکمیل';

  @override
  String get bestPrayer => 'منظم‌ترین نماز';

  @override
  String get hardestPrayer => 'بیشترین نماز فوت شده';

  @override
  String totalPrayersCompleted(int count) {
    return '$count نماز کامل';
  }

  @override
  String get last7Days => '۷ روز گذشته';

  @override
  String get thisMonth => 'این ماه';

  @override
  String get fullDays => 'روزهای کامل';

  @override
  String get partialDays => 'روزهای جزئی';

  @override
  String get missedDays => 'روزهای فوت شده';

  @override
  String get missedPrayerBadge => 'فوت شده';

  @override
  String get makeItUp => 'جبران کنید';

  @override
  String get qadaExplanation =>
      'اگر نمازی را فوت کردید، می‌توانید آن را به‌عنوان نماز قضا جبران کنید.';

  @override
  String get noStatsYet =>
      'به ثبت نمازهایتان ادامه دهید تا آماری اینجا ببینید.';

  @override
  String get notEnoughData => 'داده کافی هنوز وجود ندارد';

  @override
  String get continuousPlay => 'پیوسته';

  @override
  String get sleepTimer => 'تایمر خواب';

  @override
  String verseCount(Object total, Object verse) {
    return 'آیه $verse از $total';
  }

  @override
  String get verseTafsir => 'تفسیر آیه';

  @override
  String get tafsirOfTheDay => 'تفسیر روز';

  @override
  String get dailyInsight => 'بینش روزانه';

  @override
  String get keyThemes => 'موضوعات و درس‌های کلیدی';

  @override
  String get readFullSurah => 'خواندن کامل سوره';

  @override
  String get surahIntroduction => 'معرفی سوره';

  @override
  String get verses => 'آیات';

  @override
  String get loadingTafsir => 'در حال بارگذاری تفسیر...';

  @override
  String get keepAliveNotificationText => 'اعلان‌های نماز فعال';

  @override
  String get keepAliveChannelName => 'اعلان‌های نماز';

  @override
  String get keepAliveChannelDescription =>
      'نور گارد را در پس‌زمینه فعال نگه می‌دارد تا زنگ‌های نماز هرگز از دست نروند.';

  @override
  String get notifSetupTitle => 'فعال کردن هشدارهای صفحه قفل';

  @override
  String get notifSetupSubtitle =>
      'تا هیچ اذانی را از دست ندهید — حتی وقتی گوشی قفل است. حدود یک دقیقه طول می‌کشد.';

  @override
  String get notifSetupSamsungBanner =>
      'از سامسونگ گلکسی (شامل فولد/فلیپ) استفاده می‌کنید؟ سامسونگ کلیدهای اضافی فراتر از اندروید استاندارد دارد — مراحل ۴ و ۶ زیر دقیقاً نشان می‌دهند کجا آنها را بیابید.';

  @override
  String get notifSetupStep1Title => 'اجازه دادن اعلان‌ها';

  @override
  String get notifSetupStep1Description =>
      'مجوز پایه‌ای که نور گارد برای هشدار دادن به شما نیاز دارد.';

  @override
  String get notifSetupStep1Action => 'اجازه دادن اعلان‌ها';

  @override
  String get notifSetupStep2Title => 'زنگ‌ها و یادآوری‌ها';

  @override
  String get notifSetupStep2Description =>
      'به زنگ‌های نماز اجازه می‌دهد در دقیق وقت نماز فعال شوند، حتی در حالت ساکت یا صرفه‌جویی باتری.';

  @override
  String get notifSetupStep2Action => 'باز کردن تنظیمات زنگ';

  @override
  String get notifSetupStep3Title => 'نمایش روی برنامه‌های دیگر';

  @override
  String get notifSetupStep3Description =>
      'اجازه می‌دهد صفحه کامل نماز روی صفحه قفل و هر چیز دیگری باز شود.';

  @override
  String get notifSetupStep3Action => 'باز کردن تنظیمات';

  @override
  String get notifSetupStep4Title => 'نمایش به‌صورت پاپ‌آپ / هشدار تمام‌صفحه';

  @override
  String get notifSetupStep4Description =>
      'اجازه می‌دهد صفحه اذان از صفحه قفل خارج شود به جای اینکه به‌عنوان بنر ساکت بماند.';

  @override
  String get notifSetupStep4SamsungNote =>
      'در گوشی‌های سامسونگ گلکسی (شامل فولد/فلیپ): تنظیمات را باز کنید ← روی «زنگ وقت نماز» ضربه بزنید، سپس «اعلان پاپ‌آپ» را روشن کنید (در فولد/فلیپ «پاپ‌آپ صفحه جلد» نامیده می‌شود). این یک کلید مخصوص سامسونگ است.';

  @override
  String get notifSetupStep4Action => 'باز کردن تنظیمات اعلان';

  @override
  String get notifSetupStep5Title => 'نگه داشتن اعلان‌ها قابل اعتماد';

  @override
  String get notifSetupStep5Description =>
      'مانع می‌شود که اندروید نور گارد را در پس‌زمینه کند یا به تأخیر بیندازد تا زنگ‌های نماز همیشه به موقع برسند.';

  @override
  String get notifSetupStep5Action => 'غیرفعال کردن بهینه‌سازی باتری';

  @override
  String get notifSetupStep6Title => 'برنامه‌های هرگز خواب';

  @override
  String get notifSetupStep6Description =>
      'مدیریت باتری سامسونگ می‌تواند نور گارد را به خواب ببرد و زنگ‌های نماز را به‌طور خاموشانه مسدود کند. افزودن آن به «برنامه‌های هرگز خواب» این را متوقف می‌کند.';

  @override
  String get notifSetupStep6SamsungNote =>
      'تنظیمات ← مراقبت از باتری و دستگاه ← محدودیت‌های استفاده پس‌زمینه ← برنامه‌های هرگز خواب ← روی «+» ضربه بزنید ← نور گارد را انتخاب کنید.';

  @override
  String get notifSetupStep6Action => 'باز کردن تنظیمات باتری';

  @override
  String get notifSetupStatusChecking => 'در حال بررسی...';

  @override
  String get notifSetupStatusEnabled => 'فعال';

  @override
  String get notifSetupStatusNeeded => 'مورد نیاز';

  @override
  String get notifSetupStatusManual => 'مرحله دستی';

  @override
  String get notifSetupContinueButton => 'ادامه به نور گارد';

  @override
  String get notifSetupLaterButton => 'بعداً تمام می‌کنم';

  @override
  String get notifSetupDoneButton => 'تمام';

  @override
  String get testNotificationButton => 'ارسال اعلان آزمایشی (۱۰ ثانیه)';

  @override
  String get testNotificationSnack => 'اعلان آزمایشی در ۱۰ ثانیه می‌رسد';

  @override
  String get testLockAlarmButton => 'آزمایش زنگ قفل تمام‌صفحه (۱۰ ثانیه)';

  @override
  String get testLockAlarmSnack =>
      'زنگ قفل در ۱۰ ثانیه فعال می‌شود — الان گوشی را قفل کنید';

  @override
  String get testAdhanForegroundButton => 'آزمایش اذان داخل برنامه (پیش‌زمینه)';

  @override
  String get testAdhanForegroundSnack => 'پخش اذان کامل با بنر ساکت';

  @override
  String get testRequiresNotificationsOn =>
      'ابتدا اعلان‌های نماز را روشن کنید تا این را آزمایش کنید';

  @override
  String get lockScreenSetupGuideButton => 'راهنمای تنظیم هشدار صفحه قفل';

  @override
  String get couldNotOpenPrivacyPolicy => 'سیاست حریم خصوصی باز نشد';

  @override
  String get couldNotOpenEmailApp => 'برنامه ایمیل باز نشد';

  @override
  String get blockDurationLabel => 'مدت مسدودسازی';

  @override
  String get privacyAndTrust => 'حریم خصوصی و اعتماد';

  @override
  String get noorGuardMotto =>
      '«اگر در مسجد جایی ندارد،\nدر نور گارد هم جایی ندارد.»';

  @override
  String get openingAppStore => 'در حال باز کردن فروشگاه برنامه...';

  @override
  String get openingShareSheet => 'در حال باز کردن صفحه اشتراک‌گذاری...';

  @override
  String get openingSupportEmail => 'در حال باز کردن ایمیل پشتیبانی...';

  @override
  String get openingTermsOfService => 'در حال باز کردن شرایط خدمات...';

  @override
  String get duration30Min => '۳۰ دقیقه';

  @override
  String get duration1Hour => '۱ ساعت';

  @override
  String get durationPrayerWindowOnly => 'فقط پنجره نماز';

  @override
  String get hoursAbbreviation => 'ساعت';

  @override
  String get cancelTimerButton => 'لغو تایمر';

  @override
  String get custom => 'سفارشی';

  @override
  String get customTimerMinutesTitle => 'تایمر سفارشی (دقیقه)';

  @override
  String get customTimerHint => 'مثلاً ۲۰';

  @override
  String get cancel => 'لغو';

  @override
  String get start => 'شروع';

  @override
  String get travel => 'سفر';

  @override
  String get anxietyAndStress => 'اضطراب و استرس';

  @override
  String get gratitude => 'سپاسگزاری';

  @override
  String get protection => 'حفاظت';

  @override
  String get family => 'خانواده';

  @override
  String get forgiveness => 'بخشش';

  @override
  String get appBlockingSetupHeadline =>
      'از وقتتان محافظت کنید، نمازتان را محافظت کنید';

  @override
  String get appBlockingSetupBody =>
      'نور گارد از سرویس دسترس‌پذیری اندروید فقط برای تشخیص باز شدن برنامه مسدود شده در زمان نماز استفاده می‌کند. هرگز پیام‌ها، عکس‌ها یا اطلاعات شخصی شما را نمی‌خواند.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'دسترسی به دسترس‌پذیری اعطا شد';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'دسترسی به دسترس‌پذیری اعطا نشد';

  @override
  String get appBlockingOpenSettings => 'باز کردن تنظیمات دسترس‌پذیری';

  @override
  String get appBlockingSetupNotNow => 'الان نه';

  @override
  String get appBlockingEnableToggle => 'فعال کردن مسدودسازی برنامه';

  @override
  String get appBlockingModeLabel => 'حالت مسدودسازی';

  @override
  String get appBlockingModeSoft => 'نرم';

  @override
  String get appBlockingModeSoftDesc =>
      'فقط یادآوری ملایم — برنامه‌ها باز می‌مانند';

  @override
  String get appBlockingModeFirm => 'محکم';

  @override
  String get appBlockingModeFirmDesc =>
      'برنامه را مسدود می‌کند، با دور زدن سریع';

  @override
  String get appBlockingModeHard => 'سخت';

  @override
  String get appBlockingModeHardDesc =>
      'مسدودسازی کامل — فقط «نماز خواندم» آن را باز می‌کند';

  @override
  String get appBlockingSelectPrayersLabel => 'مسدود در این نمازها';

  @override
  String get appBlockingBufferBeforeLabel => 'شروع قبل از نماز';

  @override
  String get appBlockingBufferAfterLabel => 'رفع بعد از نماز';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count دقیقه';
  }

  @override
  String get appBlockingAppsTitle => 'برنامه‌های مسدود شده';

  @override
  String get appBlockingSelectAppsButton => 'انتخاب برنامه‌ها برای مسدودسازی';

  @override
  String get appBlockingSearchHint => 'جستجوی برنامه‌های نصب شده';

  @override
  String get appBlockingNoAppsSelected => 'هنوز هیچ برنامه‌ای انتخاب نشده';

  @override
  String appBlockingAppsSelectedCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString برنامه مسدود',
      one: '۱ برنامه مسدود',
      zero: 'هیچ برنامه‌ای مسدود نشده',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'آزمایش';

  @override
  String get appBlockingTestDescription =>
      'برای ۲ دقیقه مسدودسازی برنامه را فعال کنید تا مطمئن شوید روی این دستگاه کار می‌کند.';

  @override
  String get appBlockingTestButton => 'آزمایش مسدودسازی برنامه (۲ دقیقه)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'مسدودسازی برنامه برای ۲ دقیقه فعال است — یک برنامه مسدود شده را باز کنید';

  @override
  String get appBlockingPermissionNeeded =>
      'دسترسی به دسترس‌پذیری را روشن کنید تا مسدودسازی شروع شود';

  @override
  String get appBlockingIosComingSoonTitle => 'دسترسی به Screen Time — به زودی';

  @override
  String get appBlockingIosComingSoonBody =>
      'مسدودسازی برنامه در iOS به مجوز Screen Time اپل نیاز دارد که هنوز در حال تنظیم هستیم. به محض آماده شدن اطلاع می‌دهیم.';

  @override
  String get appBlockingHeadline1 => 'وقت نماز';

  @override
  String get appBlockingHeadline2 => 'از وقتتان محافظت کنید';

  @override
  String get appBlockingDefaultTitle => 'وقت نماز';

  @override
  String get appBlockingIPrayedButton => 'نماز خواندم';

  @override
  String get appBlockingReadAyahsButton => 'خواندن ۳ آیه';

  @override
  String get appBlockingEmergencyBypass => 'دور زدن اضطراری';

  @override
  String get appBlockingSkipForNow => 'فعلاً رد کنید';

  @override
  String get appBlockingBypassConfirmTitle => 'روزهای متوالی را پایان دهید؟';

  @override
  String get appBlockingBypassConfirmBody =>
      'دور زدن الان روزهای متوالی نمازتان را ریست می‌کند. اگر این یک اضطرار واقعی است، می‌توانید ادامه دهید.';

  @override
  String get appBlockingBypassConfirmContinue => 'به هر حال دور بزنید';

  @override
  String get appBlockingBypassConfirmCancel => 'برگرد';

  @override
  String get appBlockingSoftReminderTitle => 'یادآوری ملایم';

  @override
  String get appBlockingSoftReminderBody =>
      'وقت نماز است — شاید یک لحظه دور شوید.';

  @override
  String get quranChallengeBannerTitle => 'خواندن ۳ آیه برای باز کردن';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count از $total آیه خوانده شد';
  }

  @override
  String get quranChallengeComplete => 'آفرین — برنامه‌ها باز شدند';

  @override
  String get focusBlockHeadline1 => 'متمرکز بمانید';

  @override
  String get focusBlockHeadline2 => 'ادامه دهید';

  @override
  String get endFocusSessionButton => 'پایان جلسه تمرکز';

  @override
  String get focusPaused => 'به خاطر نماز متوقف شد';

  @override
  String get selectLocationTitle => 'انتخاب موقعیت';

  @override
  String get useCurrentLocation => 'استفاده از موقعیت فعلی';

  @override
  String get savedLocationsHeader => 'موقعیت‌های ذخیره شده';

  @override
  String get noSavedLocationsYet =>
      'هنوز موقعیتی ذخیره نشده. برای افزودن زیر جستجو کنید.';

  @override
  String get searchCityHint => 'جستجوی نام شهر...';

  @override
  String get addLocationTooltip => 'افزودن موقعیت';

  @override
  String get deleteLocationTooltip => 'حذف موقعیت';

  @override
  String get locationNotFound => 'موقعیت پیدا نشد. جستجوی دیگری امتحان کنید.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'می‌توانید تا $max موقعیت ذخیره کنید';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'تغییر تأیید نشد — لطفاً دوباره تلاش کنید';

  @override
  String get tasbihCounter => 'تسبیح‌گو';

  @override
  String get tasbihCounterSubtitle => 'ذکرهایتان را بشمارید';

  @override
  String get tasbihResetButton => 'ریست';

  @override
  String get tasbihTotalLabel => 'مجموع';

  @override
  String get tasbihCelebrationTitle => 'تسبیح کامل شد!';

  @override
  String get tasbihCelebrationBody =>
      'همه ۹۹ ذکر را کامل کردید. خداوند ذکرتان را قبول کند.';

  @override
  String get tasbihStartNewSession => 'شروع جلسه جدید';

  @override
  String get tasbihUndoButton => 'لغو';

  @override
  String get tasbihTapAnywhereHint => 'برای شمردن روی هر جای صفحه ضربه بزنید';

  @override
  String get tasbihSoundToggleTooltip => 'صدای ضربه';

  @override
  String get tasbihManageDhikrTooltip => 'مدیریت ذکرها';

  @override
  String get tasbihStatsTooltip => 'مشاهده آمار';

  @override
  String get tasbihDailyTotalLabel => 'مجموع امروز';

  @override
  String get tasbihRoundsTodayLabel => 'دورهای امروز';

  @override
  String get tasbihManageDhikrTitle => 'مدیریت ذکرها';

  @override
  String get tasbihAddCustomDhikrButton => 'افزودن ذکر سفارشی';

  @override
  String get tasbihDeleteDhikrTooltip => 'حذف';

  @override
  String get tasbihBuiltInDhikrBadge => 'داخلی';

  @override
  String get tasbihCannotDeleteLastDhikr => 'به حداقل یک ذکر نیاز دارید';

  @override
  String get tasbihDhikrNameLabel => 'نام';

  @override
  String get tasbihDhikrNameHint => 'مثلاً استغفرالله';

  @override
  String get tasbihDhikrArabicLabel => 'عربی (اختیاری)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'لطفاً یک نام وارد کنید';

  @override
  String get tasbihSaveDhikrButton => 'ذخیره';

  @override
  String get tasbihStatsTitle => 'آمار تسبیح';

  @override
  String get tasbihAllTimeTotalLabel => 'مجموع کل';

  @override
  String get tasbihNoActivityYetMessage =>
      'شروع به شمردن کنید تا آمارتان را اینجا ببینید.';

  @override
  String get tasbihSoundPickerTitle => 'صدای ضربه';

  @override
  String get tasbihSoundClassicClick => 'کلیک کلاسیک';

  @override
  String get tasbihSoundSoftChime => 'زنگ ملایم';

  @override
  String get tasbihSoundStoneTap => 'ضربه سنگ';

  @override
  String get tasbihCurrentlyReciting => 'در حال ذکر';

  @override
  String tasbihOfTarget(int target) {
    return 'از $target';
  }

  @override
  String get tasbihSoundRainDrop => 'قطره باران';

  @override
  String get tasbihSoundSoftFeather => 'پر نرم';

  @override
  String noAyahsFound(String query) {
    return 'هیچ آیه‌ای برای \"$query\" یافت نشد';
  }

  @override
  String get trySearchingQuran =>
      'به فارسی، انگلیسی یا عربی جستجو کنید یا از اصطلاح اسلامی استفاده کنید:';

  @override
  String get loadingQuranIndex => 'در حال بارگذاری فهرست قرآن…';

  @override
  String get quranSearchSuggestions =>
      'صبر, رحمت, نماز, عبادت, بخشش, توبه, بهشت, دانش, دعا, ذکر';

  @override
  String get heroVerse1 => 'نمازها را به‌ویژه نماز میانه را نگه دارید.';

  @override
  String get heroVerse2 => 'همانا نماز بر مؤمنان در وقت‌های معین واجب شده است.';

  @override
  String get heroVerse3 => 'از صبر و نماز یاری بجویید.';

  @override
  String get heroVerse4 =>
      'پس مرا یاد کنید تا شما را یاد کنم. و سپاسگزار من باشید و کفران نعمت نکنید.';

  @override
  String get heroVerse5 => 'هر کس بر خدا توکل کند، او برای او کافی است.';

  @override
  String get heroVerse6 =>
      'همانا اولین خانه‌ای که برای مردم بنا شد همان است که در مکه است، مبارک و هدایتی برای جهانیان.';

  @override
  String get heroVerse7 =>
      'همانا نماز از زشتی‌ها و ناشایسته‌ها باز می‌دارد، و ذکر خدا بزرگ‌تر است.';

  @override
  String get heroVerse8 => 'آگاه باشید که دل‌ها تنها با یاد خدا آرام می‌گیرند.';

  @override
  String get heroVerse9 => 'مرا بخوانید تا اجابت کنم شما را.';

  @override
  String get heroVerse10 => 'اگر سپاسگزار باشید قطعاً بر نعمت شما می‌افزایم.';

  @override
  String get heroVerse11 =>
      'خداوند هیچ کس را جز به اندازه توانش تکلیف نمی‌کند.';

  @override
  String get heroVerse12 => 'همانا خداوند با صابران است.';

  @override
  String get heroVerse13 => 'رحمت من همه چیز را فرا گرفته است.';

  @override
  String get heroVerse14 => 'نیکی کنید که خداوند نیکوکاران را دوست دارد.';

  @override
  String get heroVerse15 =>
      'این کتابی است که هیچ شکی در آن نیست، هدایتی برای پرهیزکاران.';

  @override
  String get accuracyHigh => 'دقت بالا';

  @override
  String get accuracyMedium => 'دقت متوسط';

  @override
  String get accuracyLow => 'دقت پایین';

  @override
  String get accuracyCalibrating => 'در حال کالیبراسیون…';

  @override
  String get compassNeedsCalibration => 'قطب‌نما نیاز به کالیبراسیون دارد';

  @override
  String get compassCalibrationHint =>
      'برای بهبود دقت، گوشی خود را به آرامی به شکل عدد ۸ حرکت دهید.';

  @override
  String get spiritLevelLabel => 'تراز';

  @override
  String get spiritLevelLevelText => '✓  تراز';

  @override
  String get spiritLevelTiltText => 'کج کنید تا تراز شود';

  @override
  String get compassNorth => 'ش';

  @override
  String get compassEast => 'خ';

  @override
  String get compassSouth => 'ج';

  @override
  String get compassWest => 'با';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'از وقتت محافظت کن. نمازت را احترام بگذار.';

  @override
  String get stopAdhan => 'توقف اذان';

  @override
  String get duasSearchEmpty =>
      'دسته‌بندی یا عبارت جستجوی دیگری را امتحان کنید.';

  @override
  String get onboardingSkip => 'رد شدن';

  @override
  String get onboardingWelcomeTo => 'خوش آمدید به';

  @override
  String get onboardingSubtitle => 'یارو گسار شما در سفر زیبای اسلام.';

  @override
  String get onboardingLetsGetStarted => 'شروع کنیم';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step از $total';
  }

  @override
  String get onboardingWhatsYourName => 'نام شما چیست؟';

  @override
  String get onboardingNameSubtitle =>
      'دوست داریم بدانیم چطور شما را خطاب کنیم.';

  @override
  String get onboardingNameHint => 'نام خود را وارد کنید';

  @override
  String get onboardingContinue => 'ادامه';

  @override
  String get onboardingAreYouNewToIslam => 'آیا با اسلام تازه آشنا شده‌اید؟';

  @override
  String get onboardingModeSubtitle =>
      'تجربه شما را بر اساس مسیرتان شخصی‌سازی می‌کنیم.';

  @override
  String get onboardingNewToIslam => 'من تازه مسلمان شده‌ام';

  @override
  String get onboardingNewToIslamDesc => 'حالت مبتدی با راهنمای گام به گام';

  @override
  String get onboardingFamiliarWithIslam => 'با اسلام آشنا هستم';

  @override
  String get onboardingFamiliarWithIslamDesc => 'حالت عادی با تمام ویژگی‌ها';

  @override
  String greetingWithName(String name) {
    return 'سلام، $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'روز $days به‌عنوان مسلمان';
  }

  @override
  String get beginnerEssential1 => 'راهنمای مسلمان جدید';

  @override
  String get beginnerEssential2 => 'یادگیری وضو';

  @override
  String get beginnerEssential3 => 'نحوه نماز (گام به گام)';

  @override
  String get beginnerEssential4 => 'سوره الفاتحه';

  @override
  String get beginnerEssential5 => 'دعاهای روزانه';

  @override
  String get beginnerEssential6 => 'درک شهادتین';

  @override
  String get beginnerEssential7 => 'اصطلاحات اسلامی و واژه‌نامه';

  @override
  String get beginnerExploreAll => 'کشف همه ویژگی‌ها';

  @override
  String get beginnerExploreSubtitle => 'به تجربه کامل Noor Guard بروید';

  @override
  String get beginnerLearnSalah => 'یادگیری نماز';

  @override
  String get beginnerMayAllahGuide =>
      'خداوند گام‌های شما را هدایت کند و سفرتان را برکت دهد.';

  @override
  String get beginnerMuslimEssentials => 'اصول مسلمان';

  @override
  String get beginnerQuote1 => 'به‌راستی با هر سختی آسانی است. — قرآن ۹۴:۶';

  @override
  String get beginnerQuote2 => 'حق الله را رعایت کن، تا خداوند تو را نگه دارد.';

  @override
  String get beginnerQuote3 =>
      'خداوند به چهره و ثروت شما نمی‌نگرد، بلکه به دل‌ها و اعمال شما می‌نگرد.';

  @override
  String get beginnerQuote4 => 'هر قدم به سوی نماز، قدمی به سوی آرامش است.';

  @override
  String get beginnerQuote5 =>
      'بهترین شما کسی است که قرآن را یاد می‌گیرد و یاد می‌دهد.';

  @override
  String get beginnerTapToSetShahadaDate => 'برای تنظیم تاریخ شهادت ضربه بزنید';

  @override
  String get beginnerToolboxSection => 'جعبه‌ابزار مبتدی';

  @override
  String get beginnerYourJourney => 'سفر شما';
}
