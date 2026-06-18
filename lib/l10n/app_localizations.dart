import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('pt'),
    Locale('sw'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh')
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'Noor Guard'**
  String get appName;

  /// Islamic greeting shown on the home screen header
  ///
  /// In en, this message translates to:
  /// **'As-Salāmu \'Alaikum'**
  String get assalamualaikum;

  /// Subtitle beneath the greeting
  ///
  /// In en, this message translates to:
  /// **'May Allah bless your day'**
  String get mayAllahBlessYourDay;

  /// Label for the upcoming prayer section
  ///
  /// In en, this message translates to:
  /// **'Next Prayer'**
  String get nextPrayer;

  /// Heading for the daily prayer check-in widget
  ///
  /// In en, this message translates to:
  /// **'Today\'s Prayers'**
  String get todaysPrayers;

  /// Label for the Qibla compass feature
  ///
  /// In en, this message translates to:
  /// **'Qibla'**
  String get qibla;

  /// Label for the focus/distraction-blocking feature
  ///
  /// In en, this message translates to:
  /// **'Focus Mode'**
  String get focusMode;

  /// Label for the prayer-time app blocking feature
  ///
  /// In en, this message translates to:
  /// **'App Blocking'**
  String get appBlocking;

  /// Label for the Hijri calendar feature
  ///
  /// In en, this message translates to:
  /// **'Islamic Calendar'**
  String get islamicCalendar;

  /// Label for the supplication library feature
  ///
  /// In en, this message translates to:
  /// **'Duas'**
  String get duas;

  /// Label for the Quran reader feature
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get quran;

  /// Label for the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Action label to mark a prayer as done
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// Label for the prayer-completion streak counter
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get streak;

  /// Suffix shown after the streak number, e.g. '7 day streak'
  ///
  /// In en, this message translates to:
  /// **'day streak'**
  String get dayStreak;

  /// Message shown on web where the compass sensor is unavailable
  ///
  /// In en, this message translates to:
  /// **'Compass requires a real device'**
  String get compassRequiresDevice;

  /// Streak counter shown as '<n> day' or '<n> days'
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {{count} day} other {{count} days}}'**
  String streakDays(int count);

  /// Message shown when the user has completed all 5 prayers for the day
  ///
  /// In en, this message translates to:
  /// **'All prayers completed! 🎉'**
  String get allPrayersCompleted;

  /// Progress label showing how many of the 5 daily prayers are completed
  ///
  /// In en, this message translates to:
  /// **'{completed}/5 prayers completed'**
  String prayersCompleted(int completed);

  /// Name of the dawn prayer
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// Name of the midday prayer
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// Name of the afternoon prayer
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// Name of the sunset prayer
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// Name of the night prayer
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// Pill label showing the number of obligatory rakats for a prayer
  ///
  /// In en, this message translates to:
  /// **'{count} fard rakats'**
  String fardRakats(int count);

  /// Pill label showing the number of optional sunnah rakats prayed before the obligatory prayer
  ///
  /// In en, this message translates to:
  /// **'{count} sunnah before'**
  String sunnahBefore(int count);

  /// Pill label showing the number of optional sunnah rakats prayed after the obligatory prayer
  ///
  /// In en, this message translates to:
  /// **'{count} sunnah after'**
  String sunnahAfter(int count);

  /// Description of when a prayer is performed, e.g. 'Prayed at dawn before sunrise'
  ///
  /// In en, this message translates to:
  /// **'Prayed at {time}'**
  String prayedAt(String time);

  /// Time-of-day phrase describing when Fajr is prayed, used inside prayedAt
  ///
  /// In en, this message translates to:
  /// **'dawn before sunrise'**
  String get timePeriodDawnBeforeSunrise;

  /// Time-of-day phrase describing when Dhuhr is prayed, used inside prayedAt
  ///
  /// In en, this message translates to:
  /// **'after the sun passes its highest point'**
  String get timePeriodAfterSunPassesHighestPoint;

  /// Time-of-day phrase describing when Asr is prayed, used inside prayedAt
  ///
  /// In en, this message translates to:
  /// **'in the late afternoon'**
  String get timePeriodLateAfternoon;

  /// Time-of-day phrase describing when Maghrib is prayed, used inside prayedAt
  ///
  /// In en, this message translates to:
  /// **'just after sunset'**
  String get timePeriodJustAfterSunset;

  /// Time-of-day phrase describing when Isha is prayed, used inside prayedAt
  ///
  /// In en, this message translates to:
  /// **'in the night before midnight'**
  String get timePeriodNightBeforeMidnight;

  /// Hadith quote shown in the expanded Fajr prayer card
  ///
  /// In en, this message translates to:
  /// **'The two rakats of Fajr are better than the world and all it contains. — Prophet Muhammad ﷺ'**
  String get fajrHadith;

  /// Beginner tip shown in the expanded Fajr prayer card
  ///
  /// In en, this message translates to:
  /// **'Fajr is the first prayer of the day. It reminds us to start our day remembering Allah.'**
  String get fajrTip;

  /// Hadith quote shown in the expanded Dhuhr prayer card
  ///
  /// In en, this message translates to:
  /// **'Whoever prays the twelve sunnah rakats, Allah will build a house for him in Paradise.'**
  String get dhuhrHadith;

  /// Beginner tip shown in the expanded Dhuhr prayer card
  ///
  /// In en, this message translates to:
  /// **'Dhuhr is the midday prayer. A perfect moment to pause your day and reconnect.'**
  String get dhuhrTip;

  /// Hadith quote shown in the expanded Asr prayer card
  ///
  /// In en, this message translates to:
  /// **'Whoever misses Asr prayer, it is as if he lost his family and wealth. — Prophet Muhammad ﷺ'**
  String get asrHadith;

  /// Beginner tip shown in the expanded Asr prayer card
  ///
  /// In en, this message translates to:
  /// **'Asr is often called the middle prayer. Allah specifically mentions it in the Quran (2:238).'**
  String get asrTip;

  /// Hadith quote shown in the expanded Maghrib prayer card
  ///
  /// In en, this message translates to:
  /// **'The prayer of Maghrib is the Witr of the day.'**
  String get maghribHadith;

  /// Beginner tip shown in the expanded Maghrib prayer card
  ///
  /// In en, this message translates to:
  /// **'Maghrib marks the end of the fasting day in Ramadan. It is prayed right as the sun sets.'**
  String get maghribTip;

  /// Hadith quote shown in the expanded Isha prayer card
  ///
  /// In en, this message translates to:
  /// **'Whoever prays Isha in congregation, it is as if he prayed half the night.'**
  String get ishaHadith;

  /// Beginner tip shown in the expanded Isha prayer card
  ///
  /// In en, this message translates to:
  /// **'Isha is the final prayer of the day. Ending your day with prayer brings peace and closure.'**
  String get ishaTip;

  /// Heading for the beginner-friendly tip shown in an expanded prayer card
  ///
  /// In en, this message translates to:
  /// **'New Muslim Tip'**
  String get newMuslimTip;

  /// State label/tooltip for an enabled prayer notification bell
  ///
  /// In en, this message translates to:
  /// **'Notifications on'**
  String get notificationsOn;

  /// State label/tooltip for a disabled prayer notification bell
  ///
  /// In en, this message translates to:
  /// **'Notifications off'**
  String get notificationsOff;

  /// Back-button label on the lock screen preview, indicating this is a sample of the lock screen
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// Sample countdown-and-time text shown in the next-prayer pill on the lock screen preview (illustrative placeholder, not live data)
  ///
  /// In en, this message translates to:
  /// **'In 1h 23m  ·  4:47 PM'**
  String get lockPreviewCountdown;

  /// Hint text at the bottom of the lock screen preview
  ///
  /// In en, this message translates to:
  /// **'Swipe up to unlock'**
  String get swipeUpToUnlock;

  /// Hint text for the Quran surah search field
  ///
  /// In en, this message translates to:
  /// **'Search surahs…'**
  String get searchSurahs;

  /// Message shown when a surah search returns no results
  ///
  /// In en, this message translates to:
  /// **'No surahs found'**
  String get noSurahsFound;

  /// Button label to retry loading data after a failure
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Number of verses in a surah
  ///
  /// In en, this message translates to:
  /// **'{count} ayahs'**
  String ayahs(int count);

  /// Hint text for the Duas search field
  ///
  /// In en, this message translates to:
  /// **'Search duas…'**
  String get searchDuas;

  /// Count of duas shown in the Duas list
  ///
  /// In en, this message translates to:
  /// **'{count} supplications'**
  String supplications(int count);

  /// Section header for prayer-related settings
  ///
  /// In en, this message translates to:
  /// **'Prayer Settings'**
  String get prayerSettings;

  /// Settings row label for choosing the prayer time calculation method
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get calculationMethod;

  /// Settings row label for choosing the call-to-prayer sound
  ///
  /// In en, this message translates to:
  /// **'Adhan Sound'**
  String get adhanSound;

  /// Settings toggle label for the master prayer notification switch
  ///
  /// In en, this message translates to:
  /// **'Prayer Notifications'**
  String get prayerNotifications;

  /// Section header for appearance-related settings
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Settings toggle label for switching between light and dark themes
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Settings row label for choosing the app language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Section header for the About section in Settings
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutNoorGuard;

  /// Settings row label showing the installed app version
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get version;

  /// Settings row action label to rate the app on the store
  ///
  /// In en, this message translates to:
  /// **'Rate Noor Guard'**
  String get rateApp;

  /// Settings row action label to share the app with others
  ///
  /// In en, this message translates to:
  /// **'Share Noor Guard'**
  String get shareApp;

  /// Settings row action label to contact app support
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// Settings row action label to view the privacy policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Settings row action label to view the terms of service
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Title of the translation feedback banner at the bottom of Settings
  ///
  /// In en, this message translates to:
  /// **'Help Us Improve'**
  String get helpUsImprove;

  /// Body text of the translation feedback banner explaining translations are AI-assisted and inviting feedback
  ///
  /// In en, this message translates to:
  /// **'Our translations are AI-assisted. If you notice any errors in your language, we\'d love your feedback!'**
  String get translationDisclaimer;

  /// Title of the privacy promise card in Settings
  ///
  /// In en, this message translates to:
  /// **'The Noor Guard Privacy Promise'**
  String get privacyPromiseTitle;

  /// Body text of the privacy promise card in Settings
  ///
  /// In en, this message translates to:
  /// **'Your faith is personal. Your data stays that way. We never sell, share or monetize your data. Not your location. Not your prayer habits. Not your name.'**
  String get privacyPromiseBody;

  /// Subtitle on the Qibla screen describing what the compass points to
  ///
  /// In en, this message translates to:
  /// **'Direction to the Sacred House'**
  String get directionToSacredHouse;

  /// Readout showing the bearing in degrees toward the Kaaba in Mecca
  ///
  /// In en, this message translates to:
  /// **'{degrees}° toward Mecca'**
  String towardMecca(String degrees);

  /// Fallback location label shown when the device location is unavailable
  ///
  /// In en, this message translates to:
  /// **'Sacramento, CA (default)'**
  String get defaultLocation;

  /// Title of the streak/prayer history calendar screen
  ///
  /// In en, this message translates to:
  /// **'Prayer History'**
  String get prayerHistory;

  /// Stat card label for the user's current consecutive-day streak
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get currentStreak;

  /// Stat card label for the user's longest consecutive-day streak
  ///
  /// In en, this message translates to:
  /// **'Longest Streak'**
  String get longestStreak;

  /// Heading for the calendar color legend
  ///
  /// In en, this message translates to:
  /// **'Legend'**
  String get legend;

  /// Legend item describing a fully-completed prayer day
  ///
  /// In en, this message translates to:
  /// **'All 5 prayers'**
  String get allFivePrayers;

  /// Legend item describing a partially-completed prayer day
  ///
  /// In en, this message translates to:
  /// **'Partial (1–4)'**
  String get partialPrayers;

  /// Legend item describing a day with no prayers completed
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Abbreviated weekday label for Sunday
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// Abbreviated weekday label for Monday
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// Abbreviated weekday label for Tuesday
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// Abbreviated weekday label for Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// Abbreviated weekday label for Thursday
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// Abbreviated weekday label for Friday
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// Abbreviated weekday label for Saturday
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// Compass heading readout in degrees
  ///
  /// In en, this message translates to:
  /// **'Heading {degrees}°'**
  String headingDegrees(String degrees);

  /// Error heading shown when the Quran surah list fails to load
  ///
  /// In en, this message translates to:
  /// **'Could not load surahs'**
  String get couldNotLoadSurahs;

  /// Error subtitle shown when the Quran surah list fails to load
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again'**
  String get connectionError;

  /// Title shown on the Quran screen header
  ///
  /// In en, this message translates to:
  /// **'Al-Quran'**
  String get alQuran;

  /// Subtitle shown on the Duas screen header
  ///
  /// In en, this message translates to:
  /// **'Daily Supplications'**
  String get dailySupplications;

  /// Label for the 'all categories' filter chip on the Duas screen
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Message shown when no duas match the search or selected category
  ///
  /// In en, this message translates to:
  /// **'No duas found'**
  String get noDuasFound;

  /// Full name of the month January
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// Full name of the month February
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// Full name of the month March
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// Full name of the month April
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// Full name of the month May
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// Full name of the month June
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// Full name of the month July
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// Full name of the month August
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// Full name of the month September
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// Full name of the month October
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// Full name of the month November
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// Full name of the month December
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// Bottom navigation label for the home tab
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Bottom navigation label for the prayers tab
  ///
  /// In en, this message translates to:
  /// **'Prayers'**
  String get prayers;

  /// Bottom navigation label for the more/settings tab
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Label for the Quran commentary feature
  ///
  /// In en, this message translates to:
  /// **'Tafsir'**
  String get tafsir;

  /// Label for the Islamic lock screen feature
  ///
  /// In en, this message translates to:
  /// **'Lock Screen'**
  String get lockScreen;

  /// Subtitle for the Quran feature tile
  ///
  /// In en, this message translates to:
  /// **'Read & listen'**
  String get readAndListen;

  /// Subtitle for the Tafsir feature tile
  ///
  /// In en, this message translates to:
  /// **'Commentary'**
  String get commentary;

  /// Subtitle for the Qibla feature tile
  ///
  /// In en, this message translates to:
  /// **'Find direction'**
  String get findDirection;

  /// Subtitle for the Lock Screen feature tile
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// Subtitle for the Focus Mode feature tile
  ///
  /// In en, this message translates to:
  /// **'Block distractions'**
  String get blockDistractions;

  /// Subtitle for the App Blocking feature tile
  ///
  /// In en, this message translates to:
  /// **'Prayer guard'**
  String get prayerGuard;

  /// Subtitle for the Islamic Calendar feature tile
  ///
  /// In en, this message translates to:
  /// **'Important dates'**
  String get importantDates;

  /// Placeholder text shown for features that are not yet built
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// Dua category label for morning and evening supplications
  ///
  /// In en, this message translates to:
  /// **'Morning & Evening'**
  String get morningAndEvening;

  /// Dua category label for prayer-related supplications
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayer;

  /// Dua category label for food and drink supplications
  ///
  /// In en, this message translates to:
  /// **'Food & Drink'**
  String get foodAndDrink;

  /// Quran quote shown in the home screen quote banner
  ///
  /// In en, this message translates to:
  /// **'Verily, with hardship comes ease.'**
  String get verityWithHardship;

  /// Quran reference (surah and ayah) for the home screen quote banner
  ///
  /// In en, this message translates to:
  /// **'Ash-Sharh 94:6'**
  String get ashSharh946;

  /// Quran verse shown as an overlay on the home screen hero card
  ///
  /// In en, this message translates to:
  /// **'Guard strictly your prayers, especially the middle prayer.'**
  String get guardStrictlyYourPrayers;

  /// Quran reference (surah and ayah) for the home screen hero card verse
  ///
  /// In en, this message translates to:
  /// **'Al-Baqarah 2:238'**
  String get alBaqarah2238;

  /// Section heading for past Islamic calendar events
  ///
  /// In en, this message translates to:
  /// **'Past Events'**
  String get pastEvents;

  /// Section heading for upcoming Islamic calendar events
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get upcomingEvents;

  /// Label on the Islamic calendar's current-date card; displayed in uppercase via the UI
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Badge label marking the soonest upcoming Islamic calendar event
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Hijri year with its era abbreviation (Anno Hegirae), e.g. '1447 AH'
  ///
  /// In en, this message translates to:
  /// **'{year} AH'**
  String hijriYearLabel(int year);

  /// Name of the 1st month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Muharram'**
  String get islamicMonthMuharram;

  /// Name of the 3rd month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Rabī\' Al-Awwal'**
  String get islamicMonthRabiAlAwwal;

  /// Name of the 9th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Ramadān'**
  String get islamicMonthRamadan;

  /// Name of the 10th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Shawwāl'**
  String get islamicMonthShawwal;

  /// Name of the 12th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Dhul Hijjah'**
  String get islamicMonthDhulHijjah;

  /// Name of the Islamic New Year holiday (1 Muharram), shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Islamic New Year'**
  String get islamicNewYear;

  /// Name of the Day of Ashura (10 Muharram), shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Ashura'**
  String get ashura;

  /// Name of the Prophet's birthday observance, shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Mawlid Al-Nabi'**
  String get mawlidAlNabi;

  /// Label marking the start of the month of Ramadan, shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Ramadan Begins'**
  String get ramadanBegins;

  /// Name of the Night of Decree (27 Ramadan), shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Laylat Al-Qadr'**
  String get laylatAlQadr;

  /// Name of the holiday marking the end of Ramadan, shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Eid Al-Fitr'**
  String get eidAlFitr;

  /// Name of the Day of Arafah (9 Dhul Hijjah), shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Day of Arafah'**
  String get dayOfArafah;

  /// Name of the Festival of Sacrifice, shown in the calendar event list
  ///
  /// In en, this message translates to:
  /// **'Eid Al-Adha'**
  String get eidAlAdha;

  /// Badge label shown in the Focus Mode header while a session is running
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Explanatory subtitle card shown on the Focus Mode screen
  ///
  /// In en, this message translates to:
  /// **'Protect your focus. Your apps are blocked until you stop.'**
  String get focusModeSubtitle;

  /// Label under the countdown timer while a focus session is running
  ///
  /// In en, this message translates to:
  /// **'remaining'**
  String get remaining;

  /// Label under the countdown timer when no focus session is running yet
  ///
  /// In en, this message translates to:
  /// **'ready'**
  String get ready;

  /// Heading for the focus session duration preset selector; displayed in uppercase via the UI
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// Abbreviated unit label shown under each duration preset number, e.g. '25 min'
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutesAbbreviation;

  /// Heading for the card listing apps blocked during a focus session
  ///
  /// In en, this message translates to:
  /// **'Blocked During Focus'**
  String get blockedDuringFocus;

  /// Count badge showing how many apps are blocked during focus mode
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {{count} app} other {{count} apps}}'**
  String appsBlockedCount(int count);

  /// Button label to begin a focus session
  ///
  /// In en, this message translates to:
  /// **'Start Focus'**
  String get startFocus;

  /// Button label to end an active focus session
  ///
  /// In en, this message translates to:
  /// **'Stop Focus'**
  String get stopFocus;

  /// Exclamation of gratitude to Allah, shown as the heading of the focus session completion dialog
  ///
  /// In en, this message translates to:
  /// **'Alhamdulillah!'**
  String get alhamdulillah;

  /// Subheading in the focus session completion dialog
  ///
  /// In en, this message translates to:
  /// **'Session Complete'**
  String get sessionComplete;

  /// Message in the completion dialog reporting how long the user focused, e.g. 'You stayed focused for 25 minutes.'
  ///
  /// In en, this message translates to:
  /// **'You stayed focused for {duration}.'**
  String stayedFocusedFor(String duration);

  /// Duration phrase used inside stayedFocusedFor, e.g. '25 minutes' or '1 minute'
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {{count} minute} other {{count} minutes}}'**
  String focusSessionMinutes(int count);

  /// Quran verse and reference shown in the focus session completion dialog
  ///
  /// In en, this message translates to:
  /// **'\"And seek help through patience and prayer.\"\n— Al-Baqarah 2:45'**
  String get focusCompletionQuote;

  /// Button label to dismiss the focus session completion dialog
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// App category name shown as a section heading in the App Blocking list
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get socialMedia;

  /// App category name shown as a section heading in the App Blocking list
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// App category name shown as a section heading in the App Blocking list
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get games;

  /// App category name shown as a section heading in the App Blocking list
  ///
  /// In en, this message translates to:
  /// **'Messaging'**
  String get messaging;

  /// Heading on the App Blocking screen's stats card
  ///
  /// In en, this message translates to:
  /// **'Block during prayer times'**
  String get blockDuringPrayerTimes;

  /// Explanatory subtitle on the App Blocking screen's stats card
  ///
  /// In en, this message translates to:
  /// **'Selected apps will be blocked automatically\nduring all 5 daily prayers.'**
  String get blockDuringPrayerTimesSubtitle;

  /// Label under the count of currently blocked apps on the App Blocking screen
  ///
  /// In en, this message translates to:
  /// **'blocked'**
  String get blockedLabel;

  /// Label for the master toggle that blocks every app on the App Blocking screen
  ///
  /// In en, this message translates to:
  /// **'Block all apps'**
  String get blockAllApps;

  /// Info banner on the App Blocking screen explaining when blocking turns on and off
  ///
  /// In en, this message translates to:
  /// **'Blocking activates 5 minutes before each prayer and lifts 15 minutes after.'**
  String get blockingTimingInfo;

  /// Status text shown under an app's name when it is set to be blocked
  ///
  /// In en, this message translates to:
  /// **'Blocked during prayers'**
  String get blockedDuringPrayers;

  /// Status text shown under an app's name when it is not set to be blocked
  ///
  /// In en, this message translates to:
  /// **'Not blocked'**
  String get notBlocked;

  /// Name of wudu step 1
  ///
  /// In en, this message translates to:
  /// **'Intention'**
  String get wuduStep1;

  /// Name of wudu step 2
  ///
  /// In en, this message translates to:
  /// **'Bismillah'**
  String get wuduStep2;

  /// Name of wudu step 3
  ///
  /// In en, this message translates to:
  /// **'Wash Hands'**
  String get wuduStep3;

  /// Name of wudu step 4
  ///
  /// In en, this message translates to:
  /// **'Rinse Mouth'**
  String get wuduStep4;

  /// Name of wudu step 5
  ///
  /// In en, this message translates to:
  /// **'Clean Nose'**
  String get wuduStep5;

  /// Name of wudu step 6
  ///
  /// In en, this message translates to:
  /// **'Wash Face'**
  String get wuduStep6;

  /// Name of wudu step 7
  ///
  /// In en, this message translates to:
  /// **'Wash Arms'**
  String get wuduStep7;

  /// Name of wudu step 8
  ///
  /// In en, this message translates to:
  /// **'Wipe Head'**
  String get wuduStep8;

  /// Name of wudu step 9
  ///
  /// In en, this message translates to:
  /// **'Wash Feet'**
  String get wuduStep9;

  /// Title for the new Muslim hub screen / home tile
  ///
  /// In en, this message translates to:
  /// **'Revert Corner'**
  String get revertCorner;

  /// Subtitle for the Revert Corner card
  ///
  /// In en, this message translates to:
  /// **'Guides and support for new Muslims'**
  String get revertCornerSubtitle;

  /// Title for the Wudu Guide screen and hub card
  ///
  /// In en, this message translates to:
  /// **'Wudu Guide'**
  String get wuduGuide;

  /// Title for the How to Pray screen and hub card
  ///
  /// In en, this message translates to:
  /// **'How to Pray'**
  String get howToPray;

  /// Title for the New Muslim Checklist screen and hub card
  ///
  /// In en, this message translates to:
  /// **'New Muslim Checklist'**
  String get newMuslimChecklist;

  /// Title for the Islamic Glossary hub card
  ///
  /// In en, this message translates to:
  /// **'Islamic Glossary'**
  String get islamicGlossary;

  /// Title for the Why Do We hub card
  ///
  /// In en, this message translates to:
  /// **'Why Do We...'**
  String get whyDoWe;

  /// Title for the Community Stories hub card
  ///
  /// In en, this message translates to:
  /// **'Community Stories'**
  String get communityStories;

  /// Subtitle for the Wudu Guide hub card
  ///
  /// In en, this message translates to:
  /// **'Purification before prayer'**
  String get wuduGuideSubtitle;

  /// Subtitle for the How to Pray hub card
  ///
  /// In en, this message translates to:
  /// **'Step by step salah guide'**
  String get howToPraySubtitle;

  /// Subtitle for the New Muslim Checklist hub card
  ///
  /// In en, this message translates to:
  /// **'Your 30-day journey'**
  String get newMuslimChecklistSubtitle;

  /// Name of how-to-pray step 1
  ///
  /// In en, this message translates to:
  /// **'Wudu First'**
  String get howToPrayStep1Name;

  /// Instruction text for how-to-pray step 1
  ///
  /// In en, this message translates to:
  /// **'Perform wudu (ablution) so that you are in a state of purity before you begin to pray.'**
  String get howToPrayStep1Instruction;

  /// Beginner tip for how-to-pray step 1
  ///
  /// In en, this message translates to:
  /// **'If you\'re unsure how, open the Wudu Guide from the New Muslim Hub first.'**
  String get howToPrayStep1Tip;

  /// Name of how-to-pray step 2
  ///
  /// In en, this message translates to:
  /// **'Stand Facing the Qibla'**
  String get howToPrayStep2Name;

  /// Instruction text for how-to-pray step 2
  ///
  /// In en, this message translates to:
  /// **'Stand on your prayer mat facing the Qibla — the direction of the Kaaba in Mecca. Use the Qibla compass in the app to find the exact direction.'**
  String get howToPrayStep2Instruction;

  /// Beginner tip for how-to-pray step 2
  ///
  /// In en, this message translates to:
  /// **'It\'s okay if you\'re slightly off — Allah knows your intention. Try your best.'**
  String get howToPrayStep2Tip;

  /// Name of how-to-pray step 3
  ///
  /// In en, this message translates to:
  /// **'Niyyah (Intention)'**
  String get howToPrayStep3Name;

  /// Instruction text for how-to-pray step 3
  ///
  /// In en, this message translates to:
  /// **'Make the intention in your heart for the prayer you are about to perform. You do not need to say it out loud.'**
  String get howToPrayStep3Instruction;

  /// Beginner tip for how-to-pray step 3
  ///
  /// In en, this message translates to:
  /// **'Your intention is between you and Allah. A simple thought like \'I am praying Fajr for Allah\' is enough.'**
  String get howToPrayStep3Tip;

  /// Name of how-to-pray step 4
  ///
  /// In en, this message translates to:
  /// **'Takbir (Opening)'**
  String get howToPrayStep4Name;

  /// Instruction text for how-to-pray step 4
  ///
  /// In en, this message translates to:
  /// **'Raise both hands to your earlobes and say \'Allahu Akbar\' (Allah is the Greatest). This officially begins your prayer.'**
  String get howToPrayStep4Instruction;

  /// Beginner tip for how-to-pray step 4
  ///
  /// In en, this message translates to:
  /// **'Keep your eyes focused downward toward your place of prostration throughout the prayer.'**
  String get howToPrayStep4Tip;

  /// Name of how-to-pray step 5
  ///
  /// In en, this message translates to:
  /// **'Qiyam (Standing)'**
  String get howToPrayStep5Name;

  /// Instruction text for how-to-pray step 5
  ///
  /// In en, this message translates to:
  /// **'Place your right hand over your left hand on your chest. Recite Surah Al-Faatiha followed by any other short surah or verses you know.'**
  String get howToPrayStep5Instruction;

  /// Beginner tip for how-to-pray step 5
  ///
  /// In en, this message translates to:
  /// **'If you don\'t know any other surah yet, reciting Al-Faatiha alone is acceptable while you are learning.'**
  String get howToPrayStep5Tip;

  /// Name of how-to-pray step 6
  ///
  /// In en, this message translates to:
  /// **'Ruku (Bowing)'**
  String get howToPrayStep6Name;

  /// Instruction text for how-to-pray step 6
  ///
  /// In en, this message translates to:
  /// **'Bow down by bending at the waist with your back parallel to the ground. Place your hands on your knees and say \'Subhana Rabbiyal Adheem\' three times.'**
  String get howToPrayStep6Instruction;

  /// Beginner tip for how-to-pray step 6
  ///
  /// In en, this message translates to:
  /// **'Keep your back straight and horizontal — not arched or rounded.'**
  String get howToPrayStep6Tip;

  /// Name of how-to-pray step 7
  ///
  /// In en, this message translates to:
  /// **'Itidal (Rising from Bowing)'**
  String get howToPrayStep7Name;

  /// Instruction text for how-to-pray step 7
  ///
  /// In en, this message translates to:
  /// **'Rise from bowing and stand upright. Say \'Sami Allahu liman hamidah\' (Allah hears those who praise Him) as you rise, then say \'Rabbana lakal hamd\'.'**
  String get howToPrayStep7Instruction;

  /// Beginner tip for how-to-pray step 7
  ///
  /// In en, this message translates to:
  /// **'Stand fully upright and be still for a moment before moving to the next position.'**
  String get howToPrayStep7Tip;

  /// Name of how-to-pray step 8
  ///
  /// In en, this message translates to:
  /// **'Sujood (Prostration)'**
  String get howToPrayStep8Name;

  /// Instruction text for how-to-pray step 8
  ///
  /// In en, this message translates to:
  /// **'Go down to the ground, placing your forehead, nose, both palms, knees, and toes on the floor. Say \'Subhana Rabbiyal A\'la\' three times.'**
  String get howToPrayStep8Instruction;

  /// Beginner tip for how-to-pray step 8
  ///
  /// In en, this message translates to:
  /// **'Seven body parts must touch the ground: forehead (with nose), two hands, two knees, and two feet.'**
  String get howToPrayStep8Tip;

  /// Name of how-to-pray step 9
  ///
  /// In en, this message translates to:
  /// **'Jalsa (Sitting Between Prostrations)'**
  String get howToPrayStep9Name;

  /// Instruction text for how-to-pray step 9
  ///
  /// In en, this message translates to:
  /// **'Sit up from prostration with your left foot flat and your right foot upright. Say \'Allahu Akbar\' as you sit. Pause briefly, then go back down for the second prostration.'**
  String get howToPrayStep9Instruction;

  /// Beginner tip for how-to-pray step 9
  ///
  /// In en, this message translates to:
  /// **'This brief sitting between the two prostrations is called Jalsa. It is a required part of the prayer.'**
  String get howToPrayStep9Tip;

  /// Name of how-to-pray step 10
  ///
  /// In en, this message translates to:
  /// **'Complete the Rakats'**
  String get howToPrayStep10Name;

  /// Instruction text for how-to-pray step 10
  ///
  /// In en, this message translates to:
  /// **'After completing the first rakat, stand up and repeat the same steps for the second rakat. The number of rakats depends on which prayer you are performing.'**
  String get howToPrayStep10Instruction;

  /// Beginner tip for how-to-pray step 10
  ///
  /// In en, this message translates to:
  /// **'Fajr has 2 rakats, Dhuhr 4, Asr 4, Maghrib 3, and Isha 4. Take it one rakat at a time.'**
  String get howToPrayStep10Tip;

  /// Name of how-to-pray step 11
  ///
  /// In en, this message translates to:
  /// **'Tashahhud (Final Sitting)'**
  String get howToPrayStep11Name;

  /// Instruction text for how-to-pray step 11
  ///
  /// In en, this message translates to:
  /// **'In the final sitting position, recite the Tashahhud. This is a declaration of faith that you recite while seated after your last rakat.'**
  String get howToPrayStep11Instruction;

  /// Beginner tip for how-to-pray step 11
  ///
  /// In en, this message translates to:
  /// **'During Tashahhud, raise your right index finger when you say \'Ash-hadu alla ilaha illallah\' as a sign of the oneness of Allah.'**
  String get howToPrayStep11Tip;

  /// Name of how-to-pray step 12
  ///
  /// In en, this message translates to:
  /// **'Tasleem (Closing)'**
  String get howToPrayStep12Name;

  /// Instruction text for how-to-pray step 12
  ///
  /// In en, this message translates to:
  /// **'Turn your head to the right and say \'Assalamu Alaikum wa Rahmatullah\', then turn to the left and repeat. This ends your prayer.'**
  String get howToPrayStep12Instruction;

  /// Beginner tip for how-to-pray step 12
  ///
  /// In en, this message translates to:
  /// **'After the prayer, take a moment to make dua (supplication) and ask Allah for what you need. This is a beautiful time to connect with Allah.'**
  String get howToPrayStep12Tip;

  /// Heading for checklist week 1
  ///
  /// In en, this message translates to:
  /// **'Week 1'**
  String get checklistWeek1Title;

  /// Heading for checklist week 2
  ///
  /// In en, this message translates to:
  /// **'Week 2'**
  String get checklistWeek2Title;

  /// Heading for checklist week 3
  ///
  /// In en, this message translates to:
  /// **'Week 3'**
  String get checklistWeek3Title;

  /// Heading for checklist week 4
  ///
  /// In en, this message translates to:
  /// **'Week 4'**
  String get checklistWeek4Title;

  /// Checklist item 1 for week 1
  ///
  /// In en, this message translates to:
  /// **'Take Shahada'**
  String get checklistWeek1Item1;

  /// Checklist item 2 for week 1
  ///
  /// In en, this message translates to:
  /// **'Learn Wudu'**
  String get checklistWeek1Item2;

  /// Checklist item 3 for week 1
  ///
  /// In en, this message translates to:
  /// **'Learn Al-Faatiha'**
  String get checklistWeek1Item3;

  /// Checklist item 4 for week 1
  ///
  /// In en, this message translates to:
  /// **'Pray first Fajr'**
  String get checklistWeek1Item4;

  /// Checklist item 5 for week 1
  ///
  /// In en, this message translates to:
  /// **'Get a prayer mat'**
  String get checklistWeek1Item5;

  /// Checklist item 6 for week 1
  ///
  /// In en, this message translates to:
  /// **'Find local mosque'**
  String get checklistWeek1Item6;

  /// Checklist item 1 for week 2
  ///
  /// In en, this message translates to:
  /// **'Learn all 5 prayer times'**
  String get checklistWeek2Item1;

  /// Checklist item 2 for week 2
  ///
  /// In en, this message translates to:
  /// **'Learn basic duas'**
  String get checklistWeek2Item2;

  /// Checklist item 3 for week 2
  ///
  /// In en, this message translates to:
  /// **'Read about Prophet Muhammad'**
  String get checklistWeek2Item3;

  /// Checklist item 4 for week 2
  ///
  /// In en, this message translates to:
  /// **'Connect with Muslim community'**
  String get checklistWeek2Item4;

  /// Checklist item 1 for week 3
  ///
  /// In en, this message translates to:
  /// **'Learn about halal food'**
  String get checklistWeek3Item1;

  /// Checklist item 2 for week 3
  ///
  /// In en, this message translates to:
  /// **'Read Surah Al-Ikhlas'**
  String get checklistWeek3Item2;

  /// Checklist item 3 for week 3
  ///
  /// In en, this message translates to:
  /// **'Learn about Ramadan'**
  String get checklistWeek3Item3;

  /// Checklist item 4 for week 3
  ///
  /// In en, this message translates to:
  /// **'Start daily dhikr'**
  String get checklistWeek3Item4;

  /// Checklist item 1 for week 4
  ///
  /// In en, this message translates to:
  /// **'Learn about Zakat'**
  String get checklistWeek4Item1;

  /// Checklist item 2 for week 4
  ///
  /// In en, this message translates to:
  /// **'Read about the 5 pillars'**
  String get checklistWeek4Item2;

  /// Checklist item 3 for week 4
  ///
  /// In en, this message translates to:
  /// **'Set up prayer notifications'**
  String get checklistWeek4Item3;

  /// Checklist item 4 for week 4
  ///
  /// In en, this message translates to:
  /// **'Reflect on your journey'**
  String get checklistWeek4Item4;

  /// Wudu step 1 instruction
  ///
  /// In en, this message translates to:
  /// **'Make the intention in your heart to perform wudu for the sake of Allah.'**
  String get wuduStep1Instruction;

  /// Wudu step 1 tip
  ///
  /// In en, this message translates to:
  /// **'You don\'t need to say it out loud — a sincere intention in the heart is enough.'**
  String get wuduStep1Tip;

  /// Wudu step 2 instruction
  ///
  /// In en, this message translates to:
  /// **'Say Bismillah (In the name of Allah) before you begin.'**
  String get wuduStep2Instruction;

  /// Wudu step 2 tip
  ///
  /// In en, this message translates to:
  /// **'Saying Bismillah is sunnah and begins your wudu with the remembrance of Allah.'**
  String get wuduStep2Tip;

  /// Wudu step 3 instruction
  ///
  /// In en, this message translates to:
  /// **'Wash both hands up to the wrists three times, making sure water reaches between the fingers.'**
  String get wuduStep3Instruction;

  /// Wudu step 3 tip
  ///
  /// In en, this message translates to:
  /// **'Start with the right hand, then the left. This order is recommended in Islam.'**
  String get wuduStep3Tip;

  /// Wudu step 4 instruction
  ///
  /// In en, this message translates to:
  /// **'Take water in your mouth, swirl it around, and spit it out. Do this three times.'**
  String get wuduStep4Instruction;

  /// Wudu step 4 tip
  ///
  /// In en, this message translates to:
  /// **'This cleanses the mouth and is part of the purification process.'**
  String get wuduStep4Tip;

  /// Wudu step 5 instruction
  ///
  /// In en, this message translates to:
  /// **'Sniff water into your nostrils and blow it out gently. Do this three times.'**
  String get wuduStep5Instruction;

  /// Wudu step 5 tip
  ///
  /// In en, this message translates to:
  /// **'Use your right hand to sniff water and your left hand to blow it out.'**
  String get wuduStep5Tip;

  /// Wudu step 6 instruction
  ///
  /// In en, this message translates to:
  /// **'Wash your entire face three times, from the hairline to the chin and from ear to ear.'**
  String get wuduStep6Instruction;

  /// Wudu step 6 tip
  ///
  /// In en, this message translates to:
  /// **'Make sure no part of your face is left dry.'**
  String get wuduStep6Tip;

  /// Wudu step 7 instruction
  ///
  /// In en, this message translates to:
  /// **'Wash your right arm from fingertips to elbow three times, then do the same with the left arm.'**
  String get wuduStep7Instruction;

  /// Wudu step 7 tip
  ///
  /// In en, this message translates to:
  /// **'Always start with the right side before the left in wudu.'**
  String get wuduStep7Tip;

  /// Wudu step 8 instruction
  ///
  /// In en, this message translates to:
  /// **'Wet your hands and wipe over your entire head once, from front to back and back to front.'**
  String get wuduStep8Instruction;

  /// Wudu step 8 tip
  ///
  /// In en, this message translates to:
  /// **'Unlike washing, wiping the head is done only once.'**
  String get wuduStep8Tip;

  /// Wudu step 9 instruction
  ///
  /// In en, this message translates to:
  /// **'Wash your right foot up to and including the ankle three times, then do the same with the left foot.'**
  String get wuduStep9Instruction;

  /// Wudu step 9 tip
  ///
  /// In en, this message translates to:
  /// **'Make sure water reaches between the toes. Use your finger to clean between them.'**
  String get wuduStep9Tip;

  /// Title for Islamic Glossary screen
  ///
  /// In en, this message translates to:
  /// **'Islamic Glossary'**
  String get islamicGlossaryTitle;

  /// Subtitle for Islamic Glossary screen
  ///
  /// In en, this message translates to:
  /// **'51 terms from Quran, Sunnah, and classical scholarship'**
  String get islamicGlossarySubtitle;

  /// Hint text in glossary search bar
  ///
  /// In en, this message translates to:
  /// **'Search terms, Arabic, definitions...'**
  String get searchTermsHint;

  /// Filter chip label for all categories
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// Filter chip label for pillar category
  ///
  /// In en, this message translates to:
  /// **'Pillar'**
  String get categoryPillar;

  /// Filter chip label for aqeedah category
  ///
  /// In en, this message translates to:
  /// **'Aqeedah'**
  String get categoryAqeedah;

  /// Filter chip label for practice category
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get categoryPractice;

  /// Filter chip label for dhikr category
  ///
  /// In en, this message translates to:
  /// **'Dhikr'**
  String get categoryDhikr;

  /// Filter chip label for quran category
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get categoryQuran;

  /// Filter chip label for hadith category
  ///
  /// In en, this message translates to:
  /// **'Hadith'**
  String get categoryHadith;

  /// Filter chip label for fiqh category
  ///
  /// In en, this message translates to:
  /// **'Fiqh'**
  String get categoryFiqh;

  /// Filter chip label for Islamic history category
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get categoryHistory;

  /// Empty state message when no glossary terms match
  ///
  /// In en, this message translates to:
  /// **'No terms found'**
  String get noTermsFound;

  /// Label for source citations in glossary
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceLabel;

  /// Subtitle for Revert Corner hub screen
  ///
  /// In en, this message translates to:
  /// **'A gentle hub to guide your first steps as a new Muslim'**
  String get revertCornerHubSubtitle;

  /// Hub card subtitle for Islamic Glossary
  ///
  /// In en, this message translates to:
  /// **'Common terms explained simply'**
  String get islamicGlossaryHubSubtitle;

  /// Hub card subtitle for Why Do We screen
  ///
  /// In en, this message translates to:
  /// **'The wisdom behind everyday practices'**
  String get whyDoWeHubSubtitle;

  /// Hub card subtitle for Community Stories
  ///
  /// In en, this message translates to:
  /// **'Reverts share their journeys to Islam'**
  String get communityStoriesHubSubtitle;

  /// Subtitle for Why Do We screen
  ///
  /// In en, this message translates to:
  /// **'Wisdom behind 12 everyday Islamic practices'**
  String get whyDoWeScreenSubtitle;

  /// Badge label for Quran/hadith source citations on Why Do We cards
  ///
  /// In en, this message translates to:
  /// **'Sunni Source'**
  String get whyDoWeSourceBadge;

  /// Why Do We question 1
  ///
  /// In en, this message translates to:
  /// **'Why do we pray 5 times a day?'**
  String get whyDoWeQ1;

  /// Why Do We answer 1
  ///
  /// In en, this message translates to:
  /// **'Allah commanded the five daily prayers in the Quran (2:238) and they were established during the Night Journey (Isra wal Miraj). The Prophet said: The first matter that the slave will be brought to account for on the Day of Judgment is the prayer. (Ibn Majah). Prayer keeps us connected to Allah throughout the day.'**
  String get whyDoWeA1;

  /// Why Do We question 2
  ///
  /// In en, this message translates to:
  /// **'Why do we face Mecca when we pray?'**
  String get whyDoWeQ2;

  /// Why Do We answer 2
  ///
  /// In en, this message translates to:
  /// **'Allah commanded in the Quran (2:144): \"Turn your face toward the Sacred Mosque.\" The Kaaba in Mecca is the first house built for the worship of Allah (3:96). Facing the same direction unites all Muslims in prayer worldwide.'**
  String get whyDoWeA2;

  /// Why Do We question 3
  ///
  /// In en, this message translates to:
  /// **'Why do we fast in Ramadan?'**
  String get whyDoWeQ3;

  /// Why Do We answer 3
  ///
  /// In en, this message translates to:
  /// **'Allah commanded fasting in the Quran (2:183): \"O you who believe, fasting has been prescribed for you as it was prescribed for those before you, so that you may achieve taqwa.\" Ramadan is the month the Quran was revealed (2:185).'**
  String get whyDoWeA3;

  /// Why Do We question 4
  ///
  /// In en, this message translates to:
  /// **'Why do we say Bismillah before eating?'**
  String get whyDoWeQ4;

  /// Why Do We answer 4
  ///
  /// In en, this message translates to:
  /// **'The Prophet said: \"When one of you eats, he should mention Allah\'s name. If he forgets at the beginning, he should say Bismillah awwalahu wa akhirahu.\" (Abu Dawud). It reminds us that all blessings come from Allah.'**
  String get whyDoWeA4;

  /// Why Do We question 5
  ///
  /// In en, this message translates to:
  /// **'Why do we remove shoes before entering a mosque?'**
  String get whyDoWeQ5;

  /// Why Do We answer 5
  ///
  /// In en, this message translates to:
  /// **'When Moses was commanded by Allah: \"Remove your sandals, for you are in the sacred valley of Tuwa.\" (Quran 20:12). Removing shoes shows respect for the house of Allah and keeps the place of prayer clean.'**
  String get whyDoWeA5;

  /// Why Do We question 6
  ///
  /// In en, this message translates to:
  /// **'Why do we say Assalamu Alaikum as a greeting?'**
  String get whyDoWeQ6;

  /// Why Do We answer 6
  ///
  /// In en, this message translates to:
  /// **'The Prophet said: \"You will not enter paradise until you believe, and you will not believe until you love one another. Shall I tell you of something that will make you love one another? Spread peace (salam) among yourselves.\" (Muslim). It is also a dua — you are praying for peace upon that person.'**
  String get whyDoWeA6;

  /// Why Do We question 7
  ///
  /// In en, this message translates to:
  /// **'Why do we perform Hajj?'**
  String get whyDoWeQ7;

  /// Why Do We answer 7
  ///
  /// In en, this message translates to:
  /// **'Hajj was commanded by Allah (3:97): \"Pilgrimage to this House is an obligation by Allah upon whoever is able.\" It commemorates the trials of Prophet Ibrahim and his family, and unites Muslims from every nation in worship.'**
  String get whyDoWeA7;

  /// Why Do We question 8
  ///
  /// In en, this message translates to:
  /// **'Why do we give Zakat?'**
  String get whyDoWeQ8;

  /// Why Do We answer 8
  ///
  /// In en, this message translates to:
  /// **'Zakat is the third pillar of Islam, commanded in the Quran over 30 times alongside prayer. The Prophet said it purifies wealth. It reduces inequality and reminds believers that wealth belongs to Allah.'**
  String get whyDoWeA8;

  /// Why Do We question 9
  ///
  /// In en, this message translates to:
  /// **'Why do we say Alhamdulillah after sneezing?'**
  String get whyDoWeQ9;

  /// Why Do We answer 9
  ///
  /// In en, this message translates to:
  /// **'The Prophet said: \"When one of you sneezes, let him say Alhamdulillah, and let his brother or companion say Yarhamukallah.\" (Bukhari). It is a moment of gratitude to Allah for the blessing of health.'**
  String get whyDoWeA9;

  /// Why Do We question 10
  ///
  /// In en, this message translates to:
  /// **'Why do Muslim women wear hijab?'**
  String get whyDoWeQ10;

  /// Why Do We answer 10
  ///
  /// In en, this message translates to:
  /// **'Allah commanded in the Quran (24:31) that believing women should guard their modesty. The hijab is an act of worship and obedience to Allah. Many Muslim women wear it as a source of identity, dignity, and spiritual connection.'**
  String get whyDoWeA10;

  /// Why Do We question 11
  ///
  /// In en, this message translates to:
  /// **'Why do we avoid pork and alcohol?'**
  String get whyDoWeQ11;

  /// Why Do We answer 11
  ///
  /// In en, this message translates to:
  /// **'Allah prohibited pork in the Quran (2:173) and alcohol in (5:90), calling it \"an abomination from the work of Satan.\" These prohibitions protect health, the mind, and the family. Halal guidelines help believers maintain physical and spiritual purity.'**
  String get whyDoWeA11;

  /// Why Do We question 12
  ///
  /// In en, this message translates to:
  /// **'Why do we say Inshallah?'**
  String get whyDoWeQ12;

  /// Why Do We answer 12
  ///
  /// In en, this message translates to:
  /// **'Allah commands in the Quran (18:23-24): \"Never say about anything: I will do that tomorrow, without adding: If Allah wills.\" Saying Inshallah acknowledges that only Allah controls the future and keeps us humble.'**
  String get whyDoWeA12;

  /// Subtitle for Community Stories screen
  ///
  /// In en, this message translates to:
  /// **'Real journeys to Islam from around the world'**
  String get communityStoriesScreenSubtitle;

  /// Label for time-as-Muslim badge on story cards
  ///
  /// In en, this message translates to:
  /// **'Time as Muslim'**
  String get communityStoriesTimeLabel;

  /// Button label to share a revert story
  ///
  /// In en, this message translates to:
  /// **'Share Your Story'**
  String get communityStoriesShareBtn;

  /// Snackbar message when share button is tapped
  ///
  /// In en, this message translates to:
  /// **'Coming soon — this feature is on the way!'**
  String get communityStoriesShareSoon;

  /// Name for community story 1
  ///
  /// In en, this message translates to:
  /// **'Aisha (formerly Sarah)'**
  String get communityStory1Name;

  /// Location for community story 1
  ///
  /// In en, this message translates to:
  /// **'Texas, USA'**
  String get communityStory1Location;

  /// Time as Muslim for community story 1
  ///
  /// In en, this message translates to:
  /// **'2 years'**
  String get communityStory1Time;

  /// Story text for community story 1
  ///
  /// In en, this message translates to:
  /// **'I came across Islam while doing research for a college paper. I expected to find what the media told me. Instead I found peace, logic, and a God who actually made sense. I took my shahada 6 months later. The hardest part wasn\'t learning to pray — it was telling my family. But Alhamdulillah, two years later, my mother is asking me questions about Islam herself.'**
  String get communityStory1Text;

  /// Name for community story 2
  ///
  /// In en, this message translates to:
  /// **'Yusuf (formerly James)'**
  String get communityStory2Name;

  /// Location for community story 2
  ///
  /// In en, this message translates to:
  /// **'London, UK'**
  String get communityStory2Location;

  /// Time as Muslim for community story 2
  ///
  /// In en, this message translates to:
  /// **'4 years'**
  String get communityStory2Time;

  /// Story text for community story 2
  ///
  /// In en, this message translates to:
  /// **'I reverted after years of searching. Christianity, Buddhism, atheism — nothing filled the void. A Muslim coworker invited me to Friday prayer. I sat in the back and cried the entire time. I didn\'t even know why. I took my shahada the following week. The community wrapped around me like a family I never knew I needed.'**
  String get communityStory2Text;

  /// Name for community story 3
  ///
  /// In en, this message translates to:
  /// **'Maryam (formerly Maria)'**
  String get communityStory3Name;

  /// Location for community story 3
  ///
  /// In en, this message translates to:
  /// **'Mexico City, Mexico'**
  String get communityStory3Location;

  /// Time as Muslim for community story 3
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get communityStory3Time;

  /// Story text for community story 3
  ///
  /// In en, this message translates to:
  /// **'Being Latina and Muslim feels like a superpower. I found Islam through a YouTube video at 2am. I watched for hours. The concept of tawheed — that God is one, has no partners, no images — it resonated so deeply. My Spanish-speaking sisters at the mosque made me feel at home immediately.'**
  String get communityStory3Text;

  /// Name for community story 4
  ///
  /// In en, this message translates to:
  /// **'Ibrahim (formerly David)'**
  String get communityStory4Name;

  /// Location for community story 4
  ///
  /// In en, this message translates to:
  /// **'Toronto, Canada'**
  String get communityStory4Location;

  /// Time as Muslim for community story 4
  ///
  /// In en, this message translates to:
  /// **'6 years'**
  String get communityStory4Time;

  /// Story text for community story 4
  ///
  /// In en, this message translates to:
  /// **'I was a pastor\'s son. I had questions about the Trinity that no one could answer. When I read the Quran for the first time, I felt like I was reading something I already believed. I said my shahada quietly, alone, and then again at the mosque. Best decision of my life.'**
  String get communityStory4Text;

  /// Name for community story 5
  ///
  /// In en, this message translates to:
  /// **'Fatima (formerly Jennifer)'**
  String get communityStory5Name;

  /// Location for community story 5
  ///
  /// In en, this message translates to:
  /// **'Sydney, Australia'**
  String get communityStory5Location;

  /// Time as Muslim for community story 5
  ///
  /// In en, this message translates to:
  /// **'3 years'**
  String get communityStory5Time;

  /// Story text for community story 5
  ///
  /// In en, this message translates to:
  /// **'My journey started with a hijab. I put one on as a dare and felt... protected. I started reading about Islam and couldn\'t stop. Within three months I had taken my shahada. People ask me what I gave up. I tell them I gave up emptiness.'**
  String get communityStory5Text;

  /// Name for community story 6
  ///
  /// In en, this message translates to:
  /// **'Omar (formerly Kevin)'**
  String get communityStory6Name;

  /// Location for community story 6
  ///
  /// In en, this message translates to:
  /// **'Johannesburg, South Africa'**
  String get communityStory6Location;

  /// Time as Muslim for community story 6
  ///
  /// In en, this message translates to:
  /// **'5 years'**
  String get communityStory6Time;

  /// Story text for community story 6
  ///
  /// In en, this message translates to:
  /// **'I grew up in a rough neighborhood. Islam gave me discipline, purpose, and brotherhood. The first time I made sujood, something in me broke open — in the best way. I wept and couldn\'t explain why. Now I mentor other young men finding their way to the deen.'**
  String get communityStory6Text;

  /// Secondary tagline on Community Stories screen header
  ///
  /// In en, this message translates to:
  /// **'Inspired by real revert journeys'**
  String get inspiredByRealStories;

  /// Title of the story submission bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Share Your Story'**
  String get storyFormTitle;

  /// Label for the name field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get storyFormNameLabel;

  /// Hint text for the name field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Name, or write \'Anonymous\''**
  String get storyFormNameHint;

  /// Label for the country field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get storyFormCountryLabel;

  /// Hint text for the country field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Where are you from?'**
  String get storyFormCountryHint;

  /// Label for the time-as-Muslim field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Time as Muslim'**
  String get storyFormTimeLabel;

  /// Hint text for the time-as-Muslim field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'e.g. 2 years, 6 months'**
  String get storyFormTimeHint;

  /// Label for the story text field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Your Story'**
  String get storyFormStoryLabel;

  /// Hint text for the story text field in the story submission form
  ///
  /// In en, this message translates to:
  /// **'Share your journey to Islam...'**
  String get storyFormStoryHint;

  /// Button label to submit the story form
  ///
  /// In en, this message translates to:
  /// **'Submit Story'**
  String get storyFormSubmitBtn;

  /// Thank you heading shown after successful story submission
  ///
  /// In en, this message translates to:
  /// **'JazakAllah Khair!'**
  String get storyFormThankYouTitle;

  /// Thank you body text shown after successful story submission
  ///
  /// In en, this message translates to:
  /// **'Your story has been received. We review all submissions before publishing.'**
  String get storyFormThankYouBody;

  /// Validation error snackbar when story form fields are empty
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get storyFormRequiredError;

  /// Subtitle tagline on the Revert Corner premium banner card
  ///
  /// In en, this message translates to:
  /// **'Your guide to Islam'**
  String get subtitleYourGuideToIslam;

  /// Toggle label for Beginner Mode in Settings
  ///
  /// In en, this message translates to:
  /// **'Beginner Mode'**
  String get beginnerMode;

  /// Subtitle for the Beginner Mode toggle in Settings
  ///
  /// In en, this message translates to:
  /// **'Extra tips and guidance for new Muslims'**
  String get beginnerModeSubtitle;

  /// SnackBar message shown when Beginner Mode is turned on
  ///
  /// In en, this message translates to:
  /// **'Beginner Mode is on — extra tips are shown throughout the app'**
  String get beginnerModeOn;

  /// Beginner tip banner shown at the top of the Prayers screen when Beginner Mode is on
  ///
  /// In en, this message translates to:
  /// **'Tip: Tap each prayer to learn more about it and see sunnah prayers'**
  String get beginnerModePrayersTip;

  /// Subtitle on the Tafsir screen header
  ///
  /// In en, this message translates to:
  /// **'Quranic Commentary'**
  String get tafsirSubtitle;

  /// Message shown when no tafsir content is available for a surah
  ///
  /// In en, this message translates to:
  /// **'Tafsir for this surah coming soon'**
  String get tafsirComingSoon;

  /// Message shown when neither hardcoded nor online tafsir content is available for a surah
  ///
  /// In en, this message translates to:
  /// **'Tafsir not available'**
  String get tafsirNotAvailable;

  /// Label for the scholar source badge on a tafsir verse card
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get scholarSource;

  /// Heading for the Asbab al-Nuzul (reason for revelation) section on a tafsir verse card
  ///
  /// In en, this message translates to:
  /// **'Reason for Revelation'**
  String get asbabAlNuzul;

  /// Label for the Latin-script transliteration of an Arabic verse
  ///
  /// In en, this message translates to:
  /// **'Transliteration'**
  String get transliteration;

  /// Heading for the reciter selector on the Quran surah screen
  ///
  /// In en, this message translates to:
  /// **'Select Reciter'**
  String get selectReciter;

  /// Tooltip/label for the button that plays audio recitation of a verse
  ///
  /// In en, this message translates to:
  /// **'Play verse'**
  String get playVerse;

  /// Title of the 99 Names of Allah screen
  ///
  /// In en, this message translates to:
  /// **'Asma ul Husna'**
  String get asmaUlHusna;

  /// Subtitle on the Asma ul Husna screen
  ///
  /// In en, this message translates to:
  /// **'The 99 Beautiful Names of Allah'**
  String get asmaUlHusnaSubtitle;

  /// Hadith quoted on the Asma ul Husna screen
  ///
  /// In en, this message translates to:
  /// **'Allah has 99 names. Whoever memorizes them will enter Paradise.'**
  String get asmaHadith;

  /// Citation source for the Asma ul Husna hadith
  ///
  /// In en, this message translates to:
  /// **'Sahih al-Bukhari, 2736'**
  String get asmaHadithSource;

  /// Placeholder text for the search field on the Asma ul Husna screen
  ///
  /// In en, this message translates to:
  /// **'Search names...'**
  String get asmaSearchHint;

  /// Message shown when a search on the Asma ul Husna screen returns no results
  ///
  /// In en, this message translates to:
  /// **'No names found'**
  String get asmaNoResults;

  /// Heading for the expanded explanation of a name on the Asma ul Husna screen
  ///
  /// In en, this message translates to:
  /// **'Significance'**
  String get asmaSignificance;

  /// Label for the 99 Names feature tile on the home screen
  ///
  /// In en, this message translates to:
  /// **'99 Names'**
  String get asmaUlHusnaTile;

  /// Subtitle for the 99 Names feature tile on the home screen
  ///
  /// In en, this message translates to:
  /// **'Names of Allah'**
  String get asmaUlHusnaTileSubtitle;

  /// App tagline shown on the onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Guard your time. Honor your prayers.'**
  String get onboardingTagline;

  /// Divider label above the language picker on the onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get onboardingChooseLanguage;

  /// Button label to continue from the onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// Title on the onboarding location-permission page
  ///
  /// In en, this message translates to:
  /// **'Accurate Prayer Times'**
  String get onboardingLocationTitle;

  /// Description on the onboarding location-permission page
  ///
  /// In en, this message translates to:
  /// **'Noor Guard needs your location to calculate accurate prayer times for your city. Your location is never stored or shared.'**
  String get onboardingLocationDesc;

  /// Privacy reassurance banner on the onboarding location-permission page
  ///
  /// In en, this message translates to:
  /// **'Your faith is personal. Your data stays that way.'**
  String get onboardingPrivacyBanner;

  /// Button label to grant location permission during onboarding
  ///
  /// In en, this message translates to:
  /// **'Allow Location'**
  String get onboardingAllowLocation;

  /// Link to skip the location-permission step during onboarding
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get onboardingSkipForNow;

  /// Title on the onboarding notification-permission page
  ///
  /// In en, this message translates to:
  /// **'Never Miss a Prayer'**
  String get onboardingNotificationTitle;

  /// Description on the onboarding notification-permission page
  ///
  /// In en, this message translates to:
  /// **'Get notified at every prayer time with a beautiful adhan. Customise sounds and timing in settings.'**
  String get onboardingNotificationDesc;

  /// Feature chip label on the onboarding notification-permission page
  ///
  /// In en, this message translates to:
  /// **'Adhan alerts'**
  String get onboardingAdhanAlerts;

  /// Feature chip label on the onboarding notification-permission page
  ///
  /// In en, this message translates to:
  /// **'Custom timing'**
  String get onboardingCustomTiming;

  /// Feature chip label on the onboarding notification-permission page
  ///
  /// In en, this message translates to:
  /// **'Adjustable'**
  String get onboardingAdjustable;

  /// Button label to grant notification permission during onboarding
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get onboardingEnableNotifications;

  /// Link to skip the notification-permission step during onboarding
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get onboardingMaybeLater;

  /// Title on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'You\'re All Set!'**
  String get onboardingAllSetTitle;

  /// Description on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Noor Guard is ready to protect your time\nand guide your day with intention.'**
  String get onboardingAllSetDesc;

  /// Feature summary label on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get onboardingPrayerTimesLabel;

  /// Feature summary description on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Accurate times for your city'**
  String get onboardingPrayerTimesDesc;

  /// Feature summary label on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Islamic Lock Screen'**
  String get onboardingLockScreenLabel;

  /// Feature summary description on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Quran and duas on every unlock'**
  String get onboardingLockScreenDesc;

  /// Feature summary label on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Prayer Guard'**
  String get onboardingPrayerGuardLabel;

  /// Feature summary description on the final onboarding completion page
  ///
  /// In en, this message translates to:
  /// **'Apps blocked automatically during salah'**
  String get onboardingPrayerGuardDesc;

  /// Button label to finish onboarding and enter the app
  ///
  /// In en, this message translates to:
  /// **'Enter Noor Guard'**
  String get onboardingEnterApp;

  /// Title of the Adhan (call to prayer) audio player screen, and label for its feature tile on the home screen
  ///
  /// In en, this message translates to:
  /// **'Adhan'**
  String get adhan;

  /// Subtitle for the Adhan screen and its feature tile on the home screen
  ///
  /// In en, this message translates to:
  /// **'The Call to Prayer'**
  String get adhanSubtitle;

  /// Brief description of what the Adhan is, shown at the top of the Adhan screen
  ///
  /// In en, this message translates to:
  /// **'The Adhan is the Islamic call to prayer, announced 5 times daily to invite believers to worship.'**
  String get adhanDescription;

  /// Name of the Makkah adhan style
  ///
  /// In en, this message translates to:
  /// **'Makkah'**
  String get makkahStyle;

  /// Name of the Madinah adhan style
  ///
  /// In en, this message translates to:
  /// **'Madinah'**
  String get madinahStyle;

  /// Name of the Egyptian adhan style
  ///
  /// In en, this message translates to:
  /// **'Egyptian'**
  String get egyptianStyle;

  /// Label shown in the mini player when an adhan is playing
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get adhanPlaying;

  /// Description of the Makkah adhan style
  ///
  /// In en, this message translates to:
  /// **'The traditional call to prayer from the Grand Mosque in Makkah.'**
  String get makkahDescription;

  /// Description of the Madinah adhan style
  ///
  /// In en, this message translates to:
  /// **'A serene rendition in the style of the Prophet\'s Mosque in Madinah.'**
  String get madinahDescription;

  /// Description of the Egyptian adhan style
  ///
  /// In en, this message translates to:
  /// **'A melodic Egyptian-style adhan, known for its rich recitation.'**
  String get egyptianDescription;

  /// Subtitle shown above the Adhan description on the Adhan screen
  ///
  /// In en, this message translates to:
  /// **'The Call to Prayer'**
  String get adhanCallToWorship;

  /// Full description of what the Adhan is, shown at the top of the Adhan screen
  ///
  /// In en, this message translates to:
  /// **'The Adhan is the Islamic call to prayer, announced 5 times daily to invite believers to worship.'**
  String get adhanDescriptionFull;

  /// Name of the Mishary Alafasy adhan style
  ///
  /// In en, this message translates to:
  /// **'Mishary Alafasy'**
  String get alafasyStyle;

  /// Name of the Al-Aqsa adhan style
  ///
  /// In en, this message translates to:
  /// **'Al-Aqsa'**
  String get alaqsaStyle;

  /// Name of the Turkish adhan style
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkishStyle;

  /// Name of the Pakistani adhan style
  ///
  /// In en, this message translates to:
  /// **'Pakistani'**
  String get pakistaniStyle;

  /// Name of the Indonesian adhan style
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get indonesianStyle;

  /// Description of the Mishary Alafasy adhan style
  ///
  /// In en, this message translates to:
  /// **'A heartfelt rendition by the renowned reciter Mishary Rashid Alafasy.'**
  String get alafasyDescription;

  /// Description of the Al-Aqsa adhan style
  ///
  /// In en, this message translates to:
  /// **'The call to prayer echoing from Al-Aqsa Mosque in Jerusalem, Islam\'s third holiest site.'**
  String get alaqsaDescription;

  /// Description of the Turkish adhan style
  ///
  /// In en, this message translates to:
  /// **'A traditional Turkish-style ezan with its distinctive melodic maqam.'**
  String get turkishDescription;

  /// Description of the Pakistani adhan style
  ///
  /// In en, this message translates to:
  /// **'A heartfelt adhan in the South Asian tradition, recited across Pakistan.'**
  String get pakistaniDescription;

  /// Description of the Indonesian adhan style
  ///
  /// In en, this message translates to:
  /// **'A melodious Indonesian-style adhan, beloved across the archipelago.'**
  String get indonesianDescription;

  /// Header for the weekly prayer summary card
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// Shows how many of the 35 weekly prayers (7 days x 5 prayers) have been completed
  ///
  /// In en, this message translates to:
  /// **'{count} of 35 prayers this week'**
  String weeklyProgress(int count);

  /// Label preceding the best day of the week for prayer completion
  ///
  /// In en, this message translates to:
  /// **'Best day'**
  String get bestDay;

  /// Title of the Prayer Statistics screen and tooltip for its app bar button
  ///
  /// In en, this message translates to:
  /// **'Prayer Statistics'**
  String get prayerStats;

  /// Label for the overall prayer completion percentage
  ///
  /// In en, this message translates to:
  /// **'Completion Rate'**
  String get completionRate;

  /// Label for the prayer the user completes most often
  ///
  /// In en, this message translates to:
  /// **'Most Consistent Prayer'**
  String get bestPrayer;

  /// Label for the prayer the user misses most often
  ///
  /// In en, this message translates to:
  /// **'Most Missed Prayer'**
  String get hardestPrayer;

  /// Total number of prayers completed since the user started using the app
  ///
  /// In en, this message translates to:
  /// **'{count} prayers completed'**
  String totalPrayersCompleted(int count);

  /// Header for the weekly bar chart on the Prayer Statistics screen
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get last7Days;

  /// Header for the monthly breakdown on the Prayer Statistics screen
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// Label for days this month where all 5 prayers were completed
  ///
  /// In en, this message translates to:
  /// **'Full days'**
  String get fullDays;

  /// Label for days this month where some but not all prayers were completed
  ///
  /// In en, this message translates to:
  /// **'Partial days'**
  String get partialDays;

  /// Label for days this month where no prayers were completed
  ///
  /// In en, this message translates to:
  /// **'Missed days'**
  String get missedDays;

  /// Small badge shown on a prayer card when its prayer time has passed without being marked complete
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get missedPrayerBadge;

  /// Button label to mark a missed prayer as completed as a Qada (makeup) prayer
  ///
  /// In en, this message translates to:
  /// **'Make it up'**
  String get makeItUp;

  /// Brief explanation for new Muslims about making up a missed prayer
  ///
  /// In en, this message translates to:
  /// **'If you missed a prayer, you can still pray it as a Qada (makeup) prayer.'**
  String get qadaExplanation;

  /// Message shown on the Prayer Statistics screen when there is no prayer history yet
  ///
  /// In en, this message translates to:
  /// **'Keep marking your prayers to see your stats here.'**
  String get noStatsYet;

  /// Placeholder shown for best/hardest prayer when there isn't enough history to determine them
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get notEnoughData;

  /// No description provided for @continuousPlay.
  ///
  /// In en, this message translates to:
  /// **'Continuous'**
  String get continuousPlay;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimer;

  /// No description provided for @verseCount.
  ///
  /// In en, this message translates to:
  /// **'Verse {verse} of {total}'**
  String verseCount(Object total, Object verse);

  /// No description provided for @verseTafsir.
  ///
  /// In en, this message translates to:
  /// **'Verse Tafsir'**
  String get verseTafsir;

  /// No description provided for @tafsirOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Tafsir of the Day'**
  String get tafsirOfTheDay;

  /// No description provided for @dailyInsight.
  ///
  /// In en, this message translates to:
  /// **'Daily Insight'**
  String get dailyInsight;

  /// No description provided for @keyThemes.
  ///
  /// In en, this message translates to:
  /// **'Key Themes & Lessons'**
  String get keyThemes;

  /// No description provided for @readFullSurah.
  ///
  /// In en, this message translates to:
  /// **'Read Full Surah'**
  String get readFullSurah;

  /// No description provided for @surahIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Surah Introduction'**
  String get surahIntroduction;

  /// No description provided for @verses.
  ///
  /// In en, this message translates to:
  /// **'verses'**
  String get verses;

  /// No description provided for @loadingTafsir.
  ///
  /// In en, this message translates to:
  /// **'Loading tafsir...'**
  String get loadingTafsir;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'de',
        'en',
        'es',
        'fr',
        'id',
        'it',
        'ja',
        'nl',
        'pt',
        'sw',
        'tr',
        'ur',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'sw':
      return AppLocalizationsSw();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
