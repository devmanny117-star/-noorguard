// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Semoga Allah memberkahi harimu';

  @override
  String get nextPrayer => 'Sholat Berikutnya';

  @override
  String get iPrayedButton => 'Saya Sudah Shalat';

  @override
  String get todaysPrayers => 'Sholat Hari Ini';

  @override
  String get qibla => 'Kiblat';

  @override
  String get focusMode => 'Mode Fokus';

  @override
  String get appBlocking => 'Pemblokiran Aplikasi';

  @override
  String get islamicCalendar => 'Kalender Islam';

  @override
  String get duas => 'Doa';

  @override
  String get quran => 'Al-Qur\'an';

  @override
  String get settings => 'Pengaturan';

  @override
  String get complete => 'Selesai';

  @override
  String get streak => 'Rentetan';

  @override
  String get dayStreak => 'hari berturut-turut';

  @override
  String get compassRequiresDevice => 'Kompas memerlukan perangkat asli';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari',
      one: '$count hari',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Semua sholat telah selesai! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 sholat selesai';
  }

  @override
  String get fajr => 'Subuh';

  @override
  String get dhuhr => 'Dzuhur';

  @override
  String get asr => 'Ashar';

  @override
  String get maghrib => 'Maghrib';

  @override
  String get isha => 'Isya';

  @override
  String fardRakats(int count) {
    return '$count rakaat fardhu';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah sebelum';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah sesudah';
  }

  @override
  String prayedAt(String time) {
    return 'Dilaksanakan pada $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'fajar sebelum matahari terbit';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'setelah matahari melewati titik tertingginya';

  @override
  String get timePeriodLateAfternoon => 'menjelang sore';

  @override
  String get timePeriodJustAfterSunset => 'tepat setelah matahari terbenam';

  @override
  String get timePeriodNightBeforeMidnight =>
      'pada malam hari sebelum tengah malam';

  @override
  String get fajrHadith =>
      'Dua rakaat sholat Subuh lebih baik daripada dunia dan seisinya. — Nabi Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Subuh adalah sholat pertama hari ini. Sholat ini mengingatkan kita untuk memulai hari dengan mengingat Allah.';

  @override
  String get dhuhrHadith =>
      'Barangsiapa mengerjakan sholat sunnah dua belas rakaat, Allah akan membangunkan baginya sebuah rumah di surga.';

  @override
  String get dhuhrTip =>
      'Dzuhur adalah sholat tengah hari. Saat yang sempurna untuk berhenti sejenak dan kembali mengingat Allah.';

  @override
  String get asrHadith =>
      'Barangsiapa meninggalkan sholat Ashar, seolah-olah ia kehilangan keluarga dan hartanya. — Nabi Muhammad ﷺ';

  @override
  String get asrTip =>
      'Ashar sering disebut sebagai sholat pertengahan. Allah secara khusus menyebutkannya dalam Al-Qur\'an (2:238).';

  @override
  String get maghribHadith => 'Sholat Maghrib adalah Witirnya hari itu.';

  @override
  String get maghribTip =>
      'Maghrib menandai berakhirnya hari puasa di bulan Ramadan. Sholat ini dikerjakan tepat saat matahari terbenam.';

  @override
  String get ishaHadith =>
      'Barangsiapa sholat Isya berjamaah, seolah-olah ia telah sholat setengah malam.';

  @override
  String get ishaTip =>
      'Isya adalah sholat terakhir hari ini. Mengakhiri hari dengan sholat membawa ketenangan dan penutup yang sempurna.';

  @override
  String get newMuslimTip => 'Tips untuk Mualaf';

  @override
  String get notificationsOn => 'Notifikasi aktif';

  @override
  String get notificationsOff => 'Notifikasi nonaktif';

  @override
  String get preview => 'Pratinjau';

  @override
  String get lockPreviewCountdown => 'Dalam 1j 23m  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Geser ke atas untuk membuka kunci';

  @override
  String get searchSurahs => 'Cari surah…';

  @override
  String get noSurahsFound => 'Surah tidak ditemukan';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String ayahs(int count) {
    return '$count ayat';
  }

  @override
  String get searchDuas => 'Cari doa…';

  @override
  String supplications(int count) {
    return '$count doa';
  }

  @override
  String get prayerSettings => 'Pengaturan Sholat';

  @override
  String get calculationMethod => 'Metode Perhitungan';

  @override
  String get adhanSound => 'Suara Adzan';

  @override
  String get prayerNotifications => 'Notifikasi Sholat';

  @override
  String get appearance => 'Tampilan';

  @override
  String get darkMode => 'Mode Gelap';

  @override
  String get language => 'Bahasa';

  @override
  String get aboutNoorGuard => 'Tentang';

  @override
  String get version => 'Versi Aplikasi';

  @override
  String get rateApp => 'Beri Nilai Noor Guard';

  @override
  String get shareApp => 'Bagikan Noor Guard';

  @override
  String get contactSupport => 'Hubungi Dukungan';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get helpUsImprove => 'Bantu Kami Menjadi Lebih Baik';

  @override
  String get translationDisclaimer =>
      'Terjemahan kami dibantu oleh AI. Jika Anda menemukan kesalahan dalam bahasa Anda, kami sangat menghargai masukan Anda!';

  @override
  String get privacyPromiseTitle => 'Janji Privasi Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Imanmu adalah hal pribadi. Begitu pula datamu. Kami tidak pernah menjual, membagikan, atau memonetisasi datamu. Bukan lokasimu. Bukan kebiasaan ibadahmu. Bukan namamu.';

  @override
  String get directionToSacredHouse => 'Arah ke Rumah Suci';

  @override
  String towardMecca(String degrees) {
    return '$degrees° menuju Mekkah';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (default)';

  @override
  String get prayerHistory => 'Riwayat Sholat';

  @override
  String get currentStreak => 'Rentetan Saat Ini';

  @override
  String get longestStreak => 'Rentetan Terpanjang';

  @override
  String get legend => 'Keterangan';

  @override
  String get allFivePrayers => '5 sholat lengkap';

  @override
  String get partialPrayers => 'Sebagian (1–4)';

  @override
  String get none => 'Tidak ada';

  @override
  String get sun => 'Min';

  @override
  String get mon => 'Sen';

  @override
  String get tue => 'Sel';

  @override
  String get wed => 'Rab';

  @override
  String get thu => 'Kam';

  @override
  String get fri => 'Jum';

  @override
  String get sat => 'Sab';

  @override
  String headingDegrees(String degrees) {
    return 'Arah $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Tidak dapat memuat surah';

  @override
  String get connectionError => 'Periksa koneksi internet Anda dan coba lagi';

  @override
  String get alQuran => 'Al-Qur\'an';

  @override
  String get dailySupplications => 'Doa Harian';

  @override
  String get all => 'Semua';

  @override
  String get noDuasFound => 'Doa tidak ditemukan';

  @override
  String get january => 'Januari';

  @override
  String get february => 'Februari';

  @override
  String get march => 'Maret';

  @override
  String get april => 'April';

  @override
  String get may => 'Mei';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'Agustus';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Desember';

  @override
  String get home => 'Beranda';

  @override
  String get prayers => 'Sholat';

  @override
  String get more => 'Lainnya';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Layar Kunci';

  @override
  String get readAndListen => 'Baca & dengarkan';

  @override
  String get commentary => 'Tafsir';

  @override
  String get findDirection => 'Cari arah';

  @override
  String get reminders => 'Pengingat';

  @override
  String get blockDistractions => 'Blokir gangguan';

  @override
  String get prayerGuard => 'Penjaga sholat';

  @override
  String get importantDates => 'Tanggal penting';

  @override
  String get comingSoon => 'Segera hadir';

  @override
  String get morningAndEvening => 'Pagi & Petang';

  @override
  String get prayer => 'Sholat';

  @override
  String get foodAndDrink => 'Makanan & Minuman';

  @override
  String get verityWithHardship =>
      'Sesungguhnya, bersama kesulitan ada kemudahan.';

  @override
  String get ashSharh946 => 'Asy-Syarh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Peliharalah segala sholat(mu), dan (peliharalah) sholat wusthaa.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Peristiwa Lalu';

  @override
  String get upcomingEvents => 'Peristiwa Mendatang';

  @override
  String get today => 'Hari Ini';

  @override
  String get next => 'Berikutnya';

  @override
  String hijriYearLabel(int year) {
    return '$year H';
  }

  @override
  String get islamicMonthMuharram => 'Muharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabī\'ul Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabī\'ul Akhir';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumadil Awal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumadil Akhir';

  @override
  String get islamicMonthRajab => 'Rajab';

  @override
  String get islamicMonthShaban => 'Syaban';

  @override
  String get islamicMonthRamadan => 'Ramadan';

  @override
  String get islamicMonthShawwal => 'Syawal';

  @override
  String get islamicMonthDhulQadah => 'Dzulkaidah';

  @override
  String get islamicMonthDhulHijjah => 'Dzulhijjah';

  @override
  String get islamicNewYear => 'Tahun Baru Islam';

  @override
  String get ashura => 'Asyura';

  @override
  String get mawlidAlNabi => 'Maulid Nabi';

  @override
  String get ramadanBegins => 'Awal Ramadan';

  @override
  String get laylatAlQadr => 'Lailatul Qadar';

  @override
  String get eidAlFitr => 'Idul Fitri';

  @override
  String get dayOfArafah => 'Hari Arafah';

  @override
  String get eidAlAdha => 'Idul Adha';

  @override
  String get active => 'Aktif';

  @override
  String get focusModeSubtitle =>
      'Lindungi konsentrasimu. Aplikasimu akan terkunci sampai kamu menghentikan sesi ini.';

  @override
  String get remaining => 'tersisa';

  @override
  String get ready => 'siap';

  @override
  String get duration => 'Durasi';

  @override
  String get minutesAbbreviation => 'mnt';

  @override
  String get blockedDuringFocus => 'Diblokir Selama Fokus';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi',
      one: '$count aplikasi',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Mulai Fokus';

  @override
  String get stopFocus => 'Hentikan Fokus';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Sesi Selesai';

  @override
  String stayedFocusedFor(String duration) {
    return 'Kamu tetap fokus selama $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit',
      one: '$count menit',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"Dan mohonlah pertolongan (kepada Allah) dengan sabar dan sholat.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Selesai';

  @override
  String get socialMedia => 'Media Sosial';

  @override
  String get entertainment => 'Hiburan';

  @override
  String get games => 'Permainan';

  @override
  String get messaging => 'Pesan';

  @override
  String get blockDuringPrayerTimes => 'Blokir saat waktu sholat';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Aplikasi yang dipilih akan diblokir secara otomatis\nselama 5 waktu sholat setiap hari.';

  @override
  String get blockedLabel => 'diblokir';

  @override
  String get blockAllApps => 'Blokir semua aplikasi';

  @override
  String get blockingTimingInfo =>
      'Pemblokiran aktif 5 menit sebelum setiap sholat dan berakhir 15 menit setelahnya.';

  @override
  String get blockedDuringPrayers => 'Diblokir saat sholat';

  @override
  String get notBlocked => 'Tidak diblokir';

  @override
  String get wuduStep1 => 'Niat';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Cuci Tangan';

  @override
  String get wuduStep4 => 'Berkumur';

  @override
  String get wuduStep5 => 'Bersihkan Hidung';

  @override
  String get wuduStep6 => 'Basuh Wajah';

  @override
  String get wuduStep7 => 'Basuh Lengan';

  @override
  String get wuduStep8 => 'Usap Kepala';

  @override
  String get wuduStep9 => 'Basuh Kaki';

  @override
  String get revertCorner => 'Sudut Mualaf';

  @override
  String get revertCornerSubtitle => 'Panduan dan dukungan untuk mualaf';

  @override
  String get wuduGuide => 'Panduan Wudhu';

  @override
  String get howToPray => 'Cara Sholat';

  @override
  String get newMuslimChecklist => 'Daftar Periksa Mualaf';

  @override
  String get islamicGlossary => 'Glosarium Islam';

  @override
  String get whyDoWe => 'Mengapa Kita...';

  @override
  String get communityStories => 'Kisah Komunitas';

  @override
  String get wuduGuideSubtitle => 'Penyucian sebelum sholat';

  @override
  String get howToPraySubtitle => 'Panduan sholat langkah demi langkah';

  @override
  String get newMuslimChecklistSubtitle => 'Perjalanan 30 harimu';

  @override
  String get howToPrayStep1Name => 'Wudhu Terlebih Dahulu';

  @override
  String get howToPrayStep1Instruction =>
      'Lakukan wudhu (bersuci) agar kamu dalam keadaan suci sebelum memulai sholat.';

  @override
  String get howToPrayStep1Tip =>
      'Jika kamu belum yakin caranya, buka dulu Panduan Wudhu dari Pusat Mualaf.';

  @override
  String get howToPrayStep2Name => 'Berdiri Menghadap Kiblat';

  @override
  String get howToPrayStep2Instruction =>
      'Berdirilah di atas sajadahmu menghadap Kiblat — arah Ka\'bah di Mekkah. Gunakan kompas Kiblat di aplikasi untuk menemukan arah yang tepat.';

  @override
  String get howToPrayStep2Tip =>
      'Tidak apa-apa jika arahnya sedikit meleset — Allah mengetahui niatmu. Lakukan yang terbaik.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Niat)';

  @override
  String get howToPrayStep3Instruction =>
      'Niatkan dalam hatimu untuk sholat yang akan kamu kerjakan. Kamu tidak perlu mengucapkannya dengan keras.';

  @override
  String get howToPrayStep3Tip =>
      'Niatmu adalah urusan antara kamu dan Allah. Pikiran sederhana seperti \'Aku sholat Subuh karena Allah\' sudah cukup.';

  @override
  String get howToPrayStep4Name => 'Takbir (Pembuka)';

  @override
  String get howToPrayStep4Instruction =>
      'Angkat kedua tanganmu sejajar daun telinga dan ucapkan \'Allahu Akbar\' (Allah Maha Besar). Ini secara resmi memulai sholatmu.';

  @override
  String get howToPrayStep4Tip =>
      'Jagalah pandanganmu tetap ke bawah, ke tempat sujud, sepanjang sholat.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Berdiri)';

  @override
  String get howToPrayStep5Instruction =>
      'Letakkan tangan kananmu di atas tangan kirimu di dadamu. Bacalah Surah Al-Fatihah dilanjutkan dengan surah pendek atau ayat lain yang kamu hafal.';

  @override
  String get howToPrayStep5Tip =>
      'Jika kamu belum hafal surah lain, membaca Al-Fatihah saja sudah cukup selama kamu masih belajar.';

  @override
  String get howToPrayStep6Name => 'Ruku (Membungkuk)';

  @override
  String get howToPrayStep6Instruction =>
      'Bungkukkan badanmu dengan punggung sejajar lantai. Letakkan tanganmu di lutut dan ucapkan \'Subhana Rabbiyal Adziim\' tiga kali.';

  @override
  String get howToPrayStep6Tip =>
      'Jaga punggungmu tetap lurus dan datar — jangan melengkung atau membulat.';

  @override
  String get howToPrayStep7Name => 'I\'tidal (Bangkit dari Ruku)';

  @override
  String get howToPrayStep7Instruction =>
      'Bangkitlah dari ruku dan berdiri tegak. Ucapkan \'Sami\'allahu liman hamidah\' (Allah mendengar orang yang memuji-Nya) saat bangkit, lalu ucapkan \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Berdirilah tegak sepenuhnya dan diam sejenak sebelum berpindah ke posisi berikutnya.';

  @override
  String get howToPrayStep8Name => 'Sujud';

  @override
  String get howToPrayStep8Instruction =>
      'Turunlah ke lantai dengan meletakkan dahi, hidung, kedua telapak tangan, lutut, dan jari-jari kaki di lantai. Ucapkan \'Subhana Rabbiyal A\'la\' tiga kali.';

  @override
  String get howToPrayStep8Tip =>
      'Tujuh anggota tubuh harus menyentuh lantai: dahi (beserta hidung), dua tangan, dua lutut, dan dua kaki.';

  @override
  String get howToPrayStep9Name => 'Duduk di Antara Dua Sujud';

  @override
  String get howToPrayStep9Instruction =>
      'Bangkit dari sujud dan duduk dengan kaki kiri rata di lantai dan kaki kanan tegak. Ucapkan \'Allahu Akbar\' saat duduk. Diam sejenak, lalu turun lagi untuk sujud kedua.';

  @override
  String get howToPrayStep9Tip =>
      'Duduk sejenak di antara dua sujud ini disebut duduk iftirasy. Ini adalah bagian wajib dari sholat.';

  @override
  String get howToPrayStep10Name => 'Lengkapi Rakaat';

  @override
  String get howToPrayStep10Instruction =>
      'Setelah menyelesaikan rakaat pertama, berdirilah dan ulangi langkah-langkah yang sama untuk rakaat kedua. Jumlah rakaat tergantung sholat apa yang kamu kerjakan.';

  @override
  String get howToPrayStep10Tip =>
      'Subuh memiliki 2 rakaat, Dzuhur 4, Ashar 4, Maghrib 3, dan Isya 4. Lakukan satu rakaat demi satu rakaat.';

  @override
  String get howToPrayStep11Name => 'Tasyahud (Duduk Akhir)';

  @override
  String get howToPrayStep11Instruction =>
      'Pada posisi duduk akhir, bacalah Tasyahud. Ini adalah pernyataan keimanan yang dibaca sambil duduk setelah rakaat terakhirmu.';

  @override
  String get howToPrayStep11Tip =>
      'Saat membaca Tasyahud, angkat jari telunjuk kananmu ketika mengucapkan \'Asyhadu alla ilaha illallah\' sebagai tanda keesaan Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Penutup)';

  @override
  String get howToPrayStep12Instruction =>
      'Palingkan kepalamu ke kanan dan ucapkan \'Assalamu Alaikum wa Rahmatullah\', lalu palingkan ke kiri dan ulangi. Ini mengakhiri sholatmu.';

  @override
  String get howToPrayStep12Tip =>
      'Setelah sholat, luangkan waktu untuk berdoa dan memohon kepada Allah apa yang kamu butuhkan. Ini adalah momen indah untuk terhubung dengan Allah.';

  @override
  String get checklistWeek1Title => 'Minggu 1';

  @override
  String get checklistWeek2Title => 'Minggu 2';

  @override
  String get checklistWeek3Title => 'Minggu 3';

  @override
  String get checklistWeek4Title => 'Minggu 4';

  @override
  String get checklistWeek1Item1 => 'Mengucapkan Syahadat';

  @override
  String get checklistWeek1Item2 => 'Belajar Wudhu';

  @override
  String get checklistWeek1Item3 => 'Belajar Al-Fatihah';

  @override
  String get checklistWeek1Item4 => 'Sholat Subuh pertamamu';

  @override
  String get checklistWeek1Item5 => 'Dapatkan sajadah';

  @override
  String get checklistWeek1Item6 => 'Temukan masjid terdekat';

  @override
  String get checklistWeek2Item1 => 'Pelajari 5 waktu sholat';

  @override
  String get checklistWeek2Item2 => 'Pelajari doa-doa dasar';

  @override
  String get checklistWeek2Item3 => 'Baca tentang Nabi Muhammad';

  @override
  String get checklistWeek2Item4 => 'Berkenalan dengan komunitas Muslim';

  @override
  String get checklistWeek3Item1 => 'Pelajari tentang makanan halal';

  @override
  String get checklistWeek3Item2 => 'Baca Surah Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Pelajari tentang Ramadan';

  @override
  String get checklistWeek3Item4 => 'Mulai dzikir harian';

  @override
  String get checklistWeek4Item1 => 'Pelajari tentang Zakat';

  @override
  String get checklistWeek4Item2 => 'Baca tentang 5 rukun Islam';

  @override
  String get checklistWeek4Item3 => 'Atur notifikasi sholat';

  @override
  String get checklistWeek4Item4 => 'Renungkan perjalananmu';

  @override
  String get wuduStep1Instruction =>
      'Niatkan dalam hatimu untuk berwudhu karena Allah.';

  @override
  String get wuduStep1Tip =>
      'Kamu tidak perlu mengucapkannya dengan keras — niat yang tulus dalam hati sudah cukup.';

  @override
  String get wuduStep2Instruction =>
      'Ucapkan Bismillah (Dengan menyebut nama Allah) sebelum memulai.';

  @override
  String get wuduStep2Tip =>
      'Mengucapkan Bismillah adalah sunnah dan memulai wudhumu dengan mengingat Allah.';

  @override
  String get wuduStep3Instruction =>
      'Basuh kedua tangan hingga pergelangan tangan tiga kali, pastikan air membasahi sela-sela jari.';

  @override
  String get wuduStep3Tip =>
      'Mulailah dengan tangan kanan, lalu tangan kiri. Urutan ini dianjurkan dalam Islam.';

  @override
  String get wuduStep4Instruction =>
      'Ambil air ke dalam mulut, kumur-kumur, lalu keluarkan. Lakukan ini tiga kali.';

  @override
  String get wuduStep4Tip =>
      'Ini membersihkan mulut dan merupakan bagian dari proses penyucian.';

  @override
  String get wuduStep5Instruction =>
      'Hirup air ke dalam hidung dan hembuskan dengan lembut. Lakukan ini tiga kali.';

  @override
  String get wuduStep5Tip =>
      'Gunakan tangan kananmu untuk menghirup air dan tangan kirimu untuk mengeluarkannya.';

  @override
  String get wuduStep6Instruction =>
      'Basuh seluruh wajahmu tiga kali, dari batas tumbuhnya rambut hingga dagu dan dari telinga ke telinga.';

  @override
  String get wuduStep6Tip =>
      'Pastikan tidak ada bagian wajahmu yang masih kering.';

  @override
  String get wuduStep7Instruction =>
      'Basuh lengan kananmu dari ujung jari hingga siku tiga kali, lalu lakukan hal yang sama pada lengan kiri.';

  @override
  String get wuduStep7Tip =>
      'Selalu mulai dari sisi kanan sebelum sisi kiri dalam wudhu.';

  @override
  String get wuduStep8Instruction =>
      'Basahi tanganmu dan usap seluruh kepalamu satu kali, dari depan ke belakang lalu kembali ke depan.';

  @override
  String get wuduStep8Tip =>
      'Berbeda dengan membasuh, mengusap kepala hanya dilakukan satu kali.';

  @override
  String get wuduStep9Instruction =>
      'Basuh kaki kananmu hingga termasuk mata kaki tiga kali, lalu lakukan hal yang sama pada kaki kiri.';

  @override
  String get wuduStep9Tip =>
      'Pastikan air membasahi sela-sela jari kaki. Gunakan jarimu untuk membersihkan di antaranya.';

  @override
  String get islamicGlossaryTitle => 'Glosarium Islam';

  @override
  String get islamicGlossarySubtitle =>
      '51 istilah dari Al-Qur\'an, Sunnah, dan keilmuan klasik';

  @override
  String get searchTermsHint => 'Cari istilah, bahasa Arab, definisi...';

  @override
  String get categoryAll => 'Semua';

  @override
  String get categoryPillar => 'Rukun';

  @override
  String get categoryAqeedah => 'Akidah';

  @override
  String get categoryPractice => 'Amalan';

  @override
  String get categoryDhikr => 'Dzikir';

  @override
  String get categoryQuran => 'Al-Qur\'an';

  @override
  String get categoryHadith => 'Hadis';

  @override
  String get categoryFiqh => 'Fikih';

  @override
  String get categoryHistory => 'Sejarah';

  @override
  String get noTermsFound => 'Istilah tidak ditemukan';

  @override
  String get sourceLabel => 'Sumber';

  @override
  String get revertCornerHubSubtitle =>
      'Pusat ramah untuk membimbing langkah pertamamu sebagai mualaf';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Istilah umum dijelaskan dengan sederhana';

  @override
  String get whyDoWeHubSubtitle => 'Hikmah di balik amalan sehari-hari';

  @override
  String get communityStoriesHubSubtitle =>
      'Para mualaf berbagi kisah perjalanan mereka menuju Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'Hikmah di balik 12 amalan Islam sehari-hari';

  @override
  String get whyDoWeSourceBadge => 'Sumber Sunni';

  @override
  String get whyDoWeQ1 => 'Mengapa kita sholat 5 kali sehari?';

  @override
  String get whyDoWeA1 =>
      'Allah memerintahkan lima sholat wajib dalam Al-Qur\'an (2:238) dan ditetapkan saat peristiwa Isra Mi\'raj. Nabi ﷺ bersabda: \"Hal pertama yang akan dihisab dari seorang hamba pada Hari Kiamat adalah sholatnya.\" (Ibnu Majah). Sholat menjaga kita tetap terhubung dengan Allah sepanjang hari.';

  @override
  String get whyDoWeQ2 => 'Mengapa kita menghadap Mekkah saat sholat?';

  @override
  String get whyDoWeA2 =>
      'Allah memerintahkan dalam Al-Qur\'an (2:144): \"Palingkanlah wajahmu ke arah Masjidil Haram.\" Ka\'bah di Mekkah adalah rumah pertama yang dibangun untuk beribadah kepada Allah (3:96). Menghadap arah yang sama menyatukan seluruh umat Muslim dalam sholat di seluruh dunia.';

  @override
  String get whyDoWeQ3 => 'Mengapa kita berpuasa di bulan Ramadan?';

  @override
  String get whyDoWeA3 =>
      'Allah memerintahkan puasa dalam Al-Qur\'an (2:183): \"Wahai orang-orang yang beriman, diwajibkan atas kalian berpuasa sebagaimana diwajibkan atas orang-orang sebelum kalian, agar kalian bertakwa.\" Ramadan adalah bulan diturunkannya Al-Qur\'an (2:185).';

  @override
  String get whyDoWeQ4 => 'Mengapa kita mengucapkan Bismillah sebelum makan?';

  @override
  String get whyDoWeA4 =>
      'Nabi ﷺ bersabda: \"Apabila salah seorang di antara kalian makan, hendaklah ia menyebut nama Allah. Jika ia lupa di awal, hendaklah ia mengucapkan Bismillah di awal hingga akhir makan.\" (Abu Dawud). Ini mengingatkan kita bahwa segala nikmat berasal dari Allah.';

  @override
  String get whyDoWeQ5 =>
      'Mengapa kita melepas alas kaki sebelum masuk masjid?';

  @override
  String get whyDoWeA5 =>
      'Ketika Allah memerintahkan Nabi Musa: \"Lepaskanlah kedua sandalmu, sesungguhnya kamu berada di lembah suci Tuwa.\" (Al-Qur\'an 20:12). Melepas alas kaki menunjukkan rasa hormat terhadap rumah Allah dan menjaga kebersihan tempat sholat.';

  @override
  String get whyDoWeQ6 =>
      'Mengapa kita mengucapkan Assalamu Alaikum sebagai salam?';

  @override
  String get whyDoWeA6 =>
      'Nabi ﷺ bersabda: \"Kalian tidak akan masuk surga sampai kalian beriman, dan kalian tidak beriman sampai kalian saling mencintai. Maukah kutunjukkan sesuatu yang jika kalian lakukan akan menumbuhkan rasa cinta di antara kalian? Sebarkanlah salam di antara kalian.\" (Muslim). Ini juga merupakan doa — kamu mendoakan kedamaian untuk orang tersebut.';

  @override
  String get whyDoWeQ7 => 'Mengapa kita melaksanakan Haji?';

  @override
  String get whyDoWeA7 =>
      'Haji diperintahkan oleh Allah (3:97): \"Mengerjakan haji ke Baitullah adalah kewajiban manusia terhadap Allah, bagi yang mampu mengadakan perjalanan ke sana.\" Haji memperingati ujian yang dihadapi Nabi Ibrahim dan keluarganya, serta menyatukan umat Muslim dari segala bangsa dalam ibadah.';

  @override
  String get whyDoWeQ8 => 'Mengapa kita membayar Zakat?';

  @override
  String get whyDoWeA8 =>
      'Zakat adalah rukun Islam ketiga, diperintahkan dalam Al-Qur\'an lebih dari 30 kali bersama dengan sholat. Nabi ﷺ bersabda bahwa zakat menyucikan harta. Zakat mengurangi kesenjangan dan mengingatkan orang beriman bahwa harta adalah milik Allah.';

  @override
  String get whyDoWeQ9 =>
      'Mengapa kita mengucapkan Alhamdulillah setelah bersin?';

  @override
  String get whyDoWeA9 =>
      'Nabi ﷺ bersabda: \"Apabila salah seorang di antara kalian bersin, hendaklah ia mengucapkan Alhamdulillah, dan saudaranya hendaklah mengucapkan Yarhamukallah.\" (Bukhari). Ini adalah momen rasa syukur kepada Allah atas nikmat kesehatan.';

  @override
  String get whyDoWeQ10 => 'Mengapa wanita Muslim mengenakan hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah memerintahkan dalam Al-Qur\'an (24:31) agar wanita beriman menjaga auratnya. Hijab adalah bentuk ibadah dan ketaatan kepada Allah. Banyak wanita Muslim mengenakannya sebagai sumber identitas, kehormatan, dan keterhubungan spiritual.';

  @override
  String get whyDoWeQ11 => 'Mengapa kita menghindari babi dan alkohol?';

  @override
  String get whyDoWeA11 =>
      'Allah mengharamkan babi dalam Al-Qur\'an (2:173) dan alkohol dalam (5:90), menyebutnya sebagai \"perbuatan keji termasuk perbuatan setan.\" Larangan ini melindungi kesehatan, akal, dan keluarga. Pedoman halal membantu menjaga kesucian fisik dan spiritual.';

  @override
  String get whyDoWeQ12 => 'Mengapa kita mengucapkan Insyaallah?';

  @override
  String get whyDoWeA12 =>
      'Allah berfirman dalam Al-Qur\'an (18:23-24): \"Dan jangan sekali-kali kamu mengatakan tentang sesuatu, \'Aku pasti melakukan itu besok pagi,\' kecuali (dengan mengatakan), \'Insyaallah\'.\" Mengucapkan Insyaallah menyadarkan kita bahwa hanya Allah yang mengendalikan masa depan dan menjaga kita tetap rendah hati.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Kisah nyata perjalanan menuju Islam dari seluruh dunia';

  @override
  String get communityStoriesTimeLabel => 'Lama menjadi Muslim';

  @override
  String get communityStoriesShareBtn => 'Bagikan Kisahmu';

  @override
  String get communityStoriesShareSoon =>
      'Segera hadir — fitur ini sedang dalam pengembangan!';

  @override
  String get communityStory1Name => 'Aisha (dahulu Sarah)';

  @override
  String get communityStory1Location => 'Texas, AS';

  @override
  String get communityStory1Time => '2 tahun';

  @override
  String get communityStory1Text =>
      'Saya mengenal Islam saat mengerjakan riset untuk tugas kuliah. Saya menyangka akan menemukan apa yang dikatakan media. Namun yang saya temukan justru kedamaian, logika, dan Tuhan yang benar-benar masuk akal. Saya mengucapkan syahadat 6 bulan kemudian. Bagian tersulit bukanlah belajar sholat — tetapi memberi tahu keluarga saya. Tapi Alhamdulillah, dua tahun kemudian, ibu saya sendiri mulai bertanya tentang Islam.';

  @override
  String get communityStory2Name => 'Yusuf (dahulu James)';

  @override
  String get communityStory2Location => 'London, Inggris';

  @override
  String get communityStory2Time => '4 tahun';

  @override
  String get communityStory2Text =>
      'Saya menjadi mualaf setelah bertahun-tahun mencari. Kristen, Buddha, ateisme — tidak ada yang mengisi kekosongan dalam diri saya. Seorang rekan kerja Muslim mengajak saya ke sholat Jumat. Saya duduk di belakang dan menangis sepanjang waktu itu. Saya bahkan tidak tahu mengapa. Saya mengucapkan syahadat seminggu kemudian. Komunitas itu merangkul saya seperti keluarga yang tidak pernah saya sadari saya butuhkan.';

  @override
  String get communityStory3Name => 'Maryam (dahulu Maria)';

  @override
  String get communityStory3Location => 'Mexico City, Meksiko';

  @override
  String get communityStory3Time => '1 tahun';

  @override
  String get communityStory3Text =>
      'Menjadi seorang Latin dan Muslim terasa seperti anugerah luar biasa. Saya menemukan Islam lewat video YouTube pukul 2 pagi. Saya menontonnya berjam-jam. Konsep tauhid — bahwa Tuhan itu Esa, tidak memiliki sekutu, tidak berwujud — begitu menyentuh hati saya. Saudari-saudari berbahasa Spanyol di masjid membuat saya langsung merasa seperti di rumah sendiri.';

  @override
  String get communityStory4Name => 'Ibrahim (dahulu David)';

  @override
  String get communityStory4Location => 'Toronto, Kanada';

  @override
  String get communityStory4Time => '6 tahun';

  @override
  String get communityStory4Text =>
      'Saya adalah anak seorang pendeta. Saya memiliki banyak pertanyaan tentang Trinitas yang tak seorang pun mampu menjawabnya. Ketika pertama kali membaca Al-Qur\'an, saya merasa seperti sedang membaca sesuatu yang sudah saya yakini sebelumnya. Saya mengucapkan syahadat sendirian dengan tenang, lalu mengucapkannya lagi di masjid. Keputusan terbaik dalam hidup saya.';

  @override
  String get communityStory5Name => 'Fatima (dahulu Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Australia';

  @override
  String get communityStory5Time => '3 tahun';

  @override
  String get communityStory5Text =>
      'Perjalanan saya dimulai dengan hijab. Saya mengenakannya karena tantangan dan merasa... terlindungi. Saya mulai membaca tentang Islam dan tidak bisa berhenti. Dalam tiga bulan saya sudah mengucapkan syahadat. Orang-orang bertanya apa yang saya tinggalkan. Saya bilang pada mereka bahwa saya meninggalkan kekosongan.';

  @override
  String get communityStory6Name => 'Omar (dahulu Kevin)';

  @override
  String get communityStory6Location => 'Johannesburg, Afrika Selatan';

  @override
  String get communityStory6Time => '5 tahun';

  @override
  String get communityStory6Text =>
      'Saya tumbuh di lingkungan yang keras. Islam memberi saya kedisiplinan, tujuan hidup, dan persaudaraan. Saat pertama kali saya bersujud, ada sesuatu dalam diri saya yang terbuka — dengan cara terbaik. Saya menangis dan tidak bisa menjelaskan mengapa. Sekarang saya membimbing pemuda-pemuda lain yang sedang mencari jalan menuju agama ini.';

  @override
  String get inspiredByRealStories =>
      'Terinspirasi dari kisah nyata para mualaf';

  @override
  String get storyFormTitle => 'Bagikan Kisahmu';

  @override
  String get storyFormNameLabel => 'Namamu';

  @override
  String get storyFormNameHint => 'Nama, atau tulis \'Anonim\'';

  @override
  String get storyFormCountryLabel => 'Negara';

  @override
  String get storyFormCountryHint => 'Kamu berasal dari mana?';

  @override
  String get storyFormTimeLabel => 'Lama menjadi Muslim';

  @override
  String get storyFormTimeHint => 'mis. 2 tahun, 6 bulan';

  @override
  String get storyFormStoryLabel => 'Kisahmu';

  @override
  String get storyFormStoryHint => 'Bagikan perjalananmu menuju Islam...';

  @override
  String get storyFormSubmitBtn => 'Kirim Kisah';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Kisahmu telah kami terima. Kami meninjau semua kisah sebelum dipublikasikan.';

  @override
  String get storyFormRequiredError => 'Mohon lengkapi semua kolom';

  @override
  String get subtitleYourGuideToIslam => 'Panduanmu menuju Islam';

  @override
  String get beginnerMode => 'Mode Pemula';

  @override
  String get beginnerModeSubtitle => 'Tips dan panduan tambahan untuk mualaf';

  @override
  String get beginnerModeOn =>
      'Mode Pemula aktif — tips tambahan akan ditampilkan di seluruh aplikasi';

  @override
  String get beginnerModePrayersTip =>
      'Tips: Ketuk setiap sholat untuk mempelajari lebih lanjut dan melihat sholat sunnahnya';

  @override
  String get tafsirSubtitle => 'Tafsir Al-Qur\'an';

  @override
  String get tafsirComingSoon => 'Tafsir untuk surah ini akan segera hadir';

  @override
  String get tafsirNotAvailable => 'Tafsir tidak tersedia';

  @override
  String get scholarSource => 'Sumber';

  @override
  String get asbabAlNuzul => 'Asbabun Nuzul';

  @override
  String get transliteration => 'Transliterasi';

  @override
  String get selectReciter => 'Pilih Qari';

  @override
  String get playVerse => 'Putar ayat';

  @override
  String get asmaUlHusna => 'Asmaul Husna';

  @override
  String get asmaUlHusnaSubtitle => '99 Nama Indah Allah';

  @override
  String get asmaHadith =>
      'Allah memiliki 99 nama. Barangsiapa menghafalnya akan masuk surga.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Cari nama...';

  @override
  String get asmaNoResults => 'Nama tidak ditemukan';

  @override
  String get asmaSignificance => 'Makna';

  @override
  String get asmaUlHusnaTile => '99 Nama';

  @override
  String get asmaUlHusnaTileSubtitle => 'Nama-nama Allah';

  @override
  String get onboardingTagline => 'Jaga waktumu. Hormati sholatmu.';

  @override
  String get onboardingChooseLanguage => 'Pilih bahasamu';

  @override
  String get onboardingGetStarted => 'Mulai';

  @override
  String get onboardingLocationTitle => 'Waktu Sholat Akurat';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard memerlukan lokasimu untuk menghitung waktu sholat yang akurat untuk kotamu. Lokasimu tidak akan pernah disimpan atau dibagikan.';

  @override
  String get onboardingPrivacyBanner =>
      'Imanmu adalah hal pribadi. Begitu pula datamu.';

  @override
  String get onboardingAllowLocation => 'Izinkan Lokasi';

  @override
  String get onboardingSkipForNow => 'Lewati untuk sekarang';

  @override
  String get onboardingNotificationTitle => 'Jangan Lewatkan Sholat';

  @override
  String get onboardingNotificationDesc =>
      'Dapatkan notifikasi di setiap waktu sholat dengan adzan yang merdu. Sesuaikan suara dan waktunya di pengaturan.';

  @override
  String get onboardingAdhanAlerts => 'Notifikasi adzan';

  @override
  String get onboardingCustomTiming => 'Waktu khusus';

  @override
  String get onboardingAdjustable => 'Dapat disesuaikan';

  @override
  String get onboardingEnableNotifications => 'Aktifkan Notifikasi';

  @override
  String get onboardingMaybeLater => 'Mungkin nanti';

  @override
  String get onboardingAllSetTitle => 'Semua Siap!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard siap menjaga waktumu\ndan membimbing harimu dengan niat yang tulus.';

  @override
  String get onboardingPrayerTimesLabel => 'Waktu Sholat';

  @override
  String get onboardingPrayerTimesDesc => 'Waktu akurat untuk kotamu';

  @override
  String get onboardingLockScreenLabel => 'Layar Kunci Islami';

  @override
  String get onboardingLockScreenDesc =>
      'Al-Qur\'an dan doa di setiap kali membuka kunci';

  @override
  String get onboardingPrayerGuardLabel => 'Penjaga Sholat';

  @override
  String get onboardingPrayerGuardDesc =>
      'Aplikasi diblokir otomatis selama waktu sholat';

  @override
  String get onboardingEnterApp => 'Masuk ke Noor Guard';

  @override
  String get adhan => 'Adzan';

  @override
  String get adhanSubtitle => 'Panggilan untuk Sholat';

  @override
  String get adhanDescription =>
      'Adzan adalah panggilan Islam untuk sholat, dikumandangkan lima kali sehari untuk mengundang umat beriman beribadah.';

  @override
  String get makkahStyle => 'Makkah';

  @override
  String get madinahStyle => 'Madinah';

  @override
  String get egyptianStyle => 'Mesir';

  @override
  String get adhanPlaying => 'Sedang Diputar';

  @override
  String get makkahDescription =>
      'Panggilan sholat tradisional dari Masjidil Haram di Makkah.';

  @override
  String get madinahDescription =>
      'Lantunan yang tenang dengan gaya Masjid Nabawi di Madinah.';

  @override
  String get egyptianDescription =>
      'Adzan bergaya Mesir yang merdu, dikenal dengan lantunannya yang kaya.';

  @override
  String get adhanCallToWorship => 'Panggilan untuk Sholat';

  @override
  String get adhanDescriptionFull =>
      'Adzan adalah panggilan Islam untuk sholat, dikumandangkan lima kali sehari untuk mengundang umat beriman beribadah.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turki';

  @override
  String get pakistaniStyle => 'Pakistan';

  @override
  String get indonesianStyle => 'Indonesia';

  @override
  String get alafasyDescription =>
      'Lantunan yang menyentuh hati dari qari terkenal Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'Panggilan sholat yang bergema dari Masjid Al-Aqsa di Yerusalem, tempat tersuci ketiga dalam Islam.';

  @override
  String get turkishDescription =>
      'Adzan tradisional bergaya Turki dengan maqam melodi khasnya.';

  @override
  String get pakistaniDescription =>
      'Adzan yang menyentuh hati dalam tradisi Asia Selatan, dikumandangkan di seluruh Pakistan.';

  @override
  String get indonesianDescription =>
      'Adzan merdu bergaya Indonesia, dicintai di seluruh nusantara.';

  @override
  String get thisWeek => 'Minggu Ini';

  @override
  String weeklyProgress(int count) {
    return '$count dari 35 sholat minggu ini';
  }

  @override
  String get bestDay => 'Hari terbaik';

  @override
  String get prayerStats => 'Statistik Sholat';

  @override
  String get completionRate => 'Tingkat Penyelesaian';

  @override
  String get bestPrayer => 'Sholat Paling Konsisten';

  @override
  String get hardestPrayer => 'Sholat Paling Sering Terlewat';

  @override
  String totalPrayersCompleted(int count) {
    return '$count sholat selesai';
  }

  @override
  String get last7Days => '7 Hari Terakhir';

  @override
  String get thisMonth => 'Bulan Ini';

  @override
  String get fullDays => 'Hari lengkap';

  @override
  String get partialDays => 'Hari sebagian';

  @override
  String get missedDays => 'Hari terlewat';

  @override
  String get missedPrayerBadge => 'Terlewat';

  @override
  String get makeItUp => 'Qada';

  @override
  String get qadaExplanation =>
      'Jika Anda melewatkan sholat, Anda masih bisa mengerjakannya sebagai sholat Qada (pengganti).';

  @override
  String get noStatsYet =>
      'Terus tandai sholat Anda untuk melihat statistik Anda di sini.';

  @override
  String get notEnoughData => 'Belum cukup data';

  @override
  String get continuousPlay => 'Putar Terus';

  @override
  String get sleepTimer => 'Timer Tidur';

  @override
  String verseCount(Object total, Object verse) {
    return 'Ayat $verse dari $total';
  }

  @override
  String get verseTafsir => 'Tafsir Ayat';

  @override
  String get tafsirOfTheDay => 'Tafsir Hari Ini';

  @override
  String get dailyInsight => 'Wawasan Harian';

  @override
  String get keyThemes => 'Tema & Pelajaran Utama';

  @override
  String get readFullSurah => 'Baca Surah Lengkap';

  @override
  String get surahIntroduction => 'Pengantar Surah';

  @override
  String get verses => 'ayat';

  @override
  String get loadingTafsir => 'Memuat tafsir...';

  @override
  String get keepAliveNotificationText => 'Notifikasi sholat aktif';

  @override
  String get keepAliveChannelName => 'Notifikasi Sholat';

  @override
  String get keepAliveChannelDescription =>
      'Membuat Noor Guard tetap aktif di latar belakang agar alarm sholat tidak pernah terlewat.';

  @override
  String get notifSetupTitle => 'Aktifkan Peringatan Layar Kunci';

  @override
  String get notifSetupSubtitle =>
      'Agar Anda tidak pernah melewatkan adzan — bahkan saat ponsel Anda terkunci. Hanya membutuhkan waktu sekitar satu menit.';

  @override
  String get notifSetupSamsungBanner =>
      'Menggunakan Samsung Galaxy (termasuk Fold/Flip)? Samsung menambahkan sakelar tambahan di luar Android standar — Langkah 4 dan 6 di bawah ini menunjukkan persis di mana menemukannya.';

  @override
  String get notifSetupStep1Title => 'Izinkan Notifikasi';

  @override
  String get notifSetupStep1Description =>
      'Izin dasar yang dibutuhkan Noor Guard agar dapat memberi tahu Anda sama sekali.';

  @override
  String get notifSetupStep1Action => 'Izinkan Notifikasi';

  @override
  String get notifSetupStep2Title => 'Alarm & Pengingat';

  @override
  String get notifSetupStep2Description =>
      'Memungkinkan alarm sholat berbunyi tepat pada waktu sholat, bahkan saat ponsel Anda diam atau dalam mode hemat daya.';

  @override
  String get notifSetupStep2Action => 'Buka Pengaturan Alarm';

  @override
  String get notifSetupStep3Title => 'Tampilkan di Atas Aplikasi Lain';

  @override
  String get notifSetupStep3Description =>
      'Memungkinkan layar sholat penuh muncul di atas layar kunci dan apa pun yang sedang terbuka.';

  @override
  String get notifSetupStep3Action => 'Buka Pengaturan';

  @override
  String get notifSetupStep4Title =>
      'Tampilkan sebagai Pop-up / Peringatan Layar Penuh';

  @override
  String get notifSetupStep4Description =>
      'Memungkinkan layar adzan menembus layar kunci, bukan tetap menjadi banner senyap.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Di ponsel Samsung Galaxy (termasuk Fold/Flip): buka Pengaturan → ketuk \"Prayer Time Alarm\", lalu aktifkan \"Pop-up notification\" (disebut \"Cover screen pop-up\" di Fold/Flip). Ini sakelar khusus Samsung — mengaktifkannya yang sebenarnya membuat layar adzan muncul di atas layar kunci Anda.';

  @override
  String get notifSetupStep4Action => 'Buka Pengaturan Notifikasi';

  @override
  String get notifSetupStep5Title => 'Jaga Notifikasi Tetap Andal';

  @override
  String get notifSetupStep5Description =>
      'Mencegah Android memperlambat atau menunda Noor Guard di latar belakang, sehingga alarm dan pengingat sholat selalu tiba tepat waktu.';

  @override
  String get notifSetupStep5Action => 'Nonaktifkan Pengoptimalan Baterai';

  @override
  String get notifSetupStep6Title => 'Aplikasi yang Tidak Pernah Tidur';

  @override
  String get notifSetupStep6Description =>
      'Pengelola baterai Samsung dapat membuat Noor Guard tertidur dan diam-diam memblokir alarm sholat. Menambahkannya ke \"Never sleeping apps\" mencegah hal ini.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Pengaturan → Baterai dan perawatan perangkat → Batas penggunaan latar belakang → Never sleeping apps → ketuk \"+\" → pilih Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Buka Pengaturan Baterai';

  @override
  String get notifSetupStatusChecking => 'Memeriksa…';

  @override
  String get notifSetupStatusEnabled => 'Aktif';

  @override
  String get notifSetupStatusNeeded => 'Diperlukan';

  @override
  String get notifSetupStatusManual => 'Langkah Manual';

  @override
  String get notifSetupContinueButton => 'Lanjutkan ke Noor Guard';

  @override
  String get notifSetupLaterButton => 'Saya akan menyelesaikannya nanti';

  @override
  String get notifSetupDoneButton => 'Selesai';

  @override
  String get testNotificationButton => 'Kirim Notifikasi Uji Coba (10 dtk)';

  @override
  String get testNotificationSnack =>
      'Notifikasi uji coba akan tiba dalam 10 detik';

  @override
  String get testLockAlarmButton => 'Uji Alarm Kunci Layar Penuh (10 dtk)';

  @override
  String get testLockAlarmSnack =>
      'Alarm kunci akan berbunyi dalam 10 detik — kunci ponsel Anda sekarang';

  @override
  String get testAdhanForegroundButton =>
      'Uji Adzan Dalam Aplikasi (latar depan)';

  @override
  String get testAdhanForegroundSnack =>
      'Memutar adzan lengkap dengan spanduk senyap';

  @override
  String get lockScreenSetupGuideButton =>
      'Panduan Penyiapan Peringatan Layar Kunci';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Tidak dapat membuka Kebijakan Privasi';

  @override
  String get couldNotOpenEmailApp => 'Tidak dapat membuka aplikasi email';

  @override
  String get blockDurationLabel => 'Durasi blokir';

  @override
  String get privacyAndTrust => 'Privasi & Kepercayaan';

  @override
  String get noorGuardMotto =>
      '\"Jika tidak layak ada di masjid,\nmaka tidak layak ada di Noor Guard.\"';

  @override
  String get openingAppStore => 'Membuka App Store…';

  @override
  String get openingShareSheet => 'Membuka menu bagikan…';

  @override
  String get openingSupportEmail => 'Membuka email dukungan…';

  @override
  String get openingTermsOfService => 'Membuka Ketentuan Layanan…';

  @override
  String get duration30Min => '30 mnt';

  @override
  String get duration1Hour => '1 jam';

  @override
  String get durationPrayerWindowOnly => 'Hanya jendela waktu shalat';

  @override
  String get hoursAbbreviation => 'jam';

  @override
  String get cancelTimerButton => 'Batalkan timer';

  @override
  String get custom => 'Khusus';

  @override
  String get customTimerMinutesTitle => 'Timer khusus (menit)';

  @override
  String get customTimerHint => 'misalnya 20';

  @override
  String get cancel => 'Batal';

  @override
  String get start => 'Mulai';

  @override
  String get travel => 'Perjalanan';

  @override
  String get anxietyAndStress => 'Kecemasan & Stres';

  @override
  String get gratitude => 'Rasa Syukur';

  @override
  String get protection => 'Perlindungan';

  @override
  String get family => 'Keluarga';

  @override
  String get forgiveness => 'Ampunan';

  @override
  String get appBlockingSetupHeadline => 'Jaga waktumu, jaga shalatmu';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard menggunakan layanan Aksesibilitas Android hanya untuk mengetahui kapan aplikasi yang diblokir dibuka saat waktu shalat. Aplikasi ini tidak pernah membaca pesan, foto, atau data pribadi Anda.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Akses Aksesibilitas diberikan';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Akses Aksesibilitas belum diberikan';

  @override
  String get appBlockingOpenSettings => 'Buka Pengaturan Aksesibilitas';

  @override
  String get appBlockingSetupNotNow => 'Nanti saja';

  @override
  String get appBlockingEnableToggle => 'Aktifkan Pemblokiran Aplikasi';

  @override
  String get appBlockingModeLabel => 'Mode Pemblokiran';

  @override
  String get appBlockingModeSoft => 'Ringan';

  @override
  String get appBlockingModeSoftDesc =>
      'Hanya pengingat lembut — aplikasi tetap bisa dibuka';

  @override
  String get appBlockingModeFirm => 'Tegas';

  @override
  String get appBlockingModeFirmDesc =>
      'Memblokir aplikasi, dengan jalan pintas cepat';

  @override
  String get appBlockingModeHard => 'Ketat';

  @override
  String get appBlockingModeHardDesc =>
      'Blokir penuh — hanya \"Saya Sudah Shalat\" yang membukanya';

  @override
  String get appBlockingSelectPrayersLabel => 'Blokir selama shalat berikut';

  @override
  String get appBlockingBufferBeforeLabel => 'Mulai sebelum waktu shalat';

  @override
  String get appBlockingBufferAfterLabel => 'Buka setelah waktu shalat';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count mnt';
  }

  @override
  String get appBlockingAppsTitle => 'Aplikasi Diblokir';

  @override
  String get appBlockingSelectAppsButton => 'Pilih Aplikasi untuk Diblokir';

  @override
  String get appBlockingSearchHint => 'Cari aplikasi terpasang';

  @override
  String get appBlockingNoAppsSelected => 'Belum ada aplikasi yang dipilih';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi diblokir',
      zero: 'Tidak ada aplikasi yang diblokir',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Pengujian';

  @override
  String get appBlockingTestDescription =>
      'Aktifkan Pemblokiran Aplikasi selama 2 menit untuk memastikan berfungsi di perangkat ini.';

  @override
  String get appBlockingTestButton => 'Uji Pemblokiran Aplikasi (2 menit)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Pemblokiran Aplikasi aktif selama 2 menit — coba buka aplikasi yang diblokir';

  @override
  String get appBlockingPermissionNeeded =>
      'Aktifkan akses Aksesibilitas untuk mulai memblokir';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Akses Screen Time — segera hadir';

  @override
  String get appBlockingIosComingSoonBody =>
      'Pemblokiran aplikasi di iOS membutuhkan izin Screen Time dari Apple, yang masih kami siapkan. Kami akan memberi tahu Anda begitu siap.';

  @override
  String get appBlockingHeadline1 => 'Waktunya Shalat';

  @override
  String get appBlockingHeadline2 => 'Jaga Waktumu';

  @override
  String get appBlockingIPrayedButton => 'Saya Sudah Shalat';

  @override
  String get appBlockingReadAyahsButton => 'Baca 3 Ayat';

  @override
  String get appBlockingEmergencyBypass => 'Lewati untuk Darurat';

  @override
  String get appBlockingBypassConfirmTitle => 'Akhiri rangkaian Anda?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Melewati sekarang akan mengatur ulang rangkaian shalat Anda. Jika ini darurat sungguhan, Anda bisa melanjutkan.';

  @override
  String get appBlockingBypassConfirmContinue => 'Tetap Lewati';

  @override
  String get appBlockingBypassConfirmCancel => 'Kembali';

  @override
  String get appBlockingSoftReminderTitle => 'Pengingat lembut';

  @override
  String get appBlockingSoftReminderBody =>
      'Sudah waktunya shalat — pertimbangkan untuk berhenti sejenak.';

  @override
  String get quranChallengeBannerTitle => 'Baca 3 Ayat untuk Membuka';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count dari $total ayat terbaca';
  }

  @override
  String get quranChallengeComplete => 'Bagus — aplikasi terbuka kembali';

  @override
  String get focusBlockHeadline1 => 'Tetap Fokus';

  @override
  String get focusBlockHeadline2 => 'Terus Lanjutkan';

  @override
  String get endFocusSessionButton => 'Akhiri Sesi Fokus';

  @override
  String get focusPaused => 'Dijeda untuk Shalat';

  @override
  String get selectLocationTitle => 'Pilih Lokasi';

  @override
  String get useCurrentLocation => 'Gunakan Lokasi Saat Ini';

  @override
  String get savedLocationsHeader => 'Lokasi Tersimpan';

  @override
  String get noSavedLocationsYet =>
      'Belum ada lokasi tersimpan. Cari di bawah untuk menambahkannya.';

  @override
  String get searchCityHint => 'Cari nama kota…';

  @override
  String get addLocationTooltip => 'Tambah lokasi';

  @override
  String get deleteLocationTooltip => 'Hapus lokasi';

  @override
  String get locationNotFound => 'Lokasi tidak ditemukan. Coba pencarian lain.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Anda dapat menyimpan hingga $max lokasi';
  }
}
