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
  String get islamicMonthRabiAlAwwal => 'Rabī\' Al-Awwal';

  @override
  String get islamicMonthRamadan => 'Ramadán';

  @override
  String get islamicMonthShawwal => 'Shawwāl';

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
}
