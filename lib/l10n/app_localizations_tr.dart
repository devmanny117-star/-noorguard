// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'Es-Selâmu Aleyküm';

  @override
  String get mayAllahBlessYourDay => 'Allah gününüzü mübarek kılsın';

  @override
  String get nextPrayer => 'Sıradaki Namaz';

  @override
  String get iPrayedButton => 'Namaz Kıldım';

  @override
  String get todaysPrayers => 'Bugünkü Namazlar';

  @override
  String get qibla => 'Kıble';

  @override
  String get focusMode => 'Odak Modu';

  @override
  String get appBlocking => 'Uygulama Engelleme';

  @override
  String get islamicCalendar => 'İslami Takvim';

  @override
  String get duas => 'Dualar';

  @override
  String get quran => 'Kur\'an';

  @override
  String get settings => 'Ayarlar';

  @override
  String get complete => 'Tamamla';

  @override
  String get streak => 'Seri';

  @override
  String get dayStreak => 'günlük seri';

  @override
  String get compassRequiresDevice => 'Pusula gerçek bir cihaz gerektirir';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün',
      one: '$count gün',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Tüm namazlar tamamlandı! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 namaz tamamlandı';
  }

  @override
  String get fajr => 'Sabah';

  @override
  String get dhuhr => 'Öğle';

  @override
  String get asr => 'İkindi';

  @override
  String get maghrib => 'Akşam';

  @override
  String get isha => 'Yatsı';

  @override
  String fardRakats(int count) {
    return '$count farz rekat';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sünnet (öncesinde)';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sünnet (sonrasında)';
  }

  @override
  String prayedAt(String time) {
    return '$time kılınır';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'gün doğumundan önceki tan vakti';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'güneş tepe noktasını geçtikten sonra';

  @override
  String get timePeriodLateAfternoon => 'ikindi vaktinde';

  @override
  String get timePeriodJustAfterSunset => 'gün batımından hemen sonra';

  @override
  String get timePeriodNightBeforeMidnight => 'gece yarısından önceki vakitte';

  @override
  String get fajrHadith =>
      'Sabah namazının iki rekâtı, dünya ve içindeki her şeyden daha hayırlıdır. — Peygamber Efendimiz Muhammed ﷺ';

  @override
  String get fajrTip =>
      'Sabah namazı günün ilk namazıdır. Güne Allah\'ı anarak başlamamızı hatırlatır.';

  @override
  String get dhuhrHadith =>
      'Kim on iki rekât sünneti kılarsa, Allah ona cennette bir ev inşa eder.';

  @override
  String get dhuhrTip =>
      'Öğle namazı günün ortasındaki namazdır. Güne ara verip yeniden bağlanmak için mükemmel bir andır.';

  @override
  String get asrHadith =>
      'Kim ikindi namazını kaçırırsa, ailesini ve malını kaybetmiş gibi olur. — Peygamber Efendimiz Muhammed ﷺ';

  @override
  String get asrTip =>
      'İkindi namazına genellikle \'orta namaz\' denir. Allah onu Kur\'an\'da özellikle zikreder (2:238).';

  @override
  String get maghribHadith => 'Akşam namazı, günün vitridir.';

  @override
  String get maghribTip =>
      'Akşam namazı, Ramazan\'da o günkü orucun bittiğini gösterir. Güneş battığı anda kılınır.';

  @override
  String get ishaHadith =>
      'Kim yatsı namazını cemaatle kılarsa, gecenin yarısını ibadetle geçirmiş gibi olur.';

  @override
  String get ishaTip =>
      'Yatsı namazı günün son namazıdır. Günü namazla bitirmek huzur ve gönül rahatlığı getirir.';

  @override
  String get newMuslimTip => 'Yeni Müslüman İçin İpucu';

  @override
  String get notificationsOn => 'Bildirimler açık';

  @override
  String get notificationsOff => 'Bildirimler kapalı';

  @override
  String get preview => 'Önizleme';

  @override
  String get lockPreviewCountdown => '1s 23dk içinde  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Kilidi açmak için yukarı kaydırın';

  @override
  String get searchSurahs => 'Sure ara…';

  @override
  String get noSurahsFound => 'Sure bulunamadı';

  @override
  String get tryAgain => 'Tekrar Dene';

  @override
  String ayahs(int count) {
    return '$count ayet';
  }

  @override
  String get searchDuas => 'Dua ara…';

  @override
  String supplications(int count) {
    return '$count dua';
  }

  @override
  String get prayerSettings => 'Namaz Ayarları';

  @override
  String get calculationMethod => 'Hesaplama Yöntemi';

  @override
  String get adhanSound => 'Ezan Sesi';

  @override
  String get prayerNotifications => 'Namaz Bildirimleri';

  @override
  String get statusOn => 'Açık';

  @override
  String get statusOff => 'Kapalı';

  @override
  String get enableAllNotifications => 'Tüm Bildirimleri Etkinleştir';

  @override
  String get individualPrayers => 'Bireysel Namazlar';

  @override
  String get appearance => 'Görünüm';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get language => 'Dil';

  @override
  String get aboutNoorGuard => 'Hakkında';

  @override
  String get version => 'Uygulama Sürümü';

  @override
  String get rateApp => 'Noor Guard\'ı Değerlendir';

  @override
  String get shareApp => 'Noor Guard\'ı Paylaş';

  @override
  String get contactSupport => 'Destek ile İletişime Geç';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get termsOfService => 'Kullanım Koşulları';

  @override
  String get helpUsImprove => 'Gelişmemize Yardımcı Olun';

  @override
  String get translationDisclaimer =>
      'Çevirilerimiz yapay zekâ desteğiyle hazırlanmıştır. Dilinizde bir hata fark ederseniz, geri bildiriminizi duymaktan mutluluk duyarız!';

  @override
  String get privacyPromiseTitle => 'Noor Guard Gizlilik Sözü';

  @override
  String get privacyPromiseBody =>
      'İnancınız kişiseldir. Verileriniz de öyle kalır. Verilerinizi asla satmıyor, paylaşmıyor veya paraya çevirmiyoruz. Ne konumunuzu, ne namaz alışkanlıklarınızı, ne de adınızı.';

  @override
  String get directionToSacredHouse => 'Mukaddes Eve Doğru Yön';

  @override
  String towardMecca(String degrees) {
    return 'Mekke\'ye doğru $degrees°';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (varsayılan)';

  @override
  String get prayerHistory => 'Namaz Geçmişi';

  @override
  String get currentStreak => 'Mevcut Seri';

  @override
  String get longestStreak => 'En Uzun Seri';

  @override
  String get legend => 'Açıklama';

  @override
  String get allFivePrayers => '5 vakit namaz';

  @override
  String get partialPrayers => 'Kısmi (1-4)';

  @override
  String get none => 'Yok';

  @override
  String get sun => 'Paz';

  @override
  String get mon => 'Pzt';

  @override
  String get tue => 'Sal';

  @override
  String get wed => 'Çar';

  @override
  String get thu => 'Per';

  @override
  String get fri => 'Cum';

  @override
  String get sat => 'Cmt';

  @override
  String headingDegrees(String degrees) {
    return 'Yön $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Sureler yüklenemedi';

  @override
  String get connectionError =>
      'Lütfen internet bağlantınızı kontrol edip tekrar deneyin';

  @override
  String get alQuran => 'Kur\'an-ı Kerim';

  @override
  String get dailySupplications => 'Günlük Dualar';

  @override
  String get all => 'Tümü';

  @override
  String get noDuasFound => 'Dua bulunamadı';

  @override
  String get january => 'Ocak';

  @override
  String get february => 'Şubat';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Nisan';

  @override
  String get may => 'Mayıs';

  @override
  String get june => 'Haziran';

  @override
  String get july => 'Temmuz';

  @override
  String get august => 'Ağustos';

  @override
  String get september => 'Eylül';

  @override
  String get october => 'Ekim';

  @override
  String get november => 'Kasım';

  @override
  String get december => 'Aralık';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get prayers => 'Namazlar';

  @override
  String get more => 'Daha Fazla';

  @override
  String get tafsir => 'Tefsir';

  @override
  String get lockScreen => 'Kilit Ekranı';

  @override
  String get readAndListen => 'Oku ve dinle';

  @override
  String get commentary => 'Açıklama';

  @override
  String get findDirection => 'Yön bul';

  @override
  String get reminders => 'Hatırlatıcılar';

  @override
  String get blockDistractions => 'Dikkat dağıtıcıları engelle';

  @override
  String get prayerGuard => 'Namaz koruyucu';

  @override
  String get importantDates => 'Önemli tarihler';

  @override
  String get comingSoon => 'Yakında';

  @override
  String get morningAndEvening => 'Sabah ve Akşam';

  @override
  String get prayer => 'Namaz';

  @override
  String get foodAndDrink => 'Yiyecek ve İçecek';

  @override
  String get verityWithHardship =>
      'Şüphesiz, zorlukla beraber bir kolaylık vardır.';

  @override
  String get ashSharh946 => 'İnşirah Suresi 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Namazlara, hele orta namaza dikkatle devam edin.';

  @override
  String get alBaqarah2238 => 'Bakara Suresi 2:238';

  @override
  String get pastEvents => 'Geçmiş Etkinlikler';

  @override
  String get upcomingEvents => 'Yaklaşan Etkinlikler';

  @override
  String get today => 'Bugün';

  @override
  String get next => 'Sıradaki';

  @override
  String hijriYearLabel(int year) {
    return 'Hicri $year';
  }

  @override
  String get islamicMonthMuharram => 'Muharrem';

  @override
  String get islamicMonthSafar => 'Safer';

  @override
  String get islamicMonthRabiAlAwwal => 'Rebîülevvel';

  @override
  String get islamicMonthRabiAlThani => 'Rebîülâhir';

  @override
  String get islamicMonthJumadaAlAwwal => 'Cemâziyelevvel';

  @override
  String get islamicMonthJumadaAlThani => 'Cemâziyelâhir';

  @override
  String get islamicMonthRajab => 'Recep';

  @override
  String get islamicMonthShaban => 'Şaban';

  @override
  String get islamicMonthRamadan => 'Ramazan';

  @override
  String get islamicMonthShawwal => 'Şevval';

  @override
  String get islamicMonthDhulQadah => 'Zilkade';

  @override
  String get islamicMonthDhulHijjah => 'Zilhicce';

  @override
  String get islamicNewYear => 'Hicri Yılbaşı';

  @override
  String get ashura => 'Aşure Günü';

  @override
  String get mawlidAlNabi => 'Mevlid Kandili';

  @override
  String get ramadanBegins => 'Ramazan Başlıyor';

  @override
  String get laylatAlQadr => 'Kadir Gecesi';

  @override
  String get eidAlFitr => 'Ramazan Bayramı';

  @override
  String get dayOfArafah => 'Arefe Günü';

  @override
  String get eidAlAdha => 'Kurban Bayramı';

  @override
  String get active => 'Aktif';

  @override
  String get focusModeSubtitle =>
      'Odaklanmanı koru. Sen durdurana kadar uygulamaların engelli kalır.';

  @override
  String get remaining => 'kaldı';

  @override
  String get ready => 'hazır';

  @override
  String get duration => 'Süre';

  @override
  String get minutesAbbreviation => 'dk';

  @override
  String get blockedDuringFocus => 'Odak Sırasında Engellenen';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uygulama',
      one: '$count uygulama',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Odağı Başlat';

  @override
  String get stopFocus => 'Odağı Durdur';

  @override
  String get alhamdulillah => 'Elhamdülillah!';

  @override
  String get sessionComplete => 'Oturum Tamamlandı';

  @override
  String stayedFocusedFor(String duration) {
    return '$duration boyunca odaklı kaldın.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika',
      one: '$count dakika',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"Sabır ve namaz ile yardım dileyin.\"\n— Bakara Suresi 2:45';

  @override
  String get done => 'Tamam';

  @override
  String get socialMedia => 'Sosyal Medya';

  @override
  String get entertainment => 'Eğlence';

  @override
  String get games => 'Oyunlar';

  @override
  String get messaging => 'Mesajlaşma';

  @override
  String get blockDuringPrayerTimes => 'Namaz vakitlerinde engelle';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Seçilen uygulamalar, günlük 5 vakit namaz\nsırasında otomatik olarak engellenecektir.';

  @override
  String get blockedLabel => 'engellendi';

  @override
  String get blockAllApps => 'Tüm uygulamaları engelle';

  @override
  String get blockingTimingInfo =>
      'Engelleme her namazdan 5 dakika önce başlar ve 15 dakika sonra kalkar.';

  @override
  String get blockedDuringPrayers => 'Namaz sırasında engelli';

  @override
  String get notBlocked => 'Engelli değil';

  @override
  String get wuduStep1 => 'Niyet';

  @override
  String get wuduStep2 => 'Besmele';

  @override
  String get wuduStep3 => 'Elleri Yıkama';

  @override
  String get wuduStep4 => 'Ağzı Çalkalama';

  @override
  String get wuduStep5 => 'Burnu Temizleme';

  @override
  String get wuduStep6 => 'Yüzü Yıkama';

  @override
  String get wuduStep7 => 'Kolları Yıkama';

  @override
  String get wuduStep8 => 'Başı Mesh Etme';

  @override
  String get wuduStep9 => 'Ayakları Yıkama';

  @override
  String get revertCorner => 'Yeni Müslüman Köşesi';

  @override
  String get revertCornerSubtitle =>
      'Yeni Müslümanlar için rehberler ve destek';

  @override
  String get wuduGuide => 'Abdest Rehberi';

  @override
  String get howToPray => 'Namaz Nasıl Kılınır';

  @override
  String get newMuslimChecklist => 'Yeni Müslüman Kontrol Listesi';

  @override
  String get islamicGlossary => 'İslami Terimler Sözlüğü';

  @override
  String get whyDoWe => 'Neden Yapıyoruz...';

  @override
  String get communityStories => 'Topluluk Hikayeleri';

  @override
  String get wuduGuideSubtitle => 'Namazdan önce arınma';

  @override
  String get howToPraySubtitle => 'Adım adım namaz rehberi';

  @override
  String get newMuslimChecklistSubtitle => '30 günlük yolculuğun';

  @override
  String get howToPrayStep1Name => 'Önce Abdest';

  @override
  String get howToPrayStep1Instruction =>
      'Namaza başlamadan önce temiz olmak için abdest al.';

  @override
  String get howToPrayStep1Tip =>
      'Emin değilsen, önce Yeni Müslüman Merkezi\'nden Abdest Rehberi\'ni aç.';

  @override
  String get howToPrayStep2Name => 'Kıbleye Dönerek Dur';

  @override
  String get howToPrayStep2Instruction =>
      'Seccadende, Kıble\'ye — Mekke\'deki Kâbe\'nin yönüne — dönerek dur. Tam yönü bulmak için uygulamadaki Kıble pusulasını kullan.';

  @override
  String get howToPrayStep2Tip =>
      'Biraz sapmış olman sorun değil — Allah niyetini bilir. Elinden gelenin en iyisini yap.';

  @override
  String get howToPrayStep3Name => 'Niyet';

  @override
  String get howToPrayStep3Instruction =>
      'Kılacağın namaz için kalbinden niyet et. Sesli söylemen gerekmez.';

  @override
  String get howToPrayStep3Tip =>
      'Niyetin sadece seninle Allah arasındadır. \'Allah rızası için sabah namazını kılıyorum\' gibi basit bir düşünce yeterlidir.';

  @override
  String get howToPrayStep4Name => 'Tekbir (Açılış)';

  @override
  String get howToPrayStep4Instruction =>
      'Her iki elini kulak hizasına kaldır ve \'Allahu Ekber\' (Allah en büyüktür) de. Bu, namazını resmi olarak başlatır.';

  @override
  String get howToPrayStep4Tip =>
      'Namaz boyunca gözlerini secde edeceğin yere doğru aşağıda tut.';

  @override
  String get howToPrayStep5Name => 'Kıyam (Ayakta Durma)';

  @override
  String get howToPrayStep5Instruction =>
      'Sağ elini sol elinin üzerine koyarak göğsünün üzerine yerleştir. Fatiha Suresi\'ni, ardından bildiğin başka bir kısa sure veya ayetleri oku.';

  @override
  String get howToPrayStep5Tip =>
      'Henüz başka bir sure bilmiyorsan, öğrenirken sadece Fatiha\'yı okumak yeterlidir.';

  @override
  String get howToPrayStep6Name => 'Rükû (Eğilme)';

  @override
  String get howToPrayStep6Instruction =>
      'Belinden eğilerek sırtın yere paralel olacak şekilde rükûya git. Ellerini dizlerine koy ve \'Subhane Rabbiyel Azîm\' de, üç kez tekrarla.';

  @override
  String get howToPrayStep6Tip =>
      'Sırtını düz ve yatay tut — kambur veya yuvarlak olmasın.';

  @override
  String get howToPrayStep7Name => 'İtidal (Rükûdan Doğrulma)';

  @override
  String get howToPrayStep7Instruction =>
      'Rükûdan kalk ve dik bir şekilde ayakta dur. Doğrulurken \'Semi Allahu limen hamideh\' de, ardından \'Rabbena lekel hamd\' de.';

  @override
  String get howToPrayStep7Tip =>
      'Bir sonraki pozisyona geçmeden önce tamamen dik durup bir an sakin kal.';

  @override
  String get howToPrayStep8Name => 'Secde';

  @override
  String get howToPrayStep8Instruction =>
      'Alnını, burnunu, her iki avucunu, dizlerini ve ayak parmaklarını yere koyarak secdeye git. \'Subhane Rabbiyel A\'lâ\' de, üç kez tekrarla.';

  @override
  String get howToPrayStep8Tip =>
      'Yedi vücut bölümü yere değmelidir: alın (burunla birlikte), iki el, iki diz ve iki ayak.';

  @override
  String get howToPrayStep9Name => 'Celse (İki Secde Arası Oturuş)';

  @override
  String get howToPrayStep9Instruction =>
      'Secdeden sol ayağını yayarak ve sağ ayağını dik tutarak otur. Otururken \'Allahu Ekber\' de. Kısa bir süre bekle, ardından ikinci secdeye git.';

  @override
  String get howToPrayStep9Tip =>
      'İki secde arasındaki bu kısa oturuşa Celse denir. Namazın gerekli bir parçasıdır.';

  @override
  String get howToPrayStep10Name => 'Rekatları Tamamla';

  @override
  String get howToPrayStep10Instruction =>
      'İlk rekâtı tamamladıktan sonra ayağa kalk ve ikinci rekât için aynı adımları tekrarla. Rekât sayısı kıldığın namaza göre değişir.';

  @override
  String get howToPrayStep10Tip =>
      'Sabah namazı 2 rekât, öğle 4, ikindi 4, akşam 3 ve yatsı 4 rekâttır. Her rekâtı sırayla yap.';

  @override
  String get howToPrayStep11Name => 'Teşehhüd (Son Oturuş)';

  @override
  String get howToPrayStep11Instruction =>
      'Son oturuşta Teşehhüd\'ü oku. Bu, son rekâtından sonra otururken okuduğun bir iman beyanıdır.';

  @override
  String get howToPrayStep11Tip =>
      'Teşehhüd sırasında \'Eşhedü en lâ ilâhe illallah\' derken, Allah\'ın birliğinin bir işareti olarak sağ işaret parmağını kaldır.';

  @override
  String get howToPrayStep12Name => 'Selam (Kapanış)';

  @override
  String get howToPrayStep12Instruction =>
      'Başını sağa çevirip \'Esselamu Aleyküm ve Rahmetullah\' de, ardından sola çevirip aynısını tekrarla. Bu, namazını sona erdirir.';

  @override
  String get howToPrayStep12Tip =>
      'Namazdan sonra dua etmek ve Allah\'tan ihtiyacın olanı istemek için bir an ayır. Bu, Allah\'a bağlanmak için güzel bir andır.';

  @override
  String get checklistWeek1Title => '1. Hafta';

  @override
  String get checklistWeek2Title => '2. Hafta';

  @override
  String get checklistWeek3Title => '3. Hafta';

  @override
  String get checklistWeek4Title => '4. Hafta';

  @override
  String get checklistWeek1Item1 => 'Kelime-i Şehadet Getir';

  @override
  String get checklistWeek1Item2 => 'Abdesti Öğren';

  @override
  String get checklistWeek1Item3 => 'Fatiha Suresi\'ni Öğren';

  @override
  String get checklistWeek1Item4 => 'İlk Sabah Namazını Kıl';

  @override
  String get checklistWeek1Item5 => 'Bir Seccade Edin';

  @override
  String get checklistWeek1Item6 => 'Yakındaki Bir Cami Bul';

  @override
  String get checklistWeek2Item1 => '5 Vakit Namazı Öğren';

  @override
  String get checklistWeek2Item2 => 'Temel Duaları Öğren';

  @override
  String get checklistWeek2Item3 => 'Peygamber Muhammed Hakkında Oku';

  @override
  String get checklistWeek2Item4 => 'Müslüman Toplulukla Bağlantı Kur';

  @override
  String get checklistWeek3Item1 => 'Helal Yiyecekler Hakkında Bilgi Edin';

  @override
  String get checklistWeek3Item2 => 'İhlas Suresi\'ni Oku';

  @override
  String get checklistWeek3Item3 => 'Ramazan Hakkında Bilgi Edin';

  @override
  String get checklistWeek3Item4 => 'Günlük Zikre Başla';

  @override
  String get checklistWeek4Item1 => 'Zekât Hakkında Bilgi Edin';

  @override
  String get checklistWeek4Item2 => '5 Şart Hakkında Oku';

  @override
  String get checklistWeek4Item3 => 'Namaz Bildirimlerini Ayarla';

  @override
  String get checklistWeek4Item4 => 'Yolculuğun Üzerine Düşün';

  @override
  String get wuduStep1Instruction =>
      'Allah rızası için abdest almaya kalbinden niyet et.';

  @override
  String get wuduStep1Tip =>
      'Sesli söylemen gerekmez — kalpten samimi bir niyet yeterlidir.';

  @override
  String get wuduStep2Instruction =>
      'Başlamadan önce Besmele çek (Allah\'ın adıyla).';

  @override
  String get wuduStep2Tip =>
      'Besmele çekmek sünnettir ve abdestine Allah\'ı anarak başlamanı sağlar.';

  @override
  String get wuduStep3Instruction =>
      'Su parmak aralarına ulaşacak şekilde her iki elini bileklere kadar üç kez yıka.';

  @override
  String get wuduStep3Tip =>
      'Önce sağ elden başla, sonra sol el. Bu sıralama İslam\'da tavsiye edilir.';

  @override
  String get wuduStep4Instruction =>
      'Ağzına su al, çalkala ve tükür. Bunu üç kez yap.';

  @override
  String get wuduStep4Tip =>
      'Bu, ağzı temizler ve arınma sürecinin bir parçasıdır.';

  @override
  String get wuduStep5Instruction =>
      'Burnuna su çek ve nazikçe üfleyerek çıkar. Bunu üç kez yap.';

  @override
  String get wuduStep5Tip =>
      'Suyu çekmek için sağ elini, dışarı atmak için sol elini kullan.';

  @override
  String get wuduStep6Instruction =>
      'Tüm yüzünü, saç çizgisinden çeneye ve kulaktan kulağa olacak şekilde üç kez yıka.';

  @override
  String get wuduStep6Tip =>
      'Yüzünün hiçbir yerinin kuru kalmadığından emin ol.';

  @override
  String get wuduStep7Instruction =>
      'Sağ kolunu parmak uçlarından dirseğe kadar üç kez yıka, sonra aynısını sol kol için yap.';

  @override
  String get wuduStep7Tip => 'Abdestte her zaman önce sağ taraftan başla.';

  @override
  String get wuduStep8Instruction =>
      'Ellerini ıslat ve tüm başının üzerinden bir kez, önden arkaya ve arkadan öne doğru mesh et.';

  @override
  String get wuduStep8Tip =>
      'Yıkamadan farklı olarak, başı mesh etmek sadece bir kez yapılır.';

  @override
  String get wuduStep9Instruction =>
      'Sağ ayağını topuk dahil olmak üzere üç kez yıka, sonra aynısını sol ayak için yap.';

  @override
  String get wuduStep9Tip =>
      'Suyun ayak parmakları arasına ulaştığından emin ol. Aralarını temizlemek için parmağını kullan.';

  @override
  String get islamicGlossaryTitle => 'İslami Terimler Sözlüğü';

  @override
  String get islamicGlossarySubtitle =>
      'Kur\'an, Sünnet ve klasik ilimden 51 terim';

  @override
  String get searchTermsHint => 'Terim, Arapça, tanım ara...';

  @override
  String get categoryAll => 'Tümü';

  @override
  String get categoryPillar => 'Şart';

  @override
  String get categoryAqeedah => 'Akide';

  @override
  String get categoryPractice => 'Uygulama';

  @override
  String get categoryDhikr => 'Zikir';

  @override
  String get categoryQuran => 'Kur\'an';

  @override
  String get categoryHadith => 'Hadis';

  @override
  String get categoryFiqh => 'Fıkıh';

  @override
  String get categoryHistory => 'Tarih';

  @override
  String get noTermsFound => 'Terim bulunamadı';

  @override
  String get sourceLabel => 'Kaynak';

  @override
  String get revertCornerHubSubtitle =>
      'Yeni Müslüman olarak ilk adımlarına rehberlik eden nazik bir merkez';

  @override
  String get islamicGlossaryHubSubtitle => 'Yaygın terimler basitçe açıklandı';

  @override
  String get whyDoWeHubSubtitle => 'Günlük uygulamaların ardındaki hikmet';

  @override
  String get communityStoriesHubSubtitle =>
      'Yeni Müslümanlar İslam\'a yolculuklarını paylaşıyor';

  @override
  String get whyDoWeScreenSubtitle =>
      '12 günlük İslami uygulamanın ardındaki hikmet';

  @override
  String get whyDoWeSourceBadge => 'Sünni Kaynak';

  @override
  String get whyDoWeQ1 => 'Neden günde 5 vakit namaz kılıyoruz?';

  @override
  String get whyDoWeA1 =>
      'Allah, beş vakit namazı Kur\'an\'da (2:238) emretti ve bunlar Mirac gecesinde (İsra ve Mirac) farz kılındı. Peygamber ﷺ şöyle buyurdu: «Kıyamet gününde kulun hesaba çekileceği ilk şey namazdır.» (İbn Mâce). Namaz, gün boyunca bizi Allah\'a bağlı tutar.';

  @override
  String get whyDoWeQ2 => 'Namaz kılarken neden Mekke\'ye doğru yöneliyoruz?';

  @override
  String get whyDoWeA2 =>
      'Allah Kur\'an\'da (2:144) şöyle buyurdu: «Yüzünü Mescid-i Haram\'a çevir.» Mekke\'deki Kâbe, Allah\'a ibadet için inşa edilen ilk evdir (3:96). Aynı yöne dönmek, dünyadaki tüm Müslümanları namazda birleştirir.';

  @override
  String get whyDoWeQ3 => 'Neden Ramazan\'da oruç tutuyoruz?';

  @override
  String get whyDoWeA3 =>
      'Allah orucu Kur\'an\'da (2:183) şöyle emretti: «Ey iman edenler! Oruç, sizden öncekilere farz kılındığı gibi sizlere de farz kılındı ki takvâ sahibi olasınız.» Ramazan, Kur\'an\'ın indirildiği aydır (2:185).';

  @override
  String get whyDoWeQ4 => 'Yemekten önce neden Besmele çekiyoruz?';

  @override
  String get whyDoWeA4 =>
      'Peygamber ﷺ şöyle buyurdu: «Sizden biri yemek yiyeceği zaman Allah\'ın adını ansın. Eğer başında unutursa, hatırladığında \'Bismillahi evvelehu ve âhirehu\' desin.» (Ebû Dâvûd). Bu bize tüm nimetlerin Allah\'tan geldiğini hatırlatır.';

  @override
  String get whyDoWeQ5 =>
      'Camiye girmeden önce neden ayakkabılarımızı çıkarıyoruz?';

  @override
  String get whyDoWeA5 =>
      'Allah Hz. Musa\'ya şöyle emretmişti: «Pabuçlarını çıkar, çünkü sen kutsal vadi Tuvâ\'dasın.» (Kur\'an 20:12). Ayakkabı çıkarmak, Allah\'ın evine saygı gösterir ve namaz kılınan yeri temiz tutar.';

  @override
  String get whyDoWeQ6 => 'Neden selamlaşırken \'Esselamu Aleyküm\' diyoruz?';

  @override
  String get whyDoWeA6 =>
      'Peygamber ﷺ şöyle buyurdu: «İman etmedikçe cennete giremezsiniz, birbirinizi sevmedikçe de iman etmiş olamazsınız. Size, yaptığınız takdirde birbirinizi seveceğiniz bir şey göstereyim mi? Aranızda selamı yayın.» (Müslim). Bu aynı zamanda bir duadır — karşındaki kişiye huzur dilemiş olursun.';

  @override
  String get whyDoWeQ7 => 'Neden Hac yapıyoruz?';

  @override
  String get whyDoWeA7 =>
      'Hac, Allah tarafından (3:97) şöyle emredilmiştir: «Yoluna gücü yetenlerin o evi haccetmesi, Allah\'ın insanlar üzerinde bir hakkıdır.» Hac, Hz. İbrahim ve ailesinin yaşadığı sınavları anar ve tüm milletlerden Müslümanları ibadette birleştirir.';

  @override
  String get whyDoWeQ8 => 'Neden Zekât veriyoruz?';

  @override
  String get whyDoWeA8 =>
      'Zekât, İslam\'ın üçüncü şartıdır ve Kur\'an\'da namazla birlikte 30\'dan fazla yerde emredilmiştir. Peygamber ﷺ, zekâtın malı arındırdığını buyurmuştur. Eşitsizliği azaltır ve müminlere malın Allah\'a ait olduğunu hatırlatır.';

  @override
  String get whyDoWeQ9 => 'Neden hapşırdıktan sonra \'Elhamdülillah\' diyoruz?';

  @override
  String get whyDoWeA9 =>
      'Peygamber ﷺ şöyle buyurdu: «Sizden biri hapşırdığında \'Elhamdülillah\' desin, kardeşi veya arkadaşı da ona \'Yerhamukallah\' desin.» (Buhârî). Bu, sağlık nimeti için Allah\'a şükran anıdır.';

  @override
  String get whyDoWeQ10 => 'Müslüman kadınlar neden başörtüsü takıyor?';

  @override
  String get whyDoWeA10 =>
      'Allah Kur\'an\'da (24:31) inanan kadınların iffetlerini korumalarını emretti. Başörtüsü, Allah\'a ibadet ve itaatin bir parçasıdır. Birçok Müslüman kadın için kimlik, onur ve manevi bağ kaynağıdır.';

  @override
  String get whyDoWeQ11 => 'Neden domuz eti ve alkolden kaçınıyoruz?';

  @override
  String get whyDoWeA11 =>
      'Allah, domuz etini Kur\'an\'da (2:173) ve alkolü (5:90) yasaklamış, alkolü «şeytanın işinden bir pislik» olarak nitelendirmiştir. Bu yasaklar sağlığı, aklı ve aileyi korur. Helal ilkeleri, müminlerin bedensel ve manevi temizliğini korumasına yardımcı olur.';

  @override
  String get whyDoWeQ12 => 'Neden \'İnşallah\' diyoruz?';

  @override
  String get whyDoWeA12 =>
      'Allah Kur\'an\'da (18:23-24) şöyle buyurur: «Hiçbir şey hakkında, Allah\'ın dilemesine bağlamadan, \'Bunu yarın yapacağım\' deme.» İnşallah demek, geleceği yalnızca Allah\'ın kontrol ettiğini kabul etmek ve mütevazı kalmaktır.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Dünyanın dört bir yanından İslam\'a giden gerçek yolculuklar';

  @override
  String get communityStoriesTimeLabel => 'Müslüman Olalı';

  @override
  String get communityStoriesShareBtn => 'Hikayeni Paylaş';

  @override
  String get communityStoriesShareSoon => 'Yakında — bu özellik geliyor!';

  @override
  String get communityStory1Name => 'Ayşe (eski adıyla Sarah)';

  @override
  String get communityStory1Location => 'Teksas, ABD';

  @override
  String get communityStory1Time => '2 yıl';

  @override
  String get communityStory1Text =>
      'İslam\'la bir üniversite ödevi için araştırma yaparken karşılaştım. Medyanın anlattıklarını bulmayı bekliyordum. Bunun yerine huzur, mantık ve gerçekten anlamlı olan bir Allah buldum. 6 ay sonra şehadet getirdim. En zor kısmı namaz kılmayı öğrenmek değil, ailemle paylaşmaktı. Ama elhamdülillah, iki yıl sonra annem bana İslam hakkında sorular soruyor.';

  @override
  String get communityStory2Name => 'Yusuf (eski adıyla James)';

  @override
  String get communityStory2Location => 'Londra, Birleşik Krallık';

  @override
  String get communityStory2Time => '4 yıl';

  @override
  String get communityStory2Text =>
      'Yıllarca arayışta bulunduktan sonra Müslüman oldum. Hristiyanlık, Budizm, ateizm — hiçbiri içimdeki boşluğu doldurmadı. Müslüman bir iş arkadaşım beni Cuma namazına davet etti. Arkada oturdum ve süre boyunca ağladım. Neden ağladığımı bile bilmiyordum. Ertesi hafta şehadet getirdim. Topluluk beni hiç ihtiyacım olduğunu bilmediğim bir aile gibi sarıp sarmaladı.';

  @override
  String get communityStory3Name => 'Meryem (eski adıyla Maria)';

  @override
  String get communityStory3Location => 'Mexico City, Meksika';

  @override
  String get communityStory3Time => '1 yıl';

  @override
  String get communityStory3Text =>
      'Latin kökenli ve Müslüman olmak bir süper güç gibi hissettiriyor. İslam\'ı sabaha karşı izlediğim bir YouTube videosuyla buldum. Saatlerce izledim. Tevhid kavramı — Allah\'ın bir olduğu, ortağı ve sureti bulunmadığı fikri — bende çok derin yankı buldu. Camideki İspanyolca konuşan kız kardeşlerim beni hemen evimde hissettirdi.';

  @override
  String get communityStory4Name => 'İbrahim (eski adıyla David)';

  @override
  String get communityStory4Location => 'Toronto, Kanada';

  @override
  String get communityStory4Time => '6 yıl';

  @override
  String get communityStory4Text =>
      'Bir papazın oğluydum. Kimsenin cevaplayamadığı Teslis hakkında sorularım vardı. Kur\'an\'ı ilk okuduğumda, zaten inandığım bir şeyi okuyormuş gibi hissettim. Şehadetimi önce yalnız başıma sessizce, sonra da camide tekrar getirdim. Hayatımın en iyi kararıydı.';

  @override
  String get communityStory5Name => 'Fatma (eski adıyla Jennifer)';

  @override
  String get communityStory5Location => 'Sidney, Avustralya';

  @override
  String get communityStory5Time => '3 yıl';

  @override
  String get communityStory5Text =>
      'Yolculuğum bir başörtüsüyle başladı. Onu bir meydan okuma olarak taktım ve... korunmuş hissettim. İslam hakkında okumaya başladım ve duramadım. Üç ay içinde şehadet getirmiştim. İnsanlar bana neyden vazgeçtiğimi soruyor. Onlara, boşluktan vazgeçtiğimi söylüyorum.';

  @override
  String get communityStory6Name => 'Ömer (eski adıyla Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Güney Afrika';

  @override
  String get communityStory6Time => '5 yıl';

  @override
  String get communityStory6Text =>
      'Zorlu bir mahallede büyüdüm. İslam bana disiplin, amaç ve kardeşlik verdi. İlk secde ettiğimde içimde bir şey açıldı — en güzel şekilde. Ağladım ve nedenini açıklayamadım. Şimdi dine giden yolu arayan diğer genç adamlara rehberlik ediyorum.';

  @override
  String get inspiredByRealStories =>
      'Gerçek yeni Müslüman hikayelerinden ilham alınmıştır';

  @override
  String get storyFormTitle => 'Hikayeni Paylaş';

  @override
  String get storyFormNameLabel => 'Adın';

  @override
  String get storyFormNameHint => 'Adını yaz, ya da \'Anonim\' yaz';

  @override
  String get storyFormCountryLabel => 'Ülke';

  @override
  String get storyFormCountryHint => 'Nerelisin?';

  @override
  String get storyFormTimeLabel => 'Müslüman Olalı';

  @override
  String get storyFormTimeHint => 'ör. 2 yıl, 6 ay';

  @override
  String get storyFormStoryLabel => 'Hikayen';

  @override
  String get storyFormStoryHint => 'İslam\'a giden yolculuğunu paylaş...';

  @override
  String get storyFormSubmitBtn => 'Hikayeyi Gönder';

  @override
  String get storyFormThankYouTitle => 'CezakAllahu Hayran!';

  @override
  String get storyFormThankYouBody =>
      'Hikayen alındı. Yayınlamadan önce tüm gönderileri inceliyoruz.';

  @override
  String get storyFormRequiredError => 'Lütfen tüm alanları doldurun';

  @override
  String get subtitleYourGuideToIslam => 'İslam\'a rehberin';

  @override
  String get beginnerMode => 'Başlangıç Modu';

  @override
  String get beginnerModeSubtitle =>
      'Yeni Müslümanlar için ek ipuçları ve rehberlik';

  @override
  String get beginnerModeOn =>
      'Başlangıç Modu açık — uygulama genelinde ek ipuçları gösteriliyor';

  @override
  String get beginnerModePrayersTip =>
      'İpucu: Her namaz hakkında daha fazla bilgi edinmek ve sünnet namazları görmek için üzerine dokun';

  @override
  String get tafsirSubtitle => 'Kur\'an Tefsiri';

  @override
  String get tafsirComingSoon => 'Bu surenin tefsiri yakında eklenecek';

  @override
  String get tafsirNotAvailable => 'Tefsir mevcut değil';

  @override
  String get scholarSource => 'Kaynak';

  @override
  String get asbabAlNuzul => 'İniş Sebebi';

  @override
  String get transliteration => 'Okunuşu';

  @override
  String get selectReciter => 'Kâri Seç';

  @override
  String get playVerse => 'Ayeti dinle';

  @override
  String get asmaUlHusna => 'Esma-ül Hüsna';

  @override
  String get asmaUlHusnaSubtitle => 'Allah\'ın 99 Güzel İsmi';

  @override
  String get asmaHadith =>
      'Allah\'ın 99 ismi vardır. Onları ezberleyen cennete girer.';

  @override
  String get asmaHadithSource => 'Sahih-i Buhârî, 2736';

  @override
  String get asmaSearchHint => 'İsim ara...';

  @override
  String get asmaNoResults => 'İsim bulunamadı';

  @override
  String get asmaSignificance => 'Anlamı';

  @override
  String get asmaUlHusnaTile => '99 İsim';

  @override
  String get asmaUlHusnaTileSubtitle => 'Allah\'ın İsimleri';

  @override
  String get onboardingTagline => 'Vaktini koru. Namazlarını gözet.';

  @override
  String get onboardingChooseLanguage => 'Dilini seç';

  @override
  String get onboardingGetStarted => 'Başla';

  @override
  String get onboardingLocationTitle => 'Doğru Namaz Vakitleri';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard, şehrin için doğru namaz vakitlerini hesaplamak amacıyla konumuna ihtiyaç duyar. Konumun asla saklanmaz veya paylaşılmaz.';

  @override
  String get onboardingPrivacyBanner =>
      'İnancınız kişiseldir. Verileriniz de öyle kalır.';

  @override
  String get onboardingAllowLocation => 'Konuma İzin Ver';

  @override
  String get onboardingSkipForNow => 'Şimdilik geç';

  @override
  String get onboardingNotificationTitle => 'Hiçbir Namazı Kaçırma';

  @override
  String get onboardingNotificationDesc =>
      'Her namaz vaktinde güzel bir ezan sesiyle bildirim al. Sesleri ve zamanlamayı ayarlardan özelleştir.';

  @override
  String get onboardingAdhanAlerts => 'Ezan bildirimleri';

  @override
  String get onboardingCustomTiming => 'Özel zamanlama';

  @override
  String get onboardingAdjustable => 'Ayarlanabilir';

  @override
  String get onboardingEnableNotifications => 'Bildirimleri Etkinleştir';

  @override
  String get onboardingMaybeLater => 'Belki sonra';

  @override
  String get onboardingAllSetTitle => 'Her Şey Hazır!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard, vaktini korumaya\nve gününe niyetle rehberlik etmeye hazır.';

  @override
  String get onboardingPrayerTimesLabel => 'Namaz Vakitleri';

  @override
  String get onboardingPrayerTimesDesc => 'Şehrin için doğru vakitler';

  @override
  String get onboardingLockScreenLabel => 'İslami Kilit Ekranı';

  @override
  String get onboardingLockScreenDesc => 'Her kilit açışında Kur\'an ve dualar';

  @override
  String get onboardingPrayerGuardLabel => 'Namaz Koruyucu';

  @override
  String get onboardingPrayerGuardDesc =>
      'Namaz sırasında uygulamalar otomatik olarak engellenir';

  @override
  String get onboardingEnterApp => 'Noor Guard\'a Gir';

  @override
  String get adhan => 'Ezan';

  @override
  String get adhanSubtitle => 'Namaza Çağrı';

  @override
  String get adhanDescription =>
      'Ezan, müminleri ibadete davet etmek için günde beş kez okunan İslami namaza çağrıdır.';

  @override
  String get makkahStyle => 'Mekke';

  @override
  String get madinahStyle => 'Medine';

  @override
  String get egyptianStyle => 'Mısır';

  @override
  String get adhanPlaying => 'Şu An Çalınıyor';

  @override
  String get makkahDescription =>
      'Mekke\'deki Mescid-i Haram\'dan geleneksel namaza çağrı.';

  @override
  String get madinahDescription =>
      'Medine\'deki Mescid-i Nebevi tarzında sakin bir okuyuş.';

  @override
  String get egyptianDescription =>
      'Zengin okuyuşuyla tanınan melodik Mısır tarzı ezan.';

  @override
  String get adhanCallToWorship => 'Namaza Çağrı';

  @override
  String get adhanDescriptionFull =>
      'Ezan, müminleri ibadete davet etmek için günde beş kez okunan İslami namaza çağrıdır.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Mescid-i Aksa';

  @override
  String get turkishStyle => 'Türk';

  @override
  String get pakistaniStyle => 'Pakistan';

  @override
  String get indonesianStyle => 'Endonezya';

  @override
  String get alafasyDescription =>
      'Tanınmış hafız Mishary Rashid Alafasy\'nin içten bir okuyuşu.';

  @override
  String get alaqsaDescription =>
      'İslam\'ın üçüncü en kutsal mekanı olan Kudüs\'teki Mescid-i Aksa\'dan yankılanan namaza çağrı.';

  @override
  String get turkishDescription =>
      'Kendine özgü melodik makamıyla geleneksel Türk tarzı ezan.';

  @override
  String get pakistaniDescription =>
      'Güney Asya geleneğinde, Pakistan\'ın her yerinde okunan içten bir ezan.';

  @override
  String get indonesianDescription =>
      'Takımadalar boyunca sevilen, melodik Endonezya tarzı bir ezan.';

  @override
  String get thisWeek => 'Bu Hafta';

  @override
  String weeklyProgress(int count) {
    return 'Bu hafta 35 namazdan $count tanesi';
  }

  @override
  String get bestDay => 'En iyi gün';

  @override
  String get prayerStats => 'Namaz İstatistikleri';

  @override
  String get completionRate => 'Tamamlanma Oranı';

  @override
  String get bestPrayer => 'En Düzenli Namaz';

  @override
  String get hardestPrayer => 'En Çok Kaçırılan Namaz';

  @override
  String totalPrayersCompleted(int count) {
    return '$count namaz tamamlandı';
  }

  @override
  String get last7Days => 'Son 7 Gün';

  @override
  String get thisMonth => 'Bu Ay';

  @override
  String get fullDays => 'Tam günler';

  @override
  String get partialDays => 'Kısmi günler';

  @override
  String get missedDays => 'Kaçırılan günler';

  @override
  String get missedPrayerBadge => 'Kaçırıldı';

  @override
  String get makeItUp => 'Kaza Et';

  @override
  String get qadaExplanation =>
      'Bir namazı kaçırdıysanız, onu kaza namazı olarak hâlâ kılabilirsiniz.';

  @override
  String get noStatsYet =>
      'İstatistiklerinizi burada görmek için namazlarınızı işaretlemeye devam edin.';

  @override
  String get notEnoughData => 'Henüz yeterli veri yok';

  @override
  String get continuousPlay => 'Sürekli';

  @override
  String get sleepTimer => 'Uyku Sayacı';

  @override
  String verseCount(Object total, Object verse) {
    return 'Ayet $verse / $total';
  }

  @override
  String get verseTafsir => 'Ayet Tefsiri';

  @override
  String get tafsirOfTheDay => 'Günün Tefsiri';

  @override
  String get dailyInsight => 'Günlük Bilgi';

  @override
  String get keyThemes => 'Ana Temalar ve Dersler';

  @override
  String get readFullSurah => 'Surenin Tamamını Oku';

  @override
  String get surahIntroduction => 'Sure Tanıtımı';

  @override
  String get verses => 'ayet';

  @override
  String get loadingTafsir => 'Tefsir yükleniyor...';

  @override
  String get keepAliveNotificationText => 'Namaz bildirimleri etkin';

  @override
  String get keepAliveChannelName => 'Namaz Bildirimleri';

  @override
  String get keepAliveChannelDescription =>
      'Namaz alarmlarının asla kaçırılmaması için Noor Guard\'ı arka planda etkin tutar.';

  @override
  String get notifSetupTitle => 'Kilit Ekranı Uyarılarını Etkinleştir';

  @override
  String get notifSetupSubtitle =>
      'Telefonunuz kilitliyken bile ezanı asla kaçırmamanız için. Yaklaşık bir dakika sürer.';

  @override
  String get notifSetupSamsungBanner =>
      'Samsung Galaxy (Fold/Flip dahil) kullanıyor musunuz? Samsung, standart Android\'in dışında ek anahtarlar ekler — aşağıdaki 4. ve 6. adımlar bunları tam olarak nerede bulacağınızı gösterir.';

  @override
  String get notifSetupStep1Title => 'Bildirimlere İzin Ver';

  @override
  String get notifSetupStep1Description =>
      'Noor Guard\'ın sizi herhangi bir şekilde uyarabilmesi için gereken temel izin.';

  @override
  String get notifSetupStep1Action => 'Bildirimlere İzin Ver';

  @override
  String get notifSetupStep2Title => 'Alarmlar ve Hatırlatıcılar';

  @override
  String get notifSetupStep2Description =>
      'Telefonunuz boştayken veya pil tasarrufu modundayken bile namaz alarmlarının tam namaz vaktinde çalmasını sağlar.';

  @override
  String get notifSetupStep2Action => 'Alarm Ayarlarını Aç';

  @override
  String get notifSetupStep3Title => 'Diğer Uygulamaların Üzerinde Göster';

  @override
  String get notifSetupStep3Description =>
      'Tam namaz ekranının kilit ekranının ve açık olan her şeyin üzerinde görünmesini sağlar.';

  @override
  String get notifSetupStep3Action => 'Ayarları Aç';

  @override
  String get notifSetupStep4Title =>
      'Açılır Pencere / Tam Ekran Uyarı Olarak Göster';

  @override
  String get notifSetupStep4Description =>
      'Ezan ekranının sessiz bir banner olarak kalmak yerine kilit ekranını delip geçmesini sağlar.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Samsung Galaxy telefonlarda (Fold/Flip dahil): Ayarlar\'ı açın → \"Prayer Time Alarm\"e dokunun, sonra \"Pop-up notification\"ı açın (Fold/Flip\'te \"Cover screen pop-up\" olarak adlandırılır). Bu yalnızca Samsung\'a özel bir anahtardır — bunu açmak, ezan ekranını gerçekten kilit ekranınızın üzerine getiren şeydir.';

  @override
  String get notifSetupStep4Action => 'Bildirim Ayarlarını Aç';

  @override
  String get notifSetupStep5Title => 'Bildirimleri Güvenilir Tutun';

  @override
  String get notifSetupStep5Description =>
      'Android\'in Noor Guard\'ı arka planda yavaşlatmasını veya geciktirmesini önler, böylece namaz alarmları ve hatırlatıcılar her zaman zamanında ulaşır.';

  @override
  String get notifSetupStep5Action => 'Pil Optimizasyonunu Kapat';

  @override
  String get notifSetupStep6Title => 'Asla Uyumayan Uygulamalar';

  @override
  String get notifSetupStep6Description =>
      'Samsung\'un pil yöneticisi Noor Guard\'ı uyutabilir ve namaz alarmlarını sessizce engelleyebilir. Onu \"Never sleeping apps\" listesine eklemek bunu önler.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Ayarlar → Pil ve cihaz bakımı → Arka plan kullanım sınırları → Never sleeping apps → \"+\" işaretine dokunun → Noor Guard\'ı seçin.';

  @override
  String get notifSetupStep6Action => 'Pil Ayarlarını Aç';

  @override
  String get notifSetupStatusChecking => 'Kontrol ediliyor…';

  @override
  String get notifSetupStatusEnabled => 'Etkin';

  @override
  String get notifSetupStatusNeeded => 'Gerekli';

  @override
  String get notifSetupStatusManual => 'Manuel Adım';

  @override
  String get notifSetupContinueButton => 'Noor Guard\'a Geç';

  @override
  String get notifSetupLaterButton => 'Bunu daha sonra tamamlayacağım';

  @override
  String get notifSetupDoneButton => 'Tamamlandı';

  @override
  String get testNotificationButton => 'Test Bildirimi Gönder (10sn)';

  @override
  String get testNotificationSnack => 'Test bildirimi 10 saniye içinde gelecek';

  @override
  String get testLockAlarmButton => 'Tam Ekran Kilit Alarmını Test Et (10sn)';

  @override
  String get testLockAlarmSnack =>
      'Kilit alarmı 10 saniye içinde çalacak — telefonunuzu şimdi kilitleyin';

  @override
  String get testAdhanForegroundButton =>
      'Uygulama İçi Ezanı Test Et (ön planda)';

  @override
  String get testAdhanForegroundSnack =>
      'Tam ezan sessiz bir banner ile çalınıyor';

  @override
  String get testRequiresNotificationsOn =>
      'Bunu test etmek için önce Namaz Bildirimlerini açın';

  @override
  String get lockScreenSetupGuideButton =>
      'Kilit Ekranı Uyarısı Kurulum Kılavuzu';

  @override
  String get couldNotOpenPrivacyPolicy => 'Gizlilik Politikası açılamadı';

  @override
  String get couldNotOpenEmailApp => 'E-posta uygulaması açılamadı';

  @override
  String get blockDurationLabel => 'Engelleme süresi';

  @override
  String get privacyAndTrust => 'Gizlilik ve Güven';

  @override
  String get noorGuardMotto =>
      '\"Bir camiye uygun değilse,\nNoor Guard\'a da uygun değildir.\"';

  @override
  String get openingAppStore => 'App Store açılıyor…';

  @override
  String get openingShareSheet => 'Paylaşım menüsü açılıyor…';

  @override
  String get openingSupportEmail => 'Destek e-postası açılıyor…';

  @override
  String get openingTermsOfService => 'Kullanım Koşulları açılıyor…';

  @override
  String get duration30Min => '30 dk';

  @override
  String get duration1Hour => '1 saat';

  @override
  String get durationPrayerWindowOnly => 'Yalnızca namaz aralığı';

  @override
  String get hoursAbbreviation => 'sa';

  @override
  String get cancelTimerButton => 'Sayacı iptal et';

  @override
  String get custom => 'Özel';

  @override
  String get customTimerMinutesTitle => 'Özel sayaç (dakika)';

  @override
  String get customTimerHint => 'örn. 20';

  @override
  String get cancel => 'İptal';

  @override
  String get start => 'Başlat';

  @override
  String get travel => 'Yolculuk';

  @override
  String get anxietyAndStress => 'Kaygı ve Stres';

  @override
  String get gratitude => 'Şükür';

  @override
  String get protection => 'Koruma';

  @override
  String get family => 'Aile';

  @override
  String get forgiveness => 'Bağışlanma';

  @override
  String get appBlockingSetupHeadline => 'Zamanını koru, namazını koru';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard, Android\'in Erişilebilirlik hizmetini yalnızca namaz vakti engellenen bir uygulamanın açıldığını fark etmek için kullanır. Mesajlarını, fotoğraflarını veya herhangi bir kişisel verini asla okumaz.';

  @override
  String get appBlockingAccessibilityStatusOn => 'Erişilebilirlik izni verildi';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Erişilebilirlik izni verilmedi';

  @override
  String get appBlockingOpenSettings => 'Erişilebilirlik Ayarlarını Aç';

  @override
  String get appBlockingSetupNotNow => 'Şimdi değil';

  @override
  String get appBlockingEnableToggle => 'Uygulama Engellemeyi Etkinleştir';

  @override
  String get appBlockingModeLabel => 'Engelleme Modu';

  @override
  String get appBlockingModeSoft => 'Hafif';

  @override
  String get appBlockingModeSoftDesc =>
      'Sadece nazik bir hatırlatma — uygulamalar açık kalır';

  @override
  String get appBlockingModeFirm => 'Orta';

  @override
  String get appBlockingModeFirmDesc =>
      'Uygulamayı engeller, hızlı bir atlatma seçeneğiyle';

  @override
  String get appBlockingModeHard => 'Sıkı';

  @override
  String get appBlockingModeHardDesc =>
      'Tam engelleme — yalnızca \"Namaz Kıldım\" açar';

  @override
  String get appBlockingSelectPrayersLabel => 'Şu namaz vakitlerinde engelle';

  @override
  String get appBlockingBufferBeforeLabel => 'Namazdan önce başla';

  @override
  String get appBlockingBufferAfterLabel => 'Namazdan sonra kaldır';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count dk';
  }

  @override
  String get appBlockingAppsTitle => 'Engellenen Uygulamalar';

  @override
  String get appBlockingSelectAppsButton => 'Engellenecek Uygulamaları Seç';

  @override
  String get appBlockingSearchHint => 'Yüklü uygulamalarda ara';

  @override
  String get appBlockingNoAppsSelected => 'Henüz uygulama seçilmedi';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uygulama engellendi',
      one: '1 uygulama engellendi',
      zero: 'Engellenen uygulama yok',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Test';

  @override
  String get appBlockingTestDescription =>
      'Bu cihazda çalıştığını doğrulamak için Uygulama Engellemeyi 2 dakikalığına etkinleştirin.';

  @override
  String get appBlockingTestButton => 'Uygulama Engellemeyi Test Et (2 dakika)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Uygulama Engelleme 2 dakika boyunca etkin — engellenen bir uygulamayı açmayı deneyin';

  @override
  String get appBlockingPermissionNeeded =>
      'Engellemeye başlamak için Erişilebilirlik iznini açın';

  @override
  String get appBlockingIosComingSoonTitle => 'Ekran Süresi Erişimi — yakında';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOS\'ta uygulama engelleme, Apple\'ın hâlâ ayarladığımız Ekran Süresi iznini gerektirir. Hazır olduğunda sana haber vereceğiz.';

  @override
  String get appBlockingHeadline1 => 'Namaz Vakti';

  @override
  String get appBlockingHeadline2 => 'Zamanını Koru';

  @override
  String get appBlockingDefaultTitle => 'Namaz Vakti';

  @override
  String get appBlockingIPrayedButton => 'Namaz Kıldım';

  @override
  String get appBlockingReadAyahsButton => '3 Ayet Oku';

  @override
  String get appBlockingEmergencyBypass => 'Acil Durum Atlatması';

  @override
  String get appBlockingSkipForNow => 'Şimdilik Atla';

  @override
  String get appBlockingBypassConfirmTitle => 'Serini sonlandırılsın mı?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Şimdi atlatmak namaz serini sıfırlar. Bu gerçek bir acil durumsa devam edebilirsin.';

  @override
  String get appBlockingBypassConfirmContinue => 'Yine de Atlat';

  @override
  String get appBlockingBypassConfirmCancel => 'Geri Dön';

  @override
  String get appBlockingSoftReminderTitle => 'Nazik bir hatırlatma';

  @override
  String get appBlockingSoftReminderBody =>
      'Namaz vakti geldi — biraz ara vermeyi düşün.';

  @override
  String get quranChallengeBannerTitle => 'Kilidi açmak için 3 Ayet Oku';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$total ayetten $count tanesi okundu';
  }

  @override
  String get quranChallengeComplete => 'Aferin — uygulamaların kilidi açıldı';

  @override
  String get focusBlockHeadline1 => 'Odaklanmaya Devam Et';

  @override
  String get focusBlockHeadline2 => 'Devam Et';

  @override
  String get endFocusSessionButton => 'Odaklanma Oturumunu Sonlandır';

  @override
  String get focusPaused => 'Namaz İçin Duraklatıldı';

  @override
  String get selectLocationTitle => 'Konum Seç';

  @override
  String get useCurrentLocation => 'Geçerli Konumu Kullan';

  @override
  String get savedLocationsHeader => 'Kayıtlı Konumlar';

  @override
  String get noSavedLocationsYet =>
      'Henüz kayıtlı konum yok. Eklemek için aşağıdan arayın.';

  @override
  String get searchCityHint => 'Şehir adı ara…';

  @override
  String get addLocationTooltip => 'Konum ekle';

  @override
  String get deleteLocationTooltip => 'Konumu sil';

  @override
  String get locationNotFound => 'Konum bulunamadı. Farklı bir arama deneyin.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'En fazla $max konum kaydedebilirsiniz';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Değişiklik onaylanamadı — lütfen tekrar deneyin';

  @override
  String get tasbihCounter => 'Tesbih Sayacı';

  @override
  String get tasbihCounterSubtitle => 'Zikrini say';

  @override
  String get tasbihResetButton => 'Sıfırla';

  @override
  String get tasbihTotalLabel => 'Toplam';

  @override
  String get tasbihCelebrationTitle => 'Tesbih Tamamlandı!';

  @override
  String get tasbihCelebrationBody =>
      '99 zikrin tümünü tamamladın. Allah zikrini kabul etsin.';

  @override
  String get tasbihStartNewSession => 'Yeni Oturum Başlat';

  @override
  String get tasbihUndoButton => 'Geri Al';

  @override
  String get tasbihTapAnywhereHint =>
      'Saymak için ekranın herhangi bir yerine dokunun';

  @override
  String get tasbihSoundToggleTooltip => 'Dokunma sesi';

  @override
  String get tasbihManageDhikrTooltip => 'Zikirleri yönet';

  @override
  String get tasbihStatsTooltip => 'İstatistikleri görüntüle';

  @override
  String get tasbihDailyTotalLabel => 'Bugünkü Toplam';

  @override
  String get tasbihRoundsTodayLabel => 'Bugünkü Turlar';

  @override
  String get tasbihManageDhikrTitle => 'Zikirleri Yönet';

  @override
  String get tasbihAddCustomDhikrButton => 'Özel Zikir Ekle';

  @override
  String get tasbihDeleteDhikrTooltip => 'Sil';

  @override
  String get tasbihBuiltInDhikrBadge => 'Yerleşik';

  @override
  String get tasbihCannotDeleteLastDhikr => 'En az bir zikre ihtiyacınız var';

  @override
  String get tasbihDhikrNameLabel => 'Ad';

  @override
  String get tasbihDhikrNameHint => 'örn. Astağfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Arapça (isteğe bağlı)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Lütfen bir ad girin';

  @override
  String get tasbihSaveDhikrButton => 'Kaydet';

  @override
  String get tasbihStatsTitle => 'Tesbih İstatistikleri';

  @override
  String get tasbihAllTimeTotalLabel => 'Tüm Zamanların Toplamı';

  @override
  String get tasbihNoActivityYetMessage =>
      'İstatistiklerinizi burada görmek için saymaya başlayın.';

  @override
  String get tasbihSoundPickerTitle => 'Dokunma Sesi';

  @override
  String get tasbihSoundClassicClick => 'Klasik Tıklama';

  @override
  String get tasbihSoundSoftChime => 'Yumuşak Çan Sesi';

  @override
  String get tasbihSoundStoneTap => 'Taş Vuruşu';

  @override
  String get tasbihCurrentlyReciting => 'Şu An Okunuyor';

  @override
  String tasbihOfTarget(int target) {
    return '$target üzerinden';
  }

  @override
  String get tasbihSoundRainDrop => 'Yağmur Damlası';

  @override
  String get tasbihSoundSoftFeather => 'Yumuşak Tüy';

  @override
  String noAyahsFound(String query) {
    return '\"$query\" için ayet bulunamadı';
  }

  @override
  String get trySearchingQuran =>
      'Türkçe, İngilizce veya Arapça arayın ya da İslamî bir terim kullanın:';

  @override
  String get loadingQuranIndex => 'Kuran dizini yükleniyor…';

  @override
  String get quranSearchSuggestions =>
      'sabır, sabr, merhamet, namaz, salah, af, tawbah, cennet, jannah, ilim';
}
