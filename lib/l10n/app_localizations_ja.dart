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
  String get lockScreenSetupGuideButton => 'ロック画面アラート設定ガイド';

  @override
  String get couldNotOpenPrivacyPolicy => 'プライバシーポリシーを開けませんでした';

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
  String get appBlockingIPrayedButton => '礼拝しました';

  @override
  String get appBlockingReadAyahsButton => 'アーヤを3つ読む';

  @override
  String get appBlockingEmergencyBypass => '緊急回避';

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
}
