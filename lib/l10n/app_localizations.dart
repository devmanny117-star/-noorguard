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
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
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
    Locale('fa'),
    Locale('fr'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
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

  /// Button text on the home/lock screen widget to mark the current prayer as completed
  ///
  /// In en, this message translates to:
  /// **'I Prayed'**
  String get iPrayedButton;

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

  /// Subtitle for the Islamic Calendar feature tile
  ///
  /// In en, this message translates to:
  /// **'Hijri dates & events'**
  String get islamicCalendarSubtitle;

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

  /// Section header for the user's profile settings (display name, etc.)
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Settings row label and dialog title for editing the user's saved display name
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

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

  /// Generic short label shown next to a settings row when its toggle is currently enabled
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get statusOn;

  /// Generic short label shown next to a settings row when its toggle is currently disabled
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get statusOff;

  /// Master toggle label inside the Prayer Notifications sub-screen that turns all prayer notifications on/off
  ///
  /// In en, this message translates to:
  /// **'Enable All Notifications'**
  String get enableAllNotifications;

  /// Section caption above the five per-prayer notification toggles in the Prayer Notifications sub-screen
  ///
  /// In en, this message translates to:
  /// **'Individual Prayers'**
  String get individualPrayers;

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

  /// Title on the Qibla screen's location-setup state, shown when permission is denied or not yet granted
  ///
  /// In en, this message translates to:
  /// **'Location Access Needed'**
  String get qiblaLocationPermissionTitle;

  /// Message on the Qibla screen's location-setup state explaining the two options below it
  ///
  /// In en, this message translates to:
  /// **'Noor Guard needs your location to show an accurate Qibla direction. Allow location access, or enter your city manually.'**
  String get qiblaLocationPermissionMessage;

  /// Button on the Qibla screen's location-setup state that opens the manual city picker
  ///
  /// In en, this message translates to:
  /// **'Enter City Manually'**
  String get enterCityManually;

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

  /// Name of the 2nd month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Safar'**
  String get islamicMonthSafar;

  /// Name of the 3rd month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Rabī\' Al-Awwal'**
  String get islamicMonthRabiAlAwwal;

  /// Name of the 4th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Rabī\' Al-Thānī'**
  String get islamicMonthRabiAlThani;

  /// Name of the 5th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Jumada Al-Awwal'**
  String get islamicMonthJumadaAlAwwal;

  /// Name of the 6th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Jumada Al-Thani'**
  String get islamicMonthJumadaAlThani;

  /// Name of the 7th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Rajab'**
  String get islamicMonthRajab;

  /// Name of the 8th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Sha\'bān'**
  String get islamicMonthShaban;

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

  /// Name of the 11th month of the Islamic (Hijri) calendar
  ///
  /// In en, this message translates to:
  /// **'Dhul Qa\'dah'**
  String get islamicMonthDhulQadah;

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

  /// Body text of the persistent foreground-service notification that keeps prayer alarms reliable
  ///
  /// In en, this message translates to:
  /// **'Prayer notifications active'**
  String get keepAliveNotificationText;

  /// Android notification channel name for the persistent keep-alive notification
  ///
  /// In en, this message translates to:
  /// **'Prayer Notifications'**
  String get keepAliveChannelName;

  /// Android notification channel description for the persistent keep-alive notification
  ///
  /// In en, this message translates to:
  /// **'Keeps Noor Guard active in the background so prayer alarms are never missed.'**
  String get keepAliveChannelDescription;

  /// Title of the notification/permission setup guide screen
  ///
  /// In en, this message translates to:
  /// **'Enable Lock Screen Alerts'**
  String get notifSetupTitle;

  /// Subtitle of the notification/permission setup guide screen
  ///
  /// In en, this message translates to:
  /// **'So you never miss the adhan — even when your phone is locked. Takes about a minute.'**
  String get notifSetupSubtitle;

  /// Banner inviting Samsung users to pay attention to the Samsung-specific steps
  ///
  /// In en, this message translates to:
  /// **'Using a Samsung Galaxy (including Fold/Flip)? Samsung adds extra switches beyond stock Android — Steps 4 and 6 below show you exactly where to find them.'**
  String get notifSetupSamsungBanner;

  /// Title of setup guide step 1
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get notifSetupStep1Title;

  /// Description of setup guide step 1
  ///
  /// In en, this message translates to:
  /// **'The basic permission Noor Guard needs to alert you at all.'**
  String get notifSetupStep1Description;

  /// Action button label for setup guide step 1
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get notifSetupStep1Action;

  /// Title of setup guide step 2
  ///
  /// In en, this message translates to:
  /// **'Alarms & Reminders'**
  String get notifSetupStep2Title;

  /// Description of setup guide step 2
  ///
  /// In en, this message translates to:
  /// **'Lets prayer alarms fire at the exact prayer time, even while your phone is idle or in battery saver.'**
  String get notifSetupStep2Description;

  /// Action button label for setup guide step 2
  ///
  /// In en, this message translates to:
  /// **'Open Alarm Settings'**
  String get notifSetupStep2Action;

  /// Title of setup guide step 3
  ///
  /// In en, this message translates to:
  /// **'Display Over Other Apps'**
  String get notifSetupStep3Title;

  /// Description of setup guide step 3
  ///
  /// In en, this message translates to:
  /// **'Lets the full prayer screen draw on top of the lock screen and whatever else is open.'**
  String get notifSetupStep3Description;

  /// Action button label for setup guide step 3
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get notifSetupStep3Action;

  /// Title of setup guide step 4
  ///
  /// In en, this message translates to:
  /// **'Show As Pop-up / Full-Screen Alerts'**
  String get notifSetupStep4Title;

  /// Description of setup guide step 4
  ///
  /// In en, this message translates to:
  /// **'Lets the adhan screen break through the lock screen instead of staying a silent banner.'**
  String get notifSetupStep4Description;

  /// Samsung-specific instructions shown under setup guide step 4
  ///
  /// In en, this message translates to:
  /// **'On Samsung Galaxy phones (including Fold/Flip): open Settings → tap \"Prayer Time Alarm\", then turn on \"Pop-up notification\" (called \"Cover screen pop-up\" on Fold/Flip). This is a Samsung-only switch — turning it on is what actually puts the adhan screen over your lock screen.'**
  String get notifSetupStep4SamsungNote;

  /// Action button label for setup guide step 4
  ///
  /// In en, this message translates to:
  /// **'Open Notification Settings'**
  String get notifSetupStep4Action;

  /// Title of setup guide step 5 (battery optimization)
  ///
  /// In en, this message translates to:
  /// **'Keep Notifications Reliable'**
  String get notifSetupStep5Title;

  /// Description of setup guide step 5 (battery optimization)
  ///
  /// In en, this message translates to:
  /// **'Stops Android from slowing or delaying Noor Guard in the background, so prayer alarms and reminders always arrive on time.'**
  String get notifSetupStep5Description;

  /// Action button label for setup guide step 5 (battery optimization)
  ///
  /// In en, this message translates to:
  /// **'Disable Battery Optimization'**
  String get notifSetupStep5Action;

  /// Title of setup guide step 6 (Samsung-only background usage limits)
  ///
  /// In en, this message translates to:
  /// **'Never Sleeping Apps'**
  String get notifSetupStep6Title;

  /// Description of setup guide step 6 (Samsung-only background usage limits)
  ///
  /// In en, this message translates to:
  /// **'Samsung\'s battery manager can put Noor Guard to sleep and silently block prayer alarms. Adding it to \"Never sleeping apps\" stops that.'**
  String get notifSetupStep6Description;

  /// Manual navigation instructions shown under setup guide step 6
  ///
  /// In en, this message translates to:
  /// **'Settings → Battery and device care → Background usage limits → Never sleeping apps → tap \"+\" → select Noor Guard.'**
  String get notifSetupStep6SamsungNote;

  /// Action button label for setup guide step 6
  ///
  /// In en, this message translates to:
  /// **'Open Battery Settings'**
  String get notifSetupStep6Action;

  /// Status chip label while a setup guide step's status is being checked
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get notifSetupStatusChecking;

  /// Status chip label when a setup guide step is already satisfied
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get notifSetupStatusEnabled;

  /// Status chip label when a setup guide step still needs action
  ///
  /// In en, this message translates to:
  /// **'Needed'**
  String get notifSetupStatusNeeded;

  /// Status chip label for a setup guide step whose completion can't be checked automatically
  ///
  /// In en, this message translates to:
  /// **'Manual Step'**
  String get notifSetupStatusManual;

  /// Footer button label once every setup guide step is satisfied
  ///
  /// In en, this message translates to:
  /// **'Continue to Noor Guard'**
  String get notifSetupContinueButton;

  /// Footer button label on first launch before every step is satisfied
  ///
  /// In en, this message translates to:
  /// **'I\'ll finish this later'**
  String get notifSetupLaterButton;

  /// Footer button label on a re-visit of the setup guide before every step is satisfied
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get notifSetupDoneButton;

  /// Settings row: sends a 10-second test notification
  ///
  /// In en, this message translates to:
  /// **'Send Test Notification (10s)'**
  String get testNotificationButton;

  /// Snackbar shown after tapping the test notification button
  ///
  /// In en, this message translates to:
  /// **'Test notification will arrive in 10 seconds'**
  String get testNotificationSnack;

  /// Settings row: triggers a 10-second test of the Android full-screen lock alarm
  ///
  /// In en, this message translates to:
  /// **'Test Full-Screen Lock Alarm (10s)'**
  String get testLockAlarmButton;

  /// Snackbar shown after tapping the test lock alarm button
  ///
  /// In en, this message translates to:
  /// **'Lock alarm fires in 10 seconds — lock your phone now'**
  String get testLockAlarmSnack;

  /// Settings row: plays the full adhan in-app while the app is open
  ///
  /// In en, this message translates to:
  /// **'Test Adhan In-App (foreground)'**
  String get testAdhanForegroundButton;

  /// Snackbar shown after tapping the in-app adhan test button
  ///
  /// In en, this message translates to:
  /// **'Playing the full adhan with a silent banner'**
  String get testAdhanForegroundSnack;

  /// Snackbar shown when tapping any Settings test button (test notification, test lock alarm, test in-app adhan) while the master Prayer Notifications toggle is off
  ///
  /// In en, this message translates to:
  /// **'Turn on Prayer Notifications first to test this'**
  String get testRequiresNotificationsOn;

  /// Settings row: opens the Android lock screen alert setup guide
  ///
  /// In en, this message translates to:
  /// **'Lock Screen Alert Setup Guide'**
  String get lockScreenSetupGuideButton;

  /// Snackbar shown when the privacy policy link fails to open
  ///
  /// In en, this message translates to:
  /// **'Could not open Privacy Policy'**
  String get couldNotOpenPrivacyPolicy;

  /// Snackbar shown when the terms of service link fails to open
  ///
  /// In en, this message translates to:
  /// **'Could not open Terms of Service'**
  String get couldNotOpenTermsOfService;

  /// Snackbar shown when no email app is available to send feedback
  ///
  /// In en, this message translates to:
  /// **'Could not open email app'**
  String get couldNotOpenEmailApp;

  /// Label above the block-duration preset pills
  ///
  /// In en, this message translates to:
  /// **'Block duration'**
  String get blockDurationLabel;

  /// Settings section header
  ///
  /// In en, this message translates to:
  /// **'Privacy & Trust'**
  String get privacyAndTrust;

  /// Italic motto quote in the Privacy & Trust card
  ///
  /// In en, this message translates to:
  /// **'\"If it doesn\'t belong in a masjid,\nit doesn\'t belong in Noor Guard.\"'**
  String get noorGuardMotto;

  /// Snackbar shown when the rate-app row is tapped (placeholder action)
  ///
  /// In en, this message translates to:
  /// **'Opening App Store…'**
  String get openingAppStore;

  /// Snackbar shown when the share-app row is tapped (placeholder action)
  ///
  /// In en, this message translates to:
  /// **'Opening share sheet…'**
  String get openingShareSheet;

  /// Snackbar shown when the contact-support row is tapped (placeholder action)
  ///
  /// In en, this message translates to:
  /// **'Opening support email…'**
  String get openingSupportEmail;

  /// Snackbar shown when the terms-of-service row is tapped (placeholder action)
  ///
  /// In en, this message translates to:
  /// **'Opening Terms of Service…'**
  String get openingTermsOfService;

  /// App blocking duration preset pill
  ///
  /// In en, this message translates to:
  /// **'30 min'**
  String get duration30Min;

  /// App blocking duration preset pill
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get duration1Hour;

  /// App blocking duration preset pill — blocks only for the prayer window
  ///
  /// In en, this message translates to:
  /// **'Prayer window only'**
  String get durationPrayerWindowOnly;

  /// Abbreviation for 'hours', used after a number (e.g. '1.5 hr')
  ///
  /// In en, this message translates to:
  /// **'hr'**
  String get hoursAbbreviation;

  /// Button to cancel an active sleep timer
  ///
  /// In en, this message translates to:
  /// **'Cancel timer'**
  String get cancelTimerButton;

  /// Generic 'Custom' option label (e.g. custom sleep timer duration)
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// Dialog title for entering a custom sleep timer duration in minutes
  ///
  /// In en, this message translates to:
  /// **'Custom timer (minutes)'**
  String get customTimerMinutesTitle;

  /// Text field hint for the custom sleep timer minutes input
  ///
  /// In en, this message translates to:
  /// **'e.g. 20'**
  String get customTimerHint;

  /// Generic Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Generic Start button label (e.g. starting a custom sleep timer)
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travel;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Anxiety & Stress'**
  String get anxietyAndStress;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Gratitude'**
  String get gratitude;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Protection'**
  String get protection;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// Dua category label
  ///
  /// In en, this message translates to:
  /// **'Forgiveness'**
  String get forgiveness;

  /// Headline on the App Blocking accessibility permission setup screen
  ///
  /// In en, this message translates to:
  /// **'Guard Your Time, Guard Your Prayer'**
  String get appBlockingSetupHeadline;

  /// Explanation of why Accessibility permission is needed, shown on the setup screen
  ///
  /// In en, this message translates to:
  /// **'Noor Guard uses Android\'s Accessibility service only to notice when a blocked app opens during prayer time. It never reads your messages, photos, or any personal data.'**
  String get appBlockingSetupBody;

  /// Status line shown when the Accessibility permission has been granted
  ///
  /// In en, this message translates to:
  /// **'Accessibility access granted'**
  String get appBlockingAccessibilityStatusOn;

  /// Status line shown when the Accessibility permission has not been granted
  ///
  /// In en, this message translates to:
  /// **'Accessibility access not granted'**
  String get appBlockingAccessibilityStatusOff;

  /// Button that opens the system Accessibility settings page
  ///
  /// In en, this message translates to:
  /// **'Open Accessibility Settings'**
  String get appBlockingOpenSettings;

  /// Button to dismiss the App Blocking setup screen without granting permission
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get appBlockingSetupNotNow;

  /// Master on/off toggle label on the App Blocking settings screen
  ///
  /// In en, this message translates to:
  /// **'Enable App Blocking'**
  String get appBlockingEnableToggle;

  /// Section label for the Soft/Firm/Hard blocking mode picker
  ///
  /// In en, this message translates to:
  /// **'Blocking Mode'**
  String get appBlockingModeLabel;

  /// Name of the gentle blocking mode (reminder notification only)
  ///
  /// In en, this message translates to:
  /// **'Soft'**
  String get appBlockingModeSoft;

  /// Description of Soft blocking mode
  ///
  /// In en, this message translates to:
  /// **'Gentle reminder only — apps stay open'**
  String get appBlockingModeSoftDesc;

  /// Name of the Firm blocking mode (blocks with an easy bypass)
  ///
  /// In en, this message translates to:
  /// **'Firm'**
  String get appBlockingModeFirm;

  /// Description of Firm blocking mode
  ///
  /// In en, this message translates to:
  /// **'Blocks the app, with a quick bypass'**
  String get appBlockingModeFirmDesc;

  /// Name of the Hard blocking mode (full block)
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get appBlockingModeHard;

  /// Description of Hard blocking mode
  ///
  /// In en, this message translates to:
  /// **'Full block — only \"I Prayed\" unlocks it'**
  String get appBlockingModeHardDesc;

  /// Section label for the per-prayer toggle list
  ///
  /// In en, this message translates to:
  /// **'Block during these prayers'**
  String get appBlockingSelectPrayersLabel;

  /// Label for the pre-prayer buffer-minutes picker
  ///
  /// In en, this message translates to:
  /// **'Start before prayer'**
  String get appBlockingBufferBeforeLabel;

  /// Label for the post-prayer buffer-minutes picker
  ///
  /// In en, this message translates to:
  /// **'Lift after prayer'**
  String get appBlockingBufferAfterLabel;

  /// Short minute duration label shown on the buffer pickers, e.g. '5 min'
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String appBlockingMinutesShort(int count);

  /// Section title for the list of apps the user has chosen to block
  ///
  /// In en, this message translates to:
  /// **'Blocked Apps'**
  String get appBlockingAppsTitle;

  /// Button that opens the installed-apps picker
  ///
  /// In en, this message translates to:
  /// **'Select Apps to Block'**
  String get appBlockingSelectAppsButton;

  /// Search field placeholder in the installed-apps picker
  ///
  /// In en, this message translates to:
  /// **'Search installed apps'**
  String get appBlockingSearchHint;

  /// Empty state shown when no apps have been chosen to block
  ///
  /// In en, this message translates to:
  /// **'No apps selected yet'**
  String get appBlockingNoAppsSelected;

  /// Summary count of how many apps are currently blocked
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No apps blocked} one{1 app blocked} other{{count} apps blocked}}'**
  String appBlockingAppsSelectedCount(int count);

  /// Section label for the on-device App Blocking test button
  ///
  /// In en, this message translates to:
  /// **'Testing'**
  String get appBlockingTestSectionLabel;

  /// Explains what the 2-minute test block window button does
  ///
  /// In en, this message translates to:
  /// **'Activate App Blocking for 2 minutes to confirm it\'s working on this device.'**
  String get appBlockingTestDescription;

  /// Button that activates a 2-minute test App Blocking window
  ///
  /// In en, this message translates to:
  /// **'Test App Blocking (2 minutes)'**
  String get appBlockingTestButton;

  /// Snackbar shown after the test block window is activated
  ///
  /// In en, this message translates to:
  /// **'App Blocking active for 2 minutes — try opening a blocked app'**
  String get appBlockingTestActiveSnackbar;

  /// Prompt shown when blocking is enabled but Accessibility permission is missing
  ///
  /// In en, this message translates to:
  /// **'Turn on Accessibility access to start blocking'**
  String get appBlockingPermissionNeeded;

  /// Title of the iOS placeholder card shown instead of the live app picker
  ///
  /// In en, this message translates to:
  /// **'Screen Time Access — Coming Soon'**
  String get appBlockingIosComingSoonTitle;

  /// Body text of the iOS placeholder card
  ///
  /// In en, this message translates to:
  /// **'iOS app blocking needs Apple\'s Screen Time permission, which we\'re still setting up. We\'ll let you know the moment it\'s ready.'**
  String get appBlockingIosComingSoonBody;

  /// First of two alternating headlines shown on the full-screen block screen
  ///
  /// In en, this message translates to:
  /// **'Time for Prayer'**
  String get appBlockingHeadline1;

  /// Second of two alternating headlines shown on the full-screen block screen
  ///
  /// In en, this message translates to:
  /// **'Guard Your Time'**
  String get appBlockingHeadline2;

  /// Big title fallback on the block screen when no specific prayer name is available (e.g. a manual on-device test window)
  ///
  /// In en, this message translates to:
  /// **'Prayer Time'**
  String get appBlockingDefaultTitle;

  /// Primary button on the block screen that immediately dismisses the block
  ///
  /// In en, this message translates to:
  /// **'I Prayed'**
  String get appBlockingIPrayedButton;

  /// Secondary button on the block screen that opens the Quran reader as an alternative way to dismiss the block
  ///
  /// In en, this message translates to:
  /// **'Read 3 Ayahs'**
  String get appBlockingReadAyahsButton;

  /// Small dimmed button at the bottom of the block screen for emergencies
  ///
  /// In en, this message translates to:
  /// **'Emergency bypass'**
  String get appBlockingEmergencyBypass;

  /// Clearly visible button shown only in Firm mode's block screen that dismisses it immediately, with no prayer confirmation or ayah reading required
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get appBlockingSkipForNow;

  /// Title of the confirmation dialog shown before an emergency bypass in Hard mode
  ///
  /// In en, this message translates to:
  /// **'End your streak?'**
  String get appBlockingBypassConfirmTitle;

  /// Body text of the emergency bypass confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Bypassing now will reset your prayer streak. If this is a real emergency, you can continue.'**
  String get appBlockingBypassConfirmBody;

  /// Confirm button on the emergency bypass dialog
  ///
  /// In en, this message translates to:
  /// **'Bypass anyway'**
  String get appBlockingBypassConfirmContinue;

  /// Cancel button on the emergency bypass dialog
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get appBlockingBypassConfirmCancel;

  /// Notification title used in Soft blocking mode
  ///
  /// In en, this message translates to:
  /// **'A gentle reminder'**
  String get appBlockingSoftReminderTitle;

  /// Notification body used in Soft blocking mode
  ///
  /// In en, this message translates to:
  /// **'It\'s prayer time — consider stepping away for a moment.'**
  String get appBlockingSoftReminderBody;

  /// Banner title shown in the Quran reader when opened from the block screen's ayah challenge
  ///
  /// In en, this message translates to:
  /// **'Read 3 Ayahs to Unlock'**
  String get quranChallengeBannerTitle;

  /// Progress text in the ayah-challenge banner
  ///
  /// In en, this message translates to:
  /// **'{count} of {total} ayahs read'**
  String quranChallengeBannerProgress(int count, int total);

  /// Message shown when the ayah-challenge is completed and the block is lifted
  ///
  /// In en, this message translates to:
  /// **'Well done — apps unlocked'**
  String get quranChallengeComplete;

  /// First of two alternating headlines shown on the block screen during an active Focus Mode session
  ///
  /// In en, this message translates to:
  /// **'Stay Focused'**
  String get focusBlockHeadline1;

  /// Second of two alternating headlines shown on the block screen during an active Focus Mode session
  ///
  /// In en, this message translates to:
  /// **'Keep Going'**
  String get focusBlockHeadline2;

  /// Primary button on the block screen when it was triggered by an active Focus Mode session (in place of "I Prayed")
  ///
  /// In en, this message translates to:
  /// **'End Focus Session'**
  String get endFocusSessionButton;

  /// Status label shown on the Focus Mode timer when it's automatically paused during an active prayer block window
  ///
  /// In en, this message translates to:
  /// **'Paused for prayer'**
  String get focusPaused;

  /// Title of the location-management bottom sheet opened from the Qibla screen
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocationTitle;

  /// Row label in the location sheet for switching back to the device's live GPS position
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get useCurrentLocation;

  /// Section heading above the list of saved locations in the location sheet
  ///
  /// In en, this message translates to:
  /// **'Saved Locations'**
  String get savedLocationsHeader;

  /// Empty-state message shown in the location sheet when no locations have been saved
  ///
  /// In en, this message translates to:
  /// **'No saved locations yet. Search below to add one.'**
  String get noSavedLocationsYet;

  /// Hint text for the city-name search field in the location sheet
  ///
  /// In en, this message translates to:
  /// **'Search city name…'**
  String get searchCityHint;

  /// Tooltip for the button that adds the searched city as a saved location
  ///
  /// In en, this message translates to:
  /// **'Add location'**
  String get addLocationTooltip;

  /// Tooltip for the button that deletes a saved location
  ///
  /// In en, this message translates to:
  /// **'Delete location'**
  String get deleteLocationTooltip;

  /// Error message shown when a searched city name can't be geocoded
  ///
  /// In en, this message translates to:
  /// **'Location not found. Try a different search.'**
  String get locationNotFound;

  /// Message shown in place of the search field once the saved-location limit is reached
  ///
  /// In en, this message translates to:
  /// **'You can save up to {max} locations'**
  String maxLocationsReachedMessage(int max);

  /// Snackbar shown when toggling the notification bell couldn't be verified against the system alarm scheduler
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t confirm the change — please try again'**
  String get notificationsToggleUnconfirmed;

  /// Label for the tasbih/dhikr counter home-screen tile, and the title of the tasbih counter screen
  ///
  /// In en, this message translates to:
  /// **'Tasbih Counter'**
  String get tasbihCounter;

  /// Subtitle for the tasbih counter home-screen tile
  ///
  /// In en, this message translates to:
  /// **'Count your dhikr'**
  String get tasbihCounterSubtitle;

  /// Button on the tasbih counter screen that resets the count back to zero
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get tasbihResetButton;

  /// Label before the running session total on the tasbih counter screen, e.g. 'Total: 47 / 99'
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get tasbihTotalLabel;

  /// Title shown in the celebration overlay once all 99 dhikr are completed
  ///
  /// In en, this message translates to:
  /// **'Tasbih Complete!'**
  String get tasbihCelebrationTitle;

  /// Body text shown in the celebration overlay once all 99 dhikr are completed
  ///
  /// In en, this message translates to:
  /// **'You completed all 99 dhikr. May Allah accept your remembrance.'**
  String get tasbihCelebrationBody;

  /// Button in the celebration overlay that resets the tasbih counter to begin a new session
  ///
  /// In en, this message translates to:
  /// **'Start New Session'**
  String get tasbihStartNewSession;

  /// Button on the tasbih counter screen that undoes the last tap
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get tasbihUndoButton;

  /// One-time hint shown on the tasbih counter screen telling the user they can tap anywhere on screen to count
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere on the screen to count'**
  String get tasbihTapAnywhereHint;

  /// Tooltip for the icon button that toggles the optional tap sound on the tasbih counter screen
  ///
  /// In en, this message translates to:
  /// **'Tap sound'**
  String get tasbihSoundToggleTooltip;

  /// Tooltip for the icon button that opens the manage-dhikr sheet on the tasbih counter screen
  ///
  /// In en, this message translates to:
  /// **'Manage dhikr'**
  String get tasbihManageDhikrTooltip;

  /// Tooltip for the icon button that opens the tasbih stats screen
  ///
  /// In en, this message translates to:
  /// **'View stats'**
  String get tasbihStatsTooltip;

  /// Label for the running total of dhikr tapped today, shown on the tasbih counter screen and stats screen
  ///
  /// In en, this message translates to:
  /// **'Today\'s Total'**
  String get tasbihDailyTotalLabel;

  /// Label for how many full 99-dhikr rounds were completed today
  ///
  /// In en, this message translates to:
  /// **'Rounds Today'**
  String get tasbihRoundsTodayLabel;

  /// Title of the bottom sheet that lists built-in and custom dhikr, allowing the user to add or delete custom ones
  ///
  /// In en, this message translates to:
  /// **'Manage Dhikr'**
  String get tasbihManageDhikrTitle;

  /// Button label and dialog title for adding a custom dhikr beyond the built-in three
  ///
  /// In en, this message translates to:
  /// **'Add Custom Dhikr'**
  String get tasbihAddCustomDhikrButton;

  /// Tooltip for the delete icon next to a custom dhikr in the manage-dhikr sheet
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get tasbihDeleteDhikrTooltip;

  /// Small badge label shown next to the three built-in dhikr in the manage-dhikr sheet, indicating they can't be deleted
  ///
  /// In en, this message translates to:
  /// **'Built-in'**
  String get tasbihBuiltInDhikrBadge;

  /// Snackbar shown if the user tries to delete the only remaining dhikr in their list
  ///
  /// In en, this message translates to:
  /// **'You need at least one dhikr'**
  String get tasbihCannotDeleteLastDhikr;

  /// Text field label for the name of a custom dhikr being added
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get tasbihDhikrNameLabel;

  /// Placeholder hint text shown in the empty custom dhikr name field
  ///
  /// In en, this message translates to:
  /// **'e.g. Astaghfirullah'**
  String get tasbihDhikrNameHint;

  /// Text field label for the optional Arabic text of a custom dhikr being added
  ///
  /// In en, this message translates to:
  /// **'Arabic (optional)'**
  String get tasbihDhikrArabicLabel;

  /// Placeholder hint shown in the empty custom dhikr Arabic field — an example dhikr in Arabic script, same in every language
  ///
  /// In en, this message translates to:
  /// **'أَسْتَغْفِرُ اللَّهَ'**
  String get tasbihDhikrArabicHint;

  /// Validation error shown when the user tries to save a custom dhikr without entering a name
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get tasbihDhikrNameRequiredError;

  /// Button that saves a newly added custom dhikr
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get tasbihSaveDhikrButton;

  /// Title of the tasbih stats screen
  ///
  /// In en, this message translates to:
  /// **'Tasbih Stats'**
  String get tasbihStatsTitle;

  /// Label for the lifetime total dhikr count across all sessions, shown on the tasbih stats screen
  ///
  /// In en, this message translates to:
  /// **'All-Time Total'**
  String get tasbihAllTimeTotalLabel;

  /// Banner shown on the tasbih stats screen when the user has no recorded tasbih activity yet
  ///
  /// In en, this message translates to:
  /// **'Start counting to see your stats here.'**
  String get tasbihNoActivityYetMessage;

  /// Title of the bottom sheet where the user previews and picks which tap sound the tasbih counter plays
  ///
  /// In en, this message translates to:
  /// **'Tap Sound'**
  String get tasbihSoundPickerTitle;

  /// Name of the 'classic click' tap sound option — a soft wooden-bead click
  ///
  /// In en, this message translates to:
  /// **'Classic Click'**
  String get tasbihSoundClassicClick;

  /// Name of the 'soft chime' tap sound option — a gentle bell/chime
  ///
  /// In en, this message translates to:
  /// **'Soft Chime'**
  String get tasbihSoundSoftChime;

  /// Name of the 'stone tap' tap sound option — a subtle stone/pebble tap
  ///
  /// In en, this message translates to:
  /// **'Stone Tap'**
  String get tasbihSoundStoneTap;

  /// Tiny all-caps status label above the dhikr name on the tasbih counter screen
  ///
  /// In en, this message translates to:
  /// **'Currently Reciting'**
  String get tasbihCurrentlyReciting;

  /// Small dimmed text below the big count number, e.g. 'of 33'
  ///
  /// In en, this message translates to:
  /// **'of {target}'**
  String tasbihOfTarget(int target);

  /// Name of the 'rain drop' tap sound option — a single gentle, calming raindrop sound
  ///
  /// In en, this message translates to:
  /// **'Rain Drop'**
  String get tasbihSoundRainDrop;

  /// Name of the 'soft feather' tap sound option — an extremely subtle, barely audible brush/feather touch
  ///
  /// In en, this message translates to:
  /// **'Soft Feather'**
  String get tasbihSoundSoftFeather;

  /// Empty state heading on Quran search when no results match
  ///
  /// In en, this message translates to:
  /// **'No ayahs found for \"{query}\"'**
  String noAyahsFound(String query);

  /// Subtitle suggesting alternative search approaches when no Quran results are found
  ///
  /// In en, this message translates to:
  /// **'Try searching in English or Arabic, or use an Islamic term:'**
  String get trySearchingQuran;

  /// Progress banner shown while the Quran full-text index is being fetched
  ///
  /// In en, this message translates to:
  /// **'Loading full Quran index…'**
  String get loadingQuranIndex;

  /// Comma-separated list of suggested Quran search terms shown as chips in the empty state
  ///
  /// In en, this message translates to:
  /// **'patience, sabr, mercy, prayer, salah, forgiveness, tawbah, paradise, jannah, knowledge'**
  String get quranSearchSuggestions;

  /// Quran verse on hero card slide 1 — Al-Baqarah 2:238
  ///
  /// In en, this message translates to:
  /// **'Guard strictly your prayers, especially the middle prayer.'**
  String get heroVerse1;

  /// Quran verse on hero card slide 2 — An-Nisa 4:103
  ///
  /// In en, this message translates to:
  /// **'Indeed, prayer has been decreed upon the believers a decree of specified times.'**
  String get heroVerse2;

  /// Quran verse on hero card slide 3 — Al-Baqarah 2:45
  ///
  /// In en, this message translates to:
  /// **'And seek help through patience and prayer.'**
  String get heroVerse3;

  /// Quran verse on hero card slide 4 — Al-Baqarah 2:152
  ///
  /// In en, this message translates to:
  /// **'So remember Me; I will remember you. And be grateful to Me and do not deny Me.'**
  String get heroVerse4;

  /// Quran verse on hero card slide 5 — At-Talaq 65:3
  ///
  /// In en, this message translates to:
  /// **'And whoever relies upon Allah — then He is sufficient for him.'**
  String get heroVerse5;

  /// Quran verse on hero card slide 6 — Ali Imran 3:96
  ///
  /// In en, this message translates to:
  /// **'Indeed, the first House established for mankind was that at Makkah — blessed and a guidance for the worlds.'**
  String get heroVerse6;

  /// Quran verse on hero card slide 7 — Al-Ankabut 29:45
  ///
  /// In en, this message translates to:
  /// **'Indeed, prayer prohibits immorality and wrongdoing, and the remembrance of Allah is greater.'**
  String get heroVerse7;

  /// Quran verse on hero card slide 8 — Ar-Ra'd 13:28
  ///
  /// In en, this message translates to:
  /// **'Verily, in the remembrance of Allah do hearts find rest.'**
  String get heroVerse8;

  /// Quran verse on hero card slide 9 — Ghafir 40:60
  ///
  /// In en, this message translates to:
  /// **'Call upon Me; I will respond to you.'**
  String get heroVerse9;

  /// Quran verse on hero card slide 10 — Ibrahim 14:7
  ///
  /// In en, this message translates to:
  /// **'If you are grateful, I will surely increase you in favor.'**
  String get heroVerse10;

  /// Quran verse on hero card slide 11 — Al-Baqarah 2:286
  ///
  /// In en, this message translates to:
  /// **'Allah does not burden a soul beyond that it can bear.'**
  String get heroVerse11;

  /// Quran verse on hero card slide 12 — Al-Baqarah 2:153
  ///
  /// In en, this message translates to:
  /// **'Indeed, Allah is with the patient.'**
  String get heroVerse12;

  /// Quran verse on hero card slide 13 — Al-A'raf 7:156
  ///
  /// In en, this message translates to:
  /// **'My mercy encompasses all things.'**
  String get heroVerse13;

  /// Quran verse on hero card slide 14 — Al-Baqarah 2:195
  ///
  /// In en, this message translates to:
  /// **'And do good; indeed, Allah loves the doers of good.'**
  String get heroVerse14;

  /// Quran verse on hero card slide 15 — Al-Baqarah 2:2
  ///
  /// In en, this message translates to:
  /// **'This is the Book about which there is no doubt, a guidance for those conscious of Allah.'**
  String get heroVerse15;

  /// Qibla accuracy badge label — high sensor accuracy
  ///
  /// In en, this message translates to:
  /// **'High Accuracy'**
  String get accuracyHigh;

  /// Qibla accuracy badge label — medium sensor accuracy
  ///
  /// In en, this message translates to:
  /// **'Medium Accuracy'**
  String get accuracyMedium;

  /// Qibla accuracy badge label — low sensor accuracy
  ///
  /// In en, this message translates to:
  /// **'Low Accuracy'**
  String get accuracyLow;

  /// Qibla accuracy badge label — compass is being calibrated
  ///
  /// In en, this message translates to:
  /// **'Calibrating…'**
  String get accuracyCalibrating;

  /// Heading of the calibration prompt shown when compass accuracy is low
  ///
  /// In en, this message translates to:
  /// **'Compass needs calibration'**
  String get compassNeedsCalibration;

  /// Body of the calibration prompt — instructions for figure-8 motion
  ///
  /// In en, this message translates to:
  /// **'Move your phone slowly in a figure-8 motion to improve accuracy.'**
  String get compassCalibrationHint;

  /// Label above the spirit-level bubble widget on the Qibla screen
  ///
  /// In en, this message translates to:
  /// **'Spirit Level'**
  String get spiritLevelLabel;

  /// Spirit level status when the phone is flat — checkmark + "Level"
  ///
  /// In en, this message translates to:
  /// **'✓  Level'**
  String get spiritLevelLevelText;

  /// Spirit level status when the phone is tilted and needs leveling
  ///
  /// In en, this message translates to:
  /// **'Tilt to level'**
  String get spiritLevelTiltText;

  /// Cardinal direction North on the compass dial
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get compassNorth;

  /// Cardinal direction East on the compass dial
  ///
  /// In en, this message translates to:
  /// **'E'**
  String get compassEast;

  /// Cardinal direction South on the compass dial
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get compassSouth;

  /// Cardinal direction West on the compass dial
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get compassWest;

  /// App name shown on the splash screen (brand name, same in all languages)
  ///
  /// In en, this message translates to:
  /// **'Noor Guard'**
  String get splashAppName;

  /// Tagline shown below the app name on the splash screen
  ///
  /// In en, this message translates to:
  /// **'Guard your time. Honor your prayers.'**
  String get splashTagline;

  /// Label on the floating button that stops a playing adhan
  ///
  /// In en, this message translates to:
  /// **'Stop Adhan'**
  String get stopAdhan;

  /// Secondary line of the empty state on the Duas screen when search returns no results
  ///
  /// In en, this message translates to:
  /// **'Try a different category or search term.'**
  String get duasSearchEmpty;

  /// Skip button on the onboarding welcome screen
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// First part of the welcome heading on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get onboardingWelcomeTo;

  /// Subtitle below the app name on the onboarding welcome screen
  ///
  /// In en, this message translates to:
  /// **'Your companion on the beautiful journey of Islam.'**
  String get onboardingSubtitle;

  /// Primary CTA button on the onboarding welcome screen
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get onboardingLetsGetStarted;

  /// Step counter shown top-right on onboarding pages 2 to 4
  ///
  /// In en, this message translates to:
  /// **'{step} of {total}'**
  String onboardingStepOf(int step, int total);

  /// Title on the name-entry onboarding screen
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get onboardingWhatsYourName;

  /// Subtitle on the name-entry onboarding screen
  ///
  /// In en, this message translates to:
  /// **'We\'d love to know how to address you.'**
  String get onboardingNameSubtitle;

  /// Hint text inside the name text field on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get onboardingNameHint;

  /// Continue button label on onboarding screens 2 and 3
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// Title on the Islam-mode selection onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Are you new to Islam?'**
  String get onboardingAreYouNewToIslam;

  /// Subtitle on the Islam-mode selection onboarding screen
  ///
  /// In en, this message translates to:
  /// **'We\'ll personalize your experience based on your journey.'**
  String get onboardingModeSubtitle;

  /// Label on the beginner-mode card on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'I\'m new to Islam'**
  String get onboardingNewToIslam;

  /// Description on the beginner-mode card on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Beginner mode with step-by-step guidance'**
  String get onboardingNewToIslamDesc;

  /// Label on the regular-mode card on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'I\'m familiar with Islam'**
  String get onboardingFamiliarWithIslam;

  /// Description on the regular-mode card on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Regular mode with full features'**
  String get onboardingFamiliarWithIslamDesc;

  /// Personalized greeting shown on the home screen header when user has set their name
  ///
  /// In en, this message translates to:
  /// **'As-Salāmu \'Alaikum, {name} 🤲'**
  String greetingWithName(String name);

  /// Day counter shown on beginner home screen journey card, e.g. 'Day 12 as a Muslim'
  ///
  /// In en, this message translates to:
  /// **'Day {days} as a Muslim'**
  String beginnerDaySinceShahada(int days);

  /// Beginner checklist item 1 — New Muslim guide
  ///
  /// In en, this message translates to:
  /// **'My New Muslim Guide'**
  String get beginnerEssential1;

  /// Beginner checklist item 2 — Wudu guide
  ///
  /// In en, this message translates to:
  /// **'Learn Wudu (Ritual Purification)'**
  String get beginnerEssential2;

  /// Beginner checklist item 3 — How to pray
  ///
  /// In en, this message translates to:
  /// **'How to Pray (Step by Step)'**
  String get beginnerEssential3;

  /// Beginner checklist item 4 — Surah Al-Fatiha
  ///
  /// In en, this message translates to:
  /// **'Surah Al-Fatiha (The Opening)'**
  String get beginnerEssential4;

  /// Beginner checklist item 5 — Daily duas
  ///
  /// In en, this message translates to:
  /// **'Daily Duas (Supplications)'**
  String get beginnerEssential5;

  /// Beginner checklist item 6 — Shahada understanding
  ///
  /// In en, this message translates to:
  /// **'Understanding the Shahada'**
  String get beginnerEssential6;

  /// Beginner checklist item 7 — Islamic glossary
  ///
  /// In en, this message translates to:
  /// **'Islamic Terms & Glossary'**
  String get beginnerEssential7;

  /// Label for button that unlocks all Noor Guard features
  ///
  /// In en, this message translates to:
  /// **'Explore All Features'**
  String get beginnerExploreAll;

  /// Subtitle under Explore All Features button
  ///
  /// In en, this message translates to:
  /// **'Switch to the full Noor Guard experience'**
  String get beginnerExploreSubtitle;

  /// Subtitle inside the Explore All Features modal sheet
  ///
  /// In en, this message translates to:
  /// **'Everything Noor Guard has to offer'**
  String get beginnerExploreFeaturesSubtitle;

  /// Beginner toolbox card label — learn how to pray
  ///
  /// In en, this message translates to:
  /// **'Learn Salah'**
  String get beginnerLearnSalah;

  /// Subtitle blessing shown on beginner journey card
  ///
  /// In en, this message translates to:
  /// **'May Allah guide your steps and bless your journey.'**
  String get beginnerMayAllahGuide;

  /// Section header for the Muslim essentials checklist
  ///
  /// In en, this message translates to:
  /// **'MUSLIM ESSENTIALS'**
  String get beginnerMuslimEssentials;

  /// Rotating inspirational quote 1 — Quran 94:6
  ///
  /// In en, this message translates to:
  /// **'Indeed, with hardship comes ease. — Quran 94:6'**
  String get beginnerQuote1;

  /// Rotating inspirational quote 2 — prophetic hadith
  ///
  /// In en, this message translates to:
  /// **'Take care of Allah\'s commands, He will take care of you.'**
  String get beginnerQuote2;

  /// Rotating inspirational quote 3 — Allah sees deeds
  ///
  /// In en, this message translates to:
  /// **'Allah looks at your hearts and deeds, not your appearance.'**
  String get beginnerQuote3;

  /// Rotating inspirational quote 4 — prayer and peace
  ///
  /// In en, this message translates to:
  /// **'Every step toward prayer is a step toward peace.'**
  String get beginnerQuote4;

  /// Rotating inspirational quote 5 — learn and teach Quran
  ///
  /// In en, this message translates to:
  /// **'The best among you learns the Quran and teaches it.'**
  String get beginnerQuote5;

  /// Prompt to set Shahada date when not yet set
  ///
  /// In en, this message translates to:
  /// **'Tap to set your Shahada date'**
  String get beginnerTapToSetShahadaDate;

  /// Section header for beginner toolbox cards
  ///
  /// In en, this message translates to:
  /// **'BEGINNER TOOLBOX'**
  String get beginnerToolboxSection;

  /// Section header for the journey / Shahada tracker
  ///
  /// In en, this message translates to:
  /// **'YOUR JOURNEY'**
  String get beginnerYourJourney;

  /// journeyMonth1Name
  ///
  /// In en, this message translates to:
  /// **'Month 1: The Foundation'**
  String get journeyMonth1Name;

  /// journeyMonth2Name
  ///
  /// In en, this message translates to:
  /// **'Month 2: Building Habits'**
  String get journeyMonth2Name;

  /// journeyMonth3Name
  ///
  /// In en, this message translates to:
  /// **'Month 3: Deepening Faith'**
  String get journeyMonth3Name;

  /// No description provided for @journeyTasksCompleted.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} done'**
  String journeyTasksCompleted(int done, int total);

  /// journeyViewFull
  ///
  /// In en, this message translates to:
  /// **'View full journey →'**
  String get journeyViewFull;

  /// journeyTask2_1
  ///
  /// In en, this message translates to:
  /// **'Pray all 5 prayers for 7 days'**
  String get journeyTask2_1;

  /// journeyTask2_2
  ///
  /// In en, this message translates to:
  /// **'Learn 10 more Duas'**
  String get journeyTask2_2;

  /// journeyTask2_3
  ///
  /// In en, this message translates to:
  /// **'Read the first Juz of the Quran'**
  String get journeyTask2_3;

  /// journeyTask2_4
  ///
  /// In en, this message translates to:
  /// **'Learn the 99 Names of Allah'**
  String get journeyTask2_4;

  /// journeyTask2_5
  ///
  /// In en, this message translates to:
  /// **'Use the Tasbih Counter daily for 7 days'**
  String get journeyTask2_5;

  /// journeyTask2_6
  ///
  /// In en, this message translates to:
  /// **'Learn the Sunnah prayers'**
  String get journeyTask2_6;

  /// journeyTask2_7
  ///
  /// In en, this message translates to:
  /// **'Read your first Tafsir'**
  String get journeyTask2_7;

  /// journeyTask3_1
  ///
  /// In en, this message translates to:
  /// **'Read Surah Al-Baqarah'**
  String get journeyTask3_1;

  /// journeyTask3_2
  ///
  /// In en, this message translates to:
  /// **'Learn about Zakat'**
  String get journeyTask3_2;

  /// journeyTask3_3
  ///
  /// In en, this message translates to:
  /// **'Learn about Fasting (Sawm)'**
  String get journeyTask3_3;

  /// journeyTask3_4
  ///
  /// In en, this message translates to:
  /// **'Memorize 3 new Surahs'**
  String get journeyTask3_4;

  /// journeyTask3_5
  ///
  /// In en, this message translates to:
  /// **'Learn about Hajj'**
  String get journeyTask3_5;

  /// journeyTask3_6
  ///
  /// In en, this message translates to:
  /// **'Share Islam with someone'**
  String get journeyTask3_6;

  /// journeyTask3_7
  ///
  /// In en, this message translates to:
  /// **'Complete the Islamic Glossary'**
  String get journeyTask3_7;

  /// journeyTimelineTitle
  ///
  /// In en, this message translates to:
  /// **'My Journey'**
  String get journeyTimelineTitle;

  /// journeyCompleted
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get journeyCompleted;

  /// journeyInProgress
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get journeyInProgress;

  /// journeyLocked
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get journeyLocked;

  /// wuduThreeTimes
  ///
  /// In en, this message translates to:
  /// **'3 times'**
  String get wuduThreeTimes;

  /// wuduDuaBefore
  ///
  /// In en, this message translates to:
  /// **'Dua Before Wudu'**
  String get wuduDuaBefore;

  /// wuduDuaAfter
  ///
  /// In en, this message translates to:
  /// **'Dua After Wudu'**
  String get wuduDuaAfter;

  /// wuduDuaBeforeArabic
  ///
  /// In en, this message translates to:
  /// **'بِسْمِ اللَّهِ'**
  String get wuduDuaBeforeArabic;

  /// wuduDuaBeforeTranslit
  ///
  /// In en, this message translates to:
  /// **'Bismillāh'**
  String get wuduDuaBeforeTranslit;

  /// wuduDuaBeforeTranslation
  ///
  /// In en, this message translates to:
  /// **'In the name of Allah'**
  String get wuduDuaBeforeTranslation;

  /// wuduDuaAfterArabic
  ///
  /// In en, this message translates to:
  /// **'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ'**
  String get wuduDuaAfterArabic;

  /// wuduDuaAfterTranslit
  ///
  /// In en, this message translates to:
  /// **'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.'**
  String get wuduDuaAfterTranslit;

  /// wuduDuaAfterTranslation
  ///
  /// In en, this message translates to:
  /// **'I bear witness that there is no deity worthy of worship except Allah alone, with no partner. I bear witness that Muhammad is His servant and messenger. O Allah, make me of those who repent and those who purify themselves.'**
  String get wuduDuaAfterTranslation;

  /// wuduCompleteButton
  ///
  /// In en, this message translates to:
  /// **'I completed Wudu'**
  String get wuduCompleteButton;

  /// howToPrayStepOpeningDua
  ///
  /// In en, this message translates to:
  /// **'Opening Du\'a'**
  String get howToPrayStepOpeningDua;

  /// howToPrayStepAlFatiha
  ///
  /// In en, this message translates to:
  /// **'Surah Al-Fatiha'**
  String get howToPrayStepAlFatiha;

  /// howToPrayStepSurah
  ///
  /// In en, this message translates to:
  /// **'Short Surah'**
  String get howToPrayStepSurah;

  /// howToPrayStepTashahhudShort
  ///
  /// In en, this message translates to:
  /// **'Tashahhud (Middle)'**
  String get howToPrayStepTashahhudShort;

  /// howToPrayStepSalawat
  ///
  /// In en, this message translates to:
  /// **'Salawat on the Prophet (PBUH)'**
  String get howToPrayStepSalawat;

  /// howToPrayTransTakbir
  ///
  /// In en, this message translates to:
  /// **'Allah is the Greatest'**
  String get howToPrayTransTakbir;

  /// howToPrayTransOpeningDua
  ///
  /// In en, this message translates to:
  /// **'Glory be to You, O Allah, and with Your praise; blessed is Your name, exalted is Your majesty, there is no god but You.'**
  String get howToPrayTransOpeningDua;

  /// howToPrayTransFatiha
  ///
  /// In en, this message translates to:
  /// **'In the name of Allah, the Most Gracious, the Most Merciful. All praise is for Allah, Lord of all the worlds. The Most Gracious, the Most Merciful. Master of the Day of Judgment. You alone we worship, and You alone we ask for help. Guide us to the straight path — the path of those You have blessed, not of those who have earned anger, nor of those who have gone astray.'**
  String get howToPrayTransFatiha;

  /// howToPrayTransRuku
  ///
  /// In en, this message translates to:
  /// **'Glory be to my Lord, the Most Great'**
  String get howToPrayTransRuku;

  /// howToPrayTransItidal
  ///
  /// In en, this message translates to:
  /// **'Allah hears the one who praises Him. Our Lord, and to You is all praise.'**
  String get howToPrayTransItidal;

  /// howToPrayTransSujood
  ///
  /// In en, this message translates to:
  /// **'Glory be to my Lord, the Most High'**
  String get howToPrayTransSujood;

  /// howToPrayTransJalsa
  ///
  /// In en, this message translates to:
  /// **'My Lord, forgive me'**
  String get howToPrayTransJalsa;

  /// howToPrayTransTashahhud
  ///
  /// In en, this message translates to:
  /// **'All greetings, prayers, and good words belong to Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no god but Allah, and I bear witness that Muhammad is His servant and messenger.'**
  String get howToPrayTransTashahhud;

  /// howToPrayTransSalawat
  ///
  /// In en, this message translates to:
  /// **'O Allah, send Your grace on Muhammad and the family of Muhammad, as You sent Your grace on Ibrahim and the family of Ibrahim — You are the Most Praiseworthy, Most Glorious. O Allah, bless Muhammad and the family of Muhammad, as You blessed Ibrahim and the family of Ibrahim — You are the Most Praiseworthy, Most Glorious.'**
  String get howToPrayTransSalawat;

  /// howToPrayTransTasleem
  ///
  /// In en, this message translates to:
  /// **'Peace and the mercy of Allah be upon you'**
  String get howToPrayTransTasleem;

  /// howToPrayOpeningDuaInstruction
  ///
  /// In en, this message translates to:
  /// **'Recite this quietly right after the Opening Takbir. It is said only once, at the very start of the prayer.'**
  String get howToPrayOpeningDuaInstruction;

  /// howToPraySurahInstruction
  ///
  /// In en, this message translates to:
  /// **'After Al-Fatiha, recite any surah you know. Surah Al-Ikhlas (shown above) is perfect for beginners — recited in the first two Rak\'ahs only.'**
  String get howToPraySurahInstruction;

  /// howToPrayItidalInstruction
  ///
  /// In en, this message translates to:
  /// **'Say \'Sami\' Allahu liman hamidah\' as you rise, then stand fully upright before saying \'Rabbana wa lakal hamd\'.'**
  String get howToPrayItidalInstruction;

  /// howToPrayMiddleTashahhudInstruction
  ///
  /// In en, this message translates to:
  /// **'Sit after the 2nd Rak\'ah. Raise your right index finger when saying the Shahada. For 3 and 4 Rak\'ah prayers, stand again after this sitting.'**
  String get howToPrayMiddleTashahhudInstruction;

  /// howToPraySalawatInstruction
  ///
  /// In en, this message translates to:
  /// **'Recite the Salawat immediately after the full Tashahhud, in the final sitting only, before closing with Tasleem.'**
  String get howToPraySalawatInstruction;

  /// howToPrayTasleemInstruction
  ///
  /// In en, this message translates to:
  /// **'Turn your head to the right and say the Tasleem, then turn to the left and repeat. Your prayer is now complete.'**
  String get howToPrayTasleemInstruction;

  /// howToPrayOnceOpens
  ///
  /// In en, this message translates to:
  /// **'Once — opens the prayer'**
  String get howToPrayOnceOpens;

  /// howToPraySayAllahuAkbar
  ///
  /// In en, this message translates to:
  /// **'Say: Allāhu Akbar'**
  String get howToPraySayAllahuAkbar;

  /// howToPrayFirstRakahOnly
  ///
  /// In en, this message translates to:
  /// **'Rak\'ah 1 only'**
  String get howToPrayFirstRakahOnly;

  /// howToPrayFirst2RakahsOnly
  ///
  /// In en, this message translates to:
  /// **'First 2 Rak\'ahs only'**
  String get howToPrayFirst2RakahsOnly;

  /// howToPrayEveryRakah
  ///
  /// In en, this message translates to:
  /// **'Every Rak\'ah'**
  String get howToPrayEveryRakah;

  /// howToPrayAfter2ndRakah
  ///
  /// In en, this message translates to:
  /// **'After 2nd Rak\'ah'**
  String get howToPrayAfter2ndRakah;

  /// howToPrayFinalSittingOnly
  ///
  /// In en, this message translates to:
  /// **'Final Sitting only'**
  String get howToPrayFinalSittingOnly;

  /// howToPrayClosesThePrayer
  ///
  /// In en, this message translates to:
  /// **'Closes the prayer'**
  String get howToPrayClosesThePrayer;

  /// howToPraySectionBefore
  ///
  /// In en, this message translates to:
  /// **'Before You Pray'**
  String get howToPraySectionBefore;

  /// howToPraySectionRakah
  ///
  /// In en, this message translates to:
  /// **'Rak\'ah'**
  String get howToPraySectionRakah;

  /// howToPraySectionMiddleSitting
  ///
  /// In en, this message translates to:
  /// **'Middle Sitting'**
  String get howToPraySectionMiddleSitting;

  /// howToPraySectionFinalSitting
  ///
  /// In en, this message translates to:
  /// **'Final Sitting'**
  String get howToPraySectionFinalSitting;

  /// howToPrayRakahLabel
  ///
  /// In en, this message translates to:
  /// **'Rak\'ahs'**
  String get howToPrayRakahLabel;

  /// howToPrayCompleteButton
  ///
  /// In en, this message translates to:
  /// **'I Completed My Prayer'**
  String get howToPrayCompleteButton;

  /// howToPrayMashaallah
  ///
  /// In en, this message translates to:
  /// **'Masha\'Allah!'**
  String get howToPrayMashaallah;

  /// howToPrayAccepted
  ///
  /// In en, this message translates to:
  /// **'May Allah accept your prayer.'**
  String get howToPrayAccepted;

  /// fatihaIntroTitle
  ///
  /// In en, this message translates to:
  /// **'The Mother of the Quran'**
  String get fatihaIntroTitle;

  /// fatihaIntroBody
  ///
  /// In en, this message translates to:
  /// **'Surah Al-Fatiha is the greatest surah in the Quran. It is recited in every unit of prayer — at least 17 times daily. It is a complete conversation between the servant and Allah, and a gateway to every prayer.'**
  String get fatihaIntroBody;

  /// fatihaIntroIbnKathir
  ///
  /// In en, this message translates to:
  /// **'Ibn Kathir writes: \'Al-Fatiha contains the essence of the entire Quran — it is a prayer, a declaration of servitude, and a request for guidance to the Straight Path.\' — Tafsir Ibn Kathir'**
  String get fatihaIntroIbnKathir;

  /// shahadaScreenTitle
  ///
  /// In en, this message translates to:
  /// **'The Shahada'**
  String get shahadaScreenTitle;

  /// shahadaArabicText
  ///
  /// In en, this message translates to:
  /// **'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ'**
  String get shahadaArabicText;

  /// shahadaTransliteration
  ///
  /// In en, this message translates to:
  /// **'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh'**
  String get shahadaTransliteration;

  /// shahadaTranslation
  ///
  /// In en, this message translates to:
  /// **'I bear witness that there is no deity except Allah, and I bear witness that Muhammad is the messenger of Allah'**
  String get shahadaTranslation;

  /// shahadaWordBreakdownTitle
  ///
  /// In en, this message translates to:
  /// **'Word by Word'**
  String get shahadaWordBreakdownTitle;

  /// shahadaWord1Arabic
  ///
  /// In en, this message translates to:
  /// **'لَا'**
  String get shahadaWord1Arabic;

  /// shahadaWord1Trans
  ///
  /// In en, this message translates to:
  /// **'Lā'**
  String get shahadaWord1Trans;

  /// shahadaWord1Meaning
  ///
  /// In en, this message translates to:
  /// **'There is no'**
  String get shahadaWord1Meaning;

  /// shahadaWord2Arabic
  ///
  /// In en, this message translates to:
  /// **'إِلَٰهَ'**
  String get shahadaWord2Arabic;

  /// shahadaWord2Trans
  ///
  /// In en, this message translates to:
  /// **'ilāha'**
  String get shahadaWord2Trans;

  /// shahadaWord2Meaning
  ///
  /// In en, this message translates to:
  /// **'deity / god'**
  String get shahadaWord2Meaning;

  /// shahadaWord3Arabic
  ///
  /// In en, this message translates to:
  /// **'إِلَّا'**
  String get shahadaWord3Arabic;

  /// shahadaWord3Trans
  ///
  /// In en, this message translates to:
  /// **'illā'**
  String get shahadaWord3Trans;

  /// shahadaWord3Meaning
  ///
  /// In en, this message translates to:
  /// **'except'**
  String get shahadaWord3Meaning;

  /// shahadaWord4Arabic
  ///
  /// In en, this message translates to:
  /// **'اللَّهُ'**
  String get shahadaWord4Arabic;

  /// shahadaWord4Trans
  ///
  /// In en, this message translates to:
  /// **'Allāhu'**
  String get shahadaWord4Trans;

  /// shahadaWord4Meaning
  ///
  /// In en, this message translates to:
  /// **'Allah (God alone)'**
  String get shahadaWord4Meaning;

  /// shahadaWord5Arabic
  ///
  /// In en, this message translates to:
  /// **'مُحَمَّدٌ'**
  String get shahadaWord5Arabic;

  /// shahadaWord5Trans
  ///
  /// In en, this message translates to:
  /// **'Muḥammadun'**
  String get shahadaWord5Trans;

  /// shahadaWord5Meaning
  ///
  /// In en, this message translates to:
  /// **'Muhammad'**
  String get shahadaWord5Meaning;

  /// shahadaWord6Arabic
  ///
  /// In en, this message translates to:
  /// **'رَّسُولُ'**
  String get shahadaWord6Arabic;

  /// shahadaWord6Trans
  ///
  /// In en, this message translates to:
  /// **'Rasūlu'**
  String get shahadaWord6Trans;

  /// shahadaWord6Meaning
  ///
  /// In en, this message translates to:
  /// **'Messenger / Prophet'**
  String get shahadaWord6Meaning;

  /// shahadaWord7Arabic
  ///
  /// In en, this message translates to:
  /// **'اللَّهِ'**
  String get shahadaWord7Arabic;

  /// shahadaWord7Trans
  ///
  /// In en, this message translates to:
  /// **'Allāhi'**
  String get shahadaWord7Trans;

  /// shahadaWord7Meaning
  ///
  /// In en, this message translates to:
  /// **'of Allah'**
  String get shahadaWord7Meaning;

  /// shahadaMeaningTitle
  ///
  /// In en, this message translates to:
  /// **'Meaning & Significance'**
  String get shahadaMeaningTitle;

  /// shahadaMeaningBody
  ///
  /// In en, this message translates to:
  /// **'The Shahada is the declaration of faith that forms the foundation of Islam. It is the first of the Five Pillars. By speaking these words with sincere conviction, a person enters the fold of Islam. Ibn Kathir explains that the first part — \'There is no god but Allah\' — negates all false deities and affirms the absolute oneness of Allah. The second part — \'Muhammad is the Messenger of Allah\' — acknowledges that we receive our guidance through the Prophet ﷺ.'**
  String get shahadaMeaningBody;

  /// shahadaMomentTitle
  ///
  /// In en, this message translates to:
  /// **'The Moment of Shahada'**
  String get shahadaMomentTitle;

  /// shahadaMomentBody
  ///
  /// In en, this message translates to:
  /// **'When a person speaks the Shahada for the first time with true belief in their heart, something profound happens — they begin a new life. The Prophet ﷺ said: \'Whoever says there is no god but Allah and disbelieves in everything worshipped besides Him, his wealth and blood are protected.\' (Sahih Muslim). All past sins are forgiven. A new chapter begins. This declaration is not just words — it is a covenant between you and your Creator, a turning point that angels witness and record. Welcome to the fold of Islam.'**
  String get shahadaMomentBody;

  /// shahadaPronunciationTitle
  ///
  /// In en, this message translates to:
  /// **'Pronunciation Guide'**
  String get shahadaPronunciationTitle;

  /// shahadaPronunciationPart1
  ///
  /// In en, this message translates to:
  /// **'Laa · i · LAA · ha · il · LAL · LAH'**
  String get shahadaPronunciationPart1;

  /// shahadaPronunciationPart2
  ///
  /// In en, this message translates to:
  /// **'Mu · HAM · ma · dun · ra · SUU · lul · LAH'**
  String get shahadaPronunciationPart2;

  /// toolboxLearnSalahSubtitle
  ///
  /// In en, this message translates to:
  /// **'Step by step guide'**
  String get toolboxLearnSalahSubtitle;

  /// toolboxWuduSubtitle
  ///
  /// In en, this message translates to:
  /// **'Purification before prayer'**
  String get toolboxWuduSubtitle;

  /// toolboxGlossarySubtitle
  ///
  /// In en, this message translates to:
  /// **'114 Islamic terms explained'**
  String get toolboxGlossarySubtitle;

  /// shareSheetTitle
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareSheetTitle;

  /// shareAnAyah
  ///
  /// In en, this message translates to:
  /// **'Share an Ayah'**
  String get shareAnAyah;

  /// shareADua
  ///
  /// In en, this message translates to:
  /// **'Share a Dua'**
  String get shareADua;

  /// shareANameOfAllah
  ///
  /// In en, this message translates to:
  /// **'Share a Name of Allah'**
  String get shareANameOfAllah;

  /// shareAHadith
  ///
  /// In en, this message translates to:
  /// **'Share a Hadith'**
  String get shareAHadith;

  /// shareViaLabel
  ///
  /// In en, this message translates to:
  /// **'Shared via Noor Guard'**
  String get shareViaLabel;

  /// shareCardAyahLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Ayah of the Day'**
  String get shareCardAyahLabel;

  /// shareCardDuaLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Dua'**
  String get shareCardDuaLabel;

  /// shareCardNameLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Name of Allah'**
  String get shareCardNameLabel;

  /// shareCardHadithLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Hadith'**
  String get shareCardHadithLabel;

  /// sharePickDuaTitle
  ///
  /// In en, this message translates to:
  /// **'Pick a Dua to Share'**
  String get sharePickDuaTitle;

  /// shareError
  ///
  /// In en, this message translates to:
  /// **'Could not create share image'**
  String get shareError;

  /// shareCardVerseLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Quranic Verse'**
  String get shareCardVerseLabel;

  /// shareCardAsmaLabel
  ///
  /// In en, this message translates to:
  /// **'✦ Asma ul-Husna'**
  String get shareCardAsmaLabel;

  /// shareAyahSubtitle
  ///
  /// In en, this message translates to:
  /// **'Pick from 30 Quranic verses'**
  String get shareAyahSubtitle;

  /// shareDuaSubtitle
  ///
  /// In en, this message translates to:
  /// **'Pick from the library'**
  String get shareDuaSubtitle;

  /// shareNameSubtitle
  ///
  /// In en, this message translates to:
  /// **'Pick from all 99 Beautiful Names'**
  String get shareNameSubtitle;

  /// shareHadithSubtitle
  ///
  /// In en, this message translates to:
  /// **'Pick from 20 authentic hadiths'**
  String get shareHadithSubtitle;

  /// shareThisDua
  ///
  /// In en, this message translates to:
  /// **'Share This Dua'**
  String get shareThisDua;

  /// sharePickAyahTitle
  ///
  /// In en, this message translates to:
  /// **'Pick an Ayah to Share'**
  String get sharePickAyahTitle;

  /// searchAyahs
  ///
  /// In en, this message translates to:
  /// **'Search ayahs…'**
  String get searchAyahs;

  /// noAyahsFoundShort
  ///
  /// In en, this message translates to:
  /// **'No ayahs found'**
  String get noAyahsFoundShort;

  /// shareThisAyah
  ///
  /// In en, this message translates to:
  /// **'Share This Ayah'**
  String get shareThisAyah;

  /// sharePickNameTitle
  ///
  /// In en, this message translates to:
  /// **'Pick a Name to Share'**
  String get sharePickNameTitle;

  /// shareThisName
  ///
  /// In en, this message translates to:
  /// **'Share This Name'**
  String get shareThisName;

  /// sharePickHadithTitle
  ///
  /// In en, this message translates to:
  /// **'Pick a Hadith to Share'**
  String get sharePickHadithTitle;

  /// searchHadiths
  ///
  /// In en, this message translates to:
  /// **'Search hadiths…'**
  String get searchHadiths;

  /// noHadithsFound
  ///
  /// In en, this message translates to:
  /// **'No hadiths found'**
  String get noHadithsFound;

  /// shareThisHadith
  ///
  /// In en, this message translates to:
  /// **'Share This Hadith'**
  String get shareThisHadith;

  /// Title for the Back to Basics screen
  ///
  /// In en, this message translates to:
  /// **'Back to Basics'**
  String get backToBasics;

  /// Subtitle for the Back to Basics screen
  ///
  /// In en, this message translates to:
  /// **'Your guide to the essentials of Islam'**
  String get backToBasicsSubtitle;

  /// Section header for the five pillars
  ///
  /// In en, this message translates to:
  /// **'The 5 Pillars of Islam'**
  String get fivePillarsOfIslam;

  /// No description provided for @fivePillarsShort.
  ///
  /// In en, this message translates to:
  /// **'5 Pillars'**
  String get fivePillarsShort;

  /// Subtitle for the 5 Pillars card
  ///
  /// In en, this message translates to:
  /// **'The foundations of Islamic faith'**
  String get fivePillarsSubtitle;

  /// Expand a pillar detail
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get pillarLearnMore;

  /// Collapse a pillar detail
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get pillarShowLess;

  /// Button to expand all 5 pillar detail texts
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get pillarsShowDetails;

  /// Button to collapse all 5 pillar detail texts
  ///
  /// In en, this message translates to:
  /// **'Hide Details'**
  String get pillarsHideDetails;

  /// Name of the first pillar
  ///
  /// In en, this message translates to:
  /// **'Shahada'**
  String get pillar1Name;

  /// Short description of Shahada
  ///
  /// In en, this message translates to:
  /// **'Declaration of Faith'**
  String get pillar1Desc;

  /// Expanded detail of Shahada
  ///
  /// In en, this message translates to:
  /// **'The declaration of faith is the foundation of Islam. By sincerely saying \'There is no god but Allah, and Muhammad is His messenger,\' a person enters the fold of Islam.'**
  String get pillar1Detail;

  /// Name of the second pillar
  ///
  /// In en, this message translates to:
  /// **'Salah'**
  String get pillar2Name;

  /// Short description of Salah
  ///
  /// In en, this message translates to:
  /// **'Five Daily Prayers'**
  String get pillar2Desc;

  /// Expanded detail of Salah
  ///
  /// In en, this message translates to:
  /// **'The five daily prayers are the direct connection between a Muslim and Allah. Prayed at dawn, midday, afternoon, sunset, and night, they structure the Muslim\'s entire day around remembrance of Allah.'**
  String get pillar2Detail;

  /// Name of the third pillar
  ///
  /// In en, this message translates to:
  /// **'Zakat'**
  String get pillar3Name;

  /// Short description of Zakat
  ///
  /// In en, this message translates to:
  /// **'Obligatory Charity'**
  String get pillar3Desc;

  /// Expanded detail of Zakat
  ///
  /// In en, this message translates to:
  /// **'Zakat is the obligatory annual charity of 2.5% of one\'s savings given to those in need. It purifies wealth and strengthens the bonds of the Muslim community.'**
  String get pillar3Detail;

  /// Name of the fourth pillar
  ///
  /// In en, this message translates to:
  /// **'Sawm'**
  String get pillar4Name;

  /// Short description of Sawm
  ///
  /// In en, this message translates to:
  /// **'Fasting in Ramadan'**
  String get pillar4Desc;

  /// Expanded detail of Sawm
  ///
  /// In en, this message translates to:
  /// **'Fasting during the blessed month of Ramadan from dawn to sunset. Muslims abstain from food, drink, and sin to achieve taqwa (God-consciousness) and gratitude.'**
  String get pillar4Detail;

  /// Name of the fifth pillar
  ///
  /// In en, this message translates to:
  /// **'Hajj'**
  String get pillar5Name;

  /// Short description of Hajj
  ///
  /// In en, this message translates to:
  /// **'Pilgrimage to Mecca'**
  String get pillar5Desc;

  /// Expanded detail of Hajj
  ///
  /// In en, this message translates to:
  /// **'The pilgrimage to Mecca is required once in a lifetime for every Muslim who is physically and financially able. It is the largest annual gathering of people on earth.'**
  String get pillar5Detail;

  /// Snackbar shown when switching to New Muslim Mode
  ///
  /// In en, this message translates to:
  /// **'Switched to New Muslim Mode'**
  String get switchedToNewMuslimMode;

  /// Snackbar shown when switching back to Regular Mode
  ///
  /// In en, this message translates to:
  /// **'Switched to Regular Mode'**
  String get switchedToRegularMode;

  /// Android notification channel name for the persistent live lock-screen notification
  ///
  /// In en, this message translates to:
  /// **'Noor Guard Live'**
  String get liveNotifChannelName;

  /// Android notification channel description for the persistent live lock-screen notification
  ///
  /// In en, this message translates to:
  /// **'Prayer countdown and daily Islamic content on your lock screen'**
  String get liveNotifChannelDescription;

  /// Header above the rotating daily ayah in the live notification (uppercase where the script has case)
  ///
  /// In en, this message translates to:
  /// **'AYAH OF THE DAY'**
  String get liveNotifHeaderAyah;

  /// Header above the rotating daily dua in the live notification
  ///
  /// In en, this message translates to:
  /// **'DAILY DUA'**
  String get liveNotifHeaderDua;

  /// Header above the rotating daily glossary word in the live notification
  ///
  /// In en, this message translates to:
  /// **'WORD OF THE DAY'**
  String get liveNotifHeaderWord;

  /// Header above the rotating daily Name of Allah in the live notification
  ///
  /// In en, this message translates to:
  /// **'NAME OF ALLAH'**
  String get liveNotifHeaderName;

  /// Header above the rotating daily hadith in the live notification
  ///
  /// In en, this message translates to:
  /// **'HADITH OF THE DAY'**
  String get liveNotifHeaderHadith;

  /// Countdown to the next prayer, hours + minutes. Passed to native code as a template with literal {hours}/{minutes} placeholders.
  ///
  /// In en, this message translates to:
  /// **'in {hours}h {minutes}m'**
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes);

  /// Countdown to the next prayer, under one hour. Passed to native code as a template with a literal {minutes} placeholder.
  ///
  /// In en, this message translates to:
  /// **'in {minutes}m'**
  String liveNotifCountdownMinutes(Object minutes);

  /// Shown in the live notification when the next prayer's time has arrived
  ///
  /// In en, this message translates to:
  /// **'It\'s time to pray'**
  String get liveNotifCountdownNow;

  /// Title of the Saved Duas bookmarks screen
  ///
  /// In en, this message translates to:
  /// **'Saved Duas'**
  String get savedDuas;

  /// Title of the Saved Verses (Quran bookmarks) screen
  ///
  /// In en, this message translates to:
  /// **'Saved Verses'**
  String get savedVerses;

  /// Short label on the Quran screen header button that opens Saved Verses
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get savedButtonLabel;

  /// Title of the Saved Names (Asma ul Husna bookmarks) screen
  ///
  /// In en, this message translates to:
  /// **'Saved Names'**
  String get savedNames;

  /// Empty state on the Saved Duas screen
  ///
  /// In en, this message translates to:
  /// **'No saved duas yet'**
  String get noSavedDuas;

  /// Empty state on the Saved Verses screen
  ///
  /// In en, this message translates to:
  /// **'No saved verses yet'**
  String get noSavedVerses;

  /// Empty state on the Saved Names screen
  ///
  /// In en, this message translates to:
  /// **'No saved names yet'**
  String get noSavedNames;

  /// Hero card rotating Quran verse (Al-Baqarah 2:286)
  ///
  /// In en, this message translates to:
  /// **'Our Lord, do not impose blame upon us if we forget or err.'**
  String get heroVerse16;

  /// Hero card rotating Quran verse (Ali 'Imran 3:173)
  ///
  /// In en, this message translates to:
  /// **'Sufficient for us is Allah, and He is the best Disposer of affairs.'**
  String get heroVerse17;

  /// Hero card rotating Quran verse (An-Nisa 4:136)
  ///
  /// In en, this message translates to:
  /// **'O you who believe, believe in Allah and His Messenger.'**
  String get heroVerse18;

  /// Hero card rotating Quran verse (Al-Ma'idah 5:35)
  ///
  /// In en, this message translates to:
  /// **'O you who believe, be mindful of Allah and seek the means of nearness to Him.'**
  String get heroVerse19;

  /// Hero card rotating Quran verse (Al-An'am 6:162)
  ///
  /// In en, this message translates to:
  /// **'Indeed, my prayer, my sacrifice, my living and my dying are for Allah, Lord of the worlds.'**
  String get heroVerse20;

  /// Hero card rotating Quran verse (Al-A'raf 7:156)
  ///
  /// In en, this message translates to:
  /// **'Decree for us good in this world and in the Hereafter; we have turned back to You.'**
  String get heroVerse21;

  /// Hero card rotating Quran verse (Al-Anfal 8:45)
  ///
  /// In en, this message translates to:
  /// **'Remember Allah often, so that you may be successful.'**
  String get heroVerse22;

  /// Hero card rotating Quran verse (At-Tawbah 9:51)
  ///
  /// In en, this message translates to:
  /// **'Nothing will befall us except what Allah has decreed for us; He is our Protector.'**
  String get heroVerse23;

  /// Hero card rotating Quran verse (Yunus 10:62)
  ///
  /// In en, this message translates to:
  /// **'Indeed, the friends of Allah — no fear will there be concerning them, nor will they grieve.'**
  String get heroVerse24;

  /// Hero card rotating Quran verse (Hud 11:88)
  ///
  /// In en, this message translates to:
  /// **'My success is only through Allah; upon Him I rely, and to Him I turn.'**
  String get heroVerse25;

  /// Hero card rotating Quran verse (Yusuf 12:87)
  ///
  /// In en, this message translates to:
  /// **'Do not despair of the mercy of Allah.'**
  String get heroVerse26;

  /// Hero card rotating Quran verse (Ar-Ra'd 13:28)
  ///
  /// In en, this message translates to:
  /// **'Those who believe and whose hearts find rest in the remembrance of Allah.'**
  String get heroVerse27;

  /// Hero card rotating Quran verse (Ibrahim 14:7)
  ///
  /// In en, this message translates to:
  /// **'And when your Lord proclaimed: If you give thanks, I will surely give you more.'**
  String get heroVerse28;

  /// Hero card rotating Quran verse (Al-Hijr 15:99)
  ///
  /// In en, this message translates to:
  /// **'And worship your Lord until there comes to you the certainty.'**
  String get heroVerse29;

  /// Hero card rotating Quran verse (An-Nahl 16:128)
  ///
  /// In en, this message translates to:
  /// **'Indeed, Allah is with those who fear Him and those who do good.'**
  String get heroVerse30;

  /// Subtitle under the Begin Focus button on the Focus Mode screen
  ///
  /// In en, this message translates to:
  /// **'Protect your time for what matters'**
  String get focusButtonSubtitle;

  /// Community stories: home card + screen title
  ///
  /// In en, this message translates to:
  /// **'Our Stories'**
  String get ourStories;

  /// Home card link to open all stories
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get storiesSeeAll;

  /// Expand a truncated story
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get storiesReadMore;

  /// Badge on the featured story card
  ///
  /// In en, this message translates to:
  /// **'Featured Story'**
  String get storiesFeaturedLabel;

  /// Filter tab: revert stories
  ///
  /// In en, this message translates to:
  /// **'Reverts'**
  String get storiesFilterReverts;

  /// Story category badge: revert
  ///
  /// In en, this message translates to:
  /// **'Revert'**
  String get storyCategoryRevert;

  /// Story category badge + filter: born Muslim
  ///
  /// In en, this message translates to:
  /// **'Born Muslim'**
  String get storyCategoryBornMuslim;

  /// Story category badge + filter: returning to Islam
  ///
  /// In en, this message translates to:
  /// **'Returning'**
  String get storyCategoryReturning;

  /// Header button opening the submit-story form
  ///
  /// In en, this message translates to:
  /// **'Share Yours'**
  String get storiesShareYours;

  /// Empty state title when no stories are approved yet
  ///
  /// In en, this message translates to:
  /// **'No stories yet'**
  String get storiesEmptyTitle;

  /// Empty state subtitle
  ///
  /// In en, this message translates to:
  /// **'Be the first to share your journey'**
  String get storiesEmptySubtitle;

  /// Shahada date line on a story card
  ///
  /// In en, this message translates to:
  /// **'Shahada: {date}'**
  String storyShahadaDate(Object date);

  /// Comments sheet title
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get storiesComments;

  /// Comment input hint
  ///
  /// In en, this message translates to:
  /// **'Add a comment…'**
  String get storiesAddComment;

  /// Fallback author name for anonymous stories/comments
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get storiesAnonymous;

  /// Submit form: name field label
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get storiesNameLabel;

  /// Submit form: anonymous toggle
  ///
  /// In en, this message translates to:
  /// **'Post anonymously'**
  String get storiesPostAnonymously;

  /// Submit form: country dropdown label
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get storiesCountryLabel;

  /// Submit form: category selector label
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get storiesCategoryLabel;

  /// Submit form: optional shahada date picker label
  ///
  /// In en, this message translates to:
  /// **'Date of Shahada (optional)'**
  String get storiesShahadaDateLabel;

  /// Submit form: story field label
  ///
  /// In en, this message translates to:
  /// **'Your Story'**
  String get storiesYourStoryLabel;

  /// Submit form: story field hint
  ///
  /// In en, this message translates to:
  /// **'Tell us about your journey…'**
  String get storiesStoryHint;

  /// Submit form: background image picker section label
  ///
  /// In en, this message translates to:
  /// **'Choose a Background'**
  String get storiesChooseBackground;

  /// Submit form: no-background option in the image picker
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get storiesBackgroundNone;

  /// Title of the sheet when editing an existing story
  ///
  /// In en, this message translates to:
  /// **'Edit Your Story'**
  String get storiesEditTitle;

  /// Save button when editing an existing story
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get storiesSaveChanges;

  /// Confirmation snackbar after editing own story
  ///
  /// In en, this message translates to:
  /// **'Your story has been updated'**
  String get storiesUpdated;

  /// Submit form: photo upload button
  ///
  /// In en, this message translates to:
  /// **'Upload Photo (optional)'**
  String get storiesUploadPhoto;

  /// Submit form: photo replace button
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get storiesChangePhoto;

  /// Submit form: submit button
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get storiesSubmitButton;

  /// Confirmation after story submission
  ///
  /// In en, this message translates to:
  /// **'JazakAllah khair! Your story has been submitted for review.'**
  String get storiesSubmitted;

  /// Generic submission error
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get storiesSubmitError;

  /// Validation when story/country missing
  ///
  /// In en, this message translates to:
  /// **'Please add your story and country.'**
  String get storiesFillRequired;

  /// Type label on the story share card
  ///
  /// In en, this message translates to:
  /// **'Community Story'**
  String get storiesShareCardLabel;

  /// Label above the live story card preview in the submit form
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get storiesPreviewLabel;

  /// Badge on the user's own story awaiting moderation
  ///
  /// In en, this message translates to:
  /// **'Pending Review'**
  String get storiesPendingReview;

  /// Filter tab showing locally bookmarked stories
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get storiesFilterSaved;

  /// Empty state when the Saved tab has no stories
  ///
  /// In en, this message translates to:
  /// **'No saved stories yet'**
  String get storiesSavedEmpty;

  /// Hint in the searchable country field
  ///
  /// In en, this message translates to:
  /// **'Search country…'**
  String get storiesSearchCountryHint;

  /// Label above the avatar picker in the submit form
  ///
  /// In en, this message translates to:
  /// **'Choose an Avatar'**
  String get storiesChooseAvatar;

  /// Avatar style tab: gold initials circle
  ///
  /// In en, this message translates to:
  /// **'Initials'**
  String get storiesAvatarInitials;

  /// Avatar style tab: illustrated Islamic icon
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get storiesAvatarIcon;

  /// Avatar style tab: generated geometric pattern
  ///
  /// In en, this message translates to:
  /// **'Pattern'**
  String get storiesAvatarPattern;

  /// Error state when stories fail to load
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load stories. Check your connection.'**
  String get storiesLoadError;

  /// Confirm dialog title when leaving the submit form with unsaved changes
  ///
  /// In en, this message translates to:
  /// **'Discard your story?'**
  String get storiesDiscardTitle;

  /// Destructive option in the discard-story dialog
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get storiesDiscard;

  /// Safe option in the discard-story dialog (stay in the form)
  ///
  /// In en, this message translates to:
  /// **'Keep Writing'**
  String get storiesKeepWriting;

  /// Header pill button that saves the form as a local draft
  ///
  /// In en, this message translates to:
  /// **'Save Draft'**
  String get storiesSaveDraft;

  /// Snackbar after the draft is saved
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get storiesDraftSaved;

  /// Header button that deletes the saved draft and resets the form
  ///
  /// In en, this message translates to:
  /// **'Delete Draft'**
  String get storiesDeleteDraft;

  /// Banner shown when a saved draft was restored into the form
  ///
  /// In en, this message translates to:
  /// **'Continue your draft'**
  String get storiesContinueDraft;

  /// Banner action that clears the draft and resets the form
  ///
  /// In en, this message translates to:
  /// **'Start fresh'**
  String get storiesStartFresh;

  /// Type label on the glossary share card
  ///
  /// In en, this message translates to:
  /// **'✦ Islamic Glossary'**
  String get shareCardGlossaryLabel;

  /// Type label on the tafsir share card
  ///
  /// In en, this message translates to:
  /// **'✦ Tafsir'**
  String get shareCardTafsirLabel;

  /// Ayah reference line on the tafsir share card
  ///
  /// In en, this message translates to:
  /// **'Ayah {number}'**
  String shareCardAyahRef(String number);

  /// No description provided for @prayerReminderTitleFajr.
  ///
  /// In en, this message translates to:
  /// **'🕌 Time for Fajr'**
  String get prayerReminderTitleFajr;

  /// No description provided for @prayerReminderTitleDhuhr.
  ///
  /// In en, this message translates to:
  /// **'☀️ Time for Dhuhr'**
  String get prayerReminderTitleDhuhr;

  /// No description provided for @prayerReminderTitleAsr.
  ///
  /// In en, this message translates to:
  /// **'🌤️ Time for Asr'**
  String get prayerReminderTitleAsr;

  /// No description provided for @prayerReminderTitleMaghrib.
  ///
  /// In en, this message translates to:
  /// **'🌅 Time for Maghrib'**
  String get prayerReminderTitleMaghrib;

  /// No description provided for @prayerReminderTitleIsha.
  ///
  /// In en, this message translates to:
  /// **'🌙 Time for Isha'**
  String get prayerReminderTitleIsha;

  /// No description provided for @prayerReminderBodyFajr.
  ///
  /// In en, this message translates to:
  /// **'Rise and pray. Allah rewards those who wake for Him.'**
  String get prayerReminderBodyFajr;

  /// No description provided for @prayerReminderBodyDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Take a moment for Allah. Your Dhuhr prayer awaits.'**
  String get prayerReminderBodyDhuhr;

  /// No description provided for @prayerReminderBodyAsr.
  ///
  /// In en, this message translates to:
  /// **'The middle prayer. Guard it closely. — Al-Baqarah 2:238'**
  String get prayerReminderBodyAsr;

  /// No description provided for @prayerReminderBodyMaghrib.
  ///
  /// In en, this message translates to:
  /// **'The sun has set. Answer the call of Allah.'**
  String get prayerReminderBodyMaghrib;

  /// No description provided for @prayerReminderBodyIsha.
  ///
  /// In en, this message translates to:
  /// **'End your day with Allah. Your night prayer awaits.'**
  String get prayerReminderBodyIsha;

  /// No description provided for @prayerAlarmMessageFajr.
  ///
  /// In en, this message translates to:
  /// **'Rise and pray. Allah rewards those who wake for Him.'**
  String get prayerAlarmMessageFajr;

  /// No description provided for @prayerAlarmMessageDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Take a moment for Allah. Your Dhuhr prayer awaits.'**
  String get prayerAlarmMessageDhuhr;

  /// No description provided for @prayerAlarmMessageAsr.
  ///
  /// In en, this message translates to:
  /// **'Guard the middle prayer closely. — Al-Baqarah 2:238'**
  String get prayerAlarmMessageAsr;

  /// No description provided for @prayerAlarmMessageMaghrib.
  ///
  /// In en, this message translates to:
  /// **'The sun has set. Answer the call of Allah.'**
  String get prayerAlarmMessageMaghrib;

  /// No description provided for @prayerAlarmMessageIsha.
  ///
  /// In en, this message translates to:
  /// **'End your day with Allah. Your night prayer awaits.'**
  String get prayerAlarmMessageIsha;

  /// Reminder title for an unknown prayer name
  ///
  /// In en, this message translates to:
  /// **'🕌 {prayer} in 15 minutes'**
  String prayerReminderTitleGeneric(String prayer);

  /// Reminder body for an unknown prayer name
  ///
  /// In en, this message translates to:
  /// **'Time to prepare for {prayer} prayer'**
  String prayerReminderBodyGeneric(String prayer);

  /// Full-screen alarm message for an unknown prayer name
  ///
  /// In en, this message translates to:
  /// **'Time for {prayer} prayer'**
  String prayerAlarmMessageGeneric(String prayer);

  /// No description provided for @testNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'🔔 Test Notification'**
  String get testNotificationTitle;

  /// No description provided for @testNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Notifications are working correctly!'**
  String get testNotificationBody;

  /// Section header above favorited reciters in the reciter picker
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoriteRecitersSection;

  /// Message when trying to favorite more than 3 reciters
  ///
  /// In en, this message translates to:
  /// **'You can only have 3 favorite reciters. Remove one to add another.'**
  String get favoriteRecitersLimit;

  /// Button in the How to Pray Qibla step that opens the Qibla compass screen
  ///
  /// In en, this message translates to:
  /// **'Find Qibla Direction'**
  String get findQiblaDirection;

  /// Story 3-dot menu: share option
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get storyMenuShare;

  /// Story 3-dot menu: bookmark option
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get storyMenuBookmark;

  /// Story 3-dot menu: report option
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get storyMenuReport;

  /// Story 3-dot menu: delete option, shown only to the story's own author
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get storyMenuDelete;

  /// Title of the confirmation dialog before permanently deleting the user's own story
  ///
  /// In en, this message translates to:
  /// **'Delete this story?'**
  String get storyDeleteConfirmTitle;

  /// Body text of the delete-story confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'This will permanently remove your story from Community Stories. This can\'t be undone.'**
  String get storyDeleteConfirmBody;

  /// Snackbar shown after a story is successfully deleted
  ///
  /// In en, this message translates to:
  /// **'Story deleted'**
  String get storyDeleted;

  /// Snackbar shown when deleting a story fails
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete your story — please try again'**
  String get storyDeleteError;

  /// Title of the report-a-story sheet
  ///
  /// In en, this message translates to:
  /// **'Report this story'**
  String get reportSheetTitle;

  /// Subtitle of the report-a-story sheet
  ///
  /// In en, this message translates to:
  /// **'Help us keep Noor Guard safe'**
  String get reportSheetSubtitle;

  /// Report reason option
  ///
  /// In en, this message translates to:
  /// **'Inappropriate content'**
  String get reportReasonInappropriate;

  /// Report reason option
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportReasonSpam;

  /// Report reason option
  ///
  /// In en, this message translates to:
  /// **'Hate speech'**
  String get reportReasonHateSpeech;

  /// Report reason option
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get reportReasonOther;

  /// Submit button on the report sheet
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get reportSubmit;

  /// Snackbar shown after a report is submitted
  ///
  /// In en, this message translates to:
  /// **'JazakAllah Khair — thank you for reporting'**
  String get reportThankYou;

  /// Settings button that opens the admin panel
  ///
  /// In en, this message translates to:
  /// **'Admin Mode'**
  String get adminMode;

  /// Admin screen title
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminTitle;

  /// Admin tab: stories awaiting moderation
  ///
  /// In en, this message translates to:
  /// **'Pending Stories'**
  String get adminTabPending;

  /// Admin tab: reported stories
  ///
  /// In en, this message translates to:
  /// **'Reported Stories'**
  String get adminTabReported;

  /// Admin button: approve a pending story
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get adminApprove;

  /// Admin button: reject a pending story
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get adminReject;

  /// Admin button: delete a reported story
  ///
  /// In en, this message translates to:
  /// **'Delete Story'**
  String get adminDeleteStory;

  /// Admin button: dismiss a report
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get adminDismiss;

  /// Admin empty state: no pending stories
  ///
  /// In en, this message translates to:
  /// **'No pending stories'**
  String get adminEmptyPending;

  /// Admin empty state: no pending reports
  ///
  /// In en, this message translates to:
  /// **'No pending reports'**
  String get adminEmptyReports;

  /// Placeholder shown on the Qibla screen location chip while the city name is being resolved
  ///
  /// In en, this message translates to:
  /// **'Locating...'**
  String get locating;

  /// Title of the at-prayer-time notification (fires at the exact prayer time, after the 15-minute-early reminder)
  ///
  /// In en, this message translates to:
  /// **'🕌 It\'s time for Fajr'**
  String get prayerBegunTitleFajr;

  /// Title of the at-prayer-time notification (fires at the exact prayer time, after the 15-minute-early reminder)
  ///
  /// In en, this message translates to:
  /// **'☀️ It\'s time for Dhuhr'**
  String get prayerBegunTitleDhuhr;

  /// Title of the at-prayer-time notification (fires at the exact prayer time, after the 15-minute-early reminder)
  ///
  /// In en, this message translates to:
  /// **'🌤️ It\'s time for Asr'**
  String get prayerBegunTitleAsr;

  /// Title of the at-prayer-time notification (fires at the exact prayer time, after the 15-minute-early reminder)
  ///
  /// In en, this message translates to:
  /// **'🌅 It\'s time for Maghrib'**
  String get prayerBegunTitleMaghrib;

  /// Title of the at-prayer-time notification (fires at the exact prayer time, after the 15-minute-early reminder)
  ///
  /// In en, this message translates to:
  /// **'🌙 It\'s time for Isha'**
  String get prayerBegunTitleIsha;

  /// Shown in the Qibla city search dropdown when the autocomplete query matches no cities
  ///
  /// In en, this message translates to:
  /// **'No cities found'**
  String get noCitiesFound;

  /// Title of the disclosure dialog shown before opening Android Accessibility Settings from the App Blocking enable toggle
  ///
  /// In en, this message translates to:
  /// **'Accessibility Permission Required'**
  String get appBlockingAccessDialogTitle;

  /// Body of the accessibility disclosure dialog (Play prominent-disclosure requirement)
  ///
  /// In en, this message translates to:
  /// **'Noor Guard uses Android\'s Accessibility Service to block distracting apps during prayer and focus time. No personal data is collected or shared. Tap Continue to open Settings and enable it.'**
  String get appBlockingAccessDialogBody;

  /// Continue button of the accessibility disclosure dialog
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get appBlockingAccessDialogContinue;

  /// Title of the one-time ad notice popup shown on first launch after onboarding
  ///
  /// In en, this message translates to:
  /// **'A note about Noor Guard'**
  String get adNoticeTitle;

  /// Subtitle of the one-time ad notice popup
  ///
  /// In en, this message translates to:
  /// **'Noor Guard is free to use. To keep it running, we show ads after your first 5 days.'**
  String get adNoticeSubtitle;

  /// First bullet point in the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'We try our best to show halal-only ads'**
  String get adNoticeBulletHalalAds;

  /// Second bullet point in the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'We never sell your data'**
  String get adNoticeBulletNoSellData;

  /// Third bullet point in the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'Community Stories requires Premium'**
  String get adNoticeBulletCommunityPremium;

  /// Fourth bullet point in the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'Remove ads and unlock all features by upgrading to Premium'**
  String get adNoticeBulletUpgradePremium;

  /// Italic thank-you line shown below the bullet points in the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'JazakAllahu Khayran for your support'**
  String get adNoticeThanks;

  /// Dismiss button of the ad notice popup
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get adNoticeGotIt;

  /// Title of the premium upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'Unlock Premium'**
  String get premiumUnlock;

  /// Primary button label on the premium upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get premiumUpgradeButton;

  /// Secondary/dismiss button label on the premium upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get premiumMaybeLater;

  /// Pricing line shown on the premium upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'\$4.99/month or \$34.99/year'**
  String get premiumPricing;

  /// Feature name shown on the premium upgrade dialog when triggered from App Blocking
  ///
  /// In en, this message translates to:
  /// **'App Blocking'**
  String get premiumAppBlockingName;

  /// Feature description shown on the premium upgrade dialog when triggered from App Blocking
  ///
  /// In en, this message translates to:
  /// **'Block distracting apps during prayer time and focus sessions to strengthen your connection with Allah.'**
  String get premiumAppBlockingDescription;

  /// Feature name shown on the premium upgrade dialog when triggered from posting a story
  ///
  /// In en, this message translates to:
  /// **'Post a Story'**
  String get premiumPostStoryName;

  /// Feature description shown on the premium upgrade dialog when triggered from posting a story
  ///
  /// In en, this message translates to:
  /// **'Share your journey as a Muslim with the global Noor Guard community.'**
  String get premiumPostStoryDescription;

  /// Feature name shown on the premium upgrade dialog when triggered from commenting on a story
  ///
  /// In en, this message translates to:
  /// **'Comment on Stories'**
  String get premiumCommentStoriesName;

  /// Feature description shown on the premium upgrade dialog when triggered from commenting on a story
  ///
  /// In en, this message translates to:
  /// **'Engage with and encourage fellow Muslims in the community.'**
  String get premiumCommentStoriesDescription;

  /// Feature name shown on the premium upgrade dialog when triggered from a gated Quran reciter
  ///
  /// In en, this message translates to:
  /// **'Quran Reciters'**
  String get premiumQuranRecitersName;

  /// Feature description shown on the premium upgrade dialog when triggered from a gated Quran reciter
  ///
  /// In en, this message translates to:
  /// **'Unlock 10+ world-renowned reciters including Sheikh Maher Al-Muaiqly and Sheikh Saad Al-Ghamdi.'**
  String get premiumQuranRecitersDescription;

  /// Feature name shown on the premium upgrade dialog when triggered from a gated Adhan reciter
  ///
  /// In en, this message translates to:
  /// **'Adhan Reciters'**
  String get premiumAdhanRecitersName;

  /// Feature description shown on the premium upgrade dialog when triggered from a gated Adhan reciter
  ///
  /// In en, this message translates to:
  /// **'Wake to the call of prayer from your favorite muezzin.'**
  String get premiumAdhanRecitersDescription;

  /// Feature name shown on the premium upgrade dialog when triggered from background Quran playback
  ///
  /// In en, this message translates to:
  /// **'Background Playback'**
  String get premiumBackgroundPlaybackName;

  /// Feature description shown on the premium upgrade dialog when triggered from background Quran playback
  ///
  /// In en, this message translates to:
  /// **'Listen to Quran while you work, commute, or rest — even with your screen off.'**
  String get premiumBackgroundPlaybackDescription;

  /// Section header in Settings for the Premium membership status and restore purchases
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumMembership;

  /// Shown in Settings when the user has an active Premium subscription
  ///
  /// In en, this message translates to:
  /// **'Premium Member'**
  String get premiumStatusActive;

  /// Shown in Settings when the user does not have Premium
  ///
  /// In en, this message translates to:
  /// **'Free Plan'**
  String get premiumStatusFree;

  /// Button/row label to restore previously purchased Premium subscriptions (required by Apple)
  ///
  /// In en, this message translates to:
  /// **'Restore Purchases'**
  String get premiumRestorePurchases;

  /// Confirmation shown after successfully restoring a previous Premium purchase
  ///
  /// In en, this message translates to:
  /// **'Your purchases have been restored.'**
  String get premiumRestoreSuccess;

  /// Shown after Restore Purchases completes with nothing to restore
  ///
  /// In en, this message translates to:
  /// **'No previous purchases were found.'**
  String get premiumRestoreNone;

  /// Shown when the Restore Purchases flow fails
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t restore purchases. Please try again.'**
  String get premiumRestoreError;

  /// Shown when an in-app purchase fails or returns an error
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Please try again.'**
  String get premiumPurchaseError;

  /// Label for the monthly Premium subscription plan button on the upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get premiumMonthlyPlan;

  /// Label for the annual Premium subscription plan button on the upgrade dialog
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get premiumAnnualPlan;

  /// Badge shown on the annual Premium plan to highlight it as the better deal
  ///
  /// In en, this message translates to:
  /// **'Best Value'**
  String get premiumBestValue;

  /// Shown on the premium upgrade dialog when store product prices can't be loaded
  ///
  /// In en, this message translates to:
  /// **'Pricing unavailable. Check your connection and try again.'**
  String get premiumProductsUnavailable;

  /// Small note shown above the tafsir list when falling back to the English tafsir because the user's language has no tafsir source
  ///
  /// In en, this message translates to:
  /// **'Tafsir not available in your language yet.'**
  String get tafsirFallbackNote;
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
        'fa',
        'fr',
        'id',
        'it',
        'ja',
        'nl',
        'pt',
        'ru',
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
    case 'fa':
      return AppLocalizationsFa();
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
    case 'ru':
      return AppLocalizationsRu();
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
