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
  String get appBlockingIPrayedButton => 'Ho pregato';

  @override
  String get appBlockingReadAyahsButton => 'Leggi 3 versetti';

  @override
  String get appBlockingEmergencyBypass => 'Uscita di emergenza';

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
}
