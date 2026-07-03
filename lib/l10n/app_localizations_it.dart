// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Che Allah benedica la tua giornata';

  @override
  String get nextPrayer => 'Prossima Preghiera';

  @override
  String get iPrayedButton => 'Ho pregato';

  @override
  String get todaysPrayers => 'Preghiere di Oggi';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Modalità Focus';

  @override
  String get appBlocking => 'Blocco App';

  @override
  String get islamicCalendar => 'Calendario Islamico';

  @override
  String get islamicCalendarSubtitle => 'Date hijri ed eventi';

  @override
  String get duas => 'Dua';

  @override
  String get quran => 'Corano';

  @override
  String get settings => 'Impostazioni';

  @override
  String get complete => 'Completa';

  @override
  String get streak => 'Serie';

  @override
  String get dayStreak => 'giorni di serie';

  @override
  String get compassRequiresDevice =>
      'La bussola richiede un dispositivo reale';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '$count giorno',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Tutte le preghiere completate! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 preghiere completate';
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
    return '$count rakat obbligatori';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah prima';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah dopo';
  }

  @override
  String prayedAt(String time) {
    return 'Si prega $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise =>
      'all\'alba prima del sorgere del sole';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'dopo che il sole ha superato il suo punto più alto';

  @override
  String get timePeriodLateAfternoon => 'nel tardo pomeriggio';

  @override
  String get timePeriodJustAfterSunset => 'subito dopo il tramonto';

  @override
  String get timePeriodNightBeforeMidnight => 'nella notte prima di mezzanotte';

  @override
  String get fajrHadith =>
      'Le due rakat del Fajr sono migliori del mondo e di tutto ciò che esso contiene. — Profeta Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Il Fajr è la prima preghiera della giornata. Ci ricorda di iniziare la giornata ricordando Allah.';

  @override
  String get dhuhrHadith =>
      'Chi prega le dodici rakat sunnah, Allah gli costruirà una casa in Paradiso.';

  @override
  String get dhuhrTip =>
      'Il Dhuhr è la preghiera di mezzogiorno. Un momento perfetto per fermarsi e riconnettersi.';

  @override
  String get asrHadith =>
      'Chi tralascia la preghiera dell\'Asr è come se avesse perso la sua famiglia e i suoi beni. — Profeta Muhammad ﷺ';

  @override
  String get asrTip =>
      'L\'Asr è spesso chiamata la preghiera di mezzo. Allah la menziona specificamente nel Corano (2:238).';

  @override
  String get maghribHadith =>
      'La preghiera del Maghrib è il Witr della giornata.';

  @override
  String get maghribTip =>
      'Il Maghrib segna la fine della giornata di digiuno nel Ramadan. Si prega proprio al tramonto del sole.';

  @override
  String get ishaHadith =>
      'Chi prega l\'Isha in congregazione è come se avesse pregato per metà della notte.';

  @override
  String get ishaTip =>
      'L\'Isha è l\'ultima preghiera della giornata. Concludere la giornata con la preghiera porta pace e serenità.';

  @override
  String get newMuslimTip => 'Consiglio per i nuovi musulmani';

  @override
  String get notificationsOn => 'Notifiche attive';

  @override
  String get notificationsOff => 'Notifiche disattivate';

  @override
  String get preview => 'Anteprima';

  @override
  String get lockPreviewCountdown => 'Tra 1h 23m  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Scorri verso l\'alto per sbloccare';

  @override
  String get searchSurahs => 'Cerca sure…';

  @override
  String get noSurahsFound => 'Nessuna sura trovata';

  @override
  String get tryAgain => 'Riprova';

  @override
  String ayahs(int count) {
    return '$count versetti';
  }

  @override
  String get searchDuas => 'Cerca dua…';

  @override
  String supplications(int count) {
    return '$count suppliche';
  }

  @override
  String get prayerSettings => 'Impostazioni Preghiera';

  @override
  String get calculationMethod => 'Metodo di Calcolo';

  @override
  String get adhanSound => 'Suono dell\'Adhan';

  @override
  String get prayerNotifications => 'Notifiche di Preghiera';

  @override
  String get statusOn => 'Attivo';

  @override
  String get statusOff => 'Disattivo';

  @override
  String get enableAllNotifications => 'Attiva tutte le notifiche';

  @override
  String get individualPrayers => 'Preghiere Individuali';

  @override
  String get appearance => 'Aspetto';

  @override
  String get darkMode => 'Modalità Scura';

  @override
  String get language => 'Lingua';

  @override
  String get aboutNoorGuard => 'Informazioni';

  @override
  String get version => 'Versione App';

  @override
  String get rateApp => 'Valuta Noor Guard';

  @override
  String get shareApp => 'Condividi Noor Guard';

  @override
  String get contactSupport => 'Contatta l\'Assistenza';

  @override
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get termsOfService => 'Termini di Servizio';

  @override
  String get helpUsImprove => 'Aiutaci a Migliorare';

  @override
  String get translationDisclaimer =>
      'Le nostre traduzioni sono assistite dall\'IA. Se noti errori nella tua lingua, ci farebbe piacere ricevere il tuo feedback!';

  @override
  String get privacyPromiseTitle => 'La Promessa di Privacy di Noor Guard';

  @override
  String get privacyPromiseBody =>
      'La tua fede è personale. I tuoi dati restano tali. Non vendiamo, condividiamo né monetizziamo mai i tuoi dati. Né la tua posizione. Né le tue abitudini di preghiera. Né il tuo nome.';

  @override
  String get directionToSacredHouse => 'Direzione verso la Casa Sacra';

  @override
  String towardMecca(String degrees) {
    return '$degrees° verso La Mecca';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (predefinito)';

  @override
  String get prayerHistory => 'Storico Preghiere';

  @override
  String get currentStreak => 'Serie Attuale';

  @override
  String get longestStreak => 'Serie più Lunga';

  @override
  String get legend => 'Legenda';

  @override
  String get allFivePrayers => 'Tutte e 5 le preghiere';

  @override
  String get partialPrayers => 'Parziale (1–4)';

  @override
  String get none => 'Nessuna';

  @override
  String get sun => 'Dom';

  @override
  String get mon => 'Lun';

  @override
  String get tue => 'Mar';

  @override
  String get wed => 'Mer';

  @override
  String get thu => 'Gio';

  @override
  String get fri => 'Ven';

  @override
  String get sat => 'Sab';

  @override
  String headingDegrees(String degrees) {
    return 'Direzione $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Impossibile caricare le sure';

  @override
  String get connectionError =>
      'Controlla la tua connessione internet e riprova';

  @override
  String get alQuran => 'Il Corano';

  @override
  String get dailySupplications => 'Suppliche Quotidiane';

  @override
  String get all => 'Tutte';

  @override
  String get noDuasFound => 'Nessuna dua trovata';

  @override
  String get january => 'gennaio';

  @override
  String get february => 'febbraio';

  @override
  String get march => 'marzo';

  @override
  String get april => 'aprile';

  @override
  String get may => 'maggio';

  @override
  String get june => 'giugno';

  @override
  String get july => 'luglio';

  @override
  String get august => 'agosto';

  @override
  String get september => 'settembre';

  @override
  String get october => 'ottobre';

  @override
  String get november => 'novembre';

  @override
  String get december => 'dicembre';

  @override
  String get home => 'Home';

  @override
  String get prayers => 'Preghiere';

  @override
  String get more => 'Altro';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Schermata di Blocco';

  @override
  String get readAndListen => 'Leggi e ascolta';

  @override
  String get commentary => 'Commento';

  @override
  String get findDirection => 'Trova la direzione';

  @override
  String get reminders => 'Promemoria';

  @override
  String get blockDistractions => 'Blocca le distrazioni';

  @override
  String get prayerGuard => 'Guardiano della preghiera';

  @override
  String get importantDates => 'Date importanti';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get morningAndEvening => 'Mattina e Sera';

  @override
  String get prayer => 'Preghiera';

  @override
  String get foodAndDrink => 'Cibo e Bevande';

  @override
  String get verityWithHardship =>
      'In verità, con la difficoltà viene la facilità.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Custodite scrupolosamente le vostre preghiere, in particolare la preghiera di mezzo.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Eventi Passati';

  @override
  String get upcomingEvents => 'Prossimi Eventi';

  @override
  String get today => 'Oggi';

  @override
  String get next => 'Prossimo';

  @override
  String hijriYearLabel(int year) {
    return '$year E.H.';
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
  String get islamicNewYear => 'Capodanno Islamico';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Inizio del Ramadan';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Giorno di Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Attivo';

  @override
  String get focusModeSubtitle =>
      'Proteggi la tua concentrazione. Le tue app restano bloccate finché non interrompi la sessione.';

  @override
  String get remaining => 'rimanenti';

  @override
  String get ready => 'pronto';

  @override
  String get duration => 'Durata';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Bloccate Durante il Focus';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Avvia Focus';

  @override
  String get stopFocus => 'Interrompi Focus';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Sessione Completata';

  @override
  String stayedFocusedFor(String duration) {
    return 'Sei rimasto concentrato per $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti',
      one: '$count minuto',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"E cercate aiuto nella pazienza e nella preghiera.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Fatto';

  @override
  String get socialMedia => 'Social Media';

  @override
  String get entertainment => 'Intrattenimento';

  @override
  String get games => 'Giochi';

  @override
  String get messaging => 'Messaggistica';

  @override
  String get blockDuringPrayerTimes => 'Blocca durante gli orari di preghiera';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Le app selezionate verranno bloccate automaticamente\ndurante tutte e 5 le preghiere quotidiane.';

  @override
  String get blockedLabel => 'bloccate';

  @override
  String get blockAllApps => 'Blocca tutte le app';

  @override
  String get blockingTimingInfo =>
      'Il blocco si attiva 5 minuti prima di ogni preghiera e si disattiva 15 minuti dopo.';

  @override
  String get blockedDuringPrayers => 'Bloccata durante le preghiere';

  @override
  String get notBlocked => 'Non bloccata';

  @override
  String get wuduStep1 => 'Intenzione';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Lavare le Mani';

  @override
  String get wuduStep4 => 'Sciacquare la Bocca';

  @override
  String get wuduStep5 => 'Pulire il Naso';

  @override
  String get wuduStep6 => 'Lavare il Viso';

  @override
  String get wuduStep7 => 'Lavare le Braccia';

  @override
  String get wuduStep8 => 'Passare sulla Testa';

  @override
  String get wuduStep9 => 'Lavare i Piedi';

  @override
  String get revertCorner => 'Angolo del Convertito';

  @override
  String get revertCornerSubtitle => 'Guide e supporto per i nuovi musulmani';

  @override
  String get wuduGuide => 'Guida al Wudu';

  @override
  String get howToPray => 'Come Pregare';

  @override
  String get newMuslimChecklist => 'Lista del Nuovo Musulmano';

  @override
  String get islamicGlossary => 'Glossario Islamico';

  @override
  String get whyDoWe => 'Perché Facciamo...';

  @override
  String get communityStories => 'Storie della Comunità';

  @override
  String get wuduGuideSubtitle => 'Purificazione prima della preghiera';

  @override
  String get howToPraySubtitle => 'Guida passo-passo alla salat';

  @override
  String get newMuslimChecklistSubtitle => 'Il tuo percorso di 30 giorni';

  @override
  String get howToPrayStep1Name => 'Prima il Wudu';

  @override
  String get howToPrayStep1Instruction =>
      'Esegui il wudu (abluzione) per essere in stato di purità prima di iniziare a pregare.';

  @override
  String get howToPrayStep1Tip =>
      'Se non sei sicuro di come fare, apri prima la Guida al Wudu dall\'Angolo del Nuovo Musulmano.';

  @override
  String get howToPrayStep2Name => 'Mettiti in Piedi rivolto verso la Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Mettiti in piedi sul tuo tappetino da preghiera rivolto verso la Qibla — la direzione della Kaaba alla Mecca. Usa la bussola Qibla nell\'app per trovare la direzione esatta.';

  @override
  String get howToPrayStep2Tip =>
      'Va bene se sei leggermente fuori direzione — Allah conosce la tua intenzione. Fai del tuo meglio.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intenzione)';

  @override
  String get howToPrayStep3Instruction =>
      'Formula nel tuo cuore l\'intenzione per la preghiera che stai per compiere. Non è necessario dirla ad alta voce.';

  @override
  String get howToPrayStep3Tip =>
      'La tua intenzione è tra te e Allah. Un pensiero semplice come \'Sto pregando il Fajr per Allah\' è sufficiente.';

  @override
  String get howToPrayStep4Name => 'Takbir (Apertura)';

  @override
  String get howToPrayStep4Instruction =>
      'Alza entrambe le mani all\'altezza dei lobi delle orecchie e di\' \'Allahu Akbar\' (Allah è il più Grande). Questo dà ufficialmente inizio alla tua preghiera.';

  @override
  String get howToPrayStep4Tip =>
      'Mantieni lo sguardo rivolto verso il basso, verso il punto in cui ti prostrerai, per tutta la preghiera.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Posizione Eretta)';

  @override
  String get howToPrayStep5Instruction =>
      'Posiziona la mano destra sopra la mano sinistra sul petto. Recita la Surah Al-Faatiha seguita da qualsiasi altra sura breve o versetti che conosci.';

  @override
  String get howToPrayStep5Tip =>
      'Se non conosci ancora altre sure, recitare solo Al-Faatiha è accettabile mentre stai imparando.';

  @override
  String get howToPrayStep6Name => 'Ruku (Inchino)';

  @override
  String get howToPrayStep6Instruction =>
      'Inchinati piegandoti dalla vita con la schiena parallela al pavimento. Posiziona le mani sulle ginocchia e di\' \'Subhana Rabbiyal Adheem\' tre volte.';

  @override
  String get howToPrayStep6Tip =>
      'Mantieni la schiena dritta e orizzontale — non incurvata o arrotondata.';

  @override
  String get howToPrayStep7Name => 'Itidal (Risalita dall\'Inchino)';

  @override
  String get howToPrayStep7Instruction =>
      'Risolleva il busto e mettiti dritto in piedi. Di\' \'Sami Allahu liman hamidah\' (Allah ascolta chi Lo loda) mentre ti rialzi, poi di\' \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Resta completamente eretto e fermo per un momento prima di passare alla posizione successiva.';

  @override
  String get howToPrayStep8Name => 'Sujud (Prostrazione)';

  @override
  String get howToPrayStep8Instruction =>
      'Scendi a terra appoggiando fronte, naso, entrambi i palmi delle mani, ginocchia e punte dei piedi sul pavimento. Di\' \'Subhana Rabbiyal A\'la\' tre volte.';

  @override
  String get howToPrayStep8Tip =>
      'Sette parti del corpo devono toccare il pavimento: fronte (con il naso), due mani, due ginocchia e due piedi.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Seduta tra le Prostrazioni)';

  @override
  String get howToPrayStep9Instruction =>
      'Siediti dopo la prostrazione con il piede sinistro disteso e il piede destro in verticale. Di\' \'Allahu Akbar\' mentre ti siedi. Fai una breve pausa, poi torna giù per la seconda prostrazione.';

  @override
  String get howToPrayStep9Tip =>
      'Questa breve seduta tra le due prostrazioni si chiama Jalsa. È una parte obbligatoria della preghiera.';

  @override
  String get howToPrayStep10Name => 'Completa le Rakat';

  @override
  String get howToPrayStep10Instruction =>
      'Dopo aver completato la prima rakat, alzati e ripeti gli stessi passaggi per la seconda rakat. Il numero di rakat dipende da quale preghiera stai eseguendo.';

  @override
  String get howToPrayStep10Tip =>
      'Il Fajr ha 2 rakat, il Dhuhr 4, l\'Asr 4, il Maghrib 3 e l\'Isha 4. Procedi una rakat alla volta.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Seduta Finale)';

  @override
  String get howToPrayStep11Instruction =>
      'Nella posizione seduta finale, recita il Tashahhud. È una dichiarazione di fede che reciti seduto dopo l\'ultima rakat.';

  @override
  String get howToPrayStep11Tip =>
      'Durante il Tashahhud, alza l\'indice destro quando dici \'Ash-hadu alla ilaha illallah\' come segno dell\'unicità di Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Chiusura)';

  @override
  String get howToPrayStep12Instruction =>
      'Gira la testa a destra e di\' \'Assalamu Alaikum wa Rahmatullah\', poi gira a sinistra e ripeti. Questo conclude la tua preghiera.';

  @override
  String get howToPrayStep12Tip =>
      'Dopo la preghiera, prenditi un momento per fare dua (supplica) e chiedere ad Allah ciò di cui hai bisogno. È un momento bellissimo per connettersi con Allah.';

  @override
  String get checklistWeek1Title => 'Settimana 1';

  @override
  String get checklistWeek2Title => 'Settimana 2';

  @override
  String get checklistWeek3Title => 'Settimana 3';

  @override
  String get checklistWeek4Title => 'Settimana 4';

  @override
  String get checklistWeek1Item1 => 'Pronuncia la Shahada';

  @override
  String get checklistWeek1Item2 => 'Impara il Wudu';

  @override
  String get checklistWeek1Item3 => 'Impara Al-Faatiha';

  @override
  String get checklistWeek1Item4 => 'Prega il tuo primo Fajr';

  @override
  String get checklistWeek1Item5 => 'Procurati un tappetino da preghiera';

  @override
  String get checklistWeek1Item6 => 'Trova una moschea nella tua zona';

  @override
  String get checklistWeek2Item1 => 'Impara tutti e 5 gli orari di preghiera';

  @override
  String get checklistWeek2Item2 => 'Impara le dua di base';

  @override
  String get checklistWeek2Item3 => 'Leggi la vita del Profeta Muhammad';

  @override
  String get checklistWeek2Item4 => 'Connettiti con la comunità musulmana';

  @override
  String get checklistWeek3Item1 => 'Informati sul cibo halal';

  @override
  String get checklistWeek3Item2 => 'Leggi la Surah Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Informati sul Ramadan';

  @override
  String get checklistWeek3Item4 => 'Inizia il dhikr quotidiano';

  @override
  String get checklistWeek4Item1 => 'Informati sulla Zakat';

  @override
  String get checklistWeek4Item2 => 'Leggi i 5 pilastri dell\'Islam';

  @override
  String get checklistWeek4Item3 => 'Imposta le notifiche di preghiera';

  @override
  String get checklistWeek4Item4 => 'Rifletti sul tuo percorso';

  @override
  String get wuduStep1Instruction =>
      'Formula nel tuo cuore l\'intenzione di compiere il wudu per amore di Allah.';

  @override
  String get wuduStep1Tip =>
      'Non è necessario dirla ad alta voce — un\'intenzione sincera nel cuore è sufficiente.';

  @override
  String get wuduStep2Instruction =>
      'Di\' Bismillah (Nel nome di Allah) prima di iniziare.';

  @override
  String get wuduStep2Tip =>
      'Dire Bismillah è sunnah e fa iniziare il tuo wudu con il ricordo di Allah.';

  @override
  String get wuduStep3Instruction =>
      'Lava entrambe le mani fino ai polsi tre volte, assicurandoti che l\'acqua arrivi tra le dita.';

  @override
  String get wuduStep3Tip =>
      'Inizia dalla mano destra, poi la sinistra. Quest\'ordine è raccomandato nell\'Islam.';

  @override
  String get wuduStep4Instruction =>
      'Prendi acqua in bocca, fai dei gargarismi e sputala fuori. Ripeti tre volte.';

  @override
  String get wuduStep4Tip =>
      'Questo pulisce la bocca ed è parte del processo di purificazione.';

  @override
  String get wuduStep5Instruction =>
      'Aspira acqua nelle narici e soffiala fuori delicatamente. Ripeti tre volte.';

  @override
  String get wuduStep5Tip =>
      'Usa la mano destra per aspirare l\'acqua e la mano sinistra per soffiarla fuori.';

  @override
  String get wuduStep6Instruction =>
      'Lava tutto il viso tre volte, dall\'attaccatura dei capelli al mento e da un orecchio all\'altro.';

  @override
  String get wuduStep6Tip =>
      'Assicurati che nessuna parte del viso resti asciutta.';

  @override
  String get wuduStep7Instruction =>
      'Lava il braccio destro dalla punta delle dita fino al gomito tre volte, poi fai lo stesso con il braccio sinistro.';

  @override
  String get wuduStep7Tip =>
      'Inizia sempre dal lato destro prima del sinistro nel wudu.';

  @override
  String get wuduStep8Instruction =>
      'Bagna le mani e passale su tutta la testa una volta, dalla fronte alla nuca e dalla nuca alla fronte.';

  @override
  String get wuduStep8Tip =>
      'A differenza del lavaggio, passare sulla testa si fa una sola volta.';

  @override
  String get wuduStep9Instruction =>
      'Lava il piede destro fino alla caviglia inclusa tre volte, poi fai lo stesso con il piede sinistro.';

  @override
  String get wuduStep9Tip =>
      'Assicurati che l\'acqua arrivi tra le dita dei piedi. Usa un dito per pulire tra di esse.';

  @override
  String get islamicGlossaryTitle => 'Glossario Islamico';

  @override
  String get islamicGlossarySubtitle =>
      '51 termini dal Corano, dalla Sunnah e dalla scienza islamica classica';

  @override
  String get searchTermsHint => 'Cerca termini, arabo, definizioni...';

  @override
  String get categoryAll => 'Tutti';

  @override
  String get categoryPillar => 'Pilastro';

  @override
  String get categoryAqeedah => 'Aqeedah';

  @override
  String get categoryPractice => 'Pratica';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Corano';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Storia';

  @override
  String get noTermsFound => 'Nessun termine trovato';

  @override
  String get sourceLabel => 'Fonte';

  @override
  String get revertCornerHubSubtitle =>
      'Un punto di riferimento accogliente per guidare i tuoi primi passi da nuovo musulmano';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Termini comuni spiegati in modo semplice';

  @override
  String get whyDoWeHubSubtitle => 'La saggezza dietro le pratiche quotidiane';

  @override
  String get communityStoriesHubSubtitle =>
      'Convertiti raccontano il loro percorso verso l\'Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'La saggezza dietro 12 pratiche islamiche quotidiane';

  @override
  String get whyDoWeSourceBadge => 'Fonte Sunnita';

  @override
  String get whyDoWeQ1 => 'Perché preghiamo 5 volte al giorno?';

  @override
  String get whyDoWeA1 =>
      'Allah ha ordinato le cinque preghiere quotidiane nel Corano (2:238) e furono stabilite durante il Viaggio Notturno (Isra wal Miraj). Il Profeta ﷺ ha detto: «La prima cosa di cui il servo dovrà rendere conto nel Giorno del Giudizio è la preghiera.» (Ibn Majah). La preghiera ci mantiene connessi ad Allah durante tutta la giornata.';

  @override
  String get whyDoWeQ2 =>
      'Perché ci rivolgiamo verso La Mecca quando preghiamo?';

  @override
  String get whyDoWeA2 =>
      'Allah ha ordinato nel Corano (2:144): «Volgi il tuo viso verso la Moschea Sacra.» La Kaaba alla Mecca è la prima casa costruita per l\'adorazione di Allah (3:96). Rivolgersi nella stessa direzione unisce tutti i musulmani nella preghiera in tutto il mondo.';

  @override
  String get whyDoWeQ3 => 'Perché digiuniamo nel Ramadan?';

  @override
  String get whyDoWeA3 =>
      'Allah ha ordinato il digiuno nel Corano (2:183): «O voi che credete, vi è stato prescritto il digiuno, come fu prescritto a coloro che vi hanno preceduto, affinché possiate raggiungere il timor di Allah (taqwa).» Il Ramadan è il mese in cui fu rivelato il Corano (2:185).';

  @override
  String get whyDoWeQ4 => 'Perché diciamo Bismillah prima di mangiare?';

  @override
  String get whyDoWeA4 =>
      'Il Profeta ﷺ ha detto: «Quando uno di voi mangia, menzioni il nome di Allah. Se lo dimentica all\'inizio, dica: Bismillah all\'inizio e alla fine.» (Abu Dawud). Ci ricorda che ogni benedizione viene da Allah.';

  @override
  String get whyDoWeQ5 =>
      'Perché ci togliamo le scarpe prima di entrare in moschea?';

  @override
  String get whyDoWeA5 =>
      'Quando Allah ordinò a Mosè: «Togliti i sandali, poiché sei nella valle sacra di Tuwa.» (Corano 20:12). Togliersi le scarpe mostra rispetto per la casa di Allah e mantiene pulito il luogo di preghiera.';

  @override
  String get whyDoWeQ6 => 'Perché diciamo Assalamu Alaikum come saluto?';

  @override
  String get whyDoWeA6 =>
      'Il Profeta ﷺ ha detto: «Non entrerete in paradiso finché non crederete, e non crederete finché non vi amerete gli uni gli altri. Volete che vi indichi qualcosa che vi farà amare l\'un l\'altro? Diffondete il saluto di pace (salam) tra voi.» (Muslim). È anche una dua — stai pregando per la pace su quella persona.';

  @override
  String get whyDoWeQ7 => 'Perché compiamo l\'Hajj?';

  @override
  String get whyDoWeA7 =>
      'L\'Hajj fu ordinato da Allah (3:97): «Il pellegrinaggio a questa Casa è un obbligo verso Allah per chi ne ha la possibilità.» Commemora le prove del Profeta Ibrahim e della sua famiglia, e unisce i musulmani di ogni nazione nell\'adorazione.';

  @override
  String get whyDoWeQ8 => 'Perché diamo la Zakat?';

  @override
  String get whyDoWeA8 =>
      'La Zakat è il terzo pilastro dell\'Islam, ordinata nel Corano più di 30 volte insieme alla preghiera. Il Profeta ﷺ ha detto che essa purifica la ricchezza. Riduce le disuguaglianze e ricorda ai credenti che la ricchezza appartiene ad Allah.';

  @override
  String get whyDoWeQ9 => 'Perché diciamo Alhamdulillah dopo aver starnutito?';

  @override
  String get whyDoWeA9 =>
      'Il Profeta ﷺ ha detto: «Quando uno di voi starnutisce, dica Alhamdulillah, e che il suo fratello o compagno dica Yarhamukallah.» (Bukhari). È un momento di gratitudine ad Allah per la benedizione della salute.';

  @override
  String get whyDoWeQ10 => 'Perché le donne musulmane indossano l\'hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah ha ordinato nel Corano (24:31) che le credenti custodiscano il proprio pudore. L\'hijab è un atto di adorazione e obbedienza ad Allah. Molte donne musulmane lo indossano come fonte di identità, dignità e connessione spirituale.';

  @override
  String get whyDoWeQ11 => 'Perché evitiamo carne di maiale e alcol?';

  @override
  String get whyDoWeA11 =>
      'Allah ha proibito la carne di maiale nel Corano (2:173) e l\'alcol in (5:90), definendolo «un\'abominazione, opera di Satana.» Questi divieti proteggono la salute, la mente e la famiglia. Le linee guida halal aiutano i credenti a mantenere la purezza fisica e spirituale.';

  @override
  String get whyDoWeQ12 => 'Perché diciamo Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah ordina nel Corano (18:23-24): «Non dire mai di nulla: Lo farò domani, senza aggiungere: Se Allah vuole.» Dire Inshallah riconosce che solo Allah controlla il futuro e ci mantiene umili.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Storie vere di percorsi verso l\'Islam da tutto il mondo';

  @override
  String get communityStoriesTimeLabel => 'Tempo come musulmano';

  @override
  String get communityStoriesShareBtn => 'Condividi la Tua Storia';

  @override
  String get communityStoriesShareSoon =>
      'Prossimamente — questa funzione è in arrivo!';

  @override
  String get communityStory1Name => 'Aisha (in precedenza Sarah)';

  @override
  String get communityStory1Location => 'Texas, USA';

  @override
  String get communityStory1Time => '2 anni';

  @override
  String get communityStory1Text =>
      'Mi sono imbattuta nell\'Islam mentre facevo ricerche per una tesina universitaria. Mi aspettavo di trovare quello che i media mi avevano raccontato. Invece ho trovato pace, logica e un Dio che aveva davvero senso. Ho pronunciato la mia shahada 6 mesi dopo. La parte più difficile non è stata imparare a pregare, ma dirlo alla mia famiglia. Ma Alhamdulillah, due anni dopo, è mia madre a farmi domande sull\'Islam.';

  @override
  String get communityStory2Name => 'Yusuf (in precedenza James)';

  @override
  String get communityStory2Location => 'Londra, Regno Unito';

  @override
  String get communityStory2Time => '4 anni';

  @override
  String get communityStory2Text =>
      'Mi sono convertito dopo anni di ricerca. Cristianesimo, buddismo, ateismo — niente riempiva quel vuoto. Un collega musulmano mi ha invitato alla preghiera del venerdì. Mi sono seduto in fondo e ho pianto per tutto il tempo. Non sapevo nemmeno il perché. Ho pronunciato la mia shahada la settimana successiva. La comunità mi ha avvolto come una famiglia di cui non sapevo di avere bisogno.';

  @override
  String get communityStory3Name => 'Maryam (in precedenza Maria)';

  @override
  String get communityStory3Location => 'Città del Messico, Messico';

  @override
  String get communityStory3Time => '1 anno';

  @override
  String get communityStory3Text =>
      'Essere latina e musulmana mi sembra un superpotere. Ho scoperto l\'Islam guardando un video su YouTube alle 2 di notte. Ho continuato a guardare per ore. Il concetto di tawhid — che Dio è uno, senza soci, senza immagini — ha risuonato così profondamente in me. Le mie sorelle ispanofone alla moschea mi hanno fatto sentire subito a casa.';

  @override
  String get communityStory4Name => 'Ibrahim (in precedenza David)';

  @override
  String get communityStory4Location => 'Toronto, Canada';

  @override
  String get communityStory4Time => '6 anni';

  @override
  String get communityStory4Text =>
      'Ero figlio di un pastore. Avevo domande sulla Trinità a cui nessuno sapeva rispondere. Quando ho letto il Corano per la prima volta, ho avuto la sensazione di leggere qualcosa in cui già credevo. Ho pronunciato la mia shahada in silenzio, da solo, e poi di nuovo in moschea. La decisione migliore della mia vita.';

  @override
  String get communityStory5Name => 'Fatima (in precedenza Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australia';

  @override
  String get communityStory5Time => '3 anni';

  @override
  String get communityStory5Text =>
      'Il mio percorso è iniziato con un hijab. Lo indossai per scommessa e mi sentii... protetta. Ho iniziato a leggere sull\'Islam e non riuscivo più a smettere. Nel giro di tre mesi avevo già pronunciato la mia shahada. Le persone mi chiedono a cosa ho rinunciato. Io rispondo che ho rinunciato al vuoto.';

  @override
  String get communityStory6Name => 'Omar (in precedenza Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Sudafrica';

  @override
  String get communityStory6Time => '5 anni';

  @override
  String get communityStory6Text =>
      'Sono cresciuto in un quartiere difficile. L\'Islam mi ha dato disciplina, uno scopo e fratellanza. La prima volta che ho fatto sujood, qualcosa dentro di me si è aperto — nel modo migliore. Ho pianto e non sapevo spiegarne il motivo. Ora faccio da guida ad altri giovani che cercano la loro strada verso il din.';

  @override
  String get inspiredByRealStories => 'Ispirato da vere storie di conversione';

  @override
  String get storyFormTitle => 'Condividi la Tua Storia';

  @override
  String get storyFormNameLabel => 'Il Tuo Nome';

  @override
  String get storyFormNameHint => 'Nome, oppure scrivi \'Anonimo\'';

  @override
  String get storyFormCountryLabel => 'Paese';

  @override
  String get storyFormCountryHint => 'Da dove vieni?';

  @override
  String get storyFormTimeLabel => 'Tempo come musulmano';

  @override
  String get storyFormTimeHint => 'es. 2 anni, 6 mesi';

  @override
  String get storyFormStoryLabel => 'La Tua Storia';

  @override
  String get storyFormStoryHint =>
      'Condividi il tuo percorso verso l\'Islam...';

  @override
  String get storyFormSubmitBtn => 'Invia Storia';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'La tua storia è stata ricevuta. Esaminiamo tutte le storie prima di pubblicarle.';

  @override
  String get storyFormRequiredError => 'Per favore compila tutti i campi';

  @override
  String get subtitleYourGuideToIslam => 'La tua guida all\'Islam';

  @override
  String get beginnerMode => 'Modalità Principiante';

  @override
  String get beginnerModeSubtitle =>
      'Consigli e indicazioni extra per i nuovi musulmani';

  @override
  String get beginnerModeOn =>
      'La modalità principiante è attiva — verranno mostrati consigli extra in tutta l\'app';

  @override
  String get beginnerModePrayersTip =>
      'Consiglio: tocca ogni preghiera per saperne di più e vedere le preghiere sunnah';

  @override
  String get tafsirSubtitle => 'Commento Coranico';

  @override
  String get tafsirComingSoon =>
      'Il tafsir di questa sura sarà disponibile a breve';

  @override
  String get tafsirNotAvailable => 'Tafsir non disponibile';

  @override
  String get scholarSource => 'Fonte';

  @override
  String get asbabAlNuzul => 'Motivo della Rivelazione';

  @override
  String get transliteration => 'Traslitterazione';

  @override
  String get selectReciter => 'Seleziona Recitatore';

  @override
  String get playVerse => 'Riproduci versetto';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'I 99 Bei Nomi di Allah';

  @override
  String get asmaHadith =>
      'Allah ha 99 nomi. Chi li memorizza entrerà in Paradiso.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Cerca nomi...';

  @override
  String get asmaNoResults => 'Nessun nome trovato';

  @override
  String get asmaSignificance => 'Significato';

  @override
  String get asmaUlHusnaTile => '99 Nomi';

  @override
  String get asmaUlHusnaTileSubtitle => 'Nomi di Allah';

  @override
  String get onboardingTagline =>
      'Custodisci il tuo tempo. Onora le tue preghiere.';

  @override
  String get onboardingChooseLanguage => 'Scegli la tua lingua';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboardingLocationTitle => 'Orari di Preghiera Precisi';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard ha bisogno della tua posizione per calcolare gli orari di preghiera precisi per la tua città. La tua posizione non viene mai memorizzata né condivisa.';

  @override
  String get onboardingPrivacyBanner =>
      'La tua fede è personale. I tuoi dati restano tali.';

  @override
  String get onboardingAllowLocation => 'Consenti Posizione';

  @override
  String get onboardingSkipForNow => 'Salta per ora';

  @override
  String get onboardingNotificationTitle => 'Non Perdere Mai una Preghiera';

  @override
  String get onboardingNotificationDesc =>
      'Ricevi una notifica a ogni orario di preghiera con un bellissimo adhan. Personalizza suoni e tempistiche nelle impostazioni.';

  @override
  String get onboardingAdhanAlerts => 'Avvisi adhan';

  @override
  String get onboardingCustomTiming => 'Tempistiche personalizzate';

  @override
  String get onboardingAdjustable => 'Regolabile';

  @override
  String get onboardingEnableNotifications => 'Attiva Notifiche';

  @override
  String get onboardingMaybeLater => 'Forse più tardi';

  @override
  String get onboardingAllSetTitle => 'Tutto Pronto!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard è pronto a proteggere il tuo tempo\ne a guidare la tua giornata con intenzione.';

  @override
  String get onboardingPrayerTimesLabel => 'Orari di Preghiera';

  @override
  String get onboardingPrayerTimesDesc => 'Orari precisi per la tua città';

  @override
  String get onboardingLockScreenLabel => 'Schermata di Blocco Islamica';

  @override
  String get onboardingLockScreenDesc => 'Corano e dua a ogni sblocco';

  @override
  String get onboardingPrayerGuardLabel => 'Guardiano della Preghiera';

  @override
  String get onboardingPrayerGuardDesc =>
      'Le app vengono bloccate automaticamente durante la salat';

  @override
  String get onboardingEnterApp => 'Entra in Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'La Chiamata alla Preghiera';

  @override
  String get adhanDescription =>
      'L\'Adhan è la chiamata islamica alla preghiera, annunciata cinque volte al giorno per invitare i fedeli al culto.';

  @override
  String get makkahStyle => 'Mecca';

  @override
  String get madinahStyle => 'Medina';

  @override
  String get egyptianStyle => 'Egiziano';

  @override
  String get adhanPlaying => 'In Riproduzione';

  @override
  String get makkahDescription =>
      'La tradizionale chiamata alla preghiera dalla Grande Moschea della Mecca.';

  @override
  String get madinahDescription =>
      'Un\'esecuzione serena in stile Moschea del Profeta a Medina.';

  @override
  String get egyptianDescription =>
      'Un adhan melodico in stile egiziano, noto per la sua ricca recitazione.';

  @override
  String get adhanCallToWorship => 'La Chiamata alla Preghiera';

  @override
  String get adhanDescriptionFull =>
      'L\'Adhan è la chiamata islamica alla preghiera, annunciata cinque volte al giorno per invitare i fedeli al culto.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turco';

  @override
  String get pakistaniStyle => 'Pakistano';

  @override
  String get indonesianStyle => 'Indonesiano';

  @override
  String get alafasyDescription =>
      'Un\'interpretazione toccante del rinomato recitatore Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'La chiamata alla preghiera che risuona dalla Moschea di Al-Aqsa a Gerusalemme, il terzo luogo più sacro dell\'Islam.';

  @override
  String get turkishDescription =>
      'Un ezan tradizionale in stile turco con il suo distintivo maqam melodico.';

  @override
  String get pakistaniDescription =>
      'Un adhan toccante nella tradizione sudasiatica, recitato in tutto il Pakistan.';

  @override
  String get indonesianDescription =>
      'Un adhan melodioso in stile indonesiano, amato in tutto l\'arcipelago.';

  @override
  String get thisWeek => 'Questa Settimana';

  @override
  String weeklyProgress(int count) {
    return '$count di 35 preghiere questa settimana';
  }

  @override
  String get bestDay => 'Giorno migliore';

  @override
  String get prayerStats => 'Statistiche di Preghiera';

  @override
  String get completionRate => 'Tasso di Completamento';

  @override
  String get bestPrayer => 'Preghiera Più Costante';

  @override
  String get hardestPrayer => 'Preghiera Più Saltata';

  @override
  String totalPrayersCompleted(int count) {
    return '$count preghiere completate';
  }

  @override
  String get last7Days => 'Ultimi 7 Giorni';

  @override
  String get thisMonth => 'Questo Mese';

  @override
  String get fullDays => 'Giorni completi';

  @override
  String get partialDays => 'Giorni parziali';

  @override
  String get missedDays => 'Giorni saltati';

  @override
  String get missedPrayerBadge => 'Saltata';

  @override
  String get makeItUp => 'Recupera';

  @override
  String get qadaExplanation =>
      'Se hai saltato una preghiera, puoi ancora recitarla come preghiera Qada (di recupero).';

  @override
  String get noStatsYet =>
      'Continua a segnare le tue preghiere per vedere qui le tue statistiche.';

  @override
  String get notEnoughData => 'Non ci sono ancora dati sufficienti';

  @override
  String get continuousPlay => 'Continuo';

  @override
  String get sleepTimer => 'Timer sonno';

  @override
  String verseCount(Object total, Object verse) {
    return 'Vers. $verse di $total';
  }

  @override
  String get verseTafsir => 'Tafsir del versetto';

  @override
  String get tafsirOfTheDay => 'Tafsir del giorno';

  @override
  String get dailyInsight => 'Riflessione quotidiana';

  @override
  String get keyThemes => 'Temi e lezioni chiave';

  @override
  String get readFullSurah => 'Leggi sura completa';

  @override
  String get surahIntroduction => 'Introduzione della sura';

  @override
  String get verses => 'versetti';

  @override
  String get loadingTafsir => 'Caricamento tafsir...';

  @override
  String get keepAliveNotificationText => 'Notifiche di preghiera attive';

  @override
  String get keepAliveChannelName => 'Notifiche di preghiera';

  @override
  String get keepAliveChannelDescription =>
      'Mantiene Noor Guard attivo in background così gli allarmi di preghiera non vengono mai persi.';

  @override
  String get notifSetupTitle => 'Attiva avvisi sulla schermata di blocco';

  @override
  String get notifSetupSubtitle =>
      'Così non ti perderai mai l\'adhan, anche se il telefono è bloccato. Richiede circa un minuto.';

  @override
  String get notifSetupSamsungBanner =>
      'Usi un Samsung Galaxy (incluso Fold/Flip)? Samsung aggiunge interruttori extra oltre Android standard — i passaggi 4 e 6 qui sotto ti mostrano esattamente dove trovarli.';

  @override
  String get notifSetupStep1Title => 'Consenti notifiche';

  @override
  String get notifSetupStep1Description =>
      'Il permesso di base di cui Noor Guard ha bisogno per avvisarti.';

  @override
  String get notifSetupStep1Action => 'Consenti notifiche';

  @override
  String get notifSetupStep2Title => 'Allarmi e promemoria';

  @override
  String get notifSetupStep2Description =>
      'Permette agli allarmi di preghiera di suonare esattamente all\'orario della preghiera, anche se il telefono è inattivo o in modalità risparmio energetico.';

  @override
  String get notifSetupStep2Action => 'Apri impostazioni allarme';

  @override
  String get notifSetupStep3Title => 'Visualizza sopra altre app';

  @override
  String get notifSetupStep3Description =>
      'Permette alla schermata di preghiera completa di apparire sopra la schermata di blocco e qualsiasi altra cosa aperta.';

  @override
  String get notifSetupStep3Action => 'Apri impostazioni';

  @override
  String get notifSetupStep4Title =>
      'Mostra come pop-up / avviso a schermo intero';

  @override
  String get notifSetupStep4Description =>
      'Permette alla schermata dell\'adhan di superare la schermata di blocco invece di restare un banner silenzioso.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Sui telefoni Samsung Galaxy (incluso Fold/Flip): apri Impostazioni → tocca \"Prayer Time Alarm\", poi attiva \"Pop-up notification\" (chiamata \"Cover screen pop-up\" su Fold/Flip). È un interruttore esclusivo di Samsung — attivarlo è ciò che porta davvero la schermata dell\'adhan sopra la schermata di blocco.';

  @override
  String get notifSetupStep4Action => 'Apri impostazioni notifiche';

  @override
  String get notifSetupStep5Title => 'Mantieni le notifiche affidabili';

  @override
  String get notifSetupStep5Description =>
      'Impedisce ad Android di rallentare o ritardare Noor Guard in background, così gli allarmi e i promemoria di preghiera arrivano sempre in orario.';

  @override
  String get notifSetupStep5Action => 'Disattiva ottimizzazione batteria';

  @override
  String get notifSetupStep6Title => 'App che non vanno mai in sospensione';

  @override
  String get notifSetupStep6Description =>
      'Il gestore batteria di Samsung può mettere Noor Guard in sospensione e bloccare silenziosamente gli allarmi di preghiera. Aggiungerlo a \"Never sleeping apps\" lo impedisce.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Impostazioni → Batteria e cura del dispositivo → Limiti di utilizzo in background → Never sleeping apps → tocca \"+\" → seleziona Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Apri impostazioni batteria';

  @override
  String get notifSetupStatusChecking => 'Verifica in corso…';

  @override
  String get notifSetupStatusEnabled => 'Attivo';

  @override
  String get notifSetupStatusNeeded => 'Necessario';

  @override
  String get notifSetupStatusManual => 'Passaggio manuale';

  @override
  String get notifSetupContinueButton => 'Continua su Noor Guard';

  @override
  String get notifSetupLaterButton => 'Lo farò più tardi';

  @override
  String get notifSetupDoneButton => 'Fatto';

  @override
  String get testNotificationButton => 'Invia notifica di prova (10 s)';

  @override
  String get testNotificationSnack =>
      'La notifica di prova arriverà in 10 secondi';

  @override
  String get testLockAlarmButton => 'Prova allarme a schermo intero (10 s)';

  @override
  String get testLockAlarmSnack =>
      'La sveglia di blocco scatta in 10 secondi: blocca subito il telefono';

  @override
  String get testAdhanForegroundButton =>
      'Prova l\'adhan nell\'app (in primo piano)';

  @override
  String get testAdhanForegroundSnack =>
      'Riproduzione dell\'adhan completo con un banner silenzioso';

  @override
  String get testRequiresNotificationsOn =>
      'Attiva prima le Notifiche di Preghiera per provare questo';

  @override
  String get lockScreenSetupGuideButton =>
      'Guida alla configurazione degli avvisi sulla schermata di blocco';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Impossibile aprire l\'Informativa sulla Privacy';

  @override
  String get couldNotOpenEmailApp => 'Impossibile aprire l\'app di posta';

  @override
  String get blockDurationLabel => 'Durata del blocco';

  @override
  String get privacyAndTrust => 'Privacy e Fiducia';

  @override
  String get noorGuardMotto =>
      '\"Se non appartiene a una moschea,\nnon appartiene a Noor Guard.\"';

  @override
  String get openingAppStore => 'Apertura dell\'App Store…';

  @override
  String get openingShareSheet => 'Apertura del foglio di condivisione…';

  @override
  String get openingSupportEmail => 'Apertura dell\'email di assistenza…';

  @override
  String get openingTermsOfService => 'Apertura dei Termini di Servizio…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 ora';

  @override
  String get durationPrayerWindowOnly => 'Solo finestra di preghiera';

  @override
  String get hoursAbbreviation => 'h';

  @override
  String get cancelTimerButton => 'Annulla il timer';

  @override
  String get custom => 'Personalizzato';

  @override
  String get customTimerMinutesTitle => 'Timer personalizzato (minuti)';

  @override
  String get customTimerHint => 'es. 20';

  @override
  String get cancel => 'Annulla';

  @override
  String get start => 'Avvia';

  @override
  String get travel => 'Viaggio';

  @override
  String get anxietyAndStress => 'Ansia e Stress';

  @override
  String get gratitude => 'Gratitudine';

  @override
  String get protection => 'Protezione';

  @override
  String get family => 'Famiglia';

  @override
  String get forgiveness => 'Perdono';

  @override
  String get appBlockingSetupHeadline =>
      'Custodisci il tuo tempo, custodisci la tua preghiera';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard usa il servizio di Accessibilità di Android solo per accorgersi quando un\'app bloccata viene aperta durante la preghiera. Non legge mai i tuoi messaggi, foto o dati personali.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Accesso all\'Accessibilità concesso';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Accesso all\'Accessibilità non concesso';

  @override
  String get appBlockingOpenSettings => 'Apri impostazioni di Accessibilità';

  @override
  String get appBlockingSetupNotNow => 'Non ora';

  @override
  String get appBlockingEnableToggle => 'Attiva il blocco app';

  @override
  String get appBlockingModeLabel => 'Modalità di blocco';

  @override
  String get appBlockingModeSoft => 'Leggera';

  @override
  String get appBlockingModeSoftDesc =>
      'Solo un gentile promemoria — le app restano apribili';

  @override
  String get appBlockingModeFirm => 'Ferma';

  @override
  String get appBlockingModeFirmDesc => 'Blocca l\'app, con un\'uscita rapida';

  @override
  String get appBlockingModeHard => 'Rigida';

  @override
  String get appBlockingModeHardDesc =>
      'Blocco totale — solo \"Ho pregato\" lo sblocca';

  @override
  String get appBlockingSelectPrayersLabel => 'Blocca durante queste preghiere';

  @override
  String get appBlockingBufferBeforeLabel => 'Inizia prima della preghiera';

  @override
  String get appBlockingBufferAfterLabel => 'Rimuovi dopo la preghiera';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'App bloccate';

  @override
  String get appBlockingSelectAppsButton => 'Scegli le app da bloccare';

  @override
  String get appBlockingSearchHint => 'Cerca app installate';

  @override
  String get appBlockingNoAppsSelected => 'Nessuna app selezionata ancora';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count app bloccate',
      one: '1 app bloccata',
      zero: 'Nessuna app bloccata',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Test';

  @override
  String get appBlockingTestDescription =>
      'Attiva il blocco delle app per 2 minuti per confermare che funzioni su questo dispositivo.';

  @override
  String get appBlockingTestButton => 'Testa il blocco app (2 minuti)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Blocco app attivo per 2 minuti — prova ad aprire un\'app bloccata';

  @override
  String get appBlockingPermissionNeeded =>
      'Attiva l\'accesso all\'Accessibilità per iniziare a bloccare';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Accesso a Tempo di utilizzo — presto disponibile';

  @override
  String get appBlockingIosComingSoonBody =>
      'Il blocco app su iOS richiede il permesso Tempo di utilizzo di Apple, che stiamo ancora configurando. Ti avviseremo non appena sarà pronto.';

  @override
  String get appBlockingHeadline1 => 'Ora di pregare';

  @override
  String get appBlockingHeadline2 => 'Custodisci il tuo tempo';

  @override
  String get appBlockingDefaultTitle => 'Ora di preghiera';

  @override
  String get appBlockingIPrayedButton => 'Ho pregato';

  @override
  String get appBlockingReadAyahsButton => 'Leggi 3 versetti';

  @override
  String get appBlockingEmergencyBypass => 'Uscita di emergenza';

  @override
  String get appBlockingSkipForNow => 'Salta per ora';

  @override
  String get appBlockingBypassConfirmTitle => 'Terminare la tua serie?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Uscire ora azzererà la tua serie di preghiere. Se è una vera emergenza, puoi continuare.';

  @override
  String get appBlockingBypassConfirmContinue => 'Esci comunque';

  @override
  String get appBlockingBypassConfirmCancel => 'Torna indietro';

  @override
  String get appBlockingSoftReminderTitle => 'Un gentile promemoria';

  @override
  String get appBlockingSoftReminderBody =>
      'È ora di pregare — considera di allontanarti per un momento.';

  @override
  String get quranChallengeBannerTitle => 'Leggi 3 versetti per sbloccare';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count di $total versetti letti';
  }

  @override
  String get quranChallengeComplete => 'Ben fatto — app sbloccate';

  @override
  String get focusBlockHeadline1 => 'Resta concentrato';

  @override
  String get focusBlockHeadline2 => 'Continua così';

  @override
  String get endFocusSessionButton => 'Termina sessione di concentrazione';

  @override
  String get focusPaused => 'In pausa per la preghiera';

  @override
  String get selectLocationTitle => 'Seleziona posizione';

  @override
  String get useCurrentLocation => 'Usa posizione attuale';

  @override
  String get savedLocationsHeader => 'Posizioni salvate';

  @override
  String get noSavedLocationsYet =>
      'Nessuna posizione salvata. Cerca qui sotto per aggiungerne una.';

  @override
  String get searchCityHint => 'Cerca nome città…';

  @override
  String get addLocationTooltip => 'Aggiungi posizione';

  @override
  String get deleteLocationTooltip => 'Elimina posizione';

  @override
  String get locationNotFound =>
      'Posizione non trovata. Prova una ricerca diversa.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Puoi salvare fino a $max posizioni';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Non è stato possibile confermare la modifica — riprova';

  @override
  String get tasbihCounter => 'Contatore Tasbih';

  @override
  String get tasbihCounterSubtitle => 'Conta il tuo dhikr';

  @override
  String get tasbihResetButton => 'Reimposta';

  @override
  String get tasbihTotalLabel => 'Totale';

  @override
  String get tasbihCelebrationTitle => 'Tasbih completato!';

  @override
  String get tasbihCelebrationBody =>
      'Hai completato tutti i 99 dhikr. Possa Allah accettare il tuo ricordo.';

  @override
  String get tasbihStartNewSession => 'Inizia nuova sessione';

  @override
  String get tasbihUndoButton => 'Annulla';

  @override
  String get tasbihTapAnywhereHint =>
      'Tocca un punto qualsiasi dello schermo per contare';

  @override
  String get tasbihSoundToggleTooltip => 'Suono al tocco';

  @override
  String get tasbihManageDhikrTooltip => 'Gestisci dhikr';

  @override
  String get tasbihStatsTooltip => 'Visualizza statistiche';

  @override
  String get tasbihDailyTotalLabel => 'Totale di Oggi';

  @override
  String get tasbihRoundsTodayLabel => 'Giri di Oggi';

  @override
  String get tasbihManageDhikrTitle => 'Gestisci Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Aggiungi Dhikr Personalizzato';

  @override
  String get tasbihDeleteDhikrTooltip => 'Elimina';

  @override
  String get tasbihBuiltInDhikrBadge => 'Predefinito';

  @override
  String get tasbihCannotDeleteLastDhikr => 'Hai bisogno di almeno un dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Nome';

  @override
  String get tasbihDhikrNameHint => 'es. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arabo (opzionale)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Inserisci un nome';

  @override
  String get tasbihSaveDhikrButton => 'Salva';

  @override
  String get tasbihStatsTitle => 'Statistiche del Tasbih';

  @override
  String get tasbihAllTimeTotalLabel => 'Totale Generale';

  @override
  String get tasbihNoActivityYetMessage =>
      'Inizia a contare per vedere le tue statistiche qui.';

  @override
  String get tasbihSoundPickerTitle => 'Suono al Tocco';

  @override
  String get tasbihSoundClassicClick => 'Click Classico';

  @override
  String get tasbihSoundSoftChime => 'Campanella Soffice';

  @override
  String get tasbihSoundStoneTap => 'Tocco di Pietra';

  @override
  String get tasbihCurrentlyReciting => 'Recitando Ora';

  @override
  String tasbihOfTarget(int target) {
    return 'di $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Goccia di Pioggia';

  @override
  String get tasbihSoundSoftFeather => 'Piuma Soffice';

  @override
  String noAyahsFound(String query) {
    return 'Nessun versetto trovato per \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Cerca in italiano, inglese o arabo, o usa un termine islamico:';

  @override
  String get loadingQuranIndex => 'Caricamento dell’indice del Corano…';

  @override
  String get quranSearchSuggestions =>
      'pazienza, sabr, misericordia, preghiera, salah, perdono, tawbah, paradiso, jannah, conoscenza';

  @override
  String get heroVerse1 =>
      'Osservate scrupolosamente le preghiere, soprattutto la preghiera di mezzo.';

  @override
  String get heroVerse2 =>
      'Invero, la preghiera è prescritta ai credenti in ore determinate.';

  @override
  String get heroVerse3 => 'Cercate aiuto nella pazienza e nella preghiera.';

  @override
  String get heroVerse4 =>
      'Ricordatemi e Io vi ricorderò. Siatemi grati e non siate ingrati.';

  @override
  String get heroVerse5 =>
      'Chi si affida ad Allah, Allah gli sarà sufficiente.';

  @override
  String get heroVerse6 =>
      'In verità, la prima Casa costruita per gli uomini è quella di Makkah, fonte di benedizione e guida per i mondi.';

  @override
  String get heroVerse7 =>
      'In verità, la preghiera distoglie dalla turpitudine e dalla malvagità, e il ricordo di Allah è certamente superiore.';

  @override
  String get heroVerse8 =>
      'In verità, solo nel ricordo di Allah i cuori trovano pace.';

  @override
  String get heroVerse9 => 'Invocatemi e Io vi risponderò.';

  @override
  String get heroVerse10 => 'Se siete grati, certamente vi darò di più.';

  @override
  String get heroVerse11 =>
      'Allah non grava un\'anima oltre le sue possibilità.';

  @override
  String get heroVerse12 => 'In verità, Allah è con i pazienti.';

  @override
  String get heroVerse13 => 'La Mia misericordia abbraccia ogni cosa.';

  @override
  String get heroVerse14 =>
      'Fate il bene; in verità Allah ama coloro che fanno il bene.';

  @override
  String get heroVerse15 =>
      'Questo è il Libro in cui non c\'è dubbio, una guida per i timorati di Allah.';

  @override
  String get accuracyHigh => 'Alta precisione';

  @override
  String get accuracyMedium => 'Precisione media';

  @override
  String get accuracyLow => 'Bassa precisione';

  @override
  String get accuracyCalibrating => 'Calibrazione…';

  @override
  String get compassNeedsCalibration => 'La bussola necessita di calibrazione';

  @override
  String get compassCalibrationHint =>
      'Muovi il telefono lentamente a forma di 8 per migliorare la precisione.';

  @override
  String get spiritLevelLabel => 'Livella a bolla';

  @override
  String get spiritLevelLevelText => '✓  Livellato';

  @override
  String get spiritLevelTiltText => 'Inclina per livellare';

  @override
  String get compassNorth => 'N';

  @override
  String get compassEast => 'E';

  @override
  String get compassSouth => 'S';

  @override
  String get compassWest => 'O';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline =>
      'Custodisci il tuo tempo. Onora le tue preghiere.';

  @override
  String get stopAdhan => 'Ferma Adhan';

  @override
  String get duasSearchEmpty =>
      'Prova una categoria diversa o un termine di ricerca diverso.';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingWelcomeTo => 'Benvenuto su';

  @override
  String get onboardingSubtitle =>
      'Il tuo compagno nel bellissimo cammino dell\'Islam.';

  @override
  String get onboardingLetsGetStarted => 'Iniziamo';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step di $total';
  }

  @override
  String get onboardingWhatsYourName => 'Come ti chiami?';

  @override
  String get onboardingNameSubtitle =>
      'Ci piacerebbe sapere come rivolgerti a te.';

  @override
  String get onboardingNameHint => 'Inserisci il tuo nome';

  @override
  String get onboardingContinue => 'Continua';

  @override
  String get onboardingAreYouNewToIslam => 'Sei nuovo all\'Islam?';

  @override
  String get onboardingModeSubtitle =>
      'Personalizzeremo la tua esperienza in base al tuo percorso.';

  @override
  String get onboardingNewToIslam => 'Sono nuovo all\'Islam';

  @override
  String get onboardingNewToIslamDesc =>
      'Modalità principiante con guida passo dopo passo';

  @override
  String get onboardingFamiliarWithIslam => 'Conosco l\'Islam';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Modalità normale con tutte le funzionalità';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Giorno $days come musulmano';
  }

  @override
  String get beginnerEssential1 => 'Guida per nuovi musulmani';

  @override
  String get beginnerEssential2 => 'Imparare il Wudu';

  @override
  String get beginnerEssential3 => 'Come pregare (Passo dopo passo)';

  @override
  String get beginnerEssential4 => 'Surah Al-Fatiha (L\'Apertura)';

  @override
  String get beginnerEssential5 => 'Dua quotidiane (Suppliche)';

  @override
  String get beginnerEssential6 => 'Capire la Shahada';

  @override
  String get beginnerEssential7 => 'Termini islamici e glossario';

  @override
  String get beginnerExploreAll => 'Esplora tutte le funzionalità';

  @override
  String get beginnerExploreSubtitle =>
      'Passa all\'esperienza completa di Noor Guard';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Tutto ciò che Noor Guard ha da offrire';

  @override
  String get beginnerLearnSalah => 'Imparare il Salah';

  @override
  String get beginnerMayAllahGuide =>
      'Che Allah guidi i tuoi passi e benedica il tuo cammino.';

  @override
  String get beginnerMuslimEssentials => 'FONDAMENTALI DEL MUSULMANO';

  @override
  String get beginnerQuote1 =>
      'In verità, con la difficoltà viene la facilità. — Corano 94:6';

  @override
  String get beginnerQuote2 =>
      'Rispetta i comandi di Allah e Lui si prenderà cura di te.';

  @override
  String get beginnerQuote3 =>
      'Allah guarda il tuo cuore e le tue azioni, non il tuo aspetto.';

  @override
  String get beginnerQuote4 =>
      'Ogni passo verso la preghiera è un passo verso la pace.';

  @override
  String get beginnerQuote5 =>
      'Il migliore tra voi è colui che apprende il Corano e lo insegna.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Tocca per impostare la data della tua Shahada';

  @override
  String get beginnerToolboxSection =>
      'CASSETTA DEGLI ATTREZZI PER PRINCIPIANTI';

  @override
  String get beginnerYourJourney => 'IL TUO CAMMINO';

  @override
  String get journeyMonth1Name => 'Mese 1: Le Fondamenta';

  @override
  String get journeyMonth2Name => 'Mese 2: Costruire Abitudini';

  @override
  String get journeyMonth3Name => 'Mese 3: Approfondire la Fede';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total completato';
  }

  @override
  String get journeyViewFull => 'Vedi viaggio completo →';

  @override
  String get journeyTask2_1 => 'Pregare le 5 preghiere per 7 giorni';

  @override
  String get journeyTask2_2 => 'Imparare altre 10 Duas';

  @override
  String get journeyTask2_3 => 'Leggere il primo Juz del Corano';

  @override
  String get journeyTask2_4 => 'Imparare i 99 Nomi di Allah';

  @override
  String get journeyTask2_5 =>
      'Usare il contatore Tasbih ogni giorno per 7 giorni';

  @override
  String get journeyTask2_6 => 'Imparare le preghiere Sunnah';

  @override
  String get journeyTask2_7 => 'Trovare la tua Masjid locale';

  @override
  String get journeyTask3_1 => 'Leggere la Surah Al-Baqarah';

  @override
  String get journeyTask3_2 => 'Imparare sullo Zakat';

  @override
  String get journeyTask3_3 => 'Imparare sul Digiuno (Sawm)';

  @override
  String get journeyTask3_4 => 'Memorizzare 3 nuove Sure';

  @override
  String get journeyTask3_5 => 'Imparare sull\'Hajj';

  @override
  String get journeyTask3_6 => 'Condividere l\'Islam con qualcuno';

  @override
  String get journeyTask3_7 => 'Completare il Glossario Islamico';

  @override
  String get journeyTimelineTitle => 'Il Mio Percorso';

  @override
  String get journeyCompleted => 'Completato';

  @override
  String get journeyInProgress => 'In Corso';

  @override
  String get journeyLocked => 'Bloccato';

  @override
  String get wuduThreeTimes => '3 volte';

  @override
  String get wuduDuaBefore => 'Du\'a prima del Wudu';

  @override
  String get wuduDuaAfter => 'Du\'a dopo il Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'Nel nome di Allah';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Attesto che non vi è divinità degna di adorazione se non Allah, Unico, senza associati, e attesto che Muhammad è il Suo servo e messaggero. O Allah, rendimi tra coloro che si pentono e tra coloro che si purificano.';

  @override
  String get wuduCompleteButton => 'Ho completato il Wudu';

  @override
  String get howToPrayStepOpeningDua => 'Du\'a iniziale';

  @override
  String get howToPrayStepAlFatiha => 'Sura Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Sura breve';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (seduta intermedia)';

  @override
  String get howToPrayStepSalawat => 'Salawat sul Profeta ﷺ';

  @override
  String get howToPrayTransTakbir => 'Allah è il Più Grande';

  @override
  String get howToPrayTransOpeningDua =>
      'Gloria a Te, o Allah, e con la Tua lode; benedetto è il Tuo nome, esaltata è la Tua maestà, non c\'è dio all\'infuori di Te.';

  @override
  String get howToPrayTransFatiha =>
      'In nome di Allah, il Clemente, il Misericordioso. Ogni lode appartiene ad Allah, Signore dei mondi. Il Clemente, il Misericordioso. Sovrano del Giorno del Giudizio. Te solo adoriamo e Te solo imploriamo. Guidaci sulla retta via — la via di coloro che hai favorito, non di quelli che hanno attirato l\'ira, né degli sviati.';

  @override
  String get howToPrayTransRuku => 'Gloria al mio Signore, l\'Altissimo';

  @override
  String get howToPrayTransItidal =>
      'Allah ascolta chi Lo loda. Signore nostro, e a Te ogni lode.';

  @override
  String get howToPrayTransSujood => 'Gloria al mio Signore, il Più Eccelso';

  @override
  String get howToPrayTransJalsa => 'Signore mio, perdonami';

  @override
  String get howToPrayTransTashahhud =>
      'Tutti i saluti, le preghiere e le buone parole appartengono ad Allah. Pace su di te, o Profeta, e la misericordia di Allah e le Sue benedizioni. Pace su di noi e sui servi giusti di Allah. Testimonio che non c\'è dio all\'infuori di Allah e testimonio che Muhammad è il Suo servo e messaggero.';

  @override
  String get howToPrayTransSalawat =>
      'O Allah, invia la Tua grazia su Muhammad e sulla famiglia di Muhammad, come hai inviato la Tua grazia su Ibrahim e sulla famiglia di Ibrahim — Tu sei davvero il Più Degno di lode, il Più Glorioso. O Allah, benedici Muhammad e la famiglia di Muhammad, come hai benedetto Ibrahim e la famiglia di Ibrahim — Tu sei davvero il Più Degno di lode, il Più Glorioso.';

  @override
  String get howToPrayTransTasleem =>
      'La pace e la misericordia di Allah siano su di voi';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Recita questa invocazione sottovoce subito dopo il Takbir iniziale. Si recita una sola volta, all\'inizio della preghiera.';

  @override
  String get howToPraySurahInstruction =>
      'Dopo Al-Fatiha, recita la sura che conosci a memoria. La sura Al-Ikhlas (sopra) è perfetta per i principianti — si recita solo nelle prime due rak\'ah.';

  @override
  String get howToPrayItidalInstruction =>
      'Di\' \'Sami\' Allahu liman hamidah\' alzandoti, poi stai dritto prima di dire \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Siediti dopo la 2ª rak\'ah. Alza l\'indice destro durante la Shahada. Nelle preghiere di 3 e 4 rak\'ah, ti rialzerai dopo questa seduta.';

  @override
  String get howToPraySalawatInstruction =>
      'Recita il Salawat subito dopo il Tashahhud finale, solo nell\'ultima seduta, prima del Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Gira la testa a destra e di\' il Tasleem, poi a sinistra e ripeti. La tua preghiera è completata.';

  @override
  String get howToPrayOnceOpens => 'Una volta — apre la preghiera';

  @override
  String get howToPrayFirstRakahOnly => 'Solo 1ª rak\'ah';

  @override
  String get howToPrayFirst2RakahsOnly => 'Solo le prime 2 rak\'ah';

  @override
  String get howToPrayEveryRakah => 'Ogni rak\'ah';

  @override
  String get howToPrayAfter2ndRakah => 'Dopo la 2ª rak\'ah';

  @override
  String get howToPrayFinalSittingOnly => 'Solo seduta finale';

  @override
  String get howToPrayClosesThePrayer => 'Chiude la preghiera';

  @override
  String get howToPraySectionBefore => 'Prima di pregare';

  @override
  String get howToPraySectionRakah => 'Rak\'ah';

  @override
  String get howToPraySectionMiddleSitting => 'Seduta intermedia';

  @override
  String get howToPraySectionFinalSitting => 'Seduta finale';

  @override
  String get howToPrayRakahLabel => 'Rak\'ah';

  @override
  String get howToPrayCompleteButton => 'Ho completato la mia preghiera';

  @override
  String get howToPrayMashaallah => 'Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Che Allah accetti la tua preghiera.';

  @override
  String get fatihaIntroTitle => 'La Madre del Corano';

  @override
  String get fatihaIntroBody =>
      'La Surah Al-Fatiha è la surah più grande del Corano. Viene recitata in ogni unità di preghiera — almeno 17 volte al giorno. È una conversazione completa tra il servo e Allah, e un ingresso ad ogni preghiera.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir scrive: \'Al-Fatiha contiene l\'essenza dell\'intero Corano — è una preghiera, una dichiarazione di servitù e una richiesta di guida verso la Retta Via.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'La Shahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Testimonio che non c\'è divinità tranne Allah, e testimonio che Muhammad è il messaggero di Allah';

  @override
  String get shahadaWordBreakdownTitle => 'Parola per Parola';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'Non c\'è';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'divinità / dio';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'tranne';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (Dio solo)';

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
  String get shahadaWord6Meaning => 'Messaggero / Profeta';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'di Allah';

  @override
  String get shahadaMeaningTitle => 'Significato & Importanza';

  @override
  String get shahadaMeaningBody =>
      'La Shahada è la dichiarazione di fede che costituisce il fondamento dell\'Islam. È il primo dei Cinque Pilastri. Pronunciando queste parole con sincera convinzione, una persona entra nell\'Islam. Ibn Kathir spiega che la prima parte nega tutte le false divinità e afferma l\'assoluta unicità di Allah.';

  @override
  String get shahadaMomentTitle => 'Il Momento della Shahada';

  @override
  String get shahadaMomentBody =>
      'Quando una persona pronuncia la Shahada per la prima volta con vera fede nel cuore, accade qualcosa di profondo — inizia una nuova vita. Il Profeta ﷺ disse: \'Chiunque dica che non c\'è dio tranne Allah e non creda in nulla che sia adorato al di fuori di Lui, la sua ricchezza e il suo sangue sono protetti.\' (Sahih Muslim). Tutti i peccati passati sono perdonati. Benvenuto nell\'Islam.';

  @override
  String get shahadaPronunciationTitle => 'Guida alla Pronuncia';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Guida passo dopo passo';

  @override
  String get toolboxWuduSubtitle => 'Purificazione prima della preghiera';

  @override
  String get toolboxGlossarySubtitle => '114 termini islamici spiegati';

  @override
  String get shareSheetTitle => 'Condividi';

  @override
  String get shareAnAyah => 'Condividi un Ayah';

  @override
  String get shareADua => 'Condividi un Dua';

  @override
  String get shareANameOfAllah => 'Condividi un Nome di Allah';

  @override
  String get shareAHadith => 'Condividi un Hadith';

  @override
  String get shareViaLabel => 'Condiviso tramite Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Ayah del Giorno';

  @override
  String get shareCardDuaLabel => '✦ Dua';

  @override
  String get shareCardNameLabel => '✦ Nome di Allah';

  @override
  String get shareCardHadithLabel => '✦ Hadith';

  @override
  String get sharePickDuaTitle => 'Scegli un Dua da Condividere';

  @override
  String get shareError => 'Impossibile creare l\'immagine';

  @override
  String get shareCardVerseLabel => '✦ Versetto Coranico';

  @override
  String get shareCardAsmaLabel => '✦ Asma ul-Husna';

  @override
  String get shareAyahSubtitle => 'Scegli tra 30 versetti coranici';

  @override
  String get shareDuaSubtitle => 'Scegli dalla biblioteca';

  @override
  String get shareNameSubtitle => 'Scegli tra tutti i 99 Bellissimi Nomi';

  @override
  String get shareHadithSubtitle => 'Scegli tra 20 hadith autentici';

  @override
  String get shareThisDua => 'Condividi Questa Dua';

  @override
  String get sharePickAyahTitle => 'Scegli un Ayah da Condividere';

  @override
  String get searchAyahs => 'Cerca ayah…';

  @override
  String get noAyahsFoundShort => 'Nessun ayah trovato';

  @override
  String get shareThisAyah => 'Condividi Questo Ayah';

  @override
  String get sharePickNameTitle => 'Scegli un Nome da Condividere';

  @override
  String get shareThisName => 'Condividi Questo Nome';

  @override
  String get sharePickHadithTitle => 'Scegli un Hadith da Condividere';

  @override
  String get searchHadiths => 'Cerca hadith…';

  @override
  String get noHadithsFound => 'Nessun hadith trovato';

  @override
  String get shareThisHadith => 'Condividi Questo Hadith';

  @override
  String get backToBasics => 'Torna alle Basi';

  @override
  String get backToBasicsSubtitle => 'La tua guida ai fondamenti dell\'Islam';

  @override
  String get fivePillarsOfIslam => 'I 5 Pilastri dell\'Islam';

  @override
  String get fivePillarsSubtitle => 'I fondamenti della fede islamica';

  @override
  String get pillarLearnMore => 'Per saperne di più';

  @override
  String get pillarShowLess => 'Mostra meno';

  @override
  String get pillarsShowDetails => 'Mostra dettagli';

  @override
  String get pillarsHideDetails => 'Nascondi dettagli';

  @override
  String get pillar1Name => 'Shahada';

  @override
  String get pillar1Desc => 'Dichiarazione di Fede';

  @override
  String get pillar1Detail =>
      'La dichiarazione di fede e il fondamento dell\'Islam. Dicendo sinceramente \'Non c\'e dio all\'infuori di Allah e Muhammad e il Suo messaggero\', una persona entra nell\'Islam.';

  @override
  String get pillar2Name => 'Salah';

  @override
  String get pillar2Desc => 'Le Cinque Preghiere Quotidiane';

  @override
  String get pillar2Detail =>
      'Le cinque preghiere quotidiane sono il collegamento diretto tra un musulmano e Allah. Eseguite all\'alba, a mezzogiorno, nel pomeriggio, al tramonto e di notte, strutturano l\'intera giornata del musulmano attorno al ricordo di Allah.';

  @override
  String get pillar3Name => 'Zakat';

  @override
  String get pillar3Desc => 'Elemosina Obbligatoria';

  @override
  String get pillar3Detail =>
      'La Zakat e la carita annuale obbligatoria del 2,5% dei propri risparmi per i bisognosi. Purifica la ricchezza e rafforza i legami della comunita musulmana.';

  @override
  String get pillar4Name => 'Sawm';

  @override
  String get pillar4Desc => 'Digiuno nel Ramadan';

  @override
  String get pillar4Detail =>
      'Il digiuno durante il benedetto mese di Ramadan dall\'alba al tramonto. I musulmani si astengono da cibo, bevande e peccato per raggiungere la taqwa (consapevolezza di Dio) e la gratitudine.';

  @override
  String get pillar5Name => 'Hajj';

  @override
  String get pillar5Desc => 'Pellegrinaggio alla Mecca';

  @override
  String get pillar5Detail =>
      'Il pellegrinaggio alla Mecca e obbligatorio una volta nella vita per ogni musulmano fisicamente ed economicamente in grado di farlo. E la piu grande adunanza annuale di persone sulla terra.';

  @override
  String get switchedToNewMuslimMode => 'Passato alla modalità Nuovo Musulmano';

  @override
  String get switchedToRegularMode => 'Passato alla modalità Normale';

  @override
  String get liveNotifChannelName => 'Noor Guard Live';

  @override
  String get liveNotifChannelDescription =>
      'Conto alla rovescia della preghiera e contenuti islamici quotidiani sulla schermata di blocco';

  @override
  String get liveNotifHeaderAyah => 'AYAH DEL GIORNO';

  @override
  String get liveNotifHeaderDua => 'DUA DEL GIORNO';

  @override
  String get liveNotifHeaderWord => 'PAROLA DEL GIORNO';

  @override
  String get liveNotifHeaderName => 'NOME DI ALLAH';

  @override
  String get liveNotifHeaderHadith => 'HADITH DEL GIORNO';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'tra ${hours}h ${minutes}min';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'tra ${minutes}min';
  }

  @override
  String get liveNotifCountdownNow => 'È ora di pregare';

  @override
  String get savedDuas => 'Dua salvate';

  @override
  String get savedVerses => 'Versetti salvati';

  @override
  String get savedNames => 'Nomi salvati';

  @override
  String get noSavedDuas => 'Nessuna dua salvata';

  @override
  String get noSavedVerses => 'Nessun versetto salvato';

  @override
  String get noSavedNames => 'Nessun nome salvato';

  @override
  String get heroVerse16 =>
      'Signore nostro, non punirci se dimentichiamo o sbagliamo.';

  @override
  String get heroVerse17 => 'Allah ci basta, ed Egli è il miglior Garante.';

  @override
  String get heroVerse18 =>
      'O voi che credete, credete in Allah e nel Suo Messaggero.';

  @override
  String get heroVerse19 =>
      'O voi che credete, temete Allah e cercate il mezzo per avvicinarvi a Lui.';

  @override
  String get heroVerse20 =>
      'In verità la mia preghiera, il mio sacrificio, la mia vita e la mia morte appartengono ad Allah, Signore dei mondi.';

  @override
  String get heroVerse21 =>
      'Decreta per noi il bene in questa vita e nell\'altra; a Te siamo tornati.';

  @override
  String get heroVerse22 =>
      'Ricordate Allah spesso, affinché possiate prosperare.';

  @override
  String get heroVerse23 =>
      'Nulla ci colpirà se non ciò che Allah ha decretato per noi; Egli è il nostro Protettore.';

  @override
  String get heroVerse24 =>
      'In verità, gli amici di Allah non avranno timore e non saranno afflitti.';

  @override
  String get heroVerse25 =>
      'Il mio successo viene solo da Allah; in Lui confido e a Lui mi rivolgo.';

  @override
  String get heroVerse26 => 'Non disperate della misericordia di Allah.';

  @override
  String get heroVerse27 =>
      'Coloro che credono e i cui cuori si acquietano nel ricordo di Allah.';

  @override
  String get heroVerse28 =>
      'E quando il vostro Signore proclamò: Se sarete riconoscenti, vi darò certamente di più.';

  @override
  String get heroVerse29 =>
      'E adora il tuo Signore finché non ti giunga la certezza.';

  @override
  String get heroVerse30 =>
      'In verità Allah è con coloro che Lo temono e con coloro che fanno il bene.';

  @override
  String get focusButtonSubtitle => 'Proteggi il tuo tempo per ciò che conta';

  @override
  String get ourStories => 'Le nostre storie';

  @override
  String get storiesSeeAll => 'Vedi tutte';

  @override
  String get storiesReadMore => 'Leggi di più';

  @override
  String get storiesFeaturedLabel => 'Storia in evidenza';

  @override
  String get storiesFilterReverts => 'Convertiti';

  @override
  String get storyCategoryRevert => 'Convertito';

  @override
  String get storyCategoryBornMuslim => 'Musulmano dalla nascita';

  @override
  String get storyCategoryReturning => 'Di ritorno';

  @override
  String get storiesShareYours => 'Condividi la tua';

  @override
  String get storiesEmptyTitle => 'Ancora nessuna storia';

  @override
  String get storiesEmptySubtitle =>
      'Sii il primo a condividere il tuo cammino';

  @override
  String storyShahadaDate(Object date) {
    return 'Shahada: $date';
  }

  @override
  String get storiesComments => 'Commenti';

  @override
  String get storiesAddComment => 'Aggiungi un commento…';

  @override
  String get storiesAnonymous => 'Anonimo';

  @override
  String get storiesNameLabel => 'Il tuo nome';

  @override
  String get storiesPostAnonymously => 'Pubblica in anonimo';

  @override
  String get storiesCountryLabel => 'Paese';

  @override
  String get storiesCategoryLabel => 'Categoria';

  @override
  String get storiesShahadaDateLabel => 'Data della Shahada (facoltativa)';

  @override
  String get storiesYourStoryLabel => 'La tua storia';

  @override
  String get storiesStoryHint => 'Raccontaci il tuo cammino…';

  @override
  String get storiesChooseBackground => 'Scegli uno sfondo';

  @override
  String get storiesBackgroundNone => 'Nessuno';

  @override
  String get storiesEditTitle => 'Modifica la tua storia';

  @override
  String get storiesSaveChanges => 'Salva modifiche';

  @override
  String get storiesUpdated => 'La tua storia è stata aggiornata';

  @override
  String get storiesUploadPhoto => 'Carica foto (facoltativa)';

  @override
  String get storiesChangePhoto => 'Cambia foto';

  @override
  String get storiesSubmitButton => 'Invia';

  @override
  String get storiesSubmitted =>
      'JazakAllah khair! La tua storia è stata inviata per la revisione.';

  @override
  String get storiesSubmitError => 'Qualcosa è andato storto. Riprova.';

  @override
  String get storiesFillRequired => 'Aggiungi la tua storia e il tuo paese.';

  @override
  String get storiesShareCardLabel => 'Storia della comunità';

  @override
  String get storiesPreviewLabel => 'Anteprima';

  @override
  String get storiesPendingReview => 'In revisione';

  @override
  String get storiesFilterSaved => 'Salvate';

  @override
  String get storiesSavedEmpty => 'Nessuna storia salvata';

  @override
  String get storiesSearchCountryHint => 'Cerca il paese…';

  @override
  String get storiesLoadError =>
      'Impossibile caricare le storie. Controlla la connessione.';
}
