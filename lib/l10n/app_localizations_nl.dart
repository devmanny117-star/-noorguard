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
  String get islamicMonthRabiAlAwwal => 'Rabī\' Al-Awwal';

  @override
  String get islamicMonthRamadan => 'Ramadan';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

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
}
