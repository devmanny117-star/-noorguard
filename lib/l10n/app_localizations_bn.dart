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
  String get iPrayedButton => 'আমি নামাজ পড়েছি';

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
  String get islamicCalendarSubtitle => 'হিজরি তারিখ ও ঘটনা';

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
  String get statusOn => 'চালু';

  @override
  String get statusOff => 'বন্ধ';

  @override
  String get enableAllNotifications => 'সব নোটিফিকেশন চালু করুন';

  @override
  String get individualPrayers => 'পৃথক নামাজ';

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
  String get islamicMonthSafar => 'সফর';

  @override
  String get islamicMonthRabiAlAwwal => 'রবিউল আউয়াল';

  @override
  String get islamicMonthRabiAlThani => 'রবিউস সানি';

  @override
  String get islamicMonthJumadaAlAwwal => 'জমাদিউল আউয়াল';

  @override
  String get islamicMonthJumadaAlThani => 'জমাদিউস সানি';

  @override
  String get islamicMonthRajab => 'রজব';

  @override
  String get islamicMonthShaban => 'শাবান';

  @override
  String get islamicMonthRamadan => 'রমজান';

  @override
  String get islamicMonthShawwal => 'শাওয়াল';

  @override
  String get islamicMonthDhulQadah => 'জিলকদ';

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
      'প্রতিটি নামাজের ৫ মিনিট আগে ব্লকিং সক্রিয় হয় এবং ৩০ মিনিট পরে উঠে যায়।';

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
  String get categoryHistory => 'ইতিহাস';

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

  @override
  String get keepAliveNotificationText => 'নামাজের নোটিফিকেশন সক্রিয়';

  @override
  String get keepAliveChannelName => 'নামাজের নোটিফিকেশন';

  @override
  String get keepAliveChannelDescription =>
      'নূর গার্ডকে ব্যাকগ্রাউন্ডে সক্রিয় রাখে যাতে নামাজের অ্যালার্ম কখনো বাদ না যায়।';

  @override
  String get notifSetupTitle => 'লক স্ক্রিন অ্যালার্ট সক্রিয় করুন';

  @override
  String get notifSetupSubtitle =>
      'যাতে আপনি আজান কখনো বাদ না দেন — আপনার ফোন লক থাকলেও। এতে প্রায় এক মিনিট সময় লাগে।';

  @override
  String get notifSetupSamsungBanner =>
      'Samsung Galaxy (Fold/Flip সহ) ব্যবহার করছেন? Samsung স্টক অ্যান্ড্রয়েডের বাইরে অতিরিক্ত সুইচ যুক্ত করে — নিচের ধাপ ৪ এবং ৬ আপনাকে ঠিক দেখিয়ে দেবে সেগুলো কোথায়।';

  @override
  String get notifSetupStep1Title => 'নোটিফিকেশনের অনুমতি দিন';

  @override
  String get notifSetupStep1Description =>
      'নূর গার্ডের আপনাকে মোটেও সতর্ক করার জন্য প্রয়োজনীয় মৌলিক অনুমতি।';

  @override
  String get notifSetupStep1Action => 'নোটিফিকেশনের অনুমতি দিন';

  @override
  String get notifSetupStep2Title => 'অ্যালার্ম ও রিমাইন্ডার';

  @override
  String get notifSetupStep2Description =>
      'আপনার ফোন নিষ্ক্রিয় বা ব্যাটারি সেভারে থাকলেও নামাজের অ্যালার্মকে ঠিক সময়ে বাজতে দেয়।';

  @override
  String get notifSetupStep2Action => 'অ্যালার্ম সেটিংস খুলুন';

  @override
  String get notifSetupStep3Title => 'অন্য অ্যাপের উপরে দেখান';

  @override
  String get notifSetupStep3Description =>
      'সম্পূর্ণ নামাজ স্ক্রিনকে লক স্ক্রিন এবং যা কিছু খোলা থাকুক তার উপরে আঁকতে দেয়।';

  @override
  String get notifSetupStep3Action => 'সেটিংস খুলুন';

  @override
  String get notifSetupStep4Title =>
      'পপ-আপ / ফুল-স্ক্রিন অ্যালার্ট হিসেবে দেখান';

  @override
  String get notifSetupStep4Description =>
      'নীরব ব্যানার না থেকে আজান স্ক্রিনকে লক স্ক্রিনের উপর দিয়ে দেখাতে দেয়।';

  @override
  String get notifSetupStep4SamsungNote =>
      'Samsung Galaxy ফোনে (Fold/Flip সহ): সেটিংস খুলুন ← \"Prayer Time Alarm\"-এ ট্যাপ করুন, তারপর \"Pop-up notification\" চালু করুন (Fold/Flip-এ \"Cover screen pop-up\" নামে পরিচিত)। এটি কেবল Samsung-এর সুইচ — এটি চালু করাই আজান স্ক্রিনকে লক স্ক্রিনের উপর দেখায়।';

  @override
  String get notifSetupStep4Action => 'নোটিফিকেশন সেটিংস খুলুন';

  @override
  String get notifSetupStep5Title => 'নোটিফিকেশন নির্ভরযোগ্য রাখুন';

  @override
  String get notifSetupStep5Description =>
      'অ্যান্ড্রয়েডকে ব্যাকগ্রাউন্ডে নূর গার্ডকে ধীর বা বিলম্বিত করা থেকে বিরত রাখে, যাতে নামাজের অ্যালার্ম ও রিমাইন্ডার সবসময় সময়মতো পৌঁছায়।';

  @override
  String get notifSetupStep5Action => 'ব্যাটারি অপ্টিমাইজেশন বন্ধ করুন';

  @override
  String get notifSetupStep6Title => 'কখনো না ঘুমানো অ্যাপ';

  @override
  String get notifSetupStep6Description =>
      'Samsung-এর ব্যাটারি ম্যানেজার নূর গার্ডকে ঘুম পাড়িয়ে দিতে পারে এবং নিঃশব্দে নামাজের অ্যালার্ম ব্লক করতে পারে। এটিকে \"Never sleeping apps\"-এ যুক্ত করলে তা বন্ধ হয়।';

  @override
  String get notifSetupStep6SamsungNote =>
      'সেটিংস ← ব্যাটারি ও ডিভাইস কেয়ার ← ব্যাকগ্রাউন্ড ব্যবহারের সীমা ← Never sleeping apps ← \"+\" ট্যাপ করুন ← নূর গার্ড নির্বাচন করুন।';

  @override
  String get notifSetupStep6Action => 'ব্যাটারি সেটিংস খুলুন';

  @override
  String get notifSetupStatusChecking => 'যাচাই করা হচ্ছে…';

  @override
  String get notifSetupStatusEnabled => 'সক্রিয়';

  @override
  String get notifSetupStatusNeeded => 'প্রয়োজন';

  @override
  String get notifSetupStatusManual => 'ম্যানুয়াল পদক্ষেপ';

  @override
  String get notifSetupContinueButton => 'নূর গার্ডে যান';

  @override
  String get notifSetupLaterButton => 'আমি এটি পরে শেষ করব';

  @override
  String get notifSetupDoneButton => 'সম্পন্ন';

  @override
  String get testNotificationButton =>
      'পরীক্ষামূলক নোটিফিকেশন পাঠান (২০ সেকেন্ড)';

  @override
  String get testNotificationSnack => 'পরীক্ষামূলক নোটিফিকেশন ২০ সেকেন্ডে আসবে';

  @override
  String get testLockAlarmButton =>
      'ফুল-স্ক্রিন লক অ্যালার্ম পরীক্ষা করুন (২০ সেকেন্ড)';

  @override
  String get testLockAlarmSnack =>
      'লক অ্যালার্ম ২০ সেকেন্ডে বাজবে — এখনই আপনার ফোন লক করুন';

  @override
  String get testAdhanForegroundButton =>
      'অ্যাপের ভেতরে আজান পরীক্ষা করুন (ফোরগ্রাউন্ড)';

  @override
  String get testAdhanForegroundSnack =>
      'নিঃশব্দ ব্যানারের সাথে সম্পূর্ণ আজান বাজানো হচ্ছে';

  @override
  String get testRequiresNotificationsOn =>
      'এটি পরীক্ষা করতে প্রথমে নামাজের নোটিফিকেশন চালু করুন';

  @override
  String get lockScreenSetupGuideButton => 'লক স্ক্রিন অ্যালার্ট সেটআপ গাইড';

  @override
  String get couldNotOpenPrivacyPolicy => 'গোপনীয়তা নীতি খোলা যায়নি';

  @override
  String get couldNotOpenEmailApp => 'ইমেইল অ্যাপ খোলা যায়নি';

  @override
  String get blockDurationLabel => 'ব্লকের সময়কাল';

  @override
  String get privacyAndTrust => 'গোপনীয়তা ও বিশ্বাস';

  @override
  String get noorGuardMotto =>
      '\"যা মসজিদে থাকার যোগ্য নয়,\nতা Noor Guard-এও থাকার যোগ্য নয়।\"';

  @override
  String get openingAppStore => 'অ্যাপ স্টোর খোলা হচ্ছে…';

  @override
  String get openingShareSheet => 'শেয়ার শিট খোলা হচ্ছে…';

  @override
  String get openingSupportEmail => 'সাপোর্ট ইমেইল খোলা হচ্ছে…';

  @override
  String get openingTermsOfService => 'ব্যবহারের শর্তাবলী খোলা হচ্ছে…';

  @override
  String get duration30Min => '৩০ মিনিট';

  @override
  String get duration1Hour => '১ ঘণ্টা';

  @override
  String get durationPrayerWindowOnly => 'শুধুমাত্র নামাজের সময়';

  @override
  String get hoursAbbreviation => 'ঘণ্টা';

  @override
  String get cancelTimerButton => 'টাইমার বাতিল করুন';

  @override
  String get custom => 'কাস্টম';

  @override
  String get customTimerMinutesTitle => 'কাস্টম টাইমার (মিনিট)';

  @override
  String get customTimerHint => 'যেমন ২০';

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get start => 'শুরু করুন';

  @override
  String get travel => 'ভ্রমণ';

  @override
  String get anxietyAndStress => 'উদ্বেগ ও মানসিক চাপ';

  @override
  String get gratitude => 'কৃতজ্ঞতা';

  @override
  String get protection => 'সুরক্ষা';

  @override
  String get family => 'পরিবার';

  @override
  String get forgiveness => 'ক্ষমা';

  @override
  String get appBlockingSetupHeadline =>
      'আপনার সময় রক্ষা করুন, আপনার নামাজ রক্ষা করুন';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard শুধুমাত্র এটি বোঝার জন্য অ্যান্ড্রয়েডের অ্যাক্সেসিবিলিটি সার্ভিস ব্যবহার করে যে নামাজের সময় কোনো ব্লক করা অ্যাপ খোলা হয়েছে কিনা। এটি কখনোই আপনার বার্তা, ছবি বা ব্যক্তিগত তথ্য পড়ে না।';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'অ্যাক্সেসিবিলিটি অনুমতি দেওয়া হয়েছে';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'অ্যাক্সেসিবিলিটি অনুমতি দেওয়া হয়নি';

  @override
  String get appBlockingOpenSettings => 'অ্যাক্সেসিবিলিটি সেটিংস খুলুন';

  @override
  String get appBlockingSetupNotNow => 'এখন না';

  @override
  String get appBlockingEnableToggle => 'অ্যাপ ব্লকিং চালু করুন';

  @override
  String get appBlockingModeLabel => 'ব্লকিং মোড';

  @override
  String get appBlockingModeSoft => 'নরম';

  @override
  String get appBlockingModeSoftDesc =>
      'শুধু একটি কোমল অনুস্মারক — অ্যাপগুলো খোলা থাকবে';

  @override
  String get appBlockingModeFirm => 'দৃঢ়';

  @override
  String get appBlockingModeFirmDesc =>
      'অ্যাপটি ব্লক করে, দ্রুত পাশ কাটানোর সুযোগ সহ';

  @override
  String get appBlockingModeHard => 'কঠোর';

  @override
  String get appBlockingModeHardDesc =>
      'সম্পূর্ণ ব্লক — শুধু \"আমি নামাজ পড়েছি\" এটি খোলে';

  @override
  String get appBlockingSelectPrayersLabel => 'এই নামাজগুলোর সময় ব্লক করুন';

  @override
  String get appBlockingBufferBeforeLabel => 'নামাজের আগে শুরু করুন';

  @override
  String get appBlockingBufferAfterLabel => 'নামাজের পরে তুলে নিন';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count মিনিট';
  }

  @override
  String get appBlockingAppsTitle => 'ব্লক করা অ্যাপস';

  @override
  String get appBlockingSelectAppsButton =>
      'ব্লক করার জন্য অ্যাপ নির্বাচন করুন';

  @override
  String get appBlockingSearchHint => 'ইনস্টল করা অ্যাপ খুঁজুন';

  @override
  String get appBlockingNoAppsSelected => 'এখনও কোনো অ্যাপ নির্বাচন করা হয়নি';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অ্যাপ ব্লক করা',
      one: '১টি অ্যাপ ব্লক করা',
      zero: 'কোনো অ্যাপ ব্লক করা নেই',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'পরীক্ষা';

  @override
  String get appBlockingTestDescription =>
      'এই ডিভাইসে এটি কাজ করছে কিনা নিশ্চিত করতে ২ মিনিটের জন্য অ্যাপ ব্লকিং সক্রিয় করুন।';

  @override
  String get appBlockingTestButton => 'অ্যাপ ব্লকিং পরীক্ষা করুন (২ মিনিট)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'অ্যাপ ব্লকিং ২ মিনিটের জন্য সক্রিয় — একটি ব্লক করা অ্যাপ খোলার চেষ্টা করুন';

  @override
  String get appBlockingPermissionNeeded =>
      'ব্লকিং শুরু করতে অ্যাক্সেসিবিলিটি অনুমতি চালু করুন';

  @override
  String get appBlockingIosComingSoonTitle =>
      'স্ক্রিন টাইম অ্যাক্সেস — শীঘ্রই আসছে';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOS-এ অ্যাপ ব্লকিংয়ের জন্য অ্যাপলের স্ক্রিন টাইম অনুমতি প্রয়োজন, যা আমরা এখনও প্রস্তুত করছি। প্রস্তুত হওয়ার সাথে সাথেই আপনাকে জানানো হবে।';

  @override
  String get appBlockingHeadline1 => 'নামাজের সময়';

  @override
  String get appBlockingHeadline2 => 'আপনার সময় রক্ষা করুন';

  @override
  String get appBlockingDefaultTitle => 'নামাজের সময়';

  @override
  String get appBlockingIPrayedButton => 'আমি নামাজ পড়েছি';

  @override
  String get appBlockingReadAyahsButton => '৩টি আয়াত পড়ুন';

  @override
  String get appBlockingEmergencyBypass => 'জরুরি পাশ কাটানো';

  @override
  String get appBlockingSkipForNow => 'এখনের জন্য এড়িয়ে যান';

  @override
  String get appBlockingBypassConfirmTitle => 'আপনার ধারা শেষ করবেন?';

  @override
  String get appBlockingBypassConfirmBody =>
      'এখন পাশ কাটালে আপনার নামাজের ধারা রিসেট হয়ে যাবে। যদি এটি সত্যিই জরুরি হয়, আপনি চালিয়ে যেতে পারেন।';

  @override
  String get appBlockingBypassConfirmContinue => 'তবুও পাশ কাটান';

  @override
  String get appBlockingBypassConfirmCancel => 'ফিরে যান';

  @override
  String get appBlockingSoftReminderTitle => 'একটি কোমল অনুস্মারক';

  @override
  String get appBlockingSoftReminderBody =>
      'নামাজের সময় হয়েছে — একটু সময়ের জন্য দূরে থাকার কথা বিবেচনা করুন।';

  @override
  String get quranChallengeBannerTitle => 'আনলক করতে ৩টি আয়াত পড়ুন';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$totalটির মধ্যে $countটি আয়াত পড়া হয়েছে';
  }

  @override
  String get quranChallengeComplete => 'সাবাশ — অ্যাপগুলো আনলক হয়েছে';

  @override
  String get focusBlockHeadline1 => 'মনোযোগ ধরে রাখুন';

  @override
  String get focusBlockHeadline2 => 'চালিয়ে যান';

  @override
  String get endFocusSessionButton => 'ফোকাস সেশন শেষ করুন';

  @override
  String get focusPaused => 'নামাজের জন্য বিরত';

  @override
  String get selectLocationTitle => 'অবস্থান নির্বাচন করুন';

  @override
  String get useCurrentLocation => 'বর্তমান অবস্থান ব্যবহার করুন';

  @override
  String get savedLocationsHeader => 'সংরক্ষিত অবস্থান';

  @override
  String get noSavedLocationsYet =>
      'এখনও কোনো অবস্থান সংরক্ষিত নেই। যোগ করতে নিচে অনুসন্ধান করুন।';

  @override
  String get searchCityHint => 'শহরের নাম অনুসন্ধান করুন…';

  @override
  String get addLocationTooltip => 'অবস্থান যুক্ত করুন';

  @override
  String get deleteLocationTooltip => 'অবস্থান মুছুন';

  @override
  String get locationNotFound =>
      'অবস্থান পাওয়া যায়নি। অন্য অনুসন্ধান চেষ্টা করুন।';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'আপনি সর্বোচ্চ $maxটি অবস্থান সংরক্ষণ করতে পারেন';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'পরিবর্তনটি নিশ্চিত করা যায়নি — আবার চেষ্টা করুন';

  @override
  String get tasbihCounter => 'তাসবিহ কাউন্টার';

  @override
  String get tasbihCounterSubtitle => 'আপনার জিকির গণনা করুন';

  @override
  String get tasbihResetButton => 'রিসেট';

  @override
  String get tasbihTotalLabel => 'মোট';

  @override
  String get tasbihCelebrationTitle => 'তাসবিহ সম্পূর্ণ হয়েছে!';

  @override
  String get tasbihCelebrationBody =>
      'আপনি ৯৯টি জিকির সম্পন্ন করেছেন। আল্লাহ আপনার জিকির কবুল করুন।';

  @override
  String get tasbihStartNewSession => 'নতুন সেশন শুরু করুন';

  @override
  String get tasbihUndoButton => 'পূর্বাবস্থায় ফেরান';

  @override
  String get tasbihTapAnywhereHint =>
      'গণনা করতে স্ক্রিনের যেকোনো জায়গায় ট্যাপ করুন';

  @override
  String get tasbihSoundToggleTooltip => 'ট্যাপ শব্দ';

  @override
  String get tasbihManageDhikrTooltip => 'জিকির পরিচালনা করুন';

  @override
  String get tasbihStatsTooltip => 'পরিসংখ্যান দেখুন';

  @override
  String get tasbihDailyTotalLabel => 'আজকের মোট';

  @override
  String get tasbihRoundsTodayLabel => 'আজকের পর্ব';

  @override
  String get tasbihManageDhikrTitle => 'জিকির পরিচালনা';

  @override
  String get tasbihAddCustomDhikrButton => 'কাস্টম জিকির যুক্ত করুন';

  @override
  String get tasbihDeleteDhikrTooltip => 'মুছে ফেলুন';

  @override
  String get tasbihBuiltInDhikrBadge => 'পূর্বনির্ধারিত';

  @override
  String get tasbihCannotDeleteLastDhikr => 'আপনার অন্তত একটি জিকির প্রয়োজন';

  @override
  String get tasbihDhikrNameLabel => 'নাম';

  @override
  String get tasbihDhikrNameHint => 'যেমন: আস্তাগফিরুল্লাহ';

  @override
  String get tasbihDhikrArabicLabel => 'আরবি (ঐচ্ছিক)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'একটি নাম লিখুন';

  @override
  String get tasbihSaveDhikrButton => 'সংরক্ষণ করুন';

  @override
  String get tasbihStatsTitle => 'তাসবিহ পরিসংখ্যান';

  @override
  String get tasbihAllTimeTotalLabel => 'সর্বমোট';

  @override
  String get tasbihNoActivityYetMessage =>
      'আপনার পরিসংখ্যান দেখতে গণনা শুরু করুন।';

  @override
  String get tasbihSoundPickerTitle => 'ট্যাপ শব্দ';

  @override
  String get tasbihSoundClassicClick => 'ক্লাসিক ক্লিক';

  @override
  String get tasbihSoundSoftChime => 'নরম চাইম';

  @override
  String get tasbihSoundStoneTap => 'পাথরের টোকা';

  @override
  String get tasbihCurrentlyReciting => 'এখন আবৃত্তি করা হচ্ছে';

  @override
  String tasbihOfTarget(int target) {
    return '$target এর মধ্যে';
  }

  @override
  String get tasbihSoundRainDrop => 'বৃষ্টির ফোঁটা';

  @override
  String get tasbihSoundSoftFeather => 'কোমল পালক';

  @override
  String noAyahsFound(String query) {
    return '\"$query\" এর জন্য কোনো আয়াত পাওয়া যায়নি';
  }

  @override
  String get trySearchingQuran =>
      'বাংলায় অনুসন্ধান করুন অথবা সার্চ বারে ইসলামিক পদ ব্যবহার করুন:';

  @override
  String get loadingQuranIndex => 'কোরআন সূচক লোড হচ্ছে…';

  @override
  String get quranSearchSuggestions =>
      'সবর, ধৈর্য, রহমত, সালাত, নামাজ, মাফ, তাওবা, জান্নাত, ইলম, জ্ঞান';

  @override
  String get heroVerse1 =>
      'তোমরা নামাযসমূহ যত্নসহকারে পালন কর, বিশেষতঃ মধ্যবর্তী নামায।';

  @override
  String get heroVerse2 => 'নিশ্চয়ই নামায মুমিনদের উপর নির্দিষ্ট সময়ে ফরয।';

  @override
  String get heroVerse3 => 'ধৈর্য ও নামাযের মাধ্যমে সাহায্য প্রার্থনা কর।';

  @override
  String get heroVerse4 =>
      'অতএব তোমরা আমাকে স্মরণ কর, আমি তোমাদের স্মরণ করব। আর আমার কৃতজ্ঞতা প্রকাশ কর এবং অকৃতজ্ঞ হয়ো না।';

  @override
  String get heroVerse5 => 'যে আল্লাহর উপর ভরসা করে, তার জন্য তিনিই যথেষ্ট।';

  @override
  String get heroVerse6 =>
      'নিশ্চয়ই মানুষের জন্য সর্বপ্রথম যে ঘর স্থাপিত হয়েছিল তা মক্কায়, যা বরকতময় এবং বিশ্বজগতের জন্য পথপ্রদর্শক।';

  @override
  String get heroVerse7 =>
      'নিশ্চয়ই নামায অশ্লীলতা ও মন্দ কাজ থেকে বিরত রাখে। আর আল্লাহর স্মরণ সর্বশ্রেষ্ঠ।';

  @override
  String get heroVerse8 => 'জেনে রাখ, আল্লাহর স্মরণেই অন্তরসমূহ প্রশান্ত হয়।';

  @override
  String get heroVerse9 => 'আমাকে ডাক, আমি তোমাদের ডাকে সাড়া দেব।';

  @override
  String get heroVerse10 =>
      'যদি তোমরা কৃতজ্ঞ হও তাহলে অবশ্যই তোমাদের আরও বেশি দেব।';

  @override
  String get heroVerse11 =>
      'আল্লাহ কোনো আত্মাকে তার সাধ্যের অতিরিক্ত বোঝা দেন না।';

  @override
  String get heroVerse12 => 'নিশ্চয়ই আল্লাহ ধৈর্যশীলদের সাথে আছেন।';

  @override
  String get heroVerse13 => 'আমার রহমত সব কিছু পরিব্যাপ্ত।';

  @override
  String get heroVerse14 =>
      'ভালো কাজ কর, নিশ্চয়ই আল্লাহ সৎকর্মশীলদের ভালোবাসেন।';

  @override
  String get heroVerse15 =>
      'এটি সেই কিতাব যাতে কোনো সন্দেহ নেই, মুত্তাকীদের জন্য পথপ্রদর্শক।';

  @override
  String get accuracyHigh => 'উচ্চ নির্ভুলতা';

  @override
  String get accuracyMedium => 'মধ্যম নির্ভুলতা';

  @override
  String get accuracyLow => 'কম নির্ভুলতা';

  @override
  String get accuracyCalibrating => 'ক্যালিব্রেট হচ্ছে…';

  @override
  String get compassNeedsCalibration => 'কম্পাসের ক্যালিব্রেশন প্রয়োজন';

  @override
  String get compassCalibrationHint =>
      'নির্ভুলতা উন্নত করতে ফোনটি আস্তে আস্তে ৮-এর মতো আকারে সরান।';

  @override
  String get spiritLevelLabel => 'স্পিরিট লেভেল';

  @override
  String get spiritLevelLevelText => '✓  সমান';

  @override
  String get spiritLevelTiltText => 'সমান করতে কাত করুন';

  @override
  String get compassNorth => 'উ';

  @override
  String get compassEast => 'পূ';

  @override
  String get compassSouth => 'দ';

  @override
  String get compassWest => 'প';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'তোমার সময় রক্ষা কর। তোমার নামাযকে সম্মান কর।';

  @override
  String get stopAdhan => 'আযান বন্ধ করুন';

  @override
  String get duasSearchEmpty =>
      'অন্য একটি বিভাগ বা অনুসন্ধান শব্দ চেষ্টা করুন।';

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingWelcomeTo => 'স্বাগতম';

  @override
  String get onboardingSubtitle => 'ইসলামের সুন্দর যাত্রায় আপনার সঙ্গী।';

  @override
  String get onboardingLetsGetStarted => 'শুরু করা যাক';

  @override
  String onboardingStepOf(int step, int total) {
    return '$total এর মধ্যে $step';
  }

  @override
  String get onboardingWhatsYourName => 'আপনার নাম কী?';

  @override
  String get onboardingNameSubtitle =>
      'আমরা জানতে চাই আপনাকে কীভাবে সম্বোধন করব।';

  @override
  String get onboardingNameHint => 'আপনার নাম লিখুন';

  @override
  String get onboardingContinue => 'চালিয়ে যান';

  @override
  String get onboardingAreYouNewToIslam => 'আপনি কি ইসলামে নতুন?';

  @override
  String get onboardingModeSubtitle =>
      'আমরা আপনার যাত্রার উপর ভিত্তি করে আপনার অভিজ্ঞতা ব্যক্তিগতকৃত করব।';

  @override
  String get onboardingNewToIslam => 'আমি ইসলামে নতুন';

  @override
  String get onboardingNewToIslamDesc => 'ধাপে ধাপে গাইডেন্স সহ শিক্ষানবিশ মোড';

  @override
  String get onboardingFamiliarWithIslam => 'আমি ইসলামের সাথে পরিচিত';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'সম্পূর্ণ বৈশিষ্ট্য সহ নিয়মিত মোড';

  @override
  String greetingWithName(String name) {
    return 'আস-সালামু আলাইকুম, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'মুসলিম হিসেবে $daysতম দিন';
  }

  @override
  String get beginnerEssential1 => 'নতুন মুসলিমের গাইড';

  @override
  String get beginnerEssential2 => 'অযু শিখুন (পবিত্রতা অর্জন)';

  @override
  String get beginnerEssential3 => 'কিভাবে নামাজ পড়বেন (ধাপে ধাপে)';

  @override
  String get beginnerEssential4 => 'সূরা আল-ফাতিহা (শুরু)';

  @override
  String get beginnerEssential5 => 'দৈনিক দোয়া (প্রার্থনা)';

  @override
  String get beginnerEssential6 => 'শাহাদাহ বোঝা';

  @override
  String get beginnerEssential7 => 'ইসলামিক পরিভাষা ও গ্লোসারি';

  @override
  String get beginnerExploreAll => 'সব ফিচার এক্সপ্লোর করুন';

  @override
  String get beginnerExploreSubtitle =>
      'সম্পূর্ণ Noor Guard অভিজ্ঞতায় স্যুইচ করুন';

  @override
  String get beginnerExploreFeaturesSubtitle => 'নূর গার্ডের সবকিছু';

  @override
  String get beginnerLearnSalah => 'সালাহ শিখুন';

  @override
  String get beginnerMayAllahGuide =>
      'আল্লাহ আপনার পদক্ষেপ পরিচালনা করুন এবং আপনার যাত্রা আশীর্বাদ করুন।';

  @override
  String get beginnerMuslimEssentials => 'মুসলিমের মৌলিক বিষয়';

  @override
  String get beginnerQuote1 => 'নিশ্চয়ই কষ্টের সাথে সহজতা আছে। — কুরআন ৯৪:৬';

  @override
  String get beginnerQuote2 =>
      'আল্লাহর আদেশ মেনে চলো, তিনি তোমাকে রক্ষা করবেন।';

  @override
  String get beginnerQuote3 =>
      'আল্লাহ তোমার চেহারা নয়, তোমার হৃদয় ও কাজ দেখেন।';

  @override
  String get beginnerQuote4 =>
      'নামাজের দিকে প্রতিটি পদক্ষেপ শান্তির দিকে একটি পদক্ষেপ।';

  @override
  String get beginnerQuote5 =>
      'তোমাদের মধ্যে সর্বোত্তম সে, যে কুরআন শেখে এবং শেখায়।';

  @override
  String get beginnerTapToSetShahadaDate =>
      'আপনার শাহাদাহ তারিখ সেট করতে ট্যাপ করুন';

  @override
  String get beginnerToolboxSection => 'নতুনদের টুলবক্স';

  @override
  String get beginnerYourJourney => 'আপনার যাত্রা';

  @override
  String get journeyMonth1Name => 'মাস ১: ভিত্তি';

  @override
  String get journeyMonth2Name => 'মাস ২: অভ্যাস গঠন';

  @override
  String get journeyMonth3Name => 'মাস ৩: ইমান গভীর করা';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total সম্পন্ন';
  }

  @override
  String get journeyViewFull => 'সম্পূর্ণ যাত্রা দেখুন →';

  @override
  String get journeyTask2_1 => '৭ দিন সব ৫ ওয়াক্ত নামাজ পড়ুন';

  @override
  String get journeyTask2_2 => 'আরো ২০টি দোয়া শিখুন';

  @override
  String get journeyTask2_3 => 'কুরআনের প্রথম জুজ পড়ুন';

  @override
  String get journeyTask2_4 => 'আল্লাহর ৯৯ নাম শিখুন';

  @override
  String get journeyTask2_5 => '৭ দিন প্রতিদিন তাসবিহ কাউন্টার ব্যবহার করুন';

  @override
  String get journeyTask2_6 => 'সুন্নাত নামাজ শিখুন';

  @override
  String get journeyTask2_7 => 'আপনার স্থানীয় মসজিদ খুঁজুন';

  @override
  String get journeyTask3_1 => 'সূরাহ আল-বাকারা পড়ুন';

  @override
  String get journeyTask3_2 => 'জাকাত সম্পর্কে জানুন';

  @override
  String get journeyTask3_3 => 'রোজা (সাওম) সম্পর্কে জানুন';

  @override
  String get journeyTask3_4 => '৩টি নতুন সূরাহ মুখস্থ করুন';

  @override
  String get journeyTask3_5 => 'হজ্জ সম্পর্কে জানুন';

  @override
  String get journeyTask3_6 => 'কারোর সাথে ইসলাম শেয়ার করুন';

  @override
  String get journeyTask3_7 => 'ইসলামিক শব্দকোষ সম্পন্ন করুন';

  @override
  String get journeyTimelineTitle => 'আমার যাত্রা';

  @override
  String get journeyCompleted => 'সম্পন্ন';

  @override
  String get journeyInProgress => 'চলমান';

  @override
  String get journeyLocked => 'বন্ধ';

  @override
  String get wuduThreeTimes => '৩ বার';

  @override
  String get wuduDuaBefore => 'ওজুর আগের দোয়া';

  @override
  String get wuduDuaAfter => 'ওজুর পরের দোয়া';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'আল্লাহর নামে';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'আমি সাক্ষ্য দিচ্ছি যে আল্লাহ ছাড়া কোনো সত্যিকারের ইলাহ নেই, তিনি একক, তাঁর কোনো অংশীদার নেই, এবং আমি সাক্ষ্য দিচ্ছি যে মুহাম্মদ ﷺ তাঁর বান্দা ও রাসূল। হে আল্লাহ, আমাকে তাওবাকারীদের মধ্যে এবং পবিত্রতা অর্জনকারীদের মধ্যে গণ্য করুন।';

  @override
  String get wuduCompleteButton => 'আমি ওজু সম্পন্ন করেছি';

  @override
  String get howToPrayStepOpeningDua => 'শুরুর দু\'আ';

  @override
  String get howToPrayStepAlFatiha => 'সূরা আল-ফাতিহা';

  @override
  String get howToPrayStepSurah => 'ছোট সূরা';

  @override
  String get howToPrayStepTashahhudShort => 'তাশাহহুদ (মধ্যবর্তী বসা)';

  @override
  String get howToPrayStepSalawat => 'নবীর ﷺ উপর দরুদ';

  @override
  String get howToPrayTransTakbir => 'আল্লাহ সর্বমহান';

  @override
  String get howToPrayTransOpeningDua =>
      'হে আল্লাহ! তুমি পবিত্র এবং তোমার প্রশংসা করি; তোমার নাম বরকতময়, তোমার মহিমা সর্বোচ্চ, তুমি ছাড়া কোনো ইলাহ নেই।';

  @override
  String get howToPrayTransFatiha =>
      'পরম করুণাময়, অতি দয়ালু আল্লাহর নামে। সমস্ত প্রশংসা বিশ্বজগতের প্রতিপালক আল্লাহর জন্য। পরম করুণাময়, অতি দয়ালু। বিচার দিনের অধিপতি। শুধু তোমারই আমরা ইবাদত করি এবং শুধু তোমার কাছেই সাহায্য চাই। আমাদের সরল পথে পরিচালিত করো — যাদের প্রতি তুমি অনুগ্রহ করেছ তাদের পথে, যাদের উপর ক্রোধ হয়েছে তাদের পথে নয়, এবং যারা পথভ্রষ্ট তাদের পথেও নয়।';

  @override
  String get howToPrayTransRuku => 'আমার মহান প্রতিপালকের পবিত্রতা বর্ণনা করি';

  @override
  String get howToPrayTransItidal =>
      'আল্লাহ তার কথা শুনেন যে তাঁর প্রশংসা করে। হে আমাদের প্রতিপালক, সকল প্রশংসা তোমার জন্য।';

  @override
  String get howToPrayTransSujood =>
      'আমার সর্বোচ্চ প্রতিপালকের পবিত্রতা বর্ণনা করি';

  @override
  String get howToPrayTransJalsa => 'হে আমার প্রতিপালক, আমাকে ক্ষমা করো';

  @override
  String get howToPrayTransTashahhud =>
      'সকল অভিবাদন, নামাজ ও ভালো কথা আল্লাহর জন্য। হে নবী, আপনার উপর শান্তি বর্ষিত হোক এবং আল্লাহর রহমত ও বরকত। আমাদের এবং আল্লাহর সৎ বান্দাদের উপর শান্তি বর্ষিত হোক। আমি সাক্ষ্য দিচ্ছি যে আল্লাহ ছাড়া কোনো ইলাহ নেই এবং মুহাম্মদ তাঁর বান্দা ও রাসূল।';

  @override
  String get howToPrayTransSalawat =>
      'হে আল্লাহ, মুহাম্মদ ﷺ এবং মুহাম্মদের পরিবারের উপর রহমত বর্ষণ করো যেভাবে তুমি ইব্রাহিম এবং ইব্রাহিমের পরিবারের উপর রহমত বর্ষণ করেছিলে — নিশ্চয়ই তুমি প্রশংসনীয় ও মহিমান্বিত। হে আল্লাহ, মুহাম্মদ এবং তাঁর পরিবারের উপর বরকত দাও যেভাবে তুমি ইব্রাহিম এবং তাঁর পরিবারের উপর বরকত দিয়েছিলে — নিশ্চয়ই তুমি প্রশংসনীয় ও মহিমান্বিত।';

  @override
  String get howToPrayTransTasleem =>
      'তোমাদের উপর শান্তি ও আল্লাহর রহমত বর্ষিত হোক';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'তাকবিরের পরপরই এই দু\'আ আস্তে পড়ুন। এটি শুধু একবার, নামাজের একদম শুরুতে পড়া হয়।';

  @override
  String get howToPraySurahInstruction =>
      'ফাতিহার পর যে কোনো সূরা পড়ুন। সূরা ইখলাস (উপরে) নতুনদের জন্য আদর্শ — শুধু প্রথম দুই রাকাতে পড়া হয়।';

  @override
  String get howToPrayItidalInstruction =>
      'উঠার সময় \'সামিআল্লাহু লিমান হামিদাহ\' বলুন, তারপর সোজা দাঁড়িয়ে \'রব্বানা লাকাল হামদ\' বলুন।';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      '২য় রাকাতের পর বসুন। শাহাদাত পড়ার সময় ডান তর্জনী উঠান। ৩ ও ৪ রাকাত নামাজে এর পর আবার উঠতে হবে।';

  @override
  String get howToPraySalawatInstruction =>
      'শেষ তাশাহহুদের পরপরই দরুদ পড়ুন, শুধু শেষ বসায়, সালামের আগে।';

  @override
  String get howToPrayTasleemInstruction =>
      'মাথা ডানদিকে ঘুরিয়ে সালাম দিন, তারপর বামদিকে ঘুরিয়ে পুনরায় বলুন। আপনার নামাজ সম্পন্ন হয়েছে।';

  @override
  String get howToPrayOnceOpens => 'একবার — নামাজ শুরু হয়';

  @override
  String get howToPrayFirstRakahOnly => 'শুধু ১ম রাকাত';

  @override
  String get howToPrayFirst2RakahsOnly => 'শুধু প্রথম ২ রাকাত';

  @override
  String get howToPrayEveryRakah => 'প্রতি রাকাতে';

  @override
  String get howToPrayAfter2ndRakah => '২য় রাকাতের পর';

  @override
  String get howToPrayFinalSittingOnly => 'শুধু শেষ বসায়';

  @override
  String get howToPrayClosesThePrayer => 'নামাজ শেষ করে';

  @override
  String get howToPraySectionBefore => 'নামাজের আগে';

  @override
  String get howToPraySectionRakah => 'রাকাত';

  @override
  String get howToPraySectionMiddleSitting => 'মধ্যবর্তী বসা';

  @override
  String get howToPraySectionFinalSitting => 'শেষ বসা';

  @override
  String get howToPrayRakahLabel => 'রাকাত';

  @override
  String get howToPrayCompleteButton => 'আমি নামাজ শেষ করেছি';

  @override
  String get howToPrayMashaallah => 'মাশাআল্লাহ!';

  @override
  String get howToPrayAccepted => 'আল্লাহ আপনার নামাজ কবুল করুন।';

  @override
  String get fatihaIntroTitle => 'কোরআনের মা';

  @override
  String get fatihaIntroBody =>
      'সূরা আল-ফাতিহা কোরআনের সবচেয়ে মহান সূরা। এটি নামাজের প্রতিটি রাকাতে পাঠ করা হয় — প্রতিদিন কমপক্ষে ১৭ বার। এটি বান্দা ও আল্লাহর মধ্যে একটি সম্পূর্ণ কথোপকথন এবং প্রতিটি নামাজের প্রবেশদ্বার।';

  @override
  String get fatihaIntroIbnKathir =>
      'ইবনে কাছির লিখেছেন: \'আল-ফাতিহায় পুরো কোরআনের সারমর্ম রয়েছে — এটি একটি দুআ, দাসত্বের ঘোষণা, এবং সরল পথে হেদায়েতের অনুরোধ।\' — তাফসির ইবনে কাছির';

  @override
  String get shahadaScreenTitle => 'শাহাদাহ';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'আমি সাক্ষ্য দিচ্ছি যে আল্লাহ ছাড়া কোনো উপাস্য নেই, এবং আমি সাক্ষ্য দিচ্ছি যে মুহাম্মাদ আল্লাহর রাসূল';

  @override
  String get shahadaWordBreakdownTitle => 'শব্দে শব্দে';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'নেই';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'উপাস্য / দেবতা';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'ছাড়া';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'আল্লাহ (এক ঈশ্বর)';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Muḥammadun';

  @override
  String get shahadaWord5Meaning => 'মুহাম্মাদ';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Rasūlu';

  @override
  String get shahadaWord6Meaning => 'রাসূল / নবী';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'আল্লাহর';

  @override
  String get shahadaMeaningTitle => 'অর্থ ও গুরুত্ব';

  @override
  String get shahadaMeaningBody =>
      'শাহাদাহ হলো বিশ্বাসের সেই ঘোষণা যা ইসলামের ভিত্তি গঠন করে। এটি পাঁচটি স্তম্ভের মধ্যে প্রথম। আন্তরিক বিশ্বাসের সাথে এই শব্দগুলি উচ্চারণ করার মাধ্যমে একজন ব্যক্তি ইসলামে প্রবেশ করে। ইবনে কাছির ব্যাখ্যা করেন যে প্রথম অংশ সমস্ত মিথ্যা দেবতাদের অস্বীকার করে এবং আল্লাহর পরম একত্বকে নিশ্চিত করে।';

  @override
  String get shahadaMomentTitle => 'শাহাদাহর মুহূর্ত';

  @override
  String get shahadaMomentBody =>
      'যখন কোনো ব্যক্তি প্রথমবার সত্যিকারের বিশ্বাস নিয়ে শাহাদাহ পাঠ করে, তখন কিছু গভীর ঘটনা ঘটে — সে একটি নতুন জীবন শুরু করে। নবী ﷺ বলেছেন: \'যে ব্যক্তি বলে আল্লাহ ছাড়া কোনো উপাস্য নেই এবং আল্লাহ ছাড়া যা কিছু পূজা করা হয় তা অস্বীকার করে, তার সম্পদ ও রক্ত সুরক্ষিত হয়।\' (সহিহ মুসলিম)। অতীতের সমস্ত পাপ ক্ষমা করা হয়। ইসলামে স্বাগতম।';

  @override
  String get shahadaPronunciationTitle => 'উচ্চারণ গাইড';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'ধাপে ধাপে গাইড';

  @override
  String get toolboxWuduSubtitle => 'নামাজের আগে পবিত্রতা';

  @override
  String get toolboxGlossarySubtitle => '১১৪টি ইসলামিক পরিভাষা ব্যাখ্যা';

  @override
  String get shareSheetTitle => 'শেয়ার করুন';

  @override
  String get shareAnAyah => 'একটি আয়াত শেয়ার করুন';

  @override
  String get shareADua => 'একটি দোয়া শেয়ার করুন';

  @override
  String get shareANameOfAllah => 'আল্লাহর একটি নাম শেয়ার করুন';

  @override
  String get shareAHadith => 'একটি হাদিস শেয়ার করুন';

  @override
  String get shareViaLabel => 'নূর গার্ডের মাধ্যমে শেয়ার করা হয়েছে';

  @override
  String get shareCardAyahLabel => '✦ আজকের আয়াত';

  @override
  String get shareCardDuaLabel => '✦ দোয়া';

  @override
  String get shareCardNameLabel => '✦ আল্লাহর নাম';

  @override
  String get shareCardHadithLabel => '✦ হাদিস';

  @override
  String get sharePickDuaTitle => 'শেয়ার করার জন্য একটি দোয়া বেছে নিন';

  @override
  String get shareError => 'শেয়ার ইমেজ তৈরি করা যায়নি';

  @override
  String get shareCardVerseLabel => '✦ কোরআনের আয়াত';

  @override
  String get shareCardAsmaLabel => '✦ আসমাউল হুসনা';

  @override
  String get shareAyahSubtitle => '৩০টি কোরআনের আয়াত থেকে বেছে নিন';

  @override
  String get shareDuaSubtitle => 'লাইব্রেরি থেকে বেছে নিন';

  @override
  String get shareNameSubtitle => 'সকল ৯৯টি সুন্দর নাম থেকে বেছে নিন';

  @override
  String get shareHadithSubtitle => '২০টি বিশুদ্ধ হাদিস থেকে বেছে নিন';

  @override
  String get shareThisDua => 'এই দোয়াটি শেয়ার করুন';

  @override
  String get sharePickAyahTitle => 'শেয়ার করতে একটি আয়াত বেছে নিন';

  @override
  String get searchAyahs => 'আয়াত অনুসন্ধান করুন…';

  @override
  String get noAyahsFoundShort => 'কোনো আয়াত পাওয়া যায়নি';

  @override
  String get shareThisAyah => 'এই আয়াত শেয়ার করুন';

  @override
  String get sharePickNameTitle => 'শেয়ার করতে একটি নাম বেছে নিন';

  @override
  String get shareThisName => 'এই নাম শেয়ার করুন';

  @override
  String get sharePickHadithTitle => 'শেয়ার করতে একটি হাদিস বেছে নিন';

  @override
  String get searchHadiths => 'হাদিস অনুসন্ধান করুন…';

  @override
  String get noHadithsFound => 'কোনো হাদিস পাওয়া যায়নি';

  @override
  String get shareThisHadith => 'এই হাদিস শেয়ার করুন';

  @override
  String get backToBasics => 'মূল বিষয়ে ফিরে যান';

  @override
  String get backToBasicsSubtitle => 'ইসলামের মূল বিষয়গুলির নির্দেশিকা';

  @override
  String get fivePillarsOfIslam => 'ইসলামের পাঁচ স্তম্ভ';

  @override
  String get fivePillarsSubtitle => 'ইসলামিক বিশ্বাসের ভিত্তি';

  @override
  String get pillarLearnMore => 'আরও জানুন';

  @override
  String get pillarShowLess => 'কম দেখান';

  @override
  String get pillarsShowDetails => 'বিস্তারিত দেখুন';

  @override
  String get pillarsHideDetails => 'বিস্তারিত লুকান';

  @override
  String get pillar1Name => 'শাহাদাহ';

  @override
  String get pillar1Desc => 'বিশ্বাসের ঘোষণা';

  @override
  String get pillar1Detail =>
      'বিশ্বাসের ঘোষণা ইসলামের ভিত্তি। আন্তরিকভাবে \'আল্লাহ ছাড়া কোনো উপাস্য নেই এবং মুহাম্মদ তাঁর রাসূল\' বলার মাধ্যমে একজন ব্যক্তি ইসলামে প্রবেশ করেন।';

  @override
  String get pillar2Name => 'সালাত';

  @override
  String get pillar2Desc => 'দৈনিক পাঁচ ওয়াক্ত নামাজ';

  @override
  String get pillar2Detail =>
      'পাঁচ ওয়াক্ত নামাজ একজন মুসলিম ও আল্লাহর মধ্যে সরাসরি সেতুবন্ধন। ফজর, যোহর, আসর, মাগরিব ও ইশায় আদায় হয় এবং সারাদিনকে আল্লাহর স্মরণে সংগঠিত করে।';

  @override
  String get pillar3Name => 'যাকাত';

  @override
  String get pillar3Desc => 'বাধ্যতামূলক দান';

  @override
  String get pillar3Detail =>
      'যাকাত হলো বার্ষিক সঞ্চয়ের ২.৫% অভাবীদের দেওয়ার বাধ্যতামূলক ইবাদত। এটি সম্পদ পবিত্র করে এবং মুসলিম সম্প্রদায়ের বন্ধন দৃঢ় করে।';

  @override
  String get pillar4Name => 'সাওম';

  @override
  String get pillar4Desc => 'রমজানে রোজা';

  @override
  String get pillar4Detail =>
      'পবিত্র রমজান মাসে ভোর থেকে সূর্যাস্ত পর্যন্ত রোজা রাখা হয়। মুসলিমরা তাকওয়া ও কৃতজ্ঞতা অর্জনের জন্য খাদ্য, পানীয় ও পাপ থেকে বিরত থাকেন।';

  @override
  String get pillar5Name => 'হজ';

  @override
  String get pillar5Desc => 'মক্কায় হজ্জ';

  @override
  String get pillar5Detail =>
      'মক্কায় হজ প্রতিটি শারীরিক ও আর্থিকভাবে সক্ষম মুসলিমের জন্য জীবনে একবার ফরজ। এটি পৃথিবীতে মানুষের সবচেয়ে বড় বার্ষিক সমাবেশ।';

  @override
  String get switchedToNewMuslimMode => 'নতুন মুসলিম মোডে পরিবর্তন করা হয়েছে';

  @override
  String get switchedToRegularMode => 'সাধারণ মোডে পরিবর্তন করা হয়েছে';

  @override
  String get liveNotifChannelName => 'Noor Guard লাইভ';

  @override
  String get liveNotifChannelDescription =>
      'লক স্ক্রিনে নামাজের কাউন্টডাউন এবং দৈনিক ইসলামিক বিষয়বস্তু';

  @override
  String get liveNotifHeaderAyah => 'আজকের আয়াত';

  @override
  String get liveNotifHeaderDua => 'আজকের দোয়া';

  @override
  String get liveNotifHeaderWord => 'আজকের শব্দ';

  @override
  String get liveNotifHeaderName => 'আল্লাহর নাম';

  @override
  String get liveNotifHeaderHadith => 'আজকের হাদিস';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return '$hours ঘণ্টা $minutes মিনিট পরে';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return '$minutes মিনিট পরে';
  }

  @override
  String get liveNotifCountdownNow => 'নামাজের সময় হয়েছে';

  @override
  String get savedDuas => 'সংরক্ষিত দোয়া';

  @override
  String get savedVerses => 'সংরক্ষিত আয়াত';

  @override
  String get savedNames => 'সংরক্ষিত নাম';

  @override
  String get noSavedDuas => 'এখনও কোনো সংরক্ষিত দোয়া নেই';

  @override
  String get noSavedVerses => 'এখনও কোনো সংরক্ষিত আয়াত নেই';

  @override
  String get noSavedNames => 'এখনও কোনো সংরক্ষিত নাম নেই';

  @override
  String get heroVerse16 =>
      'হে আমাদের প্রতিপালক! যদি আমরা ভুলে যাই বা ভুল করি তবে আমাদের পাকড়াও করো না।';

  @override
  String get heroVerse17 =>
      'আল্লাহই আমাদের জন্য যথেষ্ট এবং তিনিই উত্তম কর্মবিধায়ক।';

  @override
  String get heroVerse18 => 'হে মুমিনগণ! আল্লাহ ও তাঁর রাসূলের প্রতি ঈমান আনো।';

  @override
  String get heroVerse19 =>
      'হে মুমিনগণ! আল্লাহকে ভয় করো এবং তাঁর নৈকট্য লাভের উপায় খোঁজো।';

  @override
  String get heroVerse20 =>
      'নিশ্চয়ই আমার নামাজ, আমার কুরবানি, আমার জীবন ও আমার মৃত্যু সবই বিশ্বজগতের প্রতিপালক আল্লাহর জন্য।';

  @override
  String get heroVerse21 =>
      'আমাদের জন্য এই দুনিয়ায় ও আখিরাতে কল্যাণ লিখে দাও; আমরা তোমারই দিকে ফিরে এসেছি।';

  @override
  String get heroVerse22 => 'আল্লাহকে বেশি বেশি স্মরণ করো, যাতে তোমরা সফল হও।';

  @override
  String get heroVerse23 =>
      'আল্লাহ আমাদের জন্য যা লিখে রেখেছেন তা ছাড়া কিছুই আমাদের স্পর্শ করবে না; তিনিই আমাদের অভিভাবক।';

  @override
  String get heroVerse24 =>
      'জেনে রেখো, আল্লাহর বন্ধুদের কোনো ভয় নেই এবং তারা দুঃখিতও হবে না।';

  @override
  String get heroVerse25 =>
      'আমার সাফল্য কেবল আল্লাহরই সাহায্যে; তাঁর উপরই আমি ভরসা করি এবং তাঁরই দিকে ফিরে যাই।';

  @override
  String get heroVerse26 => 'আল্লাহর রহমত থেকে নিরাশ হয়ো না।';

  @override
  String get heroVerse27 =>
      'যারা ঈমান আনে এবং আল্লাহর স্মরণে যাদের হৃদয় প্রশান্ত হয়।';

  @override
  String get heroVerse28 =>
      'আর যখন তোমাদের প্রতিপালক ঘোষণা করলেন: যদি তোমরা কৃতজ্ঞ হও, আমি অবশ্যই তোমাদের আরও বাড়িয়ে দেব।';

  @override
  String get heroVerse29 =>
      'আর তোমার প্রতিপালকের ইবাদত করো যতক্ষণ না তোমার কাছে নিশ্চিত বিষয় আসে।';

  @override
  String get heroVerse30 =>
      'নিশ্চয়ই আল্লাহ তাদের সাথে আছেন যারা তাকওয়া অবলম্বন করে এবং যারা সৎকর্ম করে।';

  @override
  String get focusButtonSubtitle =>
      'যা গুরুত্বপূর্ণ তার জন্য আপনার সময় রক্ষা করুন';

  @override
  String get ourStories => 'আমাদের গল্প';

  @override
  String get storiesSeeAll => 'সব দেখুন';

  @override
  String get storiesReadMore => 'আরও পড়ুন';

  @override
  String get storiesFeaturedLabel => 'নির্বাচিত গল্প';

  @override
  String get storiesFilterReverts => 'নওমুসলিম';

  @override
  String get storyCategoryRevert => 'নওমুসলিম';

  @override
  String get storyCategoryBornMuslim => 'জন্মগত মুসলিম';

  @override
  String get storyCategoryReturning => 'প্রত্যাবর্তনকারী';

  @override
  String get storiesShareYours => 'আপনারটি শেয়ার করুন';

  @override
  String get storiesEmptyTitle => 'এখনও কোনো গল্প নেই';

  @override
  String get storiesEmptySubtitle =>
      'আপনার যাত্রা শেয়ার করা প্রথম ব্যক্তি হোন';

  @override
  String storyShahadaDate(Object date) {
    return 'শাহাদা: $date';
  }

  @override
  String get storiesComments => 'মন্তব্য';

  @override
  String get storiesAddComment => 'একটি মন্তব্য যোগ করুন…';

  @override
  String get storiesAnonymous => 'বেনামী';

  @override
  String get storiesNameLabel => 'আপনার নাম';

  @override
  String get storiesPostAnonymously => 'বেনামে পোস্ট করুন';

  @override
  String get storiesCountryLabel => 'দেশ';

  @override
  String get storiesCategoryLabel => 'বিভাগ';

  @override
  String get storiesShahadaDateLabel => 'শাহাদার তারিখ (ঐচ্ছিক)';

  @override
  String get storiesYourStoryLabel => 'আপনার গল্প';

  @override
  String get storiesStoryHint => 'আপনার যাত্রা সম্পর্কে বলুন…';

  @override
  String get storiesChooseBackground => 'একটি পটভূমি বেছে নিন';

  @override
  String get storiesBackgroundNone => 'কোনোটি নয়';

  @override
  String get storiesEditTitle => 'আপনার গল্প সম্পাদনা করুন';

  @override
  String get storiesSaveChanges => 'পরিবর্তন সংরক্ষণ করুন';

  @override
  String get storiesUpdated => 'আপনার গল্প আপডেট করা হয়েছে';

  @override
  String get storiesUploadPhoto => 'ছবি আপলোড করুন (ঐচ্ছিক)';

  @override
  String get storiesChangePhoto => 'ছবি পরিবর্তন করুন';

  @override
  String get storiesSubmitButton => 'জমা দিন';

  @override
  String get storiesSubmitted =>
      'জাযাকাল্লাহ খাইর! আপনার গল্প পর্যালোচনার জন্য জমা হয়েছে।';

  @override
  String get storiesSubmitError => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get storiesFillRequired => 'অনুগ্রহ করে আপনার গল্প ও দেশ যোগ করুন।';

  @override
  String get storiesShareCardLabel => 'কমিউনিটির গল্প';

  @override
  String get storiesPreviewLabel => 'প্রিভিউ';

  @override
  String get storiesPendingReview => 'পর্যালোচনার অপেক্ষায়';

  @override
  String get storiesFilterSaved => 'সংরক্ষিত';

  @override
  String get storiesSavedEmpty => 'এখনও কোনো সংরক্ষিত গল্প নেই';

  @override
  String get storiesSearchCountryHint => 'দেশ খুঁজুন…';

  @override
  String get storiesChooseAvatar => 'একটি অবতার বেছে নিন';

  @override
  String get storiesAvatarInitials => 'আদ্যক্ষর';

  @override
  String get storiesAvatarIcon => 'আইকন';

  @override
  String get storiesAvatarPattern => 'নকশা';

  @override
  String get storiesLoadError =>
      'গল্প লোড করা যায়নি। আপনার সংযোগ পরীক্ষা করুন।';
}
