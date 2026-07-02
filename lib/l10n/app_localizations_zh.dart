// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => '愿主赐你平安';

  @override
  String get mayAllahBlessYourDay => '愿安拉赐福你的一天';

  @override
  String get nextPrayer => '下一次礼拜';

  @override
  String get iPrayedButton => '我已礼拜';

  @override
  String get todaysPrayers => '今日礼拜';

  @override
  String get qibla => '朝向（克尔白）';

  @override
  String get focusMode => '专注模式';

  @override
  String get appBlocking => '应用屏蔽';

  @override
  String get islamicCalendar => '伊斯兰历';

  @override
  String get islamicCalendarSubtitle => '伊斯兰历日期与节日';

  @override
  String get duas => '杜阿祈祷文';

  @override
  String get quran => '古兰经';

  @override
  String get settings => '设置';

  @override
  String get complete => '完成';

  @override
  String get streak => '连续记录';

  @override
  String get dayStreak => '天连续礼拜';

  @override
  String get compassRequiresDevice => '指南针功能需要真实设备';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
      one: '$count 天',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => '今日五番礼拜已全部完成！🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 番礼拜已完成';
  }

  @override
  String get fajr => '晨礼（法吉尔）';

  @override
  String get dhuhr => '晌礼（助哈尔）';

  @override
  String get asr => '晡礼（阿斯尔）';

  @override
  String get maghrib => '昏礼（马格里布）';

  @override
  String get isha => '宵礼（伊沙）';

  @override
  String fardRakats(int count) {
    return '$count 拜主命拜';
  }

  @override
  String sunnahBefore(int count) {
    return '礼前 $count 拜圣行拜';
  }

  @override
  String sunnahAfter(int count) {
    return '礼后 $count 拜圣行拜';
  }

  @override
  String prayedAt(String time) {
    return '礼拜时间：$time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => '黎明破晓、日出之前';

  @override
  String get timePeriodAfterSunPassesHighestPoint => '太阳过中天之后';

  @override
  String get timePeriodLateAfternoon => '傍晚时分';

  @override
  String get timePeriodJustAfterSunset => '日落之后不久';

  @override
  String get timePeriodNightBeforeMidnight => '夜晚、午夜之前';

  @override
  String get fajrHadith => '晨礼的两拜胜过整个世界及其所有的一切。——先知穆罕默德 ﷺ';

  @override
  String get fajrTip => '晨礼是一天中的第一番礼拜。它提醒我们以记念安拉来开启新的一天。';

  @override
  String get dhuhrHadith => '凡每日礼十二拜圣行拜的人，安拉必为他在天堂中建造一座房屋。';

  @override
  String get dhuhrTip => '晌礼是正午的礼拜。这是暂停一天的忙碌、重新与安拉连接的绝佳时刻。';

  @override
  String get asrHadith => '凡错过晡礼的人，犹如失去了他的家人和财产。——先知穆罕默德 ﷺ';

  @override
  String get asrTip => '晡礼常被称为「中道的礼拜」。安拉在《古兰经》（2:238）中特别提及了它。';

  @override
  String get maghribHadith => '昏礼是当日的「维特尔」。';

  @override
  String get maghribTip => '昏礼标志着斋月封斋日的结束，在太阳落山时礼拜。';

  @override
  String get ishaHadith => '凡集体礼宵礼的人，犹如礼了半夜的拜功。';

  @override
  String get ishaTip => '宵礼是一天中的最后一番礼拜。以礼拜结束一天，能带来内心的平静与圆满。';

  @override
  String get newMuslimTip => '新穆斯林小贴士';

  @override
  String get notificationsOn => '通知已开启';

  @override
  String get notificationsOff => '通知已关闭';

  @override
  String get preview => '预览';

  @override
  String get lockPreviewCountdown => '还有 1 小时 23 分钟 · 下午 4:47';

  @override
  String get swipeUpToUnlock => '向上滑动以解锁';

  @override
  String get searchSurahs => '搜索章节…';

  @override
  String get noSurahsFound => '未找到相关章节';

  @override
  String get tryAgain => '重试';

  @override
  String ayahs(int count) {
    return '$count 节经文';
  }

  @override
  String get searchDuas => '搜索祈祷文…';

  @override
  String supplications(int count) {
    return '$count 段祈祷文';
  }

  @override
  String get prayerSettings => '礼拜设置';

  @override
  String get calculationMethod => '计算方法';

  @override
  String get adhanSound => '宣礼（邦克）声音';

  @override
  String get prayerNotifications => '礼拜提醒通知';

  @override
  String get statusOn => '开';

  @override
  String get statusOff => '关';

  @override
  String get enableAllNotifications => '启用所有通知';

  @override
  String get individualPrayers => '单独礼拜';

  @override
  String get appearance => '外观';

  @override
  String get darkMode => '深色模式';

  @override
  String get language => '语言';

  @override
  String get aboutNoorGuard => '关于';

  @override
  String get version => '应用版本';

  @override
  String get rateApp => '为 Noor Guard 评分';

  @override
  String get shareApp => '分享 Noor Guard';

  @override
  String get contactSupport => '联系客服支持';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String get helpUsImprove => '帮助我们改进';

  @override
  String get translationDisclaimer =>
      '我们的翻译由人工智能辅助完成。如果您发现所用语言中有任何错误，欢迎随时向我们反馈！';

  @override
  String get privacyPromiseTitle => 'Noor Guard 的隐私承诺';

  @override
  String get privacyPromiseBody =>
      '你的信仰是私人的，你的数据也是。我们绝不出售、共享或利用你的数据牟利。无论是你的位置、礼拜习惯，还是你的姓名，统统不会。';

  @override
  String get directionToSacredHouse => '通往天房（克尔白）的方向';

  @override
  String towardMecca(String degrees) {
    return '朝向麦加 $degrees°';
  }

  @override
  String get defaultLocation => '萨克拉门托，加州（默认位置）';

  @override
  String get prayerHistory => '礼拜记录';

  @override
  String get currentStreak => '当前连续天数';

  @override
  String get longestStreak => '最长连续天数';

  @override
  String get legend => '图例说明';

  @override
  String get allFivePrayers => '五番礼拜全部完成';

  @override
  String get partialPrayers => '部分完成（1–4 番）';

  @override
  String get none => '未完成';

  @override
  String get sun => '周日';

  @override
  String get mon => '周一';

  @override
  String get tue => '周二';

  @override
  String get wed => '周三';

  @override
  String get thu => '周四';

  @override
  String get fri => '周五';

  @override
  String get sat => '周六';

  @override
  String headingDegrees(String degrees) {
    return '方位角 $degrees°';
  }

  @override
  String get couldNotLoadSurahs => '无法加载章节列表';

  @override
  String get connectionError => '请检查你的网络连接后重试';

  @override
  String get alQuran => '古兰经';

  @override
  String get dailySupplications => '每日祈祷文';

  @override
  String get all => '全部';

  @override
  String get noDuasFound => '未找到相关祈祷文';

  @override
  String get january => '一月';

  @override
  String get february => '二月';

  @override
  String get march => '三月';

  @override
  String get april => '四月';

  @override
  String get may => '五月';

  @override
  String get june => '六月';

  @override
  String get july => '七月';

  @override
  String get august => '八月';

  @override
  String get september => '九月';

  @override
  String get october => '十月';

  @override
  String get november => '十一月';

  @override
  String get december => '十二月';

  @override
  String get home => '首页';

  @override
  String get prayers => '礼拜';

  @override
  String get more => '更多';

  @override
  String get tafsir => '经注（塔夫西尔）';

  @override
  String get lockScreen => '锁屏';

  @override
  String get readAndListen => '阅读与聆听';

  @override
  String get commentary => '经文注释';

  @override
  String get findDirection => '查找方向';

  @override
  String get reminders => '提醒';

  @override
  String get blockDistractions => '屏蔽干扰';

  @override
  String get prayerGuard => '礼拜守护';

  @override
  String get importantDates => '重要日期';

  @override
  String get comingSoon => '敬请期待';

  @override
  String get morningAndEvening => '晨昏祈祷';

  @override
  String get prayer => '礼拜';

  @override
  String get foodAndDrink => '饮食';

  @override
  String get verityWithHardship => '真的，艰难之后必有易境。';

  @override
  String get ashSharh946 => '舒勒哈章 94:6';

  @override
  String get guardStrictlyYourPrayers => '你们当谨守拜功，特别是中间的拜功。';

  @override
  String get alBaqarah2238 => '黄牛章 2:238';

  @override
  String get pastEvents => '过往节日';

  @override
  String get upcomingEvents => '即将到来的节日';

  @override
  String get today => '今天';

  @override
  String get next => '下一个';

  @override
  String hijriYearLabel(int year) {
    return '伊历 $year 年';
  }

  @override
  String get islamicMonthMuharram => '穆哈兰姆月';

  @override
  String get islamicMonthSafar => '色法尔月';

  @override
  String get islamicMonthRabiAlAwwal => '赖比尔·敖外鲁月';

  @override
  String get islamicMonthRabiAlThani => '赖比尔·阿色尼月';

  @override
  String get islamicMonthJumadaAlAwwal => '主马达·乌拉月';

  @override
  String get islamicMonthJumadaAlThani => '主马达·阿色尼月';

  @override
  String get islamicMonthRajab => '拉吉布月';

  @override
  String get islamicMonthShaban => '舍尔邦月';

  @override
  String get islamicMonthRamadan => '莱麦丹月（斋月）';

  @override
  String get islamicMonthShawwal => '闪瓦鲁月';

  @override
  String get islamicMonthDhulQadah => '都尔喊达月';

  @override
  String get islamicMonthDhulHijjah => '都尔黑哲月（朝觐月）';

  @override
  String get islamicNewYear => '伊斯兰新年';

  @override
  String get ashura => '阿舒拉日';

  @override
  String get mawlidAlNabi => '圣纪（先知诞辰）';

  @override
  String get ramadanBegins => '斋月开始';

  @override
  String get laylatAlQadr => '盖德尔夜（高贵之夜）';

  @override
  String get eidAlFitr => '开斋节';

  @override
  String get dayOfArafah => '阿拉法特日';

  @override
  String get eidAlAdha => '宰牲节（古尔邦节）';

  @override
  String get active => '进行中';

  @override
  String get focusModeSubtitle => '守护你的专注力。在你结束本次专注前，应用将保持锁定状态。';

  @override
  String get remaining => '剩余';

  @override
  String get ready => '准备就绪';

  @override
  String get duration => '时长';

  @override
  String get minutesAbbreviation => '分钟';

  @override
  String get blockedDuringFocus => '专注期间被屏蔽';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个应用',
      one: '$count 个应用',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => '开始专注';

  @override
  String get stopFocus => '结束专注';

  @override
  String get alhamdulillah => '一切赞颂全归安拉！';

  @override
  String get sessionComplete => '本次专注已完成';

  @override
  String stayedFocusedFor(String duration) {
    return '你专注坚持了 $duration。';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟',
      one: '$count 分钟',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote => '「你们当借坚忍和礼拜而求佑助。」\n——黄牛章 2:45';

  @override
  String get done => '完成';

  @override
  String get socialMedia => '社交媒体';

  @override
  String get entertainment => '娱乐';

  @override
  String get games => '游戏';

  @override
  String get messaging => '即时通讯';

  @override
  String get blockDuringPrayerTimes => '礼拜时段屏蔽应用';

  @override
  String get blockDuringPrayerTimesSubtitle => '所选应用将在每日五番礼拜时段\n自动被屏蔽。';

  @override
  String get blockedLabel => '已屏蔽';

  @override
  String get blockAllApps => '屏蔽所有应用';

  @override
  String get blockingTimingInfo => '屏蔽将在每次礼拜前 5 分钟自动启动，并在礼拜后 15 分钟解除。';

  @override
  String get blockedDuringPrayers => '礼拜期间已屏蔽';

  @override
  String get notBlocked => '未屏蔽';

  @override
  String get wuduStep1 => '举意';

  @override
  String get wuduStep2 => '诵读「比斯敏拉」';

  @override
  String get wuduStep3 => '洗手';

  @override
  String get wuduStep4 => '漱口';

  @override
  String get wuduStep5 => '呛鼻';

  @override
  String get wuduStep6 => '洗脸';

  @override
  String get wuduStep7 => '洗手臂';

  @override
  String get wuduStep8 => '摸头';

  @override
  String get wuduStep9 => '洗脚';

  @override
  String get revertCorner => '皈依者角落';

  @override
  String get revertCornerSubtitle => '为新穆斯林提供的指南与支持';

  @override
  String get wuduGuide => '小净（乌督）指南';

  @override
  String get howToPray => '如何礼拜';

  @override
  String get newMuslimChecklist => '新穆斯林清单';

  @override
  String get islamicGlossary => '伊斯兰术语词典';

  @override
  String get whyDoWe => '为什么我们要……';

  @override
  String get communityStories => '社区见证故事';

  @override
  String get wuduGuideSubtitle => '礼拜前的洁净仪式';

  @override
  String get howToPraySubtitle => '礼拜分步指南';

  @override
  String get newMuslimChecklistSubtitle => '你的 30 天信仰之旅';

  @override
  String get howToPrayStep1Name => '先做小净';

  @override
  String get howToPrayStep1Instruction => '在开始礼拜之前，先做小净（乌督），使自己处于洁净状态。';

  @override
  String get howToPrayStep1Tip => '如果你不确定怎么做，可以先在「新穆斯林中心」打开「小净指南」。';

  @override
  String get howToPrayStep2Name => '面向克尔白站立';

  @override
  String get howToPrayStep2Instruction =>
      '站在你的礼拜毯上，面向朝向（麦加克尔白的方向）。可使用应用内的朝向指南针来确定准确方向。';

  @override
  String get howToPrayStep2Tip => '即使方向稍有偏差也没关系——安拉知道你的举意。尽你所能就好。';

  @override
  String get howToPrayStep3Name => '举意（尼亚）';

  @override
  String get howToPrayStep3Instruction => '在心中为即将进行的礼拜立下举意，无需说出声来。';

  @override
  String get howToPrayStep3Tip => '你的举意只在你与安拉之间。简单地想着「我为安拉礼晨礼」就足够了。';

  @override
  String get howToPrayStep4Name => '起拜词（开端的「真主至大」）';

  @override
  String get howToPrayStep4Instruction =>
      '将双手举到耳垂处，说「安拉乎艾克拜尔」（安拉至大）。这正式开始你的礼拜。';

  @override
  String get howToPrayStep4Tip => '在整个礼拜过程中，目光始终注视着叩头处的地面。';

  @override
  String get howToPrayStep5Name => '站立诵经（基亚姆）';

  @override
  String get howToPrayStep5Instruction =>
      '将右手放在左手上，置于胸前。诵读《开端章》，然后诵读你所知道的其他短章或经文。';

  @override
  String get howToPrayStep5Tip => '如果你暂时还不会其他章节，在学习过程中只诵读《开端章》也是可以的。';

  @override
  String get howToPrayStep6Name => '鞠躬（鲁库尔）';

  @override
  String get howToPrayStep6Instruction =>
      '弯腰鞠躬，使背部与地面平行。双手放在膝盖上，说「赞颂我的至大的主超绝万物」三遍。';

  @override
  String get howToPrayStep6Tip => '保持背部平直水平——不要拱起或弯曲。';

  @override
  String get howToPrayStep7Name => '起立（伊提达鲁）';

  @override
  String get howToPrayStep7Instruction =>
      '从鞠躬中起身并直立站好。起身时说「安拉确已聆听赞美他的人」，然后说「我们的主啊，一切赞颂全归你」。';

  @override
  String get howToPrayStep7Tip => '完全直立站好，静止片刻，然后再进入下一个动作。';

  @override
  String get howToPrayStep8Name => '叩头（苏朱德）';

  @override
  String get howToPrayStep8Instruction =>
      '俯身至地面，将额头、鼻子、双掌、双膝和脚趾都贴地。说「赞颂我的至高的主超绝万物」三遍。';

  @override
  String get howToPrayStep8Tip => '需有七个部位接触地面：额头（连同鼻子）、双手、双膝和双脚。';

  @override
  String get howToPrayStep9Name => '两叩头之间的端坐（贾勒萨）';

  @override
  String get howToPrayStep9Instruction =>
      '从叩头中坐起，左脚平放，右脚竖立。坐起时说「安拉乎艾克拜尔」。短暂停顿后，再俯身进行第二次叩头。';

  @override
  String get howToPrayStep9Tip => '两次叩头之间的这次短暂端坐称为「贾勒萨」，是礼拜中必须完成的部分。';

  @override
  String get howToPrayStep10Name => '完成各拜单元';

  @override
  String get howToPrayStep10Instruction =>
      '完成第一拜后，起立并重复相同的动作进行第二拜。所需的拜数取决于你正在进行的是哪一番礼拜。';

  @override
  String get howToPrayStep10Tip =>
      '晨礼为 2 拜，晌礼 4 拜，晡礼 4 拜，昏礼 3 拜，宵礼 4 拜。一拜一拜地慢慢来。';

  @override
  String get howToPrayStep11Name => '诵读证词（台舍胡德）';

  @override
  String get howToPrayStep11Instruction =>
      '在最后的端坐姿势中，诵读「台舍胡德」。这是在最后一拜后端坐时诵读的信仰证词。';

  @override
  String get howToPrayStep11Tip =>
      '诵读「台舍胡德」时，在念到「我作证万物非主，唯有安拉」时竖起右手食指，象征安拉独一无二。';

  @override
  String get howToPrayStep12Name => '出拜词（赛俩目）';

  @override
  String get howToPrayStep12Instruction =>
      '将头转向右侧，说「愿安拉的平安与慈悯降临你们」，然后转向左侧重复一遍。这样你的礼拜就完成了。';

  @override
  String get howToPrayStep12Tip =>
      '礼拜结束后，花点时间做杜阿（祈祷），向安拉祈求你所需要的一切。这是与安拉沟通连接的美好时刻。';

  @override
  String get checklistWeek1Title => '第一周';

  @override
  String get checklistWeek2Title => '第二周';

  @override
  String get checklistWeek3Title => '第三周';

  @override
  String get checklistWeek4Title => '第四周';

  @override
  String get checklistWeek1Item1 => '诵念清真言（作证词）';

  @override
  String get checklistWeek1Item2 => '学习小净（乌督）';

  @override
  String get checklistWeek1Item3 => '学习《开端章》';

  @override
  String get checklistWeek1Item4 => '礼第一次晨礼';

  @override
  String get checklistWeek1Item5 => '准备一张礼拜毯';

  @override
  String get checklistWeek1Item6 => '寻找附近的清真寺';

  @override
  String get checklistWeek2Item1 => '学习五番礼拜的时间';

  @override
  String get checklistWeek2Item2 => '学习基础的杜阿祈祷文';

  @override
  String get checklistWeek2Item3 => '阅读关于先知穆罕默德的资料';

  @override
  String get checklistWeek2Item4 => '与穆斯林社区建立联系';

  @override
  String get checklistWeek3Item1 => '了解清真饮食';

  @override
  String get checklistWeek3Item2 => '诵读《忠诚章》';

  @override
  String get checklistWeek3Item3 => '了解斋月（拉玛丹）';

  @override
  String get checklistWeek3Item4 => '开始每日记主（迪克尔）';

  @override
  String get checklistWeek4Item1 => '了解天课（则卡特）';

  @override
  String get checklistWeek4Item2 => '阅读关于五功的资料';

  @override
  String get checklistWeek4Item3 => '设置礼拜提醒通知';

  @override
  String get checklistWeek4Item4 => '回顾并反思你的信仰之旅';

  @override
  String get wuduStep1Instruction => '在心中为安拉而立下做小净的举意。';

  @override
  String get wuduStep1Tip => '无需说出声——内心真诚的举意就足够了。';

  @override
  String get wuduStep2Instruction => '开始之前先诵读「比斯敏拉」（奉安拉之名）。';

  @override
  String get wuduStep2Tip => '诵读「比斯敏拉」是圣行，能让你的小净以记念安拉开始。';

  @override
  String get wuduStep3Instruction => '将双手洗到手腕处，重复三次，并确保水流到手指之间。';

  @override
  String get wuduStep3Tip => '先洗右手，再洗左手。这个顺序是伊斯兰所推荐的。';

  @override
  String get wuduStep4Instruction => '用水漱口，让水在口中转动后吐出，重复三次。';

  @override
  String get wuduStep4Tip => '这能洁净口腔，是净身过程的一部分。';

  @override
  String get wuduStep5Instruction => '将水吸入鼻孔后轻轻擤出，重复三次。';

  @override
  String get wuduStep5Tip => '用右手将水吸入鼻孔，用左手将水擤出。';

  @override
  String get wuduStep6Instruction => '洗整个脸部三次，从发际线到下巴、从一耳到另一耳。';

  @override
  String get wuduStep6Tip => '确保脸部没有任何地方未被打湿。';

  @override
  String get wuduStep7Instruction => '将右手臂从指尖洗到手肘，重复三次，然后以同样方式洗左手臂。';

  @override
  String get wuduStep7Tip => '在小净中，始终先洗右侧再洗左侧。';

  @override
  String get wuduStep8Instruction => '将双手沾湿，从前到后、再从后到前抹一遍整个头部。';

  @override
  String get wuduStep8Tip => '与洗的部位不同，抹头只需进行一次。';

  @override
  String get wuduStep9Instruction => '将右脚连同脚踝洗三次，然后以同样方式洗左脚。';

  @override
  String get wuduStep9Tip => '确保水流到脚趾之间，可以用手指清洁脚趾缝。';

  @override
  String get islamicGlossaryTitle => '伊斯兰术语词典';

  @override
  String get islamicGlossarySubtitle => '收录 51 个源自古兰经、圣训与传统经学的术语';

  @override
  String get searchTermsHint => '搜索术语、阿拉伯语、释义……';

  @override
  String get categoryAll => '全部';

  @override
  String get categoryPillar => '功修支柱';

  @override
  String get categoryAqeedah => '信仰（阿基达）';

  @override
  String get categoryPractice => '宗教功修';

  @override
  String get categoryDhikr => '记主（迪克尔）';

  @override
  String get categoryQuran => '古兰经';

  @override
  String get categoryHadith => '圣训';

  @override
  String get categoryFiqh => '教法（菲格亥）';

  @override
  String get categoryHistory => '历史';

  @override
  String get noTermsFound => '未找到相关术语';

  @override
  String get sourceLabel => '来源';

  @override
  String get revertCornerHubSubtitle => '一个温暖的中心，引导你迈出成为新穆斯林的第一步';

  @override
  String get islamicGlossaryHubSubtitle => '用简单易懂的方式解释常见术语';

  @override
  String get whyDoWeHubSubtitle => '日常功修背后的智慧';

  @override
  String get communityStoriesHubSubtitle => '皈依者们分享他们走向伊斯兰的旅程';

  @override
  String get whyDoWeScreenSubtitle => '12 项日常伊斯兰功修背后的智慧';

  @override
  String get whyDoWeSourceBadge => '逊尼派经典依据';

  @override
  String get whyDoWeQ1 => '为什么我们每天要礼拜五次？';

  @override
  String get whyDoWeA1 =>
      '安拉在《古兰经》（2:238）中规定了每日五番礼拜，并在夜行登霄（伊斯拉与米尔拉吉）期间确立了这一功修。先知 ﷺ 说：「在末日，仆人首先将被清算的功修就是礼拜。」（伊本·马哲圣训集）。礼拜使我们整日都与安拉保持联系。';

  @override
  String get whyDoWeQ2 => '为什么礼拜时我们要面向麦加？';

  @override
  String get whyDoWeA2 =>
      '安拉在《古兰经》（2:144）中命令道：「你应当把你的脸转向禁寺。」麦加的克尔白是为敬拜安拉而建造的第一座房屋（3:96）。面向同一方向，将全世界的穆斯林在礼拜中团结在一起。';

  @override
  String get whyDoWeQ3 => '为什么我们在斋月（拉玛丹）封斋？';

  @override
  String get whyDoWeA3 =>
      '安拉在《古兰经》（2:183）中规定了斋戒：「信道的人们啊！斋戒已成为你们的定制，犹如它曾为你们以前的人的定制一样，以使你们敬畏。」斋月正是《古兰经》开始降示的月份（2:185）。';

  @override
  String get whyDoWeQ4 => '为什么我们吃饭前要诵读「比斯敏拉」？';

  @override
  String get whyDoWeA4 =>
      '先知 ﷺ 说：「你们当中有人吃东西时，应当诵念安拉之名；如果他在开始时忘记了，就应当说：奉安拉之名，开始与结束。」（艾布·达伍德圣训集）。这提醒我们一切恩典都来自安拉。';

  @override
  String get whyDoWeQ5 => '为什么进入清真寺前要脱鞋？';

  @override
  String get whyDoWeA5 =>
      '当安拉命令穆萨（摩西）时说：「你脱下你的鞋子吧，因为你确是在吐瓦的圣谷中。」（古兰经 20:12）。脱鞋表示对安拉之家的尊重，也使礼拜的场所保持洁净。';

  @override
  String get whyDoWeQ6 => '为什么我们用「赛俩目」（愿主赐你平安）作为问候语？';

  @override
  String get whyDoWeA6 =>
      '先知 ﷺ 说：「你们不信道，绝不能入乐园；你们不相亲相爱，绝不能成为信士。我可以指示你们一件事，你们做了就能相亲相爱吗？那就是在你们之间互道赛俩目（传播平安）。」（穆斯林圣训集）。这同时也是一种杜阿——你是在为对方祈求平安。';

  @override
  String get whyDoWeQ7 => '为什么我们要去朝觐（哈吉）？';

  @override
  String get whyDoWeA7 =>
      '朝觐是安拉所命令的（3:97）：「凡能旅行到天房去的人，朝觐天房，是他对安拉应尽的义务。」朝觐纪念了先知易卜拉欣及其家人所经受的考验，并将来自世界各国的穆斯林团结在共同的敬拜之中。';

  @override
  String get whyDoWeQ8 => '为什么我们要缴纳天课（则卡特）？';

  @override
  String get whyDoWeA8 =>
      '天课是伊斯兰的第三大功修支柱，在《古兰经》中与礼拜并列被提及超过30次。先知 ﷺ 说天课能净化财富。它能减少社会的不平等，并提醒信士们财富归安拉所有。';

  @override
  String get whyDoWeQ9 => '为什么打喷嚏后我们要说「一切赞颂全归安拉」？';

  @override
  String get whyDoWeA9 =>
      '先知 ﷺ 说：「你们当中有人打喷嚏时，应当说『一切赞颂全归安拉』，他的兄弟或同伴应当对他说『愿安拉怜悯你』。」（布哈里圣训实录）。这是为健康的恩典而向安拉感恩的时刻。';

  @override
  String get whyDoWeQ10 => '为什么穆斯林女性要戴盖头（希贾布）？';

  @override
  String get whyDoWeA10 =>
      '安拉在《古兰经》（24:31）中命令信女们应当保持端庄。盖头是对安拉的一种敬拜与服从行为。许多穆斯林女性将其视为身份认同、尊严与精神连接的象征。';

  @override
  String get whyDoWeQ11 => '为什么我们要远离猪肉和酒精？';

  @override
  String get whyDoWeA11 =>
      '安拉在《古兰经》（2:173）中禁止了猪肉，在（5:90）中禁止了酒精，称其为「出自恶魔行为的秽行」。这些禁令保护着我们的健康、心智与家庭。清真饮食准则有助于信士保持身体与精神上的洁净。';

  @override
  String get whyDoWeQ12 => '为什么我们要说「印沙安拉」（如果安拉意欲）？';

  @override
  String get whyDoWeA12 =>
      '安拉在《古兰经》（18:23-24）中命令道：「你对于任何事，绝不要说：『我明天要做那件事。』除非你说：『如果安拉意欲。』」说「印沙安拉」承认唯有安拉掌控未来，使我们保持谦卑。';

  @override
  String get communityStoriesScreenSubtitle => '来自世界各地的真实皈依故事';

  @override
  String get communityStoriesTimeLabel => '成为穆斯林的时间';

  @override
  String get communityStoriesShareBtn => '分享你的故事';

  @override
  String get communityStoriesShareSoon => '敬请期待——这项功能即将推出！';

  @override
  String get communityStory1Name => '阿伊莎（原名 Sarah）';

  @override
  String get communityStory1Location => '美国，德克萨斯州';

  @override
  String get communityStory1Time => '2 年';

  @override
  String get communityStory1Text =>
      '我是在为大学论文做研究时接触到伊斯兰的。原本以为会发现媒体所描述的那些东西，结果却发现了平静、逻辑，以及一位真正讲得通的真主。六个月后，我念了清真言。最难的部分不是学习礼拜，而是告诉我的家人。但一切赞颂全归安拉，两年后的今天，我的母亲开始主动向我询问关于伊斯兰的事了。';

  @override
  String get communityStory2Name => '优素福（原名 James）';

  @override
  String get communityStory2Location => '英国，伦敦';

  @override
  String get communityStory2Time => '4 年';

  @override
  String get communityStory2Text =>
      '经过多年的寻觅，我皈依了伊斯兰。基督教、佛教、无神论——都没能填补内心的空虚。一位穆斯林同事邀请我参加主麻日（聚礼）。我坐在后排，整个过程都在流泪，自己也不知道为什么。一周后，我念了清真言。这个社区像我从未意识到自己需要的家人一样接纳了我。';

  @override
  String get communityStory3Name => '麦尔彦（原名 Maria）';

  @override
  String get communityStory3Location => '墨西哥，墨西哥城';

  @override
  String get communityStory3Time => '1 年';

  @override
  String get communityStory3Text =>
      '身为拉丁裔穆斯林，感觉就像拥有了一种超能力。我是在凌晨两点通过一个 YouTube 视频接触到伊斯兰的，一连看了好几个小时。「认主独一」（讨黑德）的概念——真主独一无二，没有伙伴，也没有形象——深深打动了我。清真寺里讲西班牙语的姐妹们让我立刻有了归属感。';

  @override
  String get communityStory4Name => '易卜拉欣（原名 David）';

  @override
  String get communityStory4Location => '加拿大，多伦多';

  @override
  String get communityStory4Time => '6 年';

  @override
  String get communityStory4Text =>
      '我是一位牧师的儿子，对三位一体有许多无人能解答的疑问。当我第一次读《古兰经》时，感觉就像在读一些我早已相信的东西。我先是独自一人安静地念了清真言，后来又在清真寺里再念了一遍。这是我人生中最好的决定。';

  @override
  String get communityStory5Name => '法蒂玛（原名 Jennifer）';

  @override
  String get communityStory5Location => '澳大利亚，悉尼';

  @override
  String get communityStory5Time => '3 年';

  @override
  String get communityStory5Text =>
      '我的旅程从一条盖头开始。一开始只是出于挑战才戴上的，却感受到了一种……被保护的感觉。我开始阅读关于伊斯兰的资料，从此停不下来。三个月内我就念了清真言。人们问我放弃了什么，我告诉他们：我放弃的是内心的空虚。';

  @override
  String get communityStory6Name => '奥马尔（原名 Kevin）';

  @override
  String get communityStory6Location => '南非，约翰内斯堡';

  @override
  String get communityStory6Time => '5 年';

  @override
  String get communityStory6Text =>
      '我在一个治安不好的社区长大。伊斯兰给了我自律、目标和兄弟情谊。第一次叩头时，内心深处仿佛有什么东西被打开了——是一种最美好的方式。我哭了，却说不清原因。如今我引导其他正在寻找信仰之路的年轻人。';

  @override
  String get inspiredByRealStories => '灵感源自真实的皈依者经历';

  @override
  String get storyFormTitle => '分享你的故事';

  @override
  String get storyFormNameLabel => '你的名字';

  @override
  String get storyFormNameHint => '填写姓名，或写「匿名」';

  @override
  String get storyFormCountryLabel => '国家';

  @override
  String get storyFormCountryHint => '你来自哪里？';

  @override
  String get storyFormTimeLabel => '成为穆斯林的时间';

  @override
  String get storyFormTimeHint => '例如：2 年、6 个月';

  @override
  String get storyFormStoryLabel => '你的故事';

  @override
  String get storyFormStoryHint => '分享你走向伊斯兰的旅程……';

  @override
  String get storyFormSubmitBtn => '提交故事';

  @override
  String get storyFormThankYouTitle => '愿安拉报偿你的善行！';

  @override
  String get storyFormThankYouBody => '你的故事已收到。我们会在发布前审核所有投稿内容。';

  @override
  String get storyFormRequiredError => '请填写所有字段';

  @override
  String get subtitleYourGuideToIslam => '你的伊斯兰指南';

  @override
  String get beginnerMode => '初学者模式';

  @override
  String get beginnerModeSubtitle => '为新穆斯林提供额外的提示与指导';

  @override
  String get beginnerModeOn => '初学者模式已开启——应用各处将显示额外的小提示';

  @override
  String get beginnerModePrayersTip => '小提示：点击每番礼拜可以了解更多信息，并查看相应的圣行拜';

  @override
  String get tafsirSubtitle => '古兰经注释';

  @override
  String get tafsirComingSoon => '本章的经注内容即将推出';

  @override
  String get tafsirNotAvailable => '暂无经注内容';

  @override
  String get scholarSource => '来源';

  @override
  String get asbabAlNuzul => '降示背景';

  @override
  String get transliteration => '音译';

  @override
  String get selectReciter => '选择诵读者';

  @override
  String get playVerse => '播放经文朗诵';

  @override
  String get asmaUlHusna => '安拉的尊名';

  @override
  String get asmaUlHusnaSubtitle => '安拉的99个美名';

  @override
  String get asmaHadith => '安拉有99个尊名，凡能背诵记住它们的人将进入天堂。';

  @override
  String get asmaHadithSource => '布哈里圣训实录，2736';

  @override
  String get asmaSearchHint => '搜索尊名……';

  @override
  String get asmaNoResults => '未找到相关尊名';

  @override
  String get asmaSignificance => '意义阐释';

  @override
  String get asmaUlHusnaTile => '99个尊名';

  @override
  String get asmaUlHusnaTileSubtitle => '安拉的尊名';

  @override
  String get onboardingTagline => '守护你的时间，敬重你的礼拜。';

  @override
  String get onboardingChooseLanguage => '选择你的语言';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get onboardingLocationTitle => '精准的礼拜时间';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard 需要获取你的位置，以计算你所在城市的精准礼拜时间。你的位置信息绝不会被存储或分享。';

  @override
  String get onboardingPrivacyBanner => '你的信仰是私人的，你的数据也是。';

  @override
  String get onboardingAllowLocation => '允许访问位置';

  @override
  String get onboardingSkipForNow => '暂时跳过';

  @override
  String get onboardingNotificationTitle => '绝不错过任何一番礼拜';

  @override
  String get onboardingNotificationDesc =>
      '在每个礼拜时间收到通知，并伴有优美的宣礼（邦克）声。可在设置中自定义声音和提醒时间。';

  @override
  String get onboardingAdhanAlerts => '宣礼提醒';

  @override
  String get onboardingCustomTiming => '自定义时间';

  @override
  String get onboardingAdjustable => '可调整设置';

  @override
  String get onboardingEnableNotifications => '启用通知';

  @override
  String get onboardingMaybeLater => '以后再说';

  @override
  String get onboardingAllSetTitle => '一切准备就绪！';

  @override
  String get onboardingAllSetDesc => 'Noor Guard 已准备好守护你的时间，\n并以虔诚的意念引导你的每一天。';

  @override
  String get onboardingPrayerTimesLabel => '礼拜时间';

  @override
  String get onboardingPrayerTimesDesc => '为你所在城市提供精准的时间';

  @override
  String get onboardingLockScreenLabel => '伊斯兰锁屏';

  @override
  String get onboardingLockScreenDesc => '每次解锁都能看到古兰经文与杜阿祈祷文';

  @override
  String get onboardingPrayerGuardLabel => '礼拜守护';

  @override
  String get onboardingPrayerGuardDesc => '在礼拜（萨拉特）期间自动屏蔽应用';

  @override
  String get onboardingEnterApp => '进入 Noor Guard';

  @override
  String get adhan => '宣礼';

  @override
  String get adhanSubtitle => '礼拜的召唤';

  @override
  String get adhanDescription => '宣礼是伊斯兰教的礼拜召唤，每天宣布五次，邀请信徒前来礼拜。';

  @override
  String get makkahStyle => '麦加';

  @override
  String get madinahStyle => '麦地那';

  @override
  String get egyptianStyle => '埃及式';

  @override
  String get adhanPlaying => '正在播放';

  @override
  String get makkahDescription => '源自麦加大清真寺的传统礼拜召唤。';

  @override
  String get madinahDescription => '以麦地那先知清真寺风格演绎的宁静宣礼。';

  @override
  String get egyptianDescription => '旋律优美的埃及风格宣礼，以丰富的诵读著称。';

  @override
  String get adhanCallToWorship => '礼拜的召唤';

  @override
  String get adhanDescriptionFull => '宣礼是伊斯兰教的礼拜召唤，每天宣布五次，邀请信徒前来礼拜。';

  @override
  String get alafasyStyle => '米沙里·阿拉法西';

  @override
  String get alaqsaStyle => '阿克萨';

  @override
  String get turkishStyle => '土耳其式';

  @override
  String get pakistaniStyle => '巴基斯坦式';

  @override
  String get indonesianStyle => '印度尼西亚式';

  @override
  String get alafasyDescription => '由著名诵经者米沙里·拉希德·阿拉法西深情诵读。';

  @override
  String get alaqsaDescription => '从耶路撒冷阿克萨清真寺回响的礼拜召唤，这是伊斯兰教第三圣地。';

  @override
  String get turkishDescription => '传统土耳其风格的宣礼，带有独特的旋律调式。';

  @override
  String get pakistaniDescription => '南亚传统的深情宣礼，在巴基斯坦各地诵读。';

  @override
  String get indonesianDescription => '悦耳的印度尼西亚风格宣礼，深受整个群岛人民喜爱。';

  @override
  String get thisWeek => '本周';

  @override
  String weeklyProgress(int count) {
    return '本周完成 $count/35 次礼拜';
  }

  @override
  String get bestDay => '最佳一天';

  @override
  String get prayerStats => '礼拜统计';

  @override
  String get completionRate => '完成率';

  @override
  String get bestPrayer => '最坚持的礼拜';

  @override
  String get hardestPrayer => '最常错过的礼拜';

  @override
  String totalPrayersCompleted(int count) {
    return '共完成 $count 次礼拜';
  }

  @override
  String get last7Days => '最近7天';

  @override
  String get thisMonth => '本月';

  @override
  String get fullDays => '完整天数';

  @override
  String get partialDays => '部分完成天数';

  @override
  String get missedDays => '错过天数';

  @override
  String get missedPrayerBadge => '已错过';

  @override
  String get makeItUp => '补拜';

  @override
  String get qadaExplanation => '如果你错过了一次礼拜，仍然可以将其作为补拜（Qada）来完成。';

  @override
  String get noStatsYet => '继续标记你的礼拜，即可在此查看统计数据。';

  @override
  String get notEnoughData => '暂无足够数据';

  @override
  String get continuousPlay => '连续播放';

  @override
  String get sleepTimer => '睡眠定时';

  @override
  String verseCount(Object total, Object verse) {
    return '第$verse节 共$total节';
  }

  @override
  String get verseTafsir => '经文注释';

  @override
  String get tafsirOfTheDay => '每日注释';

  @override
  String get dailyInsight => '每日启示';

  @override
  String get keyThemes => '主要主题与教训';

  @override
  String get readFullSurah => '阅读完整章节';

  @override
  String get surahIntroduction => '章节介绍';

  @override
  String get verses => '节';

  @override
  String get loadingTafsir => '正在加载注释...';

  @override
  String get keepAliveNotificationText => '礼拜通知已启用';

  @override
  String get keepAliveChannelName => '礼拜通知';

  @override
  String get keepAliveChannelDescription => '让 Noor Guard 在后台保持活动，确保礼拜提醒永不错过。';

  @override
  String get notifSetupTitle => '启用锁屏提醒';

  @override
  String get notifSetupSubtitle => '这样即使手机锁屏，你也绝不会错过宣礼。只需大约一分钟。';

  @override
  String get notifSetupSamsungBanner =>
      '正在使用三星 Galaxy（包括 Fold/Flip）吗？三星在标准 Android 之外增加了额外的开关——下面的步骤 4 和步骤 6 会准确告诉你在哪里找到它们。';

  @override
  String get notifSetupStep1Title => '允许通知';

  @override
  String get notifSetupStep1Description => 'Noor Guard 提醒你所需的基本权限。';

  @override
  String get notifSetupStep1Action => '允许通知';

  @override
  String get notifSetupStep2Title => '闹钟与提醒';

  @override
  String get notifSetupStep2Description => '即使手机处于空闲或省电模式，也能让礼拜提醒在准确的礼拜时间响起。';

  @override
  String get notifSetupStep2Action => '打开闹钟设置';

  @override
  String get notifSetupStep3Title => '在其他应用上层显示';

  @override
  String get notifSetupStep3Description => '让完整的礼拜画面显示在锁屏和任何其他打开的内容之上。';

  @override
  String get notifSetupStep3Action => '打开设置';

  @override
  String get notifSetupStep4Title => '以弹窗/全屏提醒方式显示';

  @override
  String get notifSetupStep4Description => '让宣礼画面突破锁屏显示出来，而不是仅保持为无声横幅通知。';

  @override
  String get notifSetupStep4SamsungNote =>
      '在三星 Galaxy 手机上（包括 Fold/Flip）：打开设置 → 点击\"Prayer Time Alarm\" → 然后开启\"Pop-up notification\"（在 Fold/Flip 上称为\"Cover screen pop-up\"）。这是三星专属开关——开启它才能真正让宣礼画面显示在锁屏之上。';

  @override
  String get notifSetupStep4Action => '打开通知设置';

  @override
  String get notifSetupStep5Title => '保持通知可靠送达';

  @override
  String get notifSetupStep5Description =>
      '防止 Android 在后台拖慢或延迟 Noor Guard，确保礼拜提醒和闹钟始终准时送达。';

  @override
  String get notifSetupStep5Action => '关闭电池优化';

  @override
  String get notifSetupStep6Title => '永不休眠的应用';

  @override
  String get notifSetupStep6Description =>
      '三星的电池管理器可能会让 Noor Guard 进入休眠并悄悄屏蔽礼拜提醒。将其加入\"Never sleeping apps\"可以防止这种情况。';

  @override
  String get notifSetupStep6SamsungNote =>
      '设置 → 电池和设备维护 → 后台使用限制 → Never sleeping apps → 点击\"+\" → 选择 Noor Guard。';

  @override
  String get notifSetupStep6Action => '打开电池设置';

  @override
  String get notifSetupStatusChecking => '检查中…';

  @override
  String get notifSetupStatusEnabled => '已启用';

  @override
  String get notifSetupStatusNeeded => '需要设置';

  @override
  String get notifSetupStatusManual => '手动步骤';

  @override
  String get notifSetupContinueButton => '继续进入 Noor Guard';

  @override
  String get notifSetupLaterButton => '我稍后再完成';

  @override
  String get notifSetupDoneButton => '完成';

  @override
  String get testNotificationButton => '发送测试通知（10秒）';

  @override
  String get testNotificationSnack => '测试通知将在10秒后送达';

  @override
  String get testLockAlarmButton => '测试全屏锁屏提醒（10秒）';

  @override
  String get testLockAlarmSnack => '锁屏提醒将在10秒后触发——请立即锁定手机';

  @override
  String get testAdhanForegroundButton => '测试应用内宣礼（前台播放）';

  @override
  String get testAdhanForegroundSnack => '正在播放完整宣礼，并显示静音横幅';

  @override
  String get testRequiresNotificationsOn => '请先启用礼拜提醒通知以测试此功能';

  @override
  String get lockScreenSetupGuideButton => '锁屏提醒设置指南';

  @override
  String get couldNotOpenPrivacyPolicy => '无法打开隐私政策';

  @override
  String get couldNotOpenEmailApp => '无法打开邮件应用';

  @override
  String get blockDurationLabel => '屏蔽时长';

  @override
  String get privacyAndTrust => '隐私与信任';

  @override
  String get noorGuardMotto => '\"如果它不属于清真寺，\n它就不属于Noor Guard。\"';

  @override
  String get openingAppStore => '正在打开应用商店…';

  @override
  String get openingShareSheet => '正在打开分享菜单…';

  @override
  String get openingSupportEmail => '正在打开支持邮箱…';

  @override
  String get openingTermsOfService => '正在打开服务条款…';

  @override
  String get duration30Min => '30分钟';

  @override
  String get duration1Hour => '1小时';

  @override
  String get durationPrayerWindowOnly => '仅礼拜时段';

  @override
  String get hoursAbbreviation => '小时';

  @override
  String get cancelTimerButton => '取消定时器';

  @override
  String get custom => '自定义';

  @override
  String get customTimerMinutesTitle => '自定义定时器（分钟）';

  @override
  String get customTimerHint => '例如20';

  @override
  String get cancel => '取消';

  @override
  String get start => '开始';

  @override
  String get travel => '旅行';

  @override
  String get anxietyAndStress => '焦虑与压力';

  @override
  String get gratitude => '感恩';

  @override
  String get protection => '护佑';

  @override
  String get family => '家庭';

  @override
  String get forgiveness => '宽恕';

  @override
  String get appBlockingSetupHeadline => '守护你的时间，守护你的礼拜';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard 仅使用 Android 的无障碍服务来检测在礼拜时间打开了被屏蔽的应用。它绝不会读取你的消息、照片或任何个人数据。';

  @override
  String get appBlockingAccessibilityStatusOn => '无障碍权限已授予';

  @override
  String get appBlockingAccessibilityStatusOff => '无障碍权限尚未授予';

  @override
  String get appBlockingOpenSettings => '打开无障碍设置';

  @override
  String get appBlockingSetupNotNow => '现在不要';

  @override
  String get appBlockingEnableToggle => '启用应用屏蔽';

  @override
  String get appBlockingModeLabel => '屏蔽模式';

  @override
  String get appBlockingModeSoft => '温和';

  @override
  String get appBlockingModeSoftDesc => '仅温和提醒——应用仍可打开';

  @override
  String get appBlockingModeFirm => '适中';

  @override
  String get appBlockingModeFirmDesc => '屏蔽应用，可快速绕过';

  @override
  String get appBlockingModeHard => '严格';

  @override
  String get appBlockingModeHardDesc => '完全屏蔽——只有\"我已礼拜\"才能解锁';

  @override
  String get appBlockingSelectPrayersLabel => '在以下礼拜时间屏蔽';

  @override
  String get appBlockingBufferBeforeLabel => '礼拜前开始';

  @override
  String get appBlockingBufferAfterLabel => '礼拜后解除';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count 分钟';
  }

  @override
  String get appBlockingAppsTitle => '已屏蔽的应用';

  @override
  String get appBlockingSelectAppsButton => '选择要屏蔽的应用';

  @override
  String get appBlockingSearchHint => '搜索已安装的应用';

  @override
  String get appBlockingNoAppsSelected => '尚未选择任何应用';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已屏蔽 $count 个应用',
      zero: '未屏蔽任何应用',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => '测试';

  @override
  String get appBlockingTestDescription => '启动应用屏蔽 2 分钟，确认其在此设备上正常工作。';

  @override
  String get appBlockingTestButton => '测试应用屏蔽（2 分钟）';

  @override
  String get appBlockingTestActiveSnackbar => '应用屏蔽已启动 2 分钟 — 试着打开一个被屏蔽的应用';

  @override
  String get appBlockingPermissionNeeded => '开启无障碍权限以开始屏蔽';

  @override
  String get appBlockingIosComingSoonTitle => '屏幕使用时间权限——即将推出';

  @override
  String get appBlockingIosComingSoonBody =>
      'iOS 上的应用屏蔽需要 Apple 的屏幕使用时间权限，我们仍在设置中，准备好后会立即通知你。';

  @override
  String get appBlockingHeadline1 => '礼拜时间到了';

  @override
  String get appBlockingHeadline2 => '守护你的时间';

  @override
  String get appBlockingDefaultTitle => '礼拜时间';

  @override
  String get appBlockingIPrayedButton => '我已礼拜';

  @override
  String get appBlockingReadAyahsButton => '阅读 3 节经文';

  @override
  String get appBlockingEmergencyBypass => '紧急绕过';

  @override
  String get appBlockingSkipForNow => '暂时跳过';

  @override
  String get appBlockingBypassConfirmTitle => '结束你的连续记录？';

  @override
  String get appBlockingBypassConfirmBody =>
      '现在绕过将重置你的礼拜连续记录。如果是真正的紧急情况，你可以继续。';

  @override
  String get appBlockingBypassConfirmContinue => '仍要绕过';

  @override
  String get appBlockingBypassConfirmCancel => '返回';

  @override
  String get appBlockingSoftReminderTitle => '温和的提醒';

  @override
  String get appBlockingSoftReminderBody => '礼拜时间到了——考虑暂时离开一下。';

  @override
  String get quranChallengeBannerTitle => '阅读 3 节经文以解锁';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '已读 $count/$total 节经文';
  }

  @override
  String get quranChallengeComplete => '做得好——应用已解锁';

  @override
  String get focusBlockHeadline1 => '保持专注';

  @override
  String get focusBlockHeadline2 => '继续坚持';

  @override
  String get endFocusSessionButton => '结束专注时段';

  @override
  String get focusPaused => '已暂停以进行礼拜';

  @override
  String get selectLocationTitle => '选择位置';

  @override
  String get useCurrentLocation => '使用当前位置';

  @override
  String get savedLocationsHeader => '已保存的位置';

  @override
  String get noSavedLocationsYet => '还没有保存的位置。在下方搜索以添加一个。';

  @override
  String get searchCityHint => '搜索城市名称…';

  @override
  String get addLocationTooltip => '添加位置';

  @override
  String get deleteLocationTooltip => '删除位置';

  @override
  String get locationNotFound => '未找到该位置。请尝试其他搜索。';

  @override
  String maxLocationsReachedMessage(int max) {
    return '您最多可以保存 $max 个位置';
  }

  @override
  String get notificationsToggleUnconfirmed => '无法确认更改——请重试';

  @override
  String get tasbihCounter => '念珠计数器';

  @override
  String get tasbihCounterSubtitle => '记录你的赞念';

  @override
  String get tasbihResetButton => '重置';

  @override
  String get tasbihTotalLabel => '总计';

  @override
  String get tasbihCelebrationTitle => '赞念完成！';

  @override
  String get tasbihCelebrationBody => '你已完成全部99次赞念。愿安拉接受你的赞念。';

  @override
  String get tasbihStartNewSession => '开始新一轮';

  @override
  String get tasbihUndoButton => '撤销';

  @override
  String get tasbihTapAnywhereHint => '点击屏幕任意位置即可计数';

  @override
  String get tasbihSoundToggleTooltip => '点击音效';

  @override
  String get tasbihManageDhikrTooltip => '管理迪克尔';

  @override
  String get tasbihStatsTooltip => '查看统计';

  @override
  String get tasbihDailyTotalLabel => '今日总计';

  @override
  String get tasbihRoundsTodayLabel => '今日轮次';

  @override
  String get tasbihManageDhikrTitle => '管理迪克尔';

  @override
  String get tasbihAddCustomDhikrButton => '添加自定义迪克尔';

  @override
  String get tasbihDeleteDhikrTooltip => '删除';

  @override
  String get tasbihBuiltInDhikrBadge => '内置';

  @override
  String get tasbihCannotDeleteLastDhikr => '您至少需要保留一个迪克尔';

  @override
  String get tasbihDhikrNameLabel => '名称';

  @override
  String get tasbihDhikrNameHint => '例如：Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => '阿拉伯文（可选）';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => '请输入名称';

  @override
  String get tasbihSaveDhikrButton => '保存';

  @override
  String get tasbihStatsTitle => '念珠统计';

  @override
  String get tasbihAllTimeTotalLabel => '历史总计';

  @override
  String get tasbihNoActivityYetMessage => '开始计数即可在此查看您的统计数据。';

  @override
  String get tasbihSoundPickerTitle => '点击音效';

  @override
  String get tasbihSoundClassicClick => '经典咔嗒声';

  @override
  String get tasbihSoundSoftChime => '轻柔风铃声';

  @override
  String get tasbihSoundStoneTap => '石头轻敲声';

  @override
  String get tasbihCurrentlyReciting => '正在念诵';

  @override
  String tasbihOfTarget(int target) {
    return '／$target';
  }

  @override
  String get tasbihSoundRainDrop => '雨滴声';

  @override
  String get tasbihSoundSoftFeather => '轻柔羽触';

  @override
  String noAyahsFound(String query) {
    return '未找到“$query”的相关经文';
  }

  @override
  String get trySearchingQuran => '用中文、英文或阿拉伯文搜索，或使用伊斯兰术语：';

  @override
  String get loadingQuranIndex => '正在加载古兰经索引…';

  @override
  String get quranSearchSuggestions => '忍耐, 耐心, 慈悟, 礼拜, 祝福, 宽恕, 天堂, 知识, 感恩, 记主';

  @override
  String get heroVerse1 => '你们要谨守拜功，尤其是中间的那次礼拜。';

  @override
  String get heroVerse2 => '礼拜对于信士确是定时的义务。';

  @override
  String get heroVerse3 => '你们当以坚忍和礼拜求佑助。';

  @override
  String get heroVerse4 => '故你们应记念我，我必记念你们。你们应感谢我，而不要辜负我。';

  @override
  String get heroVerse5 => '谁托靠真主，真主必定佑护他。';

  @override
  String get heroVerse6 => '确实，为众人而最早建立的清真寺，是位于麦加的那一座——吉祥的、全世界的向导。';

  @override
  String get heroVerse7 => '确实，礼拜能禁止丑事和恶行，记念真主确是更重要的。';

  @override
  String get heroVerse8 => '确实，只有记念真主，才能使心灵平静。';

  @override
  String get heroVerse9 => '你们当祈求我，我必响应你们。';

  @override
  String get heroVerse10 => '如果你们感谢，我必增加你们的恩典。';

  @override
  String get heroVerse11 => '真主不使任何人负担他所不能承受的。';

  @override
  String get heroVerse12 => '真主确是与坚忍者同在的。';

  @override
  String get heroVerse13 => '我的慈恩包罗万象。';

  @override
  String get heroVerse14 => '你们应行善，真主确实喜爱行善的人。';

  @override
  String get heroVerse15 => '这部经典，其中毫无疑义，是敬畏者的向导。';

  @override
  String get accuracyHigh => '高精度';

  @override
  String get accuracyMedium => '中等精度';

  @override
  String get accuracyLow => '低精度';

  @override
  String get accuracyCalibrating => '校准中…';

  @override
  String get compassNeedsCalibration => '指南针需要校准';

  @override
  String get compassCalibrationHint => '慢慢将手机做8字形运动以提高精度。';

  @override
  String get spiritLevelLabel => '水平仪';

  @override
  String get spiritLevelLevelText => '✓  水平';

  @override
  String get spiritLevelTiltText => '倾斜以调平';

  @override
  String get compassNorth => '北';

  @override
  String get compassEast => '东';

  @override
  String get compassSouth => '南';

  @override
  String get compassWest => '西';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => '守护你的时间。尊重你的礼拜。';

  @override
  String get stopAdhan => '停止阿赞';

  @override
  String get duasSearchEmpty => '请尝试其他分类或搜索词。';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingWelcomeTo => '欢迎使用';

  @override
  String get onboardingSubtitle => '您在美丽的伊斯兰之旅中的伴侣。';

  @override
  String get onboardingLetsGetStarted => '开始吧';

  @override
  String onboardingStepOf(int step, int total) {
    return '$total 中的 $step';
  }

  @override
  String get onboardingWhatsYourName => '您叫什么名字？';

  @override
  String get onboardingNameSubtitle => '我们很想知道如何称呼您。';

  @override
  String get onboardingNameHint => '输入您的名字';

  @override
  String get onboardingContinue => '继续';

  @override
  String get onboardingAreYouNewToIslam => '您是伊斯兰的新人吗？';

  @override
  String get onboardingModeSubtitle => '我们将根据您的旅程个性化您的体验。';

  @override
  String get onboardingNewToIslam => '我是伊斯兰新人';

  @override
  String get onboardingNewToIslamDesc => '适合初学者的逐步引导模式';

  @override
  String get onboardingFamiliarWithIslam => '我熟悉伊斯兰';

  @override
  String get onboardingFamiliarWithIslamDesc => '具有完整功能的常规模式';

  @override
  String greetingWithName(String name) {
    return 'السلام عليكم，$name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return '成为穆斯林第$days天';
  }

  @override
  String get beginnerEssential1 => '新穆斯林指南';

  @override
  String get beginnerEssential2 => '学习小净（净礼）';

  @override
  String get beginnerEssential3 => '如何礼拜（逐步指南）';

  @override
  String get beginnerEssential4 => '《开端章》（法提哈章）';

  @override
  String get beginnerEssential5 => '日常祈祷（杜阿）';

  @override
  String get beginnerEssential6 => '理解清真言（作证词）';

  @override
  String get beginnerEssential7 => '伊斯兰术语与词汇表';

  @override
  String get beginnerExploreAll => '探索所有功能';

  @override
  String get beginnerExploreSubtitle => '切换至完整的Noor Guard体验';

  @override
  String get beginnerExploreFeaturesSubtitle => 'Noor Guard 的全部功能';

  @override
  String get beginnerLearnSalah => '学习礼拜';

  @override
  String get beginnerMayAllahGuide => '愿真主引导你的脚步，祝福你的旅程。';

  @override
  String get beginnerMuslimEssentials => '穆斯林基础';

  @override
  String get beginnerQuote1 => '困难之后必有安逸。——《古兰经》第94章第6节';

  @override
  String get beginnerQuote2 => '遵守真主的命令，真主将保佑你。';

  @override
  String get beginnerQuote3 => '真主看的是你的内心和行为，而非你的外表。';

  @override
  String get beginnerQuote4 => '每一步走向礼拜，都是走向平静的一步。';

  @override
  String get beginnerQuote5 => '你们中最好的人是学习古兰经并教授它的人。';

  @override
  String get beginnerTapToSetShahadaDate => '点击设置您的作证词日期';

  @override
  String get beginnerToolboxSection => '初学者工具箱';

  @override
  String get beginnerYourJourney => '你的旅程';

  @override
  String get journeyMonth1Name => '第一个月：基础';

  @override
  String get journeyMonth2Name => '第二个月：养成习惯';

  @override
  String get journeyMonth3Name => '第三个月：深化信仰';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String get journeyViewFull => '查看完整旅程 →';

  @override
  String get journeyTask2_1 => '连续7天完成5次礼拜';

  @override
  String get journeyTask2_2 => '再学10段祈祷词';

  @override
  String get journeyTask2_3 => '阅读《古兰经》第一卷';

  @override
  String get journeyTask2_4 => '学习真主99个名字';

  @override
  String get journeyTask2_5 => '连续7天每日使用念珠计数器';

  @override
  String get journeyTask2_6 => '学习圣行礼拜';

  @override
  String get journeyTask2_7 => '找到当地清真寺';

  @override
  String get journeyTask3_1 => '阅读苏拉·巴卡拉';

  @override
  String get journeyTask3_2 => '了解天课（扎卡特）';

  @override
  String get journeyTask3_3 => '了解封斋（斋戒）';

  @override
  String get journeyTask3_4 => '背诵3段新苏拉';

  @override
  String get journeyTask3_5 => '了解朝觐（哈吉）';

  @override
  String get journeyTask3_6 => '与他人分享伊斯兰';

  @override
  String get journeyTask3_7 => '完成伊斯兰词汇表';

  @override
  String get journeyTimelineTitle => '我的旅程';

  @override
  String get journeyCompleted => '已完成';

  @override
  String get journeyInProgress => '进行中';

  @override
  String get journeyLocked => '已锁定';

  @override
  String get wuduThreeTimes => '3次';

  @override
  String get wuduDuaBefore => '净礼前的祈祷';

  @override
  String get wuduDuaAfter => '净礼后的祈祷';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => '奉真主之名';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      '我作证万物非主，唯有真主，独一无二，无与伦比。我作证穆罕默德是祂的仆人和使者。主啊，使我成为悔过者，使我成为清洁者。';

  @override
  String get wuduCompleteButton => '我完成了净礼';

  @override
  String get howToPrayStepOpeningDua => '开场祈祷';

  @override
  String get howToPrayStepAlFatiha => '法提哈章';

  @override
  String get howToPrayStepSurah => '短章';

  @override
  String get howToPrayStepTashahhudShort => '作证词（中间坐）';

  @override
  String get howToPrayStepSalawat => '向先知 ﷺ 祈祷';

  @override
  String get howToPrayTransTakbir => '真主至大';

  @override
  String get howToPrayTransOpeningDua =>
      '赞美你，真主啊，以你的赞美；你的名字是吉祥的，你的尊严是崇高的，除你之外无真主。';

  @override
  String get howToPrayTransFatiha =>
      '以至仁至慈的真主之名。一切赞美归真主，全世界的主。至仁至慈的主。报应日的主。我们只崇拜你，只向你求助。求你引导我们走上正路——你所赐恩典的人们的路，不是那些受谴怒的人的路，也不是那些迷途的人的路。';

  @override
  String get howToPrayTransRuku => '赞美我的伟大之主';

  @override
  String get howToPrayTransItidal => '真主倾听赞美祂之人。我们的主，一切赞美归于你。';

  @override
  String get howToPrayTransSujood => '赞美我的至高之主';

  @override
  String get howToPrayTransJalsa => '我的主，求你饶恕我';

  @override
  String get howToPrayTransTashahhud =>
      '一切问候、祈祷和美言都属于真主。愿真主赐平安给你，先知啊，以及祂的慈悯与祝福。愿真主赐平安给我们和祂的虔诚仆人。我作证除真主外无神，我作证穆罕默德是祂的仆人和使者。';

  @override
  String get howToPrayTransSalawat =>
      '真主啊，求你赐福于穆罕默德及其家人，犹如你赐福于易卜拉欣及其家人——你确是值得赞美的、尊贵的。真主啊，求你赐恩于穆罕默德及其家人，犹如你赐恩于易卜拉欣及其家人——你确是值得赞美的、尊贵的。';

  @override
  String get howToPrayTransTasleem => '愿平安与真主的慈悯降于你们';

  @override
  String get howToPrayOpeningDuaInstruction => '在开场大赞词之后，轻声诵读此祈祷词。仅在礼拜开始时诵读一次。';

  @override
  String get howToPraySurahInstruction =>
      '法提哈之后，诵读你记住的任何章节。以哈斯章（如上）非常适合初学者——仅在前两拜诵读。';

  @override
  String get howToPrayItidalInstruction => '起身时念\'萨米阿拉呼\',起立后念\'拉巴那瓦拉卡勒罕\'。';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      '第二拜后坐下，念作证词时举起右手食指。三拜和四拜礼拜中，此后将再次起立。';

  @override
  String get howToPraySalawatInstruction => '在最后的作证词之后，仅在最后一次坐中，道萨拉姆之前，诵读祈祷词。';

  @override
  String get howToPrayTasleemInstruction => '头转向右边，诵读萨拉姆，再转向左边重复。您的礼拜已完成。';

  @override
  String get howToPrayOnceOpens => '一次——开始礼拜';

  @override
  String get howToPrayFirstRakahOnly => '仅第一拜';

  @override
  String get howToPrayFirst2RakahsOnly => '仅前两拜';

  @override
  String get howToPrayEveryRakah => '每拜';

  @override
  String get howToPrayAfter2ndRakah => '第二拜后';

  @override
  String get howToPrayFinalSittingOnly => '仅最后坐';

  @override
  String get howToPrayClosesThePrayer => '结束礼拜';

  @override
  String get howToPraySectionBefore => '礼拜前';

  @override
  String get howToPraySectionRakah => '拜';

  @override
  String get howToPraySectionMiddleSitting => '中间坐';

  @override
  String get howToPraySectionFinalSitting => '最后坐';

  @override
  String get howToPrayRakahLabel => '拜';

  @override
  String get howToPrayCompleteButton => '我已完成礼拜';

  @override
  String get howToPrayMashaallah => '马沙阿拉！';

  @override
  String get howToPrayAccepted => '愿真主接受您的礼拜。';

  @override
  String get fatihaIntroTitle => '古兰经之母';

  @override
  String get fatihaIntroBody =>
      '苏拉·法蒂哈是古兰经中最伟大的章节。它在每一个礼拜单位中诵读——每天至少17次。这是仆人与真主之间完整的对话，也是每次礼拜的入口。';

  @override
  String get fatihaIntroIbnKathir =>
      '伊本·卡西尔写道：\'法蒂哈包含整部古兰经的精华——它是祈祷、奴仆身份的宣言，以及对引导至正道的请求。\'——伊本·卡西尔注释';

  @override
  String get shahadaScreenTitle => '清真言';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation => '我作证除了真主安拉之外没有应当崇拜的，我又作证穆罕默德是安拉的使者';

  @override
  String get shahadaWordBreakdownTitle => '逐词解析';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => '没有';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => '神 / 主';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => '除了';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => '安拉（独一的主）';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Muḥammadun';

  @override
  String get shahadaWord5Meaning => '穆罕默德';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Rasūlu';

  @override
  String get shahadaWord6Meaning => '使者 / 先知';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => '安拉的';

  @override
  String get shahadaMeaningTitle => '含义与意义';

  @override
  String get shahadaMeaningBody =>
      '清真言是构成伊斯兰教基础的信仰宣言。这是五功之首。真诚地念出这些话，一个人就进入了伊斯兰教。伊本·卡西尔解释说，第一部分否定一切假神，肯定安拉绝对的独一性。';

  @override
  String get shahadaMomentTitle => '念清真言的时刻';

  @override
  String get shahadaMomentBody =>
      '当一个人第一次用真诚的心念诵清真言时，深刻的事情发生了——他们开始了新的生命。先知ﷺ说：\'凡说除安拉外别无神灵，并不信仰除祂之外所崇拜的一切者，其财产和血统受到保护。\'（穆斯林圣训集）。过去所有的罪孽都被宽恕。欢迎来到伊斯兰。';

  @override
  String get shahadaPronunciationTitle => '发音指南';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => '逐步指南';

  @override
  String get toolboxWuduSubtitle => '礼拜前的净化';

  @override
  String get toolboxGlossarySubtitle => '114个伊斯兰术语解释';

  @override
  String get shareSheetTitle => '分享';

  @override
  String get shareAnAyah => '分享经文';

  @override
  String get shareADua => '分享祈祷词';

  @override
  String get shareANameOfAllah => '分享真主之名';

  @override
  String get shareAHadith => '分享圣训';

  @override
  String get shareViaLabel => '通过 Noor Guard 分享';

  @override
  String get shareCardAyahLabel => '✦ 今日经文';

  @override
  String get shareCardDuaLabel => '✦ 祈祷词';

  @override
  String get shareCardNameLabel => '✦ 真主之名';

  @override
  String get shareCardHadithLabel => '✦ 圣训';

  @override
  String get sharePickDuaTitle => '选择要分享的祈祷词';

  @override
  String get shareError => '无法创建分享图片';

  @override
  String get shareCardVerseLabel => '✦ 《古兰经》节';

  @override
  String get shareAyahSubtitle => '从30段经文中选择';

  @override
  String get shareDuaSubtitle => '从库中选择';

  @override
  String get shareNameSubtitle => '从全部99个美名中选择';

  @override
  String get shareHadithSubtitle => '从20段圣训中选择';

  @override
  String get shareThisDua => '分享这段祈祷词';

  @override
  String get sharePickAyahTitle => '选择一段经文分享';

  @override
  String get searchAyahs => '搜索经文…';

  @override
  String get noAyahsFoundShort => '未找到经文';

  @override
  String get shareThisAyah => '分享此经文';

  @override
  String get sharePickNameTitle => '选择一个名字分享';

  @override
  String get shareThisName => '分享此名字';

  @override
  String get sharePickHadithTitle => '选择一段圣训分享';

  @override
  String get searchHadiths => '搜索圣训…';

  @override
  String get noHadithsFound => '未找到圣训';

  @override
  String get shareThisHadith => '分享此圣训';

  @override
  String get backToBasics => '回归基础';

  @override
  String get backToBasicsSubtitle => '您的伊斯兰基础知识指南';

  @override
  String get fivePillarsOfIslam => '伊斯兰五功';

  @override
  String get fivePillarsSubtitle => '伊斯兰信仰的基础';

  @override
  String get pillarLearnMore => '了解更多';

  @override
  String get pillarShowLess => '收起';

  @override
  String get pillarsShowDetails => '显示详情';

  @override
  String get pillarsHideDetails => '隐藏详情';

  @override
  String get pillar1Name => '清真言';

  @override
  String get pillar1Desc => '信仰的宣言';

  @override
  String get pillar1Detail =>
      '信仰证言是伊斯兰的基础。真诚说出「万物非主，唯有真主，穆罕默德是真主的使者」，一个人便进入伊斯兰。';

  @override
  String get pillar2Name => '礼拜';

  @override
  String get pillar2Desc => '每日五次礼拜';

  @override
  String get pillar2Detail =>
      '每日五次礼拜是穆斯林与安拉之间的直接联系。分别在黎明、正午、下午、日落和夜晚礼拜，使穆斯林整天围绕着对安拉的记念。';

  @override
  String get pillar3Name => '天课';

  @override
  String get pillar3Desc => '法定施舍';

  @override
  String get pillar3Detail => '天课是每年将储蓄的2.5%强制施舍给有需要者的义务。它净化财富，加强穆斯林社区的纽带。';

  @override
  String get pillar4Name => '封斋';

  @override
  String get pillar4Desc => '斋月封斋';

  @override
  String get pillar4Detail => '在吉祥的斋月从黎明到日落封斋。穆斯林戒除饮食和罪恶，以获得塔格瓦（对真主的敬畏）与感恩之心。';

  @override
  String get pillar5Name => '朝觐';

  @override
  String get pillar5Desc => '麦加朝圣';

  @override
  String get pillar5Detail => '前往麦加朝觐是每位有能力的穆斯林一生中必须完成一次的功课，也是地球上规模最大的年度人类聚集。';
}
