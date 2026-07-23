// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'アッサラーム・アライクム';

  @override
  String get mayAllahBlessYourDay => 'アッラーがあなたの一日を祝福しますように';

  @override
  String get nextPrayer => '次の礼拝';

  @override
  String get iPrayedButton => '礼拝しました';

  @override
  String get todaysPrayers => '今日の礼拝';

  @override
  String get qibla => 'キブラ';

  @override
  String get focusMode => 'フォーカスモード';

  @override
  String get appBlocking => 'アプリブロック';

  @override
  String get islamicCalendar => 'イスラム暦';

  @override
  String get islamicCalendarSubtitle => 'ヒジュラ暦の日付と行事';

  @override
  String get duas => 'ドゥアー';

  @override
  String get quran => 'クルアーン';

  @override
  String get settings => '設定';

  @override
  String get complete => '完了';

  @override
  String get streak => '連続記録';

  @override
  String get dayStreak => '日間の連続記録';

  @override
  String get compassRequiresDevice => 'コンパスには実機が必要です';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日',
      one: '$count日',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'すべての礼拝が完了しました!🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 の礼拝が完了';
  }

  @override
  String get fajr => 'ファジュル';

  @override
  String get dhuhr => 'ズフル';

  @override
  String get asr => 'アスル';

  @override
  String get maghrib => 'マグリブ';

  @override
  String get isha => 'イシャー';

  @override
  String fardRakats(int count) {
    return '義務(ファルド)ラカート $count回';
  }

  @override
  String sunnahBefore(int count) {
    return '前のスンナ $count回';
  }

  @override
  String sunnahAfter(int count) {
    return '後のスンナ $count回';
  }

  @override
  String prayedAt(String time) {
    return '$timeに礼拝';
  }

  @override
  String get timePeriodDawnBeforeSunrise => '夜明け、日の出の前';

  @override
  String get timePeriodAfterSunPassesHighestPoint => '太陽が南中を過ぎた後';

  @override
  String get timePeriodLateAfternoon => '午後遅く';

  @override
  String get timePeriodJustAfterSunset => '日没の直後';

  @override
  String get timePeriodNightBeforeMidnight => '夜、真夜中の前';

  @override
  String get fajrHadith => 'ファジュルの2ラカートは、この世とその中にあるすべてのものより優れている。—預言者ムハンマド ﷺ';

  @override
  String get fajrTip => 'ファジュルは一日最初の礼拝です。アッラーを思い起こしながら一日を始めることを思い出させてくれます。';

  @override
  String get dhuhrHadith => '12回のスンナのラカートを礼拝する者には、アッラーは楽園に家を建ててくださる。';

  @override
  String get dhuhrTip => 'ズフルは正午の礼拝です。一日を一旦止めて、心を整え直すのにふさわしい時間です。';

  @override
  String get asrHadith => 'アスルの礼拝を逃す者は、まるで自分の家族と財産を失ったかのようである。— 預言者ムハンマド ﷺ';

  @override
  String get asrTip =>
      'アスルはしばしば「真ん中の礼拝」と呼ばれます。アッラーはクルアーン(2:238)で特にこれに言及されています。';

  @override
  String get maghribHadith => 'マグリブの礼拝は一日のウィトルである。';

  @override
  String get maghribTip => 'マグリブはラマダーンの断食の終わりを告げます。太陽が沈むまさにその時に礼拝します。';

  @override
  String get ishaHadith => 'イシャーを集団礼拝で行う者は、夜の半分を礼拝したのと同じである。';

  @override
  String get ishaTip => 'イシャーは一日最後の礼拝です。礼拝で一日を終えることは、心の平安と区切りをもたらします。';

  @override
  String get newMuslimTip => '新しいムスリムへのヒント';

  @override
  String get notificationsOn => '通知オン';

  @override
  String get notificationsOff => '通知オフ';

  @override
  String get preview => 'プレビュー';

  @override
  String get lockPreviewCountdown => 'あと1時間23分  ·  16:47';

  @override
  String get swipeUpToUnlock => '上にスワイプしてロック解除';

  @override
  String get searchSurahs => 'スーラを検索…';

  @override
  String get noSurahsFound => 'スーラが見つかりません';

  @override
  String get tryAgain => '再試行';

  @override
  String ayahs(int count) {
    return '$count節';
  }

  @override
  String get searchDuas => 'ドゥアーを検索…';

  @override
  String supplications(int count) {
    return '$count件のドゥアー';
  }

  @override
  String get prayerSettings => '礼拝設定';

  @override
  String get calculationMethod => '計算方法';

  @override
  String get adhanSound => 'アザーンの音';

  @override
  String get prayerNotifications => '礼拝通知';

  @override
  String get statusOn => 'オン';

  @override
  String get statusOff => 'オフ';

  @override
  String get enableAllNotifications => 'すべての通知を有効にする';

  @override
  String get individualPrayers => '個別の礼拝';

  @override
  String get appearance => '外観';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get language => '言語';

  @override
  String get aboutNoorGuard => 'アプリについて';

  @override
  String get version => 'アプリバージョン';

  @override
  String get rateApp => 'Noor Guardを評価する';

  @override
  String get shareApp => 'Noor Guardをシェアする';

  @override
  String get contactSupport => 'サポートに連絡';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String get helpUsImprove => '改善にご協力ください';

  @override
  String get translationDisclaimer =>
      '翻訳はAIの支援を受けて作成されています。お使いの言語に誤りがありましたら、ぜひフィードバックをお寄せください！';

  @override
  String get privacyPromiseTitle => 'Noor Guardのプライバシーの約束';

  @override
  String get privacyPromiseBody =>
      'あなたの信仰は、あなただけのものです。あなたのデータも同じです。私たちはあなたのデータを決して販売、共有、収益化しません。位置情報も、礼拝の習慣も、お名前も。';

  @override
  String get directionToSacredHouse => '聖なる家(カアバ)への方角';

  @override
  String towardMecca(String degrees) {
    return 'メッカ方向 $degrees°';
  }

  @override
  String get defaultLocation => 'サクラメント、カリフォルニア州(デフォルト)';

  @override
  String get prayerHistory => '礼拝の記録';

  @override
  String get currentStreak => '現在の連続記録';

  @override
  String get longestStreak => '最長の連続記録';

  @override
  String get legend => '凡例';

  @override
  String get allFivePrayers => '5回すべての礼拝';

  @override
  String get partialPrayers => '一部(1〜4回)';

  @override
  String get none => 'なし';

  @override
  String get sun => '日';

  @override
  String get mon => '月';

  @override
  String get tue => '火';

  @override
  String get wed => '水';

  @override
  String get thu => '木';

  @override
  String get fri => '金';

  @override
  String get sat => '土';

  @override
  String headingDegrees(String degrees) {
    return '方位 $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'スーラを読み込めませんでした';

  @override
  String get connectionError => 'インターネット接続を確認してから、もう一度お試しください';

  @override
  String get alQuran => 'クルアーン';

  @override
  String get dailySupplications => '毎日のドゥアー';

  @override
  String get all => 'すべて';

  @override
  String get noDuasFound => 'ドゥアーが見つかりません';

  @override
  String get january => '1月';

  @override
  String get february => '2月';

  @override
  String get march => '3月';

  @override
  String get april => '4月';

  @override
  String get may => '5月';

  @override
  String get june => '6月';

  @override
  String get july => '7月';

  @override
  String get august => '8月';

  @override
  String get september => '9月';

  @override
  String get october => '10月';

  @override
  String get november => '11月';

  @override
  String get december => '12月';

  @override
  String get home => 'ホーム';

  @override
  String get prayers => '礼拝';

  @override
  String get more => 'その他';

  @override
  String get tafsir => 'タフスィール';

  @override
  String get lockScreen => 'ロック画面';

  @override
  String get readAndListen => '読む・聞く';

  @override
  String get commentary => '解説';

  @override
  String get findDirection => '方角を調べる';

  @override
  String get reminders => 'リマインダー';

  @override
  String get blockDistractions => '誘惑をブロック';

  @override
  String get prayerGuard => '礼拝の守り';

  @override
  String get importantDates => '重要な日付';

  @override
  String get comingSoon => '近日公開';

  @override
  String get morningAndEvening => '朝と夕方';

  @override
  String get prayer => '礼拝';

  @override
  String get foodAndDrink => '飲食';

  @override
  String get verityWithHardship => '本当に、苦しみとともに、安らぎがある。';

  @override
  String get ashSharh946 => 'アッシャルフ章 94:6';

  @override
  String get guardStrictlyYourPrayers => '礼拝を、特に真ん中の礼拝を、しっかりと守りなさい。';

  @override
  String get alBaqarah2238 => 'バカラ章 2:238';

  @override
  String get pastEvents => '過去の行事';

  @override
  String get upcomingEvents => '今後の行事';

  @override
  String get today => '今日';

  @override
  String get next => '次';

  @override
  String hijriYearLabel(int year) {
    return 'ヒジュラ暦$year年';
  }

  @override
  String get islamicMonthMuharram => 'ムハッラム月';

  @override
  String get islamicMonthSafar => 'サファル月';

  @override
  String get islamicMonthRabiAlAwwal => 'ラビー・アル・アウワル月';

  @override
  String get islamicMonthRabiAlThani => 'ラビー・アッ・サーニー月';

  @override
  String get islamicMonthJumadaAlAwwal => 'ジュマーダ・アル・アウワル月';

  @override
  String get islamicMonthJumadaAlThani => 'ジュマーダ・アッ・サーニー月';

  @override
  String get islamicMonthRajab => 'ラジャブ月';

  @override
  String get islamicMonthShaban => 'シャアバーン月';

  @override
  String get islamicMonthRamadan => 'ラマダーン月';

  @override
  String get islamicMonthShawwal => 'シャウワール月';

  @override
  String get islamicMonthDhulQadah => 'ズー・アル・カアダ月';

  @override
  String get islamicMonthDhulHijjah => 'ズー・アル・ヒッジャ月';

  @override
  String get islamicNewYear => 'イスラム新年';

  @override
  String get ashura => 'アーシューラー';

  @override
  String get mawlidAlNabi => 'マウリド・アンナビー(預言者生誕祭)';

  @override
  String get ramadanBegins => 'ラマダーン開始';

  @override
  String get laylatAlQadr => 'ライラト・アル・カドル(運命の夜)';

  @override
  String get eidAlFitr => 'イード・アル・フィトル';

  @override
  String get dayOfArafah => 'アラファの日';

  @override
  String get eidAlAdha => 'イード・アル・アドハー';

  @override
  String get active => '実行中';

  @override
  String get focusModeSubtitle => '集中力を守りましょう。セッションを停止するまでアプリはブロックされます。';

  @override
  String get remaining => '残り';

  @override
  String get ready => '準備完了';

  @override
  String get duration => '時間';

  @override
  String get minutesAbbreviation => '分';

  @override
  String get blockedDuringFocus => 'フォーカス中にブロック';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のアプリ',
      one: '$count個のアプリ',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'フォーカス開始';

  @override
  String get stopFocus => 'フォーカス停止';

  @override
  String get alhamdulillah => 'アルハムドゥリッラー!';

  @override
  String get sessionComplete => 'セッション完了';

  @override
  String stayedFocusedFor(String duration) {
    return '$duration集中することができました。';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分',
      one: '$count分',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote => '「忍耐と礼拝によって(アッラーの)助けを求めなさい。」\n— バカラ章 2:45';

  @override
  String get done => '完了';

  @override
  String get socialMedia => 'ソーシャルメディア';

  @override
  String get entertainment => 'エンターテインメント';

  @override
  String get games => 'ゲーム';

  @override
  String get messaging => 'メッセージ';

  @override
  String get blockDuringPrayerTimes => '礼拝の時間にブロックする';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      '選択したアプリは、1日5回の礼拝の時間に\n自動的にブロックされます。';

  @override
  String get blockedLabel => 'ブロック中';

  @override
  String get blockAllApps => 'すべてのアプリをブロック';

  @override
  String get blockingTimingInfo => 'ブロックは各礼拝の5分前に始まり、15分後に解除されます。';

  @override
  String get blockedDuringPrayers => '礼拝中はブロック';

  @override
  String get notBlocked => 'ブロックなし';

  @override
  String get wuduStep1 => '意思(ニーヤ)';

  @override
  String get wuduStep2 => 'ビスミッラー';

  @override
  String get wuduStep3 => '手を洗う';

  @override
  String get wuduStep4 => '口をすすぐ';

  @override
  String get wuduStep5 => '鼻を清める';

  @override
  String get wuduStep6 => '顔を洗う';

  @override
  String get wuduStep7 => '腕を洗う';

  @override
  String get wuduStep8 => '頭を拭う';

  @override
  String get wuduStep9 => '足を洗う';

  @override
  String get revertCorner => '新ムスリムの広場';

  @override
  String get revertCornerSubtitle => '新しいムスリムのためのガイドとサポート';

  @override
  String get wuduGuide => 'ウドゥーのガイド';

  @override
  String get howToPray => '礼拝の仕方';

  @override
  String get newMuslimChecklist => '新ムスリム・チェックリスト';

  @override
  String get islamicGlossary => 'イスラム用語集';

  @override
  String get whyDoWe => 'なぜ私たちは...';

  @override
  String get communityStories => 'コミュニティのストーリー';

  @override
  String get wuduGuideSubtitle => '礼拝前の清め';

  @override
  String get howToPraySubtitle => '礼拝(サラート)のステップガイド';

  @override
  String get newMuslimChecklistSubtitle => 'あなたの30日間の旅';

  @override
  String get howToPrayStep1Name => 'まずウドゥー';

  @override
  String get howToPrayStep1Instruction => '礼拝を始める前に、清浄な状態になるためウドゥー(小浄)を行いましょう。';

  @override
  String get howToPrayStep1Tip =>
      'やり方が分からない場合は、まず新ムスリムの広場から「ウドゥーのガイド」を開いてみましょう。';

  @override
  String get howToPrayStep2Name => 'キブラに向かって立つ';

  @override
  String get howToPrayStep2Instruction =>
      '礼拝用マットの上で、キブラ — メッカのカアバの方角 — を向いて立ちます。アプリのキブラ・コンパスを使って正確な方角を確認しましょう。';

  @override
  String get howToPrayStep2Tip =>
      '少し方角がずれていても大丈夫です。アッラーはあなたの意図(ニーヤ)をご存知です。できる限りで構いません。';

  @override
  String get howToPrayStep3Name => 'ニーヤ(意思)';

  @override
  String get howToPrayStep3Instruction =>
      'これから行う礼拝について、心の中で意思(ニーヤ)を決めます。声に出す必要はありません。';

  @override
  String get howToPrayStep3Tip =>
      'あなたの意思は、あなたとアッラーの間だけのものです。「アッラーのためにファジュルを礼拝します」というシンプルな思いだけで十分です。';

  @override
  String get howToPrayStep4Name => 'タクビール(開始の言葉)';

  @override
  String get howToPrayStep4Instruction =>
      '両手を耳たぶの高さまで上げ、「アッラーフ・アクバル」(アッラーは最も偉大なり)と唱えます。これで礼拝が正式に始まります。';

  @override
  String get howToPrayStep4Tip => '礼拝の間ずっと、視線は伏拝(サジダ)する場所のあたりに向けたままにしましょう。';

  @override
  String get howToPrayStep5Name => 'キヤーム(立位)';

  @override
  String get howToPrayStep5Instruction =>
      '右手を左手の上に重ねて胸の前に置きます。スーラ・アル・ファーティハを唱え、続けて知っている他の短いスーラや節を唱えます。';

  @override
  String get howToPrayStep5Tip =>
      'まだ他のスーラを覚えていない場合は、学んでいる間はアル・ファーティハだけでも問題ありません。';

  @override
  String get howToPrayStep6Name => 'ルクー(お辞儀)';

  @override
  String get howToPrayStep6Instruction =>
      '腰を曲げて、背中が床と平行になるようにお辞儀をします。両手を膝に置き、「スブハーナ・ラッビヤル・アズィーム」と3回唱えます。';

  @override
  String get howToPrayStep6Tip => '背中はまっすぐ水平に保ちましょう — 丸めたり反らせたりしないようにします。';

  @override
  String get howToPrayStep7Name => 'イティダール(お辞儀から起き上がる)';

  @override
  String get howToPrayStep7Instruction =>
      'お辞儀の姿勢から起き上がり、まっすぐ立ちます。起き上がりながら「サミー・アッラーフ・リマン・ハミダフ」(アッラーは賛美する者の声を聞き入れられる)と唱え、その後「ラッバナー・ラカル・ハムド」と唱えます。';

  @override
  String get howToPrayStep7Tip => '完全にまっすぐ立ち、次の動作に移る前に少し静止しましょう。';

  @override
  String get howToPrayStep8Name => 'スジュード(伏拝)';

  @override
  String get howToPrayStep8Instruction =>
      '額、鼻、両手のひら、両膝、両足のつま先を床につけて伏します。「スブハーナ・ラッビヤル・アアラー」と3回唱えます。';

  @override
  String get howToPrayStep8Tip => '額(鼻も含む)、両手、両膝、両足のつま先の7か所が床に触れている必要があります。';

  @override
  String get howToPrayStep9Name => 'ジャルサ(2回の伏拝の間に座る)';

  @override
  String get howToPrayStep9Instruction =>
      '伏拝から起き上がり、左足を平らにして座り、右足は立てておきます。座りながら「アッラーフ・アクバル」と唱えます。少し間をおいてから、2回目の伏拝に入ります。';

  @override
  String get howToPrayStep9Tip => '2回の伏拝の間のこの短い座りはジャルサと呼ばれます。礼拝に必要な動作の一つです。';

  @override
  String get howToPrayStep10Name => 'ラカートを完成させる';

  @override
  String get howToPrayStep10Instruction =>
      '1ラカート目を終えたら立ち上がり、2ラカート目も同じ手順を繰り返します。ラカートの数は、行う礼拝によって異なります。';

  @override
  String get howToPrayStep10Tip =>
      'ファジュルは2ラカート、ズフルは4ラカート、アスルは4ラカート、マグリブは3ラカート、イシャーは4ラカートです。一つずつ落ち着いて行いましょう。';

  @override
  String get howToPrayStep11Name => 'タシャッフド(最後の着席)';

  @override
  String get howToPrayStep11Instruction =>
      '最後に座った姿勢でタシャッフドを唱えます。これは最後のラカートの後に座ったまま唱える信仰の言葉です。';

  @override
  String get howToPrayStep11Tip =>
      'タシャッフドの間、「アシュハドゥ・アッラー・イラーハ・イッラッラー」と唱えるとき、アッラーの唯一性のしるしとして右手の人差し指を立てます。';

  @override
  String get howToPrayStep12Name => 'タスリーム(終了の挨拶)';

  @override
  String get howToPrayStep12Instruction =>
      '顔を右に向けて「アッサラーム・アライクム・ワ・ラフマトゥッラー」と唱え、次に左に向けて同じように唱えます。これで礼拝は終わります。';

  @override
  String get howToPrayStep12Tip =>
      '礼拝の後は、少し時間をとってドゥアー(祈願)を捧げ、アッラーに必要なことをお願いしましょう。アッラーとつながる美しいひとときです。';

  @override
  String get checklistWeek1Title => '1週目';

  @override
  String get checklistWeek2Title => '2週目';

  @override
  String get checklistWeek3Title => '3週目';

  @override
  String get checklistWeek4Title => '4週目';

  @override
  String get checklistWeek1Item1 => 'シャハーダを唱える';

  @override
  String get checklistWeek1Item2 => 'ウドゥーを学ぶ';

  @override
  String get checklistWeek1Item3 => 'アル・ファーティハを学ぶ';

  @override
  String get checklistWeek1Item4 => '初めてのファジュルを礼拝する';

  @override
  String get checklistWeek1Item5 => '礼拝用マットを用意する';

  @override
  String get checklistWeek1Item6 => '近くのモスクを見つける';

  @override
  String get checklistWeek2Item1 => '5回の礼拝時間をすべて学ぶ';

  @override
  String get checklistWeek2Item2 => '基本的なドゥアーを学ぶ';

  @override
  String get checklistWeek2Item3 => '預言者ムハンマドについて学ぶ';

  @override
  String get checklistWeek2Item4 => 'ムスリム・コミュニティとつながる';

  @override
  String get checklistWeek3Item1 => 'ハラールフードについて学ぶ';

  @override
  String get checklistWeek3Item2 => 'スーラ・アル・イフラースを読む';

  @override
  String get checklistWeek3Item3 => 'ラマダーンについて学ぶ';

  @override
  String get checklistWeek3Item4 => '毎日のズィクルを始める';

  @override
  String get checklistWeek4Item1 => 'ザカートについて学ぶ';

  @override
  String get checklistWeek4Item2 => '五行の柱について学ぶ';

  @override
  String get checklistWeek4Item3 => '礼拝の通知を設定する';

  @override
  String get checklistWeek4Item4 => '自分の歩みを振り返る';

  @override
  String get wuduStep1Instruction => 'アッラーのためにウドゥーを行うという意思(ニーヤ)を心の中で定めます。';

  @override
  String get wuduStep1Tip => '声に出す必要はありません — 心の中で誠実に意図するだけで十分です。';

  @override
  String get wuduStep2Instruction => '始める前に「ビスミッラー」(アッラーの御名において)と唱えます。';

  @override
  String get wuduStep2Tip =>
      'ビスミッラーを唱えることはスンナであり、アッラーを思い起こすことからウドゥーを始めることになります。';

  @override
  String get wuduStep3Instruction => '両手首までを3回洗い、指の間にもしっかりと水が行き渡るようにします。';

  @override
  String get wuduStep3Tip => '右手から始め、次に左手を洗いましょう。この順序はイスラムで推奨されています。';

  @override
  String get wuduStep4Instruction => '口に水を含み、口の中をすすいでから吐き出します。これを3回行います。';

  @override
  String get wuduStep4Tip => 'これは口を清潔にするためのもので、清めの過程の一部です。';

  @override
  String get wuduStep5Instruction => '鼻から水を吸い込み、優しく吹き出します。これを3回行います。';

  @override
  String get wuduStep5Tip => '右手で水を吸い込み、左手で吹き出すようにします。';

  @override
  String get wuduStep6Instruction => '髪の生え際から顎まで、耳から耳まで、顔全体を3回洗います。';

  @override
  String get wuduStep6Tip => '顔のどの部分も乾いたまま残らないようにしましょう。';

  @override
  String get wuduStep7Instruction => '右腕を指先から肘まで3回洗い、その後左腕も同じように洗います。';

  @override
  String get wuduStep7Tip => 'ウドゥーでは常に右側から先に行います。';

  @override
  String get wuduStep8Instruction => '両手を濡らし、頭全体を前から後ろ、後ろから前へと一度なでるように拭います。';

  @override
  String get wuduStep8Tip => '他の部位の洗浄とは異なり、頭を拭うのは一度だけです。';

  @override
  String get wuduStep9Instruction => '右足をくるぶしまで含めて3回洗い、その後左足も同じように洗います。';

  @override
  String get wuduStep9Tip => '足の指の間にも水が行き渡るようにしましょう。指を使って間を清めます。';

  @override
  String get islamicGlossaryTitle => 'イスラム用語集';

  @override
  String get islamicGlossarySubtitle => 'クルアーン、スンナ、伝統的学問に基づく51の用語';

  @override
  String get searchTermsHint => '用語、アラビア語、定義などで検索...';

  @override
  String get categoryAll => 'すべて';

  @override
  String get categoryPillar => '信仰の柱';

  @override
  String get categoryAqeedah => 'アキーダ(信条)';

  @override
  String get categoryPractice => '実践';

  @override
  String get categoryDhikr => 'ズィクル';

  @override
  String get categoryQuran => 'クルアーン';

  @override
  String get categoryHadith => 'ハディース';

  @override
  String get categoryFiqh => 'フィクフ(法学)';

  @override
  String get categoryHistory => '歴史';

  @override
  String get noTermsFound => '用語が見つかりません';

  @override
  String get sourceLabel => '出典';

  @override
  String get revertCornerHubSubtitle => '新しいムスリムとしての最初の一歩を優しく導くための広場';

  @override
  String get islamicGlossaryHubSubtitle => 'よく使われる用語をわかりやすく解説';

  @override
  String get whyDoWeHubSubtitle => '日々の習慣に込められた知恵';

  @override
  String get communityStoriesHubSubtitle => '改宗者たちが語るイスラムへの道のり';

  @override
  String get whyDoWeScreenSubtitle => '12の日常的なイスラムの習慣に込められた知恵';

  @override
  String get whyDoWeSourceBadge => 'スンニ派の典拠';

  @override
  String get whyDoWeQ1 => 'なぜ私たちは1日5回礼拝するのですか?';

  @override
  String get whyDoWeA1 =>
      'アッラーはクルアーン(2:238)で1日5回の礼拝を命じられ、それは夜の旅(イスラー・ワ・ミラージュ)の際に定められました。預言者ﷺは「審判の日に人がまず問われるのは礼拝についてである」と言われました(イブン・マージャ)。礼拝は一日を通して私たちをアッラーとつなげてくれます。';

  @override
  String get whyDoWeQ2 => 'なぜ礼拝のときメッカの方角を向くのですか?';

  @override
  String get whyDoWeA2 =>
      'アッラーはクルアーン(2:144)で「あなたの顔を聖モスクの方に向けなさい」と命じられました。メッカのカアバは、アッラーを礼拝するために最初に建てられた家です(3:96)。同じ方角を向くことで、世界中のムスリムが礼拝において一つに結ばれます。';

  @override
  String get whyDoWeQ3 => 'なぜラマダーンに断食をするのですか?';

  @override
  String get whyDoWeA3 =>
      'アッラーはクルアーン(2:183)で断食を命じられました。「信仰する者たちよ、あなた方より前の者たちに定められたように、断食があなた方にも定められた。それはあなた方が(アッラーを)畏れるためである。」ラマダーンはクルアーンが下された月です(2:185)。';

  @override
  String get whyDoWeQ4 => 'なぜ食事の前にビスミッラーと言うのですか?';

  @override
  String get whyDoWeA4 =>
      '預言者ﷺは「あなた方の誰かが食事をするときは、アッラーの御名を唱えなさい。もし最初に忘れたなら、『ビスミッラー、アウワラフ・ワ・アーヒラフ』(初めも終わりもアッラーの御名において)と言いなさい」と言われました(アブー・ダーウード)。すべての恵みはアッラーから来ることを思い出させてくれます。';

  @override
  String get whyDoWeQ5 => 'なぜモスクに入る前に靴を脱ぐのですか?';

  @override
  String get whyDoWeA5 =>
      'アッラーはムーサーに「あなたのサンダルを脱ぎなさい。あなたは聖なる谷トゥワーにいるのだから」(クルアーン20:12)と命じられました。靴を脱ぐことはアッラーの家への敬意を示し、礼拝の場所を清潔に保つことにもつながります。';

  @override
  String get whyDoWeQ6 => 'なぜ挨拶として「アッサラーム・アライクム」と言うのですか?';

  @override
  String get whyDoWeA6 =>
      '預言者ﷺは「あなた方は信仰するまで楽園に入れない。そして互いに愛し合うまで(本当の)信仰者にはなれない。互いに愛し合うようになることを教えようか。あなた方の間で平安(サラーム)を広めなさい」と言われました(ムスリム)。これはドゥアーでもあり、相手の平安を祈っているのです。';

  @override
  String get whyDoWeQ7 => 'なぜハッジを行うのですか?';

  @override
  String get whyDoWeA7 =>
      'ハッジはアッラーによって命じられました(3:97)。「この家への巡礼は、それが可能な者にとってアッラーへの義務である。」これは預言者イブラーヒームとその家族の試練を記念するものであり、あらゆる国のムスリムを礼拝のもとに一つに結びつけます。';

  @override
  String get whyDoWeQ8 => 'なぜザカートを払うのですか?';

  @override
  String get whyDoWeA8 =>
      'ザカートはイスラムの第三の柱であり、クルアーンでは礼拝とともに30回以上命じられています。預言者ﷺはザカートが財産を清めると言われました。ザカートは格差を減らし、富はアッラーのものであることを信仰者に思い出させます。';

  @override
  String get whyDoWeQ9 => 'なぜくしゃみの後にアルハムドゥリッラーと言うのですか?';

  @override
  String get whyDoWeA9 =>
      '預言者ﷺは「あなた方の誰かがくしゃみをしたら『アルハムドゥリッラー』と言いなさい。そしてその兄弟や同席者は『ヤルハムカッラー』(アッラーがあなたに慈悲をかけてくださいますように)と言いなさい」と言われました(ブハーリー)。これは健康という恵みに対するアッラーへの感謝のひとときです。';

  @override
  String get whyDoWeQ10 => 'なぜムスリム女性はヒジャブを着けるのですか?';

  @override
  String get whyDoWeA10 =>
      'アッラーはクルアーン(24:31)で、信仰する女性は自分の慎み深さを守るようにと命じられました。ヒジャブはアッラーへの礼拝と従順の行為です。多くのムスリム女性は、それを自分のアイデンティティ、尊厳、そして精神的なつながりの源として身につけています。';

  @override
  String get whyDoWeQ11 => 'なぜ豚肉とお酒を避けるのですか?';

  @override
  String get whyDoWeA11 =>
      'アッラーはクルアーン(2:173)で豚肉を、(5:90)でお酒を禁じ、それを「悪魔の業による忌まわしいもの」と呼ばれました。これらの禁止事項は、健康、心、そして家族を守るためのものです。ハラールの指針は、信仰者が心身ともに清浄を保つ助けとなります。';

  @override
  String get whyDoWeQ12 => 'なぜインシャーアッラーと言うのですか?';

  @override
  String get whyDoWeA12 =>
      'アッラーはクルアーン(18:23-24)で命じられています。「『私は明日それをします』と、『もしアッラーが望まれるなら』と付け加えずに決して言ってはならない。」インシャーアッラーと言うことは、未来を司るのはアッラーだけであると認め、私たちを謙虚にしてくれます。';

  @override
  String get communityStoriesScreenSubtitle => '世界各地から届く、イスラムへの本当の道のり';

  @override
  String get communityStoriesTimeLabel => 'ムスリムになってからの期間';

  @override
  String get communityStoriesShareBtn => 'あなたのストーリーをシェア';

  @override
  String get communityStoriesShareSoon => '近日公開 — この機能はもうすぐ登場します!';

  @override
  String get communityStory1Name => 'アイシャ(旧名サラ)';

  @override
  String get communityStory1Location => 'アメリカ・テキサス州';

  @override
  String get communityStory1Time => '2年';

  @override
  String get communityStory1Text =>
      '大学のレポートのために調べものをしていたときに、イスラムに出会いました。メディアが言っていることを見つけるだろうと思っていましたが、そこにあったのは平安と論理、そして本当に納得できる神の姿でした。6か月後にシャハーダを唱えました。一番難しかったのは礼拝を覚えることではなく、家族に伝えることでした。でもアルハムドゥリッラー、2年経った今では、母が自分からイスラムについて私に質問してくれるようになりました。';

  @override
  String get communityStory2Name => 'ユースフ(旧名ジェームズ)';

  @override
  String get communityStory2Location => 'イギリス・ロンドン';

  @override
  String get communityStory2Time => '4年';

  @override
  String get communityStory2Text =>
      '何年も探し求めた末に改宗しました。キリスト教、仏教、無神論 — どれも心の空白を埋めてはくれませんでした。あるムスリムの同僚が金曜礼拝に誘ってくれました。後ろの方に座って、ずっと泣いていました。理由すら自分でもわかりませんでした。その翌週にシャハーダを唱えました。コミュニティは、自分でも気づかなかったほど必要としていた家族のように、私を温かく包んでくれました。';

  @override
  String get communityStory3Name => 'マルヤム(旧名マリア)';

  @override
  String get communityStory3Location => 'メキシコ・メキシコシティ';

  @override
  String get communityStory3Time => '1年';

  @override
  String get communityStory3Text =>
      'ラテン系でムスリムであることは、まるで一つの力のように感じます。私は深夜2時にYouTubeの動画を通してイスラムに出会いました。何時間も見続けました。タウヒード — 神は唯一であり、相棒もイメージ(偶像)も持たないという考え — がとても深く心に響きました。モスクのスペイン語を話す姉妹たちは、すぐに私を温かく迎え入れてくれました。';

  @override
  String get communityStory4Name => 'イブラーヒム(旧名デイビッド)';

  @override
  String get communityStory4Location => 'カナダ・トロント';

  @override
  String get communityStory4Time => '6年';

  @override
  String get communityStory4Text =>
      '私は牧師の息子でした。三位一体について、誰も答えてくれない疑問を抱えていました。初めてクルアーンを読んだとき、まるで自分がすでに信じていたことを読んでいるように感じました。一人で静かにシャハーダを唱え、その後モスクでもう一度唱えました。人生で最高の決断でした。';

  @override
  String get communityStory5Name => 'ファーティマ(旧名ジェニファー)';

  @override
  String get communityStory5Location => 'オーストラリア・シドニー';

  @override
  String get communityStory5Time => '3年';

  @override
  String get communityStory5Text =>
      '私の旅はヒジャブから始まりました。ちょっとした挑戦のつもりで身につけたのですが、なぜか「守られている」と感じました。イスラムについて読み始めると止まらなくなり、3か月のうちにシャハーダを唱えていました。「何を手放したの?」とよく聞かれますが、私は「空虚さを手放したのです」と答えています。';

  @override
  String get communityStory6Name => 'オマル(旧名ケビン)';

  @override
  String get communityStory6Location => '南アフリカ・ヨハネスブルグ';

  @override
  String get communityStory6Time => '5年';

  @override
  String get communityStory6Text =>
      '治安の悪い地域で育ちました。イスラムは私に規律と目的、そして兄弟愛を与えてくれました。初めてスジュードをしたとき、自分の中の何かが — 一番良い意味で — 解き放たれた気がしました。涙が止まらず、理由を説明できませんでした。今では、ディーン(信仰の道)を見つけようとしている若者たちを導いています。';

  @override
  String get inspiredByRealStories => '改宗者たちの本当の体験談に基づいています';

  @override
  String get storyFormTitle => 'あなたのストーリーをシェア';

  @override
  String get storyFormNameLabel => 'お名前';

  @override
  String get storyFormNameHint => 'お名前、または「匿名」とご記入ください';

  @override
  String get storyFormCountryLabel => '国';

  @override
  String get storyFormCountryHint => 'どちらの出身ですか?';

  @override
  String get storyFormTimeLabel => 'ムスリムになってからの期間';

  @override
  String get storyFormTimeHint => '例: 2年、6か月';

  @override
  String get storyFormStoryLabel => 'あなたのストーリー';

  @override
  String get storyFormStoryHint => 'イスラムへの道のりをシェアしてください...';

  @override
  String get storyFormSubmitBtn => 'ストーリーを送信';

  @override
  String get storyFormThankYouTitle => 'ジャザーカッラー・ハイル!';

  @override
  String get storyFormThankYouBody =>
      'あなたのストーリーを受け取りました。公開前にすべての投稿を確認させていただきます。';

  @override
  String get storyFormRequiredError => 'すべての項目を入力してください';

  @override
  String get subtitleYourGuideToIslam => 'あなたのイスラムへのガイド';

  @override
  String get beginnerMode => '初心者モード';

  @override
  String get beginnerModeSubtitle => '新しいムスリムのための追加のヒントとガイダンス';

  @override
  String get beginnerModeOn => '初心者モードがオンになりました — アプリ全体に追加のヒントが表示されます';

  @override
  String get beginnerModePrayersTip => 'ヒント: 各礼拝をタップすると、詳しい情報やスンナの礼拝を確認できます';

  @override
  String get tafsirSubtitle => 'クルアーン解説';

  @override
  String get tafsirComingSoon => 'このスーラのタフスィールは近日公開予定です';

  @override
  String get tafsirNotAvailable => 'タフスィールは利用できません';

  @override
  String get scholarSource => '出典';

  @override
  String get asbabAlNuzul => '啓示の理由(アスバーブ・アン=ヌズール)';

  @override
  String get transliteration => '音訳(ローマ字表記)';

  @override
  String get selectReciter => '朗誦者を選択';

  @override
  String get playVerse => '節を再生';

  @override
  String get asmaUlHusna => 'アスマー・ウル・フスナー';

  @override
  String get asmaUlHusnaSubtitle => 'アッラーの99の美しい御名';

  @override
  String get asmaHadith => 'アッラーには99の御名がある。それらを記憶する者は楽園に入るであろう。';

  @override
  String get asmaHadithSource => 'サヒーフ・アル=ブハーリー、2736番';

  @override
  String get asmaSearchHint => '御名を検索...';

  @override
  String get asmaNoResults => '該当する御名が見つかりません';

  @override
  String get asmaSignificance => '意味';

  @override
  String get asmaUlHusnaTile => '99の御名';

  @override
  String get asmaUlHusnaTileSubtitle => 'アッラーの御名';

  @override
  String get onboardingTagline => 'あなたの時間を守り、礼拝を大切に。';

  @override
  String get onboardingChooseLanguage => '言語を選択してください';

  @override
  String get onboardingGetStarted => '始める';

  @override
  String get onboardingLocationTitle => '正確な礼拝時間';

  @override
  String get onboardingLocationDesc =>
      'Noor Guardは、お住まいの都市の正確な礼拝時間を計算するために位置情報を必要とします。位置情報が保存されたり共有されたりすることは一切ありません。';

  @override
  String get onboardingPrivacyBanner => 'あなたの信仰は、あなただけのものです。あなたのデータも同じです。';

  @override
  String get onboardingAllowLocation => '位置情報を許可する';

  @override
  String get onboardingSkipForNow => '今はスキップ';

  @override
  String get onboardingNotificationTitle => '礼拝を見逃さない';

  @override
  String get onboardingNotificationDesc =>
      '美しいアザーンとともに、各礼拝の時間に通知を受け取りましょう。音や時間は設定でカスタマイズできます。';

  @override
  String get onboardingAdhanAlerts => 'アザーン通知';

  @override
  String get onboardingCustomTiming => '時間のカスタマイズ';

  @override
  String get onboardingAdjustable => '調整可能';

  @override
  String get onboardingEnableNotifications => '通知を有効にする';

  @override
  String get onboardingMaybeLater => '後でやる';

  @override
  String get onboardingAllSetTitle => '準備完了です!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guardは、あなたの時間を守り\n意図を持って一日を導く準備ができました。';

  @override
  String get onboardingPrayerTimesLabel => '礼拝時間';

  @override
  String get onboardingPrayerTimesDesc => 'お住まいの都市の正確な時間';

  @override
  String get onboardingLockScreenLabel => 'イスラムのロック画面';

  @override
  String get onboardingLockScreenDesc => 'ロック解除のたびにクルアーンとドゥアーを表示';

  @override
  String get onboardingPrayerGuardLabel => '礼拝の守り';

  @override
  String get onboardingPrayerGuardDesc => 'サラートの間、アプリは自動的にブロックされます';

  @override
  String get onboardingEnterApp => 'Noor Guardを始める';

  @override
  String get adhan => 'アザーン';

  @override
  String get adhanSubtitle => '礼拝の呼びかけ';

  @override
  String get adhanDescription =>
      'アザーンはイスラームにおける礼拝への呼びかけで、信者を礼拝に招くために一日に5回告げられます。';

  @override
  String get makkahStyle => 'マッカ';

  @override
  String get madinahStyle => 'マディーナ';

  @override
  String get egyptianStyle => 'エジプト式';

  @override
  String get adhanPlaying => '再生中';

  @override
  String get makkahDescription => 'マッカの聖モスクから伝わる伝統的な礼拝の呼びかけ。';

  @override
  String get madinahDescription => 'マディーナの預言者モスクの様式による静かな詠唱。';

  @override
  String get egyptianDescription => '豊かな詠唱で知られる、メロディアスなエジプト式アザーン。';

  @override
  String get adhanCallToWorship => '礼拝の呼びかけ';

  @override
  String get adhanDescriptionFull =>
      'アザーンはイスラームにおける礼拝への呼びかけで、信者を礼拝に招くために一日に5回告げられます。';

  @override
  String get alafasyStyle => 'ミシャリ・アルアファーシー';

  @override
  String get alaqsaStyle => 'アル・アクサ';

  @override
  String get turkishStyle => 'トルコ式';

  @override
  String get pakistaniStyle => 'パキスタン式';

  @override
  String get indonesianStyle => 'インドネシア式';

  @override
  String get alafasyDescription => '著名な朗読者ミシャリ・ラシード・アルアファーシーによる心に響く朗誦。';

  @override
  String get alaqsaDescription =>
      'イスラームで三番目に神聖な場所、エルサレムのアル・アクサ・モスクから響く礼拝への呼びかけ。';

  @override
  String get turkishDescription => '独特の旋律的なマカームを持つ伝統的なトルコ式アザーン。';

  @override
  String get pakistaniDescription => '南アジアの伝統に基づく心に響くアザーンで、パキスタン全土で唱えられています。';

  @override
  String get indonesianDescription => '群島全体で愛されている、メロディアスなインドネシア式アザーン。';

  @override
  String get thisWeek => '今週';

  @override
  String weeklyProgress(int count) {
    return '今週の礼拝 $count/35';
  }

  @override
  String get bestDay => '最も良かった日';

  @override
  String get prayerStats => '礼拝の統計';

  @override
  String get completionRate => '達成率';

  @override
  String get bestPrayer => '最も継続している礼拝';

  @override
  String get hardestPrayer => '最も欠かしやすい礼拝';

  @override
  String totalPrayersCompleted(int count) {
    return '礼拝完了数 $count件';
  }

  @override
  String get last7Days => '過去7日間';

  @override
  String get thisMonth => '今月';

  @override
  String get fullDays => '全礼拝を行った日';

  @override
  String get partialDays => '一部の礼拝を行った日';

  @override
  String get missedDays => '礼拝を行わなかった日';

  @override
  String get missedPrayerBadge => '未実施';

  @override
  String get makeItUp => '後で行う';

  @override
  String get qadaExplanation => '礼拝を逃した場合でも、補完礼拝（カダー）として行うことができます。';

  @override
  String get noStatsYet => '礼拝を記録し続けると、ここに統計が表示されます。';

  @override
  String get notEnoughData => 'データがまだ十分ではありません';

  @override
  String get continuousPlay => '連続再生';

  @override
  String get sleepTimer => 'スリープタイマー';

  @override
  String verseCount(Object total, Object verse) {
    return '$total節中第$verse節';
  }

  @override
  String get verseTafsir => '節のタフスィール';

  @override
  String get tafsirOfTheDay => '今日のタフスィール';

  @override
  String get dailyInsight => '毎日の洞察';

  @override
  String get keyThemes => '主なテーマと教訓';

  @override
  String get readFullSurah => 'スーラ全文を読む';

  @override
  String get surahIntroduction => 'スーラの紹介';

  @override
  String get verses => '節';

  @override
  String get loadingTafsir => 'タフスィールを読み込み中...';

  @override
  String get keepAliveNotificationText => '礼拝通知が有効です';

  @override
  String get keepAliveChannelName => '礼拝通知';

  @override
  String get keepAliveChannelDescription =>
      'Noor Guardをバックグラウンドで有効にし、礼拝アラームを見逃さないようにします。';

  @override
  String get notifSetupTitle => 'ロック画面の通知を有効にする';

  @override
  String get notifSetupSubtitle => 'スマホがロックされていてもアザーンを見逃さないようにします。約1分で完了します。';

  @override
  String get notifSetupSamsungBanner =>
      'Samsung Galaxy（Fold/Flipを含む）をお使いですか？Samsungは標準のAndroidに加えて追加のスイッチを用意しています — 下のステップ4と6で、その場所を正確にご案内します。';

  @override
  String get notifSetupStep1Title => '通知を許可';

  @override
  String get notifSetupStep1Description =>
      'Noor Guardが何らかの通知を行うために必要な基本的な権限です。';

  @override
  String get notifSetupStep1Action => '通知を許可';

  @override
  String get notifSetupStep2Title => 'アラームとリマインダー';

  @override
  String get notifSetupStep2Description =>
      'スマホがアイドル状態や省電力モードでも、礼拝の正確な時間にアラームが鳴るようにします。';

  @override
  String get notifSetupStep2Action => 'アラーム設定を開く';

  @override
  String get notifSetupStep3Title => '他のアプリの上に表示';

  @override
  String get notifSetupStep3Description =>
      '礼拝のフル画面がロック画面や他に開いているものの上に表示されるようにします。';

  @override
  String get notifSetupStep3Action => '設定を開く';

  @override
  String get notifSetupStep4Title => 'ポップアップ／フルスクリーン通知として表示';

  @override
  String get notifSetupStep4Description =>
      'アザーン画面が無音バナーのままにならず、ロック画面を突き破って表示されるようにします。';

  @override
  String get notifSetupStep4SamsungNote =>
      'Samsung Galaxy端末（Fold/Flipを含む）の場合：設定を開く → 「Prayer Time Alarm」をタップ → 「Pop-up notification」をオンにします（Fold/Flipでは「Cover screen pop-up」と表示されます）。これはSamsung独自のスイッチで、これをオンにすることで初めてアザーン画面がロック画面の上に実際に表示されます。';

  @override
  String get notifSetupStep4Action => '通知設定を開く';

  @override
  String get notifSetupStep5Title => '通知を確実に届ける';

  @override
  String get notifSetupStep5Description =>
      'AndroidがバックグラウンドでNoor Guardの動作を遅らせたり止めたりしないようにし、礼拝アラームとリマインダーが常に時間通りに届くようにします。';

  @override
  String get notifSetupStep5Action => 'バッテリー最適化を無効にする';

  @override
  String get notifSetupStep6Title => 'スリープしないアプリ';

  @override
  String get notifSetupStep6Description =>
      'SamsungのバッテリーマネージャーはNoor Guardをスリープ状態にし、礼拝アラームを静かにブロックすることがあります。「Never sleeping apps」に追加することでこれを防ぎます。';

  @override
  String get notifSetupStep6SamsungNote =>
      '設定 → バッテリーとデバイスケア → バックグラウンド使用の制限 → Never sleeping apps → 「+」をタップ → Noor Guardを選択。';

  @override
  String get notifSetupStep6Action => 'バッテリー設定を開く';

  @override
  String get notifSetupStatusChecking => '確認中…';

  @override
  String get notifSetupStatusEnabled => '有効';

  @override
  String get notifSetupStatusNeeded => '必要';

  @override
  String get notifSetupStatusManual => '手動の手順';

  @override
  String get notifSetupContinueButton => 'Noor Guardへ進む';

  @override
  String get notifSetupLaterButton => '後で完了する';

  @override
  String get notifSetupDoneButton => '完了';

  @override
  String get testNotificationButton => 'テスト通知を送信（10秒）';

  @override
  String get testNotificationSnack => 'テスト通知は10秒後に届きます';

  @override
  String get testLockAlarmButton => 'フルスクリーンロックアラームをテスト（10秒）';

  @override
  String get testLockAlarmSnack => 'ロックアラームは10秒後に作動します。今すぐ画面をロックしてください';

  @override
  String get testAdhanForegroundButton => 'アプリ内でアザーンをテスト（フォアグラウンド）';

  @override
  String get testAdhanForegroundSnack => 'サイレントバナー付きで完全なアザーンを再生中';

  @override
  String get testRequiresNotificationsOn => 'これをテストするには、まず礼拝通知を有効にしてください';

  @override
  String get lockScreenSetupGuideButton => 'ロック画面アラート設定ガイド';

  @override
  String get couldNotOpenPrivacyPolicy => 'プライバシーポリシーを開けませんでした';

  @override
  String get couldNotOpenTermsOfService => '利用規約を開けませんでした';

  @override
  String get couldNotOpenEmailApp => 'メールアプリを開けませんでした';

  @override
  String get blockDurationLabel => 'ブロックの長さ';

  @override
  String get privacyAndTrust => 'プライバシーと信頼';

  @override
  String get noorGuardMotto => '「モスクにふさわしくないものは、\nNoor Guardにもふさわしくない。」';

  @override
  String get openingAppStore => 'App Storeを開いています…';

  @override
  String get openingShareSheet => '共有シートを開いています…';

  @override
  String get openingSupportEmail => 'サポートメールを開いています…';

  @override
  String get openingTermsOfService => '利用規約を開いています…';

  @override
  String get duration30Min => '30分';

  @override
  String get duration1Hour => '1時間';

  @override
  String get durationPrayerWindowOnly => '礼拝時間帯のみ';

  @override
  String get hoursAbbreviation => '時間';

  @override
  String get cancelTimerButton => 'タイマーを取り消す';

  @override
  String get custom => 'カスタム';

  @override
  String get customTimerMinutesTitle => 'カスタムタイマー（分）';

  @override
  String get customTimerHint => '例：20';

  @override
  String get cancel => 'キャンセル';

  @override
  String get start => '開始';

  @override
  String get travel => '旅行';

  @override
  String get anxietyAndStress => '不安とストレス';

  @override
  String get gratitude => '感謝';

  @override
  String get protection => '守護';

  @override
  String get family => '家族';

  @override
  String get forgiveness => '赦し';

  @override
  String get appBlockingSetupHeadline => 'あなたの時間を守り、礼拝を守る';

  @override
  String get appBlockingSetupBody =>
      'Noor Guardは、Androidのユーザー補助サービスを礼拝の時間にブロックしたアプリが開かれたことを検知するためだけに使用します。メッセージや写真、個人データを読み取ることは一切ありません。';

  @override
  String get appBlockingAccessibilityStatusOn => 'ユーザー補助のアクセスが許可されています';

  @override
  String get appBlockingAccessibilityStatusOff => 'ユーザー補助のアクセスが許可されていません';

  @override
  String get appBlockingOpenSettings => 'ユーザー補助の設定を開く';

  @override
  String get appBlockingSetupNotNow => '今はしない';

  @override
  String get appBlockingEnableToggle => 'アプリブロックを有効にする';

  @override
  String get appBlockingModeLabel => 'ブロックモード';

  @override
  String get appBlockingModeSoft => 'ソフト';

  @override
  String get appBlockingModeSoftDesc => '穏やかなリマインダーのみ — アプリは開けます';

  @override
  String get appBlockingModeFirm => 'ファーム';

  @override
  String get appBlockingModeFirmDesc => 'アプリをブロックし、簡単に回避できます';

  @override
  String get appBlockingModeHard => 'ハード';

  @override
  String get appBlockingModeHardDesc => '完全ブロック — 「礼拝しました」のみ解除可能';

  @override
  String get appBlockingSelectPrayersLabel => '次の礼拝の間ブロックする';

  @override
  String get appBlockingBufferBeforeLabel => '礼拝前に開始';

  @override
  String get appBlockingBufferAfterLabel => '礼拝後に解除';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count分';
  }

  @override
  String get appBlockingAppsTitle => 'ブロック中のアプリ';

  @override
  String get appBlockingSelectAppsButton => 'ブロックするアプリを選択';

  @override
  String get appBlockingSearchHint => 'インストール済みアプリを検索';

  @override
  String get appBlockingNoAppsSelected => 'まだアプリが選択されていません';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のアプリをブロック中',
      zero: 'ブロック中のアプリはありません',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'テスト';

  @override
  String get appBlockingTestDescription =>
      'このデバイスで正しく動作することを確認するため、アプリブロックを2分間有効にします。';

  @override
  String get appBlockingTestButton => 'アプリブロックをテスト（2分間）';

  @override
  String get appBlockingTestActiveSnackbar =>
      'アプリブロックが2分間有効です — ブロック対象のアプリを開いてみてください';

  @override
  String get appBlockingPermissionNeeded => 'ブロックを始めるにはユーザー補助のアクセスを有効にしてください';

  @override
  String get appBlockingIosComingSoonTitle => 'スクリーンタイムへのアクセス — 近日公開';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOSでのアプリブロックにはAppleのスクリーンタイム許可が必要で、現在準備中です。準備が整ったらお知らせします。';

  @override
  String get appBlockingHeadline1 => '礼拝の時間です';

  @override
  String get appBlockingHeadline2 => 'あなたの時間を守る';

  @override
  String get appBlockingDefaultTitle => '礼拝の時間';

  @override
  String get appBlockingIPrayedButton => '礼拝しました';

  @override
  String get appBlockingReadAyahsButton => 'アーヤを3つ読む';

  @override
  String get appBlockingEmergencyBypass => '緊急回避';

  @override
  String get appBlockingSkipForNow => '今はスキップ';

  @override
  String get appBlockingBypassConfirmTitle => '連続記録を終了しますか？';

  @override
  String get appBlockingBypassConfirmBody =>
      '今回避すると礼拝の連続記録がリセットされます。本当の緊急事態であれば、続行できます。';

  @override
  String get appBlockingBypassConfirmContinue => 'それでも回避する';

  @override
  String get appBlockingBypassConfirmCancel => '戻る';

  @override
  String get appBlockingSoftReminderTitle => '穏やかなリマインダー';

  @override
  String get appBlockingSoftReminderBody => '礼拝の時間です — 少し離れることを考えてみましょう。';

  @override
  String get quranChallengeBannerTitle => '解除するにはアーヤを3つ読んでください';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$total節中$count節を読みました';
  }

  @override
  String get quranChallengeComplete => 'よくできました — アプリがロック解除されました';

  @override
  String get focusBlockHeadline1 => '集中を続けましょう';

  @override
  String get focusBlockHeadline2 => 'そのまま続けて';

  @override
  String get endFocusSessionButton => '集中セッションを終了';

  @override
  String get focusPaused => '礼拝のため一時停止中';

  @override
  String get selectLocationTitle => '場所を選択';

  @override
  String get useCurrentLocation => '現在の場所を使用';

  @override
  String get savedLocationsHeader => '保存した場所';

  @override
  String get noSavedLocationsYet => '保存された場所はまだありません。下で検索して追加してください。';

  @override
  String get searchCityHint => '都市名を検索…';

  @override
  String get addLocationTooltip => '場所を追加';

  @override
  String get deleteLocationTooltip => '場所を削除';

  @override
  String get locationNotFound => '場所が見つかりません。別の検索を試してください。';

  @override
  String maxLocationsReachedMessage(int max) {
    return '最大$max件の場所を保存できます';
  }

  @override
  String get notificationsToggleUnconfirmed => '変更を確認できませんでした — もう一度お試しください';

  @override
  String get tasbihCounter => 'タスビーカウンター';

  @override
  String get tasbihCounterSubtitle => 'ズィクルを数える';

  @override
  String get tasbihResetButton => 'リセット';

  @override
  String get tasbihTotalLabel => '合計';

  @override
  String get tasbihCelebrationTitle => 'タスビー完了！';

  @override
  String get tasbihCelebrationBody =>
      '99回のズィクルを完了しました。アッラーがあなたの念誦を受け入れてくださいますように。';

  @override
  String get tasbihStartNewSession => '新しいセッションを開始';

  @override
  String get tasbihUndoButton => '元に戻す';

  @override
  String get tasbihTapAnywhereHint => '画面のどこをタップしてもカウントされます';

  @override
  String get tasbihSoundToggleTooltip => 'タップ音';

  @override
  String get tasbihManageDhikrTooltip => 'ズィクルを管理';

  @override
  String get tasbihStatsTooltip => '統計を見る';

  @override
  String get tasbihDailyTotalLabel => '今日の合計';

  @override
  String get tasbihRoundsTodayLabel => '今日の回数';

  @override
  String get tasbihManageDhikrTitle => 'ズィクルの管理';

  @override
  String get tasbihAddCustomDhikrButton => 'カスタムズィクルを追加';

  @override
  String get tasbihDeleteDhikrTooltip => '削除';

  @override
  String get tasbihBuiltInDhikrBadge => '組み込み';

  @override
  String get tasbihCannotDeleteLastDhikr => '少なくとも1つのズィクルが必要です';

  @override
  String get tasbihDhikrNameLabel => '名前';

  @override
  String get tasbihDhikrNameHint => '例：アスタグフィルッラー';

  @override
  String get tasbihDhikrArabicLabel => 'アラビア語（任意）';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => '名前を入力してください';

  @override
  String get tasbihSaveDhikrButton => '保存';

  @override
  String get tasbihStatsTitle => 'タスビーフ統計';

  @override
  String get tasbihAllTimeTotalLabel => '全期間の合計';

  @override
  String get tasbihNoActivityYetMessage => 'カウントを始めると、ここに統計が表示されます。';

  @override
  String get tasbihSoundPickerTitle => 'タップ音';

  @override
  String get tasbihSoundClassicClick => 'クラシッククリック';

  @override
  String get tasbihSoundSoftChime => 'ソフトチャイム';

  @override
  String get tasbihSoundStoneTap => '石のタップ音';

  @override
  String get tasbihCurrentlyReciting => '現在唱えている';

  @override
  String tasbihOfTarget(int target) {
    return '／$target';
  }

  @override
  String get tasbihSoundRainDrop => '雨だれ';

  @override
  String get tasbihSoundSoftFeather => 'やわらかな羽';

  @override
  String noAyahsFound(String query) {
    return '「$query」の節が見つかりませんでした';
  }

  @override
  String get trySearchingQuran => '日本語、英語、またはアラビア語で検索するか、イスラームの用語を使用してください：';

  @override
  String get loadingQuranIndex => 'クルアーンの索引を読み込み中…';

  @override
  String get quranSearchSuggestions =>
      '忍耐, サブル, 慈悲, 礼拝, 神への神之, 許し, タウバ, 天国, ジャンナ, 知識';

  @override
  String get heroVerse1 => '礼拝を守りなさい、特に中間の礼拝を。';

  @override
  String get heroVerse2 => 'まことに礼拝は、信者たちに時刻を定めた義務とされている。';

  @override
  String get heroVerse3 => '忍耐と礼拝によって助けを求めなさい。';

  @override
  String get heroVerse4 =>
      'それゆえ、あなたがたは私を念じなさい、私はあなたがたを念じよう。そして私に感謝し、私を拒絶してはならない。';

  @override
  String get heroVerse5 => 'アッラーに信頼する者は、アッラーが彼に十分である。';

  @override
  String get heroVerse6 => 'まことに人々のために最初に建てられた家は、マッカにある家であり、祝福され、世界の人々への指針である。';

  @override
  String get heroVerse7 => 'まことに礼拝は醜行と悪事を禁ずる、そしてアッラーを念じることはより偉大である。';

  @override
  String get heroVerse8 => 'まことにアッラーを念じることによってのみ、心は安らぎを得る。';

  @override
  String get heroVerse9 => '私に祈りなさい、私はあなたがたに答えよう。';

  @override
  String get heroVerse10 => 'もしあなたがたが感謝するなら、必ず恵みを増し加える。';

  @override
  String get heroVerse11 => 'アッラーはいかなる魂にもその能力以上を課せられない。';

  @override
  String get heroVerse12 => 'まことにアッラーは忍耐強い者たちと共にある。';

  @override
  String get heroVerse13 => '私の慈悲はすべてのものを包んでいる。';

  @override
  String get heroVerse14 => '善を行いなさい、まことにアッラーは善を行う者を愛する。';

  @override
  String get heroVerse15 => 'これは疑いのない書物であり、アッラーを畏れる人々への指針である。';

  @override
  String get accuracyHigh => '高精度';

  @override
  String get accuracyMedium => '中程度の精度';

  @override
  String get accuracyLow => '低精度';

  @override
  String get accuracyCalibrating => 'キャリブレーション中…';

  @override
  String get compassNeedsCalibration => 'コンパスのキャリブレーションが必要です';

  @override
  String get compassCalibrationHint => '精度を向上させるには、スマートフォンをゆっくりと8の字に動かしてください。';

  @override
  String get spiritLevelLabel => '水準器';

  @override
  String get spiritLevelLevelText => '✓  水平';

  @override
  String get spiritLevelTiltText => '傾けて水平に';

  @override
  String get compassNorth => '北';

  @override
  String get compassEast => '東';

  @override
  String get compassSouth => '南';

  @override
  String get compassWest => '西';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => '時間を守れ。礼拝を大切に。';

  @override
  String get stopAdhan => 'アザーンを停止';

  @override
  String get duasSearchEmpty => '別のカテゴリまたは検索キーワードを試してください。';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingWelcomeTo => 'へようこそ';

  @override
  String get onboardingSubtitle => 'イスラムの美しい旅の伴侶。';

  @override
  String get onboardingLetsGetStarted => 'はじめましょう';

  @override
  String onboardingStepOf(int step, int total) {
    return '$totalのうち$step';
  }

  @override
  String get onboardingWhatsYourName => 'お名前は？';

  @override
  String get onboardingNameSubtitle => 'あなたのことをどう呼べばいいか教えてください。';

  @override
  String get onboardingNameHint => '名前を入力してください';

  @override
  String get onboardingContinue => '続ける';

  @override
  String get onboardingAreYouNewToIslam => 'イスラムは初めてですか？';

  @override
  String get onboardingModeSubtitle => 'あなたの旅に基づいて体験をカスタマイズします。';

  @override
  String get onboardingNewToIslam => 'イスラムは初めてです';

  @override
  String get onboardingNewToIslamDesc => 'ステップバイステップのガイダンス付き初心者モード';

  @override
  String get onboardingFamiliarWithIslam => 'イスラムをよく知っています';

  @override
  String get onboardingFamiliarWithIslamDesc => 'すべての機能を備えた通常モード';

  @override
  String greetingWithName(String name) {
    return 'アッサラーム・アライクム、$name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'イスラム教徒になって$days日目';
  }

  @override
  String get beginnerEssential1 => '新しいムスリムのガイド';

  @override
  String get beginnerEssential2 => 'ウドゥー（清めの作法）を学ぶ';

  @override
  String get beginnerEssential3 => '礼拝の方法（ステップバイステップ）';

  @override
  String get beginnerEssential4 => 'アル＝ファーティハ章（開端の章）';

  @override
  String get beginnerEssential5 => '日々のドゥア（祈り）';

  @override
  String get beginnerEssential6 => 'シャハーダを理解する';

  @override
  String get beginnerEssential7 => 'イスラムの用語とグロッサリー';

  @override
  String get beginnerExploreAll => 'すべての機能を探索する';

  @override
  String get beginnerExploreSubtitle => '完全なNoor Guardの体験に切り替える';

  @override
  String get beginnerExploreFeaturesSubtitle => 'Noor Guardのすべての機能';

  @override
  String get beginnerLearnSalah => 'サラーを学ぶ';

  @override
  String get beginnerMayAllahGuide => 'アッラーがあなたの歩みを導き、旅を祝福されますように。';

  @override
  String get beginnerMuslimEssentials => 'ムスリムの基礎';

  @override
  String get beginnerQuote1 => '困難の後には必ず安らぎが来る。 — クルアーン94:6';

  @override
  String get beginnerQuote2 => 'アッラーの命令を守れば、アッラーはあなたを守ってくださる。';

  @override
  String get beginnerQuote3 => 'アッラーはあなたの外見ではなく、心と行いを見ておられる。';

  @override
  String get beginnerQuote4 => '礼拝に向かう一歩一歩が、平和への一歩である。';

  @override
  String get beginnerQuote5 => 'あなたたちの中で最も優れた者は、クルアーンを学びそれを教える者である。';

  @override
  String get beginnerTapToSetShahadaDate => 'シャハーダの日付を設定するにはタップしてください';

  @override
  String get beginnerToolboxSection => '初心者ツールボックス';

  @override
  String get beginnerYourJourney => 'あなたの旅';

  @override
  String get journeyMonth1Name => '第1ヶ月：基礎';

  @override
  String get journeyMonth2Name => '第2ヶ月：習慣を作る';

  @override
  String get journeyMonth3Name => '第3ヶ月：信仰を深める';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total 完了';
  }

  @override
  String get journeyViewFull => '旅程の全体を見る →';

  @override
  String get journeyTask2_1 => '7日間すべての5つの礼拝を行う';

  @override
  String get journeyTask2_2 => 'さらに10のドゥアを学ぶ';

  @override
  String get journeyTask2_3 => 'コーランの最初のジュズを読む';

  @override
  String get journeyTask2_4 => 'アッラーの99の御名を学ぶ';

  @override
  String get journeyTask2_5 => '7日間毎日タスビーフカウンターを使う';

  @override
  String get journeyTask2_6 => 'スンナ礼拝を学ぶ';

  @override
  String get journeyTask2_7 => '地元のマスジドを見つける';

  @override
  String get journeyTask3_1 => 'スーラ・バカラを読む';

  @override
  String get journeyTask3_2 => 'ザカートについて学ぶ';

  @override
  String get journeyTask3_3 => '断食（サウム）について学ぶ';

  @override
  String get journeyTask3_4 => '3つの新しいスーラを暗記する';

  @override
  String get journeyTask3_5 => 'ハッジについて学ぶ';

  @override
  String get journeyTask3_6 => '誰かにイスラームを伝える';

  @override
  String get journeyTask3_7 => 'イスラーム用語集を完成させる';

  @override
  String get journeyTimelineTitle => '私の旅';

  @override
  String get journeyCompleted => '完了';

  @override
  String get journeyInProgress => '進行中';

  @override
  String get journeyLocked => 'ロック中';

  @override
  String get wuduThreeTimes => '3回';

  @override
  String get wuduDuaBefore => 'ウドゥー前のドゥアー';

  @override
  String get wuduDuaAfter => 'ウドゥー後のドゥアー';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'アッラーのみ名において';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'アッラーのほか礼拝に値する神はなく、アッラーはひとりであり、パートナーがないことを証言します。ムハンマドはアッラーの僕であり使徒であることを証言します。アッラーよ、私を悔悟者のなかに、そして身を清める者のなかに入れてください。';

  @override
  String get wuduCompleteButton => 'ウドゥーを完了しました';

  @override
  String get howToPrayStepOpeningDua => '開始のドゥア';

  @override
  String get howToPrayStepAlFatiha => 'スーラ・アル＝ファーティハ';

  @override
  String get howToPrayStepSurah => '短いスーラ';

  @override
  String get howToPrayStepTashahhudShort => 'タシャッフド（中間の着席）';

  @override
  String get howToPrayStepSalawat => '預言者 ﷺ への祝福';

  @override
  String get howToPrayTransTakbir => 'アッラーは最も偉大なり';

  @override
  String get howToPrayTransOpeningDua =>
      'アッラーよ、あなたを讃えます。あなたの御名は祝福され、あなたの威厳は崇高であり、あなた以外に神はいません。';

  @override
  String get howToPrayTransFatiha =>
      '慈悲深く慈愛あまねきアッラーの御名において。全ての賞賛は世界の主、アッラーに属す。慈悲深く慈愛あまねき主。審判の日の主。我らはあなたのみを礼拝し、あなたのみに助けを求めます。我らを正しい道へ導いてください――あなたが恵みを与えた人々の道へ、怒りを受けた人々の道でも、迷い人の道でもなく。';

  @override
  String get howToPrayTransRuku => '偉大なる我が主を讃えます';

  @override
  String get howToPrayTransItidal => 'アッラーは彼を讃える者の声を聞く。我らの主よ、称賛はあなたのみに。';

  @override
  String get howToPrayTransSujood => '最高なる我が主を讃えます';

  @override
  String get howToPrayTransJalsa => '主よ、我を赦したまえ';

  @override
  String get howToPrayTransTashahhud =>
      '全ての挨拶、祈り、良い言葉はアッラーに属します。預言者よ、あなたに平安と神の慈悲と祝福があらんことを。我らとアッラーの敬虔な僕たちに平安があらんことを。アッラーの他に神はなく、ムハンマドはその僕と使徒であることを証言します。';

  @override
  String get howToPrayTransSalawat =>
      'アッラーよ、ムハンマドとムハンマドの家族に恩寵を与えてください。あなたがイブラヒームとその家族に恩寵を与えたように。あなたは誠に讃えられ、栄光に満ちています。アッラーよ、ムハンマドとその家族を祝福してください。イブラヒームとその家族を祝福されたように。あなたは誠に讃えられ、栄光に満ちています。';

  @override
  String get howToPrayTransTasleem => 'あなたがたに平安とアッラーの慈悲があらんことを';

  @override
  String get howToPrayOpeningDuaInstruction =>
      '開始のタクビールの直後に静かにこのドゥアを唱えます。礼拝の最初に一度だけ唱えます。';

  @override
  String get howToPraySurahInstruction =>
      'ファーティハの後、暗記したスーラを唱えます。スーラ・イフラース（上記）は初心者に最適で、最初の2ラクアのみに唱えます。';

  @override
  String get howToPrayItidalInstruction =>
      '起き上がりながら「サミア・アッラーフ」を唱え、完全に直立してから「ラッバナー・ワ・ラカル・ハムド」を唱えます。';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      '第2ラクアの後に座ります。シャハーダを唱えるときに右人差し指を上げます。3・4ラクアの礼拝では、この後また立ち上がります。';

  @override
  String get howToPraySalawatInstruction =>
      '最後のタシャッフドの直後、最後の着席のみで、タスリームの前にサラワートを唱えます。';

  @override
  String get howToPrayTasleemInstruction =>
      '頭を右に向けてタスリームを唱え、次に左に向けて繰り返します。礼拝が完了しました。';

  @override
  String get howToPrayOnceOpens => '一度だけ — 礼拝を開始する';

  @override
  String get howToPraySayAllahuAkbar => '唱える：アッラーフ・アクバル';

  @override
  String get howToPrayFirstRakahOnly => '第1ラクアのみ';

  @override
  String get howToPrayFirst2RakahsOnly => '最初の2ラクアのみ';

  @override
  String get howToPrayEveryRakah => '全ラクア';

  @override
  String get howToPrayAfter2ndRakah => '第2ラクア後';

  @override
  String get howToPrayFinalSittingOnly => '最後の着席のみ';

  @override
  String get howToPrayClosesThePrayer => '礼拝を締めくくる';

  @override
  String get howToPraySectionBefore => '礼拝前';

  @override
  String get howToPraySectionRakah => 'ラクア';

  @override
  String get howToPraySectionMiddleSitting => '中間の着席';

  @override
  String get howToPraySectionFinalSitting => '最後の着席';

  @override
  String get howToPrayRakahLabel => 'ラクア';

  @override
  String get howToPrayCompleteButton => '礼拝を終えました';

  @override
  String get howToPrayMashaallah => 'マーシャー・アッラー！';

  @override
  String get howToPrayAccepted => 'アッラーが礼拝をお受けくださいますように。';

  @override
  String get fatihaIntroTitle => 'クルアーンの母';

  @override
  String get fatihaIntroBody =>
      'スーラ・アル=ファーティハはクルアーンで最も偉大なスーラです。礼拝の各単位で朗誦されます — 毎日少なくとも17回。それはしもべとアッラーとの完全な会話であり、すべての礼拝への入口です。';

  @override
  String get fatihaIntroIbnKathir =>
      'イブン・カスィールは書いています：「アル=ファーティハにはクルアーン全体の本質が含まれています — それは祈り、僕従の宣言、そして正しい道への導きの求めです。」— タフスィール・イブン・カスィール';

  @override
  String get shahadaScreenTitle => 'シャハーダ';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      '私はアッラーの他に神はいないと証言します。そして私はムハンマドはアッラーの使徒であると証言します';

  @override
  String get shahadaWordBreakdownTitle => '一語ずつ';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => '存在しない';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => '神 / 神性';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => '以外';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'アッラー（唯一の神）';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Muḥammadun';

  @override
  String get shahadaWord5Meaning => 'ムハンマド';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Rasūlu';

  @override
  String get shahadaWord6Meaning => '使徒 / 預言者';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'アッラーの';

  @override
  String get shahadaMeaningTitle => '意味と重要性';

  @override
  String get shahadaMeaningBody =>
      'シャハーダはイスラムの基盤を形成する信仰の宣言です。これは五つの柱の最初のものです。誠実な確信を持ってこれらの言葉を語ることで、人はイスラムに入ります。イブン・カスィールは、最初の部分が全ての偽りの神々を否定し、アッラーの絶対的な唯一性を確認すると説明しています。';

  @override
  String get shahadaMomentTitle => 'シャハーダの瞬間';

  @override
  String get shahadaMomentBody =>
      '人がシャハーダを初めて真の信仰を持って唱えると、深いことが起こります — 彼らは新しい人生を始めます。預言者ﷺは言いました：「アッラーの他に神はないと言い、それ以外に崇拝されるものを信じない者は、その財産と血は守られる。」（サヒーフ・ムスリム）。過去の全ての罪が許されます。イスラムへようこそ。';

  @override
  String get shahadaPronunciationTitle => '発音ガイド';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'ステップバイステップガイド';

  @override
  String get toolboxWuduSubtitle => '礼拝前の清め';

  @override
  String get toolboxGlossarySubtitle => '114のイスラーム用語解説';

  @override
  String get shareSheetTitle => 'シェア';

  @override
  String get shareAnAyah => 'アーヤをシェア';

  @override
  String get shareADua => 'ドゥアーをシェア';

  @override
  String get shareANameOfAllah => 'アッラーのお名前をシェア';

  @override
  String get shareAHadith => 'ハディースをシェア';

  @override
  String get shareViaLabel => 'Noor Guard でシェア';

  @override
  String get shareCardAyahLabel => '✦ 今日のアーヤ';

  @override
  String get shareCardDuaLabel => '✦ ドゥアー';

  @override
  String get shareCardNameLabel => '✦ アッラーのお名前';

  @override
  String get shareCardHadithLabel => '✦ ハディース';

  @override
  String get sharePickDuaTitle => 'シェアするドゥアーを選んでください';

  @override
  String get shareError => 'シェア画像を作成できませんでした';

  @override
  String get shareCardVerseLabel => '✦ クルアーン節';

  @override
  String get shareCardAsmaLabel => '✦ アッラーの99の御名';

  @override
  String get shareAyahSubtitle => '30のクルアーンの節から選択';

  @override
  String get shareDuaSubtitle => 'ライブラリから選択';

  @override
  String get shareNameSubtitle => '全99の美しい名前から選択';

  @override
  String get shareHadithSubtitle => '20のハディースから選択';

  @override
  String get shareThisDua => 'このドゥアーをシェア';

  @override
  String get sharePickAyahTitle => 'シェアするアーヤを選択';

  @override
  String get searchAyahs => 'アーヤを検索…';

  @override
  String get noAyahsFoundShort => 'アーヤが見つかりません';

  @override
  String get shareThisAyah => 'このアーヤをシェア';

  @override
  String get sharePickNameTitle => 'シェアする名前を選択';

  @override
  String get shareThisName => 'この名前をシェア';

  @override
  String get sharePickHadithTitle => 'シェアするハディースを選択';

  @override
  String get searchHadiths => 'ハディースを検索…';

  @override
  String get noHadithsFound => 'ハディースが見つかりません';

  @override
  String get shareThisHadith => 'このハディースをシェア';

  @override
  String get backToBasics => '基礎に戻る';

  @override
  String get backToBasicsSubtitle => 'イスラムの基本事項ガイド';

  @override
  String get fivePillarsOfIslam => 'イスラムの五行';

  @override
  String get fivePillarsShort => '五行';

  @override
  String get fivePillarsSubtitle => 'イスラム信仰の基盤';

  @override
  String get pillarLearnMore => '詳しく見る';

  @override
  String get pillarShowLess => '閉じる';

  @override
  String get pillarsShowDetails => '詳細を表示';

  @override
  String get pillarsHideDetails => '詳細を非表示';

  @override
  String get pillar1Name => 'シャハーダ';

  @override
  String get pillar1Desc => '信仰の証言';

  @override
  String get pillar1Detail =>
      '信仰告白はイスラームの基盤です。「アッラーの他に神はなく、ムハンマドはアッラーの使徒である」と誠心誠意唱えることで、その人はイスラームに入ります。';

  @override
  String get pillar2Name => 'サラート';

  @override
  String get pillar2Desc => '1日5回の礼拝';

  @override
  String get pillar2Detail =>
      '1日5回の礼拝はムスリムとアッラーとの直接のつながりです。夜明け、正午、午後、日没、夜に行われ、ムスリムの一日全体をアッラーへの想念で満たします。';

  @override
  String get pillar3Name => 'ザカート';

  @override
  String get pillar3Desc => '義務的な喜捨';

  @override
  String get pillar3Detail =>
      'ザカートは、貯蓄の2.5%を困窮者に毎年納める義務的な喜捨です。財産を清め、ムスリムコミュニティの絆を深めます。';

  @override
  String get pillar4Name => 'サウム';

  @override
  String get pillar4Desc => 'ラマダーン月の断食';

  @override
  String get pillar4Detail =>
      '祝福されたラマダン月に夜明けから日没まで断食します。ムスリムは食事・飲み物・罪を断ち、タクワー（神への畏敬）と感謝を育みます。';

  @override
  String get pillar5Name => 'ハッジ';

  @override
  String get pillar5Desc => 'メッカへの巡礼';

  @override
  String get pillar5Detail =>
      'メッカへの巡礼は、身体的・経済的に可能なすべてのムスリムにとって生涯に一度の義務です。地球上で最大の年次人類集会でもあります。';

  @override
  String get switchedToNewMuslimMode => '新しいムスリムモードに切り替えました';

  @override
  String get switchedToRegularMode => '通常モードに切り替えました';

  @override
  String get liveNotifChannelName => 'Noor Guard ライブ';

  @override
  String get liveNotifChannelDescription => 'ロック画面に礼拝カウントダウンと毎日のイスラーム・コンテンツを表示';

  @override
  String get liveNotifHeaderAyah => '今日のアーヤ';

  @override
  String get liveNotifHeaderDua => '今日のドゥアー';

  @override
  String get liveNotifHeaderWord => '今日の言葉';

  @override
  String get liveNotifHeaderName => 'アッラーの御名';

  @override
  String get liveNotifHeaderHadith => '今日のハディース';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'あと$hours時間$minutes分';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'あと$minutes分';
  }

  @override
  String get liveNotifCountdownNow => '礼拝の時間です';

  @override
  String get savedDuas => '保存したドゥアー';

  @override
  String get savedVerses => '保存した節';

  @override
  String get savedNames => '保存した御名';

  @override
  String get noSavedDuas => '保存したドゥアーはまだありません';

  @override
  String get noSavedVerses => '保存した節はまだありません';

  @override
  String get noSavedNames => '保存した御名はまだありません';

  @override
  String get heroVerse16 => '我らの主よ、私たちが忘れたり過ちを犯したりしても、咎めないでください。';

  @override
  String get heroVerse17 => 'アッラーは私たちに十分な方。何と優れた守護者であろう。';

  @override
  String get heroVerse18 => '信仰する者たちよ、アッラーとその使徒を信じなさい。';

  @override
  String get heroVerse19 => '信仰する者たちよ、アッラーを畏れ、彼に近づく道を求めなさい。';

  @override
  String get heroVerse20 => 'まことに私の礼拝も犠牲も、生も死も、万有の主アッラーのためのもの。';

  @override
  String get heroVerse21 => '現世と来世において私たちに善を定めてください。私たちはあなたに立ち返りました。';

  @override
  String get heroVerse22 => 'アッラーを多く念じなさい。そうすればあなたたちは成功するであろう。';

  @override
  String get heroVerse23 => 'アッラーが私たちに定められたこと以外、何も私たちに降りかからない。彼こそ私たちの守護者。';

  @override
  String get heroVerse24 => 'まことに、アッラーの友には恐れもなく、悲しむこともない。';

  @override
  String get heroVerse25 => '私の成功はただアッラーによるもの。彼に頼り、彼にこそ立ち返る。';

  @override
  String get heroVerse26 => 'アッラーの慈悲に絶望してはならない。';

  @override
  String get heroVerse27 => '信仰し、アッラーを念じることで心の安らぎを得る者たち。';

  @override
  String get heroVerse28 => 'あなたたちの主が宣言されたとき：感謝するなら、必ずもっと多くを与えよう。';

  @override
  String get heroVerse29 => '確実なものが訪れるまで、あなたの主を崇拝しなさい。';

  @override
  String get heroVerse30 => 'まことにアッラーは、主を畏れる者と善を行う者と共におられる。';

  @override
  String get focusButtonSubtitle => '大切なことのために時間を守りましょう';

  @override
  String get ourStories => '私たちのストーリー';

  @override
  String get storiesSeeAll => 'すべて見る';

  @override
  String get storiesReadMore => '続きを読む';

  @override
  String get storiesFeaturedLabel => '注目のストーリー';

  @override
  String get storiesFilterReverts => '改宗者';

  @override
  String get storyCategoryRevert => '改宗者';

  @override
  String get storyCategoryBornMuslim => '生まれつきのムスリム';

  @override
  String get storyCategoryReturning => '回帰者';

  @override
  String get storiesShareYours => 'あなたの物語を';

  @override
  String get storiesEmptyTitle => 'まだストーリーがありません';

  @override
  String get storiesEmptySubtitle => '最初にあなたの歩みを共有しましょう';

  @override
  String storyShahadaDate(Object date) {
    return 'シャハーダ：$date';
  }

  @override
  String get storiesComments => 'コメント';

  @override
  String get storiesAddComment => 'コメントを追加…';

  @override
  String get storiesAnonymous => '匿名';

  @override
  String get storiesNameLabel => 'お名前';

  @override
  String get storiesPostAnonymously => '匿名で投稿';

  @override
  String get storiesCountryLabel => '国';

  @override
  String get storiesCategoryLabel => 'カテゴリー';

  @override
  String get storiesShahadaDateLabel => 'シャハーダの日付（任意）';

  @override
  String get storiesYourStoryLabel => 'あなたのストーリー';

  @override
  String get storiesStoryHint => 'あなたの歩みを聞かせてください…';

  @override
  String get storiesChooseBackground => '背景を選ぶ';

  @override
  String get storiesBackgroundNone => 'なし';

  @override
  String get storiesEditTitle => 'ストーリーを編集';

  @override
  String get storiesSaveChanges => '変更を保存';

  @override
  String get storiesUpdated => 'ストーリーが更新されました';

  @override
  String get storiesUploadPhoto => '写真をアップロード（任意）';

  @override
  String get storiesChangePhoto => '写真を変更';

  @override
  String get storiesSubmitButton => '送信';

  @override
  String get storiesSubmitted => 'ジャザーカッラー・ハイル！ストーリーは審査のため送信されました。';

  @override
  String get storiesSubmitError => 'エラーが発生しました。もう一度お試しください。';

  @override
  String get storiesFillRequired => 'ストーリーと国を入力してください。';

  @override
  String get storiesShareCardLabel => 'コミュニティストーリー';

  @override
  String get storiesPreviewLabel => 'プレビュー';

  @override
  String get storiesPendingReview => '審査中';

  @override
  String get storiesFilterSaved => '保存済み';

  @override
  String get storiesSavedEmpty => '保存されたストーリーはまだありません';

  @override
  String get storiesSearchCountryHint => '国を検索…';

  @override
  String get storiesChooseAvatar => 'アバターを選択';

  @override
  String get storiesAvatarInitials => 'イニシャル';

  @override
  String get storiesAvatarIcon => 'アイコン';

  @override
  String get storiesAvatarPattern => 'パターン';

  @override
  String get storiesLoadError => 'ストーリーを読み込めませんでした。接続を確認してください。';

  @override
  String get storiesDiscardTitle => 'ストーリーを破棄しますか？';

  @override
  String get storiesDiscard => '破棄';

  @override
  String get storiesKeepWriting => '書き続ける';

  @override
  String get storiesSaveDraft => '下書きを保存';

  @override
  String get storiesDraftSaved => '下書きを保存しました';

  @override
  String get storiesDeleteDraft => '下書きを削除';

  @override
  String get storiesContinueDraft => '下書きの続きから';

  @override
  String get storiesStartFresh => '最初からやり直す';

  @override
  String get shareCardGlossaryLabel => '✦ イスラム用語集';

  @override
  String get shareCardTafsirLabel => '✦ タフスィール';

  @override
  String shareCardAyahRef(String number) {
    return '第$number節';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 ファジュルの時間です';

  @override
  String get prayerReminderTitleDhuhr => '☀️ ズフルの時間です';

  @override
  String get prayerReminderTitleAsr => '🌤️ アスルの時間です';

  @override
  String get prayerReminderTitleMaghrib => '🌅 マグリブの時間です';

  @override
  String get prayerReminderTitleIsha => '🌙 イシャーの時間です';

  @override
  String get prayerReminderBodyFajr => '起きて礼拝しましょう。アッラーのために目覚める者には報奨があります。';

  @override
  String get prayerReminderBodyDhuhr => 'アッラーのためにひとときを。ズフルの礼拝が待っています。';

  @override
  String get prayerReminderBodyAsr => '中間の礼拝です。大切に守りましょう。— 雌牛章 2:238';

  @override
  String get prayerReminderBodyMaghrib => '日が沈みました。アッラーの呼びかけに応えましょう。';

  @override
  String get prayerReminderBodyIsha => '一日をアッラーとともに締めくくりましょう。夜の礼拝が待っています。';

  @override
  String get prayerAlarmMessageFajr => '起きて礼拝しましょう。アッラーのために目覚める者には報奨があります。';

  @override
  String get prayerAlarmMessageDhuhr => 'アッラーのためにひとときを。ズフルの礼拝が待っています。';

  @override
  String get prayerAlarmMessageAsr => '中間の礼拝を大切に守りましょう。— 雌牛章 2:238';

  @override
  String get prayerAlarmMessageMaghrib => '日が沈みました。アッラーの呼びかけに応えましょう。';

  @override
  String get prayerAlarmMessageIsha => '一日をアッラーとともに締めくくりましょう。夜の礼拝が待っています。';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayerまであと15分';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return '$prayerの礼拝に備えましょう';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return '$prayerの礼拝の時間です';
  }

  @override
  String get testNotificationTitle => '🔔 テスト通知';

  @override
  String get testNotificationBody => '通知は正常に動作しています！';

  @override
  String get favoriteRecitersSection => 'お気に入り';

  @override
  String get favoriteRecitersLimit => 'お気に入りの朗誦者は3人までです。追加するには1人削除してください。';

  @override
  String get findQiblaDirection => 'キブラの方角を調べる';

  @override
  String get storyMenuShare => 'シェア';

  @override
  String get storyMenuBookmark => 'ブックマーク';

  @override
  String get storyMenuReport => '報告';

  @override
  String get reportSheetTitle => 'このストーリーを報告';

  @override
  String get reportSheetSubtitle => 'Noor Guard の安全を守るためにご協力ください';

  @override
  String get reportReasonInappropriate => '不適切なコンテンツ';

  @override
  String get reportReasonSpam => 'スパム';

  @override
  String get reportReasonHateSpeech => 'ヘイトスピーチ';

  @override
  String get reportReasonOther => 'その他';

  @override
  String get reportSubmit => '報告を送信';

  @override
  String get reportThankYou => 'ジャザーカッラー・ハイル — ご報告ありがとうございます';

  @override
  String get adminMode => '管理者モード';

  @override
  String get adminTitle => '管理者';

  @override
  String get adminTabPending => '審査待ちのストーリー';

  @override
  String get adminTabReported => '報告されたストーリー';

  @override
  String get adminApprove => '承認';

  @override
  String get adminReject => '却下';

  @override
  String get adminDeleteStory => 'ストーリーを削除';

  @override
  String get adminDismiss => '対応済みにする';

  @override
  String get adminEmptyPending => '審査待ちのストーリーはありません';

  @override
  String get adminEmptyReports => '未対応の報告はありません';

  @override
  String get locating => '位置情報を取得中...';

  @override
  String get prayerBegunTitleFajr => '🕌 ファジュルの時間になりました';

  @override
  String get prayerBegunTitleDhuhr => '☀️ ズフルの時間になりました';

  @override
  String get prayerBegunTitleAsr => '🌤️ アスルの時間になりました';

  @override
  String get prayerBegunTitleMaghrib => '🌅 マグリブの時間になりました';

  @override
  String get prayerBegunTitleIsha => '🌙 イシャーの時間になりました';

  @override
  String get noCitiesFound => '都市が見つかりません';
}
