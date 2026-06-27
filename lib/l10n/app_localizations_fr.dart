// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Qu\'Allah bénisse ta journée';

  @override
  String get nextPrayer => 'Prochaine Prière';

  @override
  String get iPrayedButton => 'J\'ai prié';

  @override
  String get todaysPrayers => 'Prières du Jour';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Mode Concentration';

  @override
  String get appBlocking => 'Blocage d\'Applications';

  @override
  String get islamicCalendar => 'Calendrier Islamique';

  @override
  String get duas => 'Douas';

  @override
  String get quran => 'Coran';

  @override
  String get settings => 'Paramètres';

  @override
  String get complete => 'Valider';

  @override
  String get streak => 'Série';

  @override
  String get dayStreak => 'jours de suite';

  @override
  String get compassRequiresDevice => 'La boussole nécessite un appareil réel';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '$count jour',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Toutes les prières accomplies ! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 prières accomplies';
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
    return '$count rakats obligatoires';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah avant';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah après';
  }

  @override
  String prayedAt(String time) {
    return 'Priée à $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'l\'aube avant le lever du soleil';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'après que le soleil passe son point le plus haut';

  @override
  String get timePeriodLateAfternoon => 'en fin d\'après-midi';

  @override
  String get timePeriodJustAfterSunset => 'juste après le coucher du soleil';

  @override
  String get timePeriodNightBeforeMidnight => 'dans la nuit avant minuit';

  @override
  String get fajrHadith =>
      'Les deux rakats du Fajr sont meilleures que le bas monde et tout ce qu\'il contient. — Prophète Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Le Fajr est la première prière de la journée. Elle nous rappelle de commencer notre journée en nous souvenant d\'Allah.';

  @override
  String get dhuhrHadith =>
      'Quiconque prie les douze rakats sunnah, Allah lui construira une maison au Paradis.';

  @override
  String get dhuhrTip =>
      'Le Dhuhr est la prière de la mi-journée. Un moment idéal pour faire une pause et se reconnecter.';

  @override
  String get asrHadith =>
      'Quiconque manque la prière de l\'Asr, c\'est comme s\'il avait perdu sa famille et ses biens. — Prophète Muhammad ﷺ';

  @override
  String get asrTip =>
      'L\'Asr est souvent appelée la prière du milieu. Allah la mentionne spécifiquement dans le Coran (2:238).';

  @override
  String get maghribHadith => 'La prière du Maghrib est le Witr de la journée.';

  @override
  String get maghribTip =>
      'Le Maghrib marque la fin de la journée de jeûne pendant le Ramadan. Elle est priée juste au coucher du soleil.';

  @override
  String get ishaHadith =>
      'Quiconque prie l\'Isha en groupe, c\'est comme s\'il avait prié la moitié de la nuit.';

  @override
  String get ishaTip =>
      'L\'Isha est la dernière prière de la journée. Terminer sa journée par la prière apporte paix et apaisement.';

  @override
  String get newMuslimTip => 'Conseil pour nouveaux musulmans';

  @override
  String get notificationsOn => 'Notifications activées';

  @override
  String get notificationsOff => 'Notifications désactivées';

  @override
  String get preview => 'Aperçu';

  @override
  String get lockPreviewCountdown => 'Dans 1h 23min  ·  16h47';

  @override
  String get swipeUpToUnlock => 'Glissez vers le haut pour déverrouiller';

  @override
  String get searchSurahs => 'Rechercher des sourates…';

  @override
  String get noSurahsFound => 'Aucune sourate trouvée';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String ayahs(int count) {
    return '$count versets';
  }

  @override
  String get searchDuas => 'Rechercher des douas…';

  @override
  String supplications(int count) {
    return '$count invocations';
  }

  @override
  String get prayerSettings => 'Paramètres des Prières';

  @override
  String get calculationMethod => 'Méthode de Calcul';

  @override
  String get adhanSound => 'Son de l\'Adhan';

  @override
  String get prayerNotifications => 'Notifications de Prière';

  @override
  String get statusOn => 'Activé';

  @override
  String get statusOff => 'Désactivé';

  @override
  String get enableAllNotifications => 'Activer toutes les notifications';

  @override
  String get individualPrayers => 'Prières Individuelles';

  @override
  String get appearance => 'Apparence';

  @override
  String get darkMode => 'Mode Sombre';

  @override
  String get language => 'Langue';

  @override
  String get aboutNoorGuard => 'À propos';

  @override
  String get version => 'Version de l\'App';

  @override
  String get rateApp => 'Évaluer Noor Guard';

  @override
  String get shareApp => 'Partager Noor Guard';

  @override
  String get contactSupport => 'Contacter le Support';

  @override
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get termsOfService => 'Conditions d\'Utilisation';

  @override
  String get helpUsImprove => 'Aidez-nous à Nous Améliorer';

  @override
  String get translationDisclaimer =>
      'Nos traductions sont assistées par IA. Si tu remarques des erreurs dans ta langue, nous serions ravis d\'avoir ton avis !';

  @override
  String get privacyPromiseTitle =>
      'L\'Engagement de Confidentialité de Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Ta foi est personnelle. Tes données aussi. Nous ne vendons, ne partageons et ne monétisons jamais tes données. Ni ta localisation. Ni tes habitudes de prière. Ni ton nom.';

  @override
  String get directionToSacredHouse => 'Direction de la Maison Sacrée';

  @override
  String towardMecca(String degrees) {
    return '$degrees° vers La Mecque';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (par défaut)';

  @override
  String get prayerHistory => 'Historique des Prières';

  @override
  String get currentStreak => 'Série Actuelle';

  @override
  String get longestStreak => 'Meilleure Série';

  @override
  String get legend => 'Légende';

  @override
  String get allFivePrayers => 'Les 5 prières';

  @override
  String get partialPrayers => 'Partiel (1–4)';

  @override
  String get none => 'Aucune';

  @override
  String get sun => 'Dim';

  @override
  String get mon => 'Lun';

  @override
  String get tue => 'Mar';

  @override
  String get wed => 'Mer';

  @override
  String get thu => 'Jeu';

  @override
  String get fri => 'Ven';

  @override
  String get sat => 'Sam';

  @override
  String headingDegrees(String degrees) {
    return 'Cap $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Impossible de charger les sourates';

  @override
  String get connectionError =>
      'Veuillez vérifier votre connexion internet et réessayer';

  @override
  String get alQuran => 'Al-Coran';

  @override
  String get dailySupplications => 'Invocations Quotidiennes';

  @override
  String get all => 'Toutes';

  @override
  String get noDuasFound => 'Aucune invocation trouvée';

  @override
  String get january => 'janvier';

  @override
  String get february => 'février';

  @override
  String get march => 'mars';

  @override
  String get april => 'avril';

  @override
  String get may => 'mai';

  @override
  String get june => 'juin';

  @override
  String get july => 'juillet';

  @override
  String get august => 'août';

  @override
  String get september => 'septembre';

  @override
  String get october => 'octobre';

  @override
  String get november => 'novembre';

  @override
  String get december => 'décembre';

  @override
  String get home => 'Accueil';

  @override
  String get prayers => 'Prières';

  @override
  String get more => 'Plus';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Écran de verrouillage';

  @override
  String get readAndListen => 'Lire et écouter';

  @override
  String get commentary => 'Commentaire';

  @override
  String get findDirection => 'Trouver la direction';

  @override
  String get reminders => 'Rappels';

  @override
  String get blockDistractions => 'Bloquer les distractions';

  @override
  String get prayerGuard => 'Gardien de prière';

  @override
  String get importantDates => 'Dates importantes';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get morningAndEvening => 'Matin et soir';

  @override
  String get prayer => 'Prière';

  @override
  String get foodAndDrink => 'Nourriture et boissons';

  @override
  String get verityWithHardship =>
      'En vérité, avec la difficulté vient la facilité.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Soyez assidus à vos prières, et surtout à la prière du milieu.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Événements passés';

  @override
  String get upcomingEvents => 'Événements à venir';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get next => 'Prochain';

  @override
  String hijriYearLabel(int year) {
    return '$year H';
  }

  @override
  String get islamicMonthMuharram => 'Mouharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabī\' al-Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabī\' al-Thani';

  @override
  String get islamicMonthJumadaAlAwwal => 'Joumada al-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Joumada al-Thani';

  @override
  String get islamicMonthRajab => 'Rajab';

  @override
  String get islamicMonthShaban => 'Chaabane';

  @override
  String get islamicMonthRamadan => 'Ramadan';

  @override
  String get islamicMonthShawwal => 'Chawwal';

  @override
  String get islamicMonthDhulQadah => 'Dhou al-Qi\'da';

  @override
  String get islamicMonthDhulHijjah => 'Dhou al-Hijja';

  @override
  String get islamicNewYear => 'Nouvel An Islamique';

  @override
  String get ashura => 'Achoura';

  @override
  String get mawlidAlNabi => 'Mawlid An-Nabi';

  @override
  String get ramadanBegins => 'Début du Ramadan';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Aïd al-Fitr';

  @override
  String get dayOfArafah => 'Jour d\'Arafat';

  @override
  String get eidAlAdha => 'Aïd al-Adha';

  @override
  String get active => 'Actif';

  @override
  String get focusModeSubtitle =>
      'Protège ta concentration. Tes applications restent bloquées jusqu\'à l\'arrêt de la session.';

  @override
  String get remaining => 'restant';

  @override
  String get ready => 'prêt';

  @override
  String get duration => 'Durée';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Bloquées pendant la concentration';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count applications',
      one: '$count application',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Démarrer la concentration';

  @override
  String get stopFocus => 'Arrêter la concentration';

  @override
  String get alhamdulillah => 'Alhamdulillah !';

  @override
  String get sessionComplete => 'Session terminée';

  @override
  String stayedFocusedFor(String duration) {
    return 'Tu es resté concentré pendant $duration.';
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
      '« Et cherchez secours dans l\'endurance et la prière. »\n— Al-Baqarah 2:45';

  @override
  String get done => 'Terminé';

  @override
  String get socialMedia => 'Réseaux Sociaux';

  @override
  String get entertainment => 'Divertissement';

  @override
  String get games => 'Jeux';

  @override
  String get messaging => 'Messagerie';

  @override
  String get blockDuringPrayerTimes => 'Bloquer pendant les horaires de prière';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Les applications sélectionnées seront bloquées automatiquement\npendant les 5 prières quotidiennes.';

  @override
  String get blockedLabel => 'bloquées';

  @override
  String get blockAllApps => 'Bloquer toutes les applications';

  @override
  String get blockingTimingInfo =>
      'Le blocage s\'active 5 minutes avant chaque prière et se lève 15 minutes après.';

  @override
  String get blockedDuringPrayers => 'Bloquée pendant les prières';

  @override
  String get notBlocked => 'Non bloquée';

  @override
  String get wuduStep1 => 'Intention';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Laver les mains';

  @override
  String get wuduStep4 => 'Rincer la bouche';

  @override
  String get wuduStep5 => 'Nettoyer le nez';

  @override
  String get wuduStep6 => 'Laver le visage';

  @override
  String get wuduStep7 => 'Laver les bras';

  @override
  String get wuduStep8 => 'Essuyer la tête';

  @override
  String get wuduStep9 => 'Laver les pieds';

  @override
  String get revertCorner => 'Coin du Converti';

  @override
  String get revertCornerSubtitle =>
      'Guides et accompagnement pour les nouveaux musulmans';

  @override
  String get wuduGuide => 'Guide des Ablutions';

  @override
  String get howToPray => 'Comment Prier';

  @override
  String get newMuslimChecklist => 'Liste du Nouveau Musulman';

  @override
  String get islamicGlossary => 'Glossaire Islamique';

  @override
  String get whyDoWe => 'Pourquoi faisons-nous...';

  @override
  String get communityStories => 'Témoignages de la Communauté';

  @override
  String get wuduGuideSubtitle => 'Purification avant la prière';

  @override
  String get howToPraySubtitle => 'Guide pas à pas de la salat';

  @override
  String get newMuslimChecklistSubtitle => 'Ton parcours de 30 jours';

  @override
  String get howToPrayStep1Name => 'D\'abord les Ablutions';

  @override
  String get howToPrayStep1Instruction =>
      'Effectue les ablutions (woudou) afin d\'être en état de pureté avant de commencer à prier.';

  @override
  String get howToPrayStep1Tip =>
      'Si tu n\'es pas sûr de la marche à suivre, ouvre d\'abord le Guide des Ablutions depuis le Centre du Nouveau Musulman.';

  @override
  String get howToPrayStep2Name => 'Tiens-toi Face à la Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Tiens-toi sur ton tapis de prière en faisant face à la Qibla — la direction de la Kaaba à La Mecque. Utilise la boussole Qibla de l\'application pour trouver la direction exacte.';

  @override
  String get howToPrayStep2Tip =>
      'Ce n\'est pas grave si tu es légèrement décalé — Allah connaît ton intention. Fais de ton mieux.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intention)';

  @override
  String get howToPrayStep3Instruction =>
      'Formule dans ton cœur l\'intention de la prière que tu vas accomplir. Tu n\'as pas besoin de la dire à voix haute.';

  @override
  String get howToPrayStep3Tip =>
      'Ton intention est entre toi et Allah. Une simple pensée comme « Je prie le Fajr pour Allah » suffit.';

  @override
  String get howToPrayStep4Name => 'Takbir (Ouverture)';

  @override
  String get howToPrayStep4Instruction =>
      'Lève les deux mains au niveau des lobes d\'oreilles et dis « Allahu Akbar » (Allah est le Plus Grand). Cela débute officiellement ta prière.';

  @override
  String get howToPrayStep4Tip =>
      'Garde le regard fixé vers ton lieu de prosternation pendant toute la prière.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Position Debout)';

  @override
  String get howToPrayStep5Instruction =>
      'Place ta main droite sur ta main gauche au niveau de la poitrine. Récite la sourate Al-Fatiha suivie de toute autre courte sourate ou verset que tu connais.';

  @override
  String get howToPrayStep5Tip =>
      'Si tu ne connais pas encore d\'autre sourate, réciter Al-Fatiha seule est acceptable pendant ton apprentissage.';

  @override
  String get howToPrayStep6Name => 'Rouku\' (Inclinaison)';

  @override
  String get howToPrayStep6Instruction =>
      'Incline-toi en pliant à la taille, le dos parallèle au sol. Place tes mains sur tes genoux et dis « Subhana Rabbiyal Adhim » trois fois.';

  @override
  String get howToPrayStep6Tip =>
      'Garde le dos droit et horizontal — ni courbé ni arrondi.';

  @override
  String get howToPrayStep7Name =>
      'I\'tidal (Redressement après l\'Inclinaison)';

  @override
  String get howToPrayStep7Instruction =>
      'Relève-toi de l\'inclinaison et tiens-toi droit. Dis « Sami Allahu liman hamidah » en te relevant, puis dis « Rabbana lakal hamd ».';

  @override
  String get howToPrayStep7Tip =>
      'Tiens-toi complètement droit et reste immobile un instant avant de passer à la position suivante.';

  @override
  String get howToPrayStep8Name => 'Soujoud (Prosternation)';

  @override
  String get howToPrayStep8Instruction =>
      'Descends au sol en posant ton front, ton nez, tes deux paumes, tes genoux et tes orteils sur le sol. Dis « Subhana Rabbiyal A\'la » trois fois.';

  @override
  String get howToPrayStep8Tip =>
      'Sept parties du corps doivent toucher le sol : le front (avec le nez), les deux mains, les deux genoux et les deux pieds.';

  @override
  String get howToPrayStep9Name =>
      'Jalsa (Position Assise entre les Prosternations)';

  @override
  String get howToPrayStep9Instruction =>
      'Relève-toi de la prosternation en t\'asseyant, le pied gauche à plat et le pied droit dressé. Dis « Allahu Akbar » en t\'asseyant. Marque une courte pause, puis redescends pour la seconde prosternation.';

  @override
  String get howToPrayStep9Tip =>
      'Cette courte position assise entre les deux prosternations s\'appelle la Jalsa. C\'est une partie obligatoire de la prière.';

  @override
  String get howToPrayStep10Name => 'Termine les Unités de Prière';

  @override
  String get howToPrayStep10Instruction =>
      'Après avoir terminé le premier rakat, lève-toi et répète les mêmes étapes pour le second rakat. Le nombre de rakats dépend de la prière que tu accomplis.';

  @override
  String get howToPrayStep10Tip =>
      'Le Fajr compte 2 rakats, le Dhuhr 4, l\'Asr 4, le Maghrib 3 et l\'Isha 4. Fais-le un rakat à la fois.';

  @override
  String get howToPrayStep11Name => 'Tachahhoud (Position Assise Finale)';

  @override
  String get howToPrayStep11Instruction =>
      'Dans la position assise finale, récite le Tachahhoud. C\'est une déclaration de foi que tu récites assis après ton dernier rakat.';

  @override
  String get howToPrayStep11Tip =>
      'Pendant le Tachahhoud, lève l\'index droit en disant « Ash-hadou alla ilaha illa Allah » en signe de l\'unicité d\'Allah.';

  @override
  String get howToPrayStep12Name => 'Taslim (Clôture)';

  @override
  String get howToPrayStep12Instruction =>
      'Tourne la tête vers la droite et dis « Assalamou Alaikoum wa Rahmatoullah », puis tourne vers la gauche et répète. Cela termine ta prière.';

  @override
  String get howToPrayStep12Tip =>
      'Après la prière, prends un moment pour faire une doua (invocation) et demande à Allah ce dont tu as besoin. C\'est un beau moment pour te connecter à Allah.';

  @override
  String get checklistWeek1Title => 'Semaine 1';

  @override
  String get checklistWeek2Title => 'Semaine 2';

  @override
  String get checklistWeek3Title => 'Semaine 3';

  @override
  String get checklistWeek4Title => 'Semaine 4';

  @override
  String get checklistWeek1Item1 => 'Prononcer la Chahada';

  @override
  String get checklistWeek1Item2 => 'Apprendre les ablutions';

  @override
  String get checklistWeek1Item3 => 'Apprendre Al-Fatiha';

  @override
  String get checklistWeek1Item4 => 'Prier ton premier Fajr';

  @override
  String get checklistWeek1Item5 => 'Te procurer un tapis de prière';

  @override
  String get checklistWeek1Item6 => 'Trouver une mosquée près de chez toi';

  @override
  String get checklistWeek2Item1 => 'Apprendre les 5 horaires de prière';

  @override
  String get checklistWeek2Item2 => 'Apprendre des douas de base';

  @override
  String get checklistWeek2Item3 => 'Lire sur la vie du Prophète Muhammad';

  @override
  String get checklistWeek2Item4 => 'Te rapprocher de la communauté musulmane';

  @override
  String get checklistWeek3Item1 => 'Apprendre ce qu\'est la nourriture halal';

  @override
  String get checklistWeek3Item2 => 'Lire la sourate Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Apprendre ce qu\'est le Ramadan';

  @override
  String get checklistWeek3Item4 => 'Commencer le dhikr quotidien';

  @override
  String get checklistWeek4Item1 => 'Apprendre ce qu\'est la Zakat';

  @override
  String get checklistWeek4Item2 => 'Lire sur les 5 piliers';

  @override
  String get checklistWeek4Item3 => 'Configurer les notifications de prière';

  @override
  String get checklistWeek4Item4 => 'Faire le bilan de ton parcours';

  @override
  String get wuduStep1Instruction =>
      'Formule dans ton cœur l\'intention d\'accomplir le woudou pour la satisfaction d\'Allah.';

  @override
  String get wuduStep1Tip =>
      'Inutile de le dire à voix haute — une intention sincère dans le cœur suffit.';

  @override
  String get wuduStep2Instruction =>
      'Dis Bismillah (Au nom d\'Allah) avant de commencer.';

  @override
  String get wuduStep2Tip =>
      'Dire Bismillah est une sunnah et commence ton woudou par le souvenir d\'Allah.';

  @override
  String get wuduStep3Instruction =>
      'Lave les deux mains jusqu\'aux poignets trois fois, en veillant à ce que l\'eau atteigne entre les doigts.';

  @override
  String get wuduStep3Tip =>
      'Commence par la main droite, puis la gauche. Cet ordre est recommandé en Islam.';

  @override
  String get wuduStep4Instruction =>
      'Prends de l\'eau dans la bouche, fais-la circuler puis recrache-la. Fais cela trois fois.';

  @override
  String get wuduStep4Tip =>
      'Cela nettoie la bouche et fait partie du processus de purification.';

  @override
  String get wuduStep5Instruction =>
      'Aspire de l\'eau par le nez et souffle-la doucement. Fais cela trois fois.';

  @override
  String get wuduStep5Tip =>
      'Utilise ta main droite pour aspirer l\'eau et ta main gauche pour la rejeter.';

  @override
  String get wuduStep6Instruction =>
      'Lave tout ton visage trois fois, du haut du front jusqu\'au menton et d\'une oreille à l\'autre.';

  @override
  String get wuduStep6Tip =>
      'Assure-toi qu\'aucune partie de ton visage ne reste sèche.';

  @override
  String get wuduStep7Instruction =>
      'Lave ton bras droit du bout des doigts jusqu\'au coude trois fois, puis fais de même avec le bras gauche.';

  @override
  String get wuduStep7Tip =>
      'Commence toujours par le côté droit avant le gauche pendant le woudou.';

  @override
  String get wuduStep8Instruction =>
      'Mouille tes mains et passe-les sur toute ta tête une fois, d\'avant en arrière puis d\'arrière en avant.';

  @override
  String get wuduStep8Tip =>
      'Contrairement au lavage, l\'essuyage de la tête se fait une seule fois.';

  @override
  String get wuduStep9Instruction =>
      'Lave ton pied droit jusqu\'à la cheville incluse trois fois, puis fais de même avec le pied gauche.';

  @override
  String get wuduStep9Tip =>
      'Assure-toi que l\'eau atteigne entre les orteils. Utilise ton doigt pour nettoyer entre eux.';

  @override
  String get islamicGlossaryTitle => 'Glossaire Islamique';

  @override
  String get islamicGlossarySubtitle =>
      '51 termes issus du Coran, de la Sunnah et de l\'érudition classique';

  @override
  String get searchTermsHint =>
      'Rechercher des termes, en arabe, des définitions...';

  @override
  String get categoryAll => 'Tout';

  @override
  String get categoryPillar => 'Pilier';

  @override
  String get categoryAqeedah => 'Aqida';

  @override
  String get categoryPractice => 'Pratique';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Coran';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Histoire';

  @override
  String get noTermsFound => 'Aucun terme trouvé';

  @override
  String get sourceLabel => 'Source';

  @override
  String get revertCornerHubSubtitle =>
      'Un espace bienveillant pour t\'accompagner dans tes premiers pas en tant que nouveau musulman';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Les termes courants expliqués simplement';

  @override
  String get whyDoWeHubSubtitle =>
      'La sagesse derrière les pratiques quotidiennes';

  @override
  String get communityStoriesHubSubtitle =>
      'Des convertis racontent leur cheminement vers l\'Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'La sagesse derrière 12 pratiques islamiques quotidiennes';

  @override
  String get whyDoWeSourceBadge => 'Source Sunnite';

  @override
  String get whyDoWeQ1 => 'Pourquoi prions-nous 5 fois par jour ?';

  @override
  String get whyDoWeA1 =>
      'Allah a ordonné les cinq prières quotidiennes dans le Coran (2:238) et elles ont été instaurées lors du Voyage Nocturne (Isra wal Mi\'raj). Le Prophète ﷺ a dit : « La première chose sur laquelle le serviteur sera questionné le Jour du Jugement est la prière. » (Ibn Majah). La prière nous maintient connectés à Allah tout au long de la journée.';

  @override
  String get whyDoWeQ2 =>
      'Pourquoi nous orientons-nous vers La Mecque pendant la prière ?';

  @override
  String get whyDoWeA2 =>
      'Allah a ordonné dans le Coran (2:144) : « Tourne ton visage vers la Mosquée Sacrée. » La Kaaba à La Mecque est la première maison construite pour l\'adoration d\'Allah (3:96). Se tourner dans la même direction unit tous les musulmans dans la prière à travers le monde.';

  @override
  String get whyDoWeQ3 => 'Pourquoi jeûnons-nous pendant le Ramadan ?';

  @override
  String get whyDoWeA3 =>
      'Allah a prescrit le jeûne dans le Coran (2:183) : « Ô vous qui croyez ! Le jeûne vous a été prescrit comme il a été prescrit à ceux qui vous ont précédés, afin que vous atteigniez la piété (taqwa). » Le Ramadan est le mois où le Coran a été révélé (2:185).';

  @override
  String get whyDoWeQ4 => 'Pourquoi disons-nous Bismillah avant de manger ?';

  @override
  String get whyDoWeA4 =>
      'Le Prophète ﷺ a dit : « Quand l\'un de vous mange, qu\'il mentionne le nom d\'Allah. S\'il l\'oublie au début, qu\'il dise : Bismillah au début et à la fin. » (Abou Dawoud). Cela nous rappelle que toutes les bénédictions viennent d\'Allah.';

  @override
  String get whyDoWeQ5 =>
      'Pourquoi enlevons-nous nos chaussures avant d\'entrer dans une mosquée ?';

  @override
  String get whyDoWeA5 =>
      'Lorsqu\'Allah ordonna à Moïse : « Retire tes sandales, car tu es dans la vallée sacrée de Tuwa. » (Coran 20:12). Enlever ses chaussures montre du respect envers la maison d\'Allah et garde le lieu de prière propre.';

  @override
  String get whyDoWeQ6 =>
      'Pourquoi disons-nous Assalamu Alaikum comme salutation ?';

  @override
  String get whyDoWeA6 =>
      'Le Prophète ﷺ a dit : « Vous n\'entrerez pas au Paradis tant que vous ne croirez pas, et vous ne croirez pas tant que vous ne vous aimerez pas les uns les autres. Voulez-vous que je vous indique une chose qui, si vous l\'accomplissez, vous fera vous aimer les uns les autres ? Répandez le salut entre vous. » (Mouslim). C\'est aussi une doua — tu pries pour la paix de cette personne.';

  @override
  String get whyDoWeQ7 => 'Pourquoi accomplissons-nous le Hajj ?';

  @override
  String get whyDoWeA7 =>
      'Le Hajj a été ordonné par Allah (3:97) : « Le pèlerinage à cette Maison est un devoir envers Allah pour quiconque en a les moyens. » Il commémore les épreuves du Prophète Ibrahim ﷺ et de sa famille, et unit les musulmans de toutes les nations dans l\'adoration.';

  @override
  String get whyDoWeQ8 => 'Pourquoi versons-nous la Zakat ?';

  @override
  String get whyDoWeA8 =>
      'La Zakat est le troisième pilier de l\'Islam, mentionnée dans le Coran plus de 30 fois aux côtés de la prière. Le Prophète ﷺ a dit qu\'elle purifie la richesse. Elle réduit les inégalités et rappelle aux croyants que la richesse appartient à Allah.';

  @override
  String get whyDoWeQ9 =>
      'Pourquoi disons-nous Alhamdulillah après avoir éternué ?';

  @override
  String get whyDoWeA9 =>
      'Le Prophète ﷺ a dit : « Quand l\'un de vous éternue, qu\'il dise Alhamdulillah, et que son frère lui dise Yarhamoukallah. » (Boukhari). C\'est un moment de gratitude envers Allah pour le bienfait de la santé.';

  @override
  String get whyDoWeQ10 =>
      'Pourquoi les femmes musulmanes portent-elles le hijab ?';

  @override
  String get whyDoWeA10 =>
      'Allah a ordonné dans le Coran (24:31) que les croyantes préservent leur pudeur. Le hijab est un acte d\'adoration et d\'obéissance envers Allah. Beaucoup de femmes musulmanes le portent comme source d\'identité, de dignité et de connexion spirituelle.';

  @override
  String get whyDoWeQ11 => 'Pourquoi évitons-nous le porc et l\'alcool ?';

  @override
  String get whyDoWeA11 =>
      'Allah a interdit le porc dans le Coran (2:173) et l\'alcool en (5:90), les qualifiant d\'« abomination, œuvre du diable. » Ces interdictions protègent la santé, l\'esprit et la famille. Les règles halal aident à préserver la pureté physique et spirituelle.';

  @override
  String get whyDoWeQ12 => 'Pourquoi disons-nous Inchallah ?';

  @override
  String get whyDoWeA12 =>
      'Allah ordonne dans le Coran (18:23-24) : « Et ne dis jamais, à propos d\'une chose : Je le ferai demain, sans ajouter : Si Allah le veut. » Dire Inchallah reconnaît que seul Allah maîtrise l\'avenir et nous garde humbles.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Des parcours réels vers l\'Islam venus du monde entier';

  @override
  String get communityStoriesTimeLabel => 'Temps en tant que musulman';

  @override
  String get communityStoriesShareBtn => 'Partage Ton Témoignage';

  @override
  String get communityStoriesShareSoon =>
      'Bientôt disponible — cette fonctionnalité arrive !';

  @override
  String get communityStory1Name => 'Aisha (anciennement Sarah)';

  @override
  String get communityStory1Location => 'Texas, États-Unis';

  @override
  String get communityStory1Time => '2 ans';

  @override
  String get communityStory1Text =>
      'J\'ai découvert l\'Islam en faisant des recherches pour un devoir universitaire. Je m\'attendais à trouver ce que les médias me disaient. Au lieu de cela, j\'ai trouvé la paix, la logique, et un Dieu qui avait vraiment du sens. J\'ai prononcé ma chahada 6 mois plus tard. Le plus difficile n\'a pas été d\'apprendre à prier — c\'était de l\'annoncer à ma famille. Mais Alhamdulillah, deux ans plus tard, c\'est ma mère qui me pose des questions sur l\'Islam.';

  @override
  String get communityStory2Name => 'Yusuf (anciennement James)';

  @override
  String get communityStory2Location => 'Londres, Royaume-Uni';

  @override
  String get communityStory2Time => '4 ans';

  @override
  String get communityStory2Text =>
      'Je me suis converti après des années de recherche. Christianisme, bouddhisme, athéisme — rien ne comblait ce vide. Un collègue musulman m\'a invité à la prière du vendredi. Je me suis assis au fond et j\'ai pleuré pendant toute la durée. Je ne savais même pas pourquoi. J\'ai prononcé ma chahada la semaine suivante. La communauté m\'a entouré comme une famille dont je n\'avais jamais su que j\'avais besoin.';

  @override
  String get communityStory3Name => 'Maryam (anciennement Maria)';

  @override
  String get communityStory3Location => 'Mexico, Mexique';

  @override
  String get communityStory3Time => '1 an';

  @override
  String get communityStory3Text =>
      'Être latina et musulmane, c\'est comme avoir un super-pouvoir. J\'ai découvert l\'Islam grâce à une vidéo YouTube à 2h du matin. J\'ai regardé pendant des heures. Le concept du tawhid — que Dieu est unique, sans associé, sans représentation — a résonné si profondément en moi. Mes sœurs hispanophones à la mosquée m\'ont fait sentir chez moi immédiatement.';

  @override
  String get communityStory4Name => 'Ibrahim (anciennement David)';

  @override
  String get communityStory4Location => 'Toronto, Canada';

  @override
  String get communityStory4Time => '6 ans';

  @override
  String get communityStory4Text =>
      'J\'étais le fils d\'un pasteur. J\'avais des questions sur la Trinité auxquelles personne ne pouvait répondre. Quand j\'ai lu le Coran pour la première fois, j\'ai eu l\'impression de lire quelque chose que je croyais déjà. J\'ai prononcé ma chahada en silence, seul, puis à nouveau à la mosquée. La meilleure décision de ma vie.';

  @override
  String get communityStory5Name => 'Fatima (anciennement Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australie';

  @override
  String get communityStory5Time => '3 ans';

  @override
  String get communityStory5Text =>
      'Mon parcours a commencé avec un hijab. Je l\'ai mis pour relever un défi et j\'ai ressenti... une protection. J\'ai commencé à lire sur l\'Islam et je ne pouvais plus m\'arrêter. En trois mois, j\'avais prononcé ma chahada. Les gens me demandent ce que j\'ai abandonné. Je leur réponds que j\'ai abandonné le vide.';

  @override
  String get communityStory6Name => 'Omar (anciennement Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Afrique du Sud';

  @override
  String get communityStory6Time => '5 ans';

  @override
  String get communityStory6Text =>
      'J\'ai grandi dans un quartier difficile. L\'Islam m\'a apporté discipline, but et fraternité. La première fois que j\'ai fait soujoud, quelque chose en moi s\'est ouvert — de la meilleure des façons. J\'ai pleuré sans pouvoir l\'expliquer. Aujourd\'hui, j\'accompagne d\'autres jeunes qui trouvent leur chemin vers le din.';

  @override
  String get inspiredByRealStories =>
      'Inspiré de témoignages réels de convertis';

  @override
  String get storyFormTitle => 'Partage Ton Témoignage';

  @override
  String get storyFormNameLabel => 'Ton Nom';

  @override
  String get storyFormNameHint => 'Nom, ou écris « Anonyme »';

  @override
  String get storyFormCountryLabel => 'Pays';

  @override
  String get storyFormCountryHint => 'D\'où viens-tu ?';

  @override
  String get storyFormTimeLabel => 'Temps en tant que musulman';

  @override
  String get storyFormTimeHint => 'ex. 2 ans, 6 mois';

  @override
  String get storyFormStoryLabel => 'Ton Témoignage';

  @override
  String get storyFormStoryHint => 'Partage ton chemin vers l\'Islam...';

  @override
  String get storyFormSubmitBtn => 'Envoyer le Témoignage';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair !';

  @override
  String get storyFormThankYouBody =>
      'Ton témoignage a bien été reçu. Nous vérifions tous les témoignages avant publication.';

  @override
  String get storyFormRequiredError => 'Merci de remplir tous les champs';

  @override
  String get subtitleYourGuideToIslam => 'Ton guide vers l\'Islam';

  @override
  String get beginnerMode => 'Mode Débutant';

  @override
  String get beginnerModeSubtitle =>
      'Conseils et accompagnement supplémentaires pour les nouveaux musulmans';

  @override
  String get beginnerModeOn =>
      'Le mode débutant est activé — des conseils supplémentaires s\'affichent dans toute l\'application';

  @override
  String get beginnerModePrayersTip =>
      'Astuce : appuie sur chaque prière pour en savoir plus et voir les prières sunnah';

  @override
  String get tafsirSubtitle => 'Commentaire Coranique';

  @override
  String get tafsirComingSoon =>
      'Le tafsir de cette sourate sera bientôt disponible';

  @override
  String get tafsirNotAvailable => 'Tafsir non disponible';

  @override
  String get scholarSource => 'Source';

  @override
  String get asbabAlNuzul => 'Circonstances de la Révélation';

  @override
  String get transliteration => 'Translittération';

  @override
  String get selectReciter => 'Choisir le Récitateur';

  @override
  String get playVerse => 'Lire le verset';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'Les 99 Plus Beaux Noms d\'Allah';

  @override
  String get asmaHadith =>
      'Allah a 99 noms. Quiconque les mémorise entrera au Paradis.';

  @override
  String get asmaHadithSource => 'Sahih al-Boukhari, 2736';

  @override
  String get asmaSearchHint => 'Rechercher des noms...';

  @override
  String get asmaNoResults => 'Aucun nom trouvé';

  @override
  String get asmaSignificance => 'Signification';

  @override
  String get asmaUlHusnaTile => '99 Noms';

  @override
  String get asmaUlHusnaTileSubtitle => 'Les Noms d\'Allah';

  @override
  String get onboardingTagline => 'Veille sur ton temps. Honore tes prières.';

  @override
  String get onboardingChooseLanguage => 'Choisis ta langue';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingLocationTitle => 'Horaires de Prière Précis';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard a besoin de ta localisation pour calculer les horaires de prière précis de ta ville. Ta localisation n\'est jamais stockée ni partagée.';

  @override
  String get onboardingPrivacyBanner =>
      'Ta foi est personnelle. Tes données aussi.';

  @override
  String get onboardingAllowLocation => 'Autoriser la Localisation';

  @override
  String get onboardingSkipForNow => 'Ignorer pour l\'instant';

  @override
  String get onboardingNotificationTitle => 'Ne Manque Plus Aucune Prière';

  @override
  String get onboardingNotificationDesc =>
      'Reçois une notification à chaque horaire de prière avec un bel adhan. Personnalise les sons et les horaires dans les paramètres.';

  @override
  String get onboardingAdhanAlerts => 'Alertes adhan';

  @override
  String get onboardingCustomTiming => 'Horaires personnalisés';

  @override
  String get onboardingAdjustable => 'Réglable';

  @override
  String get onboardingEnableNotifications => 'Activer les Notifications';

  @override
  String get onboardingMaybeLater => 'Plus tard';

  @override
  String get onboardingAllSetTitle => 'Tout est Prêt !';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard est prêt à protéger ton temps\net à guider ta journée avec intention.';

  @override
  String get onboardingPrayerTimesLabel => 'Horaires de Prière';

  @override
  String get onboardingPrayerTimesDesc => 'Horaires précis pour ta ville';

  @override
  String get onboardingLockScreenLabel => 'Écran de Verrouillage Islamique';

  @override
  String get onboardingLockScreenDesc =>
      'Coran et douas à chaque déverrouillage';

  @override
  String get onboardingPrayerGuardLabel => 'Gardien de Prière';

  @override
  String get onboardingPrayerGuardDesc =>
      'Les applications se bloquent automatiquement pendant la salat';

  @override
  String get onboardingEnterApp => 'Entrer dans Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'L\'appel à la prière';

  @override
  String get adhanDescription =>
      'L\'Adhan est l\'appel islamique à la prière, annoncé cinq fois par jour pour inviter les croyants au culte.';

  @override
  String get makkahStyle => 'La Mecque';

  @override
  String get madinahStyle => 'Médine';

  @override
  String get egyptianStyle => 'Égyptien';

  @override
  String get adhanPlaying => 'En cours de lecture';

  @override
  String get makkahDescription =>
      'L\'appel traditionnel à la prière depuis la Grande Mosquée de La Mecque.';

  @override
  String get madinahDescription =>
      'Une interprétation paisible dans le style de la Mosquée du Prophète à Médine.';

  @override
  String get egyptianDescription =>
      'Un adhan mélodieux de style égyptien, réputé pour sa récitation riche.';

  @override
  String get adhanCallToWorship => 'L\'appel à la prière';

  @override
  String get adhanDescriptionFull =>
      'L\'Adhan est l\'appel islamique à la prière, annoncé cinq fois par jour pour inviter les croyants au culte.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turc';

  @override
  String get pakistaniStyle => 'Pakistanais';

  @override
  String get indonesianStyle => 'Indonésien';

  @override
  String get alafasyDescription =>
      'Une interprétation émouvante par le célèbre récitateur Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'L\'appel à la prière résonnant depuis la mosquée Al-Aqsa à Jérusalem, le troisième lieu le plus sacré de l\'Islam.';

  @override
  String get turkishDescription =>
      'Un ezan traditionnel de style turc avec son maqam mélodique distinctif.';

  @override
  String get pakistaniDescription =>
      'Un adhan émouvant dans la tradition sud-asiatique, récité à travers le Pakistan.';

  @override
  String get indonesianDescription =>
      'Un adhan mélodieux de style indonésien, apprécié à travers l\'archipel.';

  @override
  String get thisWeek => 'Cette Semaine';

  @override
  String weeklyProgress(int count) {
    return '$count sur 35 prières cette semaine';
  }

  @override
  String get bestDay => 'Meilleur jour';

  @override
  String get prayerStats => 'Statistiques de Prière';

  @override
  String get completionRate => 'Taux d\'Achèvement';

  @override
  String get bestPrayer => 'Prière la Plus Régulière';

  @override
  String get hardestPrayer => 'Prière la Plus Manquée';

  @override
  String totalPrayersCompleted(int count) {
    return '$count prières accomplies';
  }

  @override
  String get last7Days => '7 Derniers Jours';

  @override
  String get thisMonth => 'Ce Mois-ci';

  @override
  String get fullDays => 'Jours complets';

  @override
  String get partialDays => 'Jours partiels';

  @override
  String get missedDays => 'Jours manqués';

  @override
  String get missedPrayerBadge => 'Manquée';

  @override
  String get makeItUp => 'Rattraper';

  @override
  String get qadaExplanation =>
      'Si vous avez manqué une prière, vous pouvez encore l\'accomplir comme prière Qada (de rattrapage).';

  @override
  String get noStatsYet =>
      'Continuez à marquer vos prières pour voir vos statistiques ici.';

  @override
  String get notEnoughData => 'Pas encore assez de données';

  @override
  String get continuousPlay => 'Continu';

  @override
  String get sleepTimer => 'Minuterie';

  @override
  String verseCount(Object total, Object verse) {
    return 'Verset $verse sur $total';
  }

  @override
  String get verseTafsir => 'Tafsir du verset';

  @override
  String get tafsirOfTheDay => 'Tafsir du jour';

  @override
  String get dailyInsight => 'Réflexion quotidienne';

  @override
  String get keyThemes => 'Thèmes et leçons clés';

  @override
  String get readFullSurah => 'Lire la sourate complète';

  @override
  String get surahIntroduction => 'Introduction de la sourate';

  @override
  String get verses => 'versets';

  @override
  String get loadingTafsir => 'Chargement du tafsir...';

  @override
  String get keepAliveNotificationText => 'Notifications de prière actives';

  @override
  String get keepAliveChannelName => 'Notifications de prière';

  @override
  String get keepAliveChannelDescription =>
      'Garde Noor Guard actif en arrière-plan pour que les alarmes de prière ne soient jamais manquées.';

  @override
  String get notifSetupTitle =>
      'Activer les alertes sur l\'écran de verrouillage';

  @override
  String get notifSetupSubtitle =>
      'Pour ne jamais manquer l\'adhan — même quand votre téléphone est verrouillé. Cela prend environ une minute.';

  @override
  String get notifSetupSamsungBanner =>
      'Vous utilisez un Samsung Galaxy (Fold/Flip inclus) ? Samsung ajoute des interrupteurs supplémentaires en plus d\'Android standard — les étapes 4 et 6 ci-dessous vous montrent exactement où les trouver.';

  @override
  String get notifSetupStep1Title => 'Autoriser les notifications';

  @override
  String get notifSetupStep1Description =>
      'L\'autorisation de base dont Noor Guard a besoin pour vous alerter.';

  @override
  String get notifSetupStep1Action => 'Autoriser les notifications';

  @override
  String get notifSetupStep2Title => 'Alarmes et rappels';

  @override
  String get notifSetupStep2Description =>
      'Permet aux alarmes de prière de sonner précisément à l\'heure de la prière, même si votre téléphone est inactif ou en économie de batterie.';

  @override
  String get notifSetupStep2Action => 'Ouvrir les réglages d\'alarme';

  @override
  String get notifSetupStep3Title => 'Afficher par-dessus les autres applis';

  @override
  String get notifSetupStep3Description =>
      'Permet à l\'écran de prière complet de s\'afficher par-dessus l\'écran de verrouillage et tout ce qui est ouvert.';

  @override
  String get notifSetupStep3Action => 'Ouvrir les réglages';

  @override
  String get notifSetupStep4Title => 'Afficher en pop-up / alerte plein écran';

  @override
  String get notifSetupStep4Description =>
      'Permet à l\'écran de l\'adhan de traverser l\'écran de verrouillage au lieu de rester une bannière silencieuse.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Sur les téléphones Samsung Galaxy (Fold/Flip inclus) : ouvrez Réglages → appuyez sur « Prayer Time Alarm », puis activez « Pop-up notification » (appelée « Cover screen pop-up » sur Fold/Flip). C\'est un interrupteur propre à Samsung — l\'activer est ce qui place réellement l\'écran de l\'adhan par-dessus votre écran de verrouillage.';

  @override
  String get notifSetupStep4Action => 'Ouvrir les réglages de notifications';

  @override
  String get notifSetupStep5Title => 'Garder les notifications fiables';

  @override
  String get notifSetupStep5Description =>
      'Empêche Android de ralentir ou de retarder Noor Guard en arrière-plan, afin que les alarmes et rappels de prière arrivent toujours à l\'heure.';

  @override
  String get notifSetupStep5Action =>
      'Désactiver l\'optimisation de la batterie';

  @override
  String get notifSetupStep6Title => 'Applications jamais en veille';

  @override
  String get notifSetupStep6Description =>
      'Le gestionnaire de batterie de Samsung peut mettre Noor Guard en veille et bloquer silencieusement les alarmes de prière. L\'ajouter aux « Never sleeping apps » empêche cela.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Réglages → Batterie et entretien de l\'appareil → Limites d\'utilisation en arrière-plan → Never sleeping apps → appuyez sur « + » → sélectionnez Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Ouvrir les réglages de batterie';

  @override
  String get notifSetupStatusChecking => 'Vérification…';

  @override
  String get notifSetupStatusEnabled => 'Activé';

  @override
  String get notifSetupStatusNeeded => 'Nécessaire';

  @override
  String get notifSetupStatusManual => 'Étape manuelle';

  @override
  String get notifSetupContinueButton => 'Continuer vers Noor Guard';

  @override
  String get notifSetupLaterButton => 'Je terminerai plus tard';

  @override
  String get notifSetupDoneButton => 'Terminé';

  @override
  String get testNotificationButton => 'Envoyer une notification test (10 s)';

  @override
  String get testNotificationSnack =>
      'La notification test arrivera dans 10 secondes';

  @override
  String get testLockAlarmButton => 'Tester l\'alarme plein écran (10 s)';

  @override
  String get testLockAlarmSnack =>
      'L\'alarme de verrouillage se déclenche dans 10 secondes — verrouillez votre téléphone maintenant';

  @override
  String get testAdhanForegroundButton =>
      'Tester l\'adhan dans l\'appli (premier plan)';

  @override
  String get testAdhanForegroundSnack =>
      'Lecture de l\'adhan complet avec une bannière silencieuse';

  @override
  String get testRequiresNotificationsOn =>
      'Active d\'abord les Notifications de Prière pour tester ceci';

  @override
  String get lockScreenSetupGuideButton =>
      'Guide de configuration des alertes sur écran verrouillé';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Impossible d\'ouvrir la politique de confidentialité';

  @override
  String get couldNotOpenEmailApp =>
      'Impossible d\'ouvrir l\'application de messagerie';

  @override
  String get blockDurationLabel => 'Durée du blocage';

  @override
  String get privacyAndTrust => 'Confidentialité et confiance';

  @override
  String get noorGuardMotto =>
      '\"Si cela n\'a pas sa place dans une mosquée,\ncela n\'a pas sa place dans Noor Guard.\"';

  @override
  String get openingAppStore => 'Ouverture de l\'App Store…';

  @override
  String get openingShareSheet => 'Ouverture du menu de partage…';

  @override
  String get openingSupportEmail => 'Ouverture de l\'e-mail d\'assistance…';

  @override
  String get openingTermsOfService =>
      'Ouverture des conditions d\'utilisation…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 heure';

  @override
  String get durationPrayerWindowOnly => 'Fenêtre de prière uniquement';

  @override
  String get hoursAbbreviation => 'h';

  @override
  String get cancelTimerButton => 'Annuler la minuterie';

  @override
  String get custom => 'Personnalisé';

  @override
  String get customTimerMinutesTitle => 'Minuterie personnalisée (minutes)';

  @override
  String get customTimerHint => 'ex. 20';

  @override
  String get cancel => 'Annuler';

  @override
  String get start => 'Démarrer';

  @override
  String get travel => 'Voyage';

  @override
  String get anxietyAndStress => 'Anxiété et stress';

  @override
  String get gratitude => 'Gratitude';

  @override
  String get protection => 'Protection';

  @override
  String get family => 'Famille';

  @override
  String get forgiveness => 'Pardon';

  @override
  String get appBlockingSetupHeadline =>
      'Préserve ton temps, préserve ta prière';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard utilise le service d\'accessibilité d\'Android uniquement pour détecter quand une appli bloquée est ouverte pendant la prière. Il ne lit jamais tes messages, photos ou données personnelles.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Accès à l\'accessibilité accordé';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Accès à l\'accessibilité non accordé';

  @override
  String get appBlockingOpenSettings =>
      'Ouvrir les paramètres d\'accessibilité';

  @override
  String get appBlockingSetupNotNow => 'Pas maintenant';

  @override
  String get appBlockingEnableToggle => 'Activer le blocage d\'applis';

  @override
  String get appBlockingModeLabel => 'Mode de blocage';

  @override
  String get appBlockingModeSoft => 'Doux';

  @override
  String get appBlockingModeSoftDesc =>
      'Juste un rappel — les applis restent ouvertes';

  @override
  String get appBlockingModeFirm => 'Ferme';

  @override
  String get appBlockingModeFirmDesc =>
      'Bloque l\'appli, avec une sortie rapide';

  @override
  String get appBlockingModeHard => 'Strict';

  @override
  String get appBlockingModeHardDesc =>
      'Blocage total — seul \"J\'ai prié\" le débloque';

  @override
  String get appBlockingSelectPrayersLabel => 'Bloquer pendant ces prières';

  @override
  String get appBlockingBufferBeforeLabel => 'Commencer avant la prière';

  @override
  String get appBlockingBufferAfterLabel => 'Lever après la prière';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'Applis bloquées';

  @override
  String get appBlockingSelectAppsButton => 'Choisir les applis à bloquer';

  @override
  String get appBlockingSearchHint => 'Rechercher des applis installées';

  @override
  String get appBlockingNoAppsSelected =>
      'Aucune appli sélectionnée pour l\'instant';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count applis bloquées',
      one: '1 appli bloquée',
      zero: 'Aucune appli bloquée',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Test';

  @override
  String get appBlockingTestDescription =>
      'Active le blocage d\'applications pendant 2 minutes pour vérifier qu\'il fonctionne sur cet appareil.';

  @override
  String get appBlockingTestButton =>
      'Tester le blocage d\'applications (2 minutes)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Blocage d\'applications actif pendant 2 minutes — essayez d\'ouvrir une application bloquée';

  @override
  String get appBlockingPermissionNeeded =>
      'Active l\'accès à l\'accessibilité pour commencer à bloquer';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Accès Temps d\'écran — bientôt disponible';

  @override
  String get appBlockingIosComingSoonBody =>
      'Le blocage d\'applis sur iOS nécessite la permission Temps d\'écran d\'Apple, que nous mettons encore en place. Nous te préviendrons dès qu\'elle sera prête.';

  @override
  String get appBlockingHeadline1 => 'C\'est l\'heure de la prière';

  @override
  String get appBlockingHeadline2 => 'Préserve ton temps';

  @override
  String get appBlockingDefaultTitle => 'Heure de prière';

  @override
  String get appBlockingIPrayedButton => 'J\'ai prié';

  @override
  String get appBlockingReadAyahsButton => 'Lire 3 versets';

  @override
  String get appBlockingEmergencyBypass => 'Sortie d\'urgence';

  @override
  String get appBlockingSkipForNow => 'Ignorer pour l\'instant';

  @override
  String get appBlockingBypassConfirmTitle => 'Terminer ta série ?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Sortir maintenant réinitialisera ta série de prières. S\'il s\'agit d\'une vraie urgence, tu peux continuer.';

  @override
  String get appBlockingBypassConfirmContinue => 'Sortir malgré tout';

  @override
  String get appBlockingBypassConfirmCancel => 'Retour';

  @override
  String get appBlockingSoftReminderTitle => 'Un rappel tout en douceur';

  @override
  String get appBlockingSoftReminderBody =>
      'C\'est l\'heure de la prière — pense à t\'éloigner un instant.';

  @override
  String get quranChallengeBannerTitle => 'Lis 3 versets pour débloquer';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count sur $total versets lus';
  }

  @override
  String get quranChallengeComplete => 'Bien joué — applis débloquées';

  @override
  String get focusBlockHeadline1 => 'Reste concentré';

  @override
  String get focusBlockHeadline2 => 'Continue';

  @override
  String get endFocusSessionButton => 'Terminer la session de concentration';

  @override
  String get focusPaused => 'En pause pour la prière';

  @override
  String get selectLocationTitle => 'Sélectionner un lieu';

  @override
  String get useCurrentLocation => 'Utiliser la position actuelle';

  @override
  String get savedLocationsHeader => 'Lieux enregistrés';

  @override
  String get noSavedLocationsYet =>
      'Aucun lieu enregistré pour le moment. Recherchez ci-dessous pour en ajouter un.';

  @override
  String get searchCityHint => 'Rechercher un nom de ville…';

  @override
  String get addLocationTooltip => 'Ajouter un lieu';

  @override
  String get deleteLocationTooltip => 'Supprimer le lieu';

  @override
  String get locationNotFound =>
      'Lieu introuvable. Essayez une autre recherche.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Vous pouvez enregistrer jusqu\'à $max lieux';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Impossible de confirmer la modification — veuillez réessayer';

  @override
  String get tasbihCounter => 'Compteur de Tasbih';

  @override
  String get tasbihCounterSubtitle => 'Compte ton dhikr';

  @override
  String get tasbihResetButton => 'Réinitialiser';

  @override
  String get tasbihTotalLabel => 'Total';

  @override
  String get tasbihCelebrationTitle => 'Tasbih terminé !';

  @override
  String get tasbihCelebrationBody =>
      'Tu as terminé les 99 dhikr. Qu\'Allah accepte ton rappel.';

  @override
  String get tasbihStartNewSession => 'Démarrer une nouvelle session';

  @override
  String get tasbihUndoButton => 'Annuler';

  @override
  String get tasbihTapAnywhereHint =>
      'Touchez n\'importe où sur l\'écran pour compter';

  @override
  String get tasbihSoundToggleTooltip => 'Son au toucher';

  @override
  String get tasbihManageDhikrTooltip => 'Gérer les dhikr';

  @override
  String get tasbihStatsTooltip => 'Voir les statistiques';

  @override
  String get tasbihDailyTotalLabel => 'Total du Jour';

  @override
  String get tasbihRoundsTodayLabel => 'Tours Aujourd\'hui';

  @override
  String get tasbihManageDhikrTitle => 'Gérer les Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Ajouter un Dhikr Personnalisé';

  @override
  String get tasbihDeleteDhikrTooltip => 'Supprimer';

  @override
  String get tasbihBuiltInDhikrBadge => 'Intégré';

  @override
  String get tasbihCannotDeleteLastDhikr =>
      'Vous avez besoin d\'au moins un dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Nom';

  @override
  String get tasbihDhikrNameHint => 'ex. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arabe (facultatif)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Veuillez saisir un nom';

  @override
  String get tasbihSaveDhikrButton => 'Enregistrer';

  @override
  String get tasbihStatsTitle => 'Statistiques du Tasbih';

  @override
  String get tasbihAllTimeTotalLabel => 'Total Général';

  @override
  String get tasbihNoActivityYetMessage =>
      'Commencez à compter pour voir vos statistiques ici.';

  @override
  String get tasbihSoundPickerTitle => 'Son au Toucher';

  @override
  String get tasbihSoundClassicClick => 'Clic Classique';

  @override
  String get tasbihSoundSoftChime => 'Carillon Doux';

  @override
  String get tasbihSoundStoneTap => 'Tap de Pierre';

  @override
  String get tasbihCurrentlyReciting => 'En Train de Réciter';

  @override
  String tasbihOfTarget(int target) {
    return 'sur $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Goutte de Pluie';

  @override
  String get tasbihSoundSoftFeather => 'Plume Douce';

  @override
  String noAyahsFound(String query) {
    return 'Aucun verset trouvé pour « $query »';
  }

  @override
  String get trySearchingQuran =>
      'Essayez en français, en anglais ou en arabe, ou utilisez un terme islamique :';

  @override
  String get loadingQuranIndex => 'Chargement de l’index du Coran…';

  @override
  String get quranSearchSuggestions =>
      'patience, sabr, miséricorde, prière, salah, pardon, tawbah, paradis, jannah, connaissance';

  @override
  String get heroVerse1 =>
      'Observez scrupuleusement les prières, surtout la prière du milieu.';

  @override
  String get heroVerse2 =>
      'En vérité, la prière a été prescrite aux croyants à des heures déterminées.';

  @override
  String get heroVerse3 => 'Cherchez secours dans la patience et la prière.';

  @override
  String get heroVerse4 =>
      'Rappelez-vous de Moi, Je vous mentionnerai. Soyez-Moi reconnaissants et ne M\'ingratifiez pas.';

  @override
  String get heroVerse5 => 'Et quiconque se confie à Allah, Il lui suffira.';

  @override
  String get heroVerse6 =>
      'Certes, la première maison établie pour les hommes est bien celle de Makkah, bénie et guidant les mondes.';

  @override
  String get heroVerse7 =>
      'En vérité, la prière préserve de la turpitude et du blâmable, et certes, le rappel d\'Allah est plus grand.';

  @override
  String get heroVerse8 =>
      'Assurément, c\'est par le rappel d\'Allah que les cœurs se tranquillisent.';

  @override
  String get heroVerse9 => 'Invoquez-Moi, Je vous répondrai.';

  @override
  String get heroVerse10 =>
      'Si vous êtes reconnaissants, Je vous donnerai certainement davantage.';

  @override
  String get heroVerse11 =>
      'Allah n\'impose à aucune âme une charge supérieure à sa capacité.';

  @override
  String get heroVerse12 => 'Certes, Allah est avec les endurants.';

  @override
  String get heroVerse13 => 'Ma miséricorde embrasse toute chose.';

  @override
  String get heroVerse14 =>
      'Faites le bien; certes, Allah aime ceux qui font le bien.';

  @override
  String get heroVerse15 =>
      'C\'est le Livre au sujet duquel il n\'y a aucun doute, un guide pour les pieux.';

  @override
  String get accuracyHigh => 'Haute précision';

  @override
  String get accuracyMedium => 'Précision moyenne';

  @override
  String get accuracyLow => 'Faible précision';

  @override
  String get accuracyCalibrating => 'Étalonnage…';

  @override
  String get compassNeedsCalibration => 'La boussole a besoin d\'étalonnage';

  @override
  String get compassCalibrationHint =>
      'Déplacez lentement votre téléphone en forme de 8 pour améliorer la précision.';

  @override
  String get spiritLevelLabel => 'Niveau à bulle';

  @override
  String get spiritLevelLevelText => '✓  Nivelé';

  @override
  String get spiritLevelTiltText => 'Inclinez pour niveler';

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
  String get splashTagline => 'Préserve ton temps. Honore tes prières.';

  @override
  String get stopAdhan => 'Arrêter l\'Adhan';

  @override
  String get duasSearchEmpty =>
      'Essaie une autre catégorie ou un autre terme de recherche.';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingWelcomeTo => 'Bienvenue sur';

  @override
  String get onboardingSubtitle =>
      'Votre compagnon dans le beau voyage de l\'Islam.';

  @override
  String get onboardingLetsGetStarted => 'Commençons';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step sur $total';
  }

  @override
  String get onboardingWhatsYourName => 'Quel est votre prénom?';

  @override
  String get onboardingNameSubtitle =>
      'Nous aimerions savoir comment vous appeler.';

  @override
  String get onboardingNameHint => 'Entrez votre prénom';

  @override
  String get onboardingContinue => 'Continuer';

  @override
  String get onboardingAreYouNewToIslam => 'Êtes-vous nouveau dans l\'Islam?';

  @override
  String get onboardingModeSubtitle =>
      'Nous personnaliserons votre expérience selon votre parcours.';

  @override
  String get onboardingNewToIslam => 'Je suis nouveau dans l\'Islam';

  @override
  String get onboardingNewToIslamDesc => 'Étape par étape avec guide débutant';

  @override
  String get onboardingFamiliarWithIslam => 'Je suis familier avec l\'Islam';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Mode standard avec toutes les fonctionnalités';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 👋';
  }
}
