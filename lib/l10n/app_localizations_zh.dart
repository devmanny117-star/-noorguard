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
  String get islamicMonthRabiAlAwwal => '赖比尔·敖外鲁月';

  @override
  String get islamicMonthRamadan => '莱麦丹月（斋月）';

  @override
  String get islamicMonthShawwal => '闪瓦鲁月';

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
}
