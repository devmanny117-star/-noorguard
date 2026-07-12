// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Moge Allah jouw dag zegenen';

  @override
  String get nextPrayer => 'Volgend Gebed';

  @override
  String get iPrayedButton => 'Ik heb gebeden';

  @override
  String get todaysPrayers => 'Gebeden van Vandaag';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Focusmodus';

  @override
  String get appBlocking => 'App-blokkering';

  @override
  String get islamicCalendar => 'Islamitische Kalender';

  @override
  String get islamicCalendarSubtitle => 'Hijri-datums & evenementen';

  @override
  String get duas => 'Smeekbeden';

  @override
  String get quran => 'Koran';

  @override
  String get settings => 'Instellingen';

  @override
  String get complete => 'Voltooien';

  @override
  String get streak => 'Reeks';

  @override
  String get dayStreak => 'dagen op rij';

  @override
  String get compassRequiresDevice => 'Het kompas vereist een echt apparaat';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen',
      one: '$count dag',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Alle gebeden voltooid! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 gebeden voltooid';
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
    return '$count fard-rakats';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah ervoor';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah erna';
  }

  @override
  String prayedAt(String time) {
    return 'Gebedstijd: $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'de dageraad voor zonsopgang';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'nadat de zon haar hoogste punt is gepasseerd';

  @override
  String get timePeriodLateAfternoon => 'in de late namiddag';

  @override
  String get timePeriodJustAfterSunset => 'vlak na zonsondergang';

  @override
  String get timePeriodNightBeforeMidnight => 'in de nacht voor middernacht';

  @override
  String get fajrHadith =>
      'De twee rakats van Fajr zijn beter dan de wereld en alles wat erin is. — Profeet Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr is het eerste gebed van de dag. Het herinnert ons eraan om de dag te beginnen met de gedachte aan Allah.';

  @override
  String get dhuhrHadith =>
      'Wie de twaalf sunnah-rakats bidt, voor hem zal Allah een huis in het Paradijs bouwen.';

  @override
  String get dhuhrTip =>
      'Dhuhr is het middaggebed. Een perfect moment om je dag even te onderbreken en weer verbinding te maken.';

  @override
  String get asrHadith =>
      'Wie het Asr-gebed mist, is alsof hij zijn familie en bezit heeft verloren. — Profeet Muhammad ﷺ';

  @override
  String get asrTip =>
      'Asr wordt vaak het middelste gebed genoemd. Allah noemt het specifiek in de Koran (2:238).';

  @override
  String get maghribHadith => 'Het Maghrib-gebed is de Witr van de dag.';

  @override
  String get maghribTip =>
      'Maghrib markeert het einde van de vastendag in Ramadan. Het wordt gebeden net wanneer de zon ondergaat.';

  @override
  String get ishaHadith =>
      'Wie Isha in gemeenschap bidt, is alsof hij de halve nacht heeft gebeden.';

  @override
  String get ishaTip =>
      'Isha is het laatste gebed van de dag. Je dag afsluiten met gebed brengt rust en afronding.';

  @override
  String get newMuslimTip => 'Tip voor Nieuwe Moslims';

  @override
  String get notificationsOn => 'Meldingen aan';

  @override
  String get notificationsOff => 'Meldingen uit';

  @override
  String get preview => 'Voorbeeld';

  @override
  String get lockPreviewCountdown => 'Over 1u 23m  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Veeg omhoog om te ontgrendelen';

  @override
  String get searchSurahs => 'Soera\'s zoeken…';

  @override
  String get noSurahsFound => 'Geen soera\'s gevonden';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String ayahs(int count) {
    return '$count ayat';
  }

  @override
  String get searchDuas => 'Smeekbeden zoeken…';

  @override
  String supplications(int count) {
    return '$count smeekbeden';
  }

  @override
  String get prayerSettings => 'Gebedsinstellingen';

  @override
  String get calculationMethod => 'Berekeningsmethode';

  @override
  String get adhanSound => 'Adhan-geluid';

  @override
  String get prayerNotifications => 'Gebedsmeldingen';

  @override
  String get statusOn => 'Aan';

  @override
  String get statusOff => 'Uit';

  @override
  String get enableAllNotifications => 'Alle meldingen inschakelen';

  @override
  String get individualPrayers => 'Afzonderlijke Gebeden';

  @override
  String get appearance => 'Weergave';

  @override
  String get darkMode => 'Donkere Modus';

  @override
  String get language => 'Taal';

  @override
  String get aboutNoorGuard => 'Over';

  @override
  String get version => 'App-versie';

  @override
  String get rateApp => 'Beoordeel Noor Guard';

  @override
  String get shareApp => 'Deel Noor Guard';

  @override
  String get contactSupport => 'Contact met Support';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get termsOfService => 'Gebruiksvoorwaarden';

  @override
  String get helpUsImprove => 'Help Ons Verbeteren';

  @override
  String get translationDisclaimer =>
      'Onze vertalingen zijn AI-ondersteund. Als je fouten in jouw taal opmerkt, horen we graag van je!';

  @override
  String get privacyPromiseTitle => 'De Privacybelofte van Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Jouw geloof is persoonlijk. Jouw gegevens blijven dat ook. We verkopen, delen of verzilveren je gegevens nooit. Niet je locatie. Niet je gebedsgewoonten. Niet je naam.';

  @override
  String get directionToSacredHouse => 'Richting naar het Heilige Huis';

  @override
  String towardMecca(String degrees) {
    return '$degrees° richting Mekka';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (standaard)';

  @override
  String get prayerHistory => 'Gebedsgeschiedenis';

  @override
  String get currentStreak => 'Huidige Reeks';

  @override
  String get longestStreak => 'Langste Reeks';

  @override
  String get legend => 'Legenda';

  @override
  String get allFivePrayers => 'Alle 5 gebeden';

  @override
  String get partialPrayers => 'Gedeeltelijk (1–4)';

  @override
  String get none => 'Geen';

  @override
  String get sun => 'Zo';

  @override
  String get mon => 'Ma';

  @override
  String get tue => 'Di';

  @override
  String get wed => 'Wo';

  @override
  String get thu => 'Do';

  @override
  String get fri => 'Vr';

  @override
  String get sat => 'Za';

  @override
  String headingDegrees(String degrees) {
    return 'Richting $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Kan soera\'s niet laden';

  @override
  String get connectionError =>
      'Controleer je internetverbinding en probeer het opnieuw';

  @override
  String get alQuran => 'Al-Koran';

  @override
  String get dailySupplications => 'Dagelijkse Smeekbeden';

  @override
  String get all => 'Alle';

  @override
  String get noDuasFound => 'Geen smeekbeden gevonden';

  @override
  String get january => 'januari';

  @override
  String get february => 'februari';

  @override
  String get march => 'maart';

  @override
  String get april => 'april';

  @override
  String get may => 'mei';

  @override
  String get june => 'juni';

  @override
  String get july => 'juli';

  @override
  String get august => 'augustus';

  @override
  String get september => 'september';

  @override
  String get october => 'oktober';

  @override
  String get november => 'november';

  @override
  String get december => 'december';

  @override
  String get home => 'Start';

  @override
  String get prayers => 'Gebeden';

  @override
  String get more => 'Meer';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Vergrendelscherm';

  @override
  String get readAndListen => 'Lezen & luisteren';

  @override
  String get commentary => 'Toelichting';

  @override
  String get findDirection => 'Richting vinden';

  @override
  String get reminders => 'Herinneringen';

  @override
  String get blockDistractions => 'Afleiding blokkeren';

  @override
  String get prayerGuard => 'Gebedsbeschermer';

  @override
  String get importantDates => 'Belangrijke data';

  @override
  String get comingSoon => 'Binnenkort beschikbaar';

  @override
  String get morningAndEvening => 'Ochtend & Avond';

  @override
  String get prayer => 'Gebed';

  @override
  String get foodAndDrink => 'Eten & Drinken';

  @override
  String get verityWithHardship =>
      'Voorwaar, met de moeilijkheid komt verlichting.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Onderhoud nauwgezet de gebeden, vooral het middelste gebed.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Afgelopen Gebeurtenissen';

  @override
  String get upcomingEvents => 'Aankomende Gebeurtenissen';

  @override
  String get today => 'Vandaag';

  @override
  String get next => 'Volgende';

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
  String get islamicMonthRabiAlThani => 'Rabī\' Al-Thani';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumada Al-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumada Al-Thani';

  @override
  String get islamicMonthRajab => 'Rajab';

  @override
  String get islamicMonthShaban => 'Sha\'ban';

  @override
  String get islamicMonthRamadan => 'Ramadan';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qadah';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Islamitisch Nieuwjaar';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Ramadan Begint';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Dag van Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Actief';

  @override
  String get focusModeSubtitle =>
      'Bescherm je focus. Je apps blijven geblokkeerd totdat je stopt.';

  @override
  String get remaining => 'resterend';

  @override
  String get ready => 'klaar';

  @override
  String get duration => 'Duur';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Geblokkeerd tijdens Focus';

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
  String get sessionComplete => 'Sessie Voltooid';

  @override
  String stayedFocusedFor(String duration) {
    return 'Je bleef $duration gefocust.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuten',
      one: '$count minuut',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"En zoek hulp door geduld en gebed.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Klaar';

  @override
  String get socialMedia => 'Sociale Media';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get games => 'Spellen';

  @override
  String get messaging => 'Berichten';

  @override
  String get blockDuringPrayerTimes => 'Blokkeren tijdens gebedstijden';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Geselecteerde apps worden automatisch geblokkeerd\ntijdens alle 5 dagelijkse gebeden.';

  @override
  String get blockedLabel => 'geblokkeerd';

  @override
  String get blockAllApps => 'Alle apps blokkeren';

  @override
  String get blockingTimingInfo =>
      'Blokkering wordt geactiveerd 5 minuten voor elk gebed en opgeheven 15 minuten erna.';

  @override
  String get blockedDuringPrayers => 'Geblokkeerd tijdens gebeden';

  @override
  String get notBlocked => 'Niet geblokkeerd';

  @override
  String get wuduStep1 => 'Intentie';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Handen Wassen';

  @override
  String get wuduStep4 => 'Mond Spoelen';

  @override
  String get wuduStep5 => 'Neus Reinigen';

  @override
  String get wuduStep6 => 'Gezicht Wassen';

  @override
  String get wuduStep7 => 'Armen Wassen';

  @override
  String get wuduStep8 => 'Hoofd Afvegen';

  @override
  String get wuduStep9 => 'Voeten Wassen';

  @override
  String get revertCorner => 'Revert-hoek';

  @override
  String get revertCornerSubtitle => 'Gidsen en steun voor nieuwe moslims';

  @override
  String get wuduGuide => 'Wudu-gids';

  @override
  String get howToPray => 'Hoe te Bidden';

  @override
  String get newMuslimChecklist => 'Checklist voor Nieuwe Moslims';

  @override
  String get islamicGlossary => 'Islamitische Begrippenlijst';

  @override
  String get whyDoWe => 'Waarom Doen Wij...';

  @override
  String get communityStories => 'Verhalen uit de Gemeenschap';

  @override
  String get wuduGuideSubtitle => 'Reiniging voor het gebed';

  @override
  String get howToPraySubtitle => 'Stap-voor-stap salah-gids';

  @override
  String get newMuslimChecklistSubtitle => 'Jouw reis van 30 dagen';

  @override
  String get howToPrayStep1Name => 'Eerst Wudu';

  @override
  String get howToPrayStep1Instruction =>
      'Verricht de wudu (rituele wassing) zodat je in een staat van reinheid bent voordat je begint te bidden.';

  @override
  String get howToPrayStep1Tip =>
      'Als je niet zeker weet hoe, open dan eerst de Wudu-gids vanuit de Revert-hoek.';

  @override
  String get howToPrayStep2Name => 'Ga Staan, Gericht naar de Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Ga op je gebedskleed staan, gericht naar de Qibla — de richting van de Kaaba in Mekka. Gebruik het Qibla-kompas in de app om de exacte richting te vinden.';

  @override
  String get howToPrayStep2Tip =>
      'Het is oké als je er een beetje naast zit — Allah kent je intentie. Doe je best.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intentie)';

  @override
  String get howToPrayStep3Instruction =>
      'Maak in je hart de intentie voor het gebed dat je gaat verrichten. Je hoeft het niet hardop te zeggen.';

  @override
  String get howToPrayStep3Tip =>
      'Je intentie is tussen jou en Allah. Een eenvoudige gedachte zoals \'Ik bid Fajr voor Allah\' is voldoende.';

  @override
  String get howToPrayStep4Name => 'Takbir (Opening)';

  @override
  String get howToPrayStep4Instruction =>
      'Hef beide handen op tot je oorlellen en zeg \'Allahu Akbar\' (Allah is de Grootste). Hiermee begint officieel je gebed.';

  @override
  String get howToPrayStep4Tip =>
      'Houd je blik tijdens het hele gebed naar beneden gericht, naar je plek van neerknieling.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Staan)';

  @override
  String get howToPrayStep5Instruction =>
      'Leg je rechterhand over je linkerhand op je borst. Reciteer Soerat Al-Faatiha, gevolgd door een andere korte soera of verzen die je kent.';

  @override
  String get howToPrayStep5Tip =>
      'Als je nog geen andere soera kent, is het reciteren van alleen Al-Faatiha voldoende terwijl je leert.';

  @override
  String get howToPrayStep6Name => 'Ruku (Buigen)';

  @override
  String get howToPrayStep6Instruction =>
      'Buig vanuit je middel met je rug evenwijdig aan de grond. Plaats je handen op je knieën en zeg drie keer \'Subhana Rabbiyal Adheem\'.';

  @override
  String get howToPrayStep6Tip =>
      'Houd je rug recht en horizontaal — niet gebogen of rond.';

  @override
  String get howToPrayStep7Name => 'I\'tidal (Oprichten uit Buiging)';

  @override
  String get howToPrayStep7Instruction =>
      'Kom overeind uit de buiging en sta rechtop. Zeg \'Sami Allahu liman hamidah\' (Allah hoort wie Hem prijst) terwijl je opstaat, en zeg dan \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Sta volledig rechtop en blijf even stil voordat je naar de volgende positie gaat.';

  @override
  String get howToPrayStep8Name => 'Sujood (Neerknieling)';

  @override
  String get howToPrayStep8Instruction =>
      'Ga naar de grond en plaats je voorhoofd, neus, beide handpalmen, knieën en tenen op de vloer. Zeg drie keer \'Subhana Rabbiyal A\'la\'.';

  @override
  String get howToPrayStep8Tip =>
      'Zeven lichaamsdelen moeten de grond raken: voorhoofd (met neus), twee handen, twee knieën en twee voeten.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Zitten Tussen de Neerknielingen)';

  @override
  String get howToPrayStep9Instruction =>
      'Ga vanuit de neerknieling zitten met je linkervoet plat en je rechtervoet rechtop. Zeg \'Allahu Akbar\' terwijl je gaat zitten. Pauzeer kort en ga dan weer naar beneden voor de tweede neerknieling.';

  @override
  String get howToPrayStep9Tip =>
      'Dit korte zitten tussen de twee neerknielingen heet Jalsa. Het is een verplicht onderdeel van het gebed.';

  @override
  String get howToPrayStep10Name => 'Voltooi de Rakats';

  @override
  String get howToPrayStep10Instruction =>
      'Na het voltooien van de eerste rakat, sta op en herhaal dezelfde stappen voor de tweede rakat. Het aantal rakats hangt af van welk gebed je verricht.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr heeft 2 rakats, Dhuhr 4, Asr 4, Maghrib 3 en Isha 4. Doe het rakat voor rakat.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Laatste Zitting)';

  @override
  String get howToPrayStep11Instruction =>
      'Reciteer in de laatste zitpositie de Tashahhud. Dit is een geloofsverklaring die je zittend reciteert na je laatste rakat.';

  @override
  String get howToPrayStep11Tip =>
      'Tijdens de Tashahhud hef je je rechter wijsvinger op wanneer je \'Ash-hadu alla ilaha illallah\' zegt, als teken van de eenheid van Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Afsluiting)';

  @override
  String get howToPrayStep12Instruction =>
      'Draai je hoofd naar rechts en zeg \'Assalamu Alaikum wa Rahmatullah\', draai dan naar links en herhaal. Hiermee eindigt je gebed.';

  @override
  String get howToPrayStep12Tip =>
      'Neem na het gebed even de tijd om dua (smeekbede) te doen en Allah te vragen wat je nodig hebt. Dit is een prachtig moment om met Allah in verbinding te staan.';

  @override
  String get checklistWeek1Title => 'Week 1';

  @override
  String get checklistWeek2Title => 'Week 2';

  @override
  String get checklistWeek3Title => 'Week 3';

  @override
  String get checklistWeek4Title => 'Week 4';

  @override
  String get checklistWeek1Item1 => 'Spreek de Shahada uit';

  @override
  String get checklistWeek1Item2 => 'Leer de Wudu';

  @override
  String get checklistWeek1Item3 => 'Leer Al-Faatiha';

  @override
  String get checklistWeek1Item4 => 'Bid je eerste Fajr';

  @override
  String get checklistWeek1Item5 => 'Schaf een gebedskleed aan';

  @override
  String get checklistWeek1Item6 => 'Vind een lokale moskee';

  @override
  String get checklistWeek2Item1 => 'Leer alle 5 gebedstijden';

  @override
  String get checklistWeek2Item2 => 'Leer basis-smeekbeden';

  @override
  String get checklistWeek2Item3 => 'Lees over de Profeet Muhammad';

  @override
  String get checklistWeek2Item4 => 'Maak contact met de moslimgemeenschap';

  @override
  String get checklistWeek3Item1 => 'Leer over halal voedsel';

  @override
  String get checklistWeek3Item2 => 'Lees Soerat Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Leer over Ramadan';

  @override
  String get checklistWeek3Item4 => 'Begin met dagelijkse dhikr';

  @override
  String get checklistWeek4Item1 => 'Leer over Zakat';

  @override
  String get checklistWeek4Item2 => 'Lees over de 5 zuilen';

  @override
  String get checklistWeek4Item3 => 'Stel gebedsmeldingen in';

  @override
  String get checklistWeek4Item4 => 'Sta stil bij je reis';

  @override
  String get wuduStep1Instruction =>
      'Maak in je hart de intentie om wudu te verrichten omwille van Allah.';

  @override
  String get wuduStep1Tip =>
      'Je hoeft het niet hardop te zeggen — een oprechte intentie in het hart is voldoende.';

  @override
  String get wuduStep2Instruction =>
      'Zeg Bismillah (In de naam van Allah) voordat je begint.';

  @override
  String get wuduStep2Tip =>
      'Bismillah zeggen is sunnah en begint je wudu met de gedachte aan Allah.';

  @override
  String get wuduStep3Instruction =>
      'Was beide handen drie keer tot aan de polsen en zorg dat het water tussen de vingers komt.';

  @override
  String get wuduStep3Tip =>
      'Begin met de rechterhand, dan de linker. Deze volgorde wordt aanbevolen in de islam.';

  @override
  String get wuduStep4Instruction =>
      'Neem water in je mond, spoel het rond en spuug het uit. Doe dit drie keer.';

  @override
  String get wuduStep4Tip =>
      'Dit reinigt de mond en is onderdeel van het reinigingsproces.';

  @override
  String get wuduStep5Instruction =>
      'Snuif water op in je neusgaten en blaas het zachtjes uit. Doe dit drie keer.';

  @override
  String get wuduStep5Tip =>
      'Gebruik je rechterhand om het water op te snuiven en je linkerhand om het uit te blazen.';

  @override
  String get wuduStep6Instruction =>
      'Was je hele gezicht drie keer, van de haarlijn tot de kin en van oor tot oor.';

  @override
  String get wuduStep6Tip =>
      'Zorg dat geen enkel deel van je gezicht droog blijft.';

  @override
  String get wuduStep7Instruction =>
      'Was je rechterarm drie keer van je vingertoppen tot je elleboog, doe daarna hetzelfde met je linkerarm.';

  @override
  String get wuduStep7Tip =>
      'Begin in de wudu altijd met de rechterkant voor de linkerkant.';

  @override
  String get wuduStep8Instruction =>
      'Maak je handen nat en wrijf er één keer over je hele hoofd, van voor naar achter en weer terug.';

  @override
  String get wuduStep8Tip =>
      'In tegenstelling tot wassen, wordt het hoofd maar één keer afgeveegd.';

  @override
  String get wuduStep9Instruction =>
      'Was je rechtervoet drie keer tot en met de enkel, doe daarna hetzelfde met je linkervoet.';

  @override
  String get wuduStep9Tip =>
      'Zorg dat het water tussen je tenen komt. Gebruik je vinger om ertussen te reinigen.';

  @override
  String get islamicGlossaryTitle => 'Islamitische Begrippenlijst';

  @override
  String get islamicGlossarySubtitle =>
      '51 termen uit de Koran, de Sunnah en de klassieke geleerdheid';

  @override
  String get searchTermsHint => 'Zoek termen, Arabisch, definities...';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryPillar => 'Zuil';

  @override
  String get categoryAqeedah => 'Aqeedah';

  @override
  String get categoryPractice => 'Praktijk';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Koran';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Geschiedenis';

  @override
  String get noTermsFound => 'Geen termen gevonden';

  @override
  String get sourceLabel => 'Bron';

  @override
  String get revertCornerHubSubtitle =>
      'Een warme plek om je eerste stappen als nieuwe moslim te begeleiden';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Veelgebruikte termen eenvoudig uitgelegd';

  @override
  String get whyDoWeHubSubtitle => 'De wijsheid achter alledaagse praktijken';

  @override
  String get communityStoriesHubSubtitle =>
      'Reverts delen hun reis naar de islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'De wijsheid achter 12 alledaagse islamitische praktijken';

  @override
  String get whyDoWeSourceBadge => 'Soennitische Bron';

  @override
  String get whyDoWeQ1 => 'Waarom bidden we 5 keer per dag?';

  @override
  String get whyDoWeA1 =>
      'Allah gebood de vijf dagelijkse gebeden in de Koran (2:238) en ze werden ingesteld tijdens de Nachtreis (Isra wal Mi\'raj). De Profeet ﷺ zei: \"Het eerste waarover de dienaar op de Dag des Oordeels ter verantwoording wordt geroepen, is het gebed.\" (Ibn Majah). Het gebed houdt ons de hele dag verbonden met Allah.';

  @override
  String get whyDoWeQ2 => 'Waarom bidden we in de richting van Mekka?';

  @override
  String get whyDoWeA2 =>
      'Allah gebood in de Koran (2:144): \"Wend je gezicht naar de Heilige Moskee.\" De Kaaba in Mekka is het eerste huis dat gebouwd is voor de aanbidding van Allah (3:96). Door in dezelfde richting te bidden, worden alle moslims wereldwijd verenigd in het gebed.';

  @override
  String get whyDoWeQ3 => 'Waarom vasten we in Ramadan?';

  @override
  String get whyDoWeA3 =>
      'Allah gebood het vasten in de Koran (2:183): \"O jullie die geloven, het vasten is jullie voorgeschreven, zoals het was voorgeschreven aan degenen vóór jullie, opdat jullie godvrezend mogen worden.\" Ramadan is de maand waarin de Koran werd geopenbaard (2:185).';

  @override
  String get whyDoWeQ4 => 'Waarom zeggen we Bismillah voor het eten?';

  @override
  String get whyDoWeA4 =>
      'De Profeet ﷺ zei: \"Wanneer iemand van jullie eet, laat hij de naam van Allah noemen. Als hij dit aan het begin vergeet, laat hij dan zeggen: Bismillah aan het begin en aan het einde ervan.\" (Abu Dawud). Het herinnert ons eraan dat alle zegeningen van Allah komen.';

  @override
  String get whyDoWeQ5 =>
      'Waarom doen we onze schoenen uit voordat we een moskee binnengaan?';

  @override
  String get whyDoWeA5 =>
      'Allah gebood Mozes: \"Trek je sandalen uit, want jij bevindt je in de heilige vallei van Tuwa.\" (Koran 20:12). Het uitdoen van schoenen toont respect voor het huis van Allah en houdt de gebedsruimte schoon.';

  @override
  String get whyDoWeQ6 => 'Waarom zeggen we Assalamu Alaikum als groet?';

  @override
  String get whyDoWeA6 =>
      'De Profeet ﷺ zei: \"Jullie zullen het paradijs niet binnengaan totdat jullie geloven, en jullie geloven niet totdat jullie van elkaar houden. Zal ik jullie iets vertellen waardoor jullie van elkaar gaan houden? Verspreid de vrede (salam) onder elkaar.\" (Muslim). Het is ook een dua — je bidt voor vrede over die persoon.';

  @override
  String get whyDoWeQ7 => 'Waarom verrichten we de Hajj?';

  @override
  String get whyDoWeA7 =>
      'De Hajj werd door Allah geboden (3:97): \"De bedevaart naar dit Huis is een plicht jegens Allah voor wie daartoe in staat is.\" Het herdenkt de beproevingen van de Profeet Ibrahim ﷺ en zijn familie, en verenigt moslims uit alle landen in aanbidding.';

  @override
  String get whyDoWeQ8 => 'Waarom geven we Zakat?';

  @override
  String get whyDoWeA8 =>
      'Zakat is de derde zuil van de islam, meer dan 30 keer geboden in de Koran samen met het gebed. De Profeet ﷺ zei dat het bezit reinigt. Het vermindert ongelijkheid en herinnert gelovigen eraan dat bezit aan Allah toebehoort.';

  @override
  String get whyDoWeQ9 => 'Waarom zeggen we Alhamdulillah na het niezen?';

  @override
  String get whyDoWeA9 =>
      'De Profeet ﷺ zei: \"Wanneer iemand van jullie niest, laat hij Alhamdulillah zeggen, en laat zijn broeder of metgezel Yarhamukallah zeggen.\" (Bukhari). Het is een moment van dankbaarheid aan Allah voor de zegen van gezondheid.';

  @override
  String get whyDoWeQ10 => 'Waarom dragen moslimvrouwen een hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah gebood in de Koran (24:31) dat gelovige vrouwen hun eerbaarheid bewaren. De hijab is een daad van aanbidding en gehoorzaamheid aan Allah. Veel moslimvrouwen dragen hem als een bron van identiteit, waardigheid en spirituele verbondenheid.';

  @override
  String get whyDoWeQ11 => 'Waarom mijden we varkensvlees en alcohol?';

  @override
  String get whyDoWeA11 =>
      'Allah verbood varkensvlees in de Koran (2:173) en alcohol in (5:90), en noemde het \"een gruwel uit het werk van Satan.\" Deze verboden beschermen de gezondheid, het verstand en het gezin. Halal-richtlijnen helpen gelovigen om lichamelijk en geestelijk rein te blijven.';

  @override
  String get whyDoWeQ12 => 'Waarom zeggen we Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah gebiedt in de Koran (18:23-24): \"Zeg nooit over iets: Ik zal dat morgen doen, zonder eraan toe te voegen: Als Allah het wil.\" Inshallah zeggen erkent dat alleen Allah de toekomst beheerst en houdt ons nederig.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Echte reizen naar de islam van over de hele wereld';

  @override
  String get communityStoriesTimeLabel => 'Tijd als moslim';

  @override
  String get communityStoriesShareBtn => 'Deel Jouw Verhaal';

  @override
  String get communityStoriesShareSoon =>
      'Binnenkort beschikbaar — deze functie komt eraan!';

  @override
  String get communityStory1Name => 'Aisha (voorheen Sarah)';

  @override
  String get communityStory1Location => 'Texas, VS';

  @override
  String get communityStory1Time => '2 jaar';

  @override
  String get communityStory1Text =>
      'Ik kwam de islam tegen tijdens onderzoek voor een universiteitspaper. Ik verwachtte te vinden wat de media me hadden verteld. In plaats daarvan vond ik vrede, logica en een God die echt logisch was. Zes maanden later sprak ik mijn shahada uit. Het moeilijkste was niet het leren bidden — het was het vertellen aan mijn familie. Maar Alhamdulillah, twee jaar later stelt mijn moeder mij zelf vragen over de islam.';

  @override
  String get communityStory2Name => 'Yusuf (voorheen James)';

  @override
  String get communityStory2Location => 'Londen, Verenigd Koninkrijk';

  @override
  String get communityStory2Time => '4 jaar';

  @override
  String get communityStory2Text =>
      'Ik werd moslim na jaren van zoeken. Christendom, boeddhisme, atheïsme — niets vulde de leegte. Een moslimcollega nodigde me uit voor het vrijdaggebed. Ik zat achterin en huilde de hele tijd. Ik wist niet eens waarom. De week erop sprak ik mijn shahada uit. De gemeenschap omarmde me als een familie waarvan ik niet wist dat ik die nodig had.';

  @override
  String get communityStory3Name => 'Maryam (voorheen Maria)';

  @override
  String get communityStory3Location => 'Mexico-Stad, Mexico';

  @override
  String get communityStory3Time => '1 jaar';

  @override
  String get communityStory3Text =>
      'Latina en moslim zijn voelt als een superkracht. Ik vond de islam via een YouTube-video om 2 uur \'s nachts. Ik keek urenlang. Het concept van tawheed — dat God één is, geen partners heeft, geen afbeeldingen — raakte me diep. Mijn Spaanstalige zusters in de moskee lieten me me meteen thuis voelen.';

  @override
  String get communityStory4Name => 'Ibrahim (voorheen David)';

  @override
  String get communityStory4Location => 'Toronto, Canada';

  @override
  String get communityStory4Time => '6 jaar';

  @override
  String get communityStory4Text =>
      'Ik was de zoon van een dominee. Ik had vragen over de Drie-eenheid waarop niemand antwoord kon geven. Toen ik de Koran voor het eerst las, voelde het alsof ik iets las wat ik al geloofde. Ik sprak mijn shahada eerst stilletjes uit, alleen, en daarna nogmaals in de moskee. De beste beslissing van mijn leven.';

  @override
  String get communityStory5Name => 'Fatima (voorheen Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australië';

  @override
  String get communityStory5Time => '3 jaar';

  @override
  String get communityStory5Text =>
      'Mijn reis begon met een hijab. Ik zette er een op als grapje en voelde me... beschermd. Ik begon over de islam te lezen en kon niet meer stoppen. Binnen drie maanden had ik mijn shahada uitgesproken. Mensen vragen me wat ik heb opgegeven. Ik vertel ze dat ik de leegte heb opgegeven.';

  @override
  String get communityStory6Name => 'Omar (voorheen Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Zuid-Afrika';

  @override
  String get communityStory6Time => '5 jaar';

  @override
  String get communityStory6Text =>
      'Ik groeide op in een ruige buurt. De islam gaf me discipline, doel en broederschap. De eerste keer dat ik sujood maakte, brak er iets in mij open — op de beste manier. Ik huilde en kon niet uitleggen waarom. Nu begeleid ik andere jonge mannen die hun weg naar de deen vinden.';

  @override
  String get inspiredByRealStories =>
      'Geïnspireerd door echte verhalen van reverts';

  @override
  String get storyFormTitle => 'Deel Jouw Verhaal';

  @override
  String get storyFormNameLabel => 'Jouw Naam';

  @override
  String get storyFormNameHint => 'Naam, of schrijf \'Anoniem\'';

  @override
  String get storyFormCountryLabel => 'Land';

  @override
  String get storyFormCountryHint => 'Waar kom je vandaan?';

  @override
  String get storyFormTimeLabel => 'Tijd als moslim';

  @override
  String get storyFormTimeHint => 'bijv. 2 jaar, 6 maanden';

  @override
  String get storyFormStoryLabel => 'Jouw Verhaal';

  @override
  String get storyFormStoryHint => 'Deel je reis naar de islam...';

  @override
  String get storyFormSubmitBtn => 'Verhaal Versturen';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Je verhaal is ontvangen. We bekijken alle inzendingen voordat we ze publiceren.';

  @override
  String get storyFormRequiredError => 'Vul alle velden in';

  @override
  String get subtitleYourGuideToIslam => 'Jouw gids naar de islam';

  @override
  String get beginnerMode => 'Beginnermodus';

  @override
  String get beginnerModeSubtitle =>
      'Extra tips en begeleiding voor nieuwe moslims';

  @override
  String get beginnerModeOn =>
      'Beginnermodus is aan — extra tips worden in de hele app getoond';

  @override
  String get beginnerModePrayersTip =>
      'Tip: Tik op elk gebed om er meer over te leren en de sunnah-gebeden te zien';

  @override
  String get tafsirSubtitle => 'Koranische Toelichting';

  @override
  String get tafsirComingSoon =>
      'Tafsir voor deze soera komt binnenkort beschikbaar';

  @override
  String get tafsirNotAvailable => 'Tafsir niet beschikbaar';

  @override
  String get scholarSource => 'Bron';

  @override
  String get asbabAlNuzul => 'Reden van Openbaring';

  @override
  String get transliteration => 'Transliteratie';

  @override
  String get selectReciter => 'Selecteer Reciteur';

  @override
  String get playVerse => 'Vers afspelen';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'De 99 Mooie Namen van Allah';

  @override
  String get asmaHadith =>
      'Allah heeft 99 namen. Wie ze uit het hoofd leert, zal het Paradijs binnengaan.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Namen zoeken...';

  @override
  String get asmaNoResults => 'Geen namen gevonden';

  @override
  String get asmaSignificance => 'Betekenis';

  @override
  String get asmaUlHusnaTile => '99 Namen';

  @override
  String get asmaUlHusnaTileSubtitle => 'Namen van Allah';

  @override
  String get onboardingTagline => 'Bewaak je tijd. Eer je gebeden.';

  @override
  String get onboardingChooseLanguage => 'Kies je taal';

  @override
  String get onboardingGetStarted => 'Aan de Slag';

  @override
  String get onboardingLocationTitle => 'Nauwkeurige Gebedstijden';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard heeft je locatie nodig om nauwkeurige gebedstijden voor jouw stad te berekenen. Je locatie wordt nooit opgeslagen of gedeeld.';

  @override
  String get onboardingPrivacyBanner =>
      'Jouw geloof is persoonlijk. Jouw gegevens blijven dat ook.';

  @override
  String get onboardingAllowLocation => 'Locatie Toestaan';

  @override
  String get onboardingSkipForNow => 'Voorlopig overslaan';

  @override
  String get onboardingNotificationTitle => 'Mis Nooit een Gebed';

  @override
  String get onboardingNotificationDesc =>
      'Ontvang bij elke gebedstijd een melding met een prachtige adhan. Pas geluiden en timing aan in de instellingen.';

  @override
  String get onboardingAdhanAlerts => 'Adhan-meldingen';

  @override
  String get onboardingCustomTiming => 'Aangepaste timing';

  @override
  String get onboardingAdjustable => 'Instelbaar';

  @override
  String get onboardingEnableNotifications => 'Meldingen Inschakelen';

  @override
  String get onboardingMaybeLater => 'Misschien later';

  @override
  String get onboardingAllSetTitle => 'Helemaal Klaar!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard is klaar om je tijd te beschermen\nen je dag met intentie te begeleiden.';

  @override
  String get onboardingPrayerTimesLabel => 'Gebedstijden';

  @override
  String get onboardingPrayerTimesDesc => 'Nauwkeurige tijden voor jouw stad';

  @override
  String get onboardingLockScreenLabel => 'Islamitisch Vergrendelscherm';

  @override
  String get onboardingLockScreenDesc =>
      'Koran en smeekbeden bij elke ontgrendeling';

  @override
  String get onboardingPrayerGuardLabel => 'Gebedsbeschermer';

  @override
  String get onboardingPrayerGuardDesc =>
      'Apps worden automatisch geblokkeerd tijdens de salah';

  @override
  String get onboardingEnterApp => 'Open Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'De Oproep tot Gebed';

  @override
  String get adhanDescription =>
      'De Adhan is de islamitische oproep tot gebed, vijf keer per dag aangekondigd om gelovigen uit te nodigen tot aanbidding.';

  @override
  String get makkahStyle => 'Mekka';

  @override
  String get madinahStyle => 'Medina';

  @override
  String get egyptianStyle => 'Egyptisch';

  @override
  String get adhanPlaying => 'Wordt nu afgespeeld';

  @override
  String get makkahDescription =>
      'De traditionele oproep tot gebed vanuit de Grote Moskee in Mekka.';

  @override
  String get madinahDescription =>
      'Een serene uitvoering in de stijl van de Profeetmoskee in Medina.';

  @override
  String get egyptianDescription =>
      'Een melodieuze adhan in Egyptische stijl, bekend om zijn rijke recitatie.';

  @override
  String get adhanCallToWorship => 'De Oproep tot Gebed';

  @override
  String get adhanDescriptionFull =>
      'De Adhan is de islamitische oproep tot gebed, vijf keer per dag aangekondigd om gelovigen uit te nodigen tot aanbidding.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turks';

  @override
  String get pakistaniStyle => 'Pakistaans';

  @override
  String get indonesianStyle => 'Indonesisch';

  @override
  String get alafasyDescription =>
      'Een ontroerende uitvoering door de gerenommeerde voordrager Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'De oproep tot gebed die weerklinkt vanuit de Al-Aqsa-moskee in Jeruzalem, de derde heiligste plaats van de islam.';

  @override
  String get turkishDescription =>
      'Een traditionele ezan in Turkse stijl met zijn kenmerkende melodische maqam.';

  @override
  String get pakistaniDescription =>
      'Een ontroerende adhan in Zuid-Aziatische traditie, voorgedragen in heel Pakistan.';

  @override
  String get indonesianDescription =>
      'Een melodieuze adhan in Indonesische stijl, geliefd in de hele archipel.';

  @override
  String get thisWeek => 'Deze Week';

  @override
  String weeklyProgress(int count) {
    return '$count van de 35 gebeden deze week';
  }

  @override
  String get bestDay => 'Beste dag';

  @override
  String get prayerStats => 'Gebedsstatistieken';

  @override
  String get completionRate => 'Voltooiingspercentage';

  @override
  String get bestPrayer => 'Meest Consistente Gebed';

  @override
  String get hardestPrayer => 'Meest Gemiste Gebed';

  @override
  String totalPrayersCompleted(int count) {
    return '$count gebeden voltooid';
  }

  @override
  String get last7Days => 'Laatste 7 Dagen';

  @override
  String get thisMonth => 'Deze Maand';

  @override
  String get fullDays => 'Volledige dagen';

  @override
  String get partialDays => 'Gedeeltelijke dagen';

  @override
  String get missedDays => 'Gemiste dagen';

  @override
  String get missedPrayerBadge => 'Gemist';

  @override
  String get makeItUp => 'Inhalen';

  @override
  String get qadaExplanation =>
      'Als je een gebed hebt gemist, kun je het nog steeds verrichten als een Qada (inhaal)gebed.';

  @override
  String get noStatsYet =>
      'Blijf je gebeden markeren om hier je statistieken te zien.';

  @override
  String get notEnoughData => 'Nog niet genoeg gegevens';

  @override
  String get continuousPlay => 'Doorlopend';

  @override
  String get sleepTimer => 'Slaaptimer';

  @override
  String verseCount(Object total, Object verse) {
    return 'Vers $verse van $total';
  }

  @override
  String get verseTafsir => 'Vers Tafsir';

  @override
  String get tafsirOfTheDay => 'Tafsir van de dag';

  @override
  String get dailyInsight => 'Dagelijks inzicht';

  @override
  String get keyThemes => 'Belangrijke thema\'s & lessen';

  @override
  String get readFullSurah => 'Lees volledige soera';

  @override
  String get surahIntroduction => 'Introductie van de soera';

  @override
  String get verses => 'verzen';

  @override
  String get loadingTafsir => 'Tafsir laden...';

  @override
  String get keepAliveNotificationText => 'Gebedsmeldingen actief';

  @override
  String get keepAliveChannelName => 'Gebedsmeldingen';

  @override
  String get keepAliveChannelDescription =>
      'Houdt Noor Guard actief op de achtergrond, zodat gebedsalarmen nooit worden gemist.';

  @override
  String get notifSetupTitle => 'Vergrendelscherm-meldingen inschakelen';

  @override
  String get notifSetupSubtitle =>
      'Zodat je de adhan nooit mist — ook niet als je telefoon vergrendeld is. Duurt ongeveer een minuut.';

  @override
  String get notifSetupSamsungBanner =>
      'Gebruik je een Samsung Galaxy (inclusief Fold/Flip)? Samsung voegt extra schakelaars toe naast standaard Android — stap 4 en 6 hieronder laten precies zien waar je ze vindt.';

  @override
  String get notifSetupStep1Title => 'Meldingen toestaan';

  @override
  String get notifSetupStep1Description =>
      'De basismachtiging die Noor Guard nodig heeft om je überhaupt te waarschuwen.';

  @override
  String get notifSetupStep1Action => 'Meldingen toestaan';

  @override
  String get notifSetupStep2Title => 'Alarmen & herinneringen';

  @override
  String get notifSetupStep2Description =>
      'Laat gebedsalarmen precies op tijd afgaan, ook als je telefoon inactief is of in de batterijbesparingsmodus staat.';

  @override
  String get notifSetupStep2Action => 'Alarminstellingen openen';

  @override
  String get notifSetupStep3Title => 'Weergeven boven andere apps';

  @override
  String get notifSetupStep3Description =>
      'Laat het volledige gebedsscherm boven het vergrendelscherm en alles wat verder open staat verschijnen.';

  @override
  String get notifSetupStep3Action => 'Instellingen openen';

  @override
  String get notifSetupStep4Title => 'Weergeven als pop-up / volledig scherm';

  @override
  String get notifSetupStep4Description =>
      'Laat het adhan-scherm door het vergrendelscherm heen breken in plaats van een stille banner te blijven.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Op Samsung Galaxy-telefoons (inclusief Fold/Flip): open Instellingen → tik op \"Prayer Time Alarm\", schakel dan \"Pop-up notification\" in (heet \"Cover screen pop-up\" op Fold/Flip). Dit is een exclusieve Samsung-schakelaar — door deze in te schakelen verschijnt het adhan-scherm pas echt boven je vergrendelscherm.';

  @override
  String get notifSetupStep4Action => 'Meldingsinstellingen openen';

  @override
  String get notifSetupStep5Title => 'Meldingen betrouwbaar houden';

  @override
  String get notifSetupStep5Description =>
      'Voorkomt dat Android Noor Guard op de achtergrond vertraagt of uitstelt, zodat gebedsalarmen en herinneringen altijd op tijd aankomen.';

  @override
  String get notifSetupStep5Action => 'Batterijoptimalisatie uitschakelen';

  @override
  String get notifSetupStep6Title => 'Nooit-slapende apps';

  @override
  String get notifSetupStep6Description =>
      'Samsungs batterijbeheer kan Noor Guard laten slapen en gebedsalarmen stilletjes blokkeren. Door het toe te voegen aan \"Never sleeping apps\" wordt dit voorkomen.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Instellingen → Batterij en apparaatonderhoud → Achtergrondgebruikslimieten → Never sleeping apps → tik op \"+\" → selecteer Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Batterij-instellingen openen';

  @override
  String get notifSetupStatusChecking => 'Controleren…';

  @override
  String get notifSetupStatusEnabled => 'Ingeschakeld';

  @override
  String get notifSetupStatusNeeded => 'Vereist';

  @override
  String get notifSetupStatusManual => 'Handmatige stap';

  @override
  String get notifSetupContinueButton => 'Verder naar Noor Guard';

  @override
  String get notifSetupLaterButton => 'Dat doe ik later';

  @override
  String get notifSetupDoneButton => 'Klaar';

  @override
  String get testNotificationButton => 'Testmelding versturen (10 sec)';

  @override
  String get testNotificationSnack =>
      'Testmelding komt over 10 seconden binnen';

  @override
  String get testLockAlarmButton =>
      'Volledig scherm-vergrendelingsalarm testen (10 sec)';

  @override
  String get testLockAlarmSnack =>
      'Het vergrendelingsalarm gaat over 10 seconden af — vergrendel je telefoon nu';

  @override
  String get testAdhanForegroundButton => 'Adhan in de app testen (voorgrond)';

  @override
  String get testAdhanForegroundSnack =>
      'De volledige adhan wordt afgespeeld met een geluidloze banner';

  @override
  String get testRequiresNotificationsOn =>
      'Schakel eerst Gebedsmeldingen in om dit te testen';

  @override
  String get lockScreenSetupGuideButton =>
      'Installatiehandleiding voor vergrendelscherm-meldingen';

  @override
  String get couldNotOpenPrivacyPolicy => 'Kan privacybeleid niet openen';

  @override
  String get couldNotOpenEmailApp => 'Kan e-mailapp niet openen';

  @override
  String get blockDurationLabel => 'Blokkeerduur';

  @override
  String get privacyAndTrust => 'Privacy & Vertrouwen';

  @override
  String get noorGuardMotto =>
      '\"Als het niet in een moskee thuishoort,\nhoort het niet in Noor Guard.\"';

  @override
  String get openingAppStore => 'App Store wordt geopend…';

  @override
  String get openingShareSheet => 'Deelvenster wordt geopend…';

  @override
  String get openingSupportEmail => 'Support-e-mail wordt geopend…';

  @override
  String get openingTermsOfService => 'Gebruiksvoorwaarden worden geopend…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 uur';

  @override
  String get durationPrayerWindowOnly => 'Alleen gebedsvenster';

  @override
  String get hoursAbbreviation => 'uur';

  @override
  String get cancelTimerButton => 'Timer annuleren';

  @override
  String get custom => 'Aangepast';

  @override
  String get customTimerMinutesTitle => 'Aangepaste timer (minuten)';

  @override
  String get customTimerHint => 'bijv. 20';

  @override
  String get cancel => 'Annuleren';

  @override
  String get start => 'Starten';

  @override
  String get travel => 'Reizen';

  @override
  String get anxietyAndStress => 'Angst & Stress';

  @override
  String get gratitude => 'Dankbaarheid';

  @override
  String get protection => 'Bescherming';

  @override
  String get family => 'Familie';

  @override
  String get forgiveness => 'Vergeving';

  @override
  String get appBlockingSetupHeadline => 'Bewaak je tijd, bewaak je gebed';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard gebruikt de toegankelijkheidsservice van Android alleen om te merken wanneer een geblokkeerde app wordt geopend tijdens het gebed. Het leest nooit je berichten, foto\'s of persoonlijke gegevens.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Toegankelijkheidstoegang verleend';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Toegankelijkheidstoegang niet verleend';

  @override
  String get appBlockingOpenSettings => 'Toegankelijkheidsinstellingen openen';

  @override
  String get appBlockingSetupNotNow => 'Niet nu';

  @override
  String get appBlockingEnableToggle => 'App-blokkering inschakelen';

  @override
  String get appBlockingModeLabel => 'Blokkeermodus';

  @override
  String get appBlockingModeSoft => 'Zacht';

  @override
  String get appBlockingModeSoftDesc =>
      'Alleen een vriendelijke herinnering — apps blijven open';

  @override
  String get appBlockingModeFirm => 'Stevig';

  @override
  String get appBlockingModeFirmDesc =>
      'Blokkeert de app, met een snelle omleiding';

  @override
  String get appBlockingModeHard => 'Streng';

  @override
  String get appBlockingModeHardDesc =>
      'Volledige blokkering — alleen \"Ik heb gebeden\" heft het op';

  @override
  String get appBlockingSelectPrayersLabel => 'Blokkeren tijdens deze gebeden';

  @override
  String get appBlockingBufferBeforeLabel => 'Beginnen vóór het gebed';

  @override
  String get appBlockingBufferAfterLabel => 'Opheffen na het gebed';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'Geblokkeerde apps';

  @override
  String get appBlockingSelectAppsButton => 'Apps kiezen om te blokkeren';

  @override
  String get appBlockingSearchHint => 'Geïnstalleerde apps zoeken';

  @override
  String get appBlockingNoAppsSelected => 'Nog geen apps geselecteerd';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps geblokkeerd',
      one: '1 app geblokkeerd',
      zero: 'Geen apps geblokkeerd',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Testen';

  @override
  String get appBlockingTestDescription =>
      'Activeer App Blocking 2 minuten lang om te bevestigen dat het op dit apparaat werkt.';

  @override
  String get appBlockingTestButton => 'App Blocking testen (2 minuten)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'App Blocking is 2 minuten actief — probeer een geblokkeerde app te openen';

  @override
  String get appBlockingPermissionNeeded =>
      'Schakel toegankelijkheidstoegang in om te beginnen met blokkeren';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Schermtijd-toegang — binnenkort beschikbaar';

  @override
  String get appBlockingIosComingSoonBody =>
      'App-blokkering op iOS heeft Apple\'s Schermtijd-toestemming nodig, die we nog instellen. We laten het je weten zodra het klaar is.';

  @override
  String get appBlockingHeadline1 => 'Tijd om te bidden';

  @override
  String get appBlockingHeadline2 => 'Bewaak je tijd';

  @override
  String get appBlockingDefaultTitle => 'Gebedstijd';

  @override
  String get appBlockingIPrayedButton => 'Ik heb gebeden';

  @override
  String get appBlockingReadAyahsButton => 'Lees 3 ayaat';

  @override
  String get appBlockingEmergencyBypass => 'Noodomleiding';

  @override
  String get appBlockingSkipForNow => 'Voor nu overslaan';

  @override
  String get appBlockingBypassConfirmTitle => 'Je reeks beëindigen?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Nu omleiden zet je gebedsreeks terug naar nul. Bij een echte noodsituatie kun je doorgaan.';

  @override
  String get appBlockingBypassConfirmContinue => 'Toch omleiden';

  @override
  String get appBlockingBypassConfirmCancel => 'Terug';

  @override
  String get appBlockingSoftReminderTitle => 'Een vriendelijke herinnering';

  @override
  String get appBlockingSoftReminderBody =>
      'Het is tijd om te bidden — overweeg even afstand te nemen.';

  @override
  String get quranChallengeBannerTitle => 'Lees 3 ayaat om te ontgrendelen';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count van $total ayaat gelezen';
  }

  @override
  String get quranChallengeComplete => 'Goed gedaan — apps ontgrendeld';

  @override
  String get focusBlockHeadline1 => 'Blijf gefocust';

  @override
  String get focusBlockHeadline2 => 'Ga door';

  @override
  String get endFocusSessionButton => 'Focussessie beëindigen';

  @override
  String get focusPaused => 'Gepauzeerd voor het gebed';

  @override
  String get selectLocationTitle => 'Locatie selecteren';

  @override
  String get useCurrentLocation => 'Huidige locatie gebruiken';

  @override
  String get savedLocationsHeader => 'Opgeslagen locaties';

  @override
  String get noSavedLocationsYet =>
      'Nog geen opgeslagen locaties. Zoek hieronder om er een toe te voegen.';

  @override
  String get searchCityHint => 'Zoek plaatsnaam…';

  @override
  String get addLocationTooltip => 'Locatie toevoegen';

  @override
  String get deleteLocationTooltip => 'Locatie verwijderen';

  @override
  String get locationNotFound =>
      'Locatie niet gevonden. Probeer een andere zoekopdracht.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Je kunt tot $max locaties opslaan';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Wijziging kon niet worden bevestigd — probeer het opnieuw';

  @override
  String get tasbihCounter => 'Tasbih-teller';

  @override
  String get tasbihCounterSubtitle => 'Tel je dhikr';

  @override
  String get tasbihResetButton => 'Resetten';

  @override
  String get tasbihTotalLabel => 'Totaal';

  @override
  String get tasbihCelebrationTitle => 'Tasbih voltooid!';

  @override
  String get tasbihCelebrationBody =>
      'Je hebt alle 99 dhikr voltooid. Mag Allah je gedenken aanvaarden.';

  @override
  String get tasbihStartNewSession => 'Nieuwe sessie starten';

  @override
  String get tasbihUndoButton => 'Ongedaan maken';

  @override
  String get tasbihTapAnywhereHint => 'Tik ergens op het scherm om te tellen';

  @override
  String get tasbihSoundToggleTooltip => 'Tikgeluid';

  @override
  String get tasbihManageDhikrTooltip => 'Dhikr beheren';

  @override
  String get tasbihStatsTooltip => 'Statistieken bekijken';

  @override
  String get tasbihDailyTotalLabel => 'Totaal Vandaag';

  @override
  String get tasbihRoundsTodayLabel => 'Rondes Vandaag';

  @override
  String get tasbihManageDhikrTitle => 'Dhikr Beheren';

  @override
  String get tasbihAddCustomDhikrButton => 'Aangepaste Dhikr Toevoegen';

  @override
  String get tasbihDeleteDhikrTooltip => 'Verwijderen';

  @override
  String get tasbihBuiltInDhikrBadge => 'Ingebouwd';

  @override
  String get tasbihCannotDeleteLastDhikr => 'Je hebt minstens één dhikr nodig';

  @override
  String get tasbihDhikrNameLabel => 'Naam';

  @override
  String get tasbihDhikrNameHint => 'bijv. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arabisch (optioneel)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Voer een naam in';

  @override
  String get tasbihSaveDhikrButton => 'Opslaan';

  @override
  String get tasbihStatsTitle => 'Tasbih-statistieken';

  @override
  String get tasbihAllTimeTotalLabel => 'Totaal Aller Tijden';

  @override
  String get tasbihNoActivityYetMessage =>
      'Begin met tellen om je statistieken hier te zien.';

  @override
  String get tasbihSoundPickerTitle => 'Tikgeluid';

  @override
  String get tasbihSoundClassicClick => 'Klassieke Klik';

  @override
  String get tasbihSoundSoftChime => 'Zachte Chime';

  @override
  String get tasbihSoundStoneTap => 'Steentik';

  @override
  String get tasbihCurrentlyReciting => 'Nu Aan Het Reciteren';

  @override
  String tasbihOfTarget(int target) {
    return 'van $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Regendruppel';

  @override
  String get tasbihSoundSoftFeather => 'Zachte Veer';

  @override
  String noAyahsFound(String query) {
    return 'Geen verzen gevonden voor \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Zoek in het Nederlands, Engels of Arabisch, of gebruik een islamitische term:';

  @override
  String get loadingQuranIndex => 'Koran-index laden…';

  @override
  String get quranSearchSuggestions =>
      'geduld, sabr, barmhartigheid, gebed, salah, vergiffenis, tawbah, paradijs, jannah, kennis';

  @override
  String get heroVerse1 =>
      'Onderhoudt nauwgezet de gebeden, in het bijzonder het middelste gebed.';

  @override
  String get heroVerse2 =>
      'Waarlijk, het gebed is de gelovigen op vaste tijden voorgeschreven.';

  @override
  String get heroVerse3 => 'Zoekt hulp in geduld en gebed.';

  @override
  String get heroVerse4 =>
      'Gedenkt Mij dan, zodat Ik u zal gedenken. En dankt Mij en weest niet ondankbaar.';

  @override
  String get heroVerse5 =>
      'En wie op Allah vertrouwt, Hij zal hem voldoende zijn.';

  @override
  String get heroVerse6 =>
      'Waarlijk, het eerste Huis dat voor de mensen is gesteld, is dat in Makkah – gezegend en een leiding voor de werelden.';

  @override
  String get heroVerse7 =>
      'Waarlijk, het gebed weerhoudt van ontucht en het verwerpelijke, en de gedachtenis aan Allah is groter.';

  @override
  String get heroVerse8 =>
      'Weet, dat alleen in de gedachtenis aan Allah de harten rust vinden.';

  @override
  String get heroVerse9 => 'Roept Mij aan; Ik zal u verhoren.';

  @override
  String get heroVerse10 =>
      'Als jullie dankbaar zijn, zal Ik jullie zeker meer geven.';

  @override
  String get heroVerse11 => 'Allah belast geen ziel boven zijn vermogen.';

  @override
  String get heroVerse12 => 'Waarlijk, Allah is met de geduldigen.';

  @override
  String get heroVerse13 => 'Mijn barmhartigheid omvat alle dingen.';

  @override
  String get heroVerse14 =>
      'En doet het goede; waarlijk, Allah heeft de weldoeners lief.';

  @override
  String get heroVerse15 =>
      'Dit is het Boek waaraan geen twijfel is, een leidraad voor de godvrezenden.';

  @override
  String get accuracyHigh => 'Hoge nauwkeurigheid';

  @override
  String get accuracyMedium => 'Gemiddelde nauwkeurigheid';

  @override
  String get accuracyLow => 'Lage nauwkeurigheid';

  @override
  String get accuracyCalibrating => 'Kalibreren…';

  @override
  String get compassNeedsCalibration => 'Kompas moet worden gekalibreerd';

  @override
  String get compassCalibrationHint =>
      'Beweeg je telefoon langzaam in een 8-beweging om de nauwkeurigheid te verbeteren.';

  @override
  String get spiritLevelLabel => 'Waterpas';

  @override
  String get spiritLevelLevelText => '✓  Waterpas';

  @override
  String get spiritLevelTiltText => 'Kantel om te nivelleren';

  @override
  String get compassNorth => 'N';

  @override
  String get compassEast => 'O';

  @override
  String get compassSouth => 'Z';

  @override
  String get compassWest => 'W';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'Waak over je tijd. Eer je gebeden.';

  @override
  String get stopAdhan => 'Adhan stoppen';

  @override
  String get duasSearchEmpty => 'Probeer een andere categorie of zoekterm.';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingWelcomeTo => 'Welkom bij';

  @override
  String get onboardingSubtitle =>
      'Jouw metgezel op de mooie reis van de islam.';

  @override
  String get onboardingLetsGetStarted => 'Laten we beginnen';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step van $total';
  }

  @override
  String get onboardingWhatsYourName => 'Wat is jouw naam?';

  @override
  String get onboardingNameSubtitle =>
      'We horen graag hoe we je kunnen aanspreken.';

  @override
  String get onboardingNameHint => 'Vul je naam in';

  @override
  String get onboardingContinue => 'Doorgaan';

  @override
  String get onboardingAreYouNewToIslam => 'Ben jij nieuw in de islam?';

  @override
  String get onboardingModeSubtitle =>
      'We personaliseren jouw ervaring op basis van jouw reis.';

  @override
  String get onboardingNewToIslam => 'Ik ben nieuw in de islam';

  @override
  String get onboardingNewToIslamDesc =>
      'Beginnersmodus met stapsgewijze begeleiding';

  @override
  String get onboardingFamiliarWithIslam => 'Ik ben bekend met de islam';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Normale modus met alle functies';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Dag $days als moslim';
  }

  @override
  String get beginnerEssential1 => 'Gids voor nieuwe moslims';

  @override
  String get beginnerEssential2 => 'Wudu leren (rituele reiniging)';

  @override
  String get beginnerEssential3 => 'Hoe te bidden (Stap voor stap)';

  @override
  String get beginnerEssential4 => 'Surah Al-Fatiha (De Opening)';

  @override
  String get beginnerEssential5 => 'Dagelijkse Duas (Smeekbeden)';

  @override
  String get beginnerEssential6 => 'De Shahada begrijpen';

  @override
  String get beginnerEssential7 => 'Islamitische termen & woordenlijst';

  @override
  String get beginnerExploreAll => 'Alle functies verkennen';

  @override
  String get beginnerExploreSubtitle =>
      'Schakel over naar de volledige Noor Guard-ervaring';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Alles wat Noor Guard te bieden heeft';

  @override
  String get beginnerLearnSalah => 'Salah leren';

  @override
  String get beginnerMayAllahGuide =>
      'Moge Allah je stappen leiden en je reis zegenen.';

  @override
  String get beginnerMuslimEssentials => 'MOSLIM ESSENTIALS';

  @override
  String get beginnerQuote1 =>
      'Voorwaar, met moeilijkheid komt gemak. — Koran 94:6';

  @override
  String get beginnerQuote2 =>
      'Zorg voor Allah\'s geboden en Hij zal voor jou zorgen.';

  @override
  String get beginnerQuote3 =>
      'Allah kijkt naar je hart en daden, niet naar je uiterlijk.';

  @override
  String get beginnerQuote4 =>
      'Elke stap naar het gebed is een stap naar vrede.';

  @override
  String get beginnerQuote5 =>
      'De beste onder jullie leert de Koran en onderwijst hem.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Tik om je Shahada-datum in te stellen';

  @override
  String get beginnerToolboxSection => 'BEGINNERS GEREEDSCHAPSKIST';

  @override
  String get beginnerYourJourney => 'JOUW REIS';

  @override
  String get journeyMonth1Name => 'Maand 1: De Basis';

  @override
  String get journeyMonth2Name => 'Maand 2: Gewoonten opbouwen';

  @override
  String get journeyMonth3Name => 'Maand 3: Geloof verdiepen';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total gedaan';
  }

  @override
  String get journeyViewFull => 'Volledige reis bekijken →';

  @override
  String get journeyTask2_1 => '7 dagen alle 5 gebeden bidden';

  @override
  String get journeyTask2_2 => '10 meer Dua\'s leren';

  @override
  String get journeyTask2_3 => 'Eerste Juz van de Quran lezen';

  @override
  String get journeyTask2_4 => '99 Namen van Allah leren';

  @override
  String get journeyTask2_5 => '7 dagen dagelijks de Tasbih-teller gebruiken';

  @override
  String get journeyTask2_6 => 'Sunnah-gebeden leren';

  @override
  String get journeyTask2_7 => 'Jouw lokale Masjid vinden';

  @override
  String get journeyTask3_1 => 'Surah Al-Baqarah lezen';

  @override
  String get journeyTask3_2 => 'Leren over Zakat';

  @override
  String get journeyTask3_3 => 'Leren over vasten (Sawm)';

  @override
  String get journeyTask3_4 => '3 nieuwe Soera\'s memoriseren';

  @override
  String get journeyTask3_5 => 'Leren over Hajj';

  @override
  String get journeyTask3_6 => 'Islam delen met iemand';

  @override
  String get journeyTask3_7 => 'Islamitisch Woordenboek voltooien';

  @override
  String get journeyTimelineTitle => 'Mijn Reis';

  @override
  String get journeyCompleted => 'Voltooid';

  @override
  String get journeyInProgress => 'Bezig';

  @override
  String get journeyLocked => 'Vergrendeld';

  @override
  String get wuduThreeTimes => '3 keer';

  @override
  String get wuduDuaBefore => 'Du\'a vóór Wudu';

  @override
  String get wuduDuaAfter => 'Du\'a na Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'In de naam van Allah';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Ik getuig dat er geen godheid is die aanbidding verdient behalve Allah, Alleen, zonder deelgenoot, en ik getuig dat Muhammad Zijn dienaar en boodschapper is. O Allah, maak mij tot degenen die zich bekeren en degenen die zich reinigen.';

  @override
  String get wuduCompleteButton => 'Ik heb Wudu voltooid';

  @override
  String get howToPrayStepOpeningDua => 'Openingssmeekbede';

  @override
  String get howToPrayStepAlFatiha => 'Soera Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Korte soera';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (middenzit)';

  @override
  String get howToPrayStepSalawat => 'Salawat op de Profeet ﷺ';

  @override
  String get howToPrayTransTakbir => 'Allah is de Grootste';

  @override
  String get howToPrayTransOpeningDua =>
      'Glorie zij U, o Allah, en met Uw lof; gezegend is Uw naam, verheven is Uw majesteit, er is geen god dan U.';

  @override
  String get howToPrayTransFatiha =>
      'In de naam van Allah, de Barmhartige, de Genadevolle. Alle lof zij Allah, de Heer der werelden. De Barmhartige, de Genadevolle. Meester van de Dag des Oordeels. U alleen aanbidden wij en U alleen vragen wij om hulp. Leid ons op het rechte pad — het pad van degenen die U gunst hebt bewezen, niet van degenen die toorn hebben opgelopen, noch van de dwalenden.';

  @override
  String get howToPrayTransRuku => 'Glorie zij mijn Heer, de Allerhoogste';

  @override
  String get howToPrayTransItidal =>
      'Allah hoort degene die Hem prijst. Onze Heer, alle lof zij U.';

  @override
  String get howToPrayTransSujood => 'Glorie zij mijn Heer, de Verhevene';

  @override
  String get howToPrayTransJalsa => 'Mijn Heer, vergeef mij';

  @override
  String get howToPrayTransTashahhud =>
      'Alle groeten, gebeden en goede woorden behoren Allah toe. Vrede zij met u, o Profeet, en de genade van Allah en Zijn zegeningen. Vrede zij met ons en met de rechtschapen dienaren van Allah. Ik getuig dat er geen god is dan Allah, en ik getuig dat Muhammad Zijn dienaar en boodschapper is.';

  @override
  String get howToPrayTransSalawat =>
      'O Allah, schenk Uw genade aan Muhammad en de familie van Muhammad, zoals U Uw genade hebt geschonken aan Ibrahim en de familie van Ibrahim — U bent waarlijk de Meest Lofwaardige, de Meest Glorieuze. O Allah, zegen Muhammad en de familie van Muhammad, zoals U Ibrahim en de familie van Ibrahim hebt gezegend — U bent waarlijk de Meest Lofwaardige, de Meest Glorieuze.';

  @override
  String get howToPrayTransTasleem =>
      'Vrede en de genade van Allah zij met jullie';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Reciteer dit zachtjes direct na de openingstakbir. Het wordt slechts eenmaal uitgesproken, aan het begin van het gebed.';

  @override
  String get howToPraySurahInstruction =>
      'Na Al-Fatiha een soera reciteren die u uit uw hoofd kent. Soera Al-Ikhlas (hierboven) is ideaal voor beginners — alleen in de eerste twee rak\'ahs.';

  @override
  String get howToPrayItidalInstruction =>
      'Zeg \'Sami\' Allahu liman hamidah\' terwijl u opstaat, dan rechtop staan voor \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Ga zitten na de 2e rak\'ah. Hef uw rechter wijsvinger op bij de Shahada. Bij 3- en 4-rak\'ah gebeden staat u daarna weer op.';

  @override
  String get howToPraySalawatInstruction =>
      'Reciteer de Salawat direct na de laatste Tashahhud, alleen in de laatste zit, voor de Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Draai uw hoofd naar rechts, spreek de Tasleem uit, draai dan naar links en herhaal. Uw gebed is voltooid.';

  @override
  String get howToPrayOnceOpens => 'Eenmaal — opent het gebed';

  @override
  String get howToPrayFirstRakahOnly => 'Alleen 1e rak\'ah';

  @override
  String get howToPrayFirst2RakahsOnly => 'Alleen eerste 2 rak\'ahs';

  @override
  String get howToPrayEveryRakah => 'Elke rak\'ah';

  @override
  String get howToPrayAfter2ndRakah => 'Na de 2e rak\'ah';

  @override
  String get howToPrayFinalSittingOnly => 'Alleen laatste zit';

  @override
  String get howToPrayClosesThePrayer => 'Sluit het gebed af';

  @override
  String get howToPraySectionBefore => 'Voor het gebed';

  @override
  String get howToPraySectionRakah => 'Rak\'ah';

  @override
  String get howToPraySectionMiddleSitting => 'Middenzit';

  @override
  String get howToPraySectionFinalSitting => 'Laatste zit';

  @override
  String get howToPrayRakahLabel => 'Rak\'ahs';

  @override
  String get howToPrayCompleteButton => 'Ik heb mijn gebed voltooid';

  @override
  String get howToPrayMashaallah => 'Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Moge Allah uw gebed aanvaarden.';

  @override
  String get fatihaIntroTitle => 'De Moeder van de Koran';

  @override
  String get fatihaIntroBody =>
      'Surah Al-Fatiha is de grootste soera in de Koran. Ze wordt in elke gebedseenheid gereciteerd — ten minste 17 keer per dag. Het is een volledig gesprek tussen de dienaar en Allah, en een toegangspoort tot elk gebed.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir schrijft: \'Al-Fatiha bevat de essentie van de hele Koran — het is een gebed, een verklaring van dienstbaarheid en een verzoek om leiding naar het rechte pad.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'De Sjahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Ik getuig dat er geen godheid is behalve Allah, en ik getuig dat Muhammad de boodschapper van Allah is';

  @override
  String get shahadaWordBreakdownTitle => 'Woord voor Woord';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'Er is geen';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'godheid / god';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'behalve';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (God alleen)';

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
  String get shahadaWord6Meaning => 'Boodschapper / Profeet';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'van Allah';

  @override
  String get shahadaMeaningTitle => 'Betekenis & Belang';

  @override
  String get shahadaMeaningBody =>
      'De Sjahada is de geloofsbelijdenis die de basis van de Islam vormt. Het is de eerste van de Vijf Pilaren. Door deze woorden met oprechte overtuiging uit te spreken, treedt iemand de Islam binnen. Ibn Kathir legt uit dat het eerste deel alle valse goden ontkent en de absolute eenheid van Allah bevestigt.';

  @override
  String get shahadaMomentTitle => 'Het Moment van de Sjahada';

  @override
  String get shahadaMomentBody =>
      'Wanneer iemand de Sjahada voor de eerste keer uitspreekt met echt geloof in zijn hart, gebeurt er iets diepzinnigs — zij beginnen een nieuw leven. De Profeet ﷺ zei: \'Wie zegt dat er geen god is dan Allah en niet gelooft in alles wat buiten Hem wordt aanbeden, zijn rijkdom en bloed zijn beschermd.\' (Sahih Muslim). Alle vroegere zonden worden vergeven. Welkom in de Islam.';

  @override
  String get shahadaPronunciationTitle => 'Uitspraakgids';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Stap voor stap gids';

  @override
  String get toolboxWuduSubtitle => 'Reiniging voor het gebed';

  @override
  String get toolboxGlossarySubtitle => '114 islamitische termen uitgelegd';

  @override
  String get shareSheetTitle => 'Delen';

  @override
  String get shareAnAyah => 'Een Ayah delen';

  @override
  String get shareADua => 'Een Dua delen';

  @override
  String get shareANameOfAllah => 'Een Naam van Allah delen';

  @override
  String get shareAHadith => 'Een Hadith delen';

  @override
  String get shareViaLabel => 'Gedeeld via Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Ayah van de Dag';

  @override
  String get shareCardDuaLabel => '✦ Dua';

  @override
  String get shareCardNameLabel => '✦ Naam van Allah';

  @override
  String get shareCardHadithLabel => '✦ Hadith';

  @override
  String get sharePickDuaTitle => 'Kies een Dua om te Delen';

  @override
  String get shareError => 'Kon geen afbeelding maken';

  @override
  String get shareCardVerseLabel => '✦ Koranvers';

  @override
  String get shareCardAsmaLabel => '✦ Asma ul-Husna';

  @override
  String get shareAyahSubtitle => 'Kies uit 30 Koranverzen';

  @override
  String get shareDuaSubtitle => 'Kies uit de bibliotheek';

  @override
  String get shareNameSubtitle => 'Kies uit alle 99 Mooie Namen';

  @override
  String get shareHadithSubtitle => 'Kies uit 20 authentieke hadiths';

  @override
  String get shareThisDua => 'Dit Dua Delen';

  @override
  String get sharePickAyahTitle => 'Kies een Ayah om te Delen';

  @override
  String get searchAyahs => 'Zoek ayahs…';

  @override
  String get noAyahsFoundShort => 'Geen ayahs gevonden';

  @override
  String get shareThisAyah => 'Deel Deze Ayah';

  @override
  String get sharePickNameTitle => 'Kies een Naam om te Delen';

  @override
  String get shareThisName => 'Deel Deze Naam';

  @override
  String get sharePickHadithTitle => 'Kies een Hadith om te Delen';

  @override
  String get searchHadiths => 'Zoek hadiths…';

  @override
  String get noHadithsFound => 'Geen hadiths gevonden';

  @override
  String get shareThisHadith => 'Deel Deze Hadith';

  @override
  String get backToBasics => 'Terug naar de Basis';

  @override
  String get backToBasicsSubtitle =>
      'Jouw gids voor de grondbeginselen van de islam';

  @override
  String get fivePillarsOfIslam => 'De 5 Zuilen van de Islam';

  @override
  String get fivePillarsSubtitle =>
      'De grondslagen van het islamitische geloof';

  @override
  String get pillarLearnMore => 'Meer leren';

  @override
  String get pillarShowLess => 'Minder tonen';

  @override
  String get pillarsShowDetails => 'Details tonen';

  @override
  String get pillarsHideDetails => 'Details verbergen';

  @override
  String get pillar1Name => 'Shahada';

  @override
  String get pillar1Desc => 'Geloofsbelijdenis';

  @override
  String get pillar1Detail =>
      'De geloofsbelijdenis is de basis van de islam. Door oprecht te zeggen \'Er is geen god dan Allah en Muhammad is Zijn boodschapper\', treedt iemand de islam binnen.';

  @override
  String get pillar2Name => 'Salah';

  @override
  String get pillar2Desc => 'Vijf Dagelijkse Gebeden';

  @override
  String get pillar2Detail =>
      'De vijf dagelijkse gebeden zijn de directe verbinding tussen een moslim en Allah. Gebeden bij dageraad, middag, namiddag, zonsondergang en nacht structureren de hele dag van de moslim rond de herinnering aan Allah.';

  @override
  String get pillar3Name => 'Zakat';

  @override
  String get pillar3Desc => 'Verplichte Liefdadigheid';

  @override
  String get pillar3Detail =>
      'Zakat is de verplichte jaarlijkse aalmoes van 2,5% van iemands spaargeld voor mensen in nood. Het zuivert rijkdom en versterkt de banden van de moslimgemeenschap.';

  @override
  String get pillar4Name => 'Sawm';

  @override
  String get pillar4Desc => 'Vasten in Ramadan';

  @override
  String get pillar4Detail =>
      'Vasten tijdens de gezegende maand Ramadan van dageraad tot zonsondergang. Moslims onthouden zich van eten, drinken en zonde om taqwa (godsbewustzijn) en dankbaarheid te bereiken.';

  @override
  String get pillar5Name => 'Hadj';

  @override
  String get pillar5Desc => 'Bedevaart naar Mekka';

  @override
  String get pillar5Detail =>
      'De bedevaart naar Mekka is eens in een leven verplicht voor elke moslim die fysiek en financieel in staat is. Het is de grootste jaarlijkse bijeenkomst van mensen op aarde.';

  @override
  String get switchedToNewMuslimMode =>
      'Overgeschakeld naar Nieuwe Moslimmodus';

  @override
  String get switchedToRegularMode => 'Overgeschakeld naar normale modus';

  @override
  String get liveNotifChannelName => 'Noor Guard Live';

  @override
  String get liveNotifChannelDescription =>
      'Gebedsaftelling en dagelijkse islamitische content op je vergrendelscherm';

  @override
  String get liveNotifHeaderAyah => 'AYAH VAN DE DAG';

  @override
  String get liveNotifHeaderDua => 'DUA VAN DE DAG';

  @override
  String get liveNotifHeaderWord => 'WOORD VAN DE DAG';

  @override
  String get liveNotifHeaderName => 'NAAM VAN ALLAH';

  @override
  String get liveNotifHeaderHadith => 'HADITH VAN DE DAG';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'over ${hours}u ${minutes}m';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'over ${minutes}m';
  }

  @override
  String get liveNotifCountdownNow => 'Tijd om te bidden';

  @override
  String get savedDuas => 'Opgeslagen doe\'a\'s';

  @override
  String get savedVerses => 'Opgeslagen verzen';

  @override
  String get savedNames => 'Opgeslagen namen';

  @override
  String get noSavedDuas => 'Nog geen opgeslagen doe\'a\'s';

  @override
  String get noSavedVerses => 'Nog geen opgeslagen verzen';

  @override
  String get noSavedNames => 'Nog geen opgeslagen namen';

  @override
  String get heroVerse16 =>
      'Onze Heer, reken het ons niet aan als wij vergeten of fouten maken.';

  @override
  String get heroVerse17 =>
      'Allah is ons genoeg, en Hij is de beste Beschermer.';

  @override
  String get heroVerse18 =>
      'O jullie die geloven, geloof in Allah en Zijn Boodschapper.';

  @override
  String get heroVerse19 =>
      'O jullie die geloven, vrees Allah en zoek het middel om Hem nabij te komen.';

  @override
  String get heroVerse20 =>
      'Voorwaar, mijn gebed, mijn offer, mijn leven en mijn sterven behoren aan Allah, Heer der werelden.';

  @override
  String get heroVerse21 =>
      'Schrijf voor ons het goede voor in deze wereld en in het hiernamaals; tot U zijn wij teruggekeerd.';

  @override
  String get heroVerse22 =>
      'Gedenk Allah veelvuldig, opdat jullie zullen slagen.';

  @override
  String get heroVerse23 =>
      'Ons overkomt slechts wat Allah voor ons heeft beschikt; Hij is onze Beschermer.';

  @override
  String get heroVerse24 =>
      'Voorwaar, de vrienden van Allah — geen vrees zal over hen komen, noch zullen zij treuren.';

  @override
  String get heroVerse25 =>
      'Mijn welslagen komt alleen van Allah; op Hem vertrouw ik en tot Hem keer ik terug.';

  @override
  String get heroVerse26 => 'Wanhoop niet aan de genade van Allah.';

  @override
  String get heroVerse27 =>
      'Degenen die geloven en wier harten rust vinden in het gedenken van Allah.';

  @override
  String get heroVerse28 =>
      'En toen jullie Heer verkondigde: Als jullie dankbaar zijn, zal Ik jullie zeker meer geven.';

  @override
  String get heroVerse29 =>
      'En aanbid jouw Heer totdat de zekerheid tot jou komt.';

  @override
  String get heroVerse30 =>
      'Voorwaar, Allah is met degenen die Hem vrezen en degenen die goed doen.';

  @override
  String get focusButtonSubtitle =>
      'Bescherm je tijd voor wat er echt toe doet';

  @override
  String get ourStories => 'Onze verhalen';

  @override
  String get storiesSeeAll => 'Alles bekijken';

  @override
  String get storiesReadMore => 'Lees meer';

  @override
  String get storiesFeaturedLabel => 'Uitgelicht verhaal';

  @override
  String get storiesFilterReverts => 'Bekeerlingen';

  @override
  String get storyCategoryRevert => 'Bekeerling';

  @override
  String get storyCategoryBornMuslim => 'Geboren moslim';

  @override
  String get storyCategoryReturning => 'Terugkerend';

  @override
  String get storiesShareYours => 'Deel de jouwe';

  @override
  String get storiesEmptyTitle => 'Nog geen verhalen';

  @override
  String get storiesEmptySubtitle => 'Deel als eerste jouw reis';

  @override
  String storyShahadaDate(Object date) {
    return 'Sjahada: $date';
  }

  @override
  String get storiesComments => 'Reacties';

  @override
  String get storiesAddComment => 'Voeg een reactie toe…';

  @override
  String get storiesAnonymous => 'Anoniem';

  @override
  String get storiesNameLabel => 'Je naam';

  @override
  String get storiesPostAnonymously => 'Anoniem plaatsen';

  @override
  String get storiesCountryLabel => 'Land';

  @override
  String get storiesCategoryLabel => 'Categorie';

  @override
  String get storiesShahadaDateLabel => 'Datum van de sjahada (optioneel)';

  @override
  String get storiesYourStoryLabel => 'Jouw verhaal';

  @override
  String get storiesStoryHint => 'Vertel ons over je reis…';

  @override
  String get storiesChooseBackground => 'Kies een achtergrond';

  @override
  String get storiesBackgroundNone => 'Geen';

  @override
  String get storiesEditTitle => 'Bewerk je verhaal';

  @override
  String get storiesSaveChanges => 'Wijzigingen opslaan';

  @override
  String get storiesUpdated => 'Je verhaal is bijgewerkt';

  @override
  String get storiesUploadPhoto => 'Foto uploaden (optioneel)';

  @override
  String get storiesChangePhoto => 'Foto wijzigen';

  @override
  String get storiesSubmitButton => 'Versturen';

  @override
  String get storiesSubmitted =>
      'JazakAllah khair! Je verhaal is ingediend ter beoordeling.';

  @override
  String get storiesSubmitError => 'Er ging iets mis. Probeer het opnieuw.';

  @override
  String get storiesFillRequired => 'Voeg je verhaal en land toe.';

  @override
  String get storiesShareCardLabel => 'Communityverhaal';

  @override
  String get storiesPreviewLabel => 'Voorbeeld';

  @override
  String get storiesPendingReview => 'In behandeling';

  @override
  String get storiesFilterSaved => 'Opgeslagen';

  @override
  String get storiesSavedEmpty => 'Nog geen opgeslagen verhalen';

  @override
  String get storiesSearchCountryHint => 'Zoek je land…';

  @override
  String get storiesChooseAvatar => 'Kies een avatar';

  @override
  String get storiesAvatarInitials => 'Initialen';

  @override
  String get storiesAvatarIcon => 'Icoon';

  @override
  String get storiesAvatarPattern => 'Patroon';

  @override
  String get storiesLoadError =>
      'Verhalen konden niet worden geladen. Controleer je verbinding.';

  @override
  String get storiesDiscardTitle => 'Je verhaal weggooien?';

  @override
  String get storiesDiscard => 'Weggooien';

  @override
  String get storiesKeepWriting => 'Verder schrijven';

  @override
  String get storiesSaveDraft => 'Concept opslaan';

  @override
  String get storiesDraftSaved => 'Concept opgeslagen';

  @override
  String get storiesDeleteDraft => 'Concept verwijderen';

  @override
  String get storiesContinueDraft => 'Ga verder met je concept';

  @override
  String get storiesStartFresh => 'Opnieuw beginnen';

  @override
  String get shareCardGlossaryLabel => '✦ Islamitische Begrippenlijst';

  @override
  String get shareCardTafsirLabel => '✦ Tafsir';

  @override
  String shareCardAyahRef(String number) {
    return 'Aya $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 Tijd voor Fajr';

  @override
  String get prayerReminderTitleDhuhr => '☀️ Tijd voor Dhuhr';

  @override
  String get prayerReminderTitleAsr => '🌤️ Tijd voor Asr';

  @override
  String get prayerReminderTitleMaghrib => '🌅 Tijd voor Maghrib';

  @override
  String get prayerReminderTitleIsha => '🌙 Tijd voor Isha';

  @override
  String get prayerReminderBodyFajr =>
      'Sta op en bid. Allah beloont wie voor Hem wakker wordt.';

  @override
  String get prayerReminderBodyDhuhr =>
      'Neem een moment voor Allah. Je Dhuhr-gebed wacht op je.';

  @override
  String get prayerReminderBodyAsr =>
      'Het middelste gebed. Waak er zorgvuldig over. — Al-Baqarah 2:238';

  @override
  String get prayerReminderBodyMaghrib =>
      'De zon is ondergegaan. Beantwoord de oproep van Allah.';

  @override
  String get prayerReminderBodyIsha =>
      'Sluit je dag af met Allah. Je nachtgebed wacht op je.';

  @override
  String get prayerAlarmMessageFajr =>
      'Sta op en bid. Allah beloont wie voor Hem wakker wordt.';

  @override
  String get prayerAlarmMessageDhuhr =>
      'Neem een moment voor Allah. Je Dhuhr-gebed wacht op je.';

  @override
  String get prayerAlarmMessageAsr =>
      'Waak zorgvuldig over het middelste gebed. — Al-Baqarah 2:238';

  @override
  String get prayerAlarmMessageMaghrib =>
      'De zon is ondergegaan. Beantwoord de oproep van Allah.';

  @override
  String get prayerAlarmMessageIsha =>
      'Sluit je dag af met Allah. Je nachtgebed wacht op je.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer over 15 minuten';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'Tijd om je voor te bereiden op het $prayer-gebed';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'Tijd voor het $prayer-gebed';
  }

  @override
  String get testNotificationTitle => '🔔 Testmelding';

  @override
  String get testNotificationBody => 'Meldingen werken correct!';

  @override
  String get favoriteRecitersSection => 'Favorieten';

  @override
  String get favoriteRecitersLimit =>
      'Je kunt maximaal 3 favoriete recitators hebben. Verwijder er een om een andere toe te voegen.';

  @override
  String get findQiblaDirection => 'Qibla-richting vinden';

  @override
  String get storyMenuShare => 'Delen';

  @override
  String get storyMenuBookmark => 'Opslaan';

  @override
  String get storyMenuReport => 'Melden';

  @override
  String get reportSheetTitle => 'Dit verhaal melden';

  @override
  String get reportSheetSubtitle => 'Help ons Noor Guard veilig te houden';

  @override
  String get reportReasonInappropriate => 'Ongepaste inhoud';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHateSpeech => 'Haatzaaiende taal';

  @override
  String get reportReasonOther => 'Anders';

  @override
  String get reportSubmit => 'Melding versturen';

  @override
  String get reportThankYou => 'JazakAllah khair — bedankt voor je melding';

  @override
  String get adminMode => 'Beheerdersmodus';

  @override
  String get adminTitle => 'Beheerder';

  @override
  String get adminTabPending => 'Verhalen in afwachting';

  @override
  String get adminTabReported => 'Gemelde verhalen';

  @override
  String get adminApprove => 'Goedkeuren';

  @override
  String get adminReject => 'Afwijzen';

  @override
  String get adminDeleteStory => 'Verhaal verwijderen';

  @override
  String get adminDismiss => 'Negeren';

  @override
  String get adminEmptyPending => 'Geen verhalen in afwachting';

  @override
  String get adminEmptyReports => 'Geen openstaande meldingen';
}
