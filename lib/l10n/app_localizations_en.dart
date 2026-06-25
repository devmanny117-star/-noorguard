// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'May Allah bless your day';

  @override
  String get nextPrayer => 'Next Prayer';

  @override
  String get iPrayedButton => 'I Prayed';

  @override
  String get todaysPrayers => 'Today\'s Prayers';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Focus Mode';

  @override
  String get appBlocking => 'App Blocking';

  @override
  String get islamicCalendar => 'Islamic Calendar';

  @override
  String get duas => 'Duas';

  @override
  String get quran => 'Quran';

  @override
  String get settings => 'Settings';

  @override
  String get complete => 'Complete';

  @override
  String get streak => 'Streak';

  @override
  String get dayStreak => 'day streak';

  @override
  String get compassRequiresDevice => 'Compass requires a real device';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '$count day',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'All prayers completed! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 prayers completed';
  }

  @override
  String get fajr => 'Fajr';

  @override
  String get dhuhr => 'Dhuhr';

  @override
  String get asr => 'Asr';

  @override
  String get maghrib => 'Maghrib';

  @override
  String get isha => 'Isha';

  @override
  String fardRakats(int count) {
    return '$count fard rakats';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah before';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah after';
  }

  @override
  String prayedAt(String time) {
    return 'Prayed at $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'dawn before sunrise';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'after the sun passes its highest point';

  @override
  String get timePeriodLateAfternoon => 'in the late afternoon';

  @override
  String get timePeriodJustAfterSunset => 'just after sunset';

  @override
  String get timePeriodNightBeforeMidnight => 'in the night before midnight';

  @override
  String get fajrHadith =>
      'The two rakats of Fajr are better than the world and all it contains. — Prophet Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr is the first prayer of the day. It reminds us to start our day remembering Allah.';

  @override
  String get dhuhrHadith =>
      'Whoever prays the twelve sunnah rakats, Allah will build a house for him in Paradise.';

  @override
  String get dhuhrTip =>
      'Dhuhr is the midday prayer. A perfect moment to pause your day and reconnect.';

  @override
  String get asrHadith =>
      'Whoever misses Asr prayer, it is as if he lost his family and wealth. — Prophet Muhammad ﷺ';

  @override
  String get asrTip =>
      'Asr is often called the middle prayer. Allah specifically mentions it in the Quran (2:238).';

  @override
  String get maghribHadith => 'The prayer of Maghrib is the Witr of the day.';

  @override
  String get maghribTip =>
      'Maghrib marks the end of the fasting day in Ramadan. It is prayed right as the sun sets.';

  @override
  String get ishaHadith =>
      'Whoever prays Isha in congregation, it is as if he prayed half the night.';

  @override
  String get ishaTip =>
      'Isha is the final prayer of the day. Ending your day with prayer brings peace and closure.';

  @override
  String get newMuslimTip => 'New Muslim Tip';

  @override
  String get notificationsOn => 'Notifications on';

  @override
  String get notificationsOff => 'Notifications off';

  @override
  String get preview => 'Preview';

  @override
  String get lockPreviewCountdown => 'In 1h 23m  ·  4:47 PM';

  @override
  String get swipeUpToUnlock => 'Swipe up to unlock';

  @override
  String get searchSurahs => 'Search surahs…';

  @override
  String get noSurahsFound => 'No surahs found';

  @override
  String get tryAgain => 'Try Again';

  @override
  String ayahs(int count) {
    return '$count ayahs';
  }

  @override
  String get searchDuas => 'Search duas…';

  @override
  String supplications(int count) {
    return '$count supplications';
  }

  @override
  String get prayerSettings => 'Prayer Settings';

  @override
  String get calculationMethod => 'Calculation Method';

  @override
  String get adhanSound => 'Adhan Sound';

  @override
  String get prayerNotifications => 'Prayer Notifications';

  @override
  String get statusOn => 'On';

  @override
  String get statusOff => 'Off';

  @override
  String get enableAllNotifications => 'Enable All Notifications';

  @override
  String get individualPrayers => 'Individual Prayers';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get aboutNoorGuard => 'About';

  @override
  String get version => 'App Version';

  @override
  String get rateApp => 'Rate Noor Guard';

  @override
  String get shareApp => 'Share Noor Guard';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get helpUsImprove => 'Help Us Improve';

  @override
  String get translationDisclaimer =>
      'Our translations are AI-assisted. If you notice any errors in your language, we\'d love your feedback!';

  @override
  String get privacyPromiseTitle => 'The Noor Guard Privacy Promise';

  @override
  String get privacyPromiseBody =>
      'Your faith is personal. Your data stays that way. We never sell, share or monetize your data. Not your location. Not your prayer habits. Not your name.';

  @override
  String get directionToSacredHouse => 'Direction to the Sacred House';

  @override
  String towardMecca(String degrees) {
    return '$degrees° toward Mecca';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (default)';

  @override
  String get prayerHistory => 'Prayer History';

  @override
  String get currentStreak => 'Current Streak';

  @override
  String get longestStreak => 'Longest Streak';

  @override
  String get legend => 'Legend';

  @override
  String get allFivePrayers => 'All 5 prayers';

  @override
  String get partialPrayers => 'Partial (1–4)';

  @override
  String get none => 'None';

  @override
  String get sun => 'Sun';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String headingDegrees(String degrees) {
    return 'Heading $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Could not load surahs';

  @override
  String get connectionError =>
      'Please check your internet connection and try again';

  @override
  String get alQuran => 'Al-Quran';

  @override
  String get dailySupplications => 'Daily Supplications';

  @override
  String get all => 'All';

  @override
  String get noDuasFound => 'No duas found';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get home => 'Home';

  @override
  String get prayers => 'Prayers';

  @override
  String get more => 'More';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Lock Screen';

  @override
  String get readAndListen => 'Read & listen';

  @override
  String get commentary => 'Commentary';

  @override
  String get findDirection => 'Find direction';

  @override
  String get reminders => 'Reminders';

  @override
  String get blockDistractions => 'Block distractions';

  @override
  String get prayerGuard => 'Prayer guard';

  @override
  String get importantDates => 'Important dates';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get morningAndEvening => 'Morning & Evening';

  @override
  String get prayer => 'Prayer';

  @override
  String get foodAndDrink => 'Food & Drink';

  @override
  String get verityWithHardship => 'Verily, with hardship comes ease.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Guard strictly your prayers, especially the middle prayer.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Past Events';

  @override
  String get upcomingEvents => 'Upcoming Events';

  @override
  String get today => 'Today';

  @override
  String get next => 'Next';

  @override
  String hijriYearLabel(int year) {
    return '$year AH';
  }

  @override
  String get islamicMonthMuharram => 'Muharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabī\' Al-Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabī\' Al-Thānī';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumada Al-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumada Al-Thani';

  @override
  String get islamicMonthRajab => 'Rajab';

  @override
  String get islamicMonthShaban => 'Sha\'bān';

  @override
  String get islamicMonthRamadan => 'Ramadān';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qa\'dah';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Islamic New Year';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Ramadan Begins';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Day of Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Active';

  @override
  String get focusModeSubtitle =>
      'Protect your focus. Your apps are blocked until you stop.';

  @override
  String get remaining => 'remaining';

  @override
  String get ready => 'ready';

  @override
  String get duration => 'Duration';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Blocked During Focus';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Start Focus';

  @override
  String get stopFocus => 'Stop Focus';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Session Complete';

  @override
  String stayedFocusedFor(String duration) {
    return 'You stayed focused for $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '$count minute',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"And seek help through patience and prayer.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Done';

  @override
  String get socialMedia => 'Social Media';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get games => 'Games';

  @override
  String get messaging => 'Messaging';

  @override
  String get blockDuringPrayerTimes => 'Block during prayer times';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Selected apps will be blocked automatically\nduring all 5 daily prayers.';

  @override
  String get blockedLabel => 'blocked';

  @override
  String get blockAllApps => 'Block all apps';

  @override
  String get blockingTimingInfo =>
      'Blocking activates 5 minutes before each prayer and lifts 15 minutes after.';

  @override
  String get blockedDuringPrayers => 'Blocked during prayers';

  @override
  String get notBlocked => 'Not blocked';

  @override
  String get wuduStep1 => 'Intention';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Wash Hands';

  @override
  String get wuduStep4 => 'Rinse Mouth';

  @override
  String get wuduStep5 => 'Clean Nose';

  @override
  String get wuduStep6 => 'Wash Face';

  @override
  String get wuduStep7 => 'Wash Arms';

  @override
  String get wuduStep8 => 'Wipe Head';

  @override
  String get wuduStep9 => 'Wash Feet';

  @override
  String get revertCorner => 'Revert Corner';

  @override
  String get revertCornerSubtitle => 'Guides and support for new Muslims';

  @override
  String get wuduGuide => 'Wudu Guide';

  @override
  String get howToPray => 'How to Pray';

  @override
  String get newMuslimChecklist => 'New Muslim Checklist';

  @override
  String get islamicGlossary => 'Islamic Glossary';

  @override
  String get whyDoWe => 'Why Do We...';

  @override
  String get communityStories => 'Community Stories';

  @override
  String get wuduGuideSubtitle => 'Purification before prayer';

  @override
  String get howToPraySubtitle => 'Step by step salah guide';

  @override
  String get newMuslimChecklistSubtitle => 'Your 30-day journey';

  @override
  String get howToPrayStep1Name => 'Wudu First';

  @override
  String get howToPrayStep1Instruction =>
      'Perform wudu (ablution) so that you are in a state of purity before you begin to pray.';

  @override
  String get howToPrayStep1Tip =>
      'If you\'re unsure how, open the Wudu Guide from the New Muslim Hub first.';

  @override
  String get howToPrayStep2Name => 'Stand Facing the Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Stand on your prayer mat facing the Qibla — the direction of the Kaaba in Mecca. Use the Qibla compass in the app to find the exact direction.';

  @override
  String get howToPrayStep2Tip =>
      'It\'s okay if you\'re slightly off — Allah knows your intention. Try your best.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intention)';

  @override
  String get howToPrayStep3Instruction =>
      'Make the intention in your heart for the prayer you are about to perform. You do not need to say it out loud.';

  @override
  String get howToPrayStep3Tip =>
      'Your intention is between you and Allah. A simple thought like \'I am praying Fajr for Allah\' is enough.';

  @override
  String get howToPrayStep4Name => 'Takbir (Opening)';

  @override
  String get howToPrayStep4Instruction =>
      'Raise both hands to your earlobes and say \'Allahu Akbar\' (Allah is the Greatest). This officially begins your prayer.';

  @override
  String get howToPrayStep4Tip =>
      'Keep your eyes focused downward toward your place of prostration throughout the prayer.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Standing)';

  @override
  String get howToPrayStep5Instruction =>
      'Place your right hand over your left hand on your chest. Recite Surah Al-Faatiha followed by any other short surah or verses you know.';

  @override
  String get howToPrayStep5Tip =>
      'If you don\'t know any other surah yet, reciting Al-Faatiha alone is acceptable while you are learning.';

  @override
  String get howToPrayStep6Name => 'Ruku (Bowing)';

  @override
  String get howToPrayStep6Instruction =>
      'Bow down by bending at the waist with your back parallel to the ground. Place your hands on your knees and say \'Subhana Rabbiyal Adheem\' three times.';

  @override
  String get howToPrayStep6Tip =>
      'Keep your back straight and horizontal — not arched or rounded.';

  @override
  String get howToPrayStep7Name => 'Itidal (Rising from Bowing)';

  @override
  String get howToPrayStep7Instruction =>
      'Rise from bowing and stand upright. Say \'Sami Allahu liman hamidah\' (Allah hears those who praise Him) as you rise, then say \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Stand fully upright and be still for a moment before moving to the next position.';

  @override
  String get howToPrayStep8Name => 'Sujood (Prostration)';

  @override
  String get howToPrayStep8Instruction =>
      'Go down to the ground, placing your forehead, nose, both palms, knees, and toes on the floor. Say \'Subhana Rabbiyal A\'la\' three times.';

  @override
  String get howToPrayStep8Tip =>
      'Seven body parts must touch the ground: forehead (with nose), two hands, two knees, and two feet.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Sitting Between Prostrations)';

  @override
  String get howToPrayStep9Instruction =>
      'Sit up from prostration with your left foot flat and your right foot upright. Say \'Allahu Akbar\' as you sit. Pause briefly, then go back down for the second prostration.';

  @override
  String get howToPrayStep9Tip =>
      'This brief sitting between the two prostrations is called Jalsa. It is a required part of the prayer.';

  @override
  String get howToPrayStep10Name => 'Complete the Rakats';

  @override
  String get howToPrayStep10Instruction =>
      'After completing the first rakat, stand up and repeat the same steps for the second rakat. The number of rakats depends on which prayer you are performing.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr has 2 rakats, Dhuhr 4, Asr 4, Maghrib 3, and Isha 4. Take it one rakat at a time.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Final Sitting)';

  @override
  String get howToPrayStep11Instruction =>
      'In the final sitting position, recite the Tashahhud. This is a declaration of faith that you recite while seated after your last rakat.';

  @override
  String get howToPrayStep11Tip =>
      'During Tashahhud, raise your right index finger when you say \'Ash-hadu alla ilaha illallah\' as a sign of the oneness of Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Closing)';

  @override
  String get howToPrayStep12Instruction =>
      'Turn your head to the right and say \'Assalamu Alaikum wa Rahmatullah\', then turn to the left and repeat. This ends your prayer.';

  @override
  String get howToPrayStep12Tip =>
      'After the prayer, take a moment to make dua (supplication) and ask Allah for what you need. This is a beautiful time to connect with Allah.';

  @override
  String get checklistWeek1Title => 'Week 1';

  @override
  String get checklistWeek2Title => 'Week 2';

  @override
  String get checklistWeek3Title => 'Week 3';

  @override
  String get checklistWeek4Title => 'Week 4';

  @override
  String get checklistWeek1Item1 => 'Take Shahada';

  @override
  String get checklistWeek1Item2 => 'Learn Wudu';

  @override
  String get checklistWeek1Item3 => 'Learn Al-Faatiha';

  @override
  String get checklistWeek1Item4 => 'Pray first Fajr';

  @override
  String get checklistWeek1Item5 => 'Get a prayer mat';

  @override
  String get checklistWeek1Item6 => 'Find local mosque';

  @override
  String get checklistWeek2Item1 => 'Learn all 5 prayer times';

  @override
  String get checklistWeek2Item2 => 'Learn basic duas';

  @override
  String get checklistWeek2Item3 => 'Read about Prophet Muhammad';

  @override
  String get checklistWeek2Item4 => 'Connect with Muslim community';

  @override
  String get checklistWeek3Item1 => 'Learn about halal food';

  @override
  String get checklistWeek3Item2 => 'Read Surah Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Learn about Ramadan';

  @override
  String get checklistWeek3Item4 => 'Start daily dhikr';

  @override
  String get checklistWeek4Item1 => 'Learn about Zakat';

  @override
  String get checklistWeek4Item2 => 'Read about the 5 pillars';

  @override
  String get checklistWeek4Item3 => 'Set up prayer notifications';

  @override
  String get checklistWeek4Item4 => 'Reflect on your journey';

  @override
  String get wuduStep1Instruction =>
      'Make the intention in your heart to perform wudu for the sake of Allah.';

  @override
  String get wuduStep1Tip =>
      'You don\'t need to say it out loud — a sincere intention in the heart is enough.';

  @override
  String get wuduStep2Instruction =>
      'Say Bismillah (In the name of Allah) before you begin.';

  @override
  String get wuduStep2Tip =>
      'Saying Bismillah is sunnah and begins your wudu with the remembrance of Allah.';

  @override
  String get wuduStep3Instruction =>
      'Wash both hands up to the wrists three times, making sure water reaches between the fingers.';

  @override
  String get wuduStep3Tip =>
      'Start with the right hand, then the left. This order is recommended in Islam.';

  @override
  String get wuduStep4Instruction =>
      'Take water in your mouth, swirl it around, and spit it out. Do this three times.';

  @override
  String get wuduStep4Tip =>
      'This cleanses the mouth and is part of the purification process.';

  @override
  String get wuduStep5Instruction =>
      'Sniff water into your nostrils and blow it out gently. Do this three times.';

  @override
  String get wuduStep5Tip =>
      'Use your right hand to sniff water and your left hand to blow it out.';

  @override
  String get wuduStep6Instruction =>
      'Wash your entire face three times, from the hairline to the chin and from ear to ear.';

  @override
  String get wuduStep6Tip => 'Make sure no part of your face is left dry.';

  @override
  String get wuduStep7Instruction =>
      'Wash your right arm from fingertips to elbow three times, then do the same with the left arm.';

  @override
  String get wuduStep7Tip =>
      'Always start with the right side before the left in wudu.';

  @override
  String get wuduStep8Instruction =>
      'Wet your hands and wipe over your entire head once, from front to back and back to front.';

  @override
  String get wuduStep8Tip =>
      'Unlike washing, wiping the head is done only once.';

  @override
  String get wuduStep9Instruction =>
      'Wash your right foot up to and including the ankle three times, then do the same with the left foot.';

  @override
  String get wuduStep9Tip =>
      'Make sure water reaches between the toes. Use your finger to clean between them.';

  @override
  String get islamicGlossaryTitle => 'Islamic Glossary';

  @override
  String get islamicGlossarySubtitle =>
      '51 terms from Quran, Sunnah, and classical scholarship';

  @override
  String get searchTermsHint => 'Search terms, Arabic, definitions...';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryPillar => 'Pillar';

  @override
  String get categoryAqeedah => 'Aqeedah';

  @override
  String get categoryPractice => 'Practice';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Quran';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'History';

  @override
  String get noTermsFound => 'No terms found';

  @override
  String get sourceLabel => 'Source';

  @override
  String get revertCornerHubSubtitle =>
      'A gentle hub to guide your first steps as a new Muslim';

  @override
  String get islamicGlossaryHubSubtitle => 'Common terms explained simply';

  @override
  String get whyDoWeHubSubtitle => 'The wisdom behind everyday practices';

  @override
  String get communityStoriesHubSubtitle =>
      'Reverts share their journeys to Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'Wisdom behind 12 everyday Islamic practices';

  @override
  String get whyDoWeSourceBadge => 'Sunni Source';

  @override
  String get whyDoWeQ1 => 'Why do we pray 5 times a day?';

  @override
  String get whyDoWeA1 =>
      'Allah commanded the five daily prayers in the Quran (2:238) and they were established during the Night Journey (Isra wal Miraj). The Prophet said: The first matter that the slave will be brought to account for on the Day of Judgment is the prayer. (Ibn Majah). Prayer keeps us connected to Allah throughout the day.';

  @override
  String get whyDoWeQ2 => 'Why do we face Mecca when we pray?';

  @override
  String get whyDoWeA2 =>
      'Allah commanded in the Quran (2:144): \"Turn your face toward the Sacred Mosque.\" The Kaaba in Mecca is the first house built for the worship of Allah (3:96). Facing the same direction unites all Muslims in prayer worldwide.';

  @override
  String get whyDoWeQ3 => 'Why do we fast in Ramadan?';

  @override
  String get whyDoWeA3 =>
      'Allah commanded fasting in the Quran (2:183): \"O you who believe, fasting has been prescribed for you as it was prescribed for those before you, so that you may achieve taqwa.\" Ramadan is the month the Quran was revealed (2:185).';

  @override
  String get whyDoWeQ4 => 'Why do we say Bismillah before eating?';

  @override
  String get whyDoWeA4 =>
      'The Prophet said: \"When one of you eats, he should mention Allah\'s name. If he forgets at the beginning, he should say Bismillah awwalahu wa akhirahu.\" (Abu Dawud). It reminds us that all blessings come from Allah.';

  @override
  String get whyDoWeQ5 => 'Why do we remove shoes before entering a mosque?';

  @override
  String get whyDoWeA5 =>
      'When Moses was commanded by Allah: \"Remove your sandals, for you are in the sacred valley of Tuwa.\" (Quran 20:12). Removing shoes shows respect for the house of Allah and keeps the place of prayer clean.';

  @override
  String get whyDoWeQ6 => 'Why do we say Assalamu Alaikum as a greeting?';

  @override
  String get whyDoWeA6 =>
      'The Prophet said: \"You will not enter paradise until you believe, and you will not believe until you love one another. Shall I tell you of something that will make you love one another? Spread peace (salam) among yourselves.\" (Muslim). It is also a dua — you are praying for peace upon that person.';

  @override
  String get whyDoWeQ7 => 'Why do we perform Hajj?';

  @override
  String get whyDoWeA7 =>
      'Hajj was commanded by Allah (3:97): \"Pilgrimage to this House is an obligation by Allah upon whoever is able.\" It commemorates the trials of Prophet Ibrahim and his family, and unites Muslims from every nation in worship.';

  @override
  String get whyDoWeQ8 => 'Why do we give Zakat?';

  @override
  String get whyDoWeA8 =>
      'Zakat is the third pillar of Islam, commanded in the Quran over 30 times alongside prayer. The Prophet said it purifies wealth. It reduces inequality and reminds believers that wealth belongs to Allah.';

  @override
  String get whyDoWeQ9 => 'Why do we say Alhamdulillah after sneezing?';

  @override
  String get whyDoWeA9 =>
      'The Prophet said: \"When one of you sneezes, let him say Alhamdulillah, and let his brother or companion say Yarhamukallah.\" (Bukhari). It is a moment of gratitude to Allah for the blessing of health.';

  @override
  String get whyDoWeQ10 => 'Why do Muslim women wear hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah commanded in the Quran (24:31) that believing women should guard their modesty. The hijab is an act of worship and obedience to Allah. Many Muslim women wear it as a source of identity, dignity, and spiritual connection.';

  @override
  String get whyDoWeQ11 => 'Why do we avoid pork and alcohol?';

  @override
  String get whyDoWeA11 =>
      'Allah prohibited pork in the Quran (2:173) and alcohol in (5:90), calling it \"an abomination from the work of Satan.\" These prohibitions protect health, the mind, and the family. Halal guidelines help believers maintain physical and spiritual purity.';

  @override
  String get whyDoWeQ12 => 'Why do we say Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah commands in the Quran (18:23-24): \"Never say about anything: I will do that tomorrow, without adding: If Allah wills.\" Saying Inshallah acknowledges that only Allah controls the future and keeps us humble.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Real journeys to Islam from around the world';

  @override
  String get communityStoriesTimeLabel => 'Time as Muslim';

  @override
  String get communityStoriesShareBtn => 'Share Your Story';

  @override
  String get communityStoriesShareSoon =>
      'Coming soon — this feature is on the way!';

  @override
  String get communityStory1Name => 'Aisha (formerly Sarah)';

  @override
  String get communityStory1Location => 'Texas, USA';

  @override
  String get communityStory1Time => '2 years';

  @override
  String get communityStory1Text =>
      'I came across Islam while doing research for a college paper. I expected to find what the media told me. Instead I found peace, logic, and a God who actually made sense. I took my shahada 6 months later. The hardest part wasn\'t learning to pray — it was telling my family. But Alhamdulillah, two years later, my mother is asking me questions about Islam herself.';

  @override
  String get communityStory2Name => 'Yusuf (formerly James)';

  @override
  String get communityStory2Location => 'London, UK';

  @override
  String get communityStory2Time => '4 years';

  @override
  String get communityStory2Text =>
      'I reverted after years of searching. Christianity, Buddhism, atheism — nothing filled the void. A Muslim coworker invited me to Friday prayer. I sat in the back and cried the entire time. I didn\'t even know why. I took my shahada the following week. The community wrapped around me like a family I never knew I needed.';

  @override
  String get communityStory3Name => 'Maryam (formerly Maria)';

  @override
  String get communityStory3Location => 'Mexico City, Mexico';

  @override
  String get communityStory3Time => '1 year';

  @override
  String get communityStory3Text =>
      'Being Latina and Muslim feels like a superpower. I found Islam through a YouTube video at 2am. I watched for hours. The concept of tawheed — that God is one, has no partners, no images — it resonated so deeply. My Spanish-speaking sisters at the mosque made me feel at home immediately.';

  @override
  String get communityStory4Name => 'Ibrahim (formerly David)';

  @override
  String get communityStory4Location => 'Toronto, Canada';

  @override
  String get communityStory4Time => '6 years';

  @override
  String get communityStory4Text =>
      'I was a pastor\'s son. I had questions about the Trinity that no one could answer. When I read the Quran for the first time, I felt like I was reading something I already believed. I said my shahada quietly, alone, and then again at the mosque. Best decision of my life.';

  @override
  String get communityStory5Name => 'Fatima (formerly Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australia';

  @override
  String get communityStory5Time => '3 years';

  @override
  String get communityStory5Text =>
      'My journey started with a hijab. I put one on as a dare and felt... protected. I started reading about Islam and couldn\'t stop. Within three months I had taken my shahada. People ask me what I gave up. I tell them I gave up emptiness.';

  @override
  String get communityStory6Name => 'Omar (formerly Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, South Africa';

  @override
  String get communityStory6Time => '5 years';

  @override
  String get communityStory6Text =>
      'I grew up in a rough neighborhood. Islam gave me discipline, purpose, and brotherhood. The first time I made sujood, something in me broke open — in the best way. I wept and couldn\'t explain why. Now I mentor other young men finding their way to the deen.';

  @override
  String get inspiredByRealStories => 'Inspired by real revert journeys';

  @override
  String get storyFormTitle => 'Share Your Story';

  @override
  String get storyFormNameLabel => 'Your Name';

  @override
  String get storyFormNameHint => 'Name, or write \'Anonymous\'';

  @override
  String get storyFormCountryLabel => 'Country';

  @override
  String get storyFormCountryHint => 'Where are you from?';

  @override
  String get storyFormTimeLabel => 'Time as Muslim';

  @override
  String get storyFormTimeHint => 'e.g. 2 years, 6 months';

  @override
  String get storyFormStoryLabel => 'Your Story';

  @override
  String get storyFormStoryHint => 'Share your journey to Islam...';

  @override
  String get storyFormSubmitBtn => 'Submit Story';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Your story has been received. We review all submissions before publishing.';

  @override
  String get storyFormRequiredError => 'Please fill in all fields';

  @override
  String get subtitleYourGuideToIslam => 'Your guide to Islam';

  @override
  String get beginnerMode => 'Beginner Mode';

  @override
  String get beginnerModeSubtitle => 'Extra tips and guidance for new Muslims';

  @override
  String get beginnerModeOn =>
      'Beginner Mode is on — extra tips are shown throughout the app';

  @override
  String get beginnerModePrayersTip =>
      'Tip: Tap each prayer to learn more about it and see sunnah prayers';

  @override
  String get tafsirSubtitle => 'Quranic Commentary';

  @override
  String get tafsirComingSoon => 'Tafsir for this surah coming soon';

  @override
  String get tafsirNotAvailable => 'Tafsir not available';

  @override
  String get scholarSource => 'Source';

  @override
  String get asbabAlNuzul => 'Reason for Revelation';

  @override
  String get transliteration => 'Transliteration';

  @override
  String get selectReciter => 'Select Reciter';

  @override
  String get playVerse => 'Play verse';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'The 99 Beautiful Names of Allah';

  @override
  String get asmaHadith =>
      'Allah has 99 names. Whoever memorizes them will enter Paradise.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Search names...';

  @override
  String get asmaNoResults => 'No names found';

  @override
  String get asmaSignificance => 'Significance';

  @override
  String get asmaUlHusnaTile => '99 Names';

  @override
  String get asmaUlHusnaTileSubtitle => 'Names of Allah';

  @override
  String get onboardingTagline => 'Guard your time. Honor your prayers.';

  @override
  String get onboardingChooseLanguage => 'Choose your language';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingLocationTitle => 'Accurate Prayer Times';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard needs your location to calculate accurate prayer times for your city. Your location is never stored or shared.';

  @override
  String get onboardingPrivacyBanner =>
      'Your faith is personal. Your data stays that way.';

  @override
  String get onboardingAllowLocation => 'Allow Location';

  @override
  String get onboardingSkipForNow => 'Skip for now';

  @override
  String get onboardingNotificationTitle => 'Never Miss a Prayer';

  @override
  String get onboardingNotificationDesc =>
      'Get notified at every prayer time with a beautiful adhan. Customise sounds and timing in settings.';

  @override
  String get onboardingAdhanAlerts => 'Adhan alerts';

  @override
  String get onboardingCustomTiming => 'Custom timing';

  @override
  String get onboardingAdjustable => 'Adjustable';

  @override
  String get onboardingEnableNotifications => 'Enable Notifications';

  @override
  String get onboardingMaybeLater => 'Maybe later';

  @override
  String get onboardingAllSetTitle => 'You\'re All Set!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard is ready to protect your time\nand guide your day with intention.';

  @override
  String get onboardingPrayerTimesLabel => 'Prayer Times';

  @override
  String get onboardingPrayerTimesDesc => 'Accurate times for your city';

  @override
  String get onboardingLockScreenLabel => 'Islamic Lock Screen';

  @override
  String get onboardingLockScreenDesc => 'Quran and duas on every unlock';

  @override
  String get onboardingPrayerGuardLabel => 'Prayer Guard';

  @override
  String get onboardingPrayerGuardDesc =>
      'Apps blocked automatically during salah';

  @override
  String get onboardingEnterApp => 'Enter Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'The Call to Prayer';

  @override
  String get adhanDescription =>
      'The Adhan is the Islamic call to prayer, announced 5 times daily to invite believers to worship.';

  @override
  String get makkahStyle => 'Makkah';

  @override
  String get madinahStyle => 'Madinah';

  @override
  String get egyptianStyle => 'Egyptian';

  @override
  String get adhanPlaying => 'Now Playing';

  @override
  String get makkahDescription =>
      'The traditional call to prayer from the Grand Mosque in Makkah.';

  @override
  String get madinahDescription =>
      'A serene rendition in the style of the Prophet\'s Mosque in Madinah.';

  @override
  String get egyptianDescription =>
      'A melodic Egyptian-style adhan, known for its rich recitation.';

  @override
  String get adhanCallToWorship => 'The Call to Prayer';

  @override
  String get adhanDescriptionFull =>
      'The Adhan is the Islamic call to prayer, announced 5 times daily to invite believers to worship.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turkish';

  @override
  String get pakistaniStyle => 'Pakistani';

  @override
  String get indonesianStyle => 'Indonesian';

  @override
  String get alafasyDescription =>
      'A heartfelt rendition by the renowned reciter Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'The call to prayer echoing from Al-Aqsa Mosque in Jerusalem, Islam\'s third holiest site.';

  @override
  String get turkishDescription =>
      'A traditional Turkish-style ezan with its distinctive melodic maqam.';

  @override
  String get pakistaniDescription =>
      'A heartfelt adhan in the South Asian tradition, recited across Pakistan.';

  @override
  String get indonesianDescription =>
      'A melodious Indonesian-style adhan, beloved across the archipelago.';

  @override
  String get thisWeek => 'This Week';

  @override
  String weeklyProgress(int count) {
    return '$count of 35 prayers this week';
  }

  @override
  String get bestDay => 'Best day';

  @override
  String get prayerStats => 'Prayer Statistics';

  @override
  String get completionRate => 'Completion Rate';

  @override
  String get bestPrayer => 'Most Consistent Prayer';

  @override
  String get hardestPrayer => 'Most Missed Prayer';

  @override
  String totalPrayersCompleted(int count) {
    return '$count prayers completed';
  }

  @override
  String get last7Days => 'Last 7 Days';

  @override
  String get thisMonth => 'This Month';

  @override
  String get fullDays => 'Full days';

  @override
  String get partialDays => 'Partial days';

  @override
  String get missedDays => 'Missed days';

  @override
  String get missedPrayerBadge => 'Missed';

  @override
  String get makeItUp => 'Make it up';

  @override
  String get qadaExplanation =>
      'If you missed a prayer, you can still pray it as a Qada (makeup) prayer.';

  @override
  String get noStatsYet => 'Keep marking your prayers to see your stats here.';

  @override
  String get notEnoughData => 'Not enough data yet';

  @override
  String get continuousPlay => 'Continuous';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String verseCount(Object total, Object verse) {
    return 'Verse $verse of $total';
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
  String get keepAliveNotificationText => 'Prayer notifications active';

  @override
  String get keepAliveChannelName => 'Prayer Notifications';

  @override
  String get keepAliveChannelDescription =>
      'Keeps Noor Guard active in the background so prayer alarms are never missed.';

  @override
  String get notifSetupTitle => 'Enable Lock Screen Alerts';

  @override
  String get notifSetupSubtitle =>
      'So you never miss the adhan — even when your phone is locked. Takes about a minute.';

  @override
  String get notifSetupSamsungBanner =>
      'Using a Samsung Galaxy (including Fold/Flip)? Samsung adds extra switches beyond stock Android — Steps 4 and 6 below show you exactly where to find them.';

  @override
  String get notifSetupStep1Title => 'Allow Notifications';

  @override
  String get notifSetupStep1Description =>
      'The basic permission Noor Guard needs to alert you at all.';

  @override
  String get notifSetupStep1Action => 'Allow Notifications';

  @override
  String get notifSetupStep2Title => 'Alarms & Reminders';

  @override
  String get notifSetupStep2Description =>
      'Lets prayer alarms fire at the exact prayer time, even while your phone is idle or in battery saver.';

  @override
  String get notifSetupStep2Action => 'Open Alarm Settings';

  @override
  String get notifSetupStep3Title => 'Display Over Other Apps';

  @override
  String get notifSetupStep3Description =>
      'Lets the full prayer screen draw on top of the lock screen and whatever else is open.';

  @override
  String get notifSetupStep3Action => 'Open Settings';

  @override
  String get notifSetupStep4Title => 'Show As Pop-up / Full-Screen Alerts';

  @override
  String get notifSetupStep4Description =>
      'Lets the adhan screen break through the lock screen instead of staying a silent banner.';

  @override
  String get notifSetupStep4SamsungNote =>
      'On Samsung Galaxy phones (including Fold/Flip): open Settings → tap \"Prayer Time Alarm\", then turn on \"Pop-up notification\" (called \"Cover screen pop-up\" on Fold/Flip). This is a Samsung-only switch — turning it on is what actually puts the adhan screen over your lock screen.';

  @override
  String get notifSetupStep4Action => 'Open Notification Settings';

  @override
  String get notifSetupStep5Title => 'Keep Notifications Reliable';

  @override
  String get notifSetupStep5Description =>
      'Stops Android from slowing or delaying Noor Guard in the background, so prayer alarms and reminders always arrive on time.';

  @override
  String get notifSetupStep5Action => 'Disable Battery Optimization';

  @override
  String get notifSetupStep6Title => 'Never Sleeping Apps';

  @override
  String get notifSetupStep6Description =>
      'Samsung\'s battery manager can put Noor Guard to sleep and silently block prayer alarms. Adding it to \"Never sleeping apps\" stops that.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Settings → Battery and device care → Background usage limits → Never sleeping apps → tap \"+\" → select Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Open Battery Settings';

  @override
  String get notifSetupStatusChecking => 'Checking…';

  @override
  String get notifSetupStatusEnabled => 'Enabled';

  @override
  String get notifSetupStatusNeeded => 'Needed';

  @override
  String get notifSetupStatusManual => 'Manual Step';

  @override
  String get notifSetupContinueButton => 'Continue to Noor Guard';

  @override
  String get notifSetupLaterButton => 'I\'ll finish this later';

  @override
  String get notifSetupDoneButton => 'Done';

  @override
  String get testNotificationButton => 'Send Test Notification (10s)';

  @override
  String get testNotificationSnack =>
      'Test notification will arrive in 10 seconds';

  @override
  String get testLockAlarmButton => 'Test Full-Screen Lock Alarm (10s)';

  @override
  String get testLockAlarmSnack =>
      'Lock alarm fires in 10 seconds — lock your phone now';

  @override
  String get testAdhanForegroundButton => 'Test Adhan In-App (foreground)';

  @override
  String get testAdhanForegroundSnack =>
      'Playing the full adhan with a silent banner';

  @override
  String get testRequiresNotificationsOn =>
      'Turn on Prayer Notifications first to test this';

  @override
  String get lockScreenSetupGuideButton => 'Lock Screen Alert Setup Guide';

  @override
  String get couldNotOpenPrivacyPolicy => 'Could not open Privacy Policy';

  @override
  String get couldNotOpenEmailApp => 'Could not open email app';

  @override
  String get blockDurationLabel => 'Block duration';

  @override
  String get privacyAndTrust => 'Privacy & Trust';

  @override
  String get noorGuardMotto =>
      '\"If it doesn\'t belong in a masjid,\nit doesn\'t belong in Noor Guard.\"';

  @override
  String get openingAppStore => 'Opening App Store…';

  @override
  String get openingShareSheet => 'Opening share sheet…';

  @override
  String get openingSupportEmail => 'Opening support email…';

  @override
  String get openingTermsOfService => 'Opening Terms of Service…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 hour';

  @override
  String get durationPrayerWindowOnly => 'Prayer window only';

  @override
  String get hoursAbbreviation => 'hr';

  @override
  String get cancelTimerButton => 'Cancel timer';

  @override
  String get custom => 'Custom';

  @override
  String get customTimerMinutesTitle => 'Custom timer (minutes)';

  @override
  String get customTimerHint => 'e.g. 20';

  @override
  String get cancel => 'Cancel';

  @override
  String get start => 'Start';

  @override
  String get travel => 'Travel';

  @override
  String get anxietyAndStress => 'Anxiety & Stress';

  @override
  String get gratitude => 'Gratitude';

  @override
  String get protection => 'Protection';

  @override
  String get family => 'Family';

  @override
  String get forgiveness => 'Forgiveness';

  @override
  String get appBlockingSetupHeadline => 'Guard Your Time, Guard Your Prayer';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard uses Android\'s Accessibility service only to notice when a blocked app opens during prayer time. It never reads your messages, photos, or any personal data.';

  @override
  String get appBlockingAccessibilityStatusOn => 'Accessibility access granted';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Accessibility access not granted';

  @override
  String get appBlockingOpenSettings => 'Open Accessibility Settings';

  @override
  String get appBlockingSetupNotNow => 'Not now';

  @override
  String get appBlockingEnableToggle => 'Enable App Blocking';

  @override
  String get appBlockingModeLabel => 'Blocking Mode';

  @override
  String get appBlockingModeSoft => 'Soft';

  @override
  String get appBlockingModeSoftDesc => 'Gentle reminder only — apps stay open';

  @override
  String get appBlockingModeFirm => 'Firm';

  @override
  String get appBlockingModeFirmDesc => 'Blocks the app, with a quick bypass';

  @override
  String get appBlockingModeHard => 'Hard';

  @override
  String get appBlockingModeHardDesc =>
      'Full block — only \"I Prayed\" unlocks it';

  @override
  String get appBlockingSelectPrayersLabel => 'Block during these prayers';

  @override
  String get appBlockingBufferBeforeLabel => 'Start before prayer';

  @override
  String get appBlockingBufferAfterLabel => 'Lift after prayer';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'Blocked Apps';

  @override
  String get appBlockingSelectAppsButton => 'Select Apps to Block';

  @override
  String get appBlockingSearchHint => 'Search installed apps';

  @override
  String get appBlockingNoAppsSelected => 'No apps selected yet';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps blocked',
      one: '1 app blocked',
      zero: 'No apps blocked',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Testing';

  @override
  String get appBlockingTestDescription =>
      'Activate App Blocking for 2 minutes to confirm it\'s working on this device.';

  @override
  String get appBlockingTestButton => 'Test App Blocking (2 minutes)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'App Blocking active for 2 minutes — try opening a blocked app';

  @override
  String get appBlockingPermissionNeeded =>
      'Turn on Accessibility access to start blocking';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Screen Time Access — Coming Soon';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOS app blocking needs Apple\'s Screen Time permission, which we\'re still setting up. We\'ll let you know the moment it\'s ready.';

  @override
  String get appBlockingHeadline1 => 'Time for Prayer';

  @override
  String get appBlockingHeadline2 => 'Guard Your Time';

  @override
  String get appBlockingDefaultTitle => 'Prayer Time';

  @override
  String get appBlockingIPrayedButton => 'I Prayed';

  @override
  String get appBlockingReadAyahsButton => 'Read 3 Ayahs';

  @override
  String get appBlockingEmergencyBypass => 'Emergency bypass';

  @override
  String get appBlockingSkipForNow => 'Skip for now';

  @override
  String get appBlockingBypassConfirmTitle => 'End your streak?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Bypassing now will reset your prayer streak. If this is a real emergency, you can continue.';

  @override
  String get appBlockingBypassConfirmContinue => 'Bypass anyway';

  @override
  String get appBlockingBypassConfirmCancel => 'Go back';

  @override
  String get appBlockingSoftReminderTitle => 'A gentle reminder';

  @override
  String get appBlockingSoftReminderBody =>
      'It\'s prayer time — consider stepping away for a moment.';

  @override
  String get quranChallengeBannerTitle => 'Read 3 Ayahs to Unlock';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count of $total ayahs read';
  }

  @override
  String get quranChallengeComplete => 'Well done — apps unlocked';

  @override
  String get focusBlockHeadline1 => 'Stay Focused';

  @override
  String get focusBlockHeadline2 => 'Keep Going';

  @override
  String get endFocusSessionButton => 'End Focus Session';

  @override
  String get focusPaused => 'Paused for prayer';

  @override
  String get selectLocationTitle => 'Select Location';

  @override
  String get useCurrentLocation => 'Use Current Location';

  @override
  String get savedLocationsHeader => 'Saved Locations';

  @override
  String get noSavedLocationsYet =>
      'No saved locations yet. Search below to add one.';

  @override
  String get searchCityHint => 'Search city name…';

  @override
  String get addLocationTooltip => 'Add location';

  @override
  String get deleteLocationTooltip => 'Delete location';

  @override
  String get locationNotFound => 'Location not found. Try a different search.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'You can save up to $max locations';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Couldn\'t confirm the change — please try again';

  @override
  String get tasbihCounter => 'Tasbih Counter';

  @override
  String get tasbihCounterSubtitle => 'Count your dhikr';

  @override
  String get tasbihResetButton => 'Reset';

  @override
  String get tasbihTotalLabel => 'Total';

  @override
  String get tasbihCelebrationTitle => 'Tasbih Complete!';

  @override
  String get tasbihCelebrationBody =>
      'You completed all 99 dhikr. May Allah accept your remembrance.';

  @override
  String get tasbihStartNewSession => 'Start New Session';

  @override
  String get tasbihUndoButton => 'Undo';

  @override
  String get tasbihTapAnywhereHint => 'Tap anywhere on the screen to count';

  @override
  String get tasbihSoundToggleTooltip => 'Tap sound';

  @override
  String get tasbihManageDhikrTooltip => 'Manage dhikr';

  @override
  String get tasbihStatsTooltip => 'View stats';

  @override
  String get tasbihDailyTotalLabel => 'Today\'s Total';

  @override
  String get tasbihRoundsTodayLabel => 'Rounds Today';

  @override
  String get tasbihManageDhikrTitle => 'Manage Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Add Custom Dhikr';

  @override
  String get tasbihDeleteDhikrTooltip => 'Delete';

  @override
  String get tasbihBuiltInDhikrBadge => 'Built-in';

  @override
  String get tasbihCannotDeleteLastDhikr => 'You need at least one dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Name';

  @override
  String get tasbihDhikrNameHint => 'e.g. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arabic (optional)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Please enter a name';

  @override
  String get tasbihSaveDhikrButton => 'Save';

  @override
  String get tasbihStatsTitle => 'Tasbih Stats';

  @override
  String get tasbihAllTimeTotalLabel => 'All-Time Total';

  @override
  String get tasbihNoActivityYetMessage =>
      'Start counting to see your stats here.';

  @override
  String get tasbihSoundPickerTitle => 'Tap Sound';

  @override
  String get tasbihSoundClassicClick => 'Classic Click';

  @override
  String get tasbihSoundSoftChime => 'Soft Chime';

  @override
  String get tasbihSoundStoneTap => 'Stone Tap';

  @override
  String get tasbihCurrentlyReciting => 'Currently Reciting';

  @override
  String tasbihOfTarget(int target) {
    return 'of $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Rain Drop';

  @override
  String get tasbihSoundSoftFeather => 'Soft Feather';
}
