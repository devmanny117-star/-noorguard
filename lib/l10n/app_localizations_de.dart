// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Möge Allah deinen Tag segnen';

  @override
  String get nextPrayer => 'Nächstes Gebet';

  @override
  String get iPrayedButton => 'Ich habe gebetet';

  @override
  String get todaysPrayers => 'Heutige Gebete';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Fokus-Modus';

  @override
  String get appBlocking => 'App-Sperre';

  @override
  String get islamicCalendar => 'Islamischer Kalender';

  @override
  String get islamicCalendarSubtitle => 'Hijri-Daten & Ereignisse';

  @override
  String get duas => 'Duas';

  @override
  String get quran => 'Koran';

  @override
  String get settings => 'Einstellungen';

  @override
  String get complete => 'Abschließen';

  @override
  String get streak => 'Serie';

  @override
  String get dayStreak => 'Tage in Folge';

  @override
  String get compassRequiresDevice => 'Kompass erfordert ein echtes Gerät';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '$count Tag',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Alle Gebete abgeschlossen! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 Gebete abgeschlossen';
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
    return '$count Fard-Rakats';
  }

  @override
  String sunnahBefore(int count) {
    return '$count Sunnah davor';
  }

  @override
  String sunnahAfter(int count) {
    return '$count Sunnah danach';
  }

  @override
  String prayedAt(String time) {
    return 'Gebetszeit: $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise =>
      'in der Morgendämmerung vor Sonnenaufgang';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'nachdem die Sonne ihren höchsten Punkt überschritten hat';

  @override
  String get timePeriodLateAfternoon => 'am späten Nachmittag';

  @override
  String get timePeriodJustAfterSunset => 'kurz nach Sonnenuntergang';

  @override
  String get timePeriodNightBeforeMidnight => 'in der Nacht vor Mitternacht';

  @override
  String get fajrHadith =>
      'Die zwei Rakats des Fajr sind besser als die Welt und alles, was sie enthält. — Prophet Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr ist das erste Gebet des Tages. Es erinnert uns daran, den Tag mit dem Gedenken an Allah zu beginnen.';

  @override
  String get dhuhrHadith =>
      'Wer die zwölf Sunnah-Rakats betet, dem wird Allah ein Haus im Paradies erbauen.';

  @override
  String get dhuhrTip =>
      'Dhuhr ist das Mittagsgebet. Ein perfekter Moment, um innezuhalten und sich neu zu verbinden.';

  @override
  String get asrHadith =>
      'Wer das Asr-Gebet versäumt, ist, als hätte er seine Familie und seinen Besitz verloren. — Prophet Muhammad ﷺ';

  @override
  String get asrTip =>
      'Asr wird oft das mittlere Gebet genannt. Allah erwähnt es ausdrücklich im Koran (2:238).';

  @override
  String get maghribHadith => 'Das Maghrib-Gebet ist das Witr des Tages.';

  @override
  String get maghribTip =>
      'Maghrib markiert das Ende des Fastentages im Ramadan. Es wird genau bei Sonnenuntergang gebetet.';

  @override
  String get ishaHadith =>
      'Wer Isha in Gemeinschaft betet, ist, als hätte er die halbe Nacht im Gebet verbracht.';

  @override
  String get ishaTip =>
      'Isha ist das letzte Gebet des Tages. Den Tag mit dem Gebet zu beenden bringt Frieden und Abschluss.';

  @override
  String get newMuslimTip => 'Tipp für neue Muslime';

  @override
  String get notificationsOn => 'Benachrichtigungen an';

  @override
  String get notificationsOff => 'Benachrichtigungen aus';

  @override
  String get preview => 'Vorschau';

  @override
  String get lockPreviewCountdown => 'In 1 Std. 23 Min.  ·  16:47 Uhr';

  @override
  String get swipeUpToUnlock => 'Nach oben wischen zum Entsperren';

  @override
  String get searchSurahs => 'Suren suchen…';

  @override
  String get noSurahsFound => 'Keine Suren gefunden';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String ayahs(int count) {
    return '$count Ayat';
  }

  @override
  String get searchDuas => 'Duas suchen…';

  @override
  String supplications(int count) {
    return '$count Bittgebete';
  }

  @override
  String get prayerSettings => 'Gebetseinstellungen';

  @override
  String get calculationMethod => 'Berechnungsmethode';

  @override
  String get adhanSound => 'Adhan-Ton';

  @override
  String get prayerNotifications => 'Gebetsbenachrichtigungen';

  @override
  String get statusOn => 'Ein';

  @override
  String get statusOff => 'Aus';

  @override
  String get enableAllNotifications => 'Alle Benachrichtigungen aktivieren';

  @override
  String get individualPrayers => 'Einzelne Gebete';

  @override
  String get appearance => 'Darstellung';

  @override
  String get darkMode => 'Dunkler Modus';

  @override
  String get language => 'Sprache';

  @override
  String get aboutNoorGuard => 'Über die App';

  @override
  String get version => 'App-Version';

  @override
  String get rateApp => 'Noor Guard bewerten';

  @override
  String get shareApp => 'Noor Guard teilen';

  @override
  String get contactSupport => 'Support kontaktieren';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get helpUsImprove => 'Hilf uns, besser zu werden';

  @override
  String get translationDisclaimer =>
      'Unsere Übersetzungen werden mit KI-Unterstützung erstellt. Wenn dir Fehler in deiner Sprache auffallen, freuen wir uns über dein Feedback!';

  @override
  String get privacyPromiseTitle => 'Das Datenschutzversprechen von Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Dein Glaube ist persönlich. Deine Daten bleiben es auch. Wir verkaufen, teilen oder vermarkten deine Daten niemals. Nicht deinen Standort. Nicht deine Gebetsgewohnheiten. Nicht deinen Namen.';

  @override
  String get directionToSacredHouse => 'Richtung zum Heiligen Haus';

  @override
  String towardMecca(String degrees) {
    return '$degrees° Richtung Mekka';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (Standard)';

  @override
  String get prayerHistory => 'Gebetsverlauf';

  @override
  String get currentStreak => 'Aktuelle Serie';

  @override
  String get longestStreak => 'Längste Serie';

  @override
  String get legend => 'Legende';

  @override
  String get allFivePrayers => 'Alle 5 Gebete';

  @override
  String get partialPrayers => 'Teilweise (1–4)';

  @override
  String get none => 'Keine';

  @override
  String get sun => 'So';

  @override
  String get mon => 'Mo';

  @override
  String get tue => 'Di';

  @override
  String get wed => 'Mi';

  @override
  String get thu => 'Do';

  @override
  String get fri => 'Fr';

  @override
  String get sat => 'Sa';

  @override
  String headingDegrees(String degrees) {
    return 'Richtung $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Suren konnten nicht geladen werden';

  @override
  String get connectionError =>
      'Bitte überprüfe deine Internetverbindung und versuche es erneut';

  @override
  String get alQuran => 'Al-Quran';

  @override
  String get dailySupplications => 'Tägliche Bittgebete';

  @override
  String get all => 'Alle';

  @override
  String get noDuasFound => 'Keine Duas gefunden';

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'März';

  @override
  String get april => 'April';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Dezember';

  @override
  String get home => 'Start';

  @override
  String get prayers => 'Gebete';

  @override
  String get more => 'Mehr';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Sperrbildschirm';

  @override
  String get readAndListen => 'Lesen & hören';

  @override
  String get commentary => 'Kommentar';

  @override
  String get findDirection => 'Richtung finden';

  @override
  String get reminders => 'Erinnerungen';

  @override
  String get blockDistractions => 'Ablenkungen blockieren';

  @override
  String get prayerGuard => 'Gebetswächter';

  @override
  String get importantDates => 'Wichtige Termine';

  @override
  String get comingSoon => 'Demnächst verfügbar';

  @override
  String get morningAndEvening => 'Morgen & Abend';

  @override
  String get prayer => 'Gebet';

  @override
  String get foodAndDrink => 'Essen & Trinken';

  @override
  String get verityWithHardship =>
      'Wahrlich, mit der Schwierigkeit kommt Erleichterung.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Wahrt eure Gebete sorgfältig, besonders das mittlere Gebet.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Vergangene Ereignisse';

  @override
  String get upcomingEvents => 'Kommende Ereignisse';

  @override
  String get today => 'Heute';

  @override
  String get next => 'Nächstes';

  @override
  String hijriYearLabel(int year) {
    return '$year n. H.';
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
  String get islamicMonthRajab => 'Radschab';

  @override
  String get islamicMonthShaban => 'Schaaban';

  @override
  String get islamicMonthRamadan => 'Ramadan';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qaada';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Islamisches Neujahr';

  @override
  String get ashura => 'Aschura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Ramadan beginnt';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Tag von Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Aktiv';

  @override
  String get focusModeSubtitle =>
      'Schütze deinen Fokus. Deine Apps sind blockiert, bis du die Sitzung beendest.';

  @override
  String get remaining => 'verbleibend';

  @override
  String get ready => 'bereit';

  @override
  String get duration => 'Dauer';

  @override
  String get minutesAbbreviation => 'Min';

  @override
  String get blockedDuringFocus => 'Blockiert während des Fokus';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps',
      one: '$count App',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Fokus starten';

  @override
  String get stopFocus => 'Fokus beenden';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Sitzung abgeschlossen';

  @override
  String stayedFocusedFor(String duration) {
    return 'Du warst $duration fokussiert.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Minuten',
      one: '$count Minute',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"Und sucht Hilfe in Geduld und Gebet.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Fertig';

  @override
  String get socialMedia => 'Soziale Medien';

  @override
  String get entertainment => 'Unterhaltung';

  @override
  String get games => 'Spiele';

  @override
  String get messaging => 'Nachrichten';

  @override
  String get blockDuringPrayerTimes => 'Während der Gebetszeiten blockieren';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Ausgewählte Apps werden automatisch\nwährend aller 5 täglichen Gebete blockiert.';

  @override
  String get blockedLabel => 'blockiert';

  @override
  String get blockAllApps => 'Alle Apps blockieren';

  @override
  String get blockingTimingInfo =>
      'Die Blockierung beginnt 5 Minuten vor jedem Gebet und endet 15 Minuten danach.';

  @override
  String get blockedDuringPrayers => 'Während der Gebete blockiert';

  @override
  String get notBlocked => 'Nicht blockiert';

  @override
  String get wuduStep1 => 'Absicht';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Hände waschen';

  @override
  String get wuduStep4 => 'Mund ausspülen';

  @override
  String get wuduStep5 => 'Nase reinigen';

  @override
  String get wuduStep6 => 'Gesicht waschen';

  @override
  String get wuduStep7 => 'Arme waschen';

  @override
  String get wuduStep8 => 'Kopf abwischen';

  @override
  String get wuduStep9 => 'Füße waschen';

  @override
  String get revertCorner => 'Ecke für Konvertiten';

  @override
  String get revertCornerSubtitle =>
      'Anleitungen und Unterstützung für neue Muslime';

  @override
  String get wuduGuide => 'Wudu-Anleitung';

  @override
  String get howToPray => 'Wie man betet';

  @override
  String get newMuslimChecklist => 'Checkliste für neue Muslime';

  @override
  String get islamicGlossary => 'Islamisches Glossar';

  @override
  String get whyDoWe => 'Warum tun wir...';

  @override
  String get communityStories => 'Geschichten aus der Community';

  @override
  String get wuduGuideSubtitle => 'Reinigung vor dem Gebet';

  @override
  String get howToPraySubtitle => 'Schritt-für-Schritt-Anleitung zum Salah';

  @override
  String get newMuslimChecklistSubtitle => 'Deine 30-Tage-Reise';

  @override
  String get howToPrayStep1Name => 'Zuerst Wudu';

  @override
  String get howToPrayStep1Instruction =>
      'Verrichte das Wudu (die rituelle Waschung), damit du dich vor dem Gebet im Zustand der Reinheit befindest.';

  @override
  String get howToPrayStep1Tip =>
      'Wenn du dir unsicher bist, öffne zuerst die Wudu-Anleitung im Bereich für neue Muslime.';

  @override
  String get howToPrayStep2Name => 'In Richtung Qibla stehen';

  @override
  String get howToPrayStep2Instruction =>
      'Stelle dich auf deinen Gebetsteppich, mit dem Gesicht zur Qibla – der Richtung der Kaaba in Mekka. Nutze den Qibla-Kompass in der App, um die genaue Richtung zu finden.';

  @override
  String get howToPrayStep2Tip =>
      'Es ist in Ordnung, wenn du leicht abweichst – Allah kennt deine Absicht. Gib einfach dein Bestes.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Absicht)';

  @override
  String get howToPrayStep3Instruction =>
      'Fasse in deinem Herzen die Absicht für das Gebet, das du verrichten möchtest. Du musst sie nicht laut aussprechen.';

  @override
  String get howToPrayStep3Tip =>
      'Deine Absicht ist eine Sache zwischen dir und Allah. Ein einfacher Gedanke wie \'Ich bete jetzt Fajr für Allah\' genügt.';

  @override
  String get howToPrayStep4Name => 'Takbir (Eröffnung)';

  @override
  String get howToPrayStep4Instruction =>
      'Hebe beide Hände bis zu den Ohrläppchen und sprich \'Allahu Akbar\' (Allah ist der Größte). Damit beginnt offiziell dein Gebet.';

  @override
  String get howToPrayStep4Tip =>
      'Halte deinen Blick während des gesamten Gebets nach unten, zu deinem Ort der Niederwerfung gerichtet.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Stehen)';

  @override
  String get howToPrayStep5Instruction =>
      'Lege deine rechte Hand über deine linke Hand auf deine Brust. Rezitiere Surah Al-Fatiha, gefolgt von einer weiteren kurzen Sure oder Versen, die du kennst.';

  @override
  String get howToPrayStep5Tip =>
      'Wenn du noch keine andere Sure kennst, ist es in der Lernphase ausreichend, nur Al-Fatiha zu rezitieren.';

  @override
  String get howToPrayStep6Name => 'Ruku (Verbeugung)';

  @override
  String get howToPrayStep6Instruction =>
      'Verbeuge dich, indem du dich in der Hüfte beugst, sodass dein Rücken parallel zum Boden ist. Lege deine Hände auf die Knie und sprich dreimal \'Subhana Rabbiyal Adheem\'.';

  @override
  String get howToPrayStep6Tip =>
      'Halte deinen Rücken gerade und waagerecht – nicht gewölbt oder krumm.';

  @override
  String get howToPrayStep7Name => 'Itidal (Aufrichten aus der Verbeugung)';

  @override
  String get howToPrayStep7Instruction =>
      'Richte dich aus der Verbeugung auf und stehe gerade. Sprich beim Aufrichten \'Sami Allahu liman hamidah\' (Allah hört denjenigen, der Ihn lobpreist), dann sprich \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Stehe vollständig aufrecht und halte einen Moment inne, bevor du zur nächsten Position übergehst.';

  @override
  String get howToPrayStep8Name => 'Sujud (Niederwerfung)';

  @override
  String get howToPrayStep8Instruction =>
      'Begib dich zu Boden und lege deine Stirn, Nase, beide Handflächen, Knie und Zehen auf den Boden. Sprich dreimal \'Subhana Rabbiyal A\'la\'.';

  @override
  String get howToPrayStep8Tip =>
      'Sieben Körperteile müssen den Boden berühren: Stirn (mit Nase), zwei Hände, zwei Knie und zwei Füße.';

  @override
  String get howToPrayStep9Name =>
      'Jalsa (Sitzen zwischen den Niederwerfungen)';

  @override
  String get howToPrayStep9Instruction =>
      'Setze dich aus der Niederwerfung auf, mit dem linken Fuß flach und dem rechten Fuß aufrecht. Sprich \'Allahu Akbar\', während du dich setzt. Halte kurz inne und gehe dann zur zweiten Niederwerfung über.';

  @override
  String get howToPrayStep9Tip =>
      'Dieses kurze Sitzen zwischen den beiden Niederwerfungen wird Jalsa genannt. Es ist ein verpflichtender Teil des Gebets.';

  @override
  String get howToPrayStep10Name => 'Die Rakats vervollständigen';

  @override
  String get howToPrayStep10Instruction =>
      'Nachdem du den ersten Rakat abgeschlossen hast, stehe auf und wiederhole dieselben Schritte für den zweiten Rakat. Die Anzahl der Rakats hängt davon ab, welches Gebet du verrichtest.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr hat 2 Rakats, Dhuhr 4, Asr 4, Maghrib 3 und Isha 4. Geh einen Rakat nach dem anderen an.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Letztes Sitzen)';

  @override
  String get howToPrayStep11Instruction =>
      'Rezitiere in der letzten Sitzposition den Tashahhud. Dies ist ein Glaubensbekenntnis, das du sitzend nach deinem letzten Rakat rezitierst.';

  @override
  String get howToPrayStep11Tip =>
      'Hebe während des Tashahhud deinen rechten Zeigefinger, wenn du \'Ash-hadu alla ilaha illallah\' sprichst, als Zeichen für die Einzigkeit Allahs.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Abschluss)';

  @override
  String get howToPrayStep12Instruction =>
      'Wende deinen Kopf nach rechts und sprich \'Assalamu Alaikum wa Rahmatullah\', dann wende dich nach links und wiederhole es. Damit endet dein Gebet.';

  @override
  String get howToPrayStep12Tip =>
      'Nimm dir nach dem Gebet einen Moment Zeit für eine Dua (Bittgebet) und bitte Allah um das, was du brauchst. Dies ist ein wunderschöner Moment, um dich mit Allah zu verbinden.';

  @override
  String get checklistWeek1Title => 'Woche 1';

  @override
  String get checklistWeek2Title => 'Woche 2';

  @override
  String get checklistWeek3Title => 'Woche 3';

  @override
  String get checklistWeek4Title => 'Woche 4';

  @override
  String get checklistWeek1Item1 => 'Die Schahada sprechen';

  @override
  String get checklistWeek1Item2 => 'Wudu lernen';

  @override
  String get checklistWeek1Item3 => 'Al-Fatiha lernen';

  @override
  String get checklistWeek1Item4 => 'Das erste Fajr-Gebet verrichten';

  @override
  String get checklistWeek1Item5 => 'Einen Gebetsteppich besorgen';

  @override
  String get checklistWeek1Item6 => 'Eine Moschee in der Nähe finden';

  @override
  String get checklistWeek2Item1 => 'Alle 5 Gebetszeiten lernen';

  @override
  String get checklistWeek2Item2 => 'Grundlegende Duas lernen';

  @override
  String get checklistWeek2Item3 => 'Über den Propheten Muhammad lesen';

  @override
  String get checklistWeek2Item4 =>
      'Mit der muslimischen Gemeinschaft in Kontakt treten';

  @override
  String get checklistWeek3Item1 => 'Mehr über halal Essen erfahren';

  @override
  String get checklistWeek3Item2 => 'Surah Al-Ikhlas lesen';

  @override
  String get checklistWeek3Item3 => 'Mehr über Ramadan erfahren';

  @override
  String get checklistWeek3Item4 => 'Mit täglichem Dhikr beginnen';

  @override
  String get checklistWeek4Item1 => 'Mehr über Zakat erfahren';

  @override
  String get checklistWeek4Item2 => 'Über die 5 Säulen lesen';

  @override
  String get checklistWeek4Item3 => 'Gebetsbenachrichtigungen einrichten';

  @override
  String get checklistWeek4Item4 => 'Über deine Reise nachdenken';

  @override
  String get wuduStep1Instruction =>
      'Fasse in deinem Herzen die Absicht, das Wudu um Allahs willen zu verrichten.';

  @override
  String get wuduStep1Tip =>
      'Du musst es nicht laut aussprechen – eine aufrichtige Absicht im Herzen genügt.';

  @override
  String get wuduStep2Instruction =>
      'Sprich Bismillah (Im Namen Allahs), bevor du beginnst.';

  @override
  String get wuduStep2Tip =>
      'Bismillah zu sagen ist Sunnah und beginnt dein Wudu mit dem Gedenken an Allah.';

  @override
  String get wuduStep3Instruction =>
      'Wasche beide Hände dreimal bis zu den Handgelenken und achte darauf, dass das Wasser zwischen die Finger gelangt.';

  @override
  String get wuduStep3Tip =>
      'Beginne mit der rechten Hand, dann die linke. Diese Reihenfolge wird im Islam empfohlen.';

  @override
  String get wuduStep4Instruction =>
      'Nimm Wasser in den Mund, spüle es und spucke es aus. Wiederhole dies dreimal.';

  @override
  String get wuduStep4Tip =>
      'Dies reinigt den Mund und ist Teil des Reinigungsvorgangs.';

  @override
  String get wuduStep5Instruction =>
      'Ziehe Wasser sanft in die Nase und blase es wieder aus. Wiederhole dies dreimal.';

  @override
  String get wuduStep5Tip =>
      'Benutze deine rechte Hand, um Wasser einzuziehen, und deine linke Hand, um es auszublasen.';

  @override
  String get wuduStep6Instruction =>
      'Wasche dein gesamtes Gesicht dreimal, vom Haaransatz bis zum Kinn und von Ohr zu Ohr.';

  @override
  String get wuduStep6Tip =>
      'Achte darauf, dass kein Teil deines Gesichts trocken bleibt.';

  @override
  String get wuduStep7Instruction =>
      'Wasche deinen rechten Arm dreimal von den Fingerspitzen bis zum Ellbogen, dann wiederhole dies mit dem linken Arm.';

  @override
  String get wuduStep7Tip =>
      'Beginne beim Wudu immer mit der rechten Seite, bevor du zur linken übergehst.';

  @override
  String get wuduStep8Instruction =>
      'Befeuchte deine Hände und wische einmal über deinen gesamten Kopf, von vorne nach hinten und wieder zurück.';

  @override
  String get wuduStep8Tip =>
      'Im Gegensatz zum Waschen wird der Kopf nur einmal abgewischt.';

  @override
  String get wuduStep9Instruction =>
      'Wasche deinen rechten Fuß dreimal einschließlich des Knöchels, dann wiederhole dies mit dem linken Fuß.';

  @override
  String get wuduStep9Tip =>
      'Achte darauf, dass das Wasser zwischen die Zehen gelangt. Benutze deinen Finger, um dazwischen zu reinigen.';

  @override
  String get islamicGlossaryTitle => 'Islamisches Glossar';

  @override
  String get islamicGlossarySubtitle =>
      '51 Begriffe aus Koran, Sunnah und klassischer Gelehrsamkeit';

  @override
  String get searchTermsHint => 'Begriffe, Arabisch, Definitionen suchen...';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryPillar => 'Säule';

  @override
  String get categoryAqeedah => 'Aqida';

  @override
  String get categoryPractice => 'Praxis';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Koran';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Geschichte';

  @override
  String get noTermsFound => 'Keine Begriffe gefunden';

  @override
  String get sourceLabel => 'Quelle';

  @override
  String get revertCornerHubSubtitle =>
      'Eine sanfte Anlaufstelle für deine ersten Schritte als neuer Muslim';

  @override
  String get islamicGlossaryHubSubtitle => 'Häufige Begriffe einfach erklärt';

  @override
  String get whyDoWeHubSubtitle => 'Die Weisheit hinter alltäglichen Praktiken';

  @override
  String get communityStoriesHubSubtitle =>
      'Konvertiten teilen ihren Weg zum Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'Die Weisheit hinter 12 alltäglichen islamischen Praktiken';

  @override
  String get whyDoWeSourceBadge => 'Sunnitische Quelle';

  @override
  String get whyDoWeQ1 => 'Warum beten wir 5 Mal am Tag?';

  @override
  String get whyDoWeA1 =>
      'Allah gebot die fünf täglichen Gebete im Koran (2:238), und sie wurden während der Nachtreise (Isra wal Miraj) eingesetzt. Der Prophet ﷺ sagte: „Das Erste, wonach der Diener am Tag des Gerichts gefragt wird, ist das Gebet.“ (Ibn Majah). Das Gebet hält uns den ganzen Tag über mit Allah verbunden.';

  @override
  String get whyDoWeQ2 => 'Warum wenden wir uns beim Gebet nach Mekka?';

  @override
  String get whyDoWeA2 =>
      'Allah gebot im Koran (2:144): „Wende dein Gesicht zur Heiligen Moschee.“ Die Kaaba in Mekka ist das erste Haus, das zur Anbetung Allahs errichtet wurde (3:96). Sich in dieselbe Richtung zu wenden, vereint alle Muslime weltweit im Gebet.';

  @override
  String get whyDoWeQ3 => 'Warum fasten wir im Ramadan?';

  @override
  String get whyDoWeA3 =>
      'Allah gebot das Fasten im Koran (2:183): „O ihr, die ihr glaubt, das Fasten ist euch vorgeschrieben, wie es denen vor euch vorgeschrieben war, auf dass ihr gottesfürchtig werdet.“ Der Ramadan ist der Monat, in dem der Koran herabgesandt wurde (2:185).';

  @override
  String get whyDoWeQ4 => 'Warum sagen wir Bismillah vor dem Essen?';

  @override
  String get whyDoWeA4 =>
      'Der Prophet ﷺ sagte: „Wenn jemand von euch isst, soll er den Namen Allahs erwähnen. Wenn er es zu Beginn vergisst, soll er sagen: Bismillah am Anfang und am Ende.“ (Abu Dawud). Es erinnert uns daran, dass alle Segnungen von Allah kommen.';

  @override
  String get whyDoWeQ5 =>
      'Warum ziehen wir die Schuhe aus, bevor wir eine Moschee betreten?';

  @override
  String get whyDoWeA5 =>
      'Allah gebot Musa: „Zieh deine Sandalen aus, denn du befindest dich im heiligen Tal von Tuwa.“ (Koran 20:12). Das Ausziehen der Schuhe zeigt Respekt vor dem Haus Allahs und hält den Gebetsort sauber.';

  @override
  String get whyDoWeQ6 => 'Warum sagen wir Assalamu Alaikum als Begrüßung?';

  @override
  String get whyDoWeA6 =>
      'Der Prophet ﷺ sagte: „Ihr werdet das Paradies nicht betreten, bis ihr glaubt, und ihr werdet nicht glauben, bis ihr einander liebt. Soll ich euch etwas zeigen, das eure Liebe zueinander stärkt? Verbreitet den Salam (Frieden) untereinander.“ (Muslim). Es ist auch eine Dua – du betest für den Frieden dieser Person.';

  @override
  String get whyDoWeQ7 => 'Warum verrichten wir die Hajj?';

  @override
  String get whyDoWeA7 =>
      'Die Hajj wurde von Allah geboten (3:97): „Die Pilgerfahrt zu diesem Haus ist eine Pflicht gegenüber Allah für jeden, der dazu in der Lage ist.“ Sie erinnert an die Prüfungen des Propheten Ibrahim ﷺ und seiner Familie und vereint Muslime aus allen Nationen in der Anbetung.';

  @override
  String get whyDoWeQ8 => 'Warum geben wir Zakat?';

  @override
  String get whyDoWeA8 =>
      'Zakat ist die dritte Säule des Islam und wird im Koran über 30 Mal zusammen mit dem Gebet geboten. Der Prophet ﷺ sagte, dass sie das Vermögen reinigt. Sie verringert Ungleichheit und erinnert die Gläubigen daran, dass aller Besitz Allah gehört.';

  @override
  String get whyDoWeQ9 => 'Warum sagen wir Alhamdulillah nach dem Niesen?';

  @override
  String get whyDoWeA9 =>
      'Der Prophet ﷺ sagte: „Wenn jemand von euch niest, soll er Alhamdulillah sagen, und sein Bruder oder Begleiter soll Yarhamukallah sagen.“ (Bukhari). Es ist ein Moment der Dankbarkeit gegenüber Allah für die Gabe der Gesundheit.';

  @override
  String get whyDoWeQ10 => 'Warum tragen muslimische Frauen den Hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah gebot im Koran (24:31), dass gläubige Frauen ihre Sittsamkeit wahren sollen. Der Hijab ist ein Akt der Anbetung und des Gehorsams gegenüber Allah. Viele muslimische Frauen tragen ihn als Quelle von Identität, Würde und spiritueller Verbindung.';

  @override
  String get whyDoWeQ11 => 'Warum meiden wir Schweinefleisch und Alkohol?';

  @override
  String get whyDoWeA11 =>
      'Allah verbot Schweinefleisch im Koran (2:173) und Alkohol in (5:90) und nannte ihn „ein Gräuel aus dem Werk Satans“. Diese Verbote schützen die Gesundheit, den Verstand und die Familie. Halal-Richtlinien helfen den Gläubigen, körperliche und geistige Reinheit zu bewahren.';

  @override
  String get whyDoWeQ12 => 'Warum sagen wir Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah gebietet im Koran (18:23-24): „Sage niemals über etwas: Ich werde das morgen tun, ohne hinzuzufügen: So Allah will.“ Inshallah zu sagen erkennt an, dass nur Allah die Zukunft lenkt, und hält uns demütig.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Echte Wege zum Islam aus aller Welt';

  @override
  String get communityStoriesTimeLabel => 'Zeit als Muslim';

  @override
  String get communityStoriesShareBtn => 'Teile deine Geschichte';

  @override
  String get communityStoriesShareSoon =>
      'Demnächst verfügbar — diese Funktion ist auf dem Weg!';

  @override
  String get communityStory1Name => 'Aisha (vormals Sarah)';

  @override
  String get communityStory1Location => 'Texas, USA';

  @override
  String get communityStory1Time => '2 Jahre';

  @override
  String get communityStory1Text =>
      'Ich bin auf den Islam gestoßen, während ich für eine Studienarbeit recherchiert habe. Ich erwartete, das zu finden, was die Medien mir erzählt hatten. Stattdessen fand ich Frieden, Logik und einen Gott, der wirklich Sinn ergab. Sechs Monate später sprach ich meine Schahada. Der schwierigste Teil war nicht das Beten zu lernen – es war, es meiner Familie zu sagen. Aber Alhamdulillah, zwei Jahre später stellt mir meine Mutter selbst Fragen über den Islam.';

  @override
  String get communityStory2Name => 'Yusuf (vormals James)';

  @override
  String get communityStory2Location => 'London, Vereinigtes Königreich';

  @override
  String get communityStory2Time => '4 Jahre';

  @override
  String get communityStory2Text =>
      'Ich konvertierte nach jahrelanger Suche. Christentum, Buddhismus, Atheismus – nichts füllte die Leere. Ein muslimischer Kollege lud mich zum Freitagsgebet ein. Ich saß ganz hinten und weinte die ganze Zeit. Ich wusste nicht einmal, warum. Eine Woche später sprach ich meine Schahada. Die Gemeinschaft umgab mich wie eine Familie, von der ich nie wusste, dass ich sie brauchte.';

  @override
  String get communityStory3Name => 'Maryam (vormals Maria)';

  @override
  String get communityStory3Location => 'Mexiko-Stadt, Mexiko';

  @override
  String get communityStory3Time => '1 Jahr';

  @override
  String get communityStory3Text =>
      'Latina und Muslima zu sein fühlt sich an wie eine Superkraft. Ich entdeckte den Islam durch ein YouTube-Video um 2 Uhr nachts. Ich schaute stundenlang. Das Konzept des Tawhid – dass Gott einer ist, ohne Partner, ohne Abbilder – berührte mich zutiefst. Meine spanischsprachigen Schwestern in der Moschee gaben mir sofort das Gefühl, zu Hause zu sein.';

  @override
  String get communityStory4Name => 'Ibrahim (vormals David)';

  @override
  String get communityStory4Location => 'Toronto, Kanada';

  @override
  String get communityStory4Time => '6 Jahre';

  @override
  String get communityStory4Text =>
      'Ich war der Sohn eines Pastors. Ich hatte Fragen zur Dreifaltigkeit, die niemand beantworten konnte. Als ich den Koran zum ersten Mal las, hatte ich das Gefühl, etwas zu lesen, das ich bereits glaubte. Ich sprach meine Schahada zunächst leise, allein, und dann noch einmal in der Moschee. Die beste Entscheidung meines Lebens.';

  @override
  String get communityStory5Name => 'Fatima (vormals Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australien';

  @override
  String get communityStory5Time => '3 Jahre';

  @override
  String get communityStory5Text =>
      'Meine Reise begann mit einem Hijab. Ich trug ihn zunächst aus einer Mutprobe heraus und fühlte mich... beschützt. Ich fing an, über den Islam zu lesen, und konnte nicht mehr aufhören. Innerhalb von drei Monaten hatte ich meine Schahada gesprochen. Die Leute fragen mich, worauf ich verzichtet habe. Ich sage ihnen, ich habe die Leere aufgegeben.';

  @override
  String get communityStory6Name => 'Omar (vormals Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Südafrika';

  @override
  String get communityStory6Time => '5 Jahre';

  @override
  String get communityStory6Text =>
      'Ich wuchs in einem schwierigen Viertel auf. Der Islam gab mir Disziplin, Sinn und Brüderlichkeit. Beim ersten Sujud öffnete sich etwas in mir – im besten Sinne. Ich weinte und konnte nicht erklären, warum. Heute begleite ich andere junge Männer auf ihrem Weg zum Deen.';

  @override
  String get inspiredByRealStories =>
      'Inspiriert von echten Geschichten von Konvertiten';

  @override
  String get storyFormTitle => 'Teile deine Geschichte';

  @override
  String get storyFormNameLabel => 'Dein Name';

  @override
  String get storyFormNameHint => 'Name oder schreibe \'Anonym\'';

  @override
  String get storyFormCountryLabel => 'Land';

  @override
  String get storyFormCountryHint => 'Woher kommst du?';

  @override
  String get storyFormTimeLabel => 'Zeit als Muslim';

  @override
  String get storyFormTimeHint => 'z. B. 2 Jahre, 6 Monate';

  @override
  String get storyFormStoryLabel => 'Deine Geschichte';

  @override
  String get storyFormStoryHint => 'Teile deinen Weg zum Islam...';

  @override
  String get storyFormSubmitBtn => 'Geschichte einsenden';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Deine Geschichte wurde empfangen. Wir prüfen alle Einsendungen vor der Veröffentlichung.';

  @override
  String get storyFormRequiredError => 'Bitte fülle alle Felder aus';

  @override
  String get subtitleYourGuideToIslam => 'Dein Wegweiser zum Islam';

  @override
  String get beginnerMode => 'Anfängermodus';

  @override
  String get beginnerModeSubtitle =>
      'Zusätzliche Tipps und Hilfestellungen für neue Muslime';

  @override
  String get beginnerModeOn =>
      'Der Anfängermodus ist aktiviert — zusätzliche Tipps werden in der gesamten App angezeigt';

  @override
  String get beginnerModePrayersTip =>
      'Tipp: Tippe auf ein Gebet, um mehr darüber zu erfahren und die Sunnah-Gebete zu sehen';

  @override
  String get tafsirSubtitle => 'Koranexegese';

  @override
  String get tafsirComingSoon => 'Tafsir für diese Sure ist bald verfügbar';

  @override
  String get tafsirNotAvailable => 'Tafsir nicht verfügbar';

  @override
  String get scholarSource => 'Quelle';

  @override
  String get asbabAlNuzul => 'Anlass der Offenbarung';

  @override
  String get transliteration => 'Transliteration';

  @override
  String get selectReciter => 'Rezitator auswählen';

  @override
  String get playVerse => 'Vers abspielen';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'Die 99 schönen Namen Allahs';

  @override
  String get asmaHadith =>
      'Allah hat 99 Namen. Wer sie auswendig lernt, wird ins Paradies eingehen.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Namen suchen...';

  @override
  String get asmaNoResults => 'Keine Namen gefunden';

  @override
  String get asmaSignificance => 'Bedeutung';

  @override
  String get asmaUlHusnaTile => '99 Namen';

  @override
  String get asmaUlHusnaTileSubtitle => 'Namen Allahs';

  @override
  String get onboardingTagline => 'Schütze deine Zeit. Ehre deine Gebete.';

  @override
  String get onboardingChooseLanguage => 'Wähle deine Sprache';

  @override
  String get onboardingGetStarted => 'Los geht\'s';

  @override
  String get onboardingLocationTitle => 'Genaue Gebetszeiten';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard benötigt deinen Standort, um genaue Gebetszeiten für deine Stadt zu berechnen. Dein Standort wird niemals gespeichert oder weitergegeben.';

  @override
  String get onboardingPrivacyBanner =>
      'Dein Glaube ist persönlich. Deine Daten bleiben es auch.';

  @override
  String get onboardingAllowLocation => 'Standort erlauben';

  @override
  String get onboardingSkipForNow => 'Vorerst überspringen';

  @override
  String get onboardingNotificationTitle => 'Verpasse nie wieder ein Gebet';

  @override
  String get onboardingNotificationDesc =>
      'Lass dich zu jeder Gebetszeit mit einem schönen Adhan benachrichtigen. Passe Töne und Zeiten in den Einstellungen an.';

  @override
  String get onboardingAdhanAlerts => 'Adhan-Benachrichtigungen';

  @override
  String get onboardingCustomTiming => 'Individuelle Zeiten';

  @override
  String get onboardingAdjustable => 'Anpassbar';

  @override
  String get onboardingEnableNotifications => 'Benachrichtigungen aktivieren';

  @override
  String get onboardingMaybeLater => 'Vielleicht später';

  @override
  String get onboardingAllSetTitle => 'Alles bereit!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard ist bereit, deine Zeit zu schützen\nund deinen Tag mit Achtsamkeit zu begleiten.';

  @override
  String get onboardingPrayerTimesLabel => 'Gebetszeiten';

  @override
  String get onboardingPrayerTimesDesc => 'Genaue Zeiten für deine Stadt';

  @override
  String get onboardingLockScreenLabel => 'Islamischer Sperrbildschirm';

  @override
  String get onboardingLockScreenDesc => 'Koran und Duas bei jedem Entsperren';

  @override
  String get onboardingPrayerGuardLabel => 'Gebetswächter';

  @override
  String get onboardingPrayerGuardDesc =>
      'Apps werden während des Salah automatisch blockiert';

  @override
  String get onboardingEnterApp => 'Noor Guard öffnen';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'Der Gebetsruf';

  @override
  String get adhanDescription =>
      'Der Adhan ist der islamische Gebetsruf, der fünfmal täglich verkündet wird, um die Gläubigen zum Gebet einzuladen.';

  @override
  String get makkahStyle => 'Mekka';

  @override
  String get madinahStyle => 'Medina';

  @override
  String get egyptianStyle => 'Ägyptisch';

  @override
  String get adhanPlaying => 'Wird jetzt abgespielt';

  @override
  String get makkahDescription =>
      'Der traditionelle Gebetsruf aus der Großen Moschee in Mekka.';

  @override
  String get madinahDescription =>
      'Eine ruhige Darbietung im Stil der Prophetenmoschee in Medina.';

  @override
  String get egyptianDescription =>
      'Ein melodischer Adhan im ägyptischen Stil, bekannt für seinen ausdrucksstarken Vortrag.';

  @override
  String get adhanCallToWorship => 'Der Gebetsruf';

  @override
  String get adhanDescriptionFull =>
      'Der Adhan ist der islamische Gebetsruf, der fünfmal täglich verkündet wird, um die Gläubigen zum Gebet einzuladen.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Türkisch';

  @override
  String get pakistaniStyle => 'Pakistanisch';

  @override
  String get indonesianStyle => 'Indonesisch';

  @override
  String get alafasyDescription =>
      'Eine gefühlvolle Darbietung des renommierten Rezitators Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'Der Gebetsruf, der von der Al-Aqsa-Moschee in Jerusalem widerhallt, der drittheiligsten Stätte des Islam.';

  @override
  String get turkishDescription =>
      'Ein traditioneller Ezan im türkischen Stil mit seinem charakteristischen melodischen Maqam.';

  @override
  String get pakistaniDescription =>
      'Ein gefühlvoller Adhan in südasiatischer Tradition, rezitiert in ganz Pakistan.';

  @override
  String get indonesianDescription =>
      'Ein melodischer Adhan im indonesischen Stil, beliebt im ganzen Archipel.';

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String weeklyProgress(int count) {
    return '$count von 35 Gebeten diese Woche';
  }

  @override
  String get bestDay => 'Bester Tag';

  @override
  String get prayerStats => 'Gebetsstatistik';

  @override
  String get completionRate => 'Abschlussrate';

  @override
  String get bestPrayer => 'Beständigstes Gebet';

  @override
  String get hardestPrayer => 'Häufigstes verpasstes Gebet';

  @override
  String totalPrayersCompleted(int count) {
    return '$count Gebete abgeschlossen';
  }

  @override
  String get last7Days => 'Letzte 7 Tage';

  @override
  String get thisMonth => 'Dieser Monat';

  @override
  String get fullDays => 'Vollständige Tage';

  @override
  String get partialDays => 'Teilweise Tage';

  @override
  String get missedDays => 'Verpasste Tage';

  @override
  String get missedPrayerBadge => 'Verpasst';

  @override
  String get makeItUp => 'Nachholen';

  @override
  String get qadaExplanation =>
      'Wenn du ein Gebet verpasst hast, kannst du es als Qada (Nachholgebet) verrichten.';

  @override
  String get noStatsYet =>
      'Markiere weiterhin deine Gebete, um deine Statistiken hier zu sehen.';

  @override
  String get notEnoughData => 'Noch nicht genug Daten';

  @override
  String get continuousPlay => 'Fortlaufend';

  @override
  String get sleepTimer => 'Schlaftimer';

  @override
  String verseCount(Object total, Object verse) {
    return 'Vers $verse von $total';
  }

  @override
  String get verseTafsir => 'Vers-Tafsir';

  @override
  String get tafsirOfTheDay => 'Tafsir des Tages';

  @override
  String get dailyInsight => 'Tägliche Einsicht';

  @override
  String get keyThemes => 'Wichtige Themen & Lektionen';

  @override
  String get readFullSurah => 'Ganze Sure lesen';

  @override
  String get surahIntroduction => 'Einführung der Sure';

  @override
  String get verses => 'Verse';

  @override
  String get loadingTafsir => 'Tafsir wird geladen...';

  @override
  String get keepAliveNotificationText => 'Gebetsbenachrichtigungen aktiv';

  @override
  String get keepAliveChannelName => 'Gebetsbenachrichtigungen';

  @override
  String get keepAliveChannelDescription =>
      'Hält Noor Guard im Hintergrund aktiv, damit Gebetsalarme nie verpasst werden.';

  @override
  String get notifSetupTitle => 'Sperrbildschirm-Benachrichtigungen aktivieren';

  @override
  String get notifSetupSubtitle =>
      'Damit du den Adhan nie verpasst — selbst wenn dein Telefon gesperrt ist. Dauert etwa eine Minute.';

  @override
  String get notifSetupSamsungBanner =>
      'Nutzt du ein Samsung Galaxy (auch Fold/Flip)? Samsung fügt zusätzliche Schalter über das normale Android hinaus hinzu — Schritt 4 und 6 unten zeigen dir genau, wo du sie findest.';

  @override
  String get notifSetupStep1Title => 'Benachrichtigungen erlauben';

  @override
  String get notifSetupStep1Description =>
      'Die grundlegende Berechtigung, die Noor Guard braucht, um dich überhaupt zu benachrichtigen.';

  @override
  String get notifSetupStep1Action => 'Benachrichtigungen erlauben';

  @override
  String get notifSetupStep2Title => 'Wecker & Erinnerungen';

  @override
  String get notifSetupStep2Description =>
      'Lässt Gebetsalarme genau zur Gebetszeit auslösen, selbst wenn dein Telefon im Ruhezustand oder Energiesparmodus ist.';

  @override
  String get notifSetupStep2Action => 'Alarmeinstellungen öffnen';

  @override
  String get notifSetupStep3Title => 'Über anderen Apps anzeigen';

  @override
  String get notifSetupStep3Description =>
      'Lässt den vollen Gebetsbildschirm über dem Sperrbildschirm und allem anderen Geöffneten erscheinen.';

  @override
  String get notifSetupStep3Action => 'Einstellungen öffnen';

  @override
  String get notifSetupStep4Title =>
      'Als Pop-up / Vollbild-Benachrichtigung anzeigen';

  @override
  String get notifSetupStep4Description =>
      'Lässt den Adhan-Bildschirm den Sperrbildschirm durchbrechen, statt ein stiller Banner zu bleiben.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Auf Samsung Galaxy-Geräten (auch Fold/Flip): Öffne Einstellungen → tippe auf „Prayer Time Alarm“, aktiviere dann „Pop-up notification“ (auf Fold/Flip „Cover screen pop-up“ genannt). Das ist ein reiner Samsung-Schalter — erst seine Aktivierung legt den Adhan-Bildschirm wirklich über den Sperrbildschirm.';

  @override
  String get notifSetupStep4Action => 'Benachrichtigungseinstellungen öffnen';

  @override
  String get notifSetupStep5Title => 'Benachrichtigungen zuverlässig halten';

  @override
  String get notifSetupStep5Description =>
      'Verhindert, dass Android Noor Guard im Hintergrund verlangsamt oder verzögert, damit Gebetsalarme und Erinnerungen immer pünktlich ankommen.';

  @override
  String get notifSetupStep5Action => 'Akku-Optimierung deaktivieren';

  @override
  String get notifSetupStep6Title => 'Nie schlafende Apps';

  @override
  String get notifSetupStep6Description =>
      'Samsungs Akku-Manager kann Noor Guard schlafen legen und Gebetsalarme stillschweigend blockieren. Die Aufnahme in „Never sleeping apps“ verhindert das.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Einstellungen → Akku und Gerätewartung → Hintergrundnutzungslimits → Never sleeping apps → „+“ tippen → Noor Guard auswählen.';

  @override
  String get notifSetupStep6Action => 'Akkueinstellungen öffnen';

  @override
  String get notifSetupStatusChecking => 'Wird geprüft…';

  @override
  String get notifSetupStatusEnabled => 'Aktiviert';

  @override
  String get notifSetupStatusNeeded => 'Erforderlich';

  @override
  String get notifSetupStatusManual => 'Manueller Schritt';

  @override
  String get notifSetupContinueButton => 'Weiter zu Noor Guard';

  @override
  String get notifSetupLaterButton => 'Das mache ich später';

  @override
  String get notifSetupDoneButton => 'Fertig';

  @override
  String get testNotificationButton => 'Testbenachrichtigung senden (10 Sek.)';

  @override
  String get testNotificationSnack =>
      'Die Testbenachrichtigung trifft in 10 Sekunden ein';

  @override
  String get testLockAlarmButton => 'Vollbild-Sperralarm testen (10 Sek.)';

  @override
  String get testLockAlarmSnack =>
      'Der Sperralarm löst in 10 Sekunden aus — sperren Sie jetzt Ihr Telefon';

  @override
  String get testAdhanForegroundButton =>
      'Adhan in der App testen (Vordergrund)';

  @override
  String get testAdhanForegroundSnack =>
      'Der vollständige Adhan wird mit einem stillen Banner abgespielt';

  @override
  String get testRequiresNotificationsOn =>
      'Aktiviere zuerst die Gebetsbenachrichtigungen, um dies zu testen';

  @override
  String get lockScreenSetupGuideButton =>
      'Einrichtungsanleitung für Sperrbildschirm-Benachrichtigungen';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Datenschutzerklärung konnte nicht geöffnet werden';

  @override
  String get couldNotOpenEmailApp => 'E-Mail-App konnte nicht geöffnet werden';

  @override
  String get blockDurationLabel => 'Blockierdauer';

  @override
  String get privacyAndTrust => 'Datenschutz & Vertrauen';

  @override
  String get noorGuardMotto =>
      '„Was nicht in eine Moschee gehört,\ngehört nicht in Noor Guard.“';

  @override
  String get openingAppStore => 'App Store wird geöffnet…';

  @override
  String get openingShareSheet => 'Freigabemenü wird geöffnet…';

  @override
  String get openingSupportEmail => 'Support-E-Mail wird geöffnet…';

  @override
  String get openingTermsOfService => 'Nutzungsbedingungen werden geöffnet…';

  @override
  String get duration30Min => '30 Min.';

  @override
  String get duration1Hour => '1 Stunde';

  @override
  String get durationPrayerWindowOnly => 'Nur Gebetszeitfenster';

  @override
  String get hoursAbbreviation => 'Std.';

  @override
  String get cancelTimerButton => 'Timer abbrechen';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get customTimerMinutesTitle => 'Benutzerdefinierter Timer (Minuten)';

  @override
  String get customTimerHint => 'z. B. 20';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get start => 'Starten';

  @override
  String get travel => 'Reisen';

  @override
  String get anxietyAndStress => 'Angst & Stress';

  @override
  String get gratitude => 'Dankbarkeit';

  @override
  String get protection => 'Schutz';

  @override
  String get family => 'Familie';

  @override
  String get forgiveness => 'Vergebung';

  @override
  String get appBlockingSetupHeadline =>
      'Schütze deine Zeit, schütze dein Gebet';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard nutzt den Bedienungshilfen-Dienst von Android nur, um zu erkennen, wann eine blockierte App während der Gebetszeit geöffnet wird. Es liest niemals deine Nachrichten, Fotos oder persönlichen Daten.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Bedienungshilfen-Zugriff erteilt';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Bedienungshilfen-Zugriff nicht erteilt';

  @override
  String get appBlockingOpenSettings => 'Bedienungshilfen-Einstellungen öffnen';

  @override
  String get appBlockingSetupNotNow => 'Jetzt nicht';

  @override
  String get appBlockingEnableToggle => 'App-Blockierung aktivieren';

  @override
  String get appBlockingModeLabel => 'Blockiermodus';

  @override
  String get appBlockingModeSoft => 'Sanft';

  @override
  String get appBlockingModeSoftDesc =>
      'Nur eine sanfte Erinnerung — Apps bleiben offen';

  @override
  String get appBlockingModeFirm => 'Fest';

  @override
  String get appBlockingModeFirmDesc =>
      'Blockiert die App, mit einer schnellen Umgehung';

  @override
  String get appBlockingModeHard => 'Streng';

  @override
  String get appBlockingModeHardDesc =>
      'Vollständige Blockierung — nur \"Ich habe gebetet\" hebt sie auf';

  @override
  String get appBlockingSelectPrayersLabel =>
      'Während dieser Gebete blockieren';

  @override
  String get appBlockingBufferBeforeLabel => 'Vor dem Gebet beginnen';

  @override
  String get appBlockingBufferAfterLabel => 'Nach dem Gebet aufheben';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count Min.';
  }

  @override
  String get appBlockingAppsTitle => 'Blockierte Apps';

  @override
  String get appBlockingSelectAppsButton => 'Apps zum Blockieren auswählen';

  @override
  String get appBlockingSearchHint => 'Installierte Apps suchen';

  @override
  String get appBlockingNoAppsSelected => 'Noch keine Apps ausgewählt';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Apps blockiert',
      one: '1 App blockiert',
      zero: 'Keine Apps blockiert',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Test';

  @override
  String get appBlockingTestDescription =>
      'Aktiviere die App-Sperre für 2 Minuten, um zu bestätigen, dass sie auf diesem Gerät funktioniert.';

  @override
  String get appBlockingTestButton => 'App-Sperre testen (2 Minuten)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'App-Sperre für 2 Minuten aktiv — versuche, eine gesperrte App zu öffnen';

  @override
  String get appBlockingPermissionNeeded =>
      'Aktiviere den Bedienungshilfen-Zugriff, um mit dem Blockieren zu beginnen';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Bildschirmzeit-Zugriff — demnächst verfügbar';

  @override
  String get appBlockingIosComingSoonBody =>
      'App-Blockierung unter iOS benötigt Apples Bildschirmzeit-Berechtigung, die wir noch einrichten. Wir informieren dich, sobald sie bereit ist.';

  @override
  String get appBlockingHeadline1 => 'Zeit zu beten';

  @override
  String get appBlockingHeadline2 => 'Schütze deine Zeit';

  @override
  String get appBlockingDefaultTitle => 'Gebetszeit';

  @override
  String get appBlockingIPrayedButton => 'Ich habe gebetet';

  @override
  String get appBlockingReadAyahsButton => '3 Ayat lesen';

  @override
  String get appBlockingEmergencyBypass => 'Notfall-Umgehung';

  @override
  String get appBlockingSkipForNow => 'Vorerst überspringen';

  @override
  String get appBlockingBypassConfirmTitle => 'Deine Serie beenden?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Eine Umgehung setzt jetzt deine Gebetsserie zurück. Bei einem echten Notfall kannst du fortfahren.';

  @override
  String get appBlockingBypassConfirmContinue => 'Trotzdem umgehen';

  @override
  String get appBlockingBypassConfirmCancel => 'Zurück';

  @override
  String get appBlockingSoftReminderTitle => 'Eine sanfte Erinnerung';

  @override
  String get appBlockingSoftReminderBody =>
      'Es ist Gebetszeit — überlege, dich kurz zurückzuziehen.';

  @override
  String get quranChallengeBannerTitle => 'Lies 3 Ayat zum Entsperren';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count von $total Ayat gelesen';
  }

  @override
  String get quranChallengeComplete => 'Gut gemacht — Apps entsperrt';

  @override
  String get focusBlockHeadline1 => 'Bleib fokussiert';

  @override
  String get focusBlockHeadline2 => 'Mach weiter';

  @override
  String get endFocusSessionButton => 'Fokus-Sitzung beenden';

  @override
  String get focusPaused => 'Pausiert für das Gebet';

  @override
  String get selectLocationTitle => 'Standort auswählen';

  @override
  String get useCurrentLocation => 'Aktuellen Standort verwenden';

  @override
  String get savedLocationsHeader => 'Gespeicherte Standorte';

  @override
  String get noSavedLocationsYet =>
      'Noch keine gespeicherten Standorte. Suche unten, um einen hinzuzufügen.';

  @override
  String get searchCityHint => 'Stadtname suchen…';

  @override
  String get addLocationTooltip => 'Standort hinzufügen';

  @override
  String get deleteLocationTooltip => 'Standort löschen';

  @override
  String get locationNotFound =>
      'Standort nicht gefunden. Versuche eine andere Suche.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Du kannst bis zu $max Standorte speichern';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Änderung konnte nicht bestätigt werden — bitte erneut versuchen';

  @override
  String get tasbihCounter => 'Tasbih-Zähler';

  @override
  String get tasbihCounterSubtitle => 'Zähle deinen Dhikr';

  @override
  String get tasbihResetButton => 'Zurücksetzen';

  @override
  String get tasbihTotalLabel => 'Gesamt';

  @override
  String get tasbihCelebrationTitle => 'Tasbih abgeschlossen!';

  @override
  String get tasbihCelebrationBody =>
      'Du hast alle 99 Dhikr vollendet. Möge Allah dein Gedenken annehmen.';

  @override
  String get tasbihStartNewSession => 'Neue Sitzung starten';

  @override
  String get tasbihUndoButton => 'Rückgängig';

  @override
  String get tasbihTapAnywhereHint =>
      'Tippe irgendwo auf den Bildschirm, um zu zählen';

  @override
  String get tasbihSoundToggleTooltip => 'Tippton';

  @override
  String get tasbihManageDhikrTooltip => 'Dhikr verwalten';

  @override
  String get tasbihStatsTooltip => 'Statistik anzeigen';

  @override
  String get tasbihDailyTotalLabel => 'Heutige Gesamtzahl';

  @override
  String get tasbihRoundsTodayLabel => 'Runden Heute';

  @override
  String get tasbihManageDhikrTitle => 'Dhikr Verwalten';

  @override
  String get tasbihAddCustomDhikrButton => 'Eigenen Dhikr Hinzufügen';

  @override
  String get tasbihDeleteDhikrTooltip => 'Löschen';

  @override
  String get tasbihBuiltInDhikrBadge => 'Integriert';

  @override
  String get tasbihCannotDeleteLastDhikr =>
      'Du brauchst mindestens einen Dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Name';

  @override
  String get tasbihDhikrNameHint => 'z. B. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arabisch (optional)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Bitte gib einen Namen ein';

  @override
  String get tasbihSaveDhikrButton => 'Speichern';

  @override
  String get tasbihStatsTitle => 'Tasbih-Statistik';

  @override
  String get tasbihAllTimeTotalLabel => 'Gesamtanzahl';

  @override
  String get tasbihNoActivityYetMessage =>
      'Beginne zu zählen, um deine Statistik hier zu sehen.';

  @override
  String get tasbihSoundPickerTitle => 'Tippton';

  @override
  String get tasbihSoundClassicClick => 'Klassischer Klick';

  @override
  String get tasbihSoundSoftChime => 'Sanfter Klang';

  @override
  String get tasbihSoundStoneTap => 'Steinklopfen';

  @override
  String get tasbihCurrentlyReciting => 'Wird Gerade Rezitiert';

  @override
  String tasbihOfTarget(int target) {
    return 'von $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Regentropfen';

  @override
  String get tasbihSoundSoftFeather => 'Sanfte Feder';

  @override
  String noAyahsFound(String query) {
    return 'Keine Verse gefunden für \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Suche auf Deutsch, Englisch oder Arabisch oder nutze einen islamischen Begriff:';

  @override
  String get loadingQuranIndex => 'Quran-Index wird geladen…';

  @override
  String get quranSearchSuggestions =>
      'Geduld, Sabr, Barmherzigkeit, Gebet, Salah, Vergebung, Tawbah, Paradies, Jannah, Wissen';

  @override
  String get heroVerse1 =>
      'Bewahrt die Gebete sorgfältig, besonders das mittlere Gebet.';

  @override
  String get heroVerse2 =>
      'Wahrlich, das Gebet ist den Gläubigen zu festgesetzten Zeiten vorgeschrieben.';

  @override
  String get heroVerse3 => 'Sucht Hilfe in Geduld und Gebet.';

  @override
  String get heroVerse4 =>
      'Gedenkt Meiner, so werde Ich eurer gedenken. Und dankt Mir und seid nicht undankbar.';

  @override
  String get heroVerse5 => 'Wer auf Allah vertraut, dem wird Er genügen.';

  @override
  String get heroVerse6 =>
      'Wahrlich, das erste Haus, das für die Menschen errichtet wurde, ist jenes in Makkah – ein Segen und eine Führung für die Welten.';

  @override
  String get heroVerse7 =>
      'Wahrlich, das Gebet hält von Schamlosigkeit und Schlechtem ab, und Allahs Gedenken ist größer.';

  @override
  String get heroVerse8 =>
      'Wahrlich, im Gedenken Allahs finden die Herzen Ruhe.';

  @override
  String get heroVerse9 => 'Rufet Mich an; Ich werde euch erhören.';

  @override
  String get heroVerse10 =>
      'Wenn ihr dankbar seid, werde Ich euch gewiss mehr geben.';

  @override
  String get heroVerse11 => 'Allah belastet keine Seele über ihr Vermögen.';

  @override
  String get heroVerse12 => 'Wahrlich, Allah ist mit den Geduldigen.';

  @override
  String get heroVerse13 => 'Meine Barmherzigkeit umfasst alles.';

  @override
  String get heroVerse14 =>
      'Und tut Gutes; wahrlich, Allah liebt die Gutes Tuenden.';

  @override
  String get heroVerse15 =>
      'Dies ist das Buch, an dem kein Zweifel ist, eine Führung für die Gottesfürchtigen.';

  @override
  String get accuracyHigh => 'Hohe Genauigkeit';

  @override
  String get accuracyMedium => 'Mittlere Genauigkeit';

  @override
  String get accuracyLow => 'Niedrige Genauigkeit';

  @override
  String get accuracyCalibrating => 'Kalibrierung…';

  @override
  String get compassNeedsCalibration => 'Kompass muss kalibriert werden';

  @override
  String get compassCalibrationHint =>
      'Bewege dein Gerät langsam in Form einer 8, um die Genauigkeit zu verbessern.';

  @override
  String get spiritLevelLabel => 'Wasserwaage';

  @override
  String get spiritLevelLevelText => '✓  Eben';

  @override
  String get spiritLevelTiltText => 'Neigen zum Ausrichten';

  @override
  String get compassNorth => 'N';

  @override
  String get compassEast => 'O';

  @override
  String get compassSouth => 'S';

  @override
  String get compassWest => 'W';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'Bewahr deine Zeit. Ehre deine Gebete.';

  @override
  String get stopAdhan => 'Adhan stoppen';

  @override
  String get duasSearchEmpty =>
      'Versuche es mit einer anderen Kategorie oder einem anderen Suchbegriff.';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingWelcomeTo => 'Willkommen bei';

  @override
  String get onboardingSubtitle =>
      'Dein Begleiter auf dem schönen Weg des Islam.';

  @override
  String get onboardingLetsGetStarted => 'Loslegen';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step von $total';
  }

  @override
  String get onboardingWhatsYourName => 'Wie heißt du?';

  @override
  String get onboardingNameSubtitle =>
      'Wir möchten wissen, wie wir dich ansprechen sollen.';

  @override
  String get onboardingNameHint => 'Deinen Namen eingeben';

  @override
  String get onboardingContinue => 'Weiter';

  @override
  String get onboardingAreYouNewToIslam => 'Bist du neu im Islam?';

  @override
  String get onboardingModeSubtitle =>
      'Wir passen deine Erfahrung an deinen Weg an.';

  @override
  String get onboardingNewToIslam => 'Ich bin neu im Islam';

  @override
  String get onboardingNewToIslamDesc =>
      'Einsteigermodus mit Schritt-für-Schritt-Anleitung';

  @override
  String get onboardingFamiliarWithIslam => 'Ich kenne mich im Islam aus';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Normalmodus mit allen Funktionen';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Tag $days als Muslim';
  }

  @override
  String get beginnerEssential1 => 'Leitfaden für neue Muslime';

  @override
  String get beginnerEssential2 => 'Wudu lernen (rituelle Reinigung)';

  @override
  String get beginnerEssential3 => 'Wie man betet (Schritt für Schritt)';

  @override
  String get beginnerEssential4 => 'Sure Al-Fatiha (Die Öffnung)';

  @override
  String get beginnerEssential5 => 'Tägliche Duas (Bittgebete)';

  @override
  String get beginnerEssential6 => 'Die Schahada verstehen';

  @override
  String get beginnerEssential7 => 'Islamische Begriffe & Glossar';

  @override
  String get beginnerExploreAll => 'Alle Funktionen erkunden';

  @override
  String get beginnerExploreSubtitle =>
      'Wechsle zur vollständigen Noor Guard-Erfahrung';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Alles, was Noor Guard zu bieten hat';

  @override
  String get beginnerLearnSalah => 'Salah lernen';

  @override
  String get beginnerMayAllahGuide =>
      'Möge Allah deine Schritte leiten und deine Reise segnen.';

  @override
  String get beginnerMuslimEssentials => 'MUSLIMISCHE GRUNDLAGEN';

  @override
  String get beginnerQuote1 =>
      'Wahrlich, mit der Schwierigkeit kommt die Leichtigkeit. — Koran 94:6';

  @override
  String get beginnerQuote2 =>
      'Befolge Allahs Gebote und Er wird für dich sorgen.';

  @override
  String get beginnerQuote3 =>
      'Allah schaut auf dein Herz und deine Taten, nicht auf dein Äußeres.';

  @override
  String get beginnerQuote4 =>
      'Jeder Schritt zum Gebet ist ein Schritt zum Frieden.';

  @override
  String get beginnerQuote5 =>
      'Der Beste unter euch ist derjenige, der den Koran lernt und ihn lehrt.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Tippe, um dein Schahada-Datum festzulegen';

  @override
  String get beginnerToolboxSection => 'EINSTEIGER-WERKZEUGKASTEN';

  @override
  String get beginnerYourJourney => 'DEIN WEG';

  @override
  String get journeyMonth1Name => 'Monat 1: Das Fundament';

  @override
  String get journeyMonth2Name => 'Monat 2: Gewohnheiten aufbauen';

  @override
  String get journeyMonth3Name => 'Monat 3: Den Glauben vertiefen';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total erledigt';
  }

  @override
  String get journeyViewFull => 'Vollständige Reise anzeigen →';

  @override
  String get journeyTask2_1 => '7 Tage lang alle 5 Gebete beten';

  @override
  String get journeyTask2_2 => '10 weitere Duas lernen';

  @override
  String get journeyTask2_3 => 'Den ersten Juz des Korans lesen';

  @override
  String get journeyTask2_4 => 'Die 99 Namen Allahs lernen';

  @override
  String get journeyTask2_5 => '7 Tage täglich den Tasbih-Zähler verwenden';

  @override
  String get journeyTask2_6 => 'Die Sunnah-Gebete lernen';

  @override
  String get journeyTask2_7 => 'Deine lokale Moschee finden';

  @override
  String get journeyTask3_1 => 'Sure Al-Baqarah lesen';

  @override
  String get journeyTask3_2 => 'Über Zakat lernen';

  @override
  String get journeyTask3_3 => 'Über das Fasten (Sawm) lernen';

  @override
  String get journeyTask3_4 => '3 neue Suren auswendig lernen';

  @override
  String get journeyTask3_5 => 'Über Hadsch lernen';

  @override
  String get journeyTask3_6 => 'Den Islam mit jemandem teilen';

  @override
  String get journeyTask3_7 => 'Das islamische Glossar vervollständigen';

  @override
  String get journeyTimelineTitle => 'Meine Reise';

  @override
  String get journeyCompleted => 'Abgeschlossen';

  @override
  String get journeyInProgress => 'In Bearbeitung';

  @override
  String get journeyLocked => 'Gesperrt';

  @override
  String get wuduThreeTimes => '3 Mal';

  @override
  String get wuduDuaBefore => 'Du\'a vor dem Wudu';

  @override
  String get wuduDuaAfter => 'Du\'a nach dem Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'Im Namen Allahs';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Ich bezeuge, dass es keinen Gott außer Allah gibt, Einzig, ohne Partner, und ich bezeuge, dass Muhammad Sein Diener und Gesandter ist. O Allah, mache mich zu denen, die bereuen, und zu denen, die sich reinigen.';

  @override
  String get wuduCompleteButton => 'Ich habe das Wudu abgeschlossen';

  @override
  String get howToPrayStepOpeningDua => 'Eröffnungsgebet';

  @override
  String get howToPrayStepAlFatiha => 'Sure Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Kurze Sure';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (mittleres Sitzen)';

  @override
  String get howToPrayStepSalawat => 'Salawat auf den Propheten ﷺ';

  @override
  String get howToPrayTransTakbir => 'Allah ist der Größte';

  @override
  String get howToPrayTransOpeningDua =>
      'Gepriesen seist Du, o Allah, und mit Deinem Lob; gesegnet ist Dein Name, erhaben ist Deine Majestät, es gibt keinen Gott außer Dir.';

  @override
  String get howToPrayTransFatiha =>
      'Im Namen Allahs, des Allbarmherzigen, des Barmherzigen. Alles Lob gebührt Allah, dem Herrn der Welten. Dem Allbarmherzigen, dem Barmherzigen. Dem Herrscher am Tag des Gerichts. Dir allein dienen wir und Dich allein bitten wir um Hilfe. Führe uns den geraden Weg — den Weg derer, denen Du Gnade erwiesen hast, nicht derer, die den Zorn auf sich geladen haben, und nicht der Irregeleiteten.';

  @override
  String get howToPrayTransRuku => 'Gepriesen sei mein Herr, der Allerhöchste';

  @override
  String get howToPrayTransItidal =>
      'Allah hört denjenigen, der Ihn lobt. Unser Herr, und Dir gebührt alles Lob.';

  @override
  String get howToPrayTransSujood => 'Gepriesen sei mein Herr, der Erhabenste';

  @override
  String get howToPrayTransJalsa => 'Mein Herr, vergib mir';

  @override
  String get howToPrayTransTashahhud =>
      'Alle Grüße, Gebete und guten Taten gehören Allah. Friede sei mit dir, o Prophet, und die Barmherzigkeit Allahs und Seine Segnungen. Friede sei mit uns und mit den rechtschaffenen Dienern Allahs. Ich bezeuge, dass es keinen Gott gibt außer Allah, und ich bezeuge, dass Muhammad Sein Diener und Gesandter ist.';

  @override
  String get howToPrayTransSalawat =>
      'O Allah, sende Deine Gnade auf Muhammad und auf die Familie Muhammads, wie Du Deine Gnade auf Ibrahim und die Familie Ibrahims gesandt hast — Du bist wahrlich der Lobenswürdigste, der Glorreichste. O Allah, segne Muhammad und die Familie Muhammads, wie Du Ibrahim und die Familie Ibrahims gesegnet hast — Du bist wahrlich der Lobenswürdigste, der Glorreichste.';

  @override
  String get howToPrayTransTasleem =>
      'Friede und Allahs Barmherzigkeit seien mit euch';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Sprich dieses Gebet leise direkt nach dem Eröffnungs-Takbir. Es wird nur einmal zu Beginn des Gebets gesprochen.';

  @override
  String get howToPraySurahInstruction =>
      'Nach Al-Fatiha eine auswendig gelernte Sure rezitieren. Sure Al-Ikhlas (oben) ist ideal für Anfänger — wird nur in den ersten zwei Rak\'ahs gelesen.';

  @override
  String get howToPrayItidalInstruction =>
      'Sage \'Sami\' Allahu liman hamidah\' beim Aufrichten, dann stehe gerade und sage \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Setze dich nach der 2. Rak\'ah. Hebe den rechten Zeigefinger beim Sprechen der Schahada. Bei 3- und 4-Rak\'ah-Gebeten stehst du danach wieder auf.';

  @override
  String get howToPraySalawatInstruction =>
      'Rezitiere das Salawat direkt nach dem abschließenden Tashahhud, nur im letzten Sitzen, vor dem Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Drehe den Kopf nach rechts und sprich das Tasleem, dann nach links und wiederhole es. Dein Gebet ist nun beendet.';

  @override
  String get howToPrayOnceOpens => 'Einmal — eröffnet das Gebet';

  @override
  String get howToPrayFirstRakahOnly => 'Nur 1. Rak\'ah';

  @override
  String get howToPrayFirst2RakahsOnly => 'Nur die ersten 2 Rak\'ahs';

  @override
  String get howToPrayEveryRakah => 'Jede Rak\'ah';

  @override
  String get howToPrayAfter2ndRakah => 'Nach der 2. Rak\'ah';

  @override
  String get howToPrayFinalSittingOnly => 'Nur letztes Sitzen';

  @override
  String get howToPrayClosesThePrayer => 'Beendet das Gebet';

  @override
  String get howToPraySectionBefore => 'Vor dem Gebet';

  @override
  String get howToPraySectionRakah => 'Rak\'ah';

  @override
  String get howToPraySectionMiddleSitting => 'Mittleres Sitzen';

  @override
  String get howToPraySectionFinalSitting => 'Abschließendes Sitzen';

  @override
  String get howToPrayRakahLabel => 'Rak\'ahs';

  @override
  String get howToPrayCompleteButton => 'Ich habe mein Gebet abgeschlossen';

  @override
  String get howToPrayMashaallah => 'Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Möge Allah dein Gebet annehmen.';

  @override
  String get fatihaIntroTitle => 'Die Mutter des Qurans';

  @override
  String get fatihaIntroBody =>
      'Sure Al-Fatiha ist die bedeutendste Sure im Quran. Sie wird in jeder Gebetseinheit rezitiert — mindestens 17 Mal täglich. Sie ist ein vollständiges Gespräch zwischen dem Diener und Allah und ein Tor zu jedem Gebet.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir schreibt: \'Al-Fatiha enthält die Essenz des gesamten Qurans — es ist ein Gebet, eine Erklärung der Dienerschaft und eine Bitte um Führung auf dem geraden Weg.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'Die Schahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Ich bezeuge, dass es keine Gottheit außer Allah gibt, und ich bezeuge, dass Muhammad der Gesandte Allahs ist';

  @override
  String get shahadaWordBreakdownTitle => 'Wort für Wort';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'Es gibt kein';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'Gottheit / Gott';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'außer';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (Gott allein)';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Muḥammadun';

  @override
  String get shahadaWord5Meaning => 'Muhammad';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Rasūlu';

  @override
  String get shahadaWord6Meaning => 'Gesandter / Prophet';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'Allahs';

  @override
  String get shahadaMeaningTitle => 'Bedeutung & Wichtigkeit';

  @override
  String get shahadaMeaningBody =>
      'Die Schahada ist das Glaubensbekenntnis, das das Fundament des Islams bildet. Es ist die erste der fünf Säulen. Durch das Aussprechen dieser Worte mit aufrichtiger Überzeugung tritt eine Person in den Islam ein. Ibn Kathir erklärt, dass der erste Teil alle falschen Gottheiten verneint und die absolute Einheit Allahs bekräftigt.';

  @override
  String get shahadaMomentTitle => 'Der Moment der Schahada';

  @override
  String get shahadaMomentBody =>
      'Wenn jemand das Schahada zum ersten Mal mit wahrem Glauben im Herzen spricht, geschieht etwas Tiefgründiges — sie beginnen ein neues Leben. Der Prophet ﷺ sagte: \'Wer sagt, es gibt keinen Gott außer Allah, und an allem, was außer Ihm angebetet wird, ungläubig ist, sein Vermögen und Blut sind geschützt.\' (Sahih Muslim). Alle vergangenen Sünden werden vergeben. Willkommen im Islam.';

  @override
  String get shahadaPronunciationTitle => 'Ausspracheführer';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Schritt-für-Schritt-Anleitung';

  @override
  String get toolboxWuduSubtitle => 'Reinigung vor dem Gebet';

  @override
  String get toolboxGlossarySubtitle => '114 islamische Begriffe erklärt';
}
