// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Que Allah bendiga tu día';

  @override
  String get nextPrayer => 'Próxima Oración';

  @override
  String get iPrayedButton => 'Ya oré';

  @override
  String get todaysPrayers => 'Oraciones de Hoy';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Modo Enfoque';

  @override
  String get appBlocking => 'Bloqueo de Apps';

  @override
  String get islamicCalendar => 'Calendario Islámico';

  @override
  String get islamicCalendarSubtitle => 'Fechas hijri y eventos';

  @override
  String get duas => 'Duas';

  @override
  String get quran => 'Corán';

  @override
  String get settings => 'Ajustes';

  @override
  String get complete => 'Completar';

  @override
  String get streak => 'Racha';

  @override
  String get dayStreak => 'días de racha';

  @override
  String get compassRequiresDevice => 'La brújula requiere un dispositivo real';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '$count día',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => '¡Todas las oraciones completadas! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 oraciones completadas';
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
    return '$count rakats obligatorios';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah antes';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah después';
  }

  @override
  String prayedAt(String time) {
    return 'Se reza a las $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise => 'el alba antes del amanecer';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'después de que el sol pasa su punto más alto';

  @override
  String get timePeriodLateAfternoon => 'a media tarde';

  @override
  String get timePeriodJustAfterSunset => 'justo después de la puesta del sol';

  @override
  String get timePeriodNightBeforeMidnight =>
      'en la noche antes de la medianoche';

  @override
  String get fajrHadith =>
      'Las dos rakats de Fajr son mejores que el mundo y todo lo que contiene. — Profeta Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr es la primera oración del día. Nos recuerda comenzar el día recordando a Allah.';

  @override
  String get dhuhrHadith =>
      'Quien rece las doce rakats sunnah, Allah le construirá una casa en el Paraíso.';

  @override
  String get dhuhrTip =>
      'Dhuhr es la oración del mediodía. Un momento perfecto para pausar el día y reconectar.';

  @override
  String get asrHadith =>
      'Quien pierda la oración de Asr, es como si perdiera a su familia y su riqueza. — Profeta Muhammad ﷺ';

  @override
  String get asrTip =>
      'A Asr a menudo se le llama la oración del medio. Allah la menciona específicamente en el Corán (2:238).';

  @override
  String get maghribHadith => 'La oración de Maghrib es el Witr del día.';

  @override
  String get maghribTip =>
      'Maghrib marca el final del día de ayuno en Ramadán. Se reza justo cuando se pone el sol.';

  @override
  String get ishaHadith =>
      'Quien rece Isha en congregación, es como si hubiera rezado la mitad de la noche.';

  @override
  String get ishaTip =>
      'Isha es la última oración del día. Terminar el día con la oración trae paz y cierre.';

  @override
  String get newMuslimTip => 'Consejo para nuevos musulmanes';

  @override
  String get notificationsOn => 'Notificaciones activadas';

  @override
  String get notificationsOff => 'Notificaciones desactivadas';

  @override
  String get preview => 'Vista previa';

  @override
  String get lockPreviewCountdown => 'En 1h 23m  ·  4:47 p. m.';

  @override
  String get swipeUpToUnlock => 'Desliza hacia arriba para desbloquear';

  @override
  String get searchSurahs => 'Buscar suras…';

  @override
  String get noSurahsFound => 'No se encontraron suras';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String ayahs(int count) {
    return '$count aleyas';
  }

  @override
  String get searchDuas => 'Buscar duas…';

  @override
  String supplications(int count) {
    return '$count súplicas';
  }

  @override
  String get prayerSettings => 'Configuración de Oraciones';

  @override
  String get calculationMethod => 'Método de Cálculo';

  @override
  String get adhanSound => 'Sonido del Adhan';

  @override
  String get prayerNotifications => 'Notificaciones de Oración';

  @override
  String get statusOn => 'Activado';

  @override
  String get statusOff => 'Desactivado';

  @override
  String get enableAllNotifications => 'Activar todas las notificaciones';

  @override
  String get individualPrayers => 'Oraciones Individuales';

  @override
  String get appearance => 'Apariencia';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get aboutNoorGuard => 'Acerca de';

  @override
  String get version => 'Versión de la App';

  @override
  String get rateApp => 'Califica Noor Guard';

  @override
  String get shareApp => 'Comparte Noor Guard';

  @override
  String get contactSupport => 'Contactar Soporte';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get helpUsImprove => 'Ayúdanos a Mejorar';

  @override
  String get translationDisclaimer =>
      'Nuestras traducciones son asistidas por IA. Si notas algún error en tu idioma, ¡nos encantaría conocer tu opinión!';

  @override
  String get privacyPromiseTitle => 'La Promesa de Privacidad de Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Tu fe es personal. Tus datos también lo son. Nunca vendemos, compartimos ni monetizamos tus datos. Ni tu ubicación. Ni tus hábitos de oración. Ni tu nombre.';

  @override
  String get directionToSacredHouse => 'Dirección hacia la Casa Sagrada';

  @override
  String towardMecca(String degrees) {
    return '$degrees° hacia La Meca';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (predeterminado)';

  @override
  String get prayerHistory => 'Historial de Oraciones';

  @override
  String get currentStreak => 'Racha Actual';

  @override
  String get longestStreak => 'Racha Más Larga';

  @override
  String get legend => 'Leyenda';

  @override
  String get allFivePrayers => 'Las 5 oraciones';

  @override
  String get partialPrayers => 'Parcial (1–4)';

  @override
  String get none => 'Ninguna';

  @override
  String get sun => 'Dom';

  @override
  String get mon => 'Lun';

  @override
  String get tue => 'Mar';

  @override
  String get wed => 'Mié';

  @override
  String get thu => 'Jue';

  @override
  String get fri => 'Vie';

  @override
  String get sat => 'Sáb';

  @override
  String headingDegrees(String degrees) {
    return 'Rumbo $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'No se pudieron cargar las suras';

  @override
  String get connectionError =>
      'Por favor revisa tu conexión a internet e intenta de nuevo';

  @override
  String get alQuran => 'Al-Corán';

  @override
  String get dailySupplications => 'Súplicas Diarias';

  @override
  String get all => 'Todas';

  @override
  String get noDuasFound => 'No se encontraron súplicas';

  @override
  String get january => 'enero';

  @override
  String get february => 'febrero';

  @override
  String get march => 'marzo';

  @override
  String get april => 'abril';

  @override
  String get may => 'mayo';

  @override
  String get june => 'junio';

  @override
  String get july => 'julio';

  @override
  String get august => 'agosto';

  @override
  String get september => 'septiembre';

  @override
  String get october => 'octubre';

  @override
  String get november => 'noviembre';

  @override
  String get december => 'diciembre';

  @override
  String get home => 'Inicio';

  @override
  String get prayers => 'Oraciones';

  @override
  String get more => 'Más';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Pantalla de bloqueo';

  @override
  String get readAndListen => 'Leer y escuchar';

  @override
  String get commentary => 'Comentario';

  @override
  String get findDirection => 'Encontrar dirección';

  @override
  String get reminders => 'Recordatorios';

  @override
  String get blockDistractions => 'Bloquear distracciones';

  @override
  String get prayerGuard => 'Guardián de oración';

  @override
  String get importantDates => 'Fechas importantes';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get morningAndEvening => 'Mañana y tarde';

  @override
  String get prayer => 'Oración';

  @override
  String get foodAndDrink => 'Comida y bebida';

  @override
  String get verityWithHardship =>
      'En verdad, con la dificultad viene la facilidad.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Protejan fielmente sus oraciones, especialmente la oración de en medio.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Eventos pasados';

  @override
  String get upcomingEvents => 'Próximos eventos';

  @override
  String get today => 'Hoy';

  @override
  String get next => 'Próximo';

  @override
  String hijriYearLabel(int year) {
    return '$year d. H.';
  }

  @override
  String get islamicMonthMuharram => 'Muharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabī\' Al-Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabī\' Al-Thāni';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumada Al-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumada Al-Thani';

  @override
  String get islamicMonthRajab => 'Rayab';

  @override
  String get islamicMonthShaban => 'Shaabán';

  @override
  String get islamicMonthRamadan => 'Ramadán';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qadah';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Año Nuevo Islámico';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Comienza el Ramadán';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Día de Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Activo';

  @override
  String get focusModeSubtitle =>
      'Protege tu concentración. Tus apps están bloqueadas hasta que detengas la sesión.';

  @override
  String get remaining => 'restante';

  @override
  String get ready => 'listo';

  @override
  String get duration => 'Duración';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Bloqueadas durante el enfoque';

  @override
  String appsBlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps',
      one: '$count app',
    );
    return '$_temp0';
  }

  @override
  String get startFocus => 'Iniciar enfoque';

  @override
  String get stopFocus => 'Detener enfoque';

  @override
  String get alhamdulillah => '¡Alhamdulillah!';

  @override
  String get sessionComplete => 'Sesión completada';

  @override
  String stayedFocusedFor(String duration) {
    return 'Te mantuviste concentrado durante $duration.';
  }

  @override
  String focusSessionMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutos',
      one: '$count minuto',
    );
    return '$_temp0';
  }

  @override
  String get focusCompletionQuote =>
      '\"Y busquen ayuda a través de la paciencia y la oración.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Listo';

  @override
  String get socialMedia => 'Redes Sociales';

  @override
  String get entertainment => 'Entretenimiento';

  @override
  String get games => 'Juegos';

  @override
  String get messaging => 'Mensajería';

  @override
  String get blockDuringPrayerTimes =>
      'Bloquear durante los horarios de oración';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Las apps seleccionadas se bloquearán automáticamente\ndurante las 5 oraciones diarias.';

  @override
  String get blockedLabel => 'bloqueadas';

  @override
  String get blockAllApps => 'Bloquear todas las apps';

  @override
  String get blockingTimingInfo =>
      'El bloqueo se activa 5 minutos antes de cada oración y se levanta 15 minutos después.';

  @override
  String get blockedDuringPrayers => 'Bloqueada durante las oraciones';

  @override
  String get notBlocked => 'No bloqueada';

  @override
  String get wuduStep1 => 'Intención';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Lavar las manos';

  @override
  String get wuduStep4 => 'Enjuagar la boca';

  @override
  String get wuduStep5 => 'Limpiar la nariz';

  @override
  String get wuduStep6 => 'Lavar la cara';

  @override
  String get wuduStep7 => 'Lavar los brazos';

  @override
  String get wuduStep8 => 'Limpiar la cabeza';

  @override
  String get wuduStep9 => 'Lavar los pies';

  @override
  String get revertCorner => 'Rincón del Converso';

  @override
  String get revertCornerSubtitle => 'Guías y apoyo para nuevos musulmanes';

  @override
  String get wuduGuide => 'Guía de Wudú';

  @override
  String get howToPray => 'Cómo Orar';

  @override
  String get newMuslimChecklist => 'Lista del Nuevo Musulmán';

  @override
  String get islamicGlossary => 'Glosario Islámico';

  @override
  String get whyDoWe => '¿Por qué hacemos...';

  @override
  String get communityStories => 'Historias de la Comunidad';

  @override
  String get wuduGuideSubtitle => 'Purificación antes de la oración';

  @override
  String get howToPraySubtitle => 'Guía paso a paso de la oración';

  @override
  String get newMuslimChecklistSubtitle => 'Tu viaje de 30 días';

  @override
  String get howToPrayStep1Name => 'Primero el Wudú';

  @override
  String get howToPrayStep1Instruction =>
      'Realiza el wudú (ablución) para estar en estado de pureza antes de comenzar a orar.';

  @override
  String get howToPrayStep1Tip =>
      'Si no estás seguro, abre primero la Guía de Wudú desde el Centro del Nuevo Musulmán.';

  @override
  String get howToPrayStep2Name => 'Ponte de Pie Frente a la Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Párate en tu tapete de oración mirando hacia la Qibla — la dirección de la Kaaba en La Meca. Usa la brújula Qibla en la app para encontrar la dirección exacta.';

  @override
  String get howToPrayStep2Tip =>
      'Está bien si estás un poco desviado — Allah conoce tu intención. Haz tu mejor esfuerzo.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intención)';

  @override
  String get howToPrayStep3Instruction =>
      'Haz la intención en tu corazón para la oración que estás a punto de realizar. No necesitas decirlo en voz alta.';

  @override
  String get howToPrayStep3Tip =>
      'Tu intención es entre tú y Allah. Un pensamiento simple como \'Estoy orando Fajr por Allah\' es suficiente.';

  @override
  String get howToPrayStep4Name => 'Takbir (Apertura)';

  @override
  String get howToPrayStep4Instruction =>
      'Levanta ambas manos a los lóbulos de las orejas y di \'Allahu Akbar\' (Allah es el más Grande). Esto inicia oficialmente tu oración.';

  @override
  String get howToPrayStep4Tip =>
      'Mantén tus ojos enfocados hacia abajo en tu lugar de postración durante toda la oración.';

  @override
  String get howToPrayStep5Name => 'Qiyam (De Pie)';

  @override
  String get howToPrayStep5Instruction =>
      'Coloca tu mano derecha sobre tu mano izquierda en tu pecho. Recita la Surah Al-Faatiha seguida de cualquier otra surah corta o versos que conozcas.';

  @override
  String get howToPrayStep5Tip =>
      'Si aún no sabes ninguna otra surah, recitar solo Al-Faatiha es aceptable mientras estás aprendiendo.';

  @override
  String get howToPrayStep6Name => 'Ruku (Inclinación)';

  @override
  String get howToPrayStep6Instruction =>
      'Inclínate doblando la cintura con la espalda paralela al suelo. Coloca tus manos en las rodillas y di \'Subhana Rabbiyal Adheem\' tres veces.';

  @override
  String get howToPrayStep6Tip =>
      'Mantén tu espalda recta y horizontal — no arqueada ni redondeada.';

  @override
  String get howToPrayStep7Name => 'Itidal (Levantarse de la Inclinación)';

  @override
  String get howToPrayStep7Instruction =>
      'Levántate del arco y quédate de pie erguido. Di \'Sami Allahu liman hamidah\' mientras te levantas, luego di \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Quédate completamente erguido y mantente quieto un momento antes de pasar a la siguiente posición.';

  @override
  String get howToPrayStep8Name => 'Sujud (Postración)';

  @override
  String get howToPrayStep8Instruction =>
      'Baja al suelo colocando tu frente, nariz, ambas palmas, rodillas y dedos de los pies en el piso. Di \'Subhana Rabbiyal A\'la\' tres veces.';

  @override
  String get howToPrayStep8Tip =>
      'Siete partes del cuerpo deben tocar el suelo: frente (con nariz), dos manos, dos rodillas y dos pies.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Sentarse Entre Postraciones)';

  @override
  String get howToPrayStep9Instruction =>
      'Siéntate desde la postración con el pie izquierdo plano y el pie derecho erguido. Di \'Allahu Akbar\' al sentarte. Haz una breve pausa, luego vuelve a bajar para la segunda postración.';

  @override
  String get howToPrayStep9Tip =>
      'Esta breve sentada entre las dos postraciones se llama Jalsa. Es una parte obligatoria de la oración.';

  @override
  String get howToPrayStep10Name => 'Completa las Unidades de Oración';

  @override
  String get howToPrayStep10Instruction =>
      'Después de completar el primer rakat, levántate y repite los mismos pasos para el segundo rakat. El número de rakats depende de qué oración estás realizando.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr tiene 2 rakats, Dhuhr 4, Asr 4, Maghrib 3 e Isha 4. Hazlo un rakat a la vez.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Sentado Final)';

  @override
  String get howToPrayStep11Instruction =>
      'En la posición sentada final, recita el Tashahhud. Esta es una declaración de fe que recitas sentado después de tu último rakat.';

  @override
  String get howToPrayStep11Tip =>
      'Durante el Tashahhud, levanta tu dedo índice derecho cuando digas \'Ash-hadu alla ilaha illallah\' como señal de la unicidad de Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Cierre)';

  @override
  String get howToPrayStep12Instruction =>
      'Gira tu cabeza hacia la derecha y di \'Assalamu Alaikum wa Rahmatullah\', luego gira hacia la izquierda y repite. Esto termina tu oración.';

  @override
  String get howToPrayStep12Tip =>
      'Después de la oración, tómate un momento para hacer dua (súplica) y pide a Allah lo que necesitas. Este es un hermoso momento para conectarte con Allah.';

  @override
  String get checklistWeek1Title => 'Semana 1';

  @override
  String get checklistWeek2Title => 'Semana 2';

  @override
  String get checklistWeek3Title => 'Semana 3';

  @override
  String get checklistWeek4Title => 'Semana 4';

  @override
  String get checklistWeek1Item1 => 'Pronunciar la Shahada';

  @override
  String get checklistWeek1Item2 => 'Aprender el Wudú';

  @override
  String get checklistWeek1Item3 => 'Aprender Al-Fátiha';

  @override
  String get checklistWeek1Item4 => 'Orar tu primer Fayr';

  @override
  String get checklistWeek1Item5 => 'Conseguir una alfombra de oración';

  @override
  String get checklistWeek1Item6 => 'Encontrar una mezquita local';

  @override
  String get checklistWeek2Item1 => 'Aprender los 5 horarios de oración';

  @override
  String get checklistWeek2Item2 => 'Aprender du\'as básicas';

  @override
  String get checklistWeek2Item3 => 'Leer sobre el Profeta Muhammad';

  @override
  String get checklistWeek2Item4 => 'Conectar con la comunidad musulmana';

  @override
  String get checklistWeek3Item1 => 'Aprender sobre la comida halal';

  @override
  String get checklistWeek3Item2 => 'Leer la Surah Al-Ijlas';

  @override
  String get checklistWeek3Item3 => 'Aprender sobre el Ramadán';

  @override
  String get checklistWeek3Item4 => 'Comenzar el dhikr diario';

  @override
  String get checklistWeek4Item1 => 'Aprender sobre el Zakat';

  @override
  String get checklistWeek4Item2 => 'Leer sobre los 5 pilares';

  @override
  String get checklistWeek4Item3 => 'Configurar notificaciones de oración';

  @override
  String get checklistWeek4Item4 => 'Reflexionar sobre tu camino';

  @override
  String get wuduStep1Instruction =>
      'Haz la intención en tu corazón de realizar el wudú por Allah.';

  @override
  String get wuduStep1Tip =>
      'No necesitas decirlo en voz alta — una intención sincera en el corazón es suficiente.';

  @override
  String get wuduStep2Instruction =>
      'Di Bismillah (En el nombre de Allah) antes de comenzar.';

  @override
  String get wuduStep2Tip =>
      'Decir Bismillah es sunnah y comienza tu wudú con el recuerdo de Allah.';

  @override
  String get wuduStep3Instruction =>
      'Lava ambas manos hasta las muñecas tres veces, asegurándote de que el agua llegue entre los dedos.';

  @override
  String get wuduStep3Tip =>
      'Comienza con la mano derecha, luego la izquierda. Este orden es recomendado en el Islam.';

  @override
  String get wuduStep4Instruction =>
      'Toma agua en tu boca, hazla girar y escúpela. Haz esto tres veces.';

  @override
  String get wuduStep4Tip =>
      'Esto limpia la boca y es parte del proceso de purificación.';

  @override
  String get wuduStep5Instruction =>
      'Inhala agua por la nariz y sóplala suavemente. Haz esto tres veces.';

  @override
  String get wuduStep5Tip =>
      'Usa tu mano derecha para inhalar el agua y la mano izquierda para expulsarla.';

  @override
  String get wuduStep6Instruction =>
      'Lava toda tu cara tres veces, desde la línea del cabello hasta el mentón y de oreja a oreja.';

  @override
  String get wuduStep6Tip =>
      'Asegúrate de que ninguna parte de tu cara quede seca.';

  @override
  String get wuduStep7Instruction =>
      'Lava tu brazo derecho desde las puntas de los dedos hasta el codo tres veces, luego haz lo mismo con el brazo izquierdo.';

  @override
  String get wuduStep7Tip =>
      'Siempre comienza con el lado derecho antes que el izquierdo en el wudú.';

  @override
  String get wuduStep8Instruction =>
      'Moja tus manos y pasa sobre toda tu cabeza una vez, de adelante hacia atrás y de atrás hacia adelante.';

  @override
  String get wuduStep8Tip =>
      'A diferencia del lavado, limpiar la cabeza se hace solo una vez.';

  @override
  String get wuduStep9Instruction =>
      'Lava tu pie derecho hasta el tobillo inclusive tres veces, luego haz lo mismo con el pie izquierdo.';

  @override
  String get wuduStep9Tip =>
      'Asegúrate de que el agua llegue entre los dedos de los pies. Usa tu dedo para limpiar entre ellos.';

  @override
  String get islamicGlossaryTitle => 'Glosario Islámico';

  @override
  String get islamicGlossarySubtitle =>
      '51 términos del Corán, la Sunnah y la erudición clásica';

  @override
  String get searchTermsHint => 'Buscar términos, árabe, definiciones...';

  @override
  String get categoryAll => 'Todo';

  @override
  String get categoryPillar => 'Pilar';

  @override
  String get categoryAqeedah => 'Aqeedah';

  @override
  String get categoryPractice => 'Práctica';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Corán';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'Historia';

  @override
  String get noTermsFound => 'No se encontraron términos';

  @override
  String get sourceLabel => 'Fuente';

  @override
  String get revertCornerHubSubtitle =>
      'Un centro amable para guiar tus primeros pasos como nuevo musulmán';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Términos comunes explicados de forma sencilla';

  @override
  String get whyDoWeHubSubtitle =>
      'La sabiduría detrás de las prácticas cotidianas';

  @override
  String get communityStoriesHubSubtitle =>
      'Conversos comparten sus viajes al Islam';

  @override
  String get whyDoWeScreenSubtitle =>
      'La sabiduría detrás de 12 prácticas islámicas cotidianas';

  @override
  String get whyDoWeSourceBadge => 'Fuente Sunní';

  @override
  String get whyDoWeQ1 => '¿Por qué oramos 5 veces al día?';

  @override
  String get whyDoWeA1 =>
      'Allah ordenó las cinco oraciones diarias en el Corán (2:238) y se establecieron durante el Viaje Nocturno (Isra wal Miraj). El Profeta ﷺ dijo: «Lo primero de lo que el siervo será interrogado el Día del Juicio es la oración.» (Ibn Majah). La oración nos mantiene conectados con Allah a lo largo del día.';

  @override
  String get whyDoWeQ2 =>
      '¿Por qué nos orientamos hacia La Meca cuando oramos?';

  @override
  String get whyDoWeA2 =>
      'Allah ordenó en el Corán (2:144): «Vuelve tu rostro hacia la Mezquita Sagrada.» La Kaaba en La Meca es la primera casa construida para la adoración de Allah (3:96). Orientarse en la misma dirección une a todos los musulmanes en la oración en todo el mundo.';

  @override
  String get whyDoWeQ3 => '¿Por qué ayunamos en Ramadán?';

  @override
  String get whyDoWeA3 =>
      'Allah ordenó el ayuno en el Corán (2:183): «¡Oh creyentes!, se os ha prescrito el ayuno, como fue prescrito a quienes os precedieron, para que temáis a Allah.» Ramadán es el mes en que fue revelado el Corán (2:185).';

  @override
  String get whyDoWeQ4 => '¿Por qué decimos Bismillah antes de comer?';

  @override
  String get whyDoWeA4 =>
      'El Profeta ﷺ dijo: «Cuando uno de vosotros coma, que mencione el nombre de Allah. Si olvida al principio, diga: Bismillah en su principio y su final.» (Abu Dawud). Nos recuerda que todas las bendiciones vienen de Allah.';

  @override
  String get whyDoWeQ5 =>
      '¿Por qué nos quitamos los zapatos antes de entrar a una mezquita?';

  @override
  String get whyDoWeA5 =>
      'Cuando Allah ordenó a Moisés: «Quítate las sandalias, pues te encuentras en el sagrado valle de Tuwa.» (Corán 20:12). Quitarse los zapatos muestra respeto por la casa de Allah y mantiene limpio el lugar de oración.';

  @override
  String get whyDoWeQ6 => '¿Por qué decimos Assalamu Alaikum como saludo?';

  @override
  String get whyDoWeA6 =>
      'El Profeta ﷺ dijo: «No entraréis al paraíso hasta que creáis, y no creeréis hasta que os améis. ¿Queréis que os indique algo que os hará amaros? Difundid la paz entre vosotros.» (Muslim). También es una dua — estás orando por la paz de esa persona.';

  @override
  String get whyDoWeQ7 => '¿Por qué realizamos el Hajj?';

  @override
  String get whyDoWeA7 =>
      'El Hajj fue ordenado por Allah (3:97): «La peregrinación a esta Casa es una obligación de Allah para quien sea capaz.» Conmemora las pruebas del Profeta Ibrahim ﷺ y su familia, y une a los musulmanes de todas las naciones en adoración.';

  @override
  String get whyDoWeQ8 => '¿Por qué damos Zakat?';

  @override
  String get whyDoWeA8 =>
      'El Zakat es el tercer pilar del Islam, ordenado en el Corán más de 30 veces junto con la oración. El Profeta ﷺ dijo que purifica la riqueza. Reduce la desigualdad y recuerda a los creyentes que la riqueza pertenece a Allah.';

  @override
  String get whyDoWeQ9 =>
      '¿Por qué decimos Alhamdulillah después de estornudar?';

  @override
  String get whyDoWeA9 =>
      'El Profeta ﷺ dijo: «Cuando uno de vosotros estornude, diga Alhamdulillah, y que su hermano le diga Yarhamukallah.» (Bujari). Es un momento de gratitud a Allah por la bendición de la salud.';

  @override
  String get whyDoWeQ10 => '¿Por qué las mujeres musulmanas usan hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah ordenó en el Corán (24:31) que las creyentes guarden su pudor. El hijab es un acto de adoración y obediencia a Allah. Muchas mujeres musulmanas lo usan como fuente de identidad, dignidad y conexión espiritual.';

  @override
  String get whyDoWeQ11 => '¿Por qué evitamos el cerdo y el alcohol?';

  @override
  String get whyDoWeA11 =>
      'Allah prohibió el cerdo en el Corán (2:173) y el alcohol en (5:90), llamándolo «una abominación de la obra de Satanás.» Estas prohibiciones protegen la salud, la mente y la familia. Las directrices halal ayudan a mantener la pureza física y espiritual.';

  @override
  String get whyDoWeQ12 => '¿Por qué decimos Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah ordena en el Corán (18:23-24): «Nunca digas de nada: Haré eso mañana, sin añadir: Si Allah quiere.» Decir Inshallah reconoce que solo Allah controla el futuro y nos mantiene humildes.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Viajes reales al Islam desde todo el mundo';

  @override
  String get communityStoriesTimeLabel => 'Tiempo como musulmán';

  @override
  String get communityStoriesShareBtn => 'Comparte Tu Historia';

  @override
  String get communityStoriesShareSoon =>
      'Próximamente — ¡esta función está en camino!';

  @override
  String get communityStory1Name => 'Aisha (antes Sarah)';

  @override
  String get communityStory1Location => 'Texas, EE.UU.';

  @override
  String get communityStory1Time => '2 años';

  @override
  String get communityStory1Text =>
      'Encontré el Islam investigando para un trabajo universitario. Esperaba encontrar lo que los medios me decían. En cambio, encontré paz, lógica y un Dios que tenía sentido. Tomé mi shahada 6 meses después. Lo más difícil no fue aprender a orar — fue decírselo a mi familia. Pero Alhamdulillah, dos años después, mi madre me pregunta sobre el Islam ella misma.';

  @override
  String get communityStory2Name => 'Yusuf (antes James)';

  @override
  String get communityStory2Location => 'Londres, Reino Unido';

  @override
  String get communityStory2Time => '4 años';

  @override
  String get communityStory2Text =>
      'Me convertí después de años de búsqueda. Cristianismo, budismo, ateísmo — nada llenó el vacío. Un compañero musulmán me invitó a la oración del viernes. Me senté al fondo y lloré durante todo el tiempo. Ni siquiera sabía por qué. Tomé mi shahada la semana siguiente. La comunidad me envolvió como una familia que nunca supe que necesitaba.';

  @override
  String get communityStory3Name => 'Maryam (antes Maria)';

  @override
  String get communityStory3Location => 'Ciudad de México, México';

  @override
  String get communityStory3Time => '1 año';

  @override
  String get communityStory3Text =>
      'Ser latina y musulmana se siente como un superpoder. Encontré el Islam a través de un video de YouTube a las 2am. Miré durante horas. El concepto del tawheed — que Dios es uno, sin socios, sin imágenes — resonó tan profundamente. Mis hermanas hispanohablantes en la mezquita me hicieron sentir en casa de inmediato.';

  @override
  String get communityStory4Name => 'Ibrahim (antes David)';

  @override
  String get communityStory4Location => 'Toronto, Canadá';

  @override
  String get communityStory4Time => '6 años';

  @override
  String get communityStory4Text =>
      'Era hijo de un pastor. Tenía preguntas sobre la Trinidad que nadie podía responder. Cuando leí el Corán por primera vez, sentí que estaba leyendo algo que ya creía. Dije mi shahada en silencio, solo, y luego otra vez en la mezquita. La mejor decisión de mi vida.';

  @override
  String get communityStory5Name => 'Fatima (antes Jennifer)';

  @override
  String get communityStory5Location => 'Sídney, Australia';

  @override
  String get communityStory5Time => '3 años';

  @override
  String get communityStory5Text =>
      'Mi viaje comenzó con un hijab. Me lo puse como un reto y sentí... protección. Comencé a leer sobre el Islam y no podía parar. En tres meses ya había tomado mi shahada. La gente me pregunta qué dejé atrás. Les digo que dejé el vacío.';

  @override
  String get communityStory6Name => 'Omar (antes Kevin)';

  @override
  String get communityStory6Location => 'Johannesburgo, Sudáfrica';

  @override
  String get communityStory6Time => '5 años';

  @override
  String get communityStory6Text =>
      'Crecí en un barrio difícil. El Islam me dio disciplina, propósito y hermandad. La primera vez que hice sujood, algo en mí se abrió — de la mejor manera. Lloré y no pude explicar por qué. Ahora oriento a otros jóvenes que encuentran su camino al deen.';

  @override
  String get inspiredByRealStories =>
      'Inspirado en historias reales de conversos';

  @override
  String get storyFormTitle => 'Comparte Tu Historia';

  @override
  String get storyFormNameLabel => 'Tu Nombre';

  @override
  String get storyFormNameHint => 'Nombre, o escribe \'Anónimo\'';

  @override
  String get storyFormCountryLabel => 'País';

  @override
  String get storyFormCountryHint => '¿De dónde eres?';

  @override
  String get storyFormTimeLabel => 'Tiempo como musulmán';

  @override
  String get storyFormTimeHint => 'p. ej. 2 años, 6 meses';

  @override
  String get storyFormStoryLabel => 'Tu Historia';

  @override
  String get storyFormStoryHint => 'Comparte tu camino al Islam...';

  @override
  String get storyFormSubmitBtn => 'Enviar Historia';

  @override
  String get storyFormThankYouTitle => '¡JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Tu historia ha sido recibida. Revisamos todas las historias antes de publicarlas.';

  @override
  String get storyFormRequiredError => 'Por favor completa todos los campos';

  @override
  String get subtitleYourGuideToIslam => 'Tu guía hacia el Islam';

  @override
  String get beginnerMode => 'Modo Principiante';

  @override
  String get beginnerModeSubtitle =>
      'Consejos y orientación adicional para nuevos musulmanes';

  @override
  String get beginnerModeOn =>
      'El modo principiante está activado — se muestran consejos adicionales en toda la app';

  @override
  String get beginnerModePrayersTip =>
      'Consejo: Toca cada oración para aprender más sobre ella y ver las oraciones sunnah';

  @override
  String get tafsirSubtitle => 'Comentario Coránico';

  @override
  String get tafsirComingSoon =>
      'El tafsir de esta surah estará disponible pronto';

  @override
  String get tafsirNotAvailable => 'Tafsir no disponible';

  @override
  String get scholarSource => 'Fuente';

  @override
  String get asbabAlNuzul => 'Razón de Revelación';

  @override
  String get transliteration => 'Transliteración';

  @override
  String get selectReciter => 'Seleccionar Recitador';

  @override
  String get playVerse => 'Reproducir versículo';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'Los 99 Hermosos Nombres de Allah';

  @override
  String get asmaHadith =>
      'Allah tiene 99 nombres. Quien los memorice entrará al Paraíso.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Buscar nombres...';

  @override
  String get asmaNoResults => 'No se encontraron nombres';

  @override
  String get asmaSignificance => 'Significado';

  @override
  String get asmaUlHusnaTile => '99 Nombres';

  @override
  String get asmaUlHusnaTileSubtitle => 'Nombres de Allah';

  @override
  String get onboardingTagline => 'Cuida tu tiempo. Honra tus oraciones.';

  @override
  String get onboardingChooseLanguage => 'Elige tu idioma';

  @override
  String get onboardingGetStarted => 'Comenzar';

  @override
  String get onboardingLocationTitle => 'Horarios de Oración Precisos';

  @override
  String get onboardingLocationDesc =>
      'Noor Guard necesita tu ubicación para calcular los horarios de oración precisos de tu ciudad. Tu ubicación nunca se almacena ni se comparte.';

  @override
  String get onboardingPrivacyBanner =>
      'Tu fe es personal. Tus datos también lo son.';

  @override
  String get onboardingAllowLocation => 'Permitir Ubicación';

  @override
  String get onboardingSkipForNow => 'Omitir por ahora';

  @override
  String get onboardingNotificationTitle => 'Nunca Te Pierdas una Oración';

  @override
  String get onboardingNotificationDesc =>
      'Recibe notificaciones en cada horario de oración con un hermoso adhan. Personaliza sonidos y horarios en ajustes.';

  @override
  String get onboardingAdhanAlerts => 'Alertas de adhan';

  @override
  String get onboardingCustomTiming => 'Horarios personalizados';

  @override
  String get onboardingAdjustable => 'Ajustable';

  @override
  String get onboardingEnableNotifications => 'Activar Notificaciones';

  @override
  String get onboardingMaybeLater => 'Quizás más tarde';

  @override
  String get onboardingAllSetTitle => '¡Todo Listo!';

  @override
  String get onboardingAllSetDesc =>
      'Noor Guard está listo para proteger tu tiempo\ny guiar tu día con intención.';

  @override
  String get onboardingPrayerTimesLabel => 'Horarios de Oración';

  @override
  String get onboardingPrayerTimesDesc => 'Horarios precisos para tu ciudad';

  @override
  String get onboardingLockScreenLabel => 'Pantalla de Bloqueo Islámica';

  @override
  String get onboardingLockScreenDesc => 'Corán y duas en cada desbloqueo';

  @override
  String get onboardingPrayerGuardLabel => 'Guardián de Oración';

  @override
  String get onboardingPrayerGuardDesc =>
      'Las apps se bloquean automáticamente durante la salah';

  @override
  String get onboardingEnterApp => 'Entrar a Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'La Llamada a la Oración';

  @override
  String get adhanDescription =>
      'El Adhan es la llamada islámica a la oración, anunciada cinco veces al día para invitar a los creyentes a la adoración.';

  @override
  String get makkahStyle => 'Meca';

  @override
  String get madinahStyle => 'Medina';

  @override
  String get egyptianStyle => 'Egipcio';

  @override
  String get adhanPlaying => 'Reproduciendo ahora';

  @override
  String get makkahDescription =>
      'La llamada tradicional a la oración desde la Gran Mezquita de Meca.';

  @override
  String get madinahDescription =>
      'Una interpretación serena al estilo de la Mezquita del Profeta en Medina.';

  @override
  String get egyptianDescription =>
      'Un adhan melódico de estilo egipcio, conocido por su rica recitación.';

  @override
  String get adhanCallToWorship => 'La Llamada a la Oración';

  @override
  String get adhanDescriptionFull =>
      'El Adhan es la llamada islámica a la oración, anunciada cinco veces al día para invitar a los creyentes a la adoración.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turco';

  @override
  String get pakistaniStyle => 'Pakistaní';

  @override
  String get indonesianStyle => 'Indonesio';

  @override
  String get alafasyDescription =>
      'Una interpretación conmovedora del reconocido recitador Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'La llamada a la oración resonando desde la Mezquita de Al-Aqsa en Jerusalén, el tercer lugar más sagrado del Islam.';

  @override
  String get turkishDescription =>
      'Un ezan tradicional de estilo turco con su distintivo maqam melódico.';

  @override
  String get pakistaniDescription =>
      'Un adhan conmovedor de la tradición del sur de Asia, recitado en todo Pakistán.';

  @override
  String get indonesianDescription =>
      'Un adhan melodioso de estilo indonesio, querido en todo el archipiélago.';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String weeklyProgress(int count) {
    return '$count de 35 oraciones esta semana';
  }

  @override
  String get bestDay => 'Mejor día';

  @override
  String get prayerStats => 'Estadísticas de Oración';

  @override
  String get completionRate => 'Tasa de Finalización';

  @override
  String get bestPrayer => 'Oración Más Constante';

  @override
  String get hardestPrayer => 'Oración Más Omitida';

  @override
  String totalPrayersCompleted(int count) {
    return '$count oraciones completadas';
  }

  @override
  String get last7Days => 'Últimos 7 Días';

  @override
  String get thisMonth => 'Este Mes';

  @override
  String get fullDays => 'Días completos';

  @override
  String get partialDays => 'Días parciales';

  @override
  String get missedDays => 'Días perdidos';

  @override
  String get missedPrayerBadge => 'Perdida';

  @override
  String get makeItUp => 'Recuperarla';

  @override
  String get qadaExplanation =>
      'Si te perdiste una oración, todavía puedes rezarla como una oración Qada (de recuperación).';

  @override
  String get noStatsYet =>
      'Sigue marcando tus oraciones para ver tus estadísticas aquí.';

  @override
  String get notEnoughData => 'Aún no hay suficientes datos';

  @override
  String get continuousPlay => 'Continuo';

  @override
  String get sleepTimer => 'Temporizador';

  @override
  String verseCount(Object total, Object verse) {
    return 'Vers. $verse de $total';
  }

  @override
  String get verseTafsir => 'Tafsir del verso';

  @override
  String get tafsirOfTheDay => 'Tafsir del día';

  @override
  String get dailyInsight => 'Reflexión diaria';

  @override
  String get keyThemes => 'Temas y lecciones clave';

  @override
  String get readFullSurah => 'Leer sura completa';

  @override
  String get surahIntroduction => 'Introducción de la sura';

  @override
  String get verses => 'versos';

  @override
  String get loadingTafsir => 'Cargando tafsir...';

  @override
  String get keepAliveNotificationText => 'Notificaciones de oración activas';

  @override
  String get keepAliveChannelName => 'Notificaciones de oración';

  @override
  String get keepAliveChannelDescription =>
      'Mantiene a Noor Guard activo en segundo plano para que nunca te pierdas las alarmas de oración.';

  @override
  String get notifSetupTitle => 'Activar alertas en la pantalla de bloqueo';

  @override
  String get notifSetupSubtitle =>
      'Para que nunca te pierdas el adhan, incluso con el teléfono bloqueado. Toma aproximadamente un minuto.';

  @override
  String get notifSetupSamsungBanner =>
      '¿Usas un Samsung Galaxy (incluido Fold/Flip)? Samsung agrega interruptores adicionales además de Android estándar — los pasos 4 y 6 de abajo te muestran exactamente dónde encontrarlos.';

  @override
  String get notifSetupStep1Title => 'Permitir notificaciones';

  @override
  String get notifSetupStep1Description =>
      'El permiso básico que Noor Guard necesita para avisarte de cualquier cosa.';

  @override
  String get notifSetupStep1Action => 'Permitir notificaciones';

  @override
  String get notifSetupStep2Title => 'Alarmas y recordatorios';

  @override
  String get notifSetupStep2Description =>
      'Permite que las alarmas de oración suenen justo a la hora exacta, incluso si tu teléfono está inactivo o en ahorro de batería.';

  @override
  String get notifSetupStep2Action => 'Abrir ajustes de alarma';

  @override
  String get notifSetupStep3Title => 'Mostrar sobre otras apps';

  @override
  String get notifSetupStep3Description =>
      'Permite que la pantalla completa de oración aparezca sobre la pantalla de bloqueo y cualquier otra cosa abierta.';

  @override
  String get notifSetupStep3Action => 'Abrir ajustes';

  @override
  String get notifSetupStep4Title =>
      'Mostrar como ventana emergente / alerta de pantalla completa';

  @override
  String get notifSetupStep4Description =>
      'Permite que la pantalla del adhan aparezca sobre la pantalla de bloqueo en lugar de quedarse como un banner silencioso.';

  @override
  String get notifSetupStep4SamsungNote =>
      'En teléfonos Samsung Galaxy (incluido Fold/Flip): abre Ajustes → toca \"Prayer Time Alarm\", luego activa \"Pop-up notification\" (llamada \"Cover screen pop-up\" en Fold/Flip). Este interruptor es exclusivo de Samsung — activarlo es lo que realmente pone la pantalla del adhan sobre tu pantalla de bloqueo.';

  @override
  String get notifSetupStep4Action => 'Abrir ajustes de notificaciones';

  @override
  String get notifSetupStep5Title => 'Mantener las notificaciones confiables';

  @override
  String get notifSetupStep5Description =>
      'Evita que Android ralentice o retrase a Noor Guard en segundo plano, para que las alarmas y recordatorios de oración siempre lleguen a tiempo.';

  @override
  String get notifSetupStep5Action => 'Desactivar optimización de batería';

  @override
  String get notifSetupStep6Title => 'Apps que nunca duermen';

  @override
  String get notifSetupStep6Description =>
      'El administrador de batería de Samsung puede poner a dormir a Noor Guard y bloquear silenciosamente las alarmas de oración. Agregarlo a \"Never sleeping apps\" evita esto.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Ajustes → Batería y cuidado del dispositivo → Límites de uso en segundo plano → Never sleeping apps → toca \"+\" → selecciona Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Abrir ajustes de batería';

  @override
  String get notifSetupStatusChecking => 'Verificando…';

  @override
  String get notifSetupStatusEnabled => 'Activado';

  @override
  String get notifSetupStatusNeeded => 'Necesario';

  @override
  String get notifSetupStatusManual => 'Paso manual';

  @override
  String get notifSetupContinueButton => 'Continuar a Noor Guard';

  @override
  String get notifSetupLaterButton => 'Lo terminaré después';

  @override
  String get notifSetupDoneButton => 'Listo';

  @override
  String get testNotificationButton => 'Enviar notificación de prueba (10 s)';

  @override
  String get testNotificationSnack =>
      'La notificación de prueba llegará en 10 segundos';

  @override
  String get testLockAlarmButton => 'Probar alarma de pantalla completa (10 s)';

  @override
  String get testLockAlarmSnack =>
      'La alarma de bloqueo se activará en 10 segundos: bloquea tu teléfono ahora';

  @override
  String get testAdhanForegroundButton =>
      'Probar adhan en la app (en primer plano)';

  @override
  String get testAdhanForegroundSnack =>
      'Reproduciendo el adhan completo con un banner silencioso';

  @override
  String get testRequiresNotificationsOn =>
      'Activa las Notificaciones de Oración primero para probar esto';

  @override
  String get lockScreenSetupGuideButton =>
      'Guía de configuración de alertas de pantalla de bloqueo';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'No se pudo abrir la Política de Privacidad';

  @override
  String get couldNotOpenEmailApp => 'No se pudo abrir la app de correo';

  @override
  String get blockDurationLabel => 'Duración del bloqueo';

  @override
  String get privacyAndTrust => 'Privacidad y Confianza';

  @override
  String get noorGuardMotto =>
      '\"Si no pertenece a una mezquita,\nno pertenece a Noor Guard.\"';

  @override
  String get openingAppStore => 'Abriendo App Store…';

  @override
  String get openingShareSheet => 'Abriendo el panel de compartir…';

  @override
  String get openingSupportEmail => 'Abriendo correo de soporte…';

  @override
  String get openingTermsOfService => 'Abriendo los Términos de Servicio…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 hora';

  @override
  String get durationPrayerWindowOnly => 'Solo ventana de oración';

  @override
  String get hoursAbbreviation => 'h';

  @override
  String get cancelTimerButton => 'Cancelar temporizador';

  @override
  String get custom => 'Personalizado';

  @override
  String get customTimerMinutesTitle => 'Temporizador personalizado (minutos)';

  @override
  String get customTimerHint => 'p. ej. 20';

  @override
  String get cancel => 'Cancelar';

  @override
  String get start => 'Iniciar';

  @override
  String get travel => 'Viaje';

  @override
  String get anxietyAndStress => 'Ansiedad y Estrés';

  @override
  String get gratitude => 'Gratitud';

  @override
  String get protection => 'Protección';

  @override
  String get family => 'Familia';

  @override
  String get forgiveness => 'Perdón';

  @override
  String get appBlockingSetupHeadline => 'Guarda tu tiempo, guarda tu oración';

  @override
  String get appBlockingSetupBody =>
      'Noor Guard usa el servicio de Accesibilidad de Android solo para detectar cuándo se abre una app bloqueada durante la oración. Nunca lee tus mensajes, fotos ni datos personales.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Acceso de accesibilidad concedido';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Acceso de accesibilidad no concedido';

  @override
  String get appBlockingOpenSettings => 'Abrir ajustes de accesibilidad';

  @override
  String get appBlockingSetupNotNow => 'Ahora no';

  @override
  String get appBlockingEnableToggle => 'Activar bloqueo de apps';

  @override
  String get appBlockingModeLabel => 'Modo de bloqueo';

  @override
  String get appBlockingModeSoft => 'Suave';

  @override
  String get appBlockingModeSoftDesc =>
      'Solo un recordatorio amable — las apps siguen abiertas';

  @override
  String get appBlockingModeFirm => 'Firme';

  @override
  String get appBlockingModeFirmDesc => 'Bloquea la app, con una salida rápida';

  @override
  String get appBlockingModeHard => 'Estricto';

  @override
  String get appBlockingModeHardDesc =>
      'Bloqueo total — solo \"Ya oré\" lo desbloquea';

  @override
  String get appBlockingSelectPrayersLabel =>
      'Bloquear durante estas oraciones';

  @override
  String get appBlockingBufferBeforeLabel => 'Empezar antes de la oración';

  @override
  String get appBlockingBufferAfterLabel => 'Levantar después de la oración';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'Apps bloqueadas';

  @override
  String get appBlockingSelectAppsButton => 'Elegir apps para bloquear';

  @override
  String get appBlockingSearchHint => 'Buscar apps instaladas';

  @override
  String get appBlockingNoAppsSelected => 'Aún no se ha elegido ninguna app';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloqueadas',
      one: '1 app bloqueada',
      zero: 'Ninguna app bloqueada',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Prueba';

  @override
  String get appBlockingTestDescription =>
      'Activa el bloqueo de apps durante 2 minutos para confirmar que funciona en este dispositivo.';

  @override
  String get appBlockingTestButton => 'Probar bloqueo de apps (2 minutos)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Bloqueo de apps activo durante 2 minutos: intenta abrir una app bloqueada';

  @override
  String get appBlockingPermissionNeeded =>
      'Activa el acceso de accesibilidad para empezar a bloquear';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Acceso a Tiempo de Uso — próximamente';

  @override
  String get appBlockingIosComingSoonBody =>
      'El bloqueo de apps en iOS necesita el permiso de Tiempo de Uso de Apple, que aún estamos configurando. Te avisaremos en cuanto esté listo.';

  @override
  String get appBlockingHeadline1 => 'Hora de orar';

  @override
  String get appBlockingHeadline2 => 'Guarda tu tiempo';

  @override
  String get appBlockingDefaultTitle => 'Hora de oración';

  @override
  String get appBlockingIPrayedButton => 'Ya oré';

  @override
  String get appBlockingReadAyahsButton => 'Leer 3 versículos';

  @override
  String get appBlockingEmergencyBypass => 'Salida de emergencia';

  @override
  String get appBlockingSkipForNow => 'Omitir por ahora';

  @override
  String get appBlockingBypassConfirmTitle => '¿Terminar tu racha?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Salir ahora reiniciará tu racha de oración. Si es una emergencia real, puedes continuar.';

  @override
  String get appBlockingBypassConfirmContinue => 'Salir de todos modos';

  @override
  String get appBlockingBypassConfirmCancel => 'Volver';

  @override
  String get appBlockingSoftReminderTitle => 'Un recordatorio amable';

  @override
  String get appBlockingSoftReminderBody =>
      'Es hora de orar — considera apartarte un momento.';

  @override
  String get quranChallengeBannerTitle => 'Lee 3 versículos para desbloquear';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count de $total versículos leídos';
  }

  @override
  String get quranChallengeComplete => 'Bien hecho — apps desbloqueadas';

  @override
  String get focusBlockHeadline1 => 'Mantente enfocado';

  @override
  String get focusBlockHeadline2 => 'Sigue así';

  @override
  String get endFocusSessionButton => 'Terminar sesión de enfoque';

  @override
  String get focusPaused => 'En pausa por la oración';

  @override
  String get selectLocationTitle => 'Seleccionar ubicación';

  @override
  String get useCurrentLocation => 'Usar ubicación actual';

  @override
  String get savedLocationsHeader => 'Ubicaciones guardadas';

  @override
  String get noSavedLocationsYet =>
      'Aún no hay ubicaciones guardadas. Busca abajo para añadir una.';

  @override
  String get searchCityHint => 'Buscar nombre de ciudad…';

  @override
  String get addLocationTooltip => 'Añadir ubicación';

  @override
  String get deleteLocationTooltip => 'Eliminar ubicación';

  @override
  String get locationNotFound =>
      'Ubicación no encontrada. Intenta otra búsqueda.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Puedes guardar hasta $max ubicaciones';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'No se pudo confirmar el cambio — inténtalo de nuevo';

  @override
  String get tasbihCounter => 'Contador de Tasbih';

  @override
  String get tasbihCounterSubtitle => 'Cuenta tu dhikr';

  @override
  String get tasbihResetButton => 'Reiniciar';

  @override
  String get tasbihTotalLabel => 'Total';

  @override
  String get tasbihCelebrationTitle => '¡Tasbih completado!';

  @override
  String get tasbihCelebrationBody =>
      'Completaste los 99 dhikr. Que Allah acepte tu recuerdo.';

  @override
  String get tasbihStartNewSession => 'Iniciar nueva sesión';

  @override
  String get tasbihUndoButton => 'Deshacer';

  @override
  String get tasbihTapAnywhereHint =>
      'Toca cualquier parte de la pantalla para contar';

  @override
  String get tasbihSoundToggleTooltip => 'Sonido al tocar';

  @override
  String get tasbihManageDhikrTooltip => 'Gestionar dhikr';

  @override
  String get tasbihStatsTooltip => 'Ver estadísticas';

  @override
  String get tasbihDailyTotalLabel => 'Total de Hoy';

  @override
  String get tasbihRoundsTodayLabel => 'Rondas de Hoy';

  @override
  String get tasbihManageDhikrTitle => 'Gestionar Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Añadir Dhikr Personalizado';

  @override
  String get tasbihDeleteDhikrTooltip => 'Eliminar';

  @override
  String get tasbihBuiltInDhikrBadge => 'Predeterminado';

  @override
  String get tasbihCannotDeleteLastDhikr => 'Necesitas al menos un dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Nombre';

  @override
  String get tasbihDhikrNameHint => 'ej. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Árabe (opcional)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Por favor ingresa un nombre';

  @override
  String get tasbihSaveDhikrButton => 'Guardar';

  @override
  String get tasbihStatsTitle => 'Estadísticas del Tasbih';

  @override
  String get tasbihAllTimeTotalLabel => 'Total General';

  @override
  String get tasbihNoActivityYetMessage =>
      'Empieza a contar para ver tus estadísticas aquí.';

  @override
  String get tasbihSoundPickerTitle => 'Sonido al Tocar';

  @override
  String get tasbihSoundClassicClick => 'Clic Clásico';

  @override
  String get tasbihSoundSoftChime => 'Campanilla Suave';

  @override
  String get tasbihSoundStoneTap => 'Toque de Piedra';

  @override
  String get tasbihCurrentlyReciting => 'Recitando Ahora';

  @override
  String tasbihOfTarget(int target) {
    return 'de $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Gota de Lluvia';

  @override
  String get tasbihSoundSoftFeather => 'Pluma Suave';

  @override
  String noAyahsFound(String query) {
    return 'No se encontraron ayahs para \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Busca en español, inglés o árabe, o usa un término islámico:';

  @override
  String get loadingQuranIndex => 'Cargando índice del Corán…';

  @override
  String get quranSearchSuggestions =>
      'paciencia, sabr, misericordia, oración, salah, perdón, tawbah, paraíso, jannah, conocimiento';

  @override
  String get heroVerse1 =>
      'Guardad escrupulosamente las oraciones, especialmente la oración del medio.';

  @override
  String get heroVerse2 =>
      'Ciertamente, la oración ha sido prescrita a los creyentes en horas determinadas.';

  @override
  String get heroVerse3 => 'Buscad la ayuda en la paciencia y en la oración.';

  @override
  String get heroVerse4 =>
      'Remembradme, pues, y Yo os recordaré. Sed agradecidos conmigo y no seáis ingratos.';

  @override
  String get heroVerse5 => 'Y quien confíe en Alá, Él le bastará.';

  @override
  String get heroVerse6 =>
      'Ciertamente, la primera Casa establecida para los hombres fue la de Makkah, bendita y guía para los mundos.';

  @override
  String get heroVerse7 =>
      'En verdad, la oración prohíbe la obscenidad y el mal obrar, y el recuerdo de Alá es mayor.';

  @override
  String get heroVerse8 =>
      'Verdaderamente, en el recuerdo de Alá encuentran reposo los corazones.';

  @override
  String get heroVerse9 => 'Invocadme y os responderé.';

  @override
  String get heroVerse10 => 'Si sois agradecidos, seguramente os daré más.';

  @override
  String get heroVerse11 =>
      'Alá no carga a ningún alma más allá de su capacidad.';

  @override
  String get heroVerse12 => 'Ciertamente, Alá está con los pacientes.';

  @override
  String get heroVerse13 => 'Mi misericordia lo abarca todo.';

  @override
  String get heroVerse14 =>
      'Haced el bien; ciertamente Alá ama a quienes hacen el bien.';

  @override
  String get heroVerse15 =>
      'Este es el Libro en el que no hay duda, guía para los temerosos de Alá.';

  @override
  String get accuracyHigh => 'Alta precisión';

  @override
  String get accuracyMedium => 'Precisión media';

  @override
  String get accuracyLow => 'Baja precisión';

  @override
  String get accuracyCalibrating => 'Calibrando…';

  @override
  String get compassNeedsCalibration => 'La brújula necesita calibración';

  @override
  String get compassCalibrationHint =>
      'Mueve tu teléfono lentamente en forma de 8 para mejorar la precisión.';

  @override
  String get spiritLevelLabel => 'Nivel de burbuja';

  @override
  String get spiritLevelLevelText => '✓  Nivelado';

  @override
  String get spiritLevelTiltText => 'Inclina para nivelar';

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
  String get splashTagline => 'Cuida tu tiempo. Honra tus oraciones.';

  @override
  String get stopAdhan => 'Detener Adhan';

  @override
  String get duasSearchEmpty =>
      'Prueba una categoría diferente o un término de búsqueda distinto.';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingWelcomeTo => 'Bienvenido a';

  @override
  String get onboardingSubtitle =>
      'Tu compañero en el hermoso camino del Islam.';

  @override
  String get onboardingLetsGetStarted => 'Empecemos';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step de $total';
  }

  @override
  String get onboardingWhatsYourName => '¿Cómo te llamas?';

  @override
  String get onboardingNameSubtitle =>
      'Nos encantaría saber cómo dirigirnos a ti.';

  @override
  String get onboardingNameHint => 'Ingresa tu nombre';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingAreYouNewToIslam => '¿Eres nuevo en el Islam?';

  @override
  String get onboardingModeSubtitle =>
      'Personalizaremos tu experiencia según tu camino.';

  @override
  String get onboardingNewToIslam => 'Soy nuevo en el Islam';

  @override
  String get onboardingNewToIslamDesc =>
      'Modo principiante con guía paso a paso';

  @override
  String get onboardingFamiliarWithIslam => 'Estoy familiarizado con el Islam';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Modo regular con todas las funciones';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Día $days como musulmán';
  }

  @override
  String get beginnerEssential1 => 'Guía para nuevos musulmanes';

  @override
  String get beginnerEssential2 => 'Aprender Wudu (Purificación ritual)';

  @override
  String get beginnerEssential3 => 'Cómo orar (Paso a paso)';

  @override
  String get beginnerEssential4 => 'Surah Al-Fatiha (La Apertura)';

  @override
  String get beginnerEssential5 => 'Duas diarios (Súplicas)';

  @override
  String get beginnerEssential6 => 'Entendiendo la Shahada';

  @override
  String get beginnerEssential7 => 'Términos islámicos y glosario';

  @override
  String get beginnerExploreAll => 'Explorar todas las funciones';

  @override
  String get beginnerExploreSubtitle =>
      'Cambia a la experiencia completa de Noor Guard';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Todo lo que Noor Guard tiene para ofrecer';

  @override
  String get beginnerLearnSalah => 'Aprender Salah';

  @override
  String get beginnerMayAllahGuide =>
      'Que Allah guíe tus pasos y bendiga tu camino.';

  @override
  String get beginnerMuslimEssentials => 'ESENCIALES DEL MUSULMÁN';

  @override
  String get beginnerQuote1 =>
      'Ciertamente, con la dificultad viene la facilidad. — Corán 94:6';

  @override
  String get beginnerQuote2 => 'Cuida los mandatos de Allah y Él te cuidará.';

  @override
  String get beginnerQuote3 =>
      'Allah mira tu corazón y tus obras, no tu apariencia.';

  @override
  String get beginnerQuote4 =>
      'Cada paso hacia la oración es un paso hacia la paz.';

  @override
  String get beginnerQuote5 =>
      'El mejor de vosotros es quien aprende el Corán y lo enseña.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Toca para establecer tu fecha de Shahada';

  @override
  String get beginnerToolboxSection =>
      'CAJA DE HERRAMIENTAS PARA PRINCIPIANTES';

  @override
  String get beginnerYourJourney => 'TU CAMINO';

  @override
  String get journeyMonth1Name => 'Mes 1: Los Fundamentos';

  @override
  String get journeyMonth2Name => 'Mes 2: Construyendo Hábitos';

  @override
  String get journeyMonth3Name => 'Mes 3: Profundizando la Fe';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total completado';
  }

  @override
  String get journeyViewFull => 'Ver viaje completo →';

  @override
  String get journeyTask2_1 => 'Rezar las 5 oraciones durante 7 días';

  @override
  String get journeyTask2_2 => 'Aprender 10 Duas más';

  @override
  String get journeyTask2_3 => 'Leer el primer Yuz del Corán';

  @override
  String get journeyTask2_4 => 'Aprender los 99 Nombres de Alá';

  @override
  String get journeyTask2_5 => 'Usar el contador de Tasbih diariamente 7 días';

  @override
  String get journeyTask2_6 => 'Aprender las oraciones Sunnah';

  @override
  String get journeyTask2_7 => 'Encontrar tu Masjid local';

  @override
  String get journeyTask3_1 => 'Leer la Surah Al-Baqarah';

  @override
  String get journeyTask3_2 => 'Aprender sobre el Zakat';

  @override
  String get journeyTask3_3 => 'Aprender sobre el Ayuno (Sawm)';

  @override
  String get journeyTask3_4 => 'Memorizar 3 nuevas Surahs';

  @override
  String get journeyTask3_5 => 'Aprender sobre el Hajj';

  @override
  String get journeyTask3_6 => 'Compartir el Islam con alguien';

  @override
  String get journeyTask3_7 => 'Completar el Glosario Islámico';

  @override
  String get journeyTimelineTitle => 'Mi Viaje';

  @override
  String get journeyCompleted => 'Completado';

  @override
  String get journeyInProgress => 'En Progreso';

  @override
  String get journeyLocked => 'Bloqueado';

  @override
  String get wuduThreeTimes => '3 veces';

  @override
  String get wuduDuaBefore => 'Du\'a antes del Wudu';

  @override
  String get wuduDuaAfter => 'Du\'a después del Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'En el nombre de Allah';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Atestiguo que no hay deidad digna de adoración excepto Allah, Único, sin asociados, y atestiguo que Muhammad es Su siervo y mensajero. Oh Allah, hazme de quienes se arrepienten y de quienes se purifican.';

  @override
  String get wuduCompleteButton => 'Completé el Wudu';

  @override
  String get howToPrayStepOpeningDua => 'Du\'a de apertura';

  @override
  String get howToPrayStepAlFatiha => 'Sura Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Sura corta';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (sentada intermedia)';

  @override
  String get howToPrayStepSalawat => 'Salawat al Profeta ﷺ';

  @override
  String get howToPrayTransTakbir => 'Allah es el Más Grande';

  @override
  String get howToPrayTransOpeningDua =>
      'Gloria a Ti, oh Allah, y con Tu alabanza; bendito es Tu nombre, exaltada es Tu majestad, no hay dios sino Tú.';

  @override
  String get howToPrayTransFatiha =>
      'En el nombre de Allah, el Compasivo, el Misericordioso. Toda la alabanza pertenece a Allah, Señor de los mundos. El Compasivo, el Misericordioso. Dueño del Día del Juicio. Solo a Ti adoramos y solo a Ti pedimos ayuda. Guíanos por el camino recto — el camino de aquellos a quienes has favorecido, no de los que han incurrido en la ira, ni de los que se han extraviado.';

  @override
  String get howToPrayTransRuku => 'Gloria a mi Señor, el Más Grande';

  @override
  String get howToPrayTransItidal =>
      'Allah escucha a quien Le alaba. Señor nuestro, y a Ti toda alabanza.';

  @override
  String get howToPrayTransSujood => 'Gloria a mi Señor, el Más Alto';

  @override
  String get howToPrayTransJalsa => 'Señor mío, perdóname';

  @override
  String get howToPrayTransTashahhud =>
      'Todos los saludos, oraciones y buenas palabras pertenecen a Allah. Paz sea contigo, oh Profeta, y la misericordia de Allah y Sus bendiciones. Paz sea con nosotros y con los siervos justos de Allah. Atestiguo que no hay dios sino Allah, y atestiguo que Muhammad es Su siervo y mensajero.';

  @override
  String get howToPrayTransSalawat =>
      'Oh Allah, envía Tu gracia sobre Muhammad y la familia de Muhammad, como enviaste Tu gracia sobre Ibrahim y la familia de Ibrahim — Tú eres el Más Digno de alabanza, el Más Glorioso. Oh Allah, bendice a Muhammad y a la familia de Muhammad, como bendijiste a Ibrahim y a la familia de Ibrahim — Tú eres el Más Digno de alabanza, el Más Glorioso.';

  @override
  String get howToPrayTransTasleem =>
      'La paz y la misericordia de Allah sean con vosotros';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Recita esto en voz baja justo después del Takbir inicial. Solo se dice una vez, al comienzo de la oración.';

  @override
  String get howToPraySurahInstruction =>
      'Después de Al-Fatiha, recita cualquier sura que hayas memorizado. Sura Al-Ikhlas (arriba) es perfecta para principiantes — se recita solo en las primeras dos rak\'ahs.';

  @override
  String get howToPrayItidalInstruction =>
      'Di \'Sami\' Allahu liman hamidah\' al incorporarte, luego ponte derecho antes de decir \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Siéntate después de la 2.ª rak\'ah. Levanta el índice derecho al pronunciar la Shahada. En las oraciones de 3 y 4 rak\'ahs, te levantarás de nuevo.';

  @override
  String get howToPraySalawatInstruction =>
      'Recita el Salawat justo después del Tashahhud final, solo en la última sentada, antes del Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Gira la cabeza a la derecha y di el Tasleem, luego a la izquierda y repítelo. Tu oración ha concluido.';

  @override
  String get howToPrayOnceOpens => 'Una vez — abre la oración';

  @override
  String get howToPrayFirstRakahOnly => 'Solo 1.ª rak\'ah';

  @override
  String get howToPrayFirst2RakahsOnly => 'Solo las primeras 2 rak\'ahs';

  @override
  String get howToPrayEveryRakah => 'Cada rak\'ah';

  @override
  String get howToPrayAfter2ndRakah => 'Después de la 2.ª rak\'ah';

  @override
  String get howToPrayFinalSittingOnly => 'Solo sentada final';

  @override
  String get howToPrayClosesThePrayer => 'Cierra la oración';

  @override
  String get howToPraySectionBefore => 'Antes de orar';

  @override
  String get howToPraySectionRakah => 'Rak\'ah';

  @override
  String get howToPraySectionMiddleSitting => 'Sentada intermedia';

  @override
  String get howToPraySectionFinalSitting => 'Sentada final';

  @override
  String get howToPrayRakahLabel => 'Rak\'ahs';

  @override
  String get howToPrayCompleteButton => 'He completado mi oración';

  @override
  String get howToPrayMashaallah => '¡Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Que Allah acepte tu oración.';

  @override
  String get fatihaIntroTitle => 'La Madre del Corán';

  @override
  String get fatihaIntroBody =>
      'La Surah Al-Fatiha es la surah más grande del Corán. Se recita en cada unidad de oración — al menos 17 veces al día. Es una conversación completa entre el siervo y Allah, y una puerta de entrada a cada oración.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir escribe: \'Al-Fatiha contiene la esencia de todo el Corán — es una oración, una declaración de servidumbre y una solicitud de guía hacia el Camino Recto.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'La Shahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Doy testimonio de que no hay más deidad que Allah, y doy testimonio de que Muhammad es el mensajero de Allah';

  @override
  String get shahadaWordBreakdownTitle => 'Palabra por Palabra';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'No hay';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'deidad / dios';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'excepto';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (Dios solo)';

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
  String get shahadaWord6Meaning => 'Mensajero / Profeta';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'de Allah';

  @override
  String get shahadaMeaningTitle => 'Significado e Importancia';

  @override
  String get shahadaMeaningBody =>
      'La Shahada es la declaración de fe que forma la base del Islam. Es el primero de los Cinco Pilares. Al pronunciar estas palabras con sincera convicción, una persona entra en el Islam. Ibn Kathir explica que la primera parte niega todas las falsas deidades y afirma la unicidad absoluta de Allah.';

  @override
  String get shahadaMomentTitle => 'El Momento de la Shahada';

  @override
  String get shahadaMomentBody =>
      'Cuando una persona pronuncia la Shahada por primera vez con verdadera fe en su corazón, algo profundo sucede — comienza una nueva vida. El Profeta ﷺ dijo: \'Quien diga que no hay dios sino Allah y no crea en nada que se adore además de Él, su riqueza y sangre están protegidas.\' (Sahih Muslim). Todos los pecados pasados son perdonados. Bienvenido al Islam.';

  @override
  String get shahadaPronunciationTitle => 'Guía de Pronunciación';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Guía paso a paso';

  @override
  String get toolboxWuduSubtitle => 'Purificación antes de la oración';

  @override
  String get toolboxGlossarySubtitle => '114 términos islámicos explicados';

  @override
  String get shareSheetTitle => 'Compartir';

  @override
  String get shareAnAyah => 'Compartir un Ayah';

  @override
  String get shareADua => 'Compartir un Dua';

  @override
  String get shareANameOfAllah => 'Compartir un Nombre de Allah';

  @override
  String get shareAHadith => 'Compartir un Hadith';

  @override
  String get shareViaLabel => 'Compartido vía Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Ayah del Día';

  @override
  String get shareCardDuaLabel => '✦ Dua';

  @override
  String get shareCardNameLabel => '✦ Nombre de Allah';

  @override
  String get shareCardHadithLabel => '✦ Hadith';

  @override
  String get sharePickDuaTitle => 'Elige un Dua para Compartir';

  @override
  String get shareError => 'No se pudo crear la imagen';

  @override
  String get shareCardVerseLabel => '✦ Verso Coránico';

  @override
  String get shareCardAsmaLabel => '✦ Asma ul-Husna';

  @override
  String get shareAyahSubtitle => 'Elige entre 30 versículos coránicos';

  @override
  String get shareDuaSubtitle => 'Elige de la biblioteca';

  @override
  String get shareNameSubtitle => 'Elige entre los 99 Hermosos Nombres';

  @override
  String get shareHadithSubtitle => 'Elige entre 20 hadiths auténticos';

  @override
  String get shareThisDua => 'Compartir Esta Dua';

  @override
  String get sharePickAyahTitle => 'Elige un Ayah para Compartir';

  @override
  String get searchAyahs => 'Buscar ayahs…';

  @override
  String get noAyahsFoundShort => 'No se encontraron ayahs';

  @override
  String get shareThisAyah => 'Compartir Este Ayah';

  @override
  String get sharePickNameTitle => 'Elige un Nombre para Compartir';

  @override
  String get shareThisName => 'Compartir Este Nombre';

  @override
  String get sharePickHadithTitle => 'Elige un Hadith para Compartir';

  @override
  String get searchHadiths => 'Buscar hadiths…';

  @override
  String get noHadithsFound => 'No se encontraron hadiths';

  @override
  String get shareThisHadith => 'Compartir Este Hadith';

  @override
  String get backToBasics => 'Volver a lo Básico';

  @override
  String get backToBasicsSubtitle => 'Tu guía a los fundamentos del Islam';

  @override
  String get fivePillarsOfIslam => 'Los 5 Pilares del Islam';

  @override
  String get fivePillarsSubtitle => 'Los fundamentos de la fe islámica';

  @override
  String get pillarLearnMore => 'Saber más';

  @override
  String get pillarShowLess => 'Ver menos';

  @override
  String get pillarsShowDetails => 'Mostrar detalles';

  @override
  String get pillarsHideDetails => 'Ocultar detalles';

  @override
  String get pillar1Name => 'Shahada';

  @override
  String get pillar1Desc => 'Declaración de Fe';

  @override
  String get pillar1Detail =>
      'La declaracion de fe es el fundamento del Islam. Al decir sinceramente \'No hay mas dios que Allah y Muhammad es Su mensajero\', una persona entra en el Islam.';

  @override
  String get pillar2Name => 'Salah';

  @override
  String get pillar2Desc => 'Las Cinco Oraciones Diarias';

  @override
  String get pillar2Detail =>
      'Las cinco oraciones diarias son la conexion directa entre un musulman y Allah. Realizadas al amanecer, al mediodia, por la tarde, al atardecer y de noche, estructuran todo el dia del musulman en torno al recuerdo de Allah.';

  @override
  String get pillar3Name => 'Zakat';

  @override
  String get pillar3Desc => 'Caridad Obligatoria';

  @override
  String get pillar3Detail =>
      'El Zakat es la caridad anual obligatoria del 2,5% de los ahorros entregada a los necesitados. Purifica la riqueza y fortalece los lazos de la comunidad musulmana.';

  @override
  String get pillar4Name => 'Sawm';

  @override
  String get pillar4Desc => 'Ayuno en Ramadán';

  @override
  String get pillar4Detail =>
      'El ayuno durante el bendito mes de Ramadan desde el amanecer hasta el atardecer. Los musulmanes se abstienen de comida, bebida y pecado para alcanzar el taqwa (conciencia de Dios) y la gratitud.';

  @override
  String get pillar5Name => 'Hajj';

  @override
  String get pillar5Desc => 'Peregrinación a La Meca';

  @override
  String get pillar5Detail =>
      'La peregrinacion a La Meca es obligatoria una vez en la vida para todo musulman fisica y economicamente capaz. Es la mayor reunion anual de personas en la tierra.';

  @override
  String get switchedToNewMuslimMode => 'Cambiado al modo Nuevo Musulmán';

  @override
  String get switchedToRegularMode => 'Cambiado al modo Regular';

  @override
  String get liveNotifChannelName => 'Noor Guard Live';

  @override
  String get liveNotifChannelDescription =>
      'Cuenta regresiva de la oración y contenido islámico diario en tu pantalla de bloqueo';

  @override
  String get liveNotifHeaderAyah => 'AYA DEL DÍA';

  @override
  String get liveNotifHeaderDua => 'DUA DEL DÍA';

  @override
  String get liveNotifHeaderWord => 'PALABRA DEL DÍA';

  @override
  String get liveNotifHeaderName => 'NOMBRE DE ALLAH';

  @override
  String get liveNotifHeaderHadith => 'HADIZ DEL DÍA';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'en ${hours}h ${minutes}min';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'en ${minutes}min';
  }

  @override
  String get liveNotifCountdownNow => 'Es hora de rezar';

  @override
  String get savedDuas => 'Duas guardadas';

  @override
  String get savedVerses => 'Versos guardados';

  @override
  String get savedNames => 'Nombres guardados';

  @override
  String get noSavedDuas => 'Aún no hay duas guardadas';

  @override
  String get noSavedVerses => 'Aún no hay versos guardados';

  @override
  String get noSavedNames => 'Aún no hay nombres guardados';

  @override
  String get heroVerse16 =>
      'Señor nuestro, no nos reproches si olvidamos o erramos.';

  @override
  String get heroVerse17 => 'Allah nos basta, y Él es el mejor Guardián.';

  @override
  String get heroVerse18 => 'Oh creyentes, creed en Allah y en Su Mensajero.';

  @override
  String get heroVerse19 =>
      'Oh creyentes, temed a Allah y buscad el medio de acercaros a Él.';

  @override
  String get heroVerse20 =>
      'Ciertamente, mi oración, mi sacrificio, mi vida y mi muerte pertenecen a Allah, Señor de los mundos.';

  @override
  String get heroVerse21 =>
      'Decreta para nosotros el bien en esta vida y en la otra; a Ti hemos vuelto.';

  @override
  String get heroVerse22 => 'Recordad mucho a Allah para que podáis triunfar.';

  @override
  String get heroVerse23 =>
      'Solo nos ocurrirá lo que Allah ha decretado para nosotros; Él es nuestro Protector.';

  @override
  String get heroVerse24 =>
      'Ciertamente, los amigos de Allah no tendrán temor ni se entristecerán.';

  @override
  String get heroVerse25 =>
      'Mi éxito solo proviene de Allah; en Él confío y a Él me vuelvo.';

  @override
  String get heroVerse26 => 'No desesperéis de la misericordia de Allah.';

  @override
  String get heroVerse27 =>
      'Aquellos que creen y cuyos corazones se sosiegan con el recuerdo de Allah.';

  @override
  String get heroVerse28 =>
      'Y cuando vuestro Señor anunció: Si sois agradecidos, os daré aún más.';

  @override
  String get heroVerse29 =>
      'Y adora a tu Señor hasta que te llegue la certeza.';

  @override
  String get heroVerse30 =>
      'Ciertamente, Allah está con los que Le temen y con los que hacen el bien.';

  @override
  String get focusButtonSubtitle => 'Protege tu tiempo para lo que importa';

  @override
  String get ourStories => 'Nuestras historias';

  @override
  String get storiesSeeAll => 'Ver todas';

  @override
  String get storiesReadMore => 'Leer más';

  @override
  String get storiesFeaturedLabel => 'Historia destacada';

  @override
  String get storiesFilterReverts => 'Conversos';

  @override
  String get storyCategoryRevert => 'Converso';

  @override
  String get storyCategoryBornMuslim => 'Musulmán de nacimiento';

  @override
  String get storyCategoryReturning => 'Retornado';

  @override
  String get storiesShareYours => 'Comparte la tuya';

  @override
  String get storiesEmptyTitle => 'Aún no hay historias';

  @override
  String get storiesEmptySubtitle => 'Sé el primero en compartir tu camino';

  @override
  String storyShahadaDate(Object date) {
    return 'Shahada: $date';
  }

  @override
  String get storiesComments => 'Comentarios';

  @override
  String get storiesAddComment => 'Añade un comentario…';

  @override
  String get storiesAnonymous => 'Anónimo';

  @override
  String get storiesNameLabel => 'Tu nombre';

  @override
  String get storiesPostAnonymously => 'Publicar anónimamente';

  @override
  String get storiesCountryLabel => 'País';

  @override
  String get storiesCategoryLabel => 'Categoría';

  @override
  String get storiesShahadaDateLabel => 'Fecha de la Shahada (opcional)';

  @override
  String get storiesYourStoryLabel => 'Tu historia';

  @override
  String get storiesStoryHint => 'Cuéntanos sobre tu camino…';

  @override
  String get storiesChooseBackground => 'Elige un fondo';

  @override
  String get storiesBackgroundNone => 'Ninguno';

  @override
  String get storiesEditTitle => 'Edita tu historia';

  @override
  String get storiesSaveChanges => 'Guardar cambios';

  @override
  String get storiesUpdated => 'Tu historia ha sido actualizada';

  @override
  String get storiesUploadPhoto => 'Subir foto (opcional)';

  @override
  String get storiesChangePhoto => 'Cambiar foto';

  @override
  String get storiesSubmitButton => 'Enviar';

  @override
  String get storiesSubmitted =>
      '¡JazakAllah khair! Tu historia ha sido enviada para revisión.';

  @override
  String get storiesSubmitError => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get storiesFillRequired => 'Por favor, añade tu historia y tu país.';

  @override
  String get storiesShareCardLabel => 'Historia de la comunidad';

  @override
  String get storiesPreviewLabel => 'Vista previa';

  @override
  String get storiesPendingReview => 'En revisión';

  @override
  String get storiesFilterSaved => 'Guardadas';

  @override
  String get storiesSavedEmpty => 'Aún no hay historias guardadas';

  @override
  String get storiesSearchCountryHint => 'Busca tu país…';

  @override
  String get storiesChooseAvatar => 'Elige un avatar';

  @override
  String get storiesAvatarInitials => 'Iniciales';

  @override
  String get storiesAvatarIcon => 'Ícono';

  @override
  String get storiesAvatarPattern => 'Patrón';

  @override
  String get storiesLoadError =>
      'No se pudieron cargar las historias. Revisa tu conexión.';

  @override
  String get storiesDiscardTitle => '¿Descartar tu historia?';

  @override
  String get storiesDiscard => 'Descartar';

  @override
  String get storiesKeepWriting => 'Seguir escribiendo';

  @override
  String get storiesSaveDraft => 'Guardar borrador';

  @override
  String get storiesDraftSaved => 'Borrador guardado';

  @override
  String get storiesDeleteDraft => 'Eliminar borrador';

  @override
  String get storiesContinueDraft => 'Continúa tu borrador';

  @override
  String get storiesStartFresh => 'Empezar de nuevo';

  @override
  String get shareCardGlossaryLabel => '✦ Glosario Islámico';

  @override
  String get shareCardTafsirLabel => '✦ Tafsir';

  @override
  String shareCardAyahRef(String number) {
    return 'Aleya $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 Hora de Fajr';

  @override
  String get prayerReminderTitleDhuhr => '☀️ Hora de Dhuhr';

  @override
  String get prayerReminderTitleAsr => '🌤️ Hora de Asr';

  @override
  String get prayerReminderTitleMaghrib => '🌅 Hora de Maghrib';

  @override
  String get prayerReminderTitleIsha => '🌙 Hora de Isha';

  @override
  String get prayerReminderBodyFajr =>
      'Levántate y reza. Allah recompensa a quienes despiertan por Él.';

  @override
  String get prayerReminderBodyDhuhr =>
      'Toma un momento para Allah. Tu oración de Dhuhr te espera.';

  @override
  String get prayerReminderBodyAsr =>
      'La oración intermedia. Cuídala de cerca. — Al-Báqarah 2:238';

  @override
  String get prayerReminderBodyMaghrib =>
      'El sol se ha puesto. Responde al llamado de Allah.';

  @override
  String get prayerReminderBodyIsha =>
      'Termina tu día con Allah. Tu oración de la noche te espera.';

  @override
  String get prayerAlarmMessageFajr =>
      'Levántate y reza. Allah recompensa a quienes despiertan por Él.';

  @override
  String get prayerAlarmMessageDhuhr =>
      'Toma un momento para Allah. Tu oración de Dhuhr te espera.';

  @override
  String get prayerAlarmMessageAsr =>
      'Cuida de cerca la oración intermedia. — Al-Báqarah 2:238';

  @override
  String get prayerAlarmMessageMaghrib =>
      'El sol se ha puesto. Responde al llamado de Allah.';

  @override
  String get prayerAlarmMessageIsha =>
      'Termina tu día con Allah. Tu oración de la noche te espera.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer en 15 minutos';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'Es hora de prepararte para la oración de $prayer';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'Es hora de la oración de $prayer';
  }

  @override
  String get testNotificationTitle => '🔔 Notificación de prueba';

  @override
  String get testNotificationBody =>
      '¡Las notificaciones funcionan correctamente!';
}
