// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Да благословит Аллах ваш день';

  @override
  String get nextPrayer => 'Следующий намаз';

  @override
  String get iPrayedButton => 'Намаз совершён';

  @override
  String get todaysPrayers => 'Намазы на сегодня';

  @override
  String get qibla => 'Кибла';

  @override
  String get focusMode => 'Режим фокусировки';

  @override
  String get appBlocking => 'Блокировка приложений';

  @override
  String get islamicCalendar => 'Исламский календарь';

  @override
  String get islamicCalendarSubtitle => 'Даты и события по Хиджре';

  @override
  String get duas => 'Дуа';

  @override
  String get quran => 'Коран';

  @override
  String get settings => 'Настройки';

  @override
  String get complete => 'Выполнено';

  @override
  String get streak => 'Серия';

  @override
  String get dayStreak => 'дней подряд';

  @override
  String get compassRequiresDevice =>
      'Для компаса требуется реальное устройство';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Все намазы совершены! 🎉';

  @override
  String prayersCompleted(int completed) {
    return 'Совершено намазов: $completed/5';
  }

  @override
  String get fajr => 'Фаджр';

  @override
  String get dhuhr => 'Зухр';

  @override
  String get asr => 'Аср';

  @override
  String get maghrib => 'Магриб';

  @override
  String get isha => 'Иша';

  @override
  String fardRakats(int count) {
    return '$count ракаата фард';
  }

  @override
  String sunnahBefore(int count) {
    return '$count сунны до';
  }

  @override
  String sunnahAfter(int count) {
    return '$count сунны после';
  }

  @override
  String prayedAt(String time) {
    return 'Совершён в $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'на рассвете до восхода солнца';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'после прохождения солнцем зенита';

  @override
  String get timePeriodLateAfternoon => 'во второй половине дня';

  @override
  String get timePeriodJustAfterSunset => 'сразу после заката';

  @override
  String get timePeriodNightBeforeMidnight => 'ночью до полуночи';

  @override
  String get fajrHadith =>
      'Два ракаата Фаджра лучше, чем этот мир и всё, что в нём. — Пророк Мухаммад ﷺ';

  @override
  String get fajrTip =>
      'Фаджр — первый намаз дня. Он напоминает нам начинать день с поминания Аллаха.';

  @override
  String get dhuhrHadith =>
      'Тому, кто совершает двенадцать ракаатов сунны, Аллах построит дом в Раю.';

  @override
  String get dhuhrTip =>
      'Зухр — полуденный намаз. Прекрасный момент, чтобы сделать паузу и вновь обратиться к Аллаху.';

  @override
  String get asrHadith =>
      'Кто пропустил намаз Аср, тот словно потерял свою семью и имущество. — Пророк Мухаммад ﷺ';

  @override
  String get asrTip =>
      'Аср часто называют средним намазом. Аллах особо упоминает его в Коране (2:238).';

  @override
  String get maghribHadith => 'Намаз Магриб — это витр дня.';

  @override
  String get maghribTip =>
      'Магриб знаменует окончание дня поста в Рамадан. Он совершается сразу после захода солнца.';

  @override
  String get ishaHadith =>
      'Кто совершил Иша в джамаате, тот словно молился половину ночи.';

  @override
  String get ishaTip =>
      'Иша — последний намаз дня. Завершение дня молитвой приносит покой и умиротворение.';

  @override
  String get newMuslimTip => 'Совет новому мусульманину';

  @override
  String get notificationsOn => 'Уведомления включены';

  @override
  String get notificationsOff => 'Уведомления выключены';

  @override
  String get preview => 'Предпросмотр';

  @override
  String get lockPreviewCountdown => 'Через 1 ч 23 мин  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Проведите вверх, чтобы разблокировать';

  @override
  String get searchSurahs => 'Поиск сур…';

  @override
  String get noSurahsFound => 'Суры не найдены';

  @override
  String get tryAgain => 'Повторить';

  @override
  String ayahs(int count) {
    return 'Аятов: $count';
  }

  @override
  String get searchDuas => 'Поиск дуа…';

  @override
  String supplications(int count) {
    return 'Дуа: $count';
  }

  @override
  String get prayerSettings => 'Настройки намаза';

  @override
  String get calculationMethod => 'Метод расчёта';

  @override
  String get adhanSound => 'Звук азана';

  @override
  String get prayerNotifications => 'Уведомления о намазах';

  @override
  String get statusOn => 'Вкл.';

  @override
  String get statusOff => 'Выкл.';

  @override
  String get enableAllNotifications => 'Включить все уведомления';

  @override
  String get individualPrayers => 'Отдельные намазы';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get darkMode => 'Тёмная тема';

  @override
  String get language => 'Язык';

  @override
  String get aboutNoorGuard => 'О приложении';

  @override
  String get version => 'Версия приложения';

  @override
  String get rateApp => 'Оценить Noor Guard';

  @override
  String get shareApp => 'Поделиться Noor Guard';

  @override
  String get contactSupport => 'Связаться с поддержкой';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get helpUsImprove => 'Помогите нам стать лучше';

  @override
  String get translationDisclaimer =>
      'Наши переводы выполнены с помощью ИИ. Если вы заметили ошибки на вашем языке, мы будем рады вашему отзыву!';

  @override
  String get privacyPromiseTitle => 'Обещание конфиденциальности Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Ваша вера — это личное. Ваши данные остаются личными. Мы никогда не продаём, не передаём и не монетизируем ваши данные. Ни ваше местоположение. Ни ваши молитвенные привычки. Ни ваше имя.';

  @override
  String get directionToSacredHouse => 'Направление к Заповедному Дому';

  @override
  String towardMecca(String degrees) {
    return '$degrees° в сторону Мекки';
  }

  @override
  String get defaultLocation => 'Сакраменто, Калифорния (по умолчанию)';

  @override
  String get prayerHistory => 'История намазов';

  @override
  String get currentStreak => 'Текущая серия';

  @override
  String get longestStreak => 'Рекордная серия';

  @override
  String get legend => 'Обозначения';

  @override
  String get allFivePrayers => 'Все 5 намазов';

  @override
  String get partialPrayers => 'Частично (1–4)';

  @override
  String get none => 'Нет';

  @override
  String get sun => 'Вс';

  @override
  String get mon => 'Пн';

  @override
  String get tue => 'Вт';

  @override
  String get wed => 'Ср';

  @override
  String get thu => 'Чт';

  @override
  String get fri => 'Пт';

  @override
  String get sat => 'Сб';

  @override
  String headingDegrees(String degrees) {
    return 'Курс $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Не удалось загрузить суры';

  @override
  String get connectionError =>
      'Проверьте подключение к интернету и повторите попытку';

  @override
  String get alQuran => 'Аль-Коран';

  @override
  String get dailySupplications => 'Ежедневные дуа';

  @override
  String get all => 'Все';

  @override
  String get noDuasFound => 'Дуа не найдены';

  @override
  String get january => 'Январь';

  @override
  String get february => 'Февраль';

  @override
  String get march => 'Март';

  @override
  String get april => 'Апрель';

  @override
  String get may => 'Май';

  @override
  String get june => 'Июнь';

  @override
  String get july => 'Июль';

  @override
  String get august => 'Август';

  @override
  String get september => 'Сентябрь';

  @override
  String get october => 'Октябрь';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String get home => 'Главная';

  @override
  String get prayers => 'Намазы';

  @override
  String get more => 'Ещё';

  @override
  String get tafsir => 'Тафсир';

  @override
  String get lockScreen => 'Экран блокировки';

  @override
  String get readAndListen => 'Читайте и слушайте';

  @override
  String get commentary => 'Толкование';

  @override
  String get findDirection => 'Найти направление';

  @override
  String get reminders => 'Напоминания';

  @override
  String get blockDistractions => 'Блокировка отвлечений';

  @override
  String get prayerGuard => 'Защита намаза';

  @override
  String get importantDates => 'Важные даты';

  @override
  String get comingSoon => 'Скоро';

  @override
  String get morningAndEvening => 'Утро и вечер';

  @override
  String get prayer => 'Намаз';

  @override
  String get foodAndDrink => 'Еда и питьё';

  @override
  String get verityWithHardship =>
      'Воистину, за тягостью наступает облегчение.';

  @override
  String get ashSharh946 => 'Аш-Шарх 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Оберегайте намазы, и особенно средний намаз.';

  @override
  String get alBaqarah2238 => 'Аль-Бакара 2:238';

  @override
  String get pastEvents => 'Прошедшие события';

  @override
  String get upcomingEvents => 'Предстоящие события';

  @override
  String get today => 'Сегодня';

  @override
  String get next => 'Следующее';

  @override
  String hijriYearLabel(int year) {
    return '$year г. хиджры';
  }

  @override
  String get islamicMonthMuharram => 'Мухаррам';

  @override
  String get islamicMonthSafar => 'Сафар';

  @override
  String get islamicMonthRabiAlAwwal => 'Раби аль-авваль';

  @override
  String get islamicMonthRabiAlThani => 'Раби ас-сани';

  @override
  String get islamicMonthJumadaAlAwwal => 'Джумада аль-уля';

  @override
  String get islamicMonthJumadaAlThani => 'Джумада ас-сани';

  @override
  String get islamicMonthRajab => 'Раджаб';

  @override
  String get islamicMonthShaban => 'Шаабан';

  @override
  String get islamicMonthRamadan => 'Рамадан';

  @override
  String get islamicMonthShawwal => 'Шавваль';

  @override
  String get islamicMonthDhulQadah => 'Зуль-каада';

  @override
  String get islamicMonthDhulHijjah => 'Зуль-хиджа';

  @override
  String get islamicNewYear => 'Исламский Новый год';

  @override
  String get ashura => 'Ашура';

  @override
  String get mawlidAlNabi => 'Мавлид ан-Наби';

  @override
  String get ramadanBegins => 'Начало Рамадана';

  @override
  String get laylatAlQadr => 'Ляйлят аль-Кадр';

  @override
  String get eidAlFitr => 'Ид аль-Фитр';

  @override
  String get dayOfArafah => 'День Арафа';

  @override
  String get eidAlAdha => 'Ид аль-Адха';

  @override
  String get active => 'Активен';

  @override
  String get focusModeSubtitle =>
      'Защитите свою сосредоточенность. Ваши приложения заблокированы, пока вы не остановите сессию.';

  @override
  String get remaining => 'осталось';

  @override
  String get ready => 'готово';

  @override
  String get duration => 'Длительность';

  @override
  String get minutesAbbreviation => 'мин';

  @override
  String get blockedDuringFocus => 'Заблокировано во время фокусировки';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count приложения',
      many: '$count приложений',
      few: '$count приложения',
      one: '$count приложение',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Начать фокусировку';

  @override
  String get stopFocus => 'Остановить фокусировку';

  @override
  String get alhamdulillah => 'Альхамдулиллях!';

  @override
  String get sessionComplete => 'Сессия завершена';

  @override
  String stayedFocusedFor(String duration) {
    return 'Вы сохраняли сосредоточенность в течение $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минуты',
      many: '$count минут',
      few: '$count минуты',
      one: '$count минута',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '«Обратитесь за помощью к терпению и намазу.»\n— Аль-Бакара 2:45';

  @override
  String get done => 'Готово';

  @override
  String get socialMedia => 'Соцсети';

  @override
  String get entertainment => 'Развлечения';

  @override
  String get games => 'Игры';

  @override
  String get messaging => 'Мессенджеры';

  @override
  String get blockDuringPrayerTimes => 'Блокировать во время намазов';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Выбранные приложения будут автоматически блокироваться\nво время всех 5 ежедневных намазов.';

  @override
  String get blockedLabel => 'заблокировано';

  @override
  String get blockAllApps => 'Блокировать все приложения';

  @override
  String get blockingTimingInfo =>
      'Блокировка включается за 5 минут до каждого намаза и снимается через 15 минут после него.';

  @override
  String get blockedDuringPrayers => 'Заблокировано во время намазов';

  @override
  String get notBlocked => 'Не заблокировано';

  @override
  String get wuduStep1 => 'Намерение';

  @override
  String get wuduStep2 => 'Бисмиллях';

  @override
  String get wuduStep3 => 'Мытьё кистей';

  @override
  String get wuduStep4 => 'Полоскание рта';

  @override
  String get wuduStep5 => 'Промывание носа';

  @override
  String get wuduStep6 => 'Мытьё лица';

  @override
  String get wuduStep7 => 'Мытьё рук до локтей';

  @override
  String get wuduStep8 => 'Протирание головы';

  @override
  String get wuduStep9 => 'Мытьё ног';

  @override
  String get revertCorner => 'Уголок нового мусульманина';

  @override
  String get revertCornerSubtitle =>
      'Руководства и поддержка для новых мусульман';

  @override
  String get wuduGuide => 'Руководство по Вуду';

  @override
  String get howToPray => 'Как совершать намаз';

  @override
  String get newMuslimChecklist => 'Чек-лист нового мусульманина';

  @override
  String get islamicGlossary => 'Исламский глоссарий';

  @override
  String get whyDoWe => 'Почему мы...';

  @override
  String get communityStories => 'Истории общины';

  @override
  String get wuduGuideSubtitle => 'Очищение перед намазом';

  @override
  String get howToPraySubtitle => 'Пошаговое руководство по саляху';

  @override
  String get newMuslimChecklistSubtitle => 'Ваш 30-дневный путь';

  @override
  String get howToPrayStep1Name => 'Сначала Вуду';

  @override
  String get howToPrayStep1Instruction =>
      'Совершите вуду (омовение), чтобы находиться в состоянии чистоты перед началом намаза.';

  @override
  String get howToPrayStep1Tip =>
      'Если вы не уверены, как это делать, сначала откройте Руководство по Вуду в разделе для новых мусульман.';

  @override
  String get howToPrayStep2Name => 'Встаньте лицом к Кибле';

  @override
  String get howToPrayStep2Instruction =>
      'Встаньте на молитвенный коврик лицом к Кибле — в направлении Каабы в Мекке. Используйте компас Киблы в приложении, чтобы найти точное направление.';

  @override
  String get howToPrayStep2Tip =>
      'Ничего страшного, если вы немного отклонились — Аллах знает ваше намерение. Старайтесь как можете.';

  @override
  String get howToPrayStep3Name => 'Ният (намерение)';

  @override
  String get howToPrayStep3Instruction =>
      'Сделайте в сердце намерение о намазе, который собираетесь совершить. Произносить его вслух не обязательно.';

  @override
  String get howToPrayStep3Tip =>
      'Ваше намерение — между вами и Аллахом. Достаточно простой мысли: «Я совершаю Фаджр ради Аллаха».';

  @override
  String get howToPrayStep4Name => 'Такбир (начало)';

  @override
  String get howToPrayStep4Instruction =>
      'Поднимите обе руки к мочкам ушей и произнесите «Аллаху Акбар» (Аллах Велик). С этого официально начинается ваш намаз.';

  @override
  String get howToPrayStep4Tip =>
      'На протяжении всего намаза держите взгляд опущенным к месту земного поклона.';

  @override
  String get howToPrayStep5Name => 'Кыям (стояние)';

  @override
  String get howToPrayStep5Instruction =>
      'Положите правую руку поверх левой на груди. Прочитайте суру Аль-Фатиха, а затем любую другую короткую суру или аяты, которые вы знаете.';

  @override
  String get howToPrayStep5Tip =>
      'Если вы пока не знаете других сур, во время обучения достаточно читать только Аль-Фатиху.';

  @override
  String get howToPrayStep6Name => 'Руку (поясной поклон)';

  @override
  String get howToPrayStep6Instruction =>
      'Совершите поклон, согнувшись в поясе так, чтобы спина была параллельна земле. Положите руки на колени и произнесите «Субхана Раббияль Азым» три раза.';

  @override
  String get howToPrayStep6Tip =>
      'Держите спину прямой и горизонтальной — не выгнутой и не округлённой.';

  @override
  String get howToPrayStep7Name => 'Итидаль (выпрямление после поклона)';

  @override
  String get howToPrayStep7Instruction =>
      'Поднимитесь из поклона и выпрямитесь. Поднимаясь, произнесите «Сами Аллаху лиман хамидах» (Аллах слышит тех, кто восхваляет Его), затем скажите «Раббана лакаль хамд».';

  @override
  String get howToPrayStep7Tip =>
      'Полностью выпрямитесь и на мгновение замрите, прежде чем перейти к следующему положению.';

  @override
  String get howToPrayStep8Name => 'Суджуд (земной поклон)';

  @override
  String get howToPrayStep8Instruction =>
      'Опуститесь на землю, коснувшись пола лбом, носом, обеими ладонями, коленями и пальцами ног. Произнесите «Субхана Раббияль А\'ля» три раза.';

  @override
  String get howToPrayStep8Tip =>
      'Земли должны касаться семь частей тела: лоб (вместе с носом), две руки, два колена и две стопы.';

  @override
  String get howToPrayStep9Name => 'Джальса (сидение между поклонами)';

  @override
  String get howToPrayStep9Instruction =>
      'Поднимитесь из земного поклона и сядьте: левая стопа лежит плашмя, правая стоит вертикально. Садясь, произнесите «Аллаху Акбар». Сделайте короткую паузу, затем снова опуститесь для второго земного поклона.';

  @override
  String get howToPrayStep9Tip =>
      'Это короткое сидение между двумя земными поклонами называется джальса. Это обязательная часть намаза.';

  @override
  String get howToPrayStep10Name => 'Завершите ракааты';

  @override
  String get howToPrayStep10Instruction =>
      'Завершив первый ракаат, встаньте и повторите те же действия для второго ракаата. Количество ракаатов зависит от того, какой намаз вы совершаете.';

  @override
  String get howToPrayStep10Tip =>
      'В Фаджре 2 ракаата, в Зухре 4, в Асре 4, в Магрибе 3, в Ише 4. Двигайтесь шаг за шагом, по одному ракаату.';

  @override
  String get howToPrayStep11Name => 'Ташаххуд (последнее сидение)';

  @override
  String get howToPrayStep11Instruction =>
      'В последнем сидячем положении прочитайте ташаххуд. Это свидетельство веры, которое произносится сидя после последнего ракаата.';

  @override
  String get howToPrayStep11Tip =>
      'Во время ташаххуда поднимите правый указательный палец при словах «Ашхаду алля иляха илляллах» в знак единственности Аллаха.';

  @override
  String get howToPrayStep12Name => 'Таслим (завершение)';

  @override
  String get howToPrayStep12Instruction =>
      'Поверните голову направо и произнесите «Assalamu Alaikum wa Rahmatullah», затем повернитесь налево и повторите. На этом ваш намаз завершается.';

  @override
  String get howToPrayStep12Tip =>
      'После намаза уделите время дуа (мольбе) и попросите Аллаха о том, в чём нуждаетесь. Это прекрасное время для связи с Аллахом.';

  @override
  String get checklistWeek1Title => 'Неделя 1';

  @override
  String get checklistWeek2Title => 'Неделя 2';

  @override
  String get checklistWeek3Title => 'Неделя 3';

  @override
  String get checklistWeek4Title => 'Неделя 4';

  @override
  String get checklistWeek1Item1 => 'Произнести Шахаду';

  @override
  String get checklistWeek1Item2 => 'Изучить Вуду';

  @override
  String get checklistWeek1Item3 => 'Выучить Аль-Фатиху';

  @override
  String get checklistWeek1Item4 => 'Совершить первый Фаджр';

  @override
  String get checklistWeek1Item5 => 'Приобрести молитвенный коврик';

  @override
  String get checklistWeek1Item6 => 'Найти ближайшую мечеть';

  @override
  String get checklistWeek2Item1 => 'Выучить все 5 времён молитв';

  @override
  String get checklistWeek2Item2 => 'Выучить основные дуа';

  @override
  String get checklistWeek2Item3 => 'Почитать о Пророке Мухаммаде';

  @override
  String get checklistWeek2Item4 => 'Познакомиться с мусульманской общиной';

  @override
  String get checklistWeek3Item1 => 'Узнать о халяльной пище';

  @override
  String get checklistWeek3Item2 => 'Прочитать суру Аль-Ихлас';

  @override
  String get checklistWeek3Item3 => 'Узнать о Рамадане';

  @override
  String get checklistWeek3Item4 => 'Начать ежедневный зикр';

  @override
  String get checklistWeek4Item1 => 'Узнать о Закяте';

  @override
  String get checklistWeek4Item2 => 'Почитать о 5 столпах';

  @override
  String get checklistWeek4Item3 => 'Настроить напоминания о молитвах';

  @override
  String get checklistWeek4Item4 => 'Поразмышлять о своём пути';

  @override
  String get wuduStep1Instruction =>
      'Сделайте в сердце намерение совершить вуду ради Аллаха.';

  @override
  String get wuduStep1Tip =>
      'Не обязательно произносить намерение вслух — достаточно искреннего намерения в сердце.';

  @override
  String get wuduStep2Instruction =>
      'Скажите «Бисмиллях» (Во имя Аллаха), прежде чем начать.';

  @override
  String get wuduStep2Tip =>
      'Произнесение «Бисмиллях» — это сунна, и так вы начинаете вуду с поминания Аллаха.';

  @override
  String get wuduStep3Instruction =>
      'Вымойте обе руки до запястий три раза, следя, чтобы вода прошла между пальцами.';

  @override
  String get wuduStep3Tip =>
      'Начните с правой руки, затем левая. Такой порядок рекомендован в Исламе.';

  @override
  String get wuduStep4Instruction =>
      'Наберите воду в рот, прополощите его и выплюньте воду. Сделайте так три раза.';

  @override
  String get wuduStep4Tip => 'Это очищает рот и является частью очищения.';

  @override
  String get wuduStep5Instruction =>
      'Втяните воду в ноздри и осторожно высморкайтесь. Сделайте так три раза.';

  @override
  String get wuduStep5Tip =>
      'Втягивайте воду правой рукой, а высмаркивайтесь с помощью левой.';

  @override
  String get wuduStep6Instruction =>
      'Вымойте всё лицо три раза — от линии роста волос до подбородка и от уха до уха.';

  @override
  String get wuduStep6Tip =>
      'Следите, чтобы ни один участок лица не остался сухим.';

  @override
  String get wuduStep7Instruction =>
      'Вымойте правую руку от кончиков пальцев до локтя три раза, затем то же самое с левой рукой.';

  @override
  String get wuduStep7Tip =>
      'В вуду всегда начинайте с правой стороны, затем переходите к левой.';

  @override
  String get wuduStep8Instruction =>
      'Смочите руки и один раз протрите всю голову — спереди назад и обратно.';

  @override
  String get wuduStep8Tip =>
      'В отличие от омовения водой, протирание головы совершается только один раз.';

  @override
  String get wuduStep9Instruction =>
      'Вымойте правую ступню вместе с щиколоткой три раза, затем то же самое с левой ступнёй.';

  @override
  String get wuduStep9Tip =>
      'Следите, чтобы вода прошла между пальцами ног. Прочищайте между ними пальцем руки.';

  @override
  String get islamicGlossaryTitle => 'Исламский словарь';

  @override
  String get islamicGlossarySubtitle =>
      '51 термин из Корана, Сунны и классических трудов учёных';

  @override
  String get searchTermsHint => 'Поиск терминов, арабских слов, определений...';

  @override
  String get categoryAll => 'Все';

  @override
  String get categoryPillar => 'Столп';

  @override
  String get categoryAqeedah => 'Акыда';

  @override
  String get categoryPractice => 'Практика';

  @override
  String get categoryDhikr => 'Зикр';

  @override
  String get categoryQuran => 'Коран';

  @override
  String get categoryHadith => 'Хадис';

  @override
  String get categoryFiqh => 'Фикх';

  @override
  String get categoryHistory => 'История';

  @override
  String get noTermsFound => 'Термины не найдены';

  @override
  String get sourceLabel => 'Источник';

  @override
  String get revertCornerHubSubtitle =>
      'Тёплый уголок, который поможет вам сделать первые шаги в Исламе';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Распространённые термины простыми словами';

  @override
  String get whyDoWeHubSubtitle =>
      'Мудрость, стоящая за повседневными практиками';

  @override
  String get communityStoriesHubSubtitle =>
      'Принявшие Ислам делятся своими историями';

  @override
  String get whyDoWeScreenSubtitle =>
      'Мудрость 12 повседневных исламских практик';

  @override
  String get whyDoWeSourceBadge => 'Суннитский источник';

  @override
  String get whyDoWeQ1 => 'Почему мы молимся 5 раз в день?';

  @override
  String get whyDoWeA1 =>
      'Аллах предписал пять ежедневных молитв в Коране (2:238), и они были установлены во время Ночного путешествия (Исра валь-Мирадж). Пророк сказал: «Первое, за что раб будет спрошен в Судный день, — это молитва» (Ибн Маджа). Молитва поддерживает нашу связь с Аллахом в течение всего дня.';

  @override
  String get whyDoWeQ2 =>
      'Почему во время молитвы мы обращаемся в сторону Мекки?';

  @override
  String get whyDoWeA2 =>
      'Аллах повелел в Коране (2:144): «Обрати же своё лицо в сторону Заповедной мечети». Кааба в Мекке — первый дом, воздвигнутый для поклонения Аллаху (3:96). Обращаясь в одну сторону, все мусульмане мира объединяются в молитве.';

  @override
  String get whyDoWeQ3 => 'Почему мы постимся в Рамадан?';

  @override
  String get whyDoWeA3 =>
      'Аллах предписал пост в Коране (2:183): «О те, которые уверовали! Вам предписан пост, подобно тому, как он был предписан вашим предшественникам, — быть может, вы обретёте таква (богобоязненность)». Рамадан — месяц, в который был ниспослан Коран (2:185).';

  @override
  String get whyDoWeQ4 => 'Почему перед едой мы говорим «Бисмиллях»?';

  @override
  String get whyDoWeA4 =>
      'Пророк сказал: «Когда кто-либо из вас ест, пусть помянет имя Аллаха. Если он забыл в начале, пусть скажет: „Бисмилляхи аввалюху ва ахираху“» (Абу Дауд). Это напоминает нам, что все блага исходят от Аллаха.';

  @override
  String get whyDoWeQ5 => 'Почему перед входом в мечеть мы снимаем обувь?';

  @override
  String get whyDoWeA5 =>
      'Аллах повелел Мусе (Моисею): «Сними же свою обувь, ибо ты находишься в священной долине Тува» (Коран 20:12). Снятие обуви выражает почтение к дому Аллаха и сохраняет место молитвы в чистоте.';

  @override
  String get whyDoWeQ6 =>
      'Почему мы приветствуем друг друга словами «Ассаляму алейкум»?';

  @override
  String get whyDoWeA6 =>
      'Пророк сказал: «Вы не войдёте в Рай, пока не уверуете, и не уверуете, пока не полюбите друг друга. Не указать ли вам на то, что заставит вас полюбить друг друга? Распространяйте мир (салям) между собой» (Муслим). Это ещё и дуа — вы просите мира для этого человека.';

  @override
  String get whyDoWeQ7 => 'Почему мы совершаем Хадж?';

  @override
  String get whyDoWeA7 =>
      'Хадж предписан Аллахом (3:97): «Паломничество к этому Дому — обязанность перед Аллахом для тех, кто способен его совершить». Он напоминает об испытаниях Пророка Ибрахима и его семьи и объединяет в поклонении мусульман всех народов.';

  @override
  String get whyDoWeQ8 => 'Почему мы выплачиваем Закят?';

  @override
  String get whyDoWeA8 =>
      'Закят — третий столп Ислама, упомянутый в Коране более 30 раз рядом с молитвой. Пророк сказал, что он очищает имущество. Закят уменьшает неравенство и напоминает верующим, что богатство принадлежит Аллаху.';

  @override
  String get whyDoWeQ9 => 'Почему после чихания мы говорим «Альхамдулиллях»?';

  @override
  String get whyDoWeA9 =>
      'Пророк сказал: «Когда кто-либо из вас чихнёт, пусть скажет: „Альхамдулиллях“, а его брат или спутник пусть скажет: „Ярхамукаллах“» (Бухари). Это момент благодарности Аллаху за дар здоровья.';

  @override
  String get whyDoWeQ10 => 'Почему мусульманки носят хиджаб?';

  @override
  String get whyDoWeA10 =>
      'Аллах повелел в Коране (24:31), чтобы верующие женщины хранили своё целомудрие. Хиджаб — это акт поклонения и покорности Аллаху. Для многих мусульманок он является источником идентичности, достоинства и духовной связи.';

  @override
  String get whyDoWeQ11 => 'Почему мы избегаем свинины и алкоголя?';

  @override
  String get whyDoWeA11 =>
      'Аллах запретил свинину в Коране (2:173) и алкоголь в (5:90), назвав его «скверной из деяний сатаны». Эти запреты оберегают здоровье, разум и семью. Нормы халяля помогают верующим сохранять телесную и духовную чистоту.';

  @override
  String get whyDoWeQ12 => 'Почему мы говорим «Иншаллах»?';

  @override
  String get whyDoWeA12 =>
      'Аллах повелевает в Коране (18:23-24): «Никогда не говори о чём-либо: „Я сделаю это завтра“, — не добавив: „Если пожелает Аллах“». Говоря «Иншаллах», мы признаём, что будущее подвластно только Аллаху, и это учит нас смирению.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Настоящие истории прихода к Исламу со всего мира';

  @override
  String get communityStoriesTimeLabel => 'В Исламе';

  @override
  String get communityStoriesShareBtn => 'Поделиться своей историей';

  @override
  String get communityStoriesShareSoon => 'Скоро — эта функция уже на подходе!';

  @override
  String get communityStory1Name => 'Аиша (ранее Сара)';

  @override
  String get communityStory1Location => 'Техас, США';

  @override
  String get communityStory1Time => '2 года';

  @override
  String get communityStory1Text =>
      'Я узнала об Исламе, собирая материал для курсовой работы. Я ожидала найти то, о чём рассказывали в СМИ. Вместо этого я нашла покой, логику и Бога, в Котором всё обрело смысл. Через полгода я произнесла шахаду. Труднее всего было не научиться молиться, а рассказать семье. Но, альхамдулиллях, спустя два года моя мама сама задаёт мне вопросы об Исламе.';

  @override
  String get communityStory2Name => 'Юсуф (ранее Джеймс)';

  @override
  String get communityStory2Location => 'Лондон, Великобритания';

  @override
  String get communityStory2Time => '4 года';

  @override
  String get communityStory2Text =>
      'Я пришёл к Исламу после долгих лет поисков. Христианство, буддизм, атеизм — ничто не заполняло пустоту. Коллега-мусульманин пригласил меня на пятничную молитву. Я сидел в заднем ряду и плакал всё время. Я даже не понимал почему. На следующей неделе я произнёс шахаду. Община окружила меня заботой, словно семья, о которой я и не знал, что она мне нужна.';

  @override
  String get communityStory3Name => 'Марьям (ранее Мария)';

  @override
  String get communityStory3Location => 'Мехико, Мексика';

  @override
  String get communityStory3Time => '1 год';

  @override
  String get communityStory3Text =>
      'Быть латиноамериканкой и мусульманкой — это как суперсила. Я нашла Ислам через видео на YouTube в два часа ночи. Я смотрела часами. Понятие таухида — что Бог один, у Него нет сотоварищей и нет изображений — отозвалось во мне очень глубоко. Испаноязычные сёстры в мечети сразу приняли меня как родную.';

  @override
  String get communityStory4Name => 'Ибрахим (ранее Дэвид)';

  @override
  String get communityStory4Location => 'Торонто, Канада';

  @override
  String get communityStory4Time => '6 лет';

  @override
  String get communityStory4Text =>
      'Я сын пастора. У меня были вопросы о Троице, на которые никто не мог ответить. Когда я впервые прочитал Коран, мне показалось, что я читаю то, во что уже верю. Я произнёс шахаду тихо, наедине с собой, а потом ещё раз — в мечети. Лучшее решение в моей жизни.';

  @override
  String get communityStory5Name => 'Фатима (ранее Дженнифер)';

  @override
  String get communityStory5Location => 'Сидней, Австралия';

  @override
  String get communityStory5Time => '3 года';

  @override
  String get communityStory5Text =>
      'Мой путь начался с хиджаба. Я надела его на спор и почувствовала себя... защищённой. Я начала читать об Исламе и не могла остановиться. Через три месяца я произнесла шахаду. Люди спрашивают, от чего я отказалась. Я отвечаю: я отказалась от пустоты.';

  @override
  String get communityStory6Name => 'Омар (ранее Кевин)';

  @override
  String get communityStory6Location => 'Йоханнесбург, ЮАР';

  @override
  String get communityStory6Time => '5 лет';

  @override
  String get communityStory6Text =>
      'Я вырос в неблагополучном районе. Ислам дал мне дисциплину, цель и братство. Когда я впервые совершил суджуд, что-то во мне раскрылось — в самом лучшем смысле. Я плакал и не мог объяснить почему. Теперь я наставляю других молодых ребят, которые ищут свой путь к дину.';

  @override
  String get inspiredByRealStories =>
      'По мотивам реальных историй принявших Ислам';

  @override
  String get storyFormTitle => 'Поделитесь своей историей';

  @override
  String get storyFormNameLabel => 'Ваше имя';

  @override
  String get storyFormNameHint => 'Имя или напишите «Анонимно»';

  @override
  String get storyFormCountryLabel => 'Страна';

  @override
  String get storyFormCountryHint => 'Откуда вы?';

  @override
  String get storyFormTimeLabel => 'В Исламе';

  @override
  String get storyFormTimeHint => 'напр. 2 года, 6 месяцев';

  @override
  String get storyFormStoryLabel => 'Ваша история';

  @override
  String get storyFormStoryHint => 'Расскажите о своём пути к Исламу...';

  @override
  String get storyFormSubmitBtn => 'Отправить историю';

  @override
  String get storyFormThankYouTitle => 'ДжазакАллаху хайран!';

  @override
  String get storyFormThankYouBody =>
      'Ваша история получена. Перед публикацией мы просматриваем все присланные истории.';

  @override
  String get storyFormRequiredError => 'Пожалуйста, заполните все поля';

  @override
  String get subtitleYourGuideToIslam => 'Ваш путеводитель по Исламу';

  @override
  String get beginnerMode => 'Режим новичка';

  @override
  String get beginnerModeSubtitle =>
      'Дополнительные подсказки и советы для новых мусульман';

  @override
  String get beginnerModeOn =>
      'Режим новичка включён — по всему приложению показываются дополнительные подсказки';

  @override
  String get beginnerModePrayersTip =>
      'Совет: нажмите на каждую молитву, чтобы узнать о ней больше и увидеть молитвы-сунна';

  @override
  String get tafsirSubtitle => 'Толкование Корана';

  @override
  String get tafsirComingSoon => 'Тафсир этой суры скоро появится';

  @override
  String get tafsirNotAvailable => 'Тафсир недоступен';

  @override
  String get scholarSource => 'Источник';

  @override
  String get asbabAlNuzul => 'Причина ниспослания';

  @override
  String get transliteration => 'Транслитерация';

  @override
  String get selectReciter => 'Выберите чтеца';

  @override
  String get playVerse => 'Воспроизвести аят';

  @override
  String get asmaUlHusna => 'Асма уль-Хусна';

  @override
  String get asmaUlHusnaSubtitle => '99 прекрасных имён Аллаха';

  @override
  String get asmaHadith =>
      'У Аллаха 99 имён. Тот, кто запомнит их, войдёт в Рай.';

  @override
  String get asmaHadithSource => 'Сахих аль-Бухари, 2736';

  @override
  String get asmaSearchHint => 'Поиск имён...';

  @override
  String get asmaNoResults => 'Имена не найдены';

  @override
  String get asmaSignificance => 'Значение';

  @override
  String get asmaUlHusnaTile => '99 имён';

  @override
  String get asmaUlHusnaTileSubtitle => 'Имена Аллаха';

  @override
  String get onboardingTagline =>
      'Берегите своё время. Почитайте свои молитвы.';

  @override
  String get onboardingChooseLanguage => 'Выберите язык';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get onboardingLocationTitle => 'Точное время молитв';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard нужно ваше местоположение, чтобы рассчитать точное время молитв для вашего города. Ваше местоположение никогда не сохраняется и не передаётся.';

  @override
  String get onboardingPrivacyBanner =>
      'Ваша вера — личное. Ваши данные тоже остаются личными.';

  @override
  String get onboardingAllowLocation => 'Разрешить геолокацию';

  @override
  String get onboardingSkipForNow => 'Пропустить пока';

  @override
  String get onboardingNotificationTitle => 'Не пропускайте ни одной молитвы';

  @override
  String get onboardingNotificationDesc =>
      'Получайте уведомления с прекрасным азаном к каждой молитве. Настройте звуки и время в настройках.';

  @override
  String get onboardingAdhanAlerts => 'Оповещения с азаном';

  @override
  String get onboardingCustomTiming => 'Своё время';

  @override
  String get onboardingAdjustable => 'Настраивается';

  @override
  String get onboardingEnableNotifications => 'Включить уведомления';

  @override
  String get onboardingMaybeLater => 'Может, позже';

  @override
  String get onboardingAllSetTitle => 'Всё готово!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard готов беречь ваше время\nи наполнять ваш день осознанностью.';

  @override
  String get onboardingPrayerTimesLabel => 'Время молитв';

  @override
  String get onboardingPrayerTimesDesc => 'Точное время для вашего города';

  @override
  String get onboardingLockScreenLabel => 'Исламский экран блокировки';

  @override
  String get onboardingLockScreenDesc => 'Коран и дуа при каждой разблокировке';

  @override
  String get onboardingPrayerGuardLabel => 'Страж молитвы';

  @override
  String get onboardingPrayerGuardDesc =>
      'Приложения автоматически блокируются во время саляха';

  @override
  String get onboardingEnterApp => 'Войти в Noor Guard';

  @override
  String get adhan => 'Азан';

  @override
  String get adhanSubtitle => 'Призыв к молитве';

  @override
  String get adhanDescription =>
      'Азан — это исламский призыв к молитве, который звучит 5 раз в день, приглашая верующих к поклонению.';

  @override
  String get makkahStyle => 'Мекка';

  @override
  String get madinahStyle => 'Медина';

  @override
  String get egyptianStyle => 'Египетский';

  @override
  String get adhanPlaying => 'Сейчас звучит';

  @override
  String get makkahDescription =>
      'Традиционный призыв к молитве из Заповедной мечети в Мекке.';

  @override
  String get madinahDescription =>
      'Умиротворяющее исполнение в стиле Мечети Пророка в Медине.';

  @override
  String get egyptianDescription =>
      'Мелодичный азан в египетском стиле, известный богатством чтения.';

  @override
  String get adhanCallToWorship => 'Призыв к молитве';

  @override
  String get adhanDescriptionFull =>
      'Азан — это исламский призыв к молитве, который звучит 5 раз в день, приглашая верующих к поклонению.';

  @override
  String get alafasyStyle => 'Мишари Аль-Афаси';

  @override
  String get alaqsaStyle => 'Аль-Акса';

  @override
  String get turkishStyle => 'Турецкий';

  @override
  String get pakistaniStyle => 'Пакистанский';

  @override
  String get indonesianStyle => 'Индонезийский';

  @override
  String get alafasyDescription =>
      'Проникновенное исполнение знаменитого чтеца Мишари Рашида Аль-Афаси.';

  @override
  String get alaqsaDescription =>
      'Призыв к молитве, звучащий из мечети Аль-Акса в Иерусалиме — третьей святыни Ислама.';

  @override
  String get turkishDescription =>
      'Традиционный турецкий эзан с его особым мелодичным макамом.';

  @override
  String get pakistaniDescription =>
      'Проникновенный азан в южноазиатской традиции, звучащий по всему Пакистану.';

  @override
  String get indonesianDescription =>
      'Мелодичный азан в индонезийском стиле, любимый по всему архипелагу.';

  @override
  String get thisWeek => 'Эта неделя';

  @override
  String weeklyProgress(int count) {
    return '$count из 35 молитв на этой неделе';
  }

  @override
  String get bestDay => 'Лучший день';

  @override
  String get prayerStats => 'Статистика молитв';

  @override
  String get completionRate => 'Доля совершённых';

  @override
  String get bestPrayer => 'Самая стабильная молитва';

  @override
  String get hardestPrayer => 'Чаще всего пропускается';

  @override
  String totalPrayersCompleted(int count) {
    return 'Совершено молитв: $count';
  }

  @override
  String get last7Days => 'Последние 7 дней';

  @override
  String get thisMonth => 'Этот месяц';

  @override
  String get fullDays => 'Полные дни';

  @override
  String get partialDays => 'Неполные дни';

  @override
  String get missedDays => 'Пропущенные дни';

  @override
  String get missedPrayerBadge => 'Пропущена';

  @override
  String get makeItUp => 'Восполнить';

  @override
  String get qadaExplanation =>
      'Если вы пропустили молитву, вы всё ещё можете совершить её как када (восполняемую) молитву.';

  @override
  String get noStatsYet =>
      'Продолжайте отмечать свои молитвы, и здесь появится статистика.';

  @override
  String get notEnoughData => 'Пока недостаточно данных';

  @override
  String get continuousPlay => 'Непрерывно';

  @override
  String get sleepTimer => 'Таймер сна';

  @override
  String verseCount(Object total, Object verse) {
    return 'Аят $verse из $total';
  }

  @override
  String get verseTafsir => 'Тафсир аята';

  @override
  String get tafsirOfTheDay => 'Тафсир дня';

  @override
  String get dailyInsight => 'Мысль дня';

  @override
  String get keyThemes => 'Ключевые темы и уроки';

  @override
  String get readFullSurah => 'Читать суру полностью';

  @override
  String get surahIntroduction => 'Введение к суре';

  @override
  String get verses => 'аятов';

  @override
  String get loadingTafsir => 'Загрузка тафсира...';

  @override
  String get keepAliveNotificationText => 'Уведомления о молитвах активны';

  @override
  String get keepAliveChannelName => 'Уведомления о молитвах';

  @override
  String get keepAliveChannelDescription =>
      'Поддерживает работу Noor Guard в фоновом режиме, чтобы напоминания о молитвах никогда не пропадали.';

  @override
  String get notifSetupTitle => 'Включите оповещения на экране блокировки';

  @override
  String get notifSetupSubtitle =>
      'Чтобы вы никогда не пропустили азан — даже когда телефон заблокирован. Займёт около минуты.';

  @override
  String get notifSetupSamsungBanner =>
      'У вас Samsung Galaxy (включая Fold/Flip)? Samsung добавляет дополнительные переключатели помимо стандартного Android — шаги 4 и 6 ниже покажут, где именно их найти.';

  @override
  String get notifSetupStep1Title => 'Разрешить уведомления';

  @override
  String get notifSetupStep1Description =>
      'Базовое разрешение, без которого Noor Guard вообще не сможет вас оповещать.';

  @override
  String get notifSetupStep1Action => 'Разрешить уведомления';

  @override
  String get notifSetupStep2Title => 'Будильники и напоминания';

  @override
  String get notifSetupStep2Description =>
      'Позволяет сигналам о молитве срабатывать точно в назначенное время, даже когда телефон бездействует или в режиме энергосбережения.';

  @override
  String get notifSetupStep2Action => 'Открыть настройки будильников';

  @override
  String get notifSetupStep3Title => 'Поверх других приложений';

  @override
  String get notifSetupStep3Description =>
      'Позволяет полноэкранному окну молитвы отображаться поверх экрана блокировки и любых открытых приложений.';

  @override
  String get notifSetupStep3Action => 'Открыть настройки';

  @override
  String get notifSetupStep4Title => 'Всплывающие / полноэкранные оповещения';

  @override
  String get notifSetupStep4Description =>
      'Позволяет экрану азана появляться поверх экрана блокировки, а не оставаться беззвучным баннером.';

  @override
  String get notifSetupStep4SamsungNote =>
      'На телефонах Samsung Galaxy (включая Fold/Flip): откройте «Настройки» → нажмите «Сигнал времени молитвы», затем включите «Всплывающее уведомление» (на Fold/Flip — «Всплывающее окно внешнего экрана»). Это переключатель только для Samsung — именно он выводит экран азана поверх экрана блокировки.';

  @override
  String get notifSetupStep4Action => 'Открыть настройки уведомлений';

  @override
  String get notifSetupStep5Title => 'Надёжная доставка уведомлений';

  @override
  String get notifSetupStep5Description =>
      'Не даёт Android замедлять или задерживать Noor Guard в фоне, чтобы сигналы и напоминания о молитвах всегда приходили вовремя.';

  @override
  String get notifSetupStep5Action => 'Отключить оптимизацию батареи';

  @override
  String get notifSetupStep6Title => 'Приложения без перевода в сон';

  @override
  String get notifSetupStep6Description =>
      'Диспетчер батареи Samsung может «усыпить» Noor Guard и незаметно блокировать сигналы о молитвах. Добавление в список «Неусыпляемые приложения» решает эту проблему.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Настройки → Обслуживание устройства → Ограничения в фоновом режиме → Неусыпляемые приложения → нажмите «+» → выберите Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Открыть настройки батареи';

  @override
  String get notifSetupStatusChecking => 'Проверка…';

  @override
  String get notifSetupStatusEnabled => 'Включено';

  @override
  String get notifSetupStatusNeeded => 'Требуется';

  @override
  String get notifSetupStatusManual => 'Вручную';

  @override
  String get notifSetupContinueButton => 'Перейти в Noor Guard';

  @override
  String get notifSetupLaterButton => 'Закончу позже';

  @override
  String get notifSetupDoneButton => 'Готово';

  @override
  String get testNotificationButton => 'Отправить тестовое уведомление (10 с)';

  @override
  String get testNotificationSnack =>
      'Тестовое уведомление придёт через 10 секунд';

  @override
  String get testLockAlarmButton => 'Тест полноэкранного будильника (10 с)';

  @override
  String get testLockAlarmSnack =>
      'Будильник сработает через 10 секунд — заблокируйте телефон сейчас';

  @override
  String get testAdhanForegroundButton =>
      'Тест Азана в приложении (на переднем плане)';

  @override
  String get testAdhanForegroundSnack =>
      'Воспроизводится полный азан с беззвучным баннером';

  @override
  String get testRequiresNotificationsOn =>
      'Сначала включите уведомления о намазе, чтобы проверить это';

  @override
  String get lockScreenSetupGuideButton =>
      'Инструкция по настройке оповещений на экране блокировки';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Не удалось открыть Политику конфиденциальности';

  @override
  String get couldNotOpenTermsOfService =>
      'Не удалось открыть Условия использования';

  @override
  String get couldNotOpenEmailApp => 'Не удалось открыть почтовое приложение';

  @override
  String get blockDurationLabel => 'Длительность блокировки';

  @override
  String get privacyAndTrust => 'Конфиденциальность и доверие';

  @override
  String get noorGuardMotto =>
      '«Если этому не место в мечети,\nэтому не место в Noor Guard».';

  @override
  String get openingAppStore => 'Открываем App Store…';

  @override
  String get openingShareSheet => 'Открываем меню «Поделиться»…';

  @override
  String get openingSupportEmail => 'Открываем письмо в поддержку…';

  @override
  String get openingTermsOfService => 'Открываем Условия использования…';

  @override
  String get duration30Min => '30 мин';

  @override
  String get duration1Hour => '1 час';

  @override
  String get durationPrayerWindowOnly => 'Только время намаза';

  @override
  String get hoursAbbreviation => 'ч';

  @override
  String get cancelTimerButton => 'Отменить таймер';

  @override
  String get custom => 'Свой вариант';

  @override
  String get customTimerMinutesTitle => 'Свой таймер (минуты)';

  @override
  String get customTimerHint => 'напр. 20';

  @override
  String get cancel => 'Отмена';

  @override
  String get start => 'Начать';

  @override
  String get travel => 'Путешествие';

  @override
  String get anxietyAndStress => 'Тревога и стресс';

  @override
  String get gratitude => 'Благодарность';

  @override
  String get protection => 'Защита';

  @override
  String get family => 'Семья';

  @override
  String get forgiveness => 'Прощение';

  @override
  String get appBlockingSetupHeadline =>
      'Береги своё время — береги свой намаз';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard использует службу специальных возможностей Android только для того, чтобы замечать, когда заблокированное приложение открывается во время намаза. Он никогда не читает ваши сообщения, фотографии или другие личные данные.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Доступ к специальным возможностям предоставлен';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Доступ к специальным возможностям не предоставлен';

  @override
  String get appBlockingOpenSettings =>
      'Открыть настройки специальных возможностей';

  @override
  String get appBlockingSetupNotNow => 'Не сейчас';

  @override
  String get appBlockingEnableToggle => 'Включить блокировку приложений';

  @override
  String get appBlockingModeLabel => 'Режим блокировки';

  @override
  String get appBlockingModeSoft => 'Мягкий';

  @override
  String get appBlockingModeSoftDesc =>
      'Только деликатное напоминание — приложения остаются открытыми';

  @override
  String get appBlockingModeFirm => 'Строгий';

  @override
  String get appBlockingModeFirmDesc =>
      'Блокирует приложение, но с быстрым обходом';

  @override
  String get appBlockingModeHard => 'Жёсткий';

  @override
  String get appBlockingModeHardDesc =>
      'Полная блокировка — разблокирует только «Я совершил намаз»';

  @override
  String get appBlockingSelectPrayersLabel =>
      'Блокировать во время этих намазов';

  @override
  String get appBlockingBufferBeforeLabel => 'Начинать до намаза';

  @override
  String get appBlockingBufferAfterLabel => 'Снимать после намаза';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count мин';
  }

  @override
  String get appBlockingAppsTitle => 'Заблокированные приложения';

  @override
  String get appBlockingSelectAppsButton => 'Выбрать приложения для блокировки';

  @override
  String get appBlockingSearchHint => 'Поиск установленных приложений';

  @override
  String get appBlockingNoAppsSelected => 'Приложения ещё не выбраны';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count приложения заблокировано',
      many: '$count приложений заблокировано',
      few: '$count приложения заблокировано',
      one: '$count приложение заблокировано',
      zero: 'Нет заблокированных приложений',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Проверка';

  @override
  String get appBlockingTestDescription =>
      'Активируйте блокировку приложений на 2 минуты, чтобы убедиться, что она работает на этом устройстве.';

  @override
  String get appBlockingTestButton =>
      'Проверить блокировку приложений (2 минуты)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Блокировка приложений активна 2 минуты — попробуйте открыть заблокированное приложение';

  @override
  String get appBlockingPermissionNeeded =>
      'Включите доступ к специальным возможностям, чтобы начать блокировку';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Доступ к Экранному времени — скоро';

  @override
  String get appBlockingIosComingSoonBody =>
      'Для блокировки приложений на iOS нужно разрешение Apple «Экранное время», которое мы ещё настраиваем. Мы сообщим вам, как только всё будет готово.';

  @override
  String get appBlockingHeadline1 => 'Время намаза';

  @override
  String get appBlockingHeadline2 => 'Береги своё время';

  @override
  String get appBlockingDefaultTitle => 'Время намаза';

  @override
  String get appBlockingIPrayedButton => 'Я совершил намаз';

  @override
  String get appBlockingReadAyahsButton => 'Прочитать 3 аята';

  @override
  String get appBlockingEmergencyBypass => 'Экстренный обход';

  @override
  String get appBlockingSkipForNow => 'Пропустить пока';

  @override
  String get appBlockingBypassConfirmTitle => 'Прервать вашу серию?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Обход сейчас сбросит вашу серию намазов. Если это действительно чрезвычайная ситуация, вы можете продолжить.';

  @override
  String get appBlockingBypassConfirmContinue => 'Всё равно обойти';

  @override
  String get appBlockingBypassConfirmCancel => 'Назад';

  @override
  String get appBlockingSoftReminderTitle => 'Деликатное напоминание';

  @override
  String get appBlockingSoftReminderBody =>
      'Наступило время намаза — подумайте о том, чтобы отвлечься на минуту.';

  @override
  String get quranChallengeBannerTitle =>
      'Прочитайте 3 аята, чтобы разблокировать';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return 'Прочитано аятов: $count из $total';
  }

  @override
  String get quranChallengeComplete => 'Отлично — приложения разблокированы';

  @override
  String get focusBlockHeadline1 => 'Сохраняйте сосредоточенность';

  @override
  String get focusBlockHeadline2 => 'Продолжайте';

  @override
  String get endFocusSessionButton => 'Завершить сеанс фокусировки';

  @override
  String get focusPaused => 'Приостановлено на время намаза';

  @override
  String get selectLocationTitle => 'Выберите местоположение';

  @override
  String get useCurrentLocation => 'Использовать текущее местоположение';

  @override
  String get savedLocationsHeader => 'Сохранённые местоположения';

  @override
  String get noSavedLocationsYet =>
      'Пока нет сохранённых местоположений. Найдите город ниже, чтобы добавить.';

  @override
  String get searchCityHint => 'Введите название города…';

  @override
  String get addLocationTooltip => 'Добавить местоположение';

  @override
  String get deleteLocationTooltip => 'Удалить местоположение';

  @override
  String get locationNotFound =>
      'Местоположение не найдено. Попробуйте другой запрос.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Можно сохранить не более $max местоположений';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Не удалось подтвердить изменение — попробуйте ещё раз';

  @override
  String get tasbihCounter => 'Счётчик Тасбих';

  @override
  String get tasbihCounterSubtitle => 'Считайте свой зикр';

  @override
  String get tasbihResetButton => 'Сброс';

  @override
  String get tasbihTotalLabel => 'Всего';

  @override
  String get tasbihCelebrationTitle => 'Тасбих завершён!';

  @override
  String get tasbihCelebrationBody =>
      'Вы завершили все 99 зикров. Пусть Аллах примет ваше поминание.';

  @override
  String get tasbihStartNewSession => 'Начать новую сессию';

  @override
  String get tasbihUndoButton => 'Отменить';

  @override
  String get tasbihTapAnywhereHint =>
      'Нажмите в любом месте экрана, чтобы считать';

  @override
  String get tasbihSoundToggleTooltip => 'Звук нажатия';

  @override
  String get tasbihManageDhikrTooltip => 'Управление зикрами';

  @override
  String get tasbihStatsTooltip => 'Посмотреть статистику';

  @override
  String get tasbihDailyTotalLabel => 'Итог за сегодня';

  @override
  String get tasbihRoundsTodayLabel => 'Кругов сегодня';

  @override
  String get tasbihManageDhikrTitle => 'Управление зикрами';

  @override
  String get tasbihAddCustomDhikrButton => 'Добавить свой зикр';

  @override
  String get tasbihDeleteDhikrTooltip => 'Удалить';

  @override
  String get tasbihBuiltInDhikrBadge => 'Встроенный';

  @override
  String get tasbihCannotDeleteLastDhikr => 'Нужен хотя бы один зикр';

  @override
  String get tasbihDhikrNameLabel => 'Название';

  @override
  String get tasbihDhikrNameHint => 'напр. Астагфируллах';

  @override
  String get tasbihDhikrArabicLabel => 'На арабском (необязательно)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Пожалуйста, введите название';

  @override
  String get tasbihSaveDhikrButton => 'Сохранить';

  @override
  String get tasbihStatsTitle => 'Статистика Тасбиха';

  @override
  String get tasbihAllTimeTotalLabel => 'Итог за всё время';

  @override
  String get tasbihNoActivityYetMessage =>
      'Начните считать, и здесь появится ваша статистика.';

  @override
  String get tasbihSoundPickerTitle => 'Звук нажатия';

  @override
  String get tasbihSoundClassicClick => 'Классический щелчок';

  @override
  String get tasbihSoundSoftChime => 'Мягкий перезвон';

  @override
  String get tasbihSoundStoneTap => 'Стук камня';

  @override
  String get tasbihCurrentlyReciting => 'Сейчас читается';

  @override
  String tasbihOfTarget(int target) {
    return 'из $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Капля дождя';

  @override
  String get tasbihSoundSoftFeather => 'Мягкое перо';

  @override
  String noAyahsFound(String query) {
    return 'Аяты по запросу «$query» не найдены';
  }

  @override
  String get trySearchingQuran =>
      'Попробуйте искать на русском или арабском либо используйте исламский термин:';

  @override
  String get loadingQuranIndex => 'Загружаем полный индекс Корана…';

  @override
  String get quranSearchSuggestions =>
      'терпение, сабр, милость, намаз, салях, прощение, тауба, рай, джанна, знание';

  @override
  String get heroVerse1 => 'Оберегайте намазы, и особенно средний намаз.';

  @override
  String get heroVerse2 =>
      'Воистину, намаз предписан верующим в определённое время.';

  @override
  String get heroVerse3 => 'Обратитесь за помощью к терпению и намазу.';

  @override
  String get heroVerse4 =>
      'Поминайте Меня, и Я буду помнить о вас. Благодарите Меня и не будьте неблагодарны Мне.';

  @override
  String get heroVerse5 => 'Кто уповает на Аллаха — тому Его достаточно.';

  @override
  String get heroVerse6 =>
      'Воистину, первым домом, воздвигнутым для людей, был тот, что в Мекке, — благословенный и руководство для миров.';

  @override
  String get heroVerse7 =>
      'Воистину, намаз удерживает от мерзости и предосудительного, а поминание Аллаха — превыше всего.';

  @override
  String get heroVerse8 =>
      'Воистину, в поминании Аллаха обретают покой сердца.';

  @override
  String get heroVerse9 => 'Взывайте ко Мне — и Я отвечу вам.';

  @override
  String get heroVerse10 =>
      'Если вы будете благодарны, Я непременно одарю вас ещё большим.';

  @override
  String get heroVerse11 => 'Аллах не возлагает на душу сверх её возможностей.';

  @override
  String get heroVerse12 => 'Воистину, Аллах — с терпеливыми.';

  @override
  String get heroVerse13 => 'Моя милость объемлет всякую вещь.';

  @override
  String get heroVerse14 =>
      'Творите добро — воистину, Аллах любит творящих добро.';

  @override
  String get heroVerse15 =>
      'Это Писание, в котором нет сомнения, — руководство для богобоязненных.';

  @override
  String get accuracyHigh => 'Высокая точность';

  @override
  String get accuracyMedium => 'Средняя точность';

  @override
  String get accuracyLow => 'Низкая точность';

  @override
  String get accuracyCalibrating => 'Калибровка…';

  @override
  String get compassNeedsCalibration => 'Компасу нужна калибровка';

  @override
  String get compassCalibrationHint =>
      'Медленно перемещайте телефон восьмёркой, чтобы повысить точность.';

  @override
  String get spiritLevelLabel => 'Уровень';

  @override
  String get spiritLevelLevelText => '✓  Ровно';

  @override
  String get spiritLevelTiltText => 'Наклоните до ровного положения';

  @override
  String get compassNorth => 'С';

  @override
  String get compassEast => 'В';

  @override
  String get compassSouth => 'Ю';

  @override
  String get compassWest => 'З';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'Береги своё время. Чти свой намаз.';

  @override
  String get stopAdhan => 'Остановить Азан';

  @override
  String get duasSearchEmpty => 'Попробуйте другую категорию или запрос.';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingWelcomeTo => 'Добро пожаловать в';

  @override
  String get onboardingSubtitle => 'Ваш спутник на прекрасном пути Ислама.';

  @override
  String get onboardingLetsGetStarted => 'Начнём';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step из $total';
  }

  @override
  String get onboardingWhatsYourName => 'Как вас зовут?';

  @override
  String get onboardingNameSubtitle =>
      'Нам хотелось бы знать, как к вам обращаться.';

  @override
  String get onboardingNameHint => 'Введите ваше имя';

  @override
  String get onboardingContinue => 'Продолжить';

  @override
  String get onboardingAreYouNewToIslam => 'Вы недавно в Исламе?';

  @override
  String get onboardingModeSubtitle => 'Мы настроим приложение под ваш путь.';

  @override
  String get onboardingNewToIslam => 'Я недавно принял Ислам';

  @override
  String get onboardingNewToIslamDesc =>
      'Режим для начинающих с пошаговым руководством';

  @override
  String get onboardingFamiliarWithIslam => 'Я знаком с Исламом';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Обычный режим со всеми возможностями';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'День $days в Исламе';
  }

  @override
  String get beginnerEssential1 => 'Мой путеводитель нового мусульманина';

  @override
  String get beginnerEssential2 => 'Учимся Вуду (ритуальное омовение)';

  @override
  String get beginnerEssential3 => 'Как совершать намаз (шаг за шагом)';

  @override
  String get beginnerEssential4 => 'Сура Аль-Фатиха (Открывающая)';

  @override
  String get beginnerEssential5 => 'Ежедневные Дуа (мольбы)';

  @override
  String get beginnerEssential6 => 'Понимание Шахады';

  @override
  String get beginnerEssential7 => 'Исламские термины и глоссарий';

  @override
  String get beginnerExploreAll => 'Открыть все возможности';

  @override
  String get beginnerExploreSubtitle => 'Перейти к полной версии Noor Guard';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Всё, что предлагает Noor Guard';

  @override
  String get beginnerLearnSalah => 'Учимся Саляху';

  @override
  String get beginnerMayAllahGuide =>
      'Пусть Аллах направит ваши шаги и благословит ваш путь.';

  @override
  String get beginnerMuslimEssentials => 'ОСНОВЫ ДЛЯ МУСУЛЬМАНИНА';

  @override
  String get beginnerQuote1 =>
      'Воистину, за тягостью наступает облегчение. — Коран 94:6';

  @override
  String get beginnerQuote2 =>
      'Храни повеления Аллаха — и Он позаботится о тебе.';

  @override
  String get beginnerQuote3 =>
      'Аллах смотрит на ваши сердца и дела, а не на вашу внешность.';

  @override
  String get beginnerQuote4 => 'Каждый шаг к намазу — это шаг к покою.';

  @override
  String get beginnerQuote5 =>
      'Лучший из вас тот, кто изучает Коран и обучает ему других.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Нажмите, чтобы указать дату вашей Шахады';

  @override
  String get beginnerToolboxSection => 'ИНСТРУМЕНТЫ ДЛЯ НАЧИНАЮЩИХ';

  @override
  String get beginnerYourJourney => 'ВАШ ПУТЬ';

  @override
  String get journeyMonth1Name => 'Месяц 1: Основа';

  @override
  String get journeyMonth2Name => 'Месяц 2: Формирование привычек';

  @override
  String get journeyMonth3Name => 'Месяц 3: Углубление веры';

  @override
  String journeyTasksCompleted(int done, int total) {
    return 'Выполнено: $done/$total';
  }

  @override
  String get journeyViewFull => 'Посмотреть весь путь →';

  @override
  String get journeyTask2_1 => 'Совершать все 5 намазов в течение 7 дней';

  @override
  String get journeyTask2_2 => 'Выучить ещё 10 Дуа';

  @override
  String get journeyTask2_3 => 'Прочитать первый джуз Корана';

  @override
  String get journeyTask2_4 => 'Выучить 99 имён Аллаха';

  @override
  String get journeyTask2_5 =>
      'Пользоваться счётчиком Тасбих каждый день в течение 7 дней';

  @override
  String get journeyTask2_6 => 'Изучить намазы-сунну';

  @override
  String get journeyTask2_7 => 'Найти ближайшую мечеть';

  @override
  String get journeyTask3_1 => 'Прочитать суру Аль-Бакара';

  @override
  String get journeyTask3_2 => 'Узнать о Закяте';

  @override
  String get journeyTask3_3 => 'Узнать о посте (Саум)';

  @override
  String get journeyTask3_4 => 'Выучить наизусть 3 новые суры';

  @override
  String get journeyTask3_5 => 'Узнать о Хадже';

  @override
  String get journeyTask3_6 => 'Рассказать кому-нибудь об Исламе';

  @override
  String get journeyTask3_7 => 'Пройти исламский глоссарий до конца';

  @override
  String get journeyTimelineTitle => 'Мой путь';

  @override
  String get journeyCompleted => 'Завершено';

  @override
  String get journeyInProgress => 'В процессе';

  @override
  String get journeyLocked => 'Заблокировано';

  @override
  String get wuduThreeTimes => '3 раза';

  @override
  String get wuduDuaBefore => 'Дуа перед Вуду';

  @override
  String get wuduDuaAfter => 'Дуа после Вуду';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Бисмилляh';

  @override
  String get wuduDuaBeforeTranslation => 'С именем Аллаха';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ашhаду ан ля иляhа илляЛлаh, вахдаhу ля шарика ляh, ва ашhаду анна Мухаммадан \'абдуhу ва расулюh. Аллаhумма-дж\'альни мин ат-таввабин, ва-дж\'альни мин аль-мутатаhhирин.';

  @override
  String get wuduDuaAfterTranslation =>
      'Свидетельствую, что нет божества, достойного поклонения, кроме одного лишь Аллаха, у Которого нет сотоварища. Свидетельствую, что Мухаммад — Его раб и посланник. О Аллах, сделай меня из числа кающихся и сделай меня из числа очищающихся.';

  @override
  String get wuduCompleteButton => 'Я завершил Вуду';

  @override
  String get howToPrayStepOpeningDua => 'Дуа открытия (Сана)';

  @override
  String get howToPrayStepAlFatiha => 'Сура Аль-Фатиха';

  @override
  String get howToPrayStepSurah => 'Короткая сура';

  @override
  String get howToPrayStepTashahhudShort => 'Ташаххуд (средний)';

  @override
  String get howToPrayStepSalawat => 'Салават Пророку ﷺ';

  @override
  String get howToPrayTransTakbir => 'Аллах Превелик';

  @override
  String get howToPrayTransOpeningDua =>
      'Пречист Ты, о Аллах, и хвала Тебе; благословенно имя Твоё, превыше всего величие Твоё, и нет бога, кроме Тебя.';

  @override
  String get howToPrayTransFatiha =>
      'С именем Аллаха, Милостивого, Милосердного. Хвала Аллаху, Господу миров, Милостивому, Милосердному, Властелину Дня воздаяния. Тебе одному мы поклоняемся и Тебя одного молим о помощи. Веди нас прямым путём — путём тех, кого Ты облагодетельствовал, не тех, на кого пал гнев, и не заблудших.';

  @override
  String get howToPrayTransRuku => 'Пречист мой Господь Великий';

  @override
  String get howToPrayTransItidal =>
      'Аллах слышит того, кто восхваляет Его. Господь наш, Тебе хвала.';

  @override
  String get howToPrayTransSujood => 'Пречист мой Господь Высочайший';

  @override
  String get howToPrayTransJalsa => 'Господь мой, прости меня';

  @override
  String get howToPrayTransTashahhud =>
      'Все приветствия, молитвы и благие слова принадлежат Аллаху. Мир тебе, о Пророк, милость Аллаха и Его благословения. Мир нам и праведным рабам Аллаха. Свидетельствую, что нет бога, кроме Аллаха, и свидетельствую, что Мухаммад — Его раб и посланник.';

  @override
  String get howToPrayTransSalawat =>
      'О Аллах, благослови Мухаммада и семейство Мухаммада, как Ты благословил Ибрахима и семейство Ибрахима — поистине, Ты Достохвальный, Славный. О Аллах, ниспошли благодать Мухаммаду и семейству Мухаммада, как Ты ниспослал благодать Ибрахиму и семейству Ибрахима — поистине, Ты Достохвальный, Славный.';

  @override
  String get howToPrayTransTasleem => 'Мир вам и милость Аллаха';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Прочитайте это тихо сразу после вступительного такбира. Произносится только один раз, в самом начале молитвы.';

  @override
  String get howToPraySurahInstruction =>
      'После «Аль-Фатихи» прочитайте любую суру, которую знаете. Сура «Аль-Ихлас» (показана выше) идеально подходит для начинающих — читается только в первых двух ракаатах.';

  @override
  String get howToPrayItidalInstruction =>
      'Произнесите «Сами‘ Аллаху лиман хамидах», выпрямляясь, затем встаньте полностью прямо, прежде чем сказать «Раббана ва лакаль-хамд».';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Сядьте после 2-го ракаата. Поднимите указательный палец правой руки при произнесении Шахады. В молитвах из 3 и 4 ракаатов после этого сидения снова встаньте.';

  @override
  String get howToPraySalawatInstruction =>
      'Прочитайте салават сразу после полного ташаххуда, только в последнем сидении, перед завершением таслимом.';

  @override
  String get howToPrayTasleemInstruction =>
      'Поверните голову направо и произнесите таслим, затем повернитесь налево и повторите. Ваша молитва завершена.';

  @override
  String get howToPrayOnceOpens => 'Один раз — открывает молитву';

  @override
  String get howToPraySayAllahuAkbar => 'Скажите: Аллаху Акбар';

  @override
  String get howToPrayFirstRakahOnly => 'Только 1-й ракаат';

  @override
  String get howToPrayFirst2RakahsOnly => 'Только первые 2 ракаата';

  @override
  String get howToPrayEveryRakah => 'Каждый ракаат';

  @override
  String get howToPrayAfter2ndRakah => 'После 2-го ракаата';

  @override
  String get howToPrayFinalSittingOnly => 'Только последнее сидение';

  @override
  String get howToPrayClosesThePrayer => 'Завершает молитву';

  @override
  String get howToPraySectionBefore => 'Перед молитвой';

  @override
  String get howToPraySectionRakah => 'Ракаат';

  @override
  String get howToPraySectionMiddleSitting => 'Среднее сидение';

  @override
  String get howToPraySectionFinalSitting => 'Последнее сидение';

  @override
  String get howToPrayRakahLabel => 'Ракааты';

  @override
  String get howToPrayCompleteButton => 'Я совершил молитву';

  @override
  String get howToPrayMashaallah => 'МашаАллах!';

  @override
  String get howToPrayAccepted => 'Пусть Аллах примет вашу молитву.';

  @override
  String get fatihaIntroTitle => 'Мать Корана';

  @override
  String get fatihaIntroBody =>
      'Сура «Аль-Фатиха» — величайшая сура Корана. Она читается в каждом ракаате молитвы — не менее 17 раз в день. Это полноценный разговор между рабом и Аллахом и врата к каждой молитве.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ибн Касир пишет: «Аль-Фатиха содержит суть всего Корана — это молитва, провозглашение служения и просьба о наставлении на Прямой Путь». — Тафсир Ибн Касира';

  @override
  String get shahadaScreenTitle => 'Шахада';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ашхаду ан ля иляха илля-Ллах, ва ашхаду анна Мухаммадан расулю-Ллах';

  @override
  String get shahadaTranslation =>
      'Свидетельствую, что нет божества, кроме Аллаха, и свидетельствую, что Мухаммад — посланник Аллаха';

  @override
  String get shahadaWordBreakdownTitle => 'Слово за словом';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Ля';

  @override
  String get shahadaWord1Meaning => 'Нет';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'иляха';

  @override
  String get shahadaWord2Meaning => 'божества / бога';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'илля';

  @override
  String get shahadaWord3Meaning => 'кроме';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Аллаху';

  @override
  String get shahadaWord4Meaning => 'Аллаха (Единого Бога)';

  @override
  String get shahadaWord5Arabic => 'مُحَمَّدٌ';

  @override
  String get shahadaWord5Trans => 'Мухаммадун';

  @override
  String get shahadaWord5Meaning => 'Мухаммад';

  @override
  String get shahadaWord6Arabic => 'رَّسُولُ';

  @override
  String get shahadaWord6Trans => 'Расулю';

  @override
  String get shahadaWord6Meaning => 'Посланник / Пророк';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Аллахи';

  @override
  String get shahadaWord7Meaning => 'Аллаха';

  @override
  String get shahadaMeaningTitle => 'Смысл и значение';

  @override
  String get shahadaMeaningBody =>
      'Шахада — это свидетельство веры, лежащее в основе Ислама. Это первый из Пяти столпов. Произнеся эти слова с искренним убеждением, человек входит в лоно Ислама. Ибн Касир объясняет, что первая часть — «Нет божества, кроме Аллаха» — отрицает всех ложных божеств и утверждает абсолютное единство Аллаха. Вторая часть — «Мухаммад — Посланник Аллаха» — признаёт, что мы получаем наставление через Пророка ﷺ.';

  @override
  String get shahadaMomentTitle => 'Момент Шахады';

  @override
  String get shahadaMomentBody =>
      'Когда человек впервые произносит Шахаду с истинной верой в сердце, происходит нечто глубокое — он начинает новую жизнь. Пророк ﷺ сказал: «Кто скажет, что нет божества, кроме Аллаха, и отвергнет всё, чему поклоняются помимо Него, того имущество и кровь неприкосновенны». (Сахих Муслим). Все прошлые грехи прощаются. Начинается новая глава. Это свидетельство — не просто слова, это завет между вами и вашим Творцом, поворотный момент, который ангелы видят и записывают. Добро пожаловать в лоно Ислама.';

  @override
  String get shahadaPronunciationTitle => 'Руководство по произношению';

  @override
  String get shahadaPronunciationPart1 => 'Ля · и · ЛЯ · ха · иль · ЛЯЛ · ЛАХ';

  @override
  String get shahadaPronunciationPart2 =>
      'Му · ХАМ · ма · дун · ра · СУ · люл · ЛАХ';

  @override
  String get toolboxLearnSalahSubtitle => 'Пошаговое руководство';

  @override
  String get toolboxWuduSubtitle => 'Очищение перед молитвой';

  @override
  String get toolboxGlossarySubtitle => '114 исламских терминов с объяснениями';

  @override
  String get shareSheetTitle => 'Поделиться';

  @override
  String get shareAnAyah => 'Поделиться аятом';

  @override
  String get shareADua => 'Поделиться дуа';

  @override
  String get shareANameOfAllah => 'Поделиться именем Аллаха';

  @override
  String get shareAHadith => 'Поделиться хадисом';

  @override
  String get shareViaLabel => 'Отправлено через Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Аят дня';

  @override
  String get shareCardDuaLabel => '✦ Дуа';

  @override
  String get shareCardNameLabel => '✦ Имя Аллаха';

  @override
  String get shareCardHadithLabel => '✦ Хадис';

  @override
  String get sharePickDuaTitle => 'Выберите дуа, чтобы поделиться';

  @override
  String get shareError => 'Не удалось создать изображение';

  @override
  String get shareCardVerseLabel => '✦ Аят Корана';

  @override
  String get shareCardAsmaLabel => '✦ Асма уль-Хусна';

  @override
  String get shareAyahSubtitle => 'Выберите из 30 аятов Корана';

  @override
  String get shareDuaSubtitle => 'Выберите из библиотеки';

  @override
  String get shareNameSubtitle => 'Выберите из всех 99 Прекрасных Имён';

  @override
  String get shareHadithSubtitle => 'Выберите из 20 достоверных хадисов';

  @override
  String get shareThisDua => 'Поделиться этим дуа';

  @override
  String get sharePickAyahTitle => 'Выберите аят, чтобы поделиться';

  @override
  String get searchAyahs => 'Поиск аятов…';

  @override
  String get noAyahsFoundShort => 'Аяты не найдены';

  @override
  String get shareThisAyah => 'Поделиться этим аятом';

  @override
  String get sharePickNameTitle => 'Выберите имя, чтобы поделиться';

  @override
  String get shareThisName => 'Поделиться этим именем';

  @override
  String get sharePickHadithTitle => 'Выберите хадис, чтобы поделиться';

  @override
  String get searchHadiths => 'Поиск хадисов…';

  @override
  String get noHadithsFound => 'Хадисы не найдены';

  @override
  String get shareThisHadith => 'Поделиться этим хадисом';

  @override
  String get backToBasics => 'Возвращение к основам';

  @override
  String get backToBasicsSubtitle => 'Ваш путеводитель по основам Ислама';

  @override
  String get fivePillarsOfIslam => '5 столпов Ислама';

  @override
  String get fivePillarsShort => '5 столпов';

  @override
  String get fivePillarsSubtitle => 'Основы исламской веры';

  @override
  String get pillarLearnMore => 'Подробнее';

  @override
  String get pillarShowLess => 'Свернуть';

  @override
  String get pillarsShowDetails => 'Показать подробности';

  @override
  String get pillarsHideDetails => 'Скрыть подробности';

  @override
  String get pillar1Name => 'Шахада';

  @override
  String get pillar1Desc => 'Свидетельство веры';

  @override
  String get pillar1Detail =>
      'Свидетельство веры — основа Ислама. Искренне произнеся «Нет божества, кроме Аллаха, и Мухаммад — Его посланник», человек входит в лоно Ислама.';

  @override
  String get pillar2Name => 'Салях';

  @override
  String get pillar2Desc => 'Пять ежедневных молитв';

  @override
  String get pillar2Detail =>
      'Пять ежедневных молитв — это прямая связь между мусульманином и Аллахом. Совершаемые на рассвете, в полдень, после полудня, на закате и ночью, они выстраивают весь день мусульманина вокруг поминания Аллаха.';

  @override
  String get pillar3Name => 'Закят';

  @override
  String get pillar3Desc => 'Обязательная милостыня';

  @override
  String get pillar3Detail =>
      'Закят — обязательная ежегодная милостыня в размере 2,5% от сбережений, отдаваемая нуждающимся. Он очищает имущество и укрепляет узы мусульманской общины.';

  @override
  String get pillar4Name => 'Саум';

  @override
  String get pillar4Desc => 'Пост в Рамадан';

  @override
  String get pillar4Detail =>
      'Пост в благословенный месяц Рамадан от рассвета до заката. Мусульмане воздерживаются от еды, питья и грехов, чтобы обрести таква (богобоязненность) и благодарность.';

  @override
  String get pillar5Name => 'Хадж';

  @override
  String get pillar5Desc => 'Паломничество в Мекку';

  @override
  String get pillar5Detail =>
      'Паломничество в Мекку обязательно один раз в жизни для каждого мусульманина, у которого есть физическая и финансовая возможность. Это крупнейшее ежегодное собрание людей на земле.';

  @override
  String get switchedToNewMuslimMode => 'Включён режим нового мусульманина';

  @override
  String get switchedToRegularMode => 'Включён обычный режим';

  @override
  String get liveNotifChannelName => 'Noor Guard Live';

  @override
  String get liveNotifChannelDescription =>
      'Обратный отсчёт до молитвы и ежедневный исламский контент на экране блокировки';

  @override
  String get liveNotifHeaderAyah => 'АЯТ ДНЯ';

  @override
  String get liveNotifHeaderDua => 'ДУА ДНЯ';

  @override
  String get liveNotifHeaderWord => 'СЛОВО ДНЯ';

  @override
  String get liveNotifHeaderName => 'ИМЯ АЛЛАХА';

  @override
  String get liveNotifHeaderHadith => 'ХАДИС ДНЯ';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'через $hours ч $minutes мин';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'через $minutes мин';
  }

  @override
  String get liveNotifCountdownNow => 'Время молитвы';

  @override
  String get savedDuas => 'Сохранённые дуа';

  @override
  String get savedVerses => 'Сохранённые аяты';

  @override
  String get savedNames => 'Сохранённые имена';

  @override
  String get noSavedDuas => 'Пока нет сохранённых дуа';

  @override
  String get noSavedVerses => 'Пока нет сохранённых аятов';

  @override
  String get noSavedNames => 'Пока нет сохранённых имён';

  @override
  String get heroVerse16 =>
      'Господь наш! Не взыщи с нас, если мы забыли или ошиблись.';

  @override
  String get heroVerse17 =>
      'Достаточно нам Аллаха, и Он — наилучший Попечитель.';

  @override
  String get heroVerse18 =>
      'О вы, которые уверовали, веруйте в Аллаха и Его Посланника.';

  @override
  String get heroVerse19 =>
      'О вы, которые уверовали, бойтесь Аллаха и ищите пути приближения к Нему.';

  @override
  String get heroVerse20 =>
      'Поистине, моя молитва, моё жертвоприношение, моя жизнь и моя смерть — ради Аллаха, Господа миров.';

  @override
  String get heroVerse21 =>
      'Предпиши нам добро в этом мире и в Последней жизни; мы вернулись к Тебе.';

  @override
  String get heroVerse22 => 'Поминайте Аллаха часто, чтобы вы преуспели.';

  @override
  String get heroVerse23 =>
      'Нас постигнет только то, что предписал нам Аллах; Он — наш Покровитель.';

  @override
  String get heroVerse24 =>
      'Поистине, приближённые Аллаха — не будет над ними страха, и не будут они опечалены.';

  @override
  String get heroVerse25 =>
      'Мой успех — только от Аллаха; на Него я уповаю и к Нему обращаюсь.';

  @override
  String get heroVerse26 => 'Не отчаивайтесь в милости Аллаха.';

  @override
  String get heroVerse27 =>
      'Те, которые уверовали и чьи сердца находят покой в поминании Аллаха.';

  @override
  String get heroVerse28 =>
      'И вот возвестил ваш Господь: если вы будете благодарны, Я непременно дам вам больше.';

  @override
  String get heroVerse29 =>
      'И поклоняйся Господу твоему, пока не придёт к тебе убеждённость.';

  @override
  String get heroVerse30 =>
      'Поистине, Аллах — с теми, кто богобоязнен, и с теми, кто творит добро.';

  @override
  String get focusButtonSubtitle => 'Берегите время для главного';

  @override
  String get ourStories => 'Наши истории';

  @override
  String get storiesSeeAll => 'Все';

  @override
  String get storiesReadMore => 'Читать далее';

  @override
  String get storiesFeaturedLabel => 'Избранная история';

  @override
  String get storiesFilterReverts => 'Принявшие Ислам';

  @override
  String get storyCategoryRevert => 'Принявший Ислам';

  @override
  String get storyCategoryBornMuslim => 'Мусульманин от рождения';

  @override
  String get storyCategoryReturning => 'Вернувшийся';

  @override
  String get storiesShareYours => 'Поделитесь своей';

  @override
  String get storiesEmptyTitle => 'Историй пока нет';

  @override
  String get storiesEmptySubtitle =>
      'Станьте первым, кто поделится своим путём';

  @override
  String storyShahadaDate(Object date) {
    return 'Шахада: $date';
  }

  @override
  String get storiesComments => 'Комментарии';

  @override
  String get storiesAddComment => 'Добавить комментарий…';

  @override
  String get storiesAnonymous => 'Аноним';

  @override
  String get storiesNameLabel => 'Ваше имя';

  @override
  String get storiesPostAnonymously => 'Опубликовать анонимно';

  @override
  String get storiesCountryLabel => 'Страна';

  @override
  String get storiesCategoryLabel => 'Категория';

  @override
  String get storiesShahadaDateLabel => 'Дата Шахады (необязательно)';

  @override
  String get storiesYourStoryLabel => 'Ваша история';

  @override
  String get storiesStoryHint => 'Расскажите о своём пути…';

  @override
  String get storiesChooseBackground => 'Выберите фон';

  @override
  String get storiesBackgroundNone => 'Без фона';

  @override
  String get storiesEditTitle => 'Редактировать историю';

  @override
  String get storiesSaveChanges => 'Сохранить изменения';

  @override
  String get storiesUpdated => 'Ваша история обновлена';

  @override
  String get storiesUploadPhoto => 'Загрузить фото (необязательно)';

  @override
  String get storiesChangePhoto => 'Изменить фото';

  @override
  String get storiesSubmitButton => 'Отправить';

  @override
  String get storiesSubmitted =>
      'ДжазакАллаху хайран! Ваша история отправлена на проверку.';

  @override
  String get storiesSubmitError => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get storiesFillRequired =>
      'Пожалуйста, добавьте вашу историю и страну.';

  @override
  String get storiesShareCardLabel => 'История сообщества';

  @override
  String get storiesPreviewLabel => 'Предпросмотр';

  @override
  String get storiesPendingReview => 'На проверке';

  @override
  String get storiesFilterSaved => 'Сохранённые';

  @override
  String get storiesSavedEmpty => 'Пока нет сохранённых историй';

  @override
  String get storiesSearchCountryHint => 'Поиск страны…';

  @override
  String get storiesChooseAvatar => 'Выберите аватар';

  @override
  String get storiesAvatarInitials => 'Инициалы';

  @override
  String get storiesAvatarIcon => 'Иконка';

  @override
  String get storiesAvatarPattern => 'Узор';

  @override
  String get storiesLoadError =>
      'Не удалось загрузить истории. Проверьте подключение.';

  @override
  String get storiesDiscardTitle => 'Удалить вашу историю?';

  @override
  String get storiesDiscard => 'Удалить';

  @override
  String get storiesKeepWriting => 'Продолжить писать';

  @override
  String get storiesSaveDraft => 'Сохранить черновик';

  @override
  String get storiesDraftSaved => 'Черновик сохранён';

  @override
  String get storiesDeleteDraft => 'Удалить черновик';

  @override
  String get storiesContinueDraft => 'Продолжить черновик';

  @override
  String get storiesStartFresh => 'Начать заново';

  @override
  String get shareCardGlossaryLabel => '✦ Исламский глоссарий';

  @override
  String get shareCardTafsirLabel => '✦ Тафсир';

  @override
  String shareCardAyahRef(String number) {
    return 'Аят $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 Время Фаджра';

  @override
  String get prayerReminderTitleDhuhr => '☀️ Время Зухра';

  @override
  String get prayerReminderTitleAsr => '🌤️ Время Асра';

  @override
  String get prayerReminderTitleMaghrib => '🌅 Время Магриба';

  @override
  String get prayerReminderTitleIsha => '🌙 Время Иша';

  @override
  String get prayerReminderBodyFajr =>
      'Вставайте и молитесь. Аллах вознаграждает тех, кто просыпается ради Него.';

  @override
  String get prayerReminderBodyDhuhr =>
      'Уделите время Аллаху. Вас ждёт молитва Зухр.';

  @override
  String get prayerReminderBodyAsr =>
      'Средняя молитва. Оберегайте её. — Аль-Бакара 2:238';

  @override
  String get prayerReminderBodyMaghrib =>
      'Солнце зашло. Ответьте на призыв Аллаха.';

  @override
  String get prayerReminderBodyIsha =>
      'Завершите день с Аллахом. Вас ждёт ночная молитва.';

  @override
  String get prayerAlarmMessageFajr =>
      'Вставайте и молитесь. Аллах вознаграждает тех, кто просыпается ради Него.';

  @override
  String get prayerAlarmMessageDhuhr =>
      'Уделите время Аллаху. Вас ждёт молитва Зухр.';

  @override
  String get prayerAlarmMessageAsr =>
      'Оберегайте среднюю молитву. — Аль-Бакара 2:238';

  @override
  String get prayerAlarmMessageMaghrib =>
      'Солнце зашло. Ответьте на призыв Аллаха.';

  @override
  String get prayerAlarmMessageIsha =>
      'Завершите день с Аллахом. Вас ждёт ночная молитва.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer через 15 минут';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'Время подготовиться к молитве $prayer';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'Время молитвы $prayer';
  }

  @override
  String get testNotificationTitle => '🔔 Тестовое уведомление';

  @override
  String get testNotificationBody => 'Уведомления работают правильно!';

  @override
  String get favoriteRecitersSection => 'Избранные';

  @override
  String get favoriteRecitersLimit =>
      'Можно добавить только 3 избранных чтецов. Удалите одного, чтобы добавить другого.';

  @override
  String get findQiblaDirection => 'Найти направление Киблы';

  @override
  String get storyMenuShare => 'Поделиться';

  @override
  String get storyMenuBookmark => 'В закладки';

  @override
  String get storyMenuReport => 'Пожаловаться';

  @override
  String get reportSheetTitle => 'Пожаловаться на эту историю';

  @override
  String get reportSheetSubtitle =>
      'Помогите нам сохранить Noor Guard безопасным';

  @override
  String get reportReasonInappropriate => 'Неприемлемый контент';

  @override
  String get reportReasonSpam => 'Спам';

  @override
  String get reportReasonHateSpeech => 'Разжигание ненависти';

  @override
  String get reportReasonOther => 'Другое';

  @override
  String get reportSubmit => 'Отправить жалобу';

  @override
  String get reportThankYou => 'ДжазакАллаху хайран — спасибо за сообщение';

  @override
  String get adminMode => 'Режим администратора';

  @override
  String get adminTitle => 'Администратор';

  @override
  String get adminTabPending => 'Истории на проверке';

  @override
  String get adminTabReported => 'Истории с жалобами';

  @override
  String get adminApprove => 'Одобрить';

  @override
  String get adminReject => 'Отклонить';

  @override
  String get adminDeleteStory => 'Удалить историю';

  @override
  String get adminDismiss => 'Отклонить жалобу';

  @override
  String get adminEmptyPending => 'Нет историй на проверке';

  @override
  String get adminEmptyReports => 'Нет жалоб на рассмотрении';
}
