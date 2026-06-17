// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'আস-সালামু আলাইকুম';

  @override
  String get mayAllahBlessYourDay => 'আল্লাহ আপনার দিনটি বরকতময় করুন';

  @override
  String get nextPrayer => 'পরবর্তী নামাজ';

  @override
  String get todaysPrayers => 'আজকের নামাজ';

  @override
  String get qibla => 'কিবলা';

  @override
  String get focusMode => 'ফোকাস মোড';

  @override
  String get appBlocking => 'অ্যাপ ব্লকিং';

  @override
  String get islamicCalendar => 'ইসলামিক ক্যালেন্ডার';

  @override
  String get duas => 'দোয়া';

  @override
  String get quran => 'কুরআন';

  @override
  String get settings => 'সেটিংস';

  @override
  String get complete => 'সম্পন্ন করুন';

  @override
  String get streak => 'ধারাবাহিকতা';

  @override
  String get dayStreak => 'দিনের ধারাবাহিকতা';

  @override
  String get compassRequiresDevice =>
      'কম্পাসের জন্য একটি প্রকৃত ডিভাইস প্রয়োজন';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিন',
      one: '$count দিন',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'সব নামাজ সম্পন্ন হয়েছে! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/৫ নামাজ সম্পন্ন';
  }

  @override
  String get fajr => 'ফজর';

  @override
  String get dhuhr => 'যোহর';

  @override
  String get asr => 'আসর';

  @override
  String get maghrib => 'মাগরিব';

  @override
  String get isha => 'এশা';

  @override
  String fardRakats(int count) {
    return '$count ফরজ রাকাত';
  }

  @override
  String sunnahBefore(int count) {
    return '$count সুন্নত আগে';
  }

  @override
  String sunnahAfter(int count) {
    return '$count সুন্নত পরে';
  }

  @override
  String prayedAt(String time) {
    return '$time এ পড়া হয়';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'সূর্যোদয়ের আগে ভোরবেলা';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'সূর্য তার সর্বোচ্চ বিন্দু অতিক্রম করার পর';

  @override
  String get timePeriodLateAfternoon => 'বিকেলের শেষভাগে';

  @override
  String get timePeriodJustAfterSunset => 'সূর্যাস্তের ঠিক পরে';

  @override
  String get timePeriodNightBeforeMidnight => 'মধ্যরাতের আগে রাতে';

  @override
  String get fajrHadith =>
      'ফজরের দুই রাকাত দুনিয়া ও তার মধ্যে যা কিছু আছে তার চেয়ে উত্তম। — নবী মুহাম্মাদ ﷺ';

  @override
  String get fajrTip =>
      'ফজর দিনের প্রথম নামাজ। এটি আমাদের আল্লাহর স্মরণে দিন শুরু করার কথা মনে করিয়ে দেয়।';

  @override
  String get dhuhrHadith =>
      'যে ব্যক্তি বারো রাকাত সুন্নত নামাজ পড়বে, আল্লাহ তার জন্য জান্নাতে একটি ঘর তৈরি করবেন।';

  @override
  String get dhuhrTip =>
      'যোহর দুপুরের নামাজ। দিনের মাঝখানে থেমে আবার আল্লাহর সাথে সংযোগ স্থাপনের জন্য এটি একটি উপযুক্ত মুহূর্ত।';

  @override
  String get asrHadith =>
      'যে ব্যক্তি আসরের নামাজ ছেড়ে দেয়, যেন সে তার পরিবার ও সম্পদ হারিয়ে ফেলল। — নবী মুহাম্মাদ ﷺ';

  @override
  String get asrTip =>
      'আসরকে প্রায়ই মধ্যবর্তী নামাজ বলা হয়। আল্লাহ কুরআনে (২:২৩৮) বিশেষভাবে এর উল্লেখ করেছেন।';

  @override
  String get maghribHadith => 'মাগরিবের নামাজ হলো দিনের বিতর।';

  @override
  String get maghribTip =>
      'মাগরিব রমজানে রোজার দিনের সমাপ্তি চিহ্নিত করে। সূর্যাস্তের ঠিক সময়েই এটি পড়া হয়।';

  @override
  String get ishaHadith =>
      'যে ব্যক্তি জামাতে এশার নামাজ পড়ে, যেন সে অর্ধেক রাত নামাজে কাটাল।';

  @override
  String get ishaTip =>
      'এশা দিনের শেষ নামাজ। নামাজের মাধ্যমে দিন শেষ করলে শান্তি ও পরিপূর্ণতা আসে।';

  @override
  String get newMuslimTip => 'নওমুসলিমদের জন্য পরামর্শ';

  @override
  String get notificationsOn => 'নোটিফিকেশন চালু';

  @override
  String get notificationsOff => 'নোটিফিকেশন বন্ধ';

  @override
  String get preview => 'প্রিভিউ';

  @override
  String get lockPreviewCountdown => '১ ঘণ্টা ২৩ মিনিটে  ·  বিকাল ৪:৪৭';

  @override
  String get swipeUpToUnlock => 'আনলক করতে উপরে সোয়াইপ করুন';

  @override
  String get searchSurahs => 'সূরা খুঁজুন…';

  @override
  String get noSurahsFound => 'কোনো সূরা পাওয়া যায়নি';

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String ayahs(int count) {
    return '$count আয়াত';
  }

  @override
  String get searchDuas => 'দোয়া খুঁজুন…';

  @override
  String supplications(int count) {
    return '$countটি দোয়া';
  }

  @override
  String get prayerSettings => 'নামাজের সেটিংস';

  @override
  String get calculationMethod => 'হিসাব পদ্ধতি';

  @override
  String get adhanSound => 'আজানের শব্দ';

  @override
  String get prayerNotifications => 'নামাজের নোটিফিকেশন';

  @override
  String get appearance => 'চেহারা';

  @override
  String get darkMode => 'ডার্ক মোড';

  @override
  String get language => 'ভাষা';

  @override
  String get aboutNoorGuard => 'অ্যাপ সম্পর্কে';

  @override
  String get version => 'অ্যাপের সংস্করণ';

  @override
  String get rateApp => 'Noor Guard রেট করুন';

  @override
  String get shareApp => 'Noor Guard শেয়ার করুন';

  @override
  String get contactSupport => 'সাপোর্টের সাথে যোগাযোগ করুন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get termsOfService => 'ব্যবহারের শর্তাবলী';

  @override
  String get helpUsImprove => 'আমাদের উন্নতিতে সাহায্য করুন';

  @override
  String get translationDisclaimer =>
      'আমাদের অনুবাদগুলো এআই-এর সহায়তায় করা হয়েছে। আপনার ভাষায় কোনো ভুল দেখলে আমরা আপনার মতামত জানতে চাই!';

  @override
  String get privacyPromiseTitle => 'Noor Guard-এর গোপনীয়তার প্রতিশ্রুতি';

  @override
  String get privacyPromiseBody =>
      'আপনার দ্বীন একান্ত ব্যক্তিগত। আপনার তথ্যও তাই। আমরা কখনো আপনার তথ্য বিক্রি, শেয়ার বা মুনাফার জন্য ব্যবহার করি না। না আপনার অবস্থান। না আপনার নামাজের অভ্যাস। না আপনার নাম।';

  @override
  String get directionToSacredHouse => 'পবিত্র ঘরের দিক';

  @override
  String towardMecca(String degrees) {
    return 'মক্কার দিকে $degrees°';
  }

  @override
  String get defaultLocation => 'স্যাক্রামেন্টো, ক্যালিফোর্নিয়া (ডিফল্ট)';

  @override
  String get prayerHistory => 'নামাজের ইতিহাস';

  @override
  String get currentStreak => 'বর্তমান ধারাবাহিকতা';

  @override
  String get longestStreak => 'দীর্ঘতম ধারাবাহিকতা';

  @override
  String get legend => 'সূচক';

  @override
  String get allFivePrayers => 'সব ৫ ওয়াক্ত নামাজ';

  @override
  String get partialPrayers => 'আংশিক (১–৪)';

  @override
  String get none => 'কোনোটিই নয়';

  @override
  String get sun => 'রবি';

  @override
  String get mon => 'সোম';

  @override
  String get tue => 'মঙ্গল';

  @override
  String get wed => 'বুধ';

  @override
  String get thu => 'বৃহস্পতি';

  @override
  String get fri => 'শুক্র';

  @override
  String get sat => 'শনি';

  @override
  String headingDegrees(String degrees) {
    return 'দিক $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'সূরা লোড করা যায়নি';

  @override
  String get connectionError =>
      'অনুগ্রহ করে আপনার ইন্টারনেট সংযোগ পরীক্ষা করে আবার চেষ্টা করুন';

  @override
  String get alQuran => 'আল-কুরআন';

  @override
  String get dailySupplications => 'দৈনিক দোয়া';

  @override
  String get all => 'সব';

  @override
  String get noDuasFound => 'কোনো দোয়া পাওয়া যায়নি';

  @override
  String get january => 'জানুয়ারি';

  @override
  String get february => 'ফেব্রুয়ারি';

  @override
  String get march => 'মার্চ';

  @override
  String get april => 'এপ্রিল';

  @override
  String get may => 'মে';

  @override
  String get june => 'জুন';

  @override
  String get july => 'জুলাই';

  @override
  String get august => 'আগস্ট';

  @override
  String get september => 'সেপ্টেম্বর';

  @override
  String get october => 'অক্টোবর';

  @override
  String get november => 'নভেম্বর';

  @override
  String get december => 'ডিসেম্বর';

  @override
  String get home => 'হোম';

  @override
  String get prayers => 'নামাজ';

  @override
  String get more => 'আরও';

  @override
  String get tafsir => 'তাফসীর';

  @override
  String get lockScreen => 'লক স্ক্রিন';

  @override
  String get readAndListen => 'পড়ুন ও শুনুন';

  @override
  String get commentary => 'ব্যাখ্যা';

  @override
  String get findDirection => 'দিক নির্ণয় করুন';

  @override
  String get reminders => 'রিমাইন্ডার';

  @override
  String get blockDistractions => 'মনোযোগ নষ্টকারী জিনিস ব্লক করুন';

  @override
  String get prayerGuard => 'নামাজের প্রহরী';

  @override
  String get importantDates => 'গুরুত্বপূর্ণ তারিখ';

  @override
  String get comingSoon => 'শীঘ্রই আসছে';

  @override
  String get morningAndEvening => 'সকাল ও সন্ধ্যা';

  @override
  String get prayer => 'নামাজ';

  @override
  String get foodAndDrink => 'খাবার ও পানীয়';

  @override
  String get verityWithHardship => 'নিশ্চয়ই কষ্টের সাথে স্বস্তি রয়েছে।';

  @override
  String get ashSharh946 => 'আশ-শারহ ৯৪:৬';

  @override
  String get guardStrictlyYourPrayers =>
      'তোমরা তোমাদের নামাজসমূহের যত্ন নাও, বিশেষত মধ্যবর্তী নামাজের।';

  @override
  String get alBaqarah2238 => 'আল-বাকারা ২:২৩৮';

  @override
  String get pastEvents => 'অতীত অনুষ্ঠান';

  @override
  String get upcomingEvents => 'আসন্ন অনুষ্ঠান';

  @override
  String get today => 'আজ';

  @override
  String get next => 'পরবর্তী';

  @override
  String hijriYearLabel(int year) {
    return '$year হিজরি';
  }

  @override
  String get islamicMonthMuharram => 'মুহাররম';

  @override
  String get islamicMonthRabiAlAwwal => 'রবিউল আউয়াল';

  @override
  String get islamicMonthRamadan => 'রমজান';

  @override
  String get islamicMonthShawwal => 'শাওয়াল';

  @override
  String get islamicMonthDhulHijjah => 'জিলহজ';

  @override
  String get islamicNewYear => 'ইসলামিক নববর্ষ';

  @override
  String get ashura => 'আশুরা';

  @override
  String get mawlidAlNabi => 'মিলাদুন্নবী';

  @override
  String get ramadanBegins => 'রমজান শুরু';

  @override
  String get laylatAlQadr => 'লাইলাতুল কদর';

  @override
  String get eidAlFitr => 'ঈদুল ফিতর';

  @override
  String get dayOfArafah => 'আরাফার দিন';

  @override
  String get eidAlAdha => 'ঈদুল আযহা';

  @override
  String get active => 'সক্রিয়';

  @override
  String get focusModeSubtitle =>
      'আপনার মনোযোগ সুরক্ষিত রাখুন। আপনি সেশন বন্ধ না করা পর্যন্ত আপনার অ্যাপগুলো ব্লক থাকবে।';

  @override
  String get remaining => 'বাকি আছে';

  @override
  String get ready => 'প্রস্তুত';

  @override
  String get duration => 'সময়কাল';

  @override
  String get minutesAbbreviation => 'মিনিট';

  @override
  String get blockedDuringFocus => 'ফোকাসের সময় ব্লক করা';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অ্যাপ',
      one: '$countটি অ্যাপ',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'ফোকাস শুরু করুন';

  @override
  String get stopFocus => 'ফোকাস বন্ধ করুন';

  @override
  String get alhamdulillah => 'আলহামদুলিল্লাহ!';

  @override
  String get sessionComplete => 'সেশন সম্পন্ন হয়েছে';

  @override
  String stayedFocusedFor(String duration) {
    return 'আপনি $duration ধরে মনোযোগী ছিলেন।';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count মিনিট',
      one: '$count মিনিট',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"আর তোমরা ধৈর্য ও নামাজের মাধ্যমে সাহায্য প্রার্থনা করো।\"\n— আল-বাকারা ২:৪৫';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get socialMedia => 'সোশ্যাল মিডিয়া';

  @override
  String get entertainment => 'বিনোদন';

  @override
  String get games => 'গেমস';

  @override
  String get messaging => 'মেসেজিং';

  @override
  String get blockDuringPrayerTimes => 'নামাজের সময় ব্লক করুন';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'নির্বাচিত অ্যাপগুলো প্রতিদিনের ৫ ওয়াক্ত নামাজের সময়\nস্বয়ংক্রিয়ভাবে ব্লক হয়ে যাবে।';

  @override
  String get blockedLabel => 'ব্লক করা হয়েছে';

  @override
  String get blockAllApps => 'সব অ্যাপ ব্লক করুন';

  @override
  String get blockingTimingInfo =>
      'প্রতিটি নামাজের ৫ মিনিট আগে ব্লকিং সক্রিয় হয় এবং ১৫ মিনিট পরে উঠে যায়।';

  @override
  String get blockedDuringPrayers => 'নামাজের সময় ব্লক করা হয়েছে';

  @override
  String get notBlocked => 'ব্লক করা হয়নি';

  @override
  String get wuduStep1 => 'নিয়ত';

  @override
  String get wuduStep2 => 'বিসমিল্লাহ';

  @override
  String get wuduStep3 => 'হাত ধোয়া';

  @override
  String get wuduStep4 => 'মুখ কুলি করা';

  @override
  String get wuduStep5 => 'নাক পরিষ্কার করা';

  @override
  String get wuduStep6 => 'মুখমণ্ডল ধোয়া';

  @override
  String get wuduStep7 => 'হাত ধোয়া (কনুই পর্যন্ত)';

  @override
  String get wuduStep8 => 'মাথা মাসেহ করা';

  @override
  String get wuduStep9 => 'পা ধোয়া';

  @override
  String get revertCorner => 'নওমুসলিম কর্নার';

  @override
  String get revertCornerSubtitle => 'নওমুসলিমদের জন্য নির্দেশিকা ও সহায়তা';

  @override
  String get wuduGuide => 'অজুর নিয়ম';

  @override
  String get howToPray => 'নামাজ পড়ার নিয়ম';

  @override
  String get newMuslimChecklist => 'নওমুসলিম চেকলিস্ট';

  @override
  String get islamicGlossary => 'ইসলামিক পরিভাষা অভিধান';

  @override
  String get whyDoWe => 'আমরা কেন করি...';

  @override
  String get communityStories => 'সম্প্রদায়ের গল্প';

  @override
  String get wuduGuideSubtitle => 'নামাজের আগে পবিত্রতা অর্জন';

  @override
  String get howToPraySubtitle => 'ধাপে ধাপে নামাজের নির্দেশিকা';

  @override
  String get newMuslimChecklistSubtitle => 'আপনার ৩০ দিনের যাত্রা';

  @override
  String get howToPrayStep1Name => 'প্রথমে অজু';

  @override
  String get howToPrayStep1Instruction =>
      'নামাজ শুরু করার আগে পবিত্র অবস্থায় থাকার জন্য অজু করুন।';

  @override
  String get howToPrayStep1Tip =>
      'যদি নিশ্চিত না হন, প্রথমে নওমুসলিম হাব থেকে অজুর নিয়ম দেখে নিন।';

  @override
  String get howToPrayStep2Name => 'কিবলামুখী হয়ে দাঁড়ান';

  @override
  String get howToPrayStep2Instruction =>
      'আপনার জায়নামাজে কিবলামুখী হয়ে দাঁড়ান — মক্কার কাবা শরীফের দিক। সঠিক দিক জানতে অ্যাপের কিবলা কম্পাস ব্যবহার করুন।';

  @override
  String get howToPrayStep2Tip =>
      'যদি সামান্য দিক বিচ্যুত হয়, তাতে কোনো সমস্যা নেই — আল্লাহ আপনার নিয়ত জানেন। যথাসাধ্য চেষ্টা করুন।';

  @override
  String get howToPrayStep3Name => 'নিয়ত (ইচ্ছা)';

  @override
  String get howToPrayStep3Instruction =>
      'যে নামাজ পড়তে যাচ্ছেন তার জন্য মনে মনে নিয়ত করুন। উচ্চস্বরে বলার প্রয়োজন নেই।';

  @override
  String get howToPrayStep3Tip =>
      'আপনার নিয়ত আপনার ও আল্লাহর মধ্যকার বিষয়। \'আমি আল্লাহর জন্য ফজরের নামাজ পড়ছি\' — এই সাধারণ চিন্তাই যথেষ্ট।';

  @override
  String get howToPrayStep4Name => 'তাকবীর (শুরু)';

  @override
  String get howToPrayStep4Instruction =>
      'উভয় হাত কানের লতি পর্যন্ত তুলে \'আল্লাহু আকবার\' (আল্লাহ সর্বশ্রেষ্ঠ) বলুন। এর মাধ্যমে আপনার নামাজ আনুষ্ঠানিকভাবে শুরু হয়।';

  @override
  String get howToPrayStep4Tip =>
      'পুরো নামাজ জুড়ে আপনার দৃষ্টি নিচের দিকে সিজদার স্থানের দিকে রাখুন।';

  @override
  String get howToPrayStep5Name => 'কিয়াম (দাঁড়ানো)';

  @override
  String get howToPrayStep5Instruction =>
      'ডান হাত বাম হাতের ওপর বুকের কাছে রাখুন। সূরা আল-ফাতিহা পড়ুন এবং তারপর আপনার জানা যেকোনো ছোট সূরা বা আয়াত পড়ুন।';

  @override
  String get howToPrayStep5Tip =>
      'যদি এখনো অন্য কোনো সূরা না জানেন, শেখার সময় শুধু আল-ফাতিহা পড়াই গ্রহণযোগ্য।';

  @override
  String get howToPrayStep6Name => 'রুকু (ঝুঁকা)';

  @override
  String get howToPrayStep6Instruction =>
      'কোমর থেকে ঝুঁকে পিঠ মেঝের সমান্তরাল করুন। হাত হাঁটুর ওপর রেখে তিনবার \'সুবহানা রাব্বিয়াল আজীম\' বলুন।';

  @override
  String get howToPrayStep6Tip =>
      'পিঠ সোজা ও সমতল রাখুন — বাঁকা বা গোল করবেন না।';

  @override
  String get howToPrayStep7Name => 'ইতিদাল (রুকু থেকে উঠা)';

  @override
  String get howToPrayStep7Instruction =>
      'রুকু থেকে উঠে সোজা হয়ে দাঁড়ান। উঠার সময় \'সামি আল্লাহু লিমান হামিদাহ\' বলুন, তারপর \'রাব্বানা লাকাল হামদ\' বলুন।';

  @override
  String get howToPrayStep7Tip =>
      'পরবর্তী অবস্থানে যাওয়ার আগে সম্পূর্ণ সোজা হয়ে দাঁড়িয়ে কিছুক্ষণ স্থির থাকুন।';

  @override
  String get howToPrayStep8Name => 'সিজদা (অবনত হওয়া)';

  @override
  String get howToPrayStep8Instruction =>
      'মাটিতে নেমে কপাল, নাক, দুই হাতের তালু, দুই হাঁটু এবং দুই পায়ের আঙুল মাটিতে রাখুন। তিনবার \'সুবহানা রাব্বিয়াল আ\'লা\' বলুন।';

  @override
  String get howToPrayStep8Tip =>
      'সাতটি অঙ্গ মাটি স্পর্শ করতে হবে: কপাল (নাকসহ), দুই হাত, দুই হাঁটু এবং দুই পা।';

  @override
  String get howToPrayStep9Name => 'জালসা (দুই সিজদার মাঝে বসা)';

  @override
  String get howToPrayStep9Instruction =>
      'সিজদা থেকে উঠে বাম পা বিছিয়ে এবং ডান পা খাড়া রেখে বসুন। বসার সময় \'আল্লাহু আকবার\' বলুন। সংক্ষিপ্ত বিরতির পর দ্বিতীয় সিজদার জন্য আবার নামুন।';

  @override
  String get howToPrayStep9Tip =>
      'দুই সিজদার মাঝের এই সংক্ষিপ্ত বসাকে জালসা বলা হয়। এটি নামাজের একটি আবশ্যক অংশ।';

  @override
  String get howToPrayStep10Name => 'রাকাত সম্পন্ন করুন';

  @override
  String get howToPrayStep10Instruction =>
      'প্রথম রাকাত সম্পন্ন করার পর উঠে দাঁড়ান এবং দ্বিতীয় রাকাতের জন্য একই ধাপগুলো পুনরাবৃত্তি করুন। রাকাতের সংখ্যা নির্ভর করে আপনি কোন নামাজ পড়ছেন তার ওপর।';

  @override
  String get howToPrayStep10Tip =>
      'ফজরে ২ রাকাত, যোহরে ৪, আসরে ৪, মাগরিবে ৩ এবং এশায় ৪ রাকাত। একবারে এক রাকাত করে এগিয়ে যান।';

  @override
  String get howToPrayStep11Name => 'তাশাহহুদ (শেষ বৈঠক)';

  @override
  String get howToPrayStep11Instruction =>
      'শেষ বৈঠকে বসে তাশাহহুদ পড়ুন। এটি ঈমানের একটি ঘোষণা যা আপনি শেষ রাকাতের পর বসে পড়েন।';

  @override
  String get howToPrayStep11Tip =>
      'তাশাহহুদের সময় \'আশহাদু আল্লা ইলাহা ইল্লাল্লাহ\' বলার সময় ডান হাতের তর্জনী আঙুল তুলুন, যা আল্লাহর একত্বের প্রতীক।';

  @override
  String get howToPrayStep12Name => 'সালাম (শেষ করা)';

  @override
  String get howToPrayStep12Instruction =>
      'ডান দিকে মাথা ঘুরিয়ে \'আসসালামু আলাইকুম ওয়া রাহমাতুল্লাহ\' বলুন, তারপর বাম দিকে ঘুরিয়ে আবার একই কথা বলুন। এর মাধ্যমে আপনার নামাজ শেষ হয়।';

  @override
  String get howToPrayStep12Tip =>
      'নামাজের পর কিছুক্ষণ সময় নিয়ে দোয়া করুন এবং আল্লাহর কাছে আপনার প্রয়োজনীয় বিষয় চান। আল্লাহর সাথে সংযোগ স্থাপনের এটি একটি সুন্দর মুহূর্ত।';

  @override
  String get checklistWeek1Title => 'সপ্তাহ ১';

  @override
  String get checklistWeek2Title => 'সপ্তাহ ২';

  @override
  String get checklistWeek3Title => 'সপ্তাহ ৩';

  @override
  String get checklistWeek4Title => 'সপ্তাহ ৪';

  @override
  String get checklistWeek1Item1 => 'কালেমা শাহাদাহ পাঠ করুন';

  @override
  String get checklistWeek1Item2 => 'অজু শিখুন';

  @override
  String get checklistWeek1Item3 => 'আল-ফাতিহা শিখুন';

  @override
  String get checklistWeek1Item4 => 'প্রথম ফজরের নামাজ পড়ুন';

  @override
  String get checklistWeek1Item5 => 'একটি জায়নামাজ সংগ্রহ করুন';

  @override
  String get checklistWeek1Item6 => 'কাছের একটি মসজিদ খুঁজুন';

  @override
  String get checklistWeek2Item1 => '৫ ওয়াক্ত নামাজের সময় শিখুন';

  @override
  String get checklistWeek2Item2 => 'মৌলিক দোয়া শিখুন';

  @override
  String get checklistWeek2Item3 => 'নবী মুহাম্মাদ সম্পর্কে পড়ুন';

  @override
  String get checklistWeek2Item4 => 'মুসলিম সম্প্রদায়ের সাথে যুক্ত হোন';

  @override
  String get checklistWeek3Item1 => 'হালাল খাবার সম্পর্কে জানুন';

  @override
  String get checklistWeek3Item2 => 'সূরা আল-ইখলাস পড়ুন';

  @override
  String get checklistWeek3Item3 => 'রমজান সম্পর্কে জানুন';

  @override
  String get checklistWeek3Item4 => 'দৈনিক জিকির শুরু করুন';

  @override
  String get checklistWeek4Item1 => 'যাকাত সম্পর্কে জানুন';

  @override
  String get checklistWeek4Item2 => '৫টি স্তম্ভ সম্পর্কে পড়ুন';

  @override
  String get checklistWeek4Item3 => 'নামাজের নোটিফিকেশন চালু করুন';

  @override
  String get checklistWeek4Item4 => 'আপনার যাত্রা নিয়ে চিন্তা করুন';

  @override
  String get wuduStep1Instruction =>
      'আল্লাহর সন্তুষ্টির জন্য অজু করার নিয়ত মনে মনে করুন।';

  @override
  String get wuduStep1Tip =>
      'উচ্চস্বরে বলার দরকার নেই — মনে আন্তরিক নিয়তই যথেষ্ট।';

  @override
  String get wuduStep2Instruction =>
      'শুরু করার আগে বিসমিল্লাহ (আল্লাহর নামে) বলুন।';

  @override
  String get wuduStep2Tip =>
      'বিসমিল্লাহ বলা সুন্নত এবং এটি আল্লাহর স্মরণ দিয়ে আপনার অজু শুরু করে।';

  @override
  String get wuduStep3Instruction =>
      'উভয় হাত কব্জি পর্যন্ত তিনবার ধুয়ে নিন, খেয়াল রাখুন যেন আঙুলের ফাঁকে পানি পৌঁছায়।';

  @override
  String get wuduStep3Tip =>
      'ডান হাত দিয়ে শুরু করুন, তারপর বাম হাত। ইসলামে এই ক্রম অনুসরণ করার পরামর্শ দেওয়া হয়েছে।';

  @override
  String get wuduStep4Instruction =>
      'মুখে পানি নিয়ে কুলকুচি করে ফেলে দিন। এটি তিনবার করুন।';

  @override
  String get wuduStep4Tip =>
      'এটি মুখ পরিষ্কার করে এবং পবিত্রতা অর্জনের প্রক্রিয়ার একটি অংশ।';

  @override
  String get wuduStep5Instruction =>
      'নাকে পানি টেনে নিয়ে আস্তে করে ঝেড়ে ফেলুন। এটি তিনবার করুন।';

  @override
  String get wuduStep5Tip =>
      'ডান হাত দিয়ে পানি টানুন এবং বাম হাত দিয়ে তা বের করুন।';

  @override
  String get wuduStep6Instruction =>
      'চুলের রেখা থেকে থুতনি পর্যন্ত এবং এক কান থেকে অন্য কান পর্যন্ত পুরো মুখমণ্ডল তিনবার ধুয়ে নিন।';

  @override
  String get wuduStep6Tip => 'নিশ্চিত করুন যে মুখের কোনো অংশ শুকনো না থাকে।';

  @override
  String get wuduStep7Instruction =>
      'ডান হাত আঙুলের ডগা থেকে কনুই পর্যন্ত তিনবার ধুয়ে নিন, তারপর বাম হাতেও একই কাজ করুন।';

  @override
  String get wuduStep7Tip =>
      'অজুতে সবসময় বাম দিকের আগে ডান দিক দিয়ে শুরু করুন।';

  @override
  String get wuduStep8Instruction =>
      'হাত ভিজিয়ে পুরো মাথার ওপর একবার সামনে থেকে পেছনে এবং পেছন থেকে সামনে মাসেহ করুন।';

  @override
  String get wuduStep8Tip => 'ধোয়ার বিপরীতে, মাথা মাসেহ শুধু একবারই করা হয়।';

  @override
  String get wuduStep9Instruction =>
      'ডান পা গোড়ালিসহ তিনবার ধুয়ে নিন, তারপর বাম পায়েও একই কাজ করুন।';

  @override
  String get wuduStep9Tip =>
      'নিশ্চিত করুন যেন পায়ের আঙুলের ফাঁকে পানি পৌঁছায়। ফাঁক পরিষ্কার করতে আঙুল ব্যবহার করুন।';

  @override
  String get islamicGlossaryTitle => 'ইসলামিক পরিভাষা অভিধান';

  @override
  String get islamicGlossarySubtitle =>
      'কুরআন, সুন্নাহ এবং ধ্রুপদী জ্ঞানচর্চা থেকে ৫১টি পরিভাষা';

  @override
  String get searchTermsHint => 'পরিভাষা, আরবি, সংজ্ঞা খুঁজুন...';

  @override
  String get categoryAll => 'সব';

  @override
  String get categoryPillar => 'স্তম্ভ';

  @override
  String get categoryAqeedah => 'আকীদা';

  @override
  String get categoryPractice => 'আমল';

  @override
  String get categoryDhikr => 'জিকির';

  @override
  String get categoryQuran => 'কুরআন';

  @override
  String get categoryHadith => 'হাদিস';

  @override
  String get categoryFiqh => 'ফিকহ';

  @override
  String get noTermsFound => 'কোনো পরিভাষা পাওয়া যায়নি';

  @override
  String get sourceLabel => 'সূত্র';

  @override
  String get revertCornerHubSubtitle =>
      'নওমুসলিম হিসেবে আপনার প্রথম পদক্ষেপগুলোতে সহায়তা করার জন্য একটি বন্ধুত্বপূর্ণ কেন্দ্র';

  @override
  String get islamicGlossaryHubSubtitle =>
      'সাধারণ পরিভাষা সহজভাবে ব্যাখ্যা করা হয়েছে';

  @override
  String get whyDoWeHubSubtitle => 'প্রতিদিনের আমলের পেছনের প্রজ্ঞা';

  @override
  String get communityStoriesHubSubtitle =>
      'নওমুসলিমরা তাদের ইসলাম গ্রহণের গল্প শেয়ার করেছেন';

  @override
  String get whyDoWeScreenSubtitle =>
      '১২টি দৈনন্দিন ইসলামিক আমলের পেছনের প্রজ্ঞা';

  @override
  String get whyDoWeSourceBadge => 'সুন্নি সূত্র';

  @override
  String get whyDoWeQ1 => 'আমরা কেন দিনে ৫ বার নামাজ পড়ি?';

  @override
  String get whyDoWeA1 =>
      'আল্লাহ কুরআনে (২:২৩৮) পাঁচ ওয়াক্ত নামাজের নির্দেশ দিয়েছেন এবং মিরাজের রাতে (ইসরা ওয়াল মিরাজ) এটি ফরজ করা হয়েছিল। নবী ﷺ বলেছেন: কিয়ামতের দিন বান্দাকে সর্বপ্রথম যে বিষয়ে জিজ্ঞাসাবাদ করা হবে তা হলো নামাজ। (ইবনে মাজাহ)। নামাজ আমাদের সারাদিন আল্লাহর সাথে সংযুক্ত রাখে।';

  @override
  String get whyDoWeQ2 => 'নামাজের সময় আমরা কেন মক্কার দিকে মুখ করি?';

  @override
  String get whyDoWeA2 =>
      'আল্লাহ কুরআনে (২:১৪৪) নির্দেশ দিয়েছেন: \"তোমার মুখ মাসজিদুল হারামের দিকে ফিরাও।\" মক্কার কাবা হলো আল্লাহর ইবাদতের জন্য নির্মিত প্রথম ঘর (৩:৯৬)। একই দিকে মুখ করা সারা বিশ্বের মুসলিমদের নামাজে একত্রিত করে।';

  @override
  String get whyDoWeQ3 => 'আমরা কেন রমজানে রোজা রাখি?';

  @override
  String get whyDoWeA3 =>
      'আল্লাহ কুরআনে (২:১৮৩) রোজার নির্দেশ দিয়েছেন: \"হে ঈমানদারগণ! তোমাদের ওপর রোজা ফরজ করা হয়েছে, যেমন ফরজ করা হয়েছিল তোমাদের পূর্ববর্তীদের ওপর, যাতে তোমরা তাকওয়া অর্জন করতে পারো।\" রমজান হলো সেই মাস যে মাসে কুরআন নাজিল হয়েছিল (২:১৮৫)।';

  @override
  String get whyDoWeQ4 => 'খাওয়ার আগে আমরা কেন বিসমিল্লাহ বলি?';

  @override
  String get whyDoWeA4 =>
      'নবী ﷺ বলেছেন: \"তোমাদের কেউ যখন খায়, তখন সে যেন আল্লাহর নাম স্মরণ করে। যদি শুরুতে ভুলে যায়, তবে শেষে যেন বলে: বিসমিল্লাহি আউয়ালাহু ওয়া আখিরাহু।\" (আবু দাউদ)। এটি আমাদের স্মরণ করিয়ে দেয় যে সব নিয়ামত আল্লাহর পক্ষ থেকে আসে।';

  @override
  String get whyDoWeQ5 => 'মসজিদে প্রবেশের আগে আমরা কেন জুতা খুলি?';

  @override
  String get whyDoWeA5 =>
      'যখন আল্লাহ মূসা (আঃ)-কে নির্দেশ দিয়েছিলেন: \"তোমার জুতা খুলে ফেলো, কেননা তুমি পবিত্র উপত্যকা তুওয়ায় আছ।\" (কুরআন ২০:১২)। জুতা খোলা আল্লাহর ঘরের প্রতি সম্মান প্রদর্শন করে এবং নামাজের স্থান পরিষ্কার রাখে।';

  @override
  String get whyDoWeQ6 => 'অভিবাদন হিসেবে আমরা কেন আসসালামু আলাইকুম বলি?';

  @override
  String get whyDoWeA6 =>
      'নবী ﷺ বলেছেন: \"তোমরা ততক্ষণ পর্যন্ত জান্নাতে প্রবেশ করবে না যতক্ষণ না ঈমান আনবে, আর তোমরা ততক্ষণ পর্যন্ত পূর্ণ মুমিন হবে না যতক্ষণ না একে অপরকে ভালোবাসবে। আমি কি তোমাদের এমন কিছু বলে দেব যা করলে তোমরা একে অপরকে ভালোবাসবে? তোমাদের মধ্যে সালামের প্রসার ঘটাও।\" (মুসলিম)। এটি একটি দোয়াও — আপনি সেই ব্যক্তির জন্য শান্তি কামনা করছেন।';

  @override
  String get whyDoWeQ7 => 'আমরা কেন হজ পালন করি?';

  @override
  String get whyDoWeA7 =>
      'আল্লাহ হজের নির্দেশ দিয়েছেন (৩:৯৭): \"যে এই ঘরে পৌঁছার সামর্থ্য রাখে, তার জন্য এই ঘরের হজ করা আল্লাহর পক্ষ থেকে একটি দায়িত্ব।\" এটি নবী ইব্রাহিম (আঃ) ও তাঁর পরিবারের পরীক্ষাগুলোর স্মরণ করিয়ে দেয় এবং বিশ্বের সব দেশের মুসলিমদের ইবাদতে একত্রিত করে।';

  @override
  String get whyDoWeQ8 => 'আমরা কেন যাকাত দিই?';

  @override
  String get whyDoWeA8 =>
      'যাকাত ইসলামের তৃতীয় স্তম্ভ, যা কুরআনে নামাজের সাথে ৩০ বারেরও বেশি উল্লেখ করা হয়েছে। নবী ﷺ বলেছেন এটি সম্পদকে পবিত্র করে। এটি বৈষম্য কমায় এবং বিশ্বাসীদের স্মরণ করিয়ে দেয় যে সম্পদ আল্লাহর।';

  @override
  String get whyDoWeQ9 => 'হাঁচি দেওয়ার পর আমরা কেন আলহামদুলিল্লাহ বলি?';

  @override
  String get whyDoWeA9 =>
      'নবী ﷺ বলেছেন: \"তোমাদের কেউ যখন হাঁচি দেয়, সে যেন আলহামদুলিল্লাহ বলে, এবং তার ভাই বা সঙ্গী যেন তাকে ইয়ারহামুকাল্লাহ বলে।\" (বুখারি)। এটি সুস্থতার নিয়ামতের জন্য আল্লাহর প্রতি কৃতজ্ঞতা প্রকাশের একটি মুহূর্ত।';

  @override
  String get whyDoWeQ10 => 'মুসলিম নারীরা কেন হিজাব পরেন?';

  @override
  String get whyDoWeA10 =>
      'আল্লাহ কুরআনে (২৪:৩১) নির্দেশ দিয়েছেন যে ঈমানদার নারীরা যেন তাদের লজ্জাস্থান হেফাজত করে। হিজাব আল্লাহর প্রতি ইবাদত ও আনুগত্যের একটি কাজ। অনেক মুসলিম নারী এটিকে পরিচয়, মর্যাদা ও আধ্যাত্মিক সংযোগের উৎস হিসেবে পরেন।';

  @override
  String get whyDoWeQ11 => 'আমরা কেন শূকরের মাংস ও মদ এড়িয়ে চলি?';

  @override
  String get whyDoWeA11 =>
      'আল্লাহ কুরআনে শূকরের মাংস (২:১৭৩) এবং মদ (৫:৯০) নিষিদ্ধ করেছেন এবং একে \"শয়তানের কর্মকাণ্ডের একটি জঘন্য বস্তু\" বলে অভিহিত করেছেন। এই নিষেধাজ্ঞাগুলো স্বাস্থ্য, মন এবং পরিবারকে রক্ষা করে। হালাল নির্দেশিকা বিশ্বাসীদের শারীরিক ও আধ্যাত্মিক পবিত্রতা বজায় রাখতে সাহায্য করে।';

  @override
  String get whyDoWeQ12 => 'আমরা কেন ইনশাআল্লাহ বলি?';

  @override
  String get whyDoWeA12 =>
      'আল্লাহ কুরআনে (১৮:২৩-২৪) নির্দেশ দিয়েছেন: \"কখনো কোনো বিষয়ে বলো না যে, আমি আগামীকাল এটা করব, যোগ না করে যে, যদি আল্লাহ চান।\" ইনশাআল্লাহ বলা স্বীকার করে যে কেবল আল্লাহই ভবিষ্যতের নিয়ন্ত্রক, এবং এটি আমাদের বিনয়ী রাখে।';

  @override
  String get communityStoriesScreenSubtitle =>
      'সারা বিশ্ব থেকে ইসলাম গ্রহণের প্রকৃত গল্প';

  @override
  String get communityStoriesTimeLabel => 'মুসলিম হিসেবে সময়কাল';

  @override
  String get communityStoriesShareBtn => 'আপনার গল্প শেয়ার করুন';

  @override
  String get communityStoriesShareSoon =>
      'শীঘ্রই আসছে — এই ফিচারটি প্রক্রিয়াধীন আছে!';

  @override
  String get communityStory1Name => 'আয়েশা (পূর্বে সারা)';

  @override
  String get communityStory1Location => 'টেক্সাস, যুক্তরাষ্ট্র';

  @override
  String get communityStory1Time => '২ বছর';

  @override
  String get communityStory1Text =>
      'একটি কলেজ পেপারের জন্য গবেষণা করার সময় আমি ইসলামের সাথে পরিচিত হই। মিডিয়া যা বলেছিল আমি তাই আশা করেছিলাম। কিন্তু পরিবর্তে আমি শান্তি, যুক্তি এবং এমন একজন ঈশ্বর খুঁজে পেলাম যাকে সত্যিই বোঝা যায়। ৬ মাস পর আমি কালেমা পাঠ করি। নামাজ শেখা সবচেয়ে কঠিন ছিল না — কঠিন ছিল আমার পরিবারকে এই কথা জানানো। কিন্তু আলহামদুলিল্লাহ, দুই বছর পর আমার মা নিজেই ইসলাম সম্পর্কে আমাকে প্রশ্ন করছেন।';

  @override
  String get communityStory2Name => 'ইউসুফ (পূর্বে জেমস)';

  @override
  String get communityStory2Location => 'লন্ডন, যুক্তরাজ্য';

  @override
  String get communityStory2Time => '৪ বছর';

  @override
  String get communityStory2Text =>
      'বছরের পর বছর খোঁজার পর আমি ইসলাম গ্রহণ করি। খ্রিস্টধর্ম, বৌদ্ধধর্ম, নাস্তিকতা — কোনোটাই সেই শূন্যতা পূরণ করেনি। একজন মুসলিম সহকর্মী আমাকে জুমার নামাজে আমন্ত্রণ জানান। আমি পেছনে বসে পুরো সময় কাঁদলাম। কেন কাঁদছিলাম তাও জানতাম না। পরের সপ্তাহেই আমি কালেমা পাঠ করি। এই সম্প্রদায় আমাকে এমনভাবে আগলে নিল যেন আমি এমন একটি পরিবার পেয়েছি যার প্রয়োজন আমি কখনো বুঝিনি।';

  @override
  String get communityStory3Name => 'মরিয়ম (পূর্বে মারিয়া)';

  @override
  String get communityStory3Location => 'মেক্সিকো সিটি, মেক্সিকো';

  @override
  String get communityStory3Time => '১ বছর';

  @override
  String get communityStory3Text =>
      'লাতিনা এবং মুসলিম হওয়াটা যেন একটি অতিমানবীয় শক্তির মতো অনুভব হয়। রাত ২টায় একটি ইউটিউব ভিডিওর মাধ্যমে আমি ইসলাম খুঁজে পাই। ঘণ্টার পর ঘণ্টা দেখলাম। তাওহিদের ধারণা — যে আল্লাহ এক, তাঁর কোনো শরিক নেই, কোনো প্রতিমূর্তি নেই — এটি আমার মনে গভীরভাবে গেঁথে গেল। মসজিদের আমার স্প্যানিশভাষী বোনেরা আমাকে সাথে সাথেই আপন করে নিলেন।';

  @override
  String get communityStory4Name => 'ইব্রাহিম (পূর্বে ডেভিড)';

  @override
  String get communityStory4Location => 'টরন্টো, কানাডা';

  @override
  String get communityStory4Time => '৬ বছর';

  @override
  String get communityStory4Text =>
      'আমি একজন যাজকের ছেলে ছিলাম। ত্রিত্ববাদ নিয়ে আমার এমন প্রশ্ন ছিল যার উত্তর কেউ দিতে পারেনি। যখন আমি প্রথমবার কুরআন পড়লাম, মনে হলো আমি এমন কিছু পড়ছি যা আমি আগে থেকেই বিশ্বাস করতাম। আমি একা, নীরবে কালেমা পাঠ করলাম, এবং পরে আবার মসজিদে। আমার জীবনের সেরা সিদ্ধান্ত।';

  @override
  String get communityStory5Name => 'ফাতিমা (পূর্বে জেনিফার)';

  @override
  String get communityStory5Location => 'সিডনি, অস্ট্রেলিয়া';

  @override
  String get communityStory5Time => '৩ বছর';

  @override
  String get communityStory5Text =>
      'আমার যাত্রা শুরু হয়েছিল একটি হিজাব দিয়ে। মজা করে একদিন পরেছিলাম এবং অনুভব করলাম... সুরক্ষিত। আমি ইসলাম সম্পর্কে পড়তে শুরু করলাম এবং থামতে পারলাম না। তিন মাসের মধ্যেই আমি কালেমা পাঠ করি। মানুষ আমাকে জিজ্ঞেস করে আমি কী ছেড়ে দিয়েছি। আমি তাদের বলি, আমি শূন্যতা ছেড়ে দিয়েছি।';

  @override
  String get communityStory6Name => 'ওমর (পূর্বে কেভিন)';

  @override
  String get communityStory6Location => 'জোহানেসবার্গ, দক্ষিণ আফ্রিকা';

  @override
  String get communityStory6Time => '৫ বছর';

  @override
  String get communityStory6Text =>
      'আমি একটি কঠিন এলাকায় বড় হয়েছি। ইসলাম আমাকে শৃঙ্খলা, লক্ষ্য এবং ভ্রাতৃত্ব দিয়েছে। প্রথমবার যখন আমি সিজদা করলাম, আমার ভেতরে কিছু একটা খুলে গেল — সবচেয়ে ভালো অর্থে। আমি কাঁদলাম এবং কারণ ব্যাখ্যা করতে পারলাম না। এখন আমি অন্যান্য তরুণদের পথ দেখাই যারা দ্বীনের পথ খুঁজছে।';

  @override
  String get inspiredByRealStories =>
      'নওমুসলিমদের প্রকৃত যাত্রা থেকে অনুপ্রাণিত';

  @override
  String get storyFormTitle => 'আপনার গল্প শেয়ার করুন';

  @override
  String get storyFormNameLabel => 'আপনার নাম';

  @override
  String get storyFormNameHint =>
      'নাম লিখুন, অথবা \'নাম প্রকাশে অনিচ্ছুক\' লিখুন';

  @override
  String get storyFormCountryLabel => 'দেশ';

  @override
  String get storyFormCountryHint => 'আপনি কোথা থেকে এসেছেন?';

  @override
  String get storyFormTimeLabel => 'মুসলিম হিসেবে সময়কাল';

  @override
  String get storyFormTimeHint => 'যেমন: ২ বছর, ৬ মাস';

  @override
  String get storyFormStoryLabel => 'আপনার গল্প';

  @override
  String get storyFormStoryHint => 'ইসলামের পথে আপনার যাত্রা শেয়ার করুন...';

  @override
  String get storyFormSubmitBtn => 'গল্প জমা দিন';

  @override
  String get storyFormThankYouTitle => 'জাযাকাল্লাহ খাইর!';

  @override
  String get storyFormThankYouBody =>
      'আপনার গল্পটি গৃহীত হয়েছে। প্রকাশের আগে আমরা সব গল্প পর্যালোচনা করি।';

  @override
  String get storyFormRequiredError => 'অনুগ্রহ করে সব ঘর পূরণ করুন';

  @override
  String get subtitleYourGuideToIslam => 'ইসলামের পথে আপনার সঙ্গী';

  @override
  String get beginnerMode => 'নওমুসলিম মোড';

  @override
  String get beginnerModeSubtitle =>
      'নওমুসলিমদের জন্য অতিরিক্ত পরামর্শ ও দিকনির্দেশনা';

  @override
  String get beginnerModeOn =>
      'নওমুসলিম মোড চালু আছে — পুরো অ্যাপ জুড়ে অতিরিক্ত পরামর্শ দেখানো হবে';

  @override
  String get beginnerModePrayersTip =>
      'পরামর্শ: প্রতিটি নামাজ সম্পর্কে আরও জানতে এবং সুন্নত নামাজ দেখতে এতে ট্যাপ করুন';

  @override
  String get tafsirSubtitle => 'কুরআনের ব্যাখ্যা';

  @override
  String get tafsirComingSoon => 'এই সূরার তাফসীর শীঘ্রই আসছে';

  @override
  String get tafsirNotAvailable => 'তাফসীর উপলব্ধ নেই';

  @override
  String get scholarSource => 'সূত্র';

  @override
  String get asbabAlNuzul => 'নাজিলের কারণ';

  @override
  String get transliteration => 'উচ্চারণ (লিপ্যন্তর)';

  @override
  String get selectReciter => 'ক্বারী নির্বাচন করুন';

  @override
  String get playVerse => 'আয়াত শুনুন';

  @override
  String get asmaUlHusna => 'আসমাউল হুসনা';

  @override
  String get asmaUlHusnaSubtitle => 'আল্লাহর ৯৯টি সুন্দর নাম';

  @override
  String get asmaHadith =>
      'আল্লাহর ৯৯টি নাম রয়েছে। যে এগুলো মুখস্থ করবে সে জান্নাতে প্রবেশ করবে।';

  @override
  String get asmaHadithSource => 'সহীহ আল-বুখারি, ২৭৩৬';

  @override
  String get asmaSearchHint => 'নাম খুঁজুন...';

  @override
  String get asmaNoResults => 'কোনো নাম পাওয়া যায়নি';

  @override
  String get asmaSignificance => 'তাৎপর্য';

  @override
  String get asmaUlHusnaTile => '৯৯টি নাম';

  @override
  String get asmaUlHusnaTileSubtitle => 'আল্লাহর নামসমূহ';

  @override
  String get onboardingTagline =>
      'আপনার সময়ের হেফাজত করুন। আপনার নামাজকে সম্মান করুন।';

  @override
  String get onboardingChooseLanguage => 'আপনার ভাষা বেছে নিন';

  @override
  String get onboardingGetStarted => 'শুরু করুন';

  @override
  String get onboardingLocationTitle => 'নির্ভুল নামাজের সময়সূচি';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard-এর আপনার শহরের জন্য সঠিক নামাজের সময় হিসাব করতে আপনার অবস্থান প্রয়োজন। আপনার অবস্থান কখনো সংরক্ষণ বা শেয়ার করা হয় না।';

  @override
  String get onboardingPrivacyBanner =>
      'আপনার দ্বীন একান্ত ব্যক্তিগত। আপনার তথ্যও তাই থাকবে।';

  @override
  String get onboardingAllowLocation => 'অবস্থান অনুমতি দিন';

  @override
  String get onboardingSkipForNow => 'এখন বাদ দিন';

  @override
  String get onboardingNotificationTitle => 'কখনো নামাজ মিস করবেন না';

  @override
  String get onboardingNotificationDesc =>
      'প্রতিটি নামাজের সময় একটি সুন্দর আজানের মাধ্যমে নোটিফিকেশন পান। সেটিংসে শব্দ এবং সময় কাস্টমাইজ করুন।';

  @override
  String get onboardingAdhanAlerts => 'আজান সতর্কতা';

  @override
  String get onboardingCustomTiming => 'কাস্টম সময়সূচি';

  @override
  String get onboardingAdjustable => 'সমন্বয়যোগ্য';

  @override
  String get onboardingEnableNotifications => 'নোটিফিকেশন চালু করুন';

  @override
  String get onboardingMaybeLater => 'পরে করবো';

  @override
  String get onboardingAllSetTitle => 'সব প্রস্তুত!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard আপনার সময় রক্ষা করতে\nএবং সংকল্পের সাথে আপনার দিন পরিচালনা করতে প্রস্তুত।';

  @override
  String get onboardingPrayerTimesLabel => 'নামাজের সময়সূচি';

  @override
  String get onboardingPrayerTimesDesc => 'আপনার শহরের জন্য সঠিক সময়';

  @override
  String get onboardingLockScreenLabel => 'ইসলামিক লক স্ক্রিন';

  @override
  String get onboardingLockScreenDesc => 'প্রতিটি আনলকে কুরআন ও দোয়া';

  @override
  String get onboardingPrayerGuardLabel => 'নামাজের প্রহরী';

  @override
  String get onboardingPrayerGuardDesc =>
      'সালাতের সময় অ্যাপগুলো স্বয়ংক্রিয়ভাবে ব্লক হয়';

  @override
  String get onboardingEnterApp => 'Noor Guard-এ প্রবেশ করুন';

  @override
  String get adhan => 'আজান';

  @override
  String get adhanSubtitle => 'নামাজের আহ্বান';

  @override
  String get adhanDescription =>
      'আজান হলো ইসলামের নামাজের আহ্বান, যা বিশ্বাসীদের ইবাদতের জন্য আহ্বান করতে দিনে পাঁচবার ঘোষণা করা হয়।';

  @override
  String get makkahStyle => 'মাক্কা';

  @override
  String get madinahStyle => 'মাদিনা';

  @override
  String get egyptianStyle => 'মিশরীয়';

  @override
  String get adhanPlaying => 'এখন বাজছে';

  @override
  String get makkahDescription =>
      'মাক্কার মসজিদ আল-হারাম থেকে নামাজের জন্য প্রচলিত আহ্বান।';

  @override
  String get madinahDescription =>
      'মাদিনার নববী মসজিদের শান্ত শৈলীতে পরিবেশিত।';

  @override
  String get egyptianDescription =>
      'একটি সুরেলা মিশরীয় ধরনের আজান, তার সমৃদ্ধ তিলাওয়াতের জন্য পরিচিত।';

  @override
  String get adhanCallToWorship => 'নামাজের আহ্বান';

  @override
  String get adhanDescriptionFull =>
      'আজান হলো ইসলামের নামাজের আহ্বান, যা বিশ্বাসীদের ইবাদতের জন্য আহ্বান করতে দিনে পাঁচবার ঘোষণা করা হয়।';

  @override
  String get alafasyStyle => 'মিশারি আলাফাসি';

  @override
  String get alaqsaStyle => 'আল-আকসা';

  @override
  String get turkishStyle => 'তুর্কি';

  @override
  String get pakistaniStyle => 'পাকিস্তানি';

  @override
  String get indonesianStyle => 'ইন্দোনেশীয়';

  @override
  String get alafasyDescription =>
      'প্রখ্যাত ক্বারী মিশারি রাশিদ আলাফাসির হৃদয়স্পর্শী আবৃত্তি।';

  @override
  String get alaqsaDescription =>
      'জেরুজালেমের আল-আকসা মসজিদ থেকে প্রতিধ্বনিত নামাজের আহ্বান, ইসলামের তৃতীয় পবিত্রতম স্থান।';

  @override
  String get turkishDescription =>
      'তুর্কি ধারার একটি ঐতিহ্যবাহী আজান, যার সুরময় মাকাম স্বতন্ত্র।';

  @override
  String get pakistaniDescription =>
      'দক্ষিণ এশীয় ধারায় একটি হৃদয়স্পর্শী আজান, পাকিস্তান জুড়ে পাঠ করা হয়।';

  @override
  String get indonesianDescription =>
      'ইন্দোনেশীয় ধারার একটি সুরেলা আজান, দ্বীপপুঞ্জ জুড়ে প্রিয়।';

  @override
  String get thisWeek => 'এই সপ্তাহ';

  @override
  String weeklyProgress(int count) {
    return 'এই সপ্তাহে ৩৫টির মধ্যে $countটি নামাজ';
  }

  @override
  String get bestDay => 'সেরা দিন';

  @override
  String get prayerStats => 'নামাজের পরিসংখ্যান';

  @override
  String get completionRate => 'সম্পন্নের হার';

  @override
  String get bestPrayer => 'সবচেয়ে নিয়মিত নামাজ';

  @override
  String get hardestPrayer => 'সবচেয়ে বেশি বাদ পড়া নামাজ';

  @override
  String totalPrayersCompleted(int count) {
    return '$countটি নামাজ সম্পন্ন হয়েছে';
  }

  @override
  String get last7Days => 'শেষ ৭ দিন';

  @override
  String get thisMonth => 'এই মাস';

  @override
  String get fullDays => 'সম্পূর্ণ দিন';

  @override
  String get partialDays => 'আংশিক দিন';

  @override
  String get missedDays => 'বাদ পড়া দিন';

  @override
  String get missedPrayerBadge => 'বাদ পড়েছে';

  @override
  String get makeItUp => 'কাযা আদায় করুন';

  @override
  String get qadaExplanation =>
      'যদি আপনি কোনো নামাজ মিস করেন, তবে আপনি তা কাযা (পূরণ) নামাজ হিসেবে আদায় করতে পারেন।';

  @override
  String get noStatsYet =>
      'আপনার পরিসংখ্যান দেখতে আপনার নামাজ চিহ্নিত করতে থাকুন।';

  @override
  String get notEnoughData => 'এখনও যথেষ্ট তথ্য নেই';

  @override
  String get continuousPlay => 'ক্রমাগত';

  @override
  String get sleepTimer => 'ঘুমের টাইমার';

  @override
  String verseCount(Object total, Object verse) {
    return 'আয়াত $verse / $total';
  }

  @override
  String get verseTafsir => 'Verse Tafsir';

  @override
  String get tafsirOfTheDay => 'Tafsir of the Day';

  @override
  String get dailyInsight => 'Daily Insight';

  @override
  String get keyThemes => 'Key Themes & Lessons';

  @override
  String get readFullSurah => 'Read Full Surah';

  @override
  String get surahIntroduction => 'Surah Introduction';

  @override
  String get verses => 'verses';

  @override
  String get loadingTafsir => 'Loading tafsir...';
}
