// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Allah aibariki siku yako';

  @override
  String get nextPrayer => 'Swala Ijayo';

  @override
  String get iPrayedButton => 'Nimesali';

  @override
  String get todaysPrayers => 'Swala za Leo';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Hali ya Umakini';

  @override
  String get appBlocking => 'Kuzuia Programu';

  @override
  String get islamicCalendar => 'Kalenda ya Kiislamu';

  @override
  String get islamicCalendarSubtitle => 'Tarehe za Hijri na matukio';

  @override
  String get duas => 'Dua';

  @override
  String get quran => 'Qur\'ani';

  @override
  String get settings => 'Mipangilio';

  @override
  String get complete => 'Kamilisha';

  @override
  String get streak => 'Mfululizo';

  @override
  String get dayStreak => 'siku za mfululizo';

  @override
  String get compassRequiresDevice => 'Dira inahitaji kifaa halisi';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'siku $count',
      one: 'siku $count',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Swala zote zimekamilika! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 swala zimekamilika';
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
    return 'rakaa $count za faradhi';
  }

  @override
  String sunnahBefore(int count) {
    return 'rakaa $count za sunna kabla';
  }

  @override
  String sunnahAfter(int count) {
    return 'rakaa $count za sunna baada';
  }

  @override
  String prayedAt(String time) {
    return 'Inaswaliwa saa $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'alfajiri kabla ya jua kuchomoza';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'baada ya jua kupita kilele chake';

  @override
  String get timePeriodLateAfternoon => 'alasiri';

  @override
  String get timePeriodJustAfterSunset => 'mara tu baada ya jua kuzama';

  @override
  String get timePeriodNightBeforeMidnight => 'usiku kabla ya saa sita';

  @override
  String get fajrHadith =>
      'Rakaa mbili za Fajr ni bora kuliko dunia na vyote vilivyomo. — Mtume Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr ni swala ya kwanza ya siku. Inatukumbusha kuanza siku kwa kumkumbuka Allah.';

  @override
  String get dhuhrHadith =>
      'Atakayeswali rakaa kumi na mbili za sunna, Allah atamjengea nyumba Peponi.';

  @override
  String get dhuhrTip =>
      'Dhuhr ni swala ya adhuhuri. Ni wakati mzuri wa kusimamisha shughuli za siku na kuungana tena na Allah.';

  @override
  String get asrHadith =>
      'Atakayeacha swala ya Asr, ni kama amepoteza familia yake na mali yake. — Mtume Muhammad ﷺ';

  @override
  String get asrTip =>
      'Asr mara nyingi huitwa swala ya kati. Allah ameitaja maalum katika Qur\'ani (2:238).';

  @override
  String get maghribHadith => 'Swala ya Maghrib ni Witr ya siku.';

  @override
  String get maghribTip =>
      'Maghrib inaashiria mwisho wa saumu ya siku katika Ramadhani. Inaswaliwa mara tu jua linapozama.';

  @override
  String get ishaHadith =>
      'Atakayeswali Isha kwa jamaa, ni kama amesimama kuswali nusu ya usiku.';

  @override
  String get ishaTip =>
      'Isha ni swala ya mwisho ya siku. Kumaliza siku kwa swala huleta amani na utulivu.';

  @override
  String get newMuslimTip => 'Ushauri kwa Waislamu wapya';

  @override
  String get notificationsOn => 'Arifa zimewashwa';

  @override
  String get notificationsOff => 'Arifa zimezimwa';

  @override
  String get preview => 'Hakiki';

  @override
  String get lockPreviewCountdown => 'Baada ya saa 1 dakika 23  ·  4:47 jioni';

  @override
  String get swipeUpToUnlock => 'Telezesha kidole juu kufungua';

  @override
  String get searchSurahs => 'Tafuta sura…';

  @override
  String get noSurahsFound => 'Hakuna sura zilizopatikana';

  @override
  String get tryAgain => 'Jaribu Tena';

  @override
  String ayahs(int count) {
    return 'aya $count';
  }

  @override
  String get searchDuas => 'Tafuta dua…';

  @override
  String supplications(int count) {
    return 'dua $count';
  }

  @override
  String get prayerSettings => 'Mipangilio ya Swala';

  @override
  String get calculationMethod => 'Mbinu ya Kuhesabu';

  @override
  String get adhanSound => 'Sauti ya Adhana';

  @override
  String get prayerNotifications => 'Arifa za Swala';

  @override
  String get statusOn => 'Imewashwa';

  @override
  String get statusOff => 'Imezimwa';

  @override
  String get enableAllNotifications => 'Wezesha Arifa Zote';

  @override
  String get individualPrayers => 'Swala Mojamoja';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get darkMode => 'Hali ya Giza';

  @override
  String get language => 'Lugha';

  @override
  String get aboutNoorGuard => 'Kuhusu';

  @override
  String get version => 'Toleo la Programu';

  @override
  String get rateApp => 'Kadiria Noor Guard';

  @override
  String get shareApp => 'Shiriki Noor Guard';

  @override
  String get contactSupport => 'Wasiliana na Msaada';

  @override
  String get privacyPolicy => 'Sera ya Faragha';

  @override
  String get termsOfService => 'Masharti ya Huduma';

  @override
  String get helpUsImprove => 'Tusaidie Kuboresha';

  @override
  String get translationDisclaimer =>
      'Tafsiri zetu zinasaidiwa na AI. Ukigundua makosa yoyote katika lugha yako, tungependa kusikia maoni yako!';

  @override
  String get privacyPromiseTitle => 'Ahadi ya Faragha ya Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Imani yako ni jambo lako binafsi. Data yako pia ni yako binafsi. Hatuuzi, hatushiriki, wala hatutumii data yako kwa biashara. Si mahali ulipo. Si tabia zako za swala. Si jina lako.';

  @override
  String get directionToSacredHouse => 'Mwelekeo wa Nyumba Tukufu';

  @override
  String towardMecca(String degrees) {
    return '$degrees° kuelekea Makka';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (chaguo-msingi)';

  @override
  String get prayerHistory => 'Historia ya Swala';

  @override
  String get currentStreak => 'Mfululizo wa Sasa';

  @override
  String get longestStreak => 'Mfululizo Mrefu Zaidi';

  @override
  String get legend => 'Ufunguo';

  @override
  String get allFivePrayers => 'Swala zote 5';

  @override
  String get partialPrayers => 'Sehemu (1–4)';

  @override
  String get none => 'Hakuna';

  @override
  String get sun => 'Jum';

  @override
  String get mon => 'Jpi';

  @override
  String get tue => 'Jna';

  @override
  String get wed => 'Jta';

  @override
  String get thu => 'Alh';

  @override
  String get fri => 'Iju';

  @override
  String get sat => 'Jmo';

  @override
  String headingDegrees(String degrees) {
    return 'Mwelekeo $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Imeshindikana kupakia sura';

  @override
  String get connectionError =>
      'Tafadhali angalia muunganisho wako wa intaneti kisha ujaribu tena';

  @override
  String get alQuran => 'Al-Qur\'ani';

  @override
  String get dailySupplications => 'Dua za Kila Siku';

  @override
  String get all => 'Zote';

  @override
  String get noDuasFound => 'Hakuna dua zilizopatikana';

  @override
  String get january => 'Januari';

  @override
  String get february => 'Februari';

  @override
  String get march => 'Machi';

  @override
  String get april => 'Aprili';

  @override
  String get may => 'Mei';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Julai';

  @override
  String get august => 'Agosti';

  @override
  String get september => 'Septemba';

  @override
  String get october => 'Oktoba';

  @override
  String get november => 'Novemba';

  @override
  String get december => 'Desemba';

  @override
  String get home => 'Nyumbani';

  @override
  String get prayers => 'Swala';

  @override
  String get more => 'Zaidi';

  @override
  String get tafsir => 'Tafsiri';

  @override
  String get lockScreen => 'Skrini ya Kufuli';

  @override
  String get readAndListen => 'Soma na Sikiliza';

  @override
  String get commentary => 'Ufafanuzi';

  @override
  String get findDirection => 'Tafuta Mwelekeo';

  @override
  String get reminders => 'Vikumbusho';

  @override
  String get blockDistractions => 'Zuia Vikengeushi';

  @override
  String get prayerGuard => 'Mlinzi wa Swala';

  @override
  String get importantDates => 'Tarehe Muhimu';

  @override
  String get comingSoon => 'Inakuja Hivi Karibuni';

  @override
  String get morningAndEvening => 'Asubuhi na Jioni';

  @override
  String get prayer => 'Swala';

  @override
  String get foodAndDrink => 'Chakula na Kinywaji';

  @override
  String get verityWithHardship => 'Hakika, pamoja na uzito huja wepesi.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Zilindeni swala zenu, hasa swala ya kati.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Matukio Yaliyopita';

  @override
  String get upcomingEvents => 'Matukio Yajayo';

  @override
  String get today => 'Leo';

  @override
  String get next => 'Ijayo';

  @override
  String hijriYearLabel(int year) {
    return '$year H.';
  }

  @override
  String get islamicMonthMuharram => 'Muharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabi\'ul-Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabi\'ul-Thani';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumadal-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumadal-Thani';

  @override
  String get islamicMonthRajab => 'Rajabu';

  @override
  String get islamicMonthShaban => 'Shaabani';

  @override
  String get islamicMonthRamadan => 'Ramadhani';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qa\'da';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Mwaka Mpya wa Kiislamu';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Maulidi ya Mtume';

  @override
  String get ramadanBegins => 'Ramadhani Inaanza';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Siku ya Arafa';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Inaendelea';

  @override
  String get focusModeSubtitle =>
      'Linda umakini wako. Programu zako zimezuiwa hadi utakaposimamisha kipindi.';

  @override
  String get remaining => 'iliyobaki';

  @override
  String get ready => 'tayari';

  @override
  String get duration => 'Muda';

  @override
  String get minutesAbbreviation => 'dak';

  @override
  String get blockedDuringFocus => 'Zilizozuiwa wakati wa umakini';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'programu $count',
      one: 'programu $count',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Anza Umakini';

  @override
  String get stopFocus => 'Simamisha Umakini';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Kipindi Kimekamilika';

  @override
  String stayedFocusedFor(String duration) {
    return 'Umebaki makini kwa $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dakika $count',
      one: 'dakika $count',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"Na tafuteni msaada kwa kusubiri na kuswali.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Imekamilika';

  @override
  String get socialMedia => 'Mitandao ya Kijamii';

  @override
  String get entertainment => 'Burudani';

  @override
  String get games => 'Michezo';

  @override
  String get messaging => 'Ujumbe';

  @override
  String get blockDuringPrayerTimes => 'Zuia wakati wa swala';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Programu zilizochaguliwa zitazuiwa kiotomatiki\nwakati wa swala 5 za kila siku.';

  @override
  String get blockedLabel => 'zimezuiwa';

  @override
  String get blockAllApps => 'Zuia Programu Zote';

  @override
  String get blockingTimingInfo =>
      'Kuzuia huanza dakika 5 kabla ya kila swala na huondolewa dakika 15 baada yake.';

  @override
  String get blockedDuringPrayers => 'Imezuiwa wakati wa swala';

  @override
  String get notBlocked => 'Haijazuiwa';

  @override
  String get wuduStep1 => 'Nia';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Osha Mikono';

  @override
  String get wuduStep4 => 'Suuza Mdomo';

  @override
  String get wuduStep5 => 'Safisha Pua';

  @override
  String get wuduStep6 => 'Osha Uso';

  @override
  String get wuduStep7 => 'Osha Mikono ya Mbali';

  @override
  String get wuduStep8 => 'Pangusa Kichwa';

  @override
  String get wuduStep9 => 'Osha Miguu';

  @override
  String get revertCorner => 'Kona ya Mwongofu';

  @override
  String get revertCornerSubtitle => 'Mwongozo na msaada kwa Waislamu wapya';

  @override
  String get wuduGuide => 'Mwongozo wa Udhu';

  @override
  String get howToPray => 'Jinsi ya Kuswali';

  @override
  String get newMuslimChecklist => 'Orodha ya Mwislamu Mpya';

  @override
  String get islamicGlossary => 'Kamusi ya Kiislamu';

  @override
  String get whyDoWe => 'Kwa Nini Tunafanya...';

  @override
  String get communityStories => 'Hadithi za Jamii';

  @override
  String get wuduGuideSubtitle => 'Utakaso kabla ya swala';

  @override
  String get howToPraySubtitle => 'Mwongozo wa hatua kwa hatua wa swala';

  @override
  String get newMuslimChecklistSubtitle => 'Safari yako ya siku 30';

  @override
  String get howToPrayStep1Name => 'Kwanza Udhu';

  @override
  String get howToPrayStep1Instruction =>
      'Tia udhu (utakaso wa maji) ili uwe katika hali ya usafi kabla ya kuanza kuswali.';

  @override
  String get howToPrayStep1Tip =>
      'Kama hauna uhakika, fungua kwanza Mwongozo wa Udhu kutoka Kituo cha Mwislamu Mpya.';

  @override
  String get howToPrayStep2Name => 'Simama Ukielekea Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Simama kwenye mkeka wako wa swala ukielekea Qibla — mwelekeo wa Al-Kaaba huko Makka. Tumia dira ya Qibla kwenye programu kupata mwelekeo sahihi.';

  @override
  String get howToPrayStep2Tip =>
      'Hakuna tatizo kama umepotoka kidogo — Allah anajua nia yako. Fanya juhudi yako bora.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Nia)';

  @override
  String get howToPrayStep3Instruction =>
      'Weka nia moyoni mwako kwa ajili ya swala unayotaka kuiswali. Hauhitaji kuitamka kwa sauti.';

  @override
  String get howToPrayStep3Tip =>
      'Nia yako ni kati yako na Allah. Wazo rahisi kama \'Naswali Fajr kwa ajili ya Allah\' linatosha.';

  @override
  String get howToPrayStep4Name => 'Takbir (Ufunguzi)';

  @override
  String get howToPrayStep4Instruction =>
      'Inua mikono yako miwili hadi kwenye ncha za masikio na sema \'Allahu Akbar\' (Allah Ndiye Mkubwa Zaidi). Hii ndiyo huanzisha rasmi swala yako.';

  @override
  String get howToPrayStep4Tip =>
      'Weka macho yako yakielekea chini, mahali pa kusujudia, wakati wote wa swala.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Kusimama)';

  @override
  String get howToPrayStep5Instruction =>
      'Weka mkono wako wa kulia juu ya mkono wako wa kushoto kifuani. Soma Surah Al-Fatiha ikifuatiwa na sura nyingine fupi au aya unazozijua.';

  @override
  String get howToPrayStep5Tip =>
      'Kama bado hujui sura nyingine, kusoma Al-Fatiha pekee kunatosha wakati bado unajifunza.';

  @override
  String get howToPrayStep6Name => 'Ruku (Kuinama)';

  @override
  String get howToPrayStep6Instruction =>
      'Inama kwa kupinda kiunoni huku mgongo wako ukiwa sawa na ardhi. Weka mikono yako juu ya magoti na sema \'Subhana Rabbiyal Adheem\' mara tatu.';

  @override
  String get howToPrayStep6Tip =>
      'Weka mgongo wako ulionyooka na sawa — usiwe umepinda wala kuviringika.';

  @override
  String get howToPrayStep7Name => 'I\'tidal (Kunyanyuka kutoka Ruku)';

  @override
  String get howToPrayStep7Instruction =>
      'Nyanyuka kutoka kwenye ruku na simama wima. Sema \'Sami Allahu liman hamidah\' unapoinuka, kisha sema \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Simama wima kabisa na tulia kwa muda kabla ya kuendelea hatua inayofuata.';

  @override
  String get howToPrayStep8Name => 'Sujud (Kusujudu)';

  @override
  String get howToPrayStep8Instruction =>
      'Shuka chini ukiweka kipaji cha uso, pua, viganja vyote viwili, magoti na vidole vya miguu sakafuni. Sema \'Subhana Rabbiyal A\'la\' mara tatu.';

  @override
  String get howToPrayStep8Tip =>
      'Sehemu saba za mwili lazima ziguse ardhi: kipaji cha uso (pamoja na pua), mikono miwili, magoti mawili na miguu miwili.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Kukaa Kati ya Sijida)';

  @override
  String get howToPrayStep9Instruction =>
      'Inuka kutoka sijida ukikaa na mguu wa kushoto umelala chini na mguu wa kulia umesimama. Sema \'Allahu Akbar\' unapokaa. Tulia kidogo, kisha shuka tena kwa sijida ya pili.';

  @override
  String get howToPrayStep9Tip =>
      'Kukaa huku kwa kifupi kati ya sijida mbili kunaitwa Jalsa. Ni sehemu ya lazima ya swala.';

  @override
  String get howToPrayStep10Name => 'Kamilisha Vipande vya Swala';

  @override
  String get howToPrayStep10Instruction =>
      'Baada ya kukamilisha rakaa ya kwanza, simama na rudia hatua zile zile kwa rakaa ya pili. Idadi ya rakaa inategemea swala unayoiswali.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr ina rakaa 2, Dhuhr 4, Asr 4, Maghrib 3 na Isha 4. Fanya rakaa moja kwa wakati mmoja.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Kukaa kwa Mwisho)';

  @override
  String get howToPrayStep11Instruction =>
      'Katika hali ya kukaa ya mwisho, soma Tashahhud. Hii ni tamko la imani unalolisoma ukiwa umekaa baada ya rakaa yako ya mwisho.';

  @override
  String get howToPrayStep11Tip =>
      'Wakati wa Tashahhud, inua kidole chako cha shahada cha mkono wa kulia unaposema \'Ash-hadu alla ilaha illallah\' kuashiria umoja wa Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Kumalizia)';

  @override
  String get howToPrayStep12Instruction =>
      'Geuza kichwa chako kuelekea kulia na sema \'Assalamu Alaikum wa Rahmatullah\', kisha geuka kushoto na rudia. Hii inamaliza swala yako.';

  @override
  String get howToPrayStep12Tip =>
      'Baada ya swala, chukua muda kufanya dua na umuombe Allah unachohitaji. Huu ni wakati mzuri wa kuungana na Allah.';

  @override
  String get checklistWeek1Title => 'Wiki ya 1';

  @override
  String get checklistWeek2Title => 'Wiki ya 2';

  @override
  String get checklistWeek3Title => 'Wiki ya 3';

  @override
  String get checklistWeek4Title => 'Wiki ya 4';

  @override
  String get checklistWeek1Item1 => 'Tamka Shahada';

  @override
  String get checklistWeek1Item2 => 'Jifunze Udhu';

  @override
  String get checklistWeek1Item3 => 'Jifunze Al-Fatiha';

  @override
  String get checklistWeek1Item4 => 'Swali Fajr yako ya kwanza';

  @override
  String get checklistWeek1Item5 => 'Pata mkeka wa swala';

  @override
  String get checklistWeek1Item6 => 'Tafuta msikiti wa karibu';

  @override
  String get checklistWeek2Item1 => 'Jifunze nyakati 5 za swala';

  @override
  String get checklistWeek2Item2 => 'Jifunze dua za msingi';

  @override
  String get checklistWeek2Item3 => 'Soma kuhusu Mtume Muhammad';

  @override
  String get checklistWeek2Item4 => 'Ungana na jamii ya Kiislamu';

  @override
  String get checklistWeek3Item1 => 'Jifunze kuhusu chakula halali';

  @override
  String get checklistWeek3Item2 => 'Soma Surah Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Jifunze kuhusu Ramadhani';

  @override
  String get checklistWeek3Item4 => 'Anza dhikr ya kila siku';

  @override
  String get checklistWeek4Item1 => 'Jifunze kuhusu Zaka';

  @override
  String get checklistWeek4Item2 => 'Soma kuhusu nguzo 5 za Uislamu';

  @override
  String get checklistWeek4Item3 => 'Weka arifa za swala';

  @override
  String get checklistWeek4Item4 => 'Tafakari safari yako';

  @override
  String get wuduStep1Instruction =>
      'Weka nia moyoni mwako ya kutia udhu kwa ajili ya Allah.';

  @override
  String get wuduStep1Tip =>
      'Hauhitaji kuitamka kwa sauti — nia ya kweli moyoni inatosha.';

  @override
  String get wuduStep2Instruction =>
      'Sema Bismillah (Kwa Jina la Allah) kabla ya kuanza.';

  @override
  String get wuduStep2Tip =>
      'Kusema Bismillah ni sunna na huanzisha udhu wako kwa kumkumbuka Allah.';

  @override
  String get wuduStep3Instruction =>
      'Osha mikono yote miwili hadi kwenye viwiko vya mikono mara tatu, hakikisha maji yanafika kati ya vidole.';

  @override
  String get wuduStep3Tip =>
      'Anza na mkono wa kulia, kisha wa kushoto. Mpangilio huu unapendekezwa katika Uislamu.';

  @override
  String get wuduStep4Instruction =>
      'Chukua maji mdomoni, suuza kisha tema. Fanya hivi mara tatu.';

  @override
  String get wuduStep4Tip =>
      'Hii husafisha mdomo na ni sehemu ya mchakato wa utakaso.';

  @override
  String get wuduStep5Instruction =>
      'Vuta maji kwa pua kisha yatoe kwa upole. Fanya hivi mara tatu.';

  @override
  String get wuduStep5Tip =>
      'Tumia mkono wako wa kulia kuvuta maji na mkono wa kushoto kuyatoa.';

  @override
  String get wuduStep6Instruction =>
      'Osha uso wako wote mara tatu, kuanzia mpaka wa nywele hadi kidevuni na sikio hadi sikio.';

  @override
  String get wuduStep6Tip =>
      'Hakikisha hakuna sehemu ya uso wako iliyobaki kavu.';

  @override
  String get wuduStep7Instruction =>
      'Osha mkono wako wa kulia kuanzia ncha za vidole hadi kiwikoni mara tatu, kisha fanya vivyo hivyo na mkono wa kushoto.';

  @override
  String get wuduStep7Tip =>
      'Daima anza na upande wa kulia kabla ya wa kushoto katika udhu.';

  @override
  String get wuduStep8Instruction =>
      'Loweka mikono yako kisha pangusa kichwa chako chote mara moja, kuanzia mbele kwenda nyuma na kurudi mbele.';

  @override
  String get wuduStep8Tip =>
      'Tofauti na kuosha, kupangusa kichwa hufanyika mara moja tu.';

  @override
  String get wuduStep9Instruction =>
      'Osha mguu wako wa kulia hadi kifundo cha mguu pamoja nacho mara tatu, kisha fanya vivyo hivyo na mguu wa kushoto.';

  @override
  String get wuduStep9Tip =>
      'Hakikisha maji yanafika kati ya vidole vya miguu. Tumia kidole chako kusafisha kati yake.';

  @override
  String get islamicGlossaryTitle => 'Kamusi ya Kiislamu';

  @override
  String get islamicGlossarySubtitle =>
      'Maneno 51 kutoka Qur\'ani, Sunna na elimu ya wanazuoni wa kale';

  @override
  String get searchTermsHint => 'Tafuta maneno, Kiarabu, maelezo...';

  @override
  String get categoryAll => 'Yote';

  @override
  String get categoryPillar => 'Nguzo';

  @override
  String get categoryAqeedah => 'Aqida';

  @override
  String get categoryPractice => 'Ibada';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Qur\'ani';

  @override
  String get categoryHadith => 'Hadithi';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Historia';

  @override
  String get noTermsFound => 'Hakuna maneno yaliyopatikana';

  @override
  String get sourceLabel => 'Chanzo';

  @override
  String get revertCornerHubSubtitle =>
      'Kituo chenye upendo cha kukuongoza katika hatua zako za kwanza kama Mwislamu mpya';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Maneno ya kawaida yaliyofafanuliwa kwa urahisi';

  @override
  String get whyDoWeHubSubtitle => 'Hekima nyuma ya ibada za kila siku';

  @override
  String get communityStoriesHubSubtitle =>
      'Waongofu wanashiriki safari zao kuelekea Uislamu';

  @override
  String get whyDoWeScreenSubtitle =>
      'Hekima nyuma ya ibada 12 za Kiislamu za kila siku';

  @override
  String get whyDoWeSourceBadge => 'Chanzo cha Kisuni';

  @override
  String get whyDoWeQ1 => 'Kwa nini tunaswali mara 5 kwa siku?';

  @override
  String get whyDoWeA1 =>
      'Allah aliamuru swala tano za kila siku katika Qur\'ani (2:238) nazo zilianzishwa wakati wa Safari ya Usiku (Israa wal Miraj). Mtume ﷺ alisema: «Jambo la kwanza atakaloulizwa mja Siku ya Kiyama ni swala.» (Ibn Majah). Swala hutuweka tukiwa na uhusiano na Allah katika kipindi chote cha siku.';

  @override
  String get whyDoWeQ2 => 'Kwa nini tunaelekea Makka tunaposwali?';

  @override
  String get whyDoWeA2 =>
      'Allah aliamuru katika Qur\'ani (2:144): «Geuza uso wako kuelekea Msikiti Mtukufu.» Al-Kaaba huko Makka ni nyumba ya kwanza iliyojengwa kwa ajili ya ibada ya Allah (3:96). Kuelekea upande mmoja huwaunganisha Waislamu wote duniani katika swala.';

  @override
  String get whyDoWeQ3 => 'Kwa nini tunafunga Ramadhani?';

  @override
  String get whyDoWeA3 =>
      'Allah aliamuru saumu katika Qur\'ani (2:183): «Enyi mlioamini! Mmeandikiwa kufunga, kama walivyoandikiwa wale wa kabla yenu, ili mpate kumcha Mungu.» Ramadhani ni mwezi ambao Qur\'ani iliteremshwa (2:185).';

  @override
  String get whyDoWeQ4 => 'Kwa nini tunasema Bismillah kabla ya kula?';

  @override
  String get whyDoWeA4 =>
      'Mtume ﷺ alisema: «Mmoja wenu anapokula, na alitaje jina la Allah. Akisahau mwanzoni, na aseme: Bismillah mwanzo na mwisho wake.» (Abu Dawud). Hii inatukumbusha kwamba neema zote zinatoka kwa Allah.';

  @override
  String get whyDoWeQ5 => 'Kwa nini tunavua viatu kabla ya kuingia msikitini?';

  @override
  String get whyDoWeA5 =>
      'Allah alipomwamuru Musa: «Vua viatu vyako, kwani upo katika bonde takatifu la Tuwa.» (Qur\'ani 20:12). Kuvua viatu ni ishara ya heshima kwa nyumba ya Allah na husaidia kuweka mahali pa kuswalia safi.';

  @override
  String get whyDoWeQ6 => 'Kwa nini tunasema Assalamu Alaikum kama salamu?';

  @override
  String get whyDoWeA6 =>
      'Mtume ﷺ alisema: «Hamtaingia Peponi mpaka muamini, na hamtaamini mpaka mpendane. Je, niwaonyeshe kitu ambacho mkikifanya mtapendana? Enezeni salamu baina yenu.» (Muslim). Pia ni dua — unamwombea mtu huyo amani.';

  @override
  String get whyDoWeQ7 => 'Kwa nini tunafanya Hija?';

  @override
  String get whyDoWeA7 =>
      'Hija iliamuriwa na Allah (3:97): «Na ni juu ya watu, kwa ajili ya Allah, kuihiji Nyumba hii kwa anayeweza kufika.» Inakumbuka majaribu ya Mtume Ibrahim na familia yake, na huwaunganisha Waislamu wa mataifa yote katika ibada.';

  @override
  String get whyDoWeQ8 => 'Kwa nini tunatoa Zaka?';

  @override
  String get whyDoWeA8 =>
      'Zaka ni nguzo ya tatu ya Uislamu, iliyoamriwa katika Qur\'ani zaidi ya mara 30 pamoja na swala. Mtume ﷺ alisema kuwa husafisha mali. Hupunguza tofauti ya kimaisha na kuwakumbusha waumini kwamba mali ni ya Allah.';

  @override
  String get whyDoWeQ9 =>
      'Kwa nini tunasema Alhamdulillah baada ya kupiga chafya?';

  @override
  String get whyDoWeA9 =>
      'Mtume ﷺ alisema: «Mmoja wenu akipiga chafya, na aseme Alhamdulillah, na ndugu yake na amwambie Yarhamukallah.» (Bukhari). Ni wakati wa kumshukuru Allah kwa neema ya afya.';

  @override
  String get whyDoWeQ10 => 'Kwa nini wanawake Waislamu huvaa hijabu?';

  @override
  String get whyDoWeA10 =>
      'Allah aliamuru katika Qur\'ani (24:31) kwamba waumini wa kike wajilinde na kuficha mapambo yao. Hijabu ni kitendo cha ibada na utiifu kwa Allah. Wanawake wengi Waislamu wanauvaa kama chanzo cha utambulisho, heshima na uhusiano wa kiroho.';

  @override
  String get whyDoWeQ11 => 'Kwa nini tunaepuka nguruwe na pombe?';

  @override
  String get whyDoWeA11 =>
      'Allah aliharamisha nyama ya nguruwe katika Qur\'ani (2:173) na pombe (5:90), akiziita «uchafu unaotokana na kazi ya Shetani.» Makatazo haya hulinda afya, akili na familia. Miongozo ya halali husaidia kudumisha usafi wa kimwili na kiroho.';

  @override
  String get whyDoWeQ12 => 'Kwa nini tunasema Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah anaamuru katika Qur\'ani (18:23-24): «Wala usiseme kwa jambo lolote: Hakika nitalifanya hilo kesho, bila kusema: Akipenda Allah.» Kusema Inshallah kunatambua kwamba ni Allah pekee anayeudhibiti wakati ujao na hutuweka wanyenyekevu.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Safari halisi kuelekea Uislamu kutoka pande zote za dunia';

  @override
  String get communityStoriesTimeLabel => 'Muda akiwa Mwislamu';

  @override
  String get communityStoriesShareBtn => 'Shiriki Hadithi Yako';

  @override
  String get communityStoriesShareSoon =>
      'Inakuja hivi karibuni — kipengele hiki kinakuja!';

  @override
  String get communityStory1Name => 'Aisha (zamani Sarah)';

  @override
  String get communityStory1Location => 'Texas, Marekani';

  @override
  String get communityStory1Time => 'miaka 2';

  @override
  String get communityStory1Text =>
      'Niliupata Uislamu nikifanya utafiti kwa ajili ya kazi ya chuo. Nilitarajia kukuta kile vyombo vya habari vilichokuwa vikiniambia. Badala yake, nilikuta amani, mantiki, na Mungu ambaye alikuwa na maana. Nilitamka shahada yangu miezi 6 baadaye. Jambo gumu zaidi halikuwa kujifunza kuswali — bali kuwaambia familia yangu. Lakini Alhamdulillah, baada ya miaka miwili, mama yangu sasa ananiuliza kuhusu Uislamu mwenyewe.';

  @override
  String get communityStory2Name => 'Yusuf (zamani James)';

  @override
  String get communityStory2Location => 'London, Uingereza';

  @override
  String get communityStory2Time => 'miaka 4';

  @override
  String get communityStory2Text =>
      'Niliingia Uislamu baada ya miaka ya kutafuta. Ukristo, Ubudha, kutokuamini Mungu — hakuna kilichoziba pengo lile. Rafiki Mwislamu mwenzangu kazini alinialika kwenye swala ya Ijumaa. Niliketi nyuma na kulia muda wote. Sikujua hata kwa nini. Nilitamka shahada yangu wiki iliyofuata. Jamii ilinizunguka kama familia ambayo sikuwahi kujua niliihitaji.';

  @override
  String get communityStory3Name => 'Maryam (zamani Maria)';

  @override
  String get communityStory3Location => 'Mexico City, Mexico';

  @override
  String get communityStory3Time => 'mwaka 1';

  @override
  String get communityStory3Text =>
      'Kuwa Mlatino na Mwislamu kunahisi kama nguvu maalum. Niliupata Uislamu kupitia video ya YouTube saa 2 usiku. Niliangalia kwa masaa. Dhana ya Tawhid — kwamba Mungu ni mmoja, hana washirika, hana picha — ilinigusa moyoni kwa kina sana. Dada zangu wanaozungumza Kihispania msikitini walinifanya nijisikie nyumbani mara moja.';

  @override
  String get communityStory4Name => 'Ibrahim (zamani David)';

  @override
  String get communityStory4Location => 'Toronto, Canada';

  @override
  String get communityStory4Time => 'miaka 6';

  @override
  String get communityStory4Text =>
      'Nilikuwa mwana wa mchungaji. Nilikuwa na maswali kuhusu Utatu ambayo hakuna mtu aliyeweza kuyajibu. Nilipoisoma Qur\'ani mara ya kwanza, nilihisi kama nasoma kitu nilichokishaamini tayari. Nilitamka shahada yangu kimya kimya, peke yangu, kisha tena msikitini. Uamuzi bora zaidi wa maisha yangu.';

  @override
  String get communityStory5Name => 'Fatima (zamani Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australia';

  @override
  String get communityStory5Time => 'miaka 3';

  @override
  String get communityStory5Text =>
      'Safari yangu ilianza na hijabu. Niliivaa kama changamoto na nikahisi... ulinzi. Nilianza kusoma kuhusu Uislamu na sikuweza kuacha. Ndani ya miezi mitatu nilikuwa nimeshatamka shahada yangu. Watu huniuliza niliacha nini nyuma. Nawaambia niliacha utupu.';

  @override
  String get communityStory6Name => 'Omar (zamani Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Afrika Kusini';

  @override
  String get communityStory6Time => 'miaka 5';

  @override
  String get communityStory6Text =>
      'Nilikulia katika mtaa mgumu. Uislamu ulinipa nidhamu, lengo na undugu. Mara ya kwanza niliposujudu, kitu ndani yangu kilifunguka — kwa namna nzuri. Nililia na sikuweza kueleza kwa nini. Sasa naongoza vijana wengine wanaotafuta njia yao kuelekea dini.';

  @override
  String get inspiredByRealStories =>
      'Imeongozwa na hadithi halisi za waongofu';

  @override
  String get storyFormTitle => 'Shiriki Hadithi Yako';

  @override
  String get storyFormNameLabel => 'Jina Lako';

  @override
  String get storyFormNameHint => 'Jina, au andika \'Bila Jina\'';

  @override
  String get storyFormCountryLabel => 'Nchi';

  @override
  String get storyFormCountryHint => 'Unatoka wapi?';

  @override
  String get storyFormTimeLabel => 'Muda akiwa Mwislamu';

  @override
  String get storyFormTimeHint => 'mfano: miaka 2, miezi 6';

  @override
  String get storyFormStoryLabel => 'Hadithi Yako';

  @override
  String get storyFormStoryHint => 'Shiriki safari yako kuelekea Uislamu...';

  @override
  String get storyFormSubmitBtn => 'Tuma Hadithi';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khayr!';

  @override
  String get storyFormThankYouBody =>
      'Hadithi yako imepokelewa. Tunapitia hadithi zote kabla ya kuzichapisha.';

  @override
  String get storyFormRequiredError => 'Tafadhali jaza sehemu zote';

  @override
  String get subtitleYourGuideToIslam => 'Mwongozo wako kuelekea Uislamu';

  @override
  String get beginnerMode => 'Hali ya Mwanzilishi';

  @override
  String get beginnerModeSubtitle =>
      'Vidokezo na mwongozo wa ziada kwa Waislamu wapya';

  @override
  String get beginnerModeOn =>
      'Hali ya mwanzilishi imewashwa — vidokezo vya ziada vinaonyeshwa katika programu nzima';

  @override
  String get beginnerModePrayersTip =>
      'Kidokezo: Gusa kila swala ili kujifunza zaidi kuihusu na kuona swala za sunna';

  @override
  String get tafsirSubtitle => 'Ufafanuzi wa Qur\'ani';

  @override
  String get tafsirComingSoon =>
      'Tafsiri ya sura hii itapatikana hivi karibuni';

  @override
  String get tafsirNotAvailable => 'Tafsiri haipatikani';

  @override
  String get scholarSource => 'Chanzo';

  @override
  String get asbabAlNuzul => 'Sababu ya Kuteremshwa';

  @override
  String get transliteration => 'Matamshi kwa Herufi za Kilatini';

  @override
  String get selectReciter => 'Chagua Msomaji';

  @override
  String get playVerse => 'Cheza Aya';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'Majina 99 Mazuri ya Allah';

  @override
  String get asmaHadith =>
      'Allah ana majina 99. Atakayeyahifadhi ataingia Peponi.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Tafuta majina...';

  @override
  String get asmaNoResults => 'Hakuna majina yaliyopatikana';

  @override
  String get asmaSignificance => 'Maana';

  @override
  String get asmaUlHusnaTile => 'Majina 99';

  @override
  String get asmaUlHusnaTileSubtitle => 'Majina ya Allah';

  @override
  String get onboardingTagline => 'Linda muda wako. Heshimu swala zako.';

  @override
  String get onboardingChooseLanguage => 'Chagua lugha yako';

  @override
  String get onboardingGetStarted => 'Anza';

  @override
  String get onboardingLocationTitle => 'Nyakati Sahihi za Swala';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard inahitaji mahali ulipo ili kuhesabu nyakati sahihi za swala za jiji lako. Mahali ulipo hapatahifadhiwa wala kushirikiwa kamwe.';

  @override
  String get onboardingPrivacyBanner =>
      'Imani yako ni jambo lako binafsi. Data yako pia ni yako binafsi.';

  @override
  String get onboardingAllowLocation => 'Ruhusu Mahali Ulipo';

  @override
  String get onboardingSkipForNow => 'Ruka kwa sasa';

  @override
  String get onboardingNotificationTitle => 'Usikose Swala Tena';

  @override
  String get onboardingNotificationDesc =>
      'Pokea arifa kwa kila wakati wa swala kwa adhana nzuri. Badilisha sauti na nyakati katika mipangilio.';

  @override
  String get onboardingAdhanAlerts => 'Arifa za adhana';

  @override
  String get onboardingCustomTiming => 'Nyakati maalum';

  @override
  String get onboardingAdjustable => 'Inabadilika';

  @override
  String get onboardingEnableNotifications => 'Washa Arifa';

  @override
  String get onboardingMaybeLater => 'Labda baadaye';

  @override
  String get onboardingAllSetTitle => 'Tayari Kabisa!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard iko tayari kulinda muda wako\nna kuongoza siku yako kwa nia njema.';

  @override
  String get onboardingPrayerTimesLabel => 'Nyakati za Swala';

  @override
  String get onboardingPrayerTimesDesc => 'Nyakati sahihi kwa jiji lako';

  @override
  String get onboardingLockScreenLabel => 'Skrini ya Kufuli ya Kiislamu';

  @override
  String get onboardingLockScreenDesc =>
      'Qur\'ani na dua kila unapofungua simu';

  @override
  String get onboardingPrayerGuardLabel => 'Mlinzi wa Swala';

  @override
  String get onboardingPrayerGuardDesc =>
      'Programu zinazuiwa kiotomatiki wakati wa swala';

  @override
  String get onboardingEnterApp => 'Ingia Noor Guard';

  @override
  String get adhan => 'Adhana';

  @override
  String get adhanSubtitle => 'Mwito wa Swala';

  @override
  String get adhanDescription =>
      'Adhana ni mwito wa Kiislamu wa swala, unaotangazwa mara tano kwa siku kuwakaribisha waumini kuabudu.';

  @override
  String get makkahStyle => 'Makka';

  @override
  String get madinahStyle => 'Madina';

  @override
  String get egyptianStyle => 'Kimisri';

  @override
  String get adhanPlaying => 'Inacheza Sasa';

  @override
  String get makkahDescription =>
      'Mwito wa kitamaduni wa swala kutoka Msikiti Mkuu wa Makka.';

  @override
  String get madinahDescription =>
      'Mtindo wa utulivu kwa namna ya Msikiti wa Mtume huko Madina.';

  @override
  String get egyptianDescription =>
      'Adhana ya mtindo wa Misri yenye sauti tamu, inayojulikana kwa usomaji wake mzuri.';

  @override
  String get adhanCallToWorship => 'Mwito wa Swala';

  @override
  String get adhanDescriptionFull =>
      'Adhana ni mwito wa Kiislamu wa swala, unaotangazwa mara tano kwa siku kuwakaribisha waumini kuabudu.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Kituruki';

  @override
  String get pakistaniStyle => 'Kipakistani';

  @override
  String get indonesianStyle => 'Kiindonesia';

  @override
  String get alafasyDescription =>
      'Mwito wenye mvuto kutoka kwa msomaji maarufu Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'Mwito wa swala unaosikika kutoka Msikiti wa Al-Aqsa huko Yerusalemu, mahali patakatifu pa tatu katika Uislamu.';

  @override
  String get turkishDescription =>
      'Adhana ya kimapokeo ya kituruki yenye maqam yake ya kipekee ya muziki.';

  @override
  String get pakistaniDescription =>
      'Adhana yenye mvuto katika mapokeo ya Asia Kusini, inayosomwa kote Pakistan.';

  @override
  String get indonesianDescription =>
      'Adhana tamu ya kiindonesia, inayopendwa kote katika visiwa hivyo.';

  @override
  String get thisWeek => 'Wiki Hii';

  @override
  String weeklyProgress(int count) {
    return 'Swala $count kati ya 35 wiki hii';
  }

  @override
  String get bestDay => 'Siku bora';

  @override
  String get prayerStats => 'Takwimu za Swala';

  @override
  String get completionRate => 'Kiwango cha Ukamilishaji';

  @override
  String get bestPrayer => 'Swala Inayotekelezwa Zaidi';

  @override
  String get hardestPrayer => 'Swala Inayokosekana Zaidi';

  @override
  String totalPrayersCompleted(int count) {
    return 'Swala $count zimekamilika';
  }

  @override
  String get last7Days => 'Siku 7 Zilizopita';

  @override
  String get thisMonth => 'Mwezi Huu';

  @override
  String get fullDays => 'Siku kamili';

  @override
  String get partialDays => 'Siku za sehemu';

  @override
  String get missedDays => 'Siku zilizokosekana';

  @override
  String get missedPrayerBadge => 'Imekosekana';

  @override
  String get makeItUp => 'Lipa Qada';

  @override
  String get qadaExplanation =>
      'Ikiwa umekosa swala, bado unaweza kuiswali kama swala ya Qada (ya kufidia).';

  @override
  String get noStatsYet =>
      'Endelea kuweka alama za swala zako ili kuona takwimu zako hapa.';

  @override
  String get notEnoughData => 'Hakuna data ya kutosha bado';

  @override
  String get continuousPlay => 'Endelea';

  @override
  String get sleepTimer => 'Kichwa cha kulala';

  @override
  String verseCount(Object total, Object verse) {
    return 'Aya $verse kati ya $total';
  }

  @override
  String get verseTafsir => 'Tafsiri ya Aya';

  @override
  String get tafsirOfTheDay => 'Tafsiri ya Leo';

  @override
  String get dailyInsight => 'Maarifa ya Kila Siku';

  @override
  String get keyThemes => 'Mada na Masomo Muhimu';

  @override
  String get readFullSurah => 'Soma Sura Kamili';

  @override
  String get surahIntroduction => 'Utangulizi wa Sura';

  @override
  String get verses => 'aya';

  @override
  String get loadingTafsir => 'Inapakia tafsiri...';

  @override
  String get keepAliveNotificationText => 'Arifa za sala zinatumika';

  @override
  String get keepAliveChannelName => 'Arifa za Sala';

  @override
  String get keepAliveChannelDescription =>
      'Inamfanya Noor Guard kuendelea kufanya kazi nyuma ili kengele za sala zisikose kamwe.';

  @override
  String get notifSetupTitle => 'Wezesha Arifa za Skrini Iliyofungwa';

  @override
  String get notifSetupSubtitle =>
      'Ili usikose adhana kamwe — hata simu yako ikiwa imefungwa. Inachukua dakika moja tu.';

  @override
  String get notifSetupSamsungBanner =>
      'Unatumia Samsung Galaxy (ikiwemo Fold/Flip)? Samsung huongeza vibadilishi vya ziada zaidi ya Android ya kawaida — Hatua ya 4 na 6 chini zinakuonyesha hasa pa kuvipata.';

  @override
  String get notifSetupStep1Title => 'Ruhusu Arifa';

  @override
  String get notifSetupStep1Description =>
      'Idhini ya msingi ambayo Noor Guard inahitaji ili kukuarifu kabisa.';

  @override
  String get notifSetupStep1Action => 'Ruhusu Arifa';

  @override
  String get notifSetupStep2Title => 'Kengele na Vikumbusho';

  @override
  String get notifSetupStep2Description =>
      'Huruhusu kengele za sala kulia wakati halisi wa sala, hata simu yako ikiwa tulivu au katika hali ya kuokoa betri.';

  @override
  String get notifSetupStep2Action => 'Fungua Mipangilio ya Kengele';

  @override
  String get notifSetupStep3Title => 'Onyesha Juu ya Programu Nyingine';

  @override
  String get notifSetupStep3Description =>
      'Huruhusu skrini kamili ya sala kuonekana juu ya skrini iliyofungwa na chochote kingine kilichofunguliwa.';

  @override
  String get notifSetupStep3Action => 'Fungua Mipangilio';

  @override
  String get notifSetupStep4Title =>
      'Onyesha kama Arifa Inayoduka / Skrini Kamili';

  @override
  String get notifSetupStep4Description =>
      'Huruhusu skrini ya adhana kupasua skrini iliyofungwa badala ya kubaki bango la kimya.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Kwenye simu za Samsung Galaxy (ikiwemo Fold/Flip): fungua Mipangilio → bonyeza \"Prayer Time Alarm\", kisha wezesha \"Pop-up notification\" (inayoitwa \"Cover screen pop-up\" kwenye Fold/Flip). Hii ni kibadilishi cha Samsung pekee — kukiwezesha ndiko hasa kunakofanya skrini ya adhana ionekane juu ya skrini yako iliyofungwa.';

  @override
  String get notifSetupStep4Action => 'Fungua Mipangilio ya Arifa';

  @override
  String get notifSetupStep5Title => 'Hifadhi Arifa za Kutegemewa';

  @override
  String get notifSetupStep5Description =>
      'Huzuia Android kupunguza kasi au kuchelewesha Noor Guard nyuma, ili kengele na vikumbusho vya sala vifike kwa wakati kila mara.';

  @override
  String get notifSetupStep5Action => 'Zima Uboreshaji wa Betri';

  @override
  String get notifSetupStep6Title => 'Programu Zisizolala Kamwe';

  @override
  String get notifSetupStep6Description =>
      'Kidhibiti betri cha Samsung kinaweza kuilaza Noor Guard na kuzuia kimya kengele za sala. Kuiweka kwenye \"Never sleeping apps\" huzuia hili.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Mipangilio → Betri na Utunzaji wa Kifaa → Mipaka ya Matumizi ya Nyuma → Never sleeping apps → bonyeza \"+\" → chagua Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Fungua Mipangilio ya Betri';

  @override
  String get notifSetupStatusChecking => 'Inakagua…';

  @override
  String get notifSetupStatusEnabled => 'Imewezeshwa';

  @override
  String get notifSetupStatusNeeded => 'Inahitajika';

  @override
  String get notifSetupStatusManual => 'Hatua ya Mkono';

  @override
  String get notifSetupContinueButton => 'Endelea kwenda Noor Guard';

  @override
  String get notifSetupLaterButton => 'Nitaikamilisha baadaye';

  @override
  String get notifSetupDoneButton => 'Imekamilika';

  @override
  String get testNotificationButton => 'Tuma Arifa ya Jaribio (sekunde 10)';

  @override
  String get testNotificationSnack =>
      'Arifa ya jaribio itafika baada ya sekunde 10';

  @override
  String get testLockAlarmButton =>
      'Jaribu Kengele ya Skrini Kamili (sekunde 10)';

  @override
  String get testLockAlarmSnack =>
      'Kengele ya kufunga italia baada ya sekunde 10 — funga simu yako sasa';

  @override
  String get testAdhanForegroundButton =>
      'Jaribu Adhana Ndani ya Programu (mbele)';

  @override
  String get testAdhanForegroundSnack =>
      'Inacheza adhana kamili na bango lisilo na sauti';

  @override
  String get testRequiresNotificationsOn =>
      'Wezesha Arifa za Swala kwanza ili kujaribu hili';

  @override
  String get lockScreenSetupGuideButton =>
      'Mwongozo wa Kuweka Tahadhari za Skrini Iliyofungwa';

  @override
  String get couldNotOpenPrivacyPolicy => 'Imeshindwa kufungua Sera ya Faragha';

  @override
  String get couldNotOpenTermsOfService =>
      'Imeshindwa kufungua Masharti ya Huduma';

  @override
  String get couldNotOpenEmailApp =>
      'Imeshindwa kufungua programu ya barua pepe';

  @override
  String get blockDurationLabel => 'Muda wa kuzuia';

  @override
  String get privacyAndTrust => 'Faragha na Uaminifu';

  @override
  String get noorGuardMotto =>
      '\"Kisichofaa msikitini,\nhakifai katika Noor Guard.\"';

  @override
  String get openingAppStore => 'Inafungua App Store…';

  @override
  String get openingShareSheet => 'Inafungua kipepeo cha kushiriki…';

  @override
  String get openingSupportEmail => 'Inafungua barua pepe ya msaada…';

  @override
  String get openingTermsOfService => 'Inafungua Masharti ya Huduma…';

  @override
  String get duration30Min => 'Dak 30';

  @override
  String get duration1Hour => 'Saa 1';

  @override
  String get durationPrayerWindowOnly => 'Wakati wa sala pekee';

  @override
  String get hoursAbbreviation => 'saa';

  @override
  String get cancelTimerButton => 'Ghairi kipima muda';

  @override
  String get custom => 'Maalum';

  @override
  String get customTimerMinutesTitle => 'Kipima muda maalum (dakika)';

  @override
  String get customTimerHint => 'mfano 20';

  @override
  String get cancel => 'Ghairi';

  @override
  String get start => 'Anza';

  @override
  String get travel => 'Usafiri';

  @override
  String get anxietyAndStress => 'Wasiwasi na Msongo';

  @override
  String get gratitude => 'Shukrani';

  @override
  String get protection => 'Ulinzi';

  @override
  String get family => 'Familia';

  @override
  String get forgiveness => 'Msamaha';

  @override
  String get appBlockingSetupHeadline => 'Linda wakati wako, linda swala lako';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard hutumia huduma ya Ufikiaji (Accessibility) ya Android tu ili kutambua wakati programu iliyozuiwa inafunguliwa wakati wa swala. Haisomi kamwe ujumbe wako, picha, au taarifa zako za kibinafsi.';

  @override
  String get appBlockingAccessibilityStatusOn => 'Ruhusa ya Ufikiaji imetolewa';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Ruhusa ya Ufikiaji haijatolewa';

  @override
  String get appBlockingOpenSettings => 'Fungua Mipangilio ya Ufikiaji';

  @override
  String get appBlockingSetupNotNow => 'Si sasa';

  @override
  String get appBlockingEnableToggle => 'Wezesha Kuzuia Programu';

  @override
  String get appBlockingModeLabel => 'Hali ya Kuzuia';

  @override
  String get appBlockingModeSoft => 'Laini';

  @override
  String get appBlockingModeSoftDesc =>
      'Ukumbusho mpole tu — programu zinabaki wazi';

  @override
  String get appBlockingModeFirm => 'Thabiti';

  @override
  String get appBlockingModeFirmDesc =>
      'Inazuia programu, na njia ya haraka ya kupita';

  @override
  String get appBlockingModeHard => 'Kali';

  @override
  String get appBlockingModeHardDesc =>
      'Kuzuia kamili — \"Nimeswali\" peke yake huifungua';

  @override
  String get appBlockingSelectPrayersLabel => 'Zuia wakati wa swala hizi';

  @override
  String get appBlockingBufferBeforeLabel => 'Anza kabla ya swala';

  @override
  String get appBlockingBufferAfterLabel => 'Ondoa baada ya swala';

  @override
  String appBlockingMinutesShort(int count) {
    return 'Dakika $count';
  }

  @override
  String get appBlockingAppsTitle => 'Programu Zilizozuiwa';

  @override
  String get appBlockingSelectAppsButton => 'Chagua Programu za Kuzuia';

  @override
  String get appBlockingSearchHint => 'Tafuta programu zilizosakinishwa';

  @override
  String get appBlockingNoAppsSelected => 'Hakuna programu iliyochaguliwa bado';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Programu $count zimezuiwa',
      one: 'Programu 1 imezuiwa',
      zero: 'Hakuna programu iliyozuiwa',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Kupima';

  @override
  String get appBlockingTestDescription =>
      'Washa Kuzuia Programu kwa dakika 2 ili kuthibitisha kuwa inafanya kazi kwenye kifaa hiki.';

  @override
  String get appBlockingTestButton => 'Pima Kuzuia Programu (dakika 2)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Kuzuia Programu kunafanya kazi kwa dakika 2 — jaribu kufungua programu iliyozuiwa';

  @override
  String get appBlockingPermissionNeeded =>
      'Wezesha ruhusa ya Ufikiaji ili kuanza kuzuia';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Ufikiaji wa Muda wa Skrini — Unakuja Hivi Karibuni';

  @override
  String get appBlockingIosComingSoonBody =>
      'Kuzuia programu kwenye iOS kunahitaji ruhusa ya Muda wa Skrini ya Apple, ambayo bado tunaiweka tayari. Tutakujulisha mara itakapokuwa tayari.';

  @override
  String get appBlockingHeadline1 => 'Wakati wa Swala';

  @override
  String get appBlockingHeadline2 => 'Linda Wakati Wako';

  @override
  String get appBlockingDefaultTitle => 'Wakati wa Swala';

  @override
  String get appBlockingIPrayedButton => 'Nimeswali';

  @override
  String get appBlockingReadAyahsButton => 'Soma Aya 3';

  @override
  String get appBlockingEmergencyBypass => 'Kupita kwa Dharura';

  @override
  String get appBlockingSkipForNow => 'Ruka kwa Sasa';

  @override
  String get appBlockingBypassConfirmTitle => 'Komesha mfululizo wako?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Kupita sasa kutaweka upya mfululizo wako wa swala. Ikiwa hii ni dharura ya kweli, unaweza kuendelea.';

  @override
  String get appBlockingBypassConfirmContinue => 'Pita Hata Hivyo';

  @override
  String get appBlockingBypassConfirmCancel => 'Rudi Nyuma';

  @override
  String get appBlockingSoftReminderTitle => 'Ukumbusho mpole';

  @override
  String get appBlockingSoftReminderBody =>
      'Ni wakati wa swala — fikiria kuondoka kwa muda mfupi.';

  @override
  String get quranChallengeBannerTitle => 'Soma Aya 3 Kufungua';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return 'Aya $count kati ya $total zimesomwa';
  }

  @override
  String get quranChallengeComplete => 'Vizuri sana — programu zimefunguliwa';

  @override
  String get focusBlockHeadline1 => 'Dumisha Umakini';

  @override
  String get focusBlockHeadline2 => 'Endelea';

  @override
  String get endFocusSessionButton => 'Komesha Kipindi cha Umakini';

  @override
  String get focusPaused => 'Imesimamishwa kwa Swala';

  @override
  String get selectLocationTitle => 'Chagua Mahali';

  @override
  String get useCurrentLocation => 'Tumia Mahali pa Sasa';

  @override
  String get savedLocationsHeader => 'Maeneo Yaliyohifadhiwa';

  @override
  String get noSavedLocationsYet =>
      'Hakuna maeneo yaliyohifadhiwa bado. Tafuta hapa chini ili kuongeza moja.';

  @override
  String get searchCityHint => 'Tafuta jina la jiji…';

  @override
  String get addLocationTooltip => 'Ongeza mahali';

  @override
  String get deleteLocationTooltip => 'Futa mahali';

  @override
  String get locationNotFound =>
      'Mahali hapakupatikana. Jaribu utafutaji mwingine.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Unaweza kuhifadhi hadi maeneo $max';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Imeshindwa kuthibitisha mabadiliko — tafadhali jaribu tena';

  @override
  String get tasbihCounter => 'Kihesabu cha Tasbihi';

  @override
  String get tasbihCounterSubtitle => 'Hesabu dhikri yako';

  @override
  String get tasbihResetButton => 'Weka Upya';

  @override
  String get tasbihTotalLabel => 'Jumla';

  @override
  String get tasbihCelebrationTitle => 'Tasbihi Imekamilika!';

  @override
  String get tasbihCelebrationBody =>
      'Umekamilisha dhikri zote 99. Mwenyezi Mungu akubali kumbukumbu yako.';

  @override
  String get tasbihStartNewSession => 'Anzisha Kipindi Kipya';

  @override
  String get tasbihUndoButton => 'Tendua';

  @override
  String get tasbihTapAnywhereHint => 'Gusa popote kwenye skrini ili kuhesabu';

  @override
  String get tasbihSoundToggleTooltip => 'Sauti ya mgusano';

  @override
  String get tasbihManageDhikrTooltip => 'Dhibiti dhikr';

  @override
  String get tasbihStatsTooltip => 'Tazama takwimu';

  @override
  String get tasbihDailyTotalLabel => 'Jumla ya Leo';

  @override
  String get tasbihRoundsTodayLabel => 'Mizunguko ya Leo';

  @override
  String get tasbihManageDhikrTitle => 'Dhibiti Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Ongeza Dhikr Maalum';

  @override
  String get tasbihDeleteDhikrTooltip => 'Futa';

  @override
  String get tasbihBuiltInDhikrBadge => 'Asili';

  @override
  String get tasbihCannotDeleteLastDhikr => 'Unahitaji angalau dhikr moja';

  @override
  String get tasbihDhikrNameLabel => 'Jina';

  @override
  String get tasbihDhikrNameHint => 'mfano: Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Kiarabu (si lazima)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Tafadhali weka jina';

  @override
  String get tasbihSaveDhikrButton => 'Hifadhi';

  @override
  String get tasbihStatsTitle => 'Takwimu za Tasbihi';

  @override
  String get tasbihAllTimeTotalLabel => 'Jumla Yote';

  @override
  String get tasbihNoActivityYetMessage =>
      'Anza kuhesabu ili kuona takwimu zako hapa.';

  @override
  String get tasbihSoundPickerTitle => 'Sauti ya Mgusano';

  @override
  String get tasbihSoundClassicClick => 'Mbofyo wa Kawaida';

  @override
  String get tasbihSoundSoftChime => 'Mlio Mpole';

  @override
  String get tasbihSoundStoneTap => 'Mgongo wa Jiwe';

  @override
  String get tasbihCurrentlyReciting => 'Inasomwa Sasa';

  @override
  String tasbihOfTarget(int target) {
    return 'kati ya $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Tone la Mvua';

  @override
  String get tasbihSoundSoftFeather => 'Unyoya Mpole';

  @override
  String noAyahsFound(String query) {
    return 'Hakuna aya zilizopatikana kwa \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Jaribu kutafuta kwa Kiswahili, Kiingereza au Kiarabu, au tumia neno la Kiislamu:';

  @override
  String get loadingQuranIndex => 'Inapakia faharasa ya Qurani…';

  @override
  String get quranSearchSuggestions =>
      'subira, sabr, rehema, sala, salah, msamaha, tawbah, pepo, jannah, elimu';

  @override
  String get heroVerse1 => 'Simamieni sala zote, hasa sala ya kati.';

  @override
  String get heroVerse2 =>
      'Hakika sala imewajibika kwa waumini kwa nyakati zilizowekwa.';

  @override
  String get heroVerse3 => 'Tafuteni msaada kwa subira na sala.';

  @override
  String get heroVerse4 =>
      'Basi niorodhesheni, nami nitawakumbuka ninyi. Na nishukuruni wala msikukufurue.';

  @override
  String get heroVerse5 =>
      'Na anayemtegemea Mwenyezi Mungu, basi Yeye atamtosha.';

  @override
  String get heroVerse6 =>
      'Hakika nyumba ya kwanza iliyowekwa kwa ajili ya watu ni ile iliyoko Makkah, yenye baraka na mwongozo kwa walimwengu wote.';

  @override
  String get heroVerse7 =>
      'Hakika sala inazuia mambo ya aibu na mabaya, na kukumbuka Mwenyezi Mungu ni kubwa zaidi.';

  @override
  String get heroVerse8 =>
      'Tambua kwamba kwa kukumbuka Mwenyezi Mungu ndipo moyo hupata utulivu.';

  @override
  String get heroVerse9 => 'Niendeeni, nitajibu maombi yenu.';

  @override
  String get heroVerse10 => 'Mkishukuru hakika nitawaongezea.';

  @override
  String get heroVerse11 => 'Mwenyezi Mungu hamsumbui mtu zaidi ya uwezo wake.';

  @override
  String get heroVerse12 =>
      'Hakika Mwenyezi Mungu yuko pamoja na wenye subira.';

  @override
  String get heroVerse13 => 'Rehema yangu imekusanya kila kitu.';

  @override
  String get heroVerse14 =>
      'Fanyeni mema; hakika Mwenyezi Mungu anawapenda wafanyao mema.';

  @override
  String get heroVerse15 =>
      'Hii ni Kitabu ambacho hakuna shaka ndani yake, ni mwongozo kwa wachamngu.';

  @override
  String get accuracyHigh => 'Usahihi wa Juu';

  @override
  String get accuracyMedium => 'Usahihi wa Kati';

  @override
  String get accuracyLow => 'Usahihi wa Chini';

  @override
  String get accuracyCalibrating => 'Inakalibreti…';

  @override
  String get compassNeedsCalibration => 'Dira inahitaji kalibreti';

  @override
  String get compassCalibrationHint =>
      'Sogeza simu yako polepole kwa mwendo wa nane kuboresha usahihi.';

  @override
  String get spiritLevelLabel => 'Kipimo cha Usawa';

  @override
  String get spiritLevelLevelText => '✓  Sawa';

  @override
  String get spiritLevelTiltText => 'Inamisha kuweka sawa';

  @override
  String get compassNorth => 'Ka';

  @override
  String get compassEast => 'Ma';

  @override
  String get compassSouth => 'Ku';

  @override
  String get compassWest => 'Mg';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'Linda wakati wako. Heshimu sala zako.';

  @override
  String get stopAdhan => 'Simamisha Adhan';

  @override
  String get duasSearchEmpty =>
      'Jaribu kategori nyingine au neno tofauti la utafutaji.';

  @override
  String get onboardingSkip => 'Ruka';

  @override
  String get onboardingWelcomeTo => 'Karibu kwenye';

  @override
  String get onboardingSubtitle => 'Mwenzako katika safari nzuri ya Uislamu.';

  @override
  String get onboardingLetsGetStarted => 'Hebu Tuanze';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step kati ya $total';
  }

  @override
  String get onboardingWhatsYourName => 'Jina lako ni nani?';

  @override
  String get onboardingNameSubtitle => 'Tungependa kujua jinsi ya kukuhutubia.';

  @override
  String get onboardingNameHint => 'Ingiza jina lako';

  @override
  String get onboardingContinue => 'Endelea';

  @override
  String get onboardingAreYouNewToIslam => 'Je, wewe ni mpya katika Uislamu?';

  @override
  String get onboardingModeSubtitle =>
      'Tutabinafsisha uzoefu wako kulingana na safari yako.';

  @override
  String get onboardingNewToIslam => 'Mimi ni mpya katika Uislamu';

  @override
  String get onboardingNewToIslamDesc =>
      'Hali ya mwanzo na mwongozo wa hatua kwa hatua';

  @override
  String get onboardingFamiliarWithIslam => 'Ninafahamu Uislamu';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Hali ya kawaida na vipengele vyote';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Siku $days kama Mwislamu';
  }

  @override
  String get beginnerEssential1 => 'Mwongozo wa Mwislamu Mpya';

  @override
  String get beginnerEssential2 => 'Jifunze Udhu (Utakaso)';

  @override
  String get beginnerEssential3 => 'Jinsi ya Kuswali (Hatua kwa Hatua)';

  @override
  String get beginnerEssential4 => 'Sura Al-Fatiha (Ufunguzi)';

  @override
  String get beginnerEssential5 => 'Dua za Kila Siku';

  @override
  String get beginnerEssential6 => 'Kuelewa Shahada';

  @override
  String get beginnerEssential7 => 'Masharti ya Kiislamu na Kamusi';

  @override
  String get beginnerExploreAll => 'Chunguza Vipengele Vyote';

  @override
  String get beginnerExploreSubtitle =>
      'Badilisha kwa uzoefu kamili wa Noor Guard';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Kila kitu Noor Guard ina kutoa';

  @override
  String get beginnerLearnSalah => 'Jifunze Sala';

  @override
  String get beginnerMayAllahGuide =>
      'Allah aongoza hatua zako na abariki safari yako.';

  @override
  String get beginnerMuslimEssentials => 'MAMBO MUHIMU YA MWISLAMU';

  @override
  String get beginnerQuote1 =>
      'Hakika pamoja na ugumu kuna urahisi. — Quran 94:6';

  @override
  String get beginnerQuote2 => 'Angalia amri za Allah, Yeye atakuangalia.';

  @override
  String get beginnerQuote3 =>
      'Allah anaangalia moyo na matendo yako, si mwonekano wako.';

  @override
  String get beginnerQuote4 =>
      'Kila hatua kuelekea sala ni hatua kuelekea amani.';

  @override
  String get beginnerQuote5 =>
      'Bora wenu ni yule anayejifunza Quran na kuifundisha.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Gusa kuweka tarehe yako ya Shahada';

  @override
  String get beginnerToolboxSection => 'SANDUKU LA ZANA LA MWANZO';

  @override
  String get beginnerYourJourney => 'SAFARI YAKO';

  @override
  String get journeyMonth1Name => 'Mwezi 1: Msingi';

  @override
  String get journeyMonth2Name => 'Mwezi 2: Kujenga Tabia';

  @override
  String get journeyMonth3Name => 'Mwezi 3: Kuimarisha Imani';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total imekamilika';
  }

  @override
  String get journeyViewFull => 'Tazama safari nzima →';

  @override
  String get journeyTask2_1 => 'Swali sala 5 kwa siku 7';

  @override
  String get journeyTask2_2 => 'Jifunze Dua 10 zaidi';

  @override
  String get journeyTask2_3 => 'Soma Juz ya kwanza ya Quran';

  @override
  String get journeyTask2_4 => 'Jifunze Majina 99 ya Allah';

  @override
  String get journeyTask2_5 => 'Tumia Kihesabu cha Tasbih kila siku kwa siku 7';

  @override
  String get journeyTask2_6 => 'Jifunze sala za Sunnah';

  @override
  String get journeyTask2_7 => 'Pata Msikiti wako wa karibu';

  @override
  String get journeyTask3_1 => 'Soma Surah Al-Baqarah';

  @override
  String get journeyTask3_2 => 'Jifunza kuhusu Zakat';

  @override
  String get journeyTask3_3 => 'Jifunza kuhusu Kufunga (Sawm)';

  @override
  String get journeyTask3_4 => 'Hifadhi Surah 3 mpya';

  @override
  String get journeyTask3_5 => 'Jifunza kuhusu Hija';

  @override
  String get journeyTask3_6 => 'Shiriki Uislamu na mtu';

  @override
  String get journeyTask3_7 => 'Kamilisha Kamusi ya Kiislamu';

  @override
  String get journeyTimelineTitle => 'Safari Yangu';

  @override
  String get journeyCompleted => 'Imekamilika';

  @override
  String get journeyInProgress => 'Inaendelea';

  @override
  String get journeyLocked => 'Imefungwa';

  @override
  String get wuduThreeTimes => 'mara 3';

  @override
  String get wuduDuaBefore => 'Dua Kabla ya Wudu';

  @override
  String get wuduDuaAfter => 'Dua Baada ya Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'Kwa jina la Allah';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Nashuhudia kwamba hakuna mungu anayestahili kuabudiwa isipokuwa Allah, Peke Yake, bila mshirika, na nashuhudia kwamba Muhammad ni mtumishi Wake na mtume Wake. Ewe Allah, nifanye miongoni mwa wanaotubu na wanaojitakasa.';

  @override
  String get wuduCompleteButton => 'Nimekamilisha Wudu';

  @override
  String get howToPrayStepOpeningDua => 'Dua ya kuanza';

  @override
  String get howToPrayStepAlFatiha => 'Sura Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Sura fupi';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (kukaa kati)';

  @override
  String get howToPrayStepSalawat => 'Salawat kwa Nabii ﷺ';

  @override
  String get howToPrayTransTakbir => 'Mwenyezi Mungu ni Mkubwa zaidi';

  @override
  String get howToPrayTransOpeningDua =>
      'Umetukuka, Ee Mwenyezi Mungu, na Sifa Zako; jina Lako limebarikiwa, utukufu Wako umetukuka, wala hakuna mungu isipokuwa Wewe.';

  @override
  String get howToPrayTransFatiha =>
      'Kwa jina la Mwenyezi Mungu, Mwenye rehema nyingi, Mwenye kurehemu. Sifa zote ni za Mwenyezi Mungu, Mola Mlezi wa walimwengu wote. Mwenye rehema nyingi, Mwenye kurehemu. Mwenye kumiliki Siku ya Malipo. Wewe peke yako tunakuabudu na Wewe peke yako tunaomba msaada. Tuongoze njia iliyonyooka — njia ya wale uliowaneemesha, si ya wale waliokasiriwa, wala ya waliopotoka.';

  @override
  String get howToPrayTransRuku => 'Ametakasika Mola wangu Mtukufu';

  @override
  String get howToPrayTransItidal =>
      'Mwenyezi Mungu husikia yeyote anayemsifu. Mola wetu, na Sifa zote ni Zako.';

  @override
  String get howToPrayTransSujood => 'Ametakasika Mola wangu Aliye Juu';

  @override
  String get howToPrayTransJalsa => 'Mola wangu, nisamehe';

  @override
  String get howToPrayTransTashahhud =>
      'Salamu zote, sala na maneno mazuri ni ya Mwenyezi Mungu. Amani iwe juu yako, Ee Nabii, na rehema ya Mwenyezi Mungu na baraka Zake. Amani iwe juu yetu na juu ya waja wema wa Mwenyezi Mungu. Nashuhudia kwamba hapana mungu ila Mwenyezi Mungu, na nashuhudia kwamba Muhammad ni mja Wake na Mtume Wake.';

  @override
  String get howToPrayTransSalawat =>
      'Ee Mwenyezi Mungu, mrehemu Muhammad na familia ya Muhammad kama ulivyomrehemu Ibrahim na familia ya Ibrahim — hakika Wewe ni Msifiwa Mtukufu. Ee Mwenyezi Mungu, mbariki Muhammad na familia ya Muhammad kama ulivyombariki Ibrahim na familia ya Ibrahim — hakika Wewe ni Msifiwa Mtukufu.';

  @override
  String get howToPrayTransTasleem =>
      'Amani na rehema ya Mwenyezi Mungu iwe juu yenu';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Soma hii kwa sauti ya chini baada ya Takbir ya mwanzo. Inasomwa mara moja tu mwanzoni mwa sala.';

  @override
  String get howToPraySurahInstruction =>
      'Baada ya Al-Fatiha, soma sura yoyote unayoijua kwa moyo. Sura Al-Ikhlas (juu) ni nzuri kwa wanaoanza — inasomwa katika rakaa mbili za kwanza tu.';

  @override
  String get howToPrayItidalInstruction =>
      'Sema \'Sami\' Allahu liman hamidah\' unapoinuka, kisha simama wima kabla ya kusema \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Kaa baada ya rakaa ya 2. Nyanyua kidole cha shahada cha mkono wa kulia unaposema Shahada. Kwa sala za rakaa 3 na 4, utasimama tena baada ya kukaa huku.';

  @override
  String get howToPraySalawatInstruction =>
      'Soma Salawat mara baada ya Tashahhud ya mwisho, katika kukaa kwa mwisho tu, kabla ya Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Geuza kichwa kulia na useme Tasleem, kisha geuka kushoto na rudia. Sala yako imekamilika.';

  @override
  String get howToPrayOnceOpens => 'Mara moja — inaanza sala';

  @override
  String get howToPraySayAllahuAkbar => 'Sema: Allāhu Akbar';

  @override
  String get howToPrayFirstRakahOnly => 'Rakaa ya 1 tu';

  @override
  String get howToPrayFirst2RakahsOnly => 'Rakaa 2 za kwanza tu';

  @override
  String get howToPrayEveryRakah => 'Kila rakaa';

  @override
  String get howToPrayAfter2ndRakah => 'Baada ya rakaa ya 2';

  @override
  String get howToPrayFinalSittingOnly => 'Kukaa kwa mwisho tu';

  @override
  String get howToPrayClosesThePrayer => 'Inamaliza sala';

  @override
  String get howToPraySectionBefore => 'Kabla ya Sala';

  @override
  String get howToPraySectionRakah => 'Rakaa';

  @override
  String get howToPraySectionMiddleSitting => 'Kukaa Katikati';

  @override
  String get howToPraySectionFinalSitting => 'Kukaa kwa Mwisho';

  @override
  String get howToPrayRakahLabel => 'Rakaa';

  @override
  String get howToPrayCompleteButton => 'Nimekamilisha sala yangu';

  @override
  String get howToPrayMashaallah => 'Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Mwenyezi Mungu akubali sala yako.';

  @override
  String get fatihaIntroTitle => 'Mama wa Qurani';

  @override
  String get fatihaIntroBody =>
      'Surah Al-Fatiha ni surah kubwa zaidi katika Qurani. Inasomwa katika kila rakaa ya sala — angalau mara 17 kwa siku. Ni mazungumzo kamili kati ya mtumishi na Allah, na mlango wa kila sala.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir anaandika: \'Al-Fatiha ina kiini cha Qurani nzima — ni sala, tamko la utumishi, na ombi la uongofu kuelekea Njia Iliyonyooka.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'Shahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Nashuhudia kwamba hakuna mungu ila Allah, na nashuhudia kwamba Muhammad ni Mtume wa Allah';

  @override
  String get shahadaWordBreakdownTitle => 'Neno kwa Neno';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'Hakuna';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'mungu / mola';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'isipokuwa';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (Mungu peke yake)';

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
  String get shahadaWord6Meaning => 'Mtume / Nabii';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'wa Allah';

  @override
  String get shahadaMeaningTitle => 'Maana na Umuhimu';

  @override
  String get shahadaMeaningBody =>
      'Shahada ni tamko la imani ambalo huunda msingi wa Uislamu. Ni wa kwanza wa Nguzo Tano. Kwa kusema maneno haya kwa imani ya dhati, mtu anaingia Uislamu. Ibn Kathir anaeleza kwamba sehemu ya kwanza inakanusha miungu yote ya uongo na kuthibitisha umoja kamili wa Allah.';

  @override
  String get shahadaMomentTitle => 'Wakati wa Shahada';

  @override
  String get shahadaMomentBody =>
      'Mtu anapotamka Shahada kwa mara ya kwanza kwa imani ya kweli, kitu kizito kinatokea — wanaanza maisha mapya. Mtume ﷺ alisema: \'Mtu yeyote anayesema hakuna mungu ila Allah na haaamini chochote kinachoadhiwa badala yake, mali na damu yake vinalindwa.\' (Sahih Muslim). Dhambi zote za zamani zinasamehewa. Karibu Uislamu.';

  @override
  String get shahadaPronunciationTitle => 'Mwongozo wa Matamshi';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Mwongozo wa hatua kwa hatua';

  @override
  String get toolboxWuduSubtitle => 'Utakaso kabla ya sala';

  @override
  String get toolboxGlossarySubtitle => 'Maneno 114 ya Kiislamu yaliyoelezwa';

  @override
  String get shareSheetTitle => 'Shiriki';

  @override
  String get shareAnAyah => 'Shiriki Aya';

  @override
  String get shareADua => 'Shiriki Dua';

  @override
  String get shareANameOfAllah => 'Shiriki Jina la Allah';

  @override
  String get shareAHadith => 'Shiriki Hadithi';

  @override
  String get shareViaLabel => 'Imeshirikiwa kupitia Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Aya ya Leo';

  @override
  String get shareCardDuaLabel => '✦ Dua';

  @override
  String get shareCardNameLabel => '✦ Jina la Allah';

  @override
  String get shareCardHadithLabel => '✦ Hadithi';

  @override
  String get sharePickDuaTitle => 'Chagua Dua ya Kushiriki';

  @override
  String get shareError => 'Haikuweza kuunda picha ya kushiriki';

  @override
  String get shareCardVerseLabel => '✦ Aya ya Kurani';

  @override
  String get shareCardAsmaLabel => '✦ Asma ul-Husna';

  @override
  String get shareAyahSubtitle => 'Chagua kutoka aya 30 za Quran';

  @override
  String get shareDuaSubtitle => 'Chagua kutoka kwenye maktaba';

  @override
  String get shareNameSubtitle => 'Chagua kutoka kwa Majina yote 99 Mazuri';

  @override
  String get shareHadithSubtitle => 'Chagua kutoka hadithi 20 sahihi';

  @override
  String get shareThisDua => 'Shiriki Dua Hii';

  @override
  String get sharePickAyahTitle => 'Chagua Aya ya Kushiriki';

  @override
  String get searchAyahs => 'Tafuta aya…';

  @override
  String get noAyahsFoundShort => 'Hakuna aya zilizopo';

  @override
  String get shareThisAyah => 'Shiriki Aya Hii';

  @override
  String get sharePickNameTitle => 'Chagua Jina la Kushiriki';

  @override
  String get shareThisName => 'Shiriki Jina Hili';

  @override
  String get sharePickHadithTitle => 'Chagua Hadithi ya Kushiriki';

  @override
  String get searchHadiths => 'Tafuta hadithi…';

  @override
  String get noHadithsFound => 'Hakuna hadithi zilizopo';

  @override
  String get shareThisHadith => 'Shiriki Hadithi Hii';

  @override
  String get backToBasics => 'Rudi kwa Msingi';

  @override
  String get backToBasicsSubtitle => 'Mwongozo wako wa misingi ya Uislamu';

  @override
  String get fivePillarsOfIslam => 'Nguzo 5 za Uislamu';

  @override
  String get fivePillarsShort => 'Nguzo 5';

  @override
  String get fivePillarsSubtitle => 'Misingi ya imani ya Kiislamu';

  @override
  String get pillarLearnMore => 'Jifunza zaidi';

  @override
  String get pillarShowLess => 'Onyesha kidogo';

  @override
  String get pillarsShowDetails => 'Onyesha Maelezo';

  @override
  String get pillarsHideDetails => 'Ficha Maelezo';

  @override
  String get pillar1Name => 'Shahada';

  @override
  String get pillar1Desc => 'Tangazo la Imani';

  @override
  String get pillar1Detail =>
      'Tamko la imani ni msingi wa Uislamu. Kwa kusema kwa moyo \'Hapana mungu ila Allah na Muhammad ni Mtume Wake\', mtu anaingia katika Uislamu.';

  @override
  String get pillar2Name => 'Sala';

  @override
  String get pillar2Desc => 'Sala Tano za Kila Siku';

  @override
  String get pillar2Detail =>
      'Sala tano za kila siku ni uhusiano wa moja kwa moja kati ya Mwislamu na Allah. Zinasaliwa alfajiri, adhuhuri, alasiri, magharibi na isha, zikipanga siku nzima ya Mwislamu kuzunguka kumkumbuka Allah.';

  @override
  String get pillar3Name => 'Zakat';

  @override
  String get pillar3Desc => 'Sadaka ya Lazima';

  @override
  String get pillar3Detail =>
      'Zaka ni sadaka ya lazima ya asilimia 2.5 ya akiba ya kila mwaka inayotolewa kwa wahitaji. Inasafisha mali na kuimarisha mshikamano wa jumuiya ya Kiislamu.';

  @override
  String get pillar4Name => 'Saumu';

  @override
  String get pillar4Desc => 'Kufunga Ramadhan';

  @override
  String get pillar4Detail =>
      'Kufunga wakati wa mwezi mtukufu wa Ramadhan kutoka alfajiri hadi jua kutua. Waislamu wanajizuia chakula, kinywaji na dhambi ili kufikia taqwa (ufahamu wa Mungu) na shukrani.';

  @override
  String get pillar5Name => 'Hijja';

  @override
  String get pillar5Desc => 'Hija kwenda Makka';

  @override
  String get pillar5Detail =>
      'Hija kwenda Makka ni wajibu mara moja kwa maisha kwa kila Mwislamu mwenye uwezo wa kimwili na kiuchumi. Ni mkusanyiko mkubwa zaidi wa watu duniani kila mwaka.';

  @override
  String get switchedToNewMuslimMode =>
      'Umebadilishwa hadi Hali ya Muislamu Mpya';

  @override
  String get switchedToRegularMode => 'Umebadilishwa hadi Hali ya Kawaida';

  @override
  String get liveNotifChannelName => 'Noor Guard Moja kwa Moja';

  @override
  String get liveNotifChannelDescription =>
      'Hesabu ya kurudi nyuma ya sala na maudhui ya Kiislamu ya kila siku kwenye skrini yako ya kufunga';

  @override
  String get liveNotifHeaderAyah => 'AYA YA LEO';

  @override
  String get liveNotifHeaderDua => 'DUA YA LEO';

  @override
  String get liveNotifHeaderWord => 'NENO LA LEO';

  @override
  String get liveNotifHeaderName => 'JINA LA ALLAH';

  @override
  String get liveNotifHeaderHadith => 'HADITHI YA LEO';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'baada ya saa $hours na dakika $minutes';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'baada ya dakika $minutes';
  }

  @override
  String get liveNotifCountdownNow => 'Ni wakati wa kusali';

  @override
  String get savedDuas => 'Dua Zilizohifadhiwa';

  @override
  String get savedVerses => 'Aya Zilizohifadhiwa';

  @override
  String get savedNames => 'Majina Yaliyohifadhiwa';

  @override
  String get noSavedDuas => 'Bado hakuna dua zilizohifadhiwa';

  @override
  String get noSavedVerses => 'Bado hakuna aya zilizohifadhiwa';

  @override
  String get noSavedNames => 'Bado hakuna majina yaliyohifadhiwa';

  @override
  String get heroVerse16 =>
      'Mola wetu Mlezi, usituchukulie tukisahau au tukikosea.';

  @override
  String get heroVerse17 => 'Mwenyezi Mungu anatutosha, naye ni Mlinzi bora.';

  @override
  String get heroVerse18 =>
      'Enyi mlioamini, mwaminini Mwenyezi Mungu na Mtume wake.';

  @override
  String get heroVerse19 =>
      'Enyi mlioamini, mcheni Mwenyezi Mungu na tafuteni njia ya kumkaribia.';

  @override
  String get heroVerse20 =>
      'Hakika sala yangu, ibada yangu, uhai wangu na kifo changu ni kwa ajili ya Mwenyezi Mungu, Mola wa walimwengu.';

  @override
  String get heroVerse21 =>
      'Tuandikie wema katika dunia hii na akhera; hakika tumerejea Kwako.';

  @override
  String get heroVerse22 =>
      'Mkumbukeni Mwenyezi Mungu kwa wingi ili mpate kufaulu.';

  @override
  String get heroVerse23 =>
      'Halitatupata ila alilotuandikia Mwenyezi Mungu; Yeye ndiye Mlinzi wetu.';

  @override
  String get heroVerse24 =>
      'Fahamuni, marafiki wa Mwenyezi Mungu hawatakuwa na hofu wala hawatahuzunika.';

  @override
  String get heroVerse25 =>
      'Mafanikio yangu ni kwa Mwenyezi Mungu tu; Kwake nimetegemea na Kwake ninarejea.';

  @override
  String get heroVerse26 => 'Msikate tamaa na rehema ya Mwenyezi Mungu.';

  @override
  String get heroVerse27 =>
      'Wale walioamini na nyoyo zao zikatulia kwa kumkumbuka Mwenyezi Mungu.';

  @override
  String get heroVerse28 =>
      'Na Mola wenu Mlezi alipotangaza: Mkishukuru, hakika nitawazidishia.';

  @override
  String get heroVerse29 => 'Na muabudu Mola wako Mlezi mpaka ikufikie yakini.';

  @override
  String get heroVerse30 =>
      'Hakika Mwenyezi Mungu yu pamoja na wamchao na wale watendao mema.';

  @override
  String get focusButtonSubtitle => 'Linda muda wako kwa yale muhimu';

  @override
  String get ourStories => 'Hadithi Zetu';

  @override
  String get storiesSeeAll => 'Tazama zote';

  @override
  String get storiesReadMore => 'Soma zaidi';

  @override
  String get storiesFeaturedLabel => 'Hadithi Teule';

  @override
  String get storiesFilterReverts => 'Waliosilimu';

  @override
  String get storyCategoryRevert => 'Aliyesilimu';

  @override
  String get storyCategoryBornMuslim => 'Muislamu wa kuzaliwa';

  @override
  String get storyCategoryReturning => 'Anayerejea';

  @override
  String get storiesShareYours => 'Shiriki Yako';

  @override
  String get storiesEmptyTitle => 'Bado hakuna hadithi';

  @override
  String get storiesEmptySubtitle => 'Kuwa wa kwanza kushiriki safari yako';

  @override
  String storyShahadaDate(Object date) {
    return 'Shahada: $date';
  }

  @override
  String get storiesComments => 'Maoni';

  @override
  String get storiesAddComment => 'Ongeza maoni…';

  @override
  String get storiesAnonymous => 'Bila jina';

  @override
  String get storiesNameLabel => 'Jina lako';

  @override
  String get storiesPostAnonymously => 'Chapisha bila jina';

  @override
  String get storiesCountryLabel => 'Nchi';

  @override
  String get storiesCategoryLabel => 'Kundi';

  @override
  String get storiesShahadaDateLabel => 'Tarehe ya Shahada (hiari)';

  @override
  String get storiesYourStoryLabel => 'Hadithi yako';

  @override
  String get storiesStoryHint => 'Tueleze safari yako…';

  @override
  String get storiesChooseBackground => 'Chagua Mandhari';

  @override
  String get storiesBackgroundNone => 'Hakuna';

  @override
  String get storiesEditTitle => 'Hariri Hadithi Yako';

  @override
  String get storiesSaveChanges => 'Hifadhi Mabadiliko';

  @override
  String get storiesUpdated => 'Hadithi yako imesasishwa';

  @override
  String get storiesUploadPhoto => 'Pakia picha (hiari)';

  @override
  String get storiesChangePhoto => 'Badilisha picha';

  @override
  String get storiesSubmitButton => 'Wasilisha';

  @override
  String get storiesSubmitted =>
      'JazakAllah khair! Hadithi yako imewasilishwa kwa ukaguzi.';

  @override
  String get storiesSubmitError => 'Hitilafu imetokea. Tafadhali jaribu tena.';

  @override
  String get storiesFillRequired => 'Tafadhali ongeza hadithi yako na nchi.';

  @override
  String get storiesShareCardLabel => 'Hadithi ya Jumuiya';

  @override
  String get storiesPreviewLabel => 'Onyesho la awali';

  @override
  String get storiesPendingReview => 'Inasubiri ukaguzi';

  @override
  String get storiesFilterSaved => 'Zilizohifadhiwa';

  @override
  String get storiesSavedEmpty => 'Bado hakuna hadithi zilizohifadhiwa';

  @override
  String get storiesSearchCountryHint => 'Tafuta nchi…';

  @override
  String get storiesChooseAvatar => 'Chagua Avatari';

  @override
  String get storiesAvatarInitials => 'Herufi za Kwanza';

  @override
  String get storiesAvatarIcon => 'Ikoni';

  @override
  String get storiesAvatarPattern => 'Muundo';

  @override
  String get storiesLoadError =>
      'Imeshindikana kupakia hadithi. Angalia muunganisho wako.';

  @override
  String get storiesDiscardTitle => 'Utupe hadithi yako?';

  @override
  String get storiesDiscard => 'Tupa';

  @override
  String get storiesKeepWriting => 'Endelea Kuandika';

  @override
  String get storiesSaveDraft => 'Hifadhi Rasimu';

  @override
  String get storiesDraftSaved => 'Rasimu imehifadhiwa';

  @override
  String get storiesDeleteDraft => 'Futa Rasimu';

  @override
  String get storiesContinueDraft => 'Endelea na rasimu yako';

  @override
  String get storiesStartFresh => 'Anza upya';

  @override
  String get shareCardGlossaryLabel => '✦ Kamusi ya Kiislamu';

  @override
  String get shareCardTafsirLabel => '✦ Tafsiri';

  @override
  String shareCardAyahRef(String number) {
    return 'Aya ya $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 Wakati wa Fajr';

  @override
  String get prayerReminderTitleDhuhr => '☀️ Wakati wa Dhuhr';

  @override
  String get prayerReminderTitleAsr => '🌤️ Wakati wa Asr';

  @override
  String get prayerReminderTitleMaghrib => '🌅 Wakati wa Maghrib';

  @override
  String get prayerReminderTitleIsha => '🌙 Wakati wa Isha';

  @override
  String get prayerReminderBodyFajr =>
      'Amka uswali. Mwenyezi Mungu huwalipa wanaoamka kwa ajili Yake.';

  @override
  String get prayerReminderBodyDhuhr =>
      'Tenga muda kwa ajili ya Mwenyezi Mungu. Swala yako ya Dhuhr inakungoja.';

  @override
  String get prayerReminderBodyAsr =>
      'Swala ya kati. Ilinde kwa makini. — Al-Baqarah 2:238';

  @override
  String get prayerReminderBodyMaghrib =>
      'Jua limezama. Itikia wito wa Mwenyezi Mungu.';

  @override
  String get prayerReminderBodyIsha =>
      'Maliza siku yako na Mwenyezi Mungu. Swala yako ya usiku inakungoja.';

  @override
  String get prayerAlarmMessageFajr =>
      'Amka uswali. Mwenyezi Mungu huwalipa wanaoamka kwa ajili Yake.';

  @override
  String get prayerAlarmMessageDhuhr =>
      'Tenga muda kwa ajili ya Mwenyezi Mungu. Swala yako ya Dhuhr inakungoja.';

  @override
  String get prayerAlarmMessageAsr =>
      'Ilinde kwa makini swala ya kati. — Al-Baqarah 2:238';

  @override
  String get prayerAlarmMessageMaghrib =>
      'Jua limezama. Itikia wito wa Mwenyezi Mungu.';

  @override
  String get prayerAlarmMessageIsha =>
      'Maliza siku yako na Mwenyezi Mungu. Swala yako ya usiku inakungoja.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer baada ya dakika 15';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'Ni wakati wa kujiandaa kwa swala ya $prayer';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'Ni wakati wa swala ya $prayer';
  }

  @override
  String get testNotificationTitle => '🔔 Arifa ya Majaribio';

  @override
  String get testNotificationBody => 'Arifa zinafanya kazi vizuri!';

  @override
  String get favoriteRecitersSection => 'Vipendwa';

  @override
  String get favoriteRecitersLimit =>
      'Unaweza kuwa na wasomaji 3 tu wa kupenda. Ondoa mmoja ili kuongeza mwingine.';

  @override
  String get findQiblaDirection => 'Tafuta Mwelekeo wa Qibla';

  @override
  String get storyMenuShare => 'Shiriki';

  @override
  String get storyMenuBookmark => 'Hifadhi';

  @override
  String get storyMenuReport => 'Ripoti';

  @override
  String get reportSheetTitle => 'Ripoti hadithi hii';

  @override
  String get reportSheetSubtitle => 'Tusaidie kuweka Noor Guard salama';

  @override
  String get reportReasonInappropriate => 'Maudhui yasiyofaa';

  @override
  String get reportReasonSpam => 'Spamu';

  @override
  String get reportReasonHateSpeech => 'Matamshi ya chuki';

  @override
  String get reportReasonOther => 'Nyingine';

  @override
  String get reportSubmit => 'Tuma Ripoti';

  @override
  String get reportThankYou => 'JazakAllah khair — asante kwa kuripoti';

  @override
  String get adminMode => 'Hali ya Msimamizi';

  @override
  String get adminTitle => 'Msimamizi';

  @override
  String get adminTabPending => 'Hadithi Zinazosubiri';

  @override
  String get adminTabReported => 'Hadithi Zilizoripotiwa';

  @override
  String get adminApprove => 'Idhinisha';

  @override
  String get adminReject => 'Kataa';

  @override
  String get adminDeleteStory => 'Futa Hadithi';

  @override
  String get adminDismiss => 'Puuza';

  @override
  String get adminEmptyPending => 'Hakuna hadithi zinazosubiri';

  @override
  String get adminEmptyReports => 'Hakuna ripoti zinazosubiri';
}
