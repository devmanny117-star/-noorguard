// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Noor Guard';

  @override
  String get assalamualaikum => 'As-Salāmu \'Alaikum';

  @override
  String get mayAllahBlessYourDay => 'Que Allah abençoe o seu dia';

  @override
  String get nextPrayer => 'Próxima Oração';

  @override
  String get iPrayedButton => 'Já orei';

  @override
  String get todaysPrayers => 'Orações de Hoje';

  @override
  String get qibla => 'Qibla';

  @override
  String get focusMode => 'Modo Foco';

  @override
  String get appBlocking => 'Bloqueio de Apps';

  @override
  String get islamicCalendar => 'Calendário Islâmico';

  @override
  String get islamicCalendarSubtitle => 'Datas hijri e eventos';

  @override
  String get duas => 'Duas';

  @override
  String get quran => 'Alcorão';

  @override
  String get settings => 'Configurações';

  @override
  String get complete => 'Concluir';

  @override
  String get streak => 'Sequência';

  @override
  String get dayStreak => 'dias seguidos';

  @override
  String get compassRequiresDevice => 'A bússola requer um dispositivo real';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '$count dia',
    );
    return '$_temp0';
  }

  @override
  String get allPrayersCompleted => 'Todas as orações concluídas! 🎉';

  @override
  String prayersCompleted(int completed) {
    return '$completed/5 orações concluídas';
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
    return '$count rakats obrigatórios';
  }

  @override
  String sunnahBefore(int count) {
    return '$count sunnah antes';
  }

  @override
  String sunnahAfter(int count) {
    return '$count sunnah depois';
  }

  @override
  String prayedAt(String time) {
    return 'Realizada às $time';
  }

  @override
  String get timePeriodDawnBeforeSunrise =>
      'ao amanhecer, antes do nascer do sol';

  @override
  String get timePeriodAfterSunPassesHighestPoint =>
      'depois que o sol passa do seu ponto mais alto';

  @override
  String get timePeriodLateAfternoon => 'no final da tarde';

  @override
  String get timePeriodJustAfterSunset => 'logo após o pôr do sol';

  @override
  String get timePeriodNightBeforeMidnight => 'à noite, antes da meia-noite';

  @override
  String get fajrHadith =>
      'As duas rakats de Fajr são melhores do que o mundo e tudo o que ele contém. — Profeta Muhammad ﷺ';

  @override
  String get fajrTip =>
      'Fajr é a primeira oração do dia. Ela nos lembra de começar o dia recordando a Allah.';

  @override
  String get dhuhrHadith =>
      'Quem rezar as doze rakats de sunnah, Allah construirá para ele uma casa no Paraíso.';

  @override
  String get dhuhrTip =>
      'Dhuhr é a oração do meio-dia. Um momento perfeito para pausar o seu dia e se reconectar.';

  @override
  String get asrHadith =>
      'Quem perder a oração de Asr é como se tivesse perdido sua família e seus bens. — Profeta Muhammad ﷺ';

  @override
  String get asrTip =>
      'Asr costuma ser chamada de oração do meio. Allah a menciona especificamente no Alcorão (2:238).';

  @override
  String get maghribHadith => 'A oração de Maghrib é o Witr do dia.';

  @override
  String get maghribTip =>
      'Maghrib marca o fim do dia de jejum no Ramadã. É realizada exatamente quando o sol se põe.';

  @override
  String get ishaHadith =>
      'Quem rezar Isha em congregação, é como se tivesse rezado metade da noite.';

  @override
  String get ishaTip =>
      'Isha é a última oração do dia. Encerrar o dia com a oração traz paz e encerramento.';

  @override
  String get newMuslimTip => 'Dica para Novos Muçulmanos';

  @override
  String get notificationsOn => 'Notificações ativadas';

  @override
  String get notificationsOff => 'Notificações desativadas';

  @override
  String get preview => 'Pré-visualização';

  @override
  String get lockPreviewCountdown => 'Em 1h 23min  ·  16:47';

  @override
  String get swipeUpToUnlock => 'Deslize para cima para desbloquear';

  @override
  String get searchSurahs => 'Buscar suras…';

  @override
  String get noSurahsFound => 'Nenhuma sura encontrada';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String ayahs(int count) {
    return '$count versículos';
  }

  @override
  String get searchDuas => 'Buscar duas…';

  @override
  String supplications(int count) {
    return '$count súplicas';
  }

  @override
  String get prayerSettings => 'Configurações de Oração';

  @override
  String get calculationMethod => 'Método de Cálculo';

  @override
  String get adhanSound => 'Som do Adhan';

  @override
  String get prayerNotifications => 'Notificações de Oração';

  @override
  String get statusOn => 'Ativado';

  @override
  String get statusOff => 'Desativado';

  @override
  String get enableAllNotifications => 'Ativar todas as notificações';

  @override
  String get individualPrayers => 'Orações Individuais';

  @override
  String get appearance => 'Aparência';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get language => 'Idioma';

  @override
  String get aboutNoorGuard => 'Sobre';

  @override
  String get version => 'Versão do App';

  @override
  String get rateApp => 'Avalie o Noor Guard';

  @override
  String get shareApp => 'Compartilhar Noor Guard';

  @override
  String get contactSupport => 'Falar com o Suporte';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get helpUsImprove => 'Ajude-nos a Melhorar';

  @override
  String get translationDisclaimer =>
      'Nossas traduções são feitas com auxílio de IA. Se você notar algum erro no seu idioma, adoraríamos receber seu feedback!';

  @override
  String get privacyPromiseTitle => 'A Promessa de Privacidade do Noor Guard';

  @override
  String get privacyPromiseBody =>
      'Sua fé é pessoal. Seus dados também são. Nunca vendemos, compartilhamos ou monetizamos seus dados. Nem sua localização. Nem seus hábitos de oração. Nem o seu nome.';

  @override
  String get directionToSacredHouse => 'Direção para a Casa Sagrada';

  @override
  String towardMecca(String degrees) {
    return '$degrees° em direção a Meca';
  }

  @override
  String get defaultLocation => 'Sacramento, CA (padrão)';

  @override
  String get prayerHistory => 'Histórico de Orações';

  @override
  String get currentStreak => 'Sequência Atual';

  @override
  String get longestStreak => 'Maior Sequência';

  @override
  String get legend => 'Legenda';

  @override
  String get allFivePrayers => 'As 5 orações';

  @override
  String get partialPrayers => 'Parcial (1–4)';

  @override
  String get none => 'Nenhuma';

  @override
  String get sun => 'Dom';

  @override
  String get mon => 'Seg';

  @override
  String get tue => 'Ter';

  @override
  String get wed => 'Qua';

  @override
  String get thu => 'Qui';

  @override
  String get fri => 'Sex';

  @override
  String get sat => 'Sáb';

  @override
  String headingDegrees(String degrees) {
    return 'Direção $degrees°';
  }

  @override
  String get couldNotLoadSurahs => 'Não foi possível carregar as suras';

  @override
  String get connectionError =>
      'Verifique sua conexão com a internet e tente novamente';

  @override
  String get alQuran => 'O Alcorão';

  @override
  String get dailySupplications => 'Súplicas Diárias';

  @override
  String get all => 'Todas';

  @override
  String get noDuasFound => 'Nenhuma dua encontrada';

  @override
  String get january => 'janeiro';

  @override
  String get february => 'fevereiro';

  @override
  String get march => 'março';

  @override
  String get april => 'abril';

  @override
  String get may => 'maio';

  @override
  String get june => 'junho';

  @override
  String get july => 'julho';

  @override
  String get august => 'agosto';

  @override
  String get september => 'setembro';

  @override
  String get october => 'outubro';

  @override
  String get november => 'novembro';

  @override
  String get december => 'dezembro';

  @override
  String get home => 'Início';

  @override
  String get prayers => 'Orações';

  @override
  String get more => 'Mais';

  @override
  String get tafsir => 'Tafsir';

  @override
  String get lockScreen => 'Tela de Bloqueio';

  @override
  String get readAndListen => 'Ler e ouvir';

  @override
  String get commentary => 'Comentário';

  @override
  String get findDirection => 'Encontrar direção';

  @override
  String get reminders => 'Lembretes';

  @override
  String get blockDistractions => 'Bloquear distrações';

  @override
  String get prayerGuard => 'Guardião da oração';

  @override
  String get importantDates => 'Datas importantes';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get morningAndEvening => 'Manhã e Noite';

  @override
  String get prayer => 'Oração';

  @override
  String get foodAndDrink => 'Comida e Bebida';

  @override
  String get verityWithHardship =>
      'Em verdade, com a dificuldade vem a facilidade.';

  @override
  String get ashSharh946 => 'Ash-Sharh 94:6';

  @override
  String get guardStrictlyYourPrayers =>
      'Guardai com zelo as vossas orações, especialmente a oração do meio.';

  @override
  String get alBaqarah2238 => 'Al-Baqarah 2:238';

  @override
  String get pastEvents => 'Eventos Passados';

  @override
  String get upcomingEvents => 'Próximos Eventos';

  @override
  String get today => 'Hoje';

  @override
  String get next => 'Próximo';

  @override
  String hijriYearLabel(int year) {
    return '$year AH';
  }

  @override
  String get islamicMonthMuharram => 'Muharram';

  @override
  String get islamicMonthSafar => 'Safar';

  @override
  String get islamicMonthRabiAlAwwal => 'Rabi al-Awwal';

  @override
  String get islamicMonthRabiAlThani => 'Rabi al-Thani';

  @override
  String get islamicMonthJumadaAlAwwal => 'Jumada al-Awwal';

  @override
  String get islamicMonthJumadaAlThani => 'Jumada al-Thani';

  @override
  String get islamicMonthRajab => 'Rajab';

  @override
  String get islamicMonthShaban => 'Shaaban';

  @override
  String get islamicMonthRamadan => 'Ramadã';

  @override
  String get islamicMonthShawwal => 'Shawwal';

  @override
  String get islamicMonthDhulQadah => 'Dhul Qadah';

  @override
  String get islamicMonthDhulHijjah => 'Dhul Hijjah';

  @override
  String get islamicNewYear => 'Ano Novo Islâmico';

  @override
  String get ashura => 'Ashura';

  @override
  String get mawlidAlNabi => 'Mawlid Al-Nabi';

  @override
  String get ramadanBegins => 'Início do Ramadã';

  @override
  String get laylatAlQadr => 'Laylat Al-Qadr';

  @override
  String get eidAlFitr => 'Eid Al-Fitr';

  @override
  String get dayOfArafah => 'Dia de Arafah';

  @override
  String get eidAlAdha => 'Eid Al-Adha';

  @override
  String get active => 'Ativo';

  @override
  String get focusModeSubtitle =>
      'Proteja seu foco. Seus apps ficam bloqueados até você encerrar a sessão.';

  @override
  String get remaining => 'restante';

  @override
  String get ready => 'pronto';

  @override
  String get duration => 'Duração';

  @override
  String get minutesAbbreviation => 'min';

  @override
  String get blockedDuringFocus => 'Bloqueados Durante o Foco';

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
  String get startFocus => 'Iniciar Foco';

  @override
  String get stopFocus => 'Encerrar Foco';

  @override
  String get alhamdulillah => 'Alhamdulillah!';

  @override
  String get sessionComplete => 'Sessão Concluída';

  @override
  String stayedFocusedFor(String duration) {
    return 'Você ficou focado por $duration.';
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
      '\"E busquem ajuda através da paciência e da oração.\"\n— Al-Baqarah 2:45';

  @override
  String get done => 'Concluído';

  @override
  String get socialMedia => 'Redes Sociais';

  @override
  String get entertainment => 'Entretenimento';

  @override
  String get games => 'Jogos';

  @override
  String get messaging => 'Mensagens';

  @override
  String get blockDuringPrayerTimes => 'Bloquear nos horários de oração';

  @override
  String get blockDuringPrayerTimesSubtitle =>
      'Os apps selecionados serão bloqueados automaticamente\ndurante as 5 orações diárias.';

  @override
  String get blockedLabel => 'bloqueados';

  @override
  String get blockAllApps => 'Bloquear todos os apps';

  @override
  String get blockingTimingInfo =>
      'O bloqueio é ativado 5 minutos antes de cada oração e é desativado 15 minutos depois.';

  @override
  String get blockedDuringPrayers => 'Bloqueado durante as orações';

  @override
  String get notBlocked => 'Não bloqueado';

  @override
  String get wuduStep1 => 'Intenção';

  @override
  String get wuduStep2 => 'Bismillah';

  @override
  String get wuduStep3 => 'Lavar as Mãos';

  @override
  String get wuduStep4 => 'Enxaguar a Boca';

  @override
  String get wuduStep5 => 'Limpar o Nariz';

  @override
  String get wuduStep6 => 'Lavar o Rosto';

  @override
  String get wuduStep7 => 'Lavar os Braços';

  @override
  String get wuduStep8 => 'Passar a Mão na Cabeça';

  @override
  String get wuduStep9 => 'Lavar os Pés';

  @override
  String get revertCorner => 'Cantinho do Revertido';

  @override
  String get revertCornerSubtitle => 'Guias e apoio para novos muçulmanos';

  @override
  String get wuduGuide => 'Guia do Wudu';

  @override
  String get howToPray => 'Como Orar';

  @override
  String get newMuslimChecklist => 'Checklist do Novo Muçulmano';

  @override
  String get islamicGlossary => 'Glossário Islâmico';

  @override
  String get whyDoWe => 'Por Que Fazemos...';

  @override
  String get communityStories => 'Histórias da Comunidade';

  @override
  String get wuduGuideSubtitle => 'Purificação antes da oração';

  @override
  String get howToPraySubtitle => 'Guia passo a passo da salah';

  @override
  String get newMuslimChecklistSubtitle => 'Sua jornada de 30 dias';

  @override
  String get howToPrayStep1Name => 'Primeiro o Wudu';

  @override
  String get howToPrayStep1Instruction =>
      'Faça o wudu (ablução) para estar em estado de pureza antes de começar a orar.';

  @override
  String get howToPrayStep1Tip =>
      'Se você não souber como fazer, abra primeiro o Guia do Wudu no Cantinho do Novo Muçulmano.';

  @override
  String get howToPrayStep2Name => 'Fique de Pé Voltado para a Qibla';

  @override
  String get howToPrayStep2Instruction =>
      'Fique em pé sobre o seu tapete de oração voltado para a Qibla — a direção da Kaaba em Meca. Use a bússola Qibla do app para encontrar a direção exata.';

  @override
  String get howToPrayStep2Tip =>
      'Não tem problema se estiver um pouco desalinhado — Allah conhece sua intenção. Faça o seu melhor.';

  @override
  String get howToPrayStep3Name => 'Niyyah (Intenção)';

  @override
  String get howToPrayStep3Instruction =>
      'Faça a intenção em seu coração para a oração que está prestes a realizar. Não é necessário dizê-la em voz alta.';

  @override
  String get howToPrayStep3Tip =>
      'Sua intenção é entre você e Allah. Um pensamento simples como \'Estou rezando o Fajr por Allah\' já é suficiente.';

  @override
  String get howToPrayStep4Name => 'Takbir (Abertura)';

  @override
  String get howToPrayStep4Instruction =>
      'Levante as duas mãos até a altura das orelhas e diga \'Allahu Akbar\' (Allah é o Maior). Isso inicia oficialmente a sua oração.';

  @override
  String get howToPrayStep4Tip =>
      'Mantenha o olhar voltado para baixo, em direção ao local de prostração, durante toda a oração.';

  @override
  String get howToPrayStep5Name => 'Qiyam (Em Pé)';

  @override
  String get howToPrayStep5Instruction =>
      'Coloque a mão direita sobre a mão esquerda no peito. Recite a Surata Al-Faatiha seguida de qualquer outra surata curta ou versículos que você conheça.';

  @override
  String get howToPrayStep5Tip =>
      'Se ainda não souber outra surata, recitar apenas Al-Faatiha já é aceitável enquanto você está aprendendo.';

  @override
  String get howToPrayStep6Name => 'Ruku (Inclinação)';

  @override
  String get howToPrayStep6Instruction =>
      'Incline-se dobrando a cintura, mantendo as costas paralelas ao chão. Coloque as mãos sobre os joelhos e diga \'Subhana Rabbiyal Adheem\' três vezes.';

  @override
  String get howToPrayStep6Tip =>
      'Mantenha as costas retas e na horizontal — sem arquear ou curvar.';

  @override
  String get howToPrayStep7Name => 'Itidal (Levantando-se da Inclinação)';

  @override
  String get howToPrayStep7Instruction =>
      'Levante-se da inclinação e fique completamente em pé. Diga \'Sami Allahu liman hamidah\' (Allah ouve quem O louva) ao se levantar, depois diga \'Rabbana lakal hamd\'.';

  @override
  String get howToPrayStep7Tip =>
      'Fique totalmente ereto e parado por um instante antes de passar para a próxima posição.';

  @override
  String get howToPrayStep8Name => 'Sujood (Prostração)';

  @override
  String get howToPrayStep8Instruction =>
      'Vá até o chão, colocando a testa, o nariz, as duas palmas das mãos, os joelhos e os dedos dos pés no chão. Diga \'Subhana Rabbiyal A\'la\' três vezes.';

  @override
  String get howToPrayStep8Tip =>
      'Sete partes do corpo devem tocar o chão: testa (com o nariz), as duas mãos, os dois joelhos e os dois pés.';

  @override
  String get howToPrayStep9Name => 'Jalsa (Sentar Entre as Prostrações)';

  @override
  String get howToPrayStep9Instruction =>
      'Sente-se a partir da prostração com o pé esquerdo deitado e o pé direito ereto. Diga \'Allahu Akbar\' ao sentar-se. Pause brevemente, depois volte para a segunda prostração.';

  @override
  String get howToPrayStep9Tip =>
      'Esse breve momento sentado entre as duas prostrações é chamado de Jalsa. É uma parte obrigatória da oração.';

  @override
  String get howToPrayStep10Name => 'Complete as Rakats';

  @override
  String get howToPrayStep10Instruction =>
      'Depois de completar a primeira rakat, levante-se e repita os mesmos passos para a segunda rakat. O número de rakats depende de qual oração você está realizando.';

  @override
  String get howToPrayStep10Tip =>
      'Fajr tem 2 rakats, Dhuhr 4, Asr 4, Maghrib 3 e Isha 4. Vá uma rakat de cada vez.';

  @override
  String get howToPrayStep11Name => 'Tashahhud (Última Sentada)';

  @override
  String get howToPrayStep11Instruction =>
      'Na posição final sentada, recite o Tashahhud. É uma declaração de fé recitada enquanto você está sentado, após a sua última rakat.';

  @override
  String get howToPrayStep11Tip =>
      'Durante o Tashahhud, levante o dedo indicador direito ao dizer \'Ash-hadu alla ilaha illallah\' como sinal da unicidade de Allah.';

  @override
  String get howToPrayStep12Name => 'Tasleem (Encerramento)';

  @override
  String get howToPrayStep12Instruction =>
      'Vire a cabeça para a direita e diga \'Assalamu Alaikum wa Rahmatullah\', depois vire para a esquerda e repita. Isso encerra a sua oração.';

  @override
  String get howToPrayStep12Tip =>
      'Depois da oração, reserve um momento para fazer dua (súplica) e pedir a Allah o que você precisa. É um momento lindo para se conectar com Allah.';

  @override
  String get checklistWeek1Title => 'Semana 1';

  @override
  String get checklistWeek2Title => 'Semana 2';

  @override
  String get checklistWeek3Title => 'Semana 3';

  @override
  String get checklistWeek4Title => 'Semana 4';

  @override
  String get checklistWeek1Item1 => 'Fazer a Shahada';

  @override
  String get checklistWeek1Item2 => 'Aprender o Wudu';

  @override
  String get checklistWeek1Item3 => 'Aprender a Al-Fatiha';

  @override
  String get checklistWeek1Item4 => 'Rezar o primeiro Fajr';

  @override
  String get checklistWeek1Item5 => 'Conseguir um tapete de oração';

  @override
  String get checklistWeek1Item6 => 'Encontrar uma mesquita local';

  @override
  String get checklistWeek2Item1 => 'Aprender os 5 horários de oração';

  @override
  String get checklistWeek2Item2 => 'Aprender duas básicas';

  @override
  String get checklistWeek2Item3 => 'Ler sobre o Profeta Muhammad';

  @override
  String get checklistWeek2Item4 => 'Conectar-se com a comunidade muçulmana';

  @override
  String get checklistWeek3Item1 => 'Aprender sobre comida halal';

  @override
  String get checklistWeek3Item2 => 'Ler a Surata Al-Ikhlas';

  @override
  String get checklistWeek3Item3 => 'Aprender sobre o Ramadã';

  @override
  String get checklistWeek3Item4 => 'Começar o dhikr diário';

  @override
  String get checklistWeek4Item1 => 'Aprender sobre o Zakat';

  @override
  String get checklistWeek4Item2 => 'Ler sobre os 5 pilares';

  @override
  String get checklistWeek4Item3 => 'Configurar notificações de oração';

  @override
  String get checklistWeek4Item4 => 'Refletir sobre a sua jornada';

  @override
  String get wuduStep1Instruction =>
      'Faça a intenção em seu coração de realizar o wudu por amor a Allah.';

  @override
  String get wuduStep1Tip =>
      'Não é preciso dizer em voz alta — uma intenção sincera no coração já é suficiente.';

  @override
  String get wuduStep2Instruction =>
      'Diga Bismillah (Em nome de Allah) antes de começar.';

  @override
  String get wuduStep2Tip =>
      'Dizer Bismillah é sunnah e começa o seu wudu com a lembrança de Allah.';

  @override
  String get wuduStep3Instruction =>
      'Lave as duas mãos até os pulsos três vezes, certificando-se de que a água alcance entre os dedos.';

  @override
  String get wuduStep3Tip =>
      'Comece pela mão direita, depois a esquerda. Essa ordem é recomendada no Islã.';

  @override
  String get wuduStep4Instruction =>
      'Coloque água na boca, faça bochecho e cuspa. Repita três vezes.';

  @override
  String get wuduStep4Tip =>
      'Isso limpa a boca e faz parte do processo de purificação.';

  @override
  String get wuduStep5Instruction =>
      'Aspire água pelas narinas e expire suavemente. Repita três vezes.';

  @override
  String get wuduStep5Tip =>
      'Use a mão direita para aspirar a água e a mão esquerda para soltá-la.';

  @override
  String get wuduStep6Instruction =>
      'Lave todo o rosto três vezes, da linha do cabelo até o queixo e de orelha a orelha.';

  @override
  String get wuduStep6Tip =>
      'Certifique-se de que nenhuma parte do rosto fique seca.';

  @override
  String get wuduStep7Instruction =>
      'Lave o braço direito da ponta dos dedos até o cotovelo três vezes, depois faça o mesmo com o braço esquerdo.';

  @override
  String get wuduStep7Tip =>
      'No wudu, sempre comece pelo lado direito antes do esquerdo.';

  @override
  String get wuduStep8Instruction =>
      'Molhe as mãos e passe sobre toda a cabeça uma vez, da frente para trás e de trás para frente.';

  @override
  String get wuduStep8Tip =>
      'Diferente da lavagem, passar a mão na cabeça é feito apenas uma vez.';

  @override
  String get wuduStep9Instruction =>
      'Lave o pé direito até o tornozelo, incluindo-o, três vezes, depois faça o mesmo com o pé esquerdo.';

  @override
  String get wuduStep9Tip =>
      'Certifique-se de que a água alcance entre os dedos dos pés. Use o dedo para limpar entre eles.';

  @override
  String get islamicGlossaryTitle => 'Glossário Islâmico';

  @override
  String get islamicGlossarySubtitle =>
      '51 termos do Alcorão, da Sunnah e da erudição clássica';

  @override
  String get searchTermsHint => 'Buscar termos, árabe, definições...';

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryPillar => 'Pilar';

  @override
  String get categoryAqeedah => 'Aqeedah';

  @override
  String get categoryPractice => 'Prática';

  @override
  String get categoryDhikr => 'Dhikr';

  @override
  String get categoryQuran => 'Alcorão';

  @override
  String get categoryHadith => 'Hadith';

  @override
  String get categoryFiqh => 'Fiqh';

  @override
  String get categoryHistory => 'História';

  @override
  String get noTermsFound => 'Nenhum termo encontrado';

  @override
  String get sourceLabel => 'Fonte';

  @override
  String get revertCornerHubSubtitle =>
      'Um espaço acolhedor para guiar seus primeiros passos como novo muçulmano';

  @override
  String get islamicGlossaryHubSubtitle =>
      'Termos comuns explicados de forma simples';

  @override
  String get whyDoWeHubSubtitle =>
      'A sabedoria por trás das práticas do dia a dia';

  @override
  String get communityStoriesHubSubtitle =>
      'Revertidos compartilham suas jornadas até o Islã';

  @override
  String get whyDoWeScreenSubtitle =>
      'A sabedoria por trás de 12 práticas islâmicas do dia a dia';

  @override
  String get whyDoWeSourceBadge => 'Fonte Sunita';

  @override
  String get whyDoWeQ1 => 'Por que rezamos 5 vezes ao dia?';

  @override
  String get whyDoWeA1 =>
      'Allah ordenou as cinco orações diárias no Alcorão (2:238) e elas foram instituídas durante a Viagem Noturna (Isra wal Miraj). O Profeta ﷺ disse: \"A primeira coisa sobre a qual o servo será questionado no Dia do Juízo é a oração.\" (Ibn Majah). A oração nos mantém conectados a Allah ao longo do dia.';

  @override
  String get whyDoWeQ2 => 'Por que nos voltamos para Meca quando rezamos?';

  @override
  String get whyDoWeA2 =>
      'Allah ordenou no Alcorão (2:144): \"Volta o teu rosto em direção à Mesquita Sagrada.\" A Kaaba, em Meca, foi a primeira casa erguida para a adoração de Allah (3:96). Voltar-se para a mesma direção une todos os muçulmanos na oração ao redor do mundo.';

  @override
  String get whyDoWeQ3 => 'Por que jejuamos no Ramadã?';

  @override
  String get whyDoWeA3 =>
      'Allah ordenou o jejum no Alcorão (2:183): \"Ó vós que credes! Foi-vos prescrito o jejum, como foi prescrito àqueles que vos antecederam, para que tenhais piedade (taqwa).\" O Ramadã é o mês em que o Alcorão foi revelado (2:185).';

  @override
  String get whyDoWeQ4 => 'Por que dizemos Bismillah antes de comer?';

  @override
  String get whyDoWeA4 =>
      'O Profeta ﷺ disse: \"Quando algum de vós for comer, que mencione o nome de Allah. Se esquecer no início, que diga: Bismillah no começo e no fim.\" (Abu Dawud). Isso nos lembra que todas as bênçãos vêm de Allah.';

  @override
  String get whyDoWeQ5 =>
      'Por que tiramos os sapatos antes de entrar em uma mesquita?';

  @override
  String get whyDoWeA5 =>
      'Quando Allah ordenou a Moisés: \"Tira as tuas sandálias, pois estás no vale sagrado de Tuwa.\" (Alcorão 20:12). Tirar os sapatos demonstra respeito pela casa de Allah e mantém o local de oração limpo.';

  @override
  String get whyDoWeQ6 => 'Por que dizemos Assalamu Alaikum como saudação?';

  @override
  String get whyDoWeA6 =>
      'O Profeta ﷺ disse: \"Vocês não entrarão no Paraíso até que tenham fé, e não terão fé completa até que se amem uns aos outros. Devo dizer-lhes algo que, se fizerem, fará com que se amem? Espalhem a paz (salam) entre vocês.\" (Muslim). É também uma dua — você está pedindo paz para essa pessoa.';

  @override
  String get whyDoWeQ7 => 'Por que realizamos o Hajj?';

  @override
  String get whyDoWeA7 =>
      'O Hajj foi ordenado por Allah (3:97): \"A peregrinação a esta Casa é uma obrigação para com Allah, para todo aquele que tiver condições.\" Ele relembra as provações do Profeta Ibrahim ﷺ e de sua família, e une muçulmanos de todas as nações em adoração.';

  @override
  String get whyDoWeQ8 => 'Por que pagamos o Zakat?';

  @override
  String get whyDoWeA8 =>
      'O Zakat é o terceiro pilar do Islã, ordenado no Alcorão mais de 30 vezes ao lado da oração. O Profeta ﷺ disse que ele purifica a riqueza. O Zakat reduz a desigualdade e lembra aos crentes que toda riqueza pertence a Allah.';

  @override
  String get whyDoWeQ9 => 'Por que dizemos Alhamdulillah depois de espirrar?';

  @override
  String get whyDoWeA9 =>
      'O Profeta ﷺ disse: \"Quando algum de vós espirrar, que diga Alhamdulillah, e que seu irmão ou companheiro diga Yarhamukallah.\" (Bukhari). É um momento de gratidão a Allah pela bênção da saúde.';

  @override
  String get whyDoWeQ10 => 'Por que as mulheres muçulmanas usam hijab?';

  @override
  String get whyDoWeA10 =>
      'Allah ordenou no Alcorão (24:31) que as mulheres crentes preservem o seu pudor. O hijab é um ato de adoração e obediência a Allah. Muitas muçulmanas o usam como fonte de identidade, dignidade e conexão espiritual.';

  @override
  String get whyDoWeQ11 => 'Por que evitamos carne de porco e álcool?';

  @override
  String get whyDoWeA11 =>
      'Allah proibiu a carne de porco no Alcorão (2:173) e o álcool em (5:90), chamando-o de \"uma abominação, obra de Satanás.\" Essas proibições protegem a saúde, a mente e a família. As diretrizes halal ajudam os crentes a manter a pureza física e espiritual.';

  @override
  String get whyDoWeQ12 => 'Por que dizemos Inshallah?';

  @override
  String get whyDoWeA12 =>
      'Allah ordena no Alcorão (18:23-24): \"E nunca digas, sobre algo: \'Farei isso amanhã\', sem acrescentar: \'Se Allah quiser\'.\" Dizer Inshallah reconhece que apenas Allah controla o futuro e nos mantém humildes.';

  @override
  String get communityStoriesScreenSubtitle =>
      'Jornadas reais até o Islã, vindas de todo o mundo';

  @override
  String get communityStoriesTimeLabel => 'Tempo como muçulmano';

  @override
  String get communityStoriesShareBtn => 'Compartilhe Sua História';

  @override
  String get communityStoriesShareSoon =>
      'Em breve — esse recurso está a caminho!';

  @override
  String get communityStory1Name => 'Aisha (antes Sarah)';

  @override
  String get communityStory1Location => 'Texas, EUA';

  @override
  String get communityStory1Time => '2 anos';

  @override
  String get communityStory1Text =>
      'Conheci o Islã enquanto fazia uma pesquisa para um trabalho da faculdade. Eu esperava encontrar o que a mídia me dizia. Em vez disso, encontrei paz, lógica e um Deus que realmente fazia sentido. Fiz minha shahada 6 meses depois. A parte mais difícil não foi aprender a rezar — foi contar para minha família. Mas Alhamdulillah, dois anos depois, minha mãe mesma me faz perguntas sobre o Islã.';

  @override
  String get communityStory2Name => 'Yusuf (antes James)';

  @override
  String get communityStory2Location => 'Londres, Reino Unido';

  @override
  String get communityStory2Time => '4 anos';

  @override
  String get communityStory2Text =>
      'Eu me reverti depois de anos de busca. Cristianismo, budismo, ateísmo — nada preenchia o vazio. Um colega de trabalho muçulmano me convidou para a oração de sexta-feira. Sentei lá no fundo e chorei o tempo todo. Nem sabia explicar o porquê. Fiz minha shahada na semana seguinte. A comunidade me acolheu como uma família que eu nem sabia que precisava.';

  @override
  String get communityStory3Name => 'Maryam (antes Maria)';

  @override
  String get communityStory3Location => 'Cidade do México, México';

  @override
  String get communityStory3Time => '1 ano';

  @override
  String get communityStory3Text =>
      'Ser latina e muçulmana parece um superpoder. Encontrei o Islã através de um vídeo no YouTube às 2h da manhã. Fiquei assistindo por horas. O conceito de tawhid — que Deus é Único, sem parceiros, sem imagens — fez tanto sentido para mim. Minhas irmãs de língua espanhola na mesquita me fizeram sentir em casa imediatamente.';

  @override
  String get communityStory4Name => 'Ibrahim (antes David)';

  @override
  String get communityStory4Location => 'Toronto, Canadá';

  @override
  String get communityStory4Time => '6 anos';

  @override
  String get communityStory4Text =>
      'Eu era filho de pastor. Tinha perguntas sobre a Trindade que ninguém conseguia responder. Quando li o Alcorão pela primeira vez, senti que estava lendo algo em que eu já acreditava. Fiz minha shahada em silêncio, sozinho, e depois novamente na mesquita. A melhor decisão da minha vida.';

  @override
  String get communityStory5Name => 'Fatima (antes Jennifer)';

  @override
  String get communityStory5Location => 'Sydney, Austrália';

  @override
  String get communityStory5Time => '3 anos';

  @override
  String get communityStory5Text =>
      'Minha jornada começou com um hijab. Coloquei um por desafio e senti... proteção. Comecei a ler sobre o Islã e não conseguia parar. Em três meses já tinha feito minha shahada. As pessoas me perguntam o que eu abri mão. Eu digo que abri mão do vazio.';

  @override
  String get communityStory6Name => 'Omar (antes Kevin)';

  @override
  String get communityStory6Location => 'Joanesburgo, África do Sul';

  @override
  String get communityStory6Time => '5 anos';

  @override
  String get communityStory6Text =>
      'Cresci em um bairro difícil. O Islã me deu disciplina, propósito e irmandade. Na primeira vez que fiz sujood, algo dentro de mim se abriu — da melhor forma possível. Chorei e não conseguia explicar o porquê. Hoje oriento outros jovens que estão encontrando o caminho para o din.';

  @override
  String get inspiredByRealStories =>
      'Inspirado em histórias reais de revertidos';

  @override
  String get storyFormTitle => 'Compartilhe Sua História';

  @override
  String get storyFormNameLabel => 'Seu Nome';

  @override
  String get storyFormNameHint => 'Nome, ou escreva \'Anônimo\'';

  @override
  String get storyFormCountryLabel => 'País';

  @override
  String get storyFormCountryHint => 'De onde você é?';

  @override
  String get storyFormTimeLabel => 'Tempo como muçulmano';

  @override
  String get storyFormTimeHint => 'ex.: 2 anos, 6 meses';

  @override
  String get storyFormStoryLabel => 'Sua História';

  @override
  String get storyFormStoryHint => 'Compartilhe sua jornada até o Islã...';

  @override
  String get storyFormSubmitBtn => 'Enviar História';

  @override
  String get storyFormThankYouTitle => 'JazakAllah Khair!';

  @override
  String get storyFormThankYouBody =>
      'Sua história foi recebida. Revisamos todas as histórias antes de publicá-las.';

  @override
  String get storyFormRequiredError => 'Por favor, preencha todos os campos';

  @override
  String get subtitleYourGuideToIslam => 'Seu guia para o Islã';

  @override
  String get beginnerMode => 'Modo Iniciante';

  @override
  String get beginnerModeSubtitle =>
      'Dicas e orientações extras para novos muçulmanos';

  @override
  String get beginnerModeOn =>
      'O Modo Iniciante está ativado — dicas extras serão exibidas em todo o app';

  @override
  String get beginnerModePrayersTip =>
      'Dica: toque em cada oração para saber mais sobre ela e ver as orações sunnah';

  @override
  String get tafsirSubtitle => 'Comentário Alcorânico';

  @override
  String get tafsirComingSoon =>
      'O tafsir desta surata estará disponível em breve';

  @override
  String get tafsirNotAvailable => 'Tafsir não disponível';

  @override
  String get scholarSource => 'Fonte';

  @override
  String get asbabAlNuzul => 'Motivo da Revelação';

  @override
  String get transliteration => 'Transliteração';

  @override
  String get selectReciter => 'Selecionar Recitador';

  @override
  String get playVerse => 'Reproduzir versículo';

  @override
  String get asmaUlHusna => 'Asma ul Husna';

  @override
  String get asmaUlHusnaSubtitle => 'Os 99 Belos Nomes de Allah';

  @override
  String get asmaHadith =>
      'Allah tem 99 nomes. Quem os memorizar entrará no Paraíso.';

  @override
  String get asmaHadithSource => 'Sahih al-Bukhari, 2736';

  @override
  String get asmaSearchHint => 'Buscar nomes...';

  @override
  String get asmaNoResults => 'Nenhum nome encontrado';

  @override
  String get asmaSignificance => 'Significado';

  @override
  String get asmaUlHusnaTile => '99 Nomes';

  @override
  String get asmaUlHusnaTileSubtitle => 'Nomes de Allah';

  @override
  String get onboardingTagline => 'Guarde o seu tempo. Honre as suas orações.';

  @override
  String get onboardingChooseLanguage => 'Escolha o seu idioma';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboardingLocationTitle => 'Horários de Oração Precisos';

  @override
  String get onboardingLocationDesc =>
      'O Noor Guard precisa da sua localização para calcular os horários de oração corretos para a sua cidade. Sua localização nunca é armazenada ou compartilhada.';

  @override
  String get onboardingPrivacyBanner =>
      'Sua fé é pessoal. Seus dados também são.';

  @override
  String get onboardingAllowLocation => 'Permitir Localização';

  @override
  String get onboardingSkipForNow => 'Pular por enquanto';

  @override
  String get onboardingNotificationTitle => 'Nunca Perca uma Oração';

  @override
  String get onboardingNotificationDesc =>
      'Receba notificações em cada horário de oração com um belo adhan. Personalize sons e horários nas configurações.';

  @override
  String get onboardingAdhanAlerts => 'Alertas de adhan';

  @override
  String get onboardingCustomTiming => 'Horários personalizados';

  @override
  String get onboardingAdjustable => 'Ajustável';

  @override
  String get onboardingEnableNotifications => 'Ativar Notificações';

  @override
  String get onboardingMaybeLater => 'Talvez mais tarde';

  @override
  String get onboardingAllSetTitle => 'Tudo Pronto!';

  @override
  String get onboardingAllSetDesc =>
      'O Noor Guard está pronto para proteger o seu tempo\ne guiar o seu dia com intenção.';

  @override
  String get onboardingPrayerTimesLabel => 'Horários de Oração';

  @override
  String get onboardingPrayerTimesDesc => 'Horários precisos para a sua cidade';

  @override
  String get onboardingLockScreenLabel => 'Tela de Bloqueio Islâmica';

  @override
  String get onboardingLockScreenDesc => 'Alcorão e duas a cada desbloqueio';

  @override
  String get onboardingPrayerGuardLabel => 'Guardião da Oração';

  @override
  String get onboardingPrayerGuardDesc =>
      'Apps bloqueados automaticamente durante a salah';

  @override
  String get onboardingEnterApp => 'Entrar no Noor Guard';

  @override
  String get adhan => 'Adhan';

  @override
  String get adhanSubtitle => 'O Chamado à Oração';

  @override
  String get adhanDescription =>
      'O Adhan é o chamado islâmico à oração, anunciado cinco vezes ao dia para convidar os fiéis à adoração.';

  @override
  String get makkahStyle => 'Meca';

  @override
  String get madinahStyle => 'Medina';

  @override
  String get egyptianStyle => 'Egípcio';

  @override
  String get adhanPlaying => 'Tocando Agora';

  @override
  String get makkahDescription =>
      'O chamado tradicional à oração da Grande Mesquita de Meca.';

  @override
  String get madinahDescription =>
      'Uma interpretação serena no estilo da Mesquita do Profeta em Medina.';

  @override
  String get egyptianDescription =>
      'Um adhan melódico de estilo egípcio, conhecido por sua recitação rica.';

  @override
  String get adhanCallToWorship => 'O Chamado à Oração';

  @override
  String get adhanDescriptionFull =>
      'O Adhan é o chamado islâmico à oração, anunciado cinco vezes ao dia para convidar os fiéis à adoração.';

  @override
  String get alafasyStyle => 'Mishary Alafasy';

  @override
  String get alaqsaStyle => 'Al-Aqsa';

  @override
  String get turkishStyle => 'Turco';

  @override
  String get pakistaniStyle => 'Paquistanês';

  @override
  String get indonesianStyle => 'Indonésio';

  @override
  String get alafasyDescription =>
      'Uma interpretação emocionante do renomado recitador Mishary Rashid Alafasy.';

  @override
  String get alaqsaDescription =>
      'O chamado à oração ecoando da Mesquita Al-Aqsa em Jerusalém, o terceiro lugar mais sagrado do Islã.';

  @override
  String get turkishDescription =>
      'Um ezan tradicional de estilo turco com seu maqam melódico característico.';

  @override
  String get pakistaniDescription =>
      'Um adhan emocionante na tradição do sul da Ásia, recitado em todo o Paquistão.';

  @override
  String get indonesianDescription =>
      'Um adhan melodioso de estilo indonésio, amado em todo o arquipélago.';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String weeklyProgress(int count) {
    return '$count de 35 orações esta semana';
  }

  @override
  String get bestDay => 'Melhor dia';

  @override
  String get prayerStats => 'Estatísticas de Oração';

  @override
  String get completionRate => 'Taxa de Conclusão';

  @override
  String get bestPrayer => 'Oração Mais Consistente';

  @override
  String get hardestPrayer => 'Oração Mais Perdida';

  @override
  String totalPrayersCompleted(int count) {
    return '$count orações concluídas';
  }

  @override
  String get last7Days => 'Últimos 7 Dias';

  @override
  String get thisMonth => 'Este Mês';

  @override
  String get fullDays => 'Dias completos';

  @override
  String get partialDays => 'Dias parciais';

  @override
  String get missedDays => 'Dias perdidos';

  @override
  String get missedPrayerBadge => 'Perdida';

  @override
  String get makeItUp => 'Recuperar';

  @override
  String get qadaExplanation =>
      'Se você perdeu uma oração, ainda pode rezá-la como uma oração Qada (de reposição).';

  @override
  String get noStatsYet =>
      'Continue marcando suas orações para ver suas estatísticas aqui.';

  @override
  String get notEnoughData => 'Ainda não há dados suficientes';

  @override
  String get continuousPlay => 'Contínuo';

  @override
  String get sleepTimer => 'Temporizador';

  @override
  String verseCount(Object total, Object verse) {
    return 'Vers. $verse de $total';
  }

  @override
  String get verseTafsir => 'Tafsir do versículo';

  @override
  String get tafsirOfTheDay => 'Tafsir do dia';

  @override
  String get dailyInsight => 'Reflexão diária';

  @override
  String get keyThemes => 'Temas e lições principais';

  @override
  String get readFullSurah => 'Ler sura completa';

  @override
  String get surahIntroduction => 'Introdução da sura';

  @override
  String get verses => 'versículos';

  @override
  String get loadingTafsir => 'Carregando tafsir...';

  @override
  String get keepAliveNotificationText => 'Notificações de oração ativas';

  @override
  String get keepAliveChannelName => 'Notificações de oração';

  @override
  String get keepAliveChannelDescription =>
      'Mantém o Noor Guard ativo em segundo plano para que os alarmes de oração nunca sejam perdidos.';

  @override
  String get notifSetupTitle => 'Ativar alertas na tela de bloqueio';

  @override
  String get notifSetupSubtitle =>
      'Para que você nunca perca o adhan — mesmo com o telefone bloqueado. Leva cerca de um minuto.';

  @override
  String get notifSetupSamsungBanner =>
      'Usa um Samsung Galaxy (incluindo Fold/Flip)? A Samsung adiciona interruptores extras além do Android padrão — os passos 4 e 6 abaixo mostram exatamente onde encontrá-los.';

  @override
  String get notifSetupStep1Title => 'Permitir notificações';

  @override
  String get notifSetupStep1Description =>
      'A permissão básica de que o Noor Guard precisa para te avisar de qualquer coisa.';

  @override
  String get notifSetupStep1Action => 'Permitir notificações';

  @override
  String get notifSetupStep2Title => 'Alarmes e lembretes';

  @override
  String get notifSetupStep2Description =>
      'Permite que os alarmes de oração disparem exatamente no horário da oração, mesmo com o telefone ocioso ou em economia de bateria.';

  @override
  String get notifSetupStep2Action => 'Abrir configurações de alarme';

  @override
  String get notifSetupStep3Title => 'Exibir sobre outros apps';

  @override
  String get notifSetupStep3Description =>
      'Permite que a tela completa de oração apareça sobre a tela de bloqueio e qualquer outra coisa aberta.';

  @override
  String get notifSetupStep3Action => 'Abrir configurações';

  @override
  String get notifSetupStep4Title =>
      'Exibir como pop-up / alerta em tela cheia';

  @override
  String get notifSetupStep4Description =>
      'Permite que a tela do adhan apareça sobre a tela de bloqueio em vez de permanecer como um banner silencioso.';

  @override
  String get notifSetupStep4SamsungNote =>
      'Em telefones Samsung Galaxy (incluindo Fold/Flip): abra Configurações → toque em \"Prayer Time Alarm\", depois ative \"Pop-up notification\" (chamada \"Cover screen pop-up\" no Fold/Flip). Esse é um interruptor exclusivo da Samsung — ativá-lo é o que realmente coloca a tela do adhan sobre sua tela de bloqueio.';

  @override
  String get notifSetupStep4Action => 'Abrir configurações de notificações';

  @override
  String get notifSetupStep5Title => 'Manter as notificações confiáveis';

  @override
  String get notifSetupStep5Description =>
      'Impede que o Android deixe o Noor Guard mais lento ou atrasado em segundo plano, para que os alarmes e lembretes de oração sempre cheguem no horário.';

  @override
  String get notifSetupStep5Action => 'Desativar otimização de bateria';

  @override
  String get notifSetupStep6Title => 'Apps que nunca dormem';

  @override
  String get notifSetupStep6Description =>
      'O gerenciador de bateria da Samsung pode colocar o Noor Guard para dormir e bloquear silenciosamente os alarmes de oração. Adicioná-lo aos \"Never sleeping apps\" evita isso.';

  @override
  String get notifSetupStep6SamsungNote =>
      'Configurações → Bateria e cuidados do dispositivo → Limites de uso em segundo plano → Never sleeping apps → toque em \"+\" → selecione Noor Guard.';

  @override
  String get notifSetupStep6Action => 'Abrir configurações de bateria';

  @override
  String get notifSetupStatusChecking => 'Verificando…';

  @override
  String get notifSetupStatusEnabled => 'Ativado';

  @override
  String get notifSetupStatusNeeded => 'Necessário';

  @override
  String get notifSetupStatusManual => 'Passo manual';

  @override
  String get notifSetupContinueButton => 'Continuar para o Noor Guard';

  @override
  String get notifSetupLaterButton => 'Vou terminar isso depois';

  @override
  String get notifSetupDoneButton => 'Concluído';

  @override
  String get testNotificationButton => 'Enviar notificação de teste (10 s)';

  @override
  String get testNotificationSnack =>
      'A notificação de teste chegará em 10 segundos';

  @override
  String get testLockAlarmButton => 'Testar alarme de tela cheia (10 s)';

  @override
  String get testLockAlarmSnack =>
      'O alarme de bloqueio dispara em 10 segundos — bloqueie seu telefone agora';

  @override
  String get testAdhanForegroundButton =>
      'Testar adhan no app (em primeiro plano)';

  @override
  String get testAdhanForegroundSnack =>
      'Reproduzindo o adhan completo com um banner silencioso';

  @override
  String get testRequiresNotificationsOn =>
      'Ative as Notificações de Oração primeiro para testar isso';

  @override
  String get lockScreenSetupGuideButton =>
      'Guia de configuração de alertas na tela de bloqueio';

  @override
  String get couldNotOpenPrivacyPolicy =>
      'Não foi possível abrir a Política de Privacidade';

  @override
  String get couldNotOpenTermsOfService =>
      'Não foi possível abrir os Termos de Serviço';

  @override
  String get couldNotOpenEmailApp => 'Não foi possível abrir o app de e-mail';

  @override
  String get blockDurationLabel => 'Duração do bloqueio';

  @override
  String get privacyAndTrust => 'Privacidade e Confiança';

  @override
  String get noorGuardMotto =>
      '\"Se não pertence a uma mesquita,\nnão pertence ao Noor Guard.\"';

  @override
  String get openingAppStore => 'Abrindo a App Store…';

  @override
  String get openingShareSheet => 'Abrindo o menu de compartilhamento…';

  @override
  String get openingSupportEmail => 'Abrindo o e-mail de suporte…';

  @override
  String get openingTermsOfService => 'Abrindo os Termos de Serviço…';

  @override
  String get duration30Min => '30 min';

  @override
  String get duration1Hour => '1 hora';

  @override
  String get durationPrayerWindowOnly => 'Apenas janela de oração';

  @override
  String get hoursAbbreviation => 'h';

  @override
  String get cancelTimerButton => 'Cancelar temporizador';

  @override
  String get custom => 'Personalizado';

  @override
  String get customTimerMinutesTitle => 'Temporizador personalizado (minutos)';

  @override
  String get customTimerHint => 'ex.: 20';

  @override
  String get cancel => 'Cancelar';

  @override
  String get start => 'Iniciar';

  @override
  String get travel => 'Viagem';

  @override
  String get anxietyAndStress => 'Ansiedade e Estresse';

  @override
  String get gratitude => 'Gratidão';

  @override
  String get protection => 'Proteção';

  @override
  String get family => 'Família';

  @override
  String get forgiveness => 'Perdão';

  @override
  String get appBlockingSetupHeadline => 'Guarde seu tempo, guarde sua oração';

  @override
  String get appBlockingSetupBody =>
      'O Noor Guard usa o serviço de Acessibilidade do Android apenas para perceber quando um app bloqueado é aberto durante a oração. Ele nunca lê suas mensagens, fotos ou dados pessoais.';

  @override
  String get appBlockingAccessibilityStatusOn =>
      'Acesso de acessibilidade concedido';

  @override
  String get appBlockingAccessibilityStatusOff =>
      'Acesso de acessibilidade não concedido';

  @override
  String get appBlockingOpenSettings => 'Abrir configurações de acessibilidade';

  @override
  String get appBlockingSetupNotNow => 'Agora não';

  @override
  String get appBlockingEnableToggle => 'Ativar bloqueio de apps';

  @override
  String get appBlockingModeLabel => 'Modo de bloqueio';

  @override
  String get appBlockingModeSoft => 'Suave';

  @override
  String get appBlockingModeSoftDesc =>
      'Apenas um lembrete gentil — os apps continuam abertos';

  @override
  String get appBlockingModeFirm => 'Firme';

  @override
  String get appBlockingModeFirmDesc => 'Bloqueia o app, com uma saída rápida';

  @override
  String get appBlockingModeHard => 'Rígido';

  @override
  String get appBlockingModeHardDesc =>
      'Bloqueio total — só \"Eu orei\" desbloqueia';

  @override
  String get appBlockingSelectPrayersLabel => 'Bloquear durante estas orações';

  @override
  String get appBlockingBufferBeforeLabel => 'Começar antes da oração';

  @override
  String get appBlockingBufferAfterLabel => 'Liberar depois da oração';

  @override
  String appBlockingMinutesShort(int count) {
    return '$count min';
  }

  @override
  String get appBlockingAppsTitle => 'Apps bloqueados';

  @override
  String get appBlockingSelectAppsButton => 'Escolher apps para bloquear';

  @override
  String get appBlockingSearchHint => 'Buscar apps instalados';

  @override
  String get appBlockingNoAppsSelected => 'Nenhum app selecionado ainda';

  @override
  String appBlockingAppsSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloqueados',
      one: '1 app bloqueado',
      zero: 'Nenhum app bloqueado',
    );
    return '$_temp0';
  }

  @override
  String get appBlockingTestSectionLabel => 'Teste';

  @override
  String get appBlockingTestDescription =>
      'Ative o bloqueio de apps por 2 minutos para confirmar que está funcionando neste dispositivo.';

  @override
  String get appBlockingTestButton => 'Testar bloqueio de apps (2 minutos)';

  @override
  String get appBlockingTestActiveSnackbar =>
      'Bloqueio de apps ativo por 2 minutos — tente abrir um app bloqueado';

  @override
  String get appBlockingPermissionNeeded =>
      'Ative o acesso de acessibilidade para começar a bloquear';

  @override
  String get appBlockingIosComingSoonTitle =>
      'Acesso ao Tempo de Uso — em breve';

  @override
  String get appBlockingIosComingSoonBody =>
      'O bloqueio de apps no iOS precisa da permissão de Tempo de Uso da Apple, que ainda estamos configurando. Avisaremos assim que estiver pronto.';

  @override
  String get appBlockingHeadline1 => 'Hora de orar';

  @override
  String get appBlockingHeadline2 => 'Guarde seu tempo';

  @override
  String get appBlockingDefaultTitle => 'Hora da oração';

  @override
  String get appBlockingIPrayedButton => 'Eu orei';

  @override
  String get appBlockingReadAyahsButton => 'Ler 3 versículos';

  @override
  String get appBlockingEmergencyBypass => 'Saída de emergência';

  @override
  String get appBlockingSkipForNow => 'Pular por agora';

  @override
  String get appBlockingBypassConfirmTitle => 'Encerrar sua sequência?';

  @override
  String get appBlockingBypassConfirmBody =>
      'Sair agora vai zerar sua sequência de orações. Se for uma emergência real, você pode continuar.';

  @override
  String get appBlockingBypassConfirmContinue => 'Sair assim mesmo';

  @override
  String get appBlockingBypassConfirmCancel => 'Voltar';

  @override
  String get appBlockingSoftReminderTitle => 'Um lembrete gentil';

  @override
  String get appBlockingSoftReminderBody =>
      'É hora de orar — considere se afastar por um momento.';

  @override
  String get quranChallengeBannerTitle => 'Leia 3 versículos para desbloquear';

  @override
  String quranChallengeBannerProgress(int count, int total) {
    return '$count de $total versículos lidos';
  }

  @override
  String get quranChallengeComplete => 'Muito bem — apps desbloqueados';

  @override
  String get focusBlockHeadline1 => 'Mantenha o foco';

  @override
  String get focusBlockHeadline2 => 'Continue assim';

  @override
  String get endFocusSessionButton => 'Encerrar sessão de foco';

  @override
  String get focusPaused => 'Pausado para a oração';

  @override
  String get selectLocationTitle => 'Selecionar localização';

  @override
  String get useCurrentLocation => 'Usar localização atual';

  @override
  String get savedLocationsHeader => 'Localizações salvas';

  @override
  String get noSavedLocationsYet =>
      'Ainda não há localizações salvas. Pesquise abaixo para adicionar uma.';

  @override
  String get searchCityHint => 'Pesquisar nome da cidade…';

  @override
  String get addLocationTooltip => 'Adicionar localização';

  @override
  String get deleteLocationTooltip => 'Excluir localização';

  @override
  String get locationNotFound =>
      'Localização não encontrada. Tente outra pesquisa.';

  @override
  String maxLocationsReachedMessage(int max) {
    return 'Você pode salvar até $max localizações';
  }

  @override
  String get notificationsToggleUnconfirmed =>
      'Não foi possível confirmar a alteração — tente novamente';

  @override
  String get tasbihCounter => 'Contador de Tasbih';

  @override
  String get tasbihCounterSubtitle => 'Conte seu dhikr';

  @override
  String get tasbihResetButton => 'Reiniciar';

  @override
  String get tasbihTotalLabel => 'Total';

  @override
  String get tasbihCelebrationTitle => 'Tasbih concluído!';

  @override
  String get tasbihCelebrationBody =>
      'Você completou todos os 99 dhikr. Que Allah aceite sua lembrança.';

  @override
  String get tasbihStartNewSession => 'Iniciar nova sessão';

  @override
  String get tasbihUndoButton => 'Desfazer';

  @override
  String get tasbihTapAnywhereHint =>
      'Toque em qualquer lugar da tela para contar';

  @override
  String get tasbihSoundToggleTooltip => 'Som ao tocar';

  @override
  String get tasbihManageDhikrTooltip => 'Gerenciar dhikr';

  @override
  String get tasbihStatsTooltip => 'Ver estatísticas';

  @override
  String get tasbihDailyTotalLabel => 'Total de Hoje';

  @override
  String get tasbihRoundsTodayLabel => 'Rodadas de Hoje';

  @override
  String get tasbihManageDhikrTitle => 'Gerenciar Dhikr';

  @override
  String get tasbihAddCustomDhikrButton => 'Adicionar Dhikr Personalizado';

  @override
  String get tasbihDeleteDhikrTooltip => 'Excluir';

  @override
  String get tasbihBuiltInDhikrBadge => 'Padrão';

  @override
  String get tasbihCannotDeleteLastDhikr =>
      'Você precisa de pelo menos um dhikr';

  @override
  String get tasbihDhikrNameLabel => 'Nome';

  @override
  String get tasbihDhikrNameHint => 'ex. Astaghfirullah';

  @override
  String get tasbihDhikrArabicLabel => 'Árabe (opcional)';

  @override
  String get tasbihDhikrArabicHint => 'أَسْتَغْفِرُ اللَّهَ';

  @override
  String get tasbihDhikrNameRequiredError => 'Por favor, insira um nome';

  @override
  String get tasbihSaveDhikrButton => 'Salvar';

  @override
  String get tasbihStatsTitle => 'Estatísticas do Tasbih';

  @override
  String get tasbihAllTimeTotalLabel => 'Total Geral';

  @override
  String get tasbihNoActivityYetMessage =>
      'Comece a contar para ver suas estatísticas aqui.';

  @override
  String get tasbihSoundPickerTitle => 'Som ao Tocar';

  @override
  String get tasbihSoundClassicClick => 'Clique Clássico';

  @override
  String get tasbihSoundSoftChime => 'Sino Suave';

  @override
  String get tasbihSoundStoneTap => 'Toque de Pedra';

  @override
  String get tasbihCurrentlyReciting => 'Recitando Agora';

  @override
  String tasbihOfTarget(int target) {
    return 'de $target';
  }

  @override
  String get tasbihSoundRainDrop => 'Gota de Chuva';

  @override
  String get tasbihSoundSoftFeather => 'Pena Suave';

  @override
  String noAyahsFound(String query) {
    return 'Nenhum versículo encontrado para \"$query\"';
  }

  @override
  String get trySearchingQuran =>
      'Pesquise em português, inglês ou árabe, ou use um termo islâmico:';

  @override
  String get loadingQuranIndex => 'A carregar o índice do Alcorão…';

  @override
  String get quranSearchSuggestions =>
      'paciência, sabr, misericórdia, oração, salah, perdão, tawbah, paraíso, jannah, conhecimento';

  @override
  String get heroVerse1 =>
      'Guardai fielmente as orações, especialmente a oração do meio.';

  @override
  String get heroVerse2 =>
      'Verdadeiramente, a oração foi prescrita aos crentes em horas determinadas.';

  @override
  String get heroVerse3 => 'Buscai auxílio na paciência e na oração.';

  @override
  String get heroVerse4 =>
      'Lembrai-Me, portanto, e Eu vos lembrarei. Agradecei-Me e não sejais ingratos.';

  @override
  String get heroVerse5 => 'E quem confia em Allah, Ele lhe é suficiente.';

  @override
  String get heroVerse6 =>
      'Com efeito, a primeira Casa estabelecida para os homens foi a de Makkah, bendita e guia para os mundos.';

  @override
  String get heroVerse7 =>
      'Na verdade, a oração proíbe a indecência e o mal, e a lembrança de Allah é maior.';

  @override
  String get heroVerse8 =>
      'Em verdade, pela lembrança de Allah os corações encontram descanso.';

  @override
  String get heroVerse9 => 'Invocai-Me; Eu vos responderei.';

  @override
  String get heroVerse10 => 'Se fordes agradecidos, certamente vos darei mais.';

  @override
  String get heroVerse11 =>
      'Allah não sobrecarrega nenhuma alma além de sua capacidade.';

  @override
  String get heroVerse12 => 'Em verdade, Allah está com os pacientes.';

  @override
  String get heroVerse13 => 'A Minha misericórdia abrange todas as coisas.';

  @override
  String get heroVerse14 =>
      'E fazei o bem; em verdade, Allah ama os que fazem o bem.';

  @override
  String get heroVerse15 =>
      'Este é o Livro do qual não há dúvida, uma orientação para os tementes a Allah.';

  @override
  String get accuracyHigh => 'Alta precisão';

  @override
  String get accuracyMedium => 'Precisão média';

  @override
  String get accuracyLow => 'Baixa precisão';

  @override
  String get accuracyCalibrating => 'A calibrar…';

  @override
  String get compassNeedsCalibration => 'Bússola precisa de calibração';

  @override
  String get compassCalibrationHint =>
      'Mova o telemóvel lentamente em forma de 8 para melhorar a precisão.';

  @override
  String get spiritLevelLabel => 'Nível de bolha';

  @override
  String get spiritLevelLevelText => '✓  Nivelado';

  @override
  String get spiritLevelTiltText => 'Inclina para nivelar';

  @override
  String get compassNorth => 'N';

  @override
  String get compassEast => 'L';

  @override
  String get compassSouth => 'S';

  @override
  String get compassWest => 'O';

  @override
  String get splashAppName => 'Noor Guard';

  @override
  String get splashTagline => 'Guarda o teu tempo. Honra as tuas orações.';

  @override
  String get stopAdhan => 'Parar Adhan';

  @override
  String get duasSearchEmpty =>
      'Tente uma categoria diferente ou outro termo de pesquisa.';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingWelcomeTo => 'Bem-vindo ao';

  @override
  String get onboardingSubtitle => 'Seu companheiro na bela jornada do Islã.';

  @override
  String get onboardingLetsGetStarted => 'Vamos começar';

  @override
  String onboardingStepOf(int step, int total) {
    return '$step de $total';
  }

  @override
  String get onboardingWhatsYourName => 'Qual é o seu nome?';

  @override
  String get onboardingNameSubtitle =>
      'Adoraríamos saber como nos dirigir a você.';

  @override
  String get onboardingNameHint => 'Digite seu nome';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingAreYouNewToIslam => 'Você é novo no Islã?';

  @override
  String get onboardingModeSubtitle =>
      'Vamos personalizar sua experiência com base em sua jornada.';

  @override
  String get onboardingNewToIslam => 'Sou novo no Islã';

  @override
  String get onboardingNewToIslamDesc =>
      'Modo iniciante com orientação passo a passo';

  @override
  String get onboardingFamiliarWithIslam => 'Estou familiarizado com o Islã';

  @override
  String get onboardingFamiliarWithIslamDesc =>
      'Modo regular com todos os recursos';

  @override
  String greetingWithName(String name) {
    return 'As-Salāmu \'Alaikum, $name 🤲';
  }

  @override
  String beginnerDaySinceShahada(int days) {
    return 'Dia $days como muçulmano';
  }

  @override
  String get beginnerEssential1 => 'Guia para novos muçulmanos';

  @override
  String get beginnerEssential2 => 'Aprender Wudu (Purificação ritual)';

  @override
  String get beginnerEssential3 => 'Como rezar (Passo a passo)';

  @override
  String get beginnerEssential4 => 'Surah Al-Fatiha (A Abertura)';

  @override
  String get beginnerEssential5 => 'Duas diárias (Súplicas)';

  @override
  String get beginnerEssential6 => 'Entendendo a Shahada';

  @override
  String get beginnerEssential7 => 'Termos islâmicos e glossário';

  @override
  String get beginnerExploreAll => 'Explorar todos os recursos';

  @override
  String get beginnerExploreSubtitle =>
      'Mude para a experiência completa do Noor Guard';

  @override
  String get beginnerExploreFeaturesSubtitle =>
      'Tudo o que o Noor Guard tem a oferecer';

  @override
  String get beginnerLearnSalah => 'Aprender Salah';

  @override
  String get beginnerMayAllahGuide =>
      'Que Allah guie seus passos e abençoe sua jornada.';

  @override
  String get beginnerMuslimEssentials => 'ESSENCIAIS DO MUÇULMANO';

  @override
  String get beginnerQuote1 =>
      'Certamente, com a dificuldade vem a facilidade. — Alcorão 94:6';

  @override
  String get beginnerQuote2 =>
      'Cuide dos mandamentos de Allah e Ele cuidará de você.';

  @override
  String get beginnerQuote3 =>
      'Allah olha para o teu coração e ações, não para a tua aparência.';

  @override
  String get beginnerQuote4 =>
      'Cada passo em direção à oração é um passo em direção à paz.';

  @override
  String get beginnerQuote5 =>
      'O melhor entre vós é aquele que aprende o Alcorão e o ensina.';

  @override
  String get beginnerTapToSetShahadaDate =>
      'Toque para definir sua data de Shahada';

  @override
  String get beginnerToolboxSection => 'CAIXA DE FERRAMENTAS PARA INICIANTES';

  @override
  String get beginnerYourJourney => 'SUA JORNADA';

  @override
  String get journeyMonth1Name => 'Mês 1: O Fundamento';

  @override
  String get journeyMonth2Name => 'Mês 2: Construindo Hábitos';

  @override
  String get journeyMonth3Name => 'Mês 3: Aprofundando a Fé';

  @override
  String journeyTasksCompleted(int done, int total) {
    return '$done/$total concluído';
  }

  @override
  String get journeyViewFull => 'Ver jornada completa →';

  @override
  String get journeyTask2_1 => 'Realizar as 5 orações por 7 dias';

  @override
  String get journeyTask2_2 => 'Aprender mais 10 Duas';

  @override
  String get journeyTask2_3 => 'Ler o primeiro Juz do Alcörão';

  @override
  String get journeyTask2_4 => 'Aprender os 99 Nomes de Allah';

  @override
  String get journeyTask2_5 =>
      'Usar o contador de Tasbih diariamente por 7 dias';

  @override
  String get journeyTask2_6 => 'Aprender as orações Sunnah';

  @override
  String get journeyTask2_7 => 'Encontrar sua Masjid local';

  @override
  String get journeyTask3_1 => 'Ler a Surah Al-Baqarah';

  @override
  String get journeyTask3_2 => 'Aprender sobre Zakat';

  @override
  String get journeyTask3_3 => 'Aprender sobre o Jejum (Sawm)';

  @override
  String get journeyTask3_4 => 'Memorizar 3 novas Surahs';

  @override
  String get journeyTask3_5 => 'Aprender sobre o Hajj';

  @override
  String get journeyTask3_6 => 'Compartilhar o Islam com alguém';

  @override
  String get journeyTask3_7 => 'Completar o Glossário Islâmico';

  @override
  String get journeyTimelineTitle => 'Minha Jornada';

  @override
  String get journeyCompleted => 'Concluído';

  @override
  String get journeyInProgress => 'Em Andamento';

  @override
  String get journeyLocked => 'Bloqueado';

  @override
  String get wuduThreeTimes => '3 vezes';

  @override
  String get wuduDuaBefore => 'Du\'a antes do Wudu';

  @override
  String get wuduDuaAfter => 'Du\'a depois do Wudu';

  @override
  String get wuduDuaBeforeArabic => 'بِسْمِ اللَّهِ';

  @override
  String get wuduDuaBeforeTranslit => 'Bismillāh';

  @override
  String get wuduDuaBeforeTranslation => 'Em nome de Allah';

  @override
  String get wuduDuaAfterArabic =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ';

  @override
  String get wuduDuaAfterTranslit =>
      'Ash-hadu an lā ilāha illallāh, waḥdahu lā sharīka lah, wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh. Allāhumma ijʿalnī min al-tawwābīn, wajʿalnī min al-mutaṭahhirīn.';

  @override
  String get wuduDuaAfterTranslation =>
      'Testemunho que não há divindade digna de adoração exceto Allah, Único, sem associados, e testemunho que Muhammad é Seu servo e mensageiro. Ó Allah, torna-me dos que se arrependem e dos que se purificam.';

  @override
  String get wuduCompleteButton => 'Completei o Wudu';

  @override
  String get howToPrayStepOpeningDua => 'Du\'a inicial';

  @override
  String get howToPrayStepAlFatiha => 'Surata Al-Fatiha';

  @override
  String get howToPrayStepSurah => 'Surata curta';

  @override
  String get howToPrayStepTashahhudShort => 'Tashahhud (sentada intermediária)';

  @override
  String get howToPrayStepSalawat => 'Salawat ao Profeta ﷺ';

  @override
  String get howToPrayTransTakbir => 'Allah é o Maior';

  @override
  String get howToPrayTransOpeningDua =>
      'Glória seja a Ti, ó Allah, e com Teu louvor; bendito é Teu nome, exaltada é Tua majestade, não há deus além de Ti.';

  @override
  String get howToPrayTransFatiha =>
      'Em nome de Allah, o Clemente, o Misericordioso. Todo o louvor pertence a Allah, Senhor dos mundos. O Clemente, o Misericordioso. Soberano do Dia do Juízo. Somente a Ti adoramos e somente a Ti pedimos socorro. Guia-nos pelo caminho reto — o caminho daqueles a quem abençoaste, não o dos que mereceram a ira, nem o dos que se extraviaram.';

  @override
  String get howToPrayTransRuku => 'Glória ao meu Senhor, o Supremo';

  @override
  String get howToPrayTransItidal =>
      'Allah ouve aquele que O louva. Nosso Senhor, e a Ti todo o louvor.';

  @override
  String get howToPrayTransSujood => 'Glória ao meu Senhor, o Altíssimo';

  @override
  String get howToPrayTransJalsa => 'Meu Senhor, perdoa-me';

  @override
  String get howToPrayTransTashahhud =>
      'Todas as saudações, orações e boas palavras pertencem a Allah. Paz seja contigo, ó Profeta, e a misericórdia de Allah e Suas bênçãos. Paz seja conosco e com os servos justos de Allah. Testemunho que não há deus além de Allah, e testemunho que Muhammad é Seu servo e mensageiro.';

  @override
  String get howToPrayTransSalawat =>
      'Ó Allah, envia Tua graça sobre Muhammad e a família de Muhammad, como enviaste Tua graça sobre Ibrahima e a família de Ibrahima — Tu és o Mais Digno de louvor, o Mais Glorioso. Ó Allah, abençoa Muhammad e a família de Muhammad, como abençoaste Ibrahima e a família de Ibrahima — Tu és o Mais Digno de louvor, o Mais Glorioso.';

  @override
  String get howToPrayTransTasleem =>
      'Que a paz e a misericórdia de Allah estejam convosco';

  @override
  String get howToPrayOpeningDuaInstruction =>
      'Recite isso suavemente logo após o Takbir inicial. É dito apenas uma vez, no início da oração.';

  @override
  String get howToPraySurahInstruction =>
      'Após Al-Fatiha, recite qualquer surata memorizada. A surata Al-Ikhlas (acima) é perfeita para iniciantes — recitada apenas nas duas primeiras rak\'ahs.';

  @override
  String get howToPrayItidalInstruction =>
      'Diga \'Sami\' Allahu liman hamidah\' ao se levantar, depois fique ereto antes de dizer \'Rabbana wa lakal hamd\'.';

  @override
  String get howToPrayMiddleTashahhudInstruction =>
      'Sente-se após a 2ª rak\'ah. Levante o dedo indicador direito ao pronunciar a Shahada. Em orações de 3 e 4 rak\'ahs, você se levantará novamente.';

  @override
  String get howToPraySalawatInstruction =>
      'Recite o Salawat logo após o Tashahhud final, apenas na última sentada, antes do Tasleem.';

  @override
  String get howToPrayTasleemInstruction =>
      'Vire a cabeça para a direita e diga o Tasleem, depois para a esquerda e repita. Sua oração está concluída.';

  @override
  String get howToPrayOnceOpens => 'Uma vez — abre a oração';

  @override
  String get howToPraySayAllahuAkbar => 'Diga: Allāhu Akbar';

  @override
  String get howToPrayFirstRakahOnly => 'Apenas 1ª rak\'ah';

  @override
  String get howToPrayFirst2RakahsOnly => 'Apenas as 2 primeiras rak\'ahs';

  @override
  String get howToPrayEveryRakah => 'Cada rak\'ah';

  @override
  String get howToPrayAfter2ndRakah => 'Após a 2ª rak\'ah';

  @override
  String get howToPrayFinalSittingOnly => 'Apenas sentada final';

  @override
  String get howToPrayClosesThePrayer => 'Encerra a oração';

  @override
  String get howToPraySectionBefore => 'Antes de Orar';

  @override
  String get howToPraySectionRakah => 'Rak\'ah';

  @override
  String get howToPraySectionMiddleSitting => 'Sentada intermediária';

  @override
  String get howToPraySectionFinalSitting => 'Sentada final';

  @override
  String get howToPrayRakahLabel => 'Rak\'ahs';

  @override
  String get howToPrayCompleteButton => 'Completei minha oração';

  @override
  String get howToPrayMashaallah => 'Masha\'Allah!';

  @override
  String get howToPrayAccepted => 'Que Allah aceite sua oração.';

  @override
  String get fatihaIntroTitle => 'A Mãe do Alcorão';

  @override
  String get fatihaIntroBody =>
      'A Surah Al-Fatiha é a maior surah do Alcorão. É recitada em cada unidade de oração — pelo menos 17 vezes por dia. É uma conversa completa entre o servo e Allah, e uma porta de entrada para cada oração.';

  @override
  String get fatihaIntroIbnKathir =>
      'Ibn Kathir escreve: \'Al-Fatiha contém a essência de todo o Alcorão — é uma oração, uma declaração de servidão e um pedido de guia para o Caminho Reto.\' — Tafsir Ibn Kathir';

  @override
  String get shahadaScreenTitle => 'A Shahada';

  @override
  String get shahadaArabicText =>
      'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ';

  @override
  String get shahadaTransliteration =>
      'Ash-hadu an lā ilāha illā-llāh, wa ash-hadu anna Muḥammadan rasūlu-llāh';

  @override
  String get shahadaTranslation =>
      'Testemunho que não há divindade além de Allah, e testemunho que Muhammad é o mensageiro de Allah';

  @override
  String get shahadaWordBreakdownTitle => 'Palavra por Palavra';

  @override
  String get shahadaWord1Arabic => 'لَا';

  @override
  String get shahadaWord1Trans => 'Lā';

  @override
  String get shahadaWord1Meaning => 'Não há';

  @override
  String get shahadaWord2Arabic => 'إِلَٰهَ';

  @override
  String get shahadaWord2Trans => 'ilāha';

  @override
  String get shahadaWord2Meaning => 'divindade / deus';

  @override
  String get shahadaWord3Arabic => 'إِلَّا';

  @override
  String get shahadaWord3Trans => 'illā';

  @override
  String get shahadaWord3Meaning => 'exceto';

  @override
  String get shahadaWord4Arabic => 'اللَّهُ';

  @override
  String get shahadaWord4Trans => 'Allāhu';

  @override
  String get shahadaWord4Meaning => 'Allah (Deus somente)';

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
  String get shahadaWord6Meaning => 'Mensageiro / Profeta';

  @override
  String get shahadaWord7Arabic => 'اللَّهِ';

  @override
  String get shahadaWord7Trans => 'Allāhi';

  @override
  String get shahadaWord7Meaning => 'de Allah';

  @override
  String get shahadaMeaningTitle => 'Significado & Importância';

  @override
  String get shahadaMeaningBody =>
      'A Shahada é a declaração de fé que forma a base do Islã. É o primeiro dos Cinco Pilares. Ao pronunciar estas palavras com sincera convicção, uma pessoa entra no Islã. Ibn Kathir explica que a primeira parte nega todas as falsas divindades e afirma a unicidade absoluta de Allah.';

  @override
  String get shahadaMomentTitle => 'O Momento da Shahada';

  @override
  String get shahadaMomentBody =>
      'Quando uma pessoa pronuncia a Shahada pela primeira vez com verdadeira fé no coração, algo profundo acontece — ela começa uma nova vida. O Profeta ﷺ disse: \'Quem disser que não há deus além de Allah e não acreditar em nada que seja adorado além d\'Ele, sua riqueza e sangue estão protegidos.\' (Sahih Muslim). Todos os pecados passados são perdoados. Bem-vindo ao Islã.';

  @override
  String get shahadaPronunciationTitle => 'Guia de Pronúncia';

  @override
  String get shahadaPronunciationPart1 => 'Laa · i · LAA · ha · il · LAL · LAH';

  @override
  String get shahadaPronunciationPart2 =>
      'Mu · HAM · ma · dun · ra · SUU · lul · LAH';

  @override
  String get toolboxLearnSalahSubtitle => 'Guia passo a passo';

  @override
  String get toolboxWuduSubtitle => 'Purificação antes da oração';

  @override
  String get toolboxGlossarySubtitle => '114 termos islâmicos explicados';

  @override
  String get shareSheetTitle => 'Compartilhar';

  @override
  String get shareAnAyah => 'Compartilhar um Ayah';

  @override
  String get shareADua => 'Compartilhar um Dua';

  @override
  String get shareANameOfAllah => 'Compartilhar um Nome de Allah';

  @override
  String get shareAHadith => 'Compartilhar um Hadith';

  @override
  String get shareViaLabel => 'Compartilhado via Noor Guard';

  @override
  String get shareCardAyahLabel => '✦ Ayah do Dia';

  @override
  String get shareCardDuaLabel => '✦ Dua';

  @override
  String get shareCardNameLabel => '✦ Nome de Allah';

  @override
  String get shareCardHadithLabel => '✦ Hadith';

  @override
  String get sharePickDuaTitle => 'Escolher um Dua para Compartilhar';

  @override
  String get shareError => 'Não foi possível criar a imagem';

  @override
  String get shareCardVerseLabel => '✦ Versículo do Alcorão';

  @override
  String get shareCardAsmaLabel => '✦ Asma ul-Husna';

  @override
  String get shareAyahSubtitle => 'Escolha entre 30 versículos corânicos';

  @override
  String get shareDuaSubtitle => 'Escolher da biblioteca';

  @override
  String get shareNameSubtitle => 'Escolha entre todos os 99 Belos Nomes';

  @override
  String get shareHadithSubtitle => 'Escolha entre 20 hadiths autênticos';

  @override
  String get shareThisDua => 'Compartilhar Esta Dua';

  @override
  String get sharePickAyahTitle => 'Escolha um Ayah para Compartilhar';

  @override
  String get searchAyahs => 'Pesquisar ayahs…';

  @override
  String get noAyahsFoundShort => 'Nenhum ayah encontrado';

  @override
  String get shareThisAyah => 'Compartilhar Este Ayah';

  @override
  String get sharePickNameTitle => 'Escolha um Nome para Compartilhar';

  @override
  String get shareThisName => 'Compartilhar Este Nome';

  @override
  String get sharePickHadithTitle => 'Escolha um Hadith para Compartilhar';

  @override
  String get searchHadiths => 'Pesquisar hadiths…';

  @override
  String get noHadithsFound => 'Nenhum hadith encontrado';

  @override
  String get shareThisHadith => 'Compartilhar Este Hadith';

  @override
  String get backToBasics => 'Voltar ao Básico';

  @override
  String get backToBasicsSubtitle => 'Seu guia para os fundamentos do Islã';

  @override
  String get fivePillarsOfIslam => 'Os 5 Pilares do Islã';

  @override
  String get fivePillarsShort => '5 Pilares';

  @override
  String get fivePillarsSubtitle => 'Os fundamentos da fé islâmica';

  @override
  String get pillarLearnMore => 'Saber mais';

  @override
  String get pillarShowLess => 'Ver menos';

  @override
  String get pillarsShowDetails => 'Mostrar detalhes';

  @override
  String get pillarsHideDetails => 'Ocultar detalhes';

  @override
  String get pillar1Name => 'Shahada';

  @override
  String get pillar1Desc => 'Declaração de Fé';

  @override
  String get pillar1Detail =>
      'A declaracao de fe e o fundamento do Isla. Ao dizer sinceramente \'Nao ha deus senao Allah e Muhammad e Seu mensageiro\', uma pessoa entra no Isla.';

  @override
  String get pillar2Name => 'Salah';

  @override
  String get pillar2Desc => 'Cinco Orações Diárias';

  @override
  String get pillar2Detail =>
      'As cinco oracoes diarias sao a conexao direta entre um muculmano e Allah. Realizadas ao amanhecer, ao meio-dia, a tarde, ao por do sol e a noite, estruturam o dia inteiro do muculmano em torno da lembranca de Allah.';

  @override
  String get pillar3Name => 'Zakat';

  @override
  String get pillar3Desc => 'Caridade Obrigatória';

  @override
  String get pillar3Detail =>
      'O Zakat e a caridade anual obrigatoria de 2,5% das economias dada aos necessitados. Ele purifica a riqueza e fortalece os lacos da comunidade muculmana.';

  @override
  String get pillar4Name => 'Sawm';

  @override
  String get pillar4Desc => 'Jejum no Ramadã';

  @override
  String get pillar4Detail =>
      'O jejum durante o abencado mes do Ramada do amanhecer ao por do sol. Os muculmanos se absteem de comida, bebida e pecado para alcancar o taqwa (consciencia de Deus) e a gratidao.';

  @override
  String get pillar5Name => 'Hajj';

  @override
  String get pillar5Desc => 'Peregrinação à Meca';

  @override
  String get pillar5Detail =>
      'A peregrinacao a Meca e obrigatoria uma vez na vida para todo muculmano fisica e financeiramente capaz. E a maior reuniao anual de pessoas na terra.';

  @override
  String get switchedToNewMuslimMode => 'Mudado para o Modo Novo Muçulmano';

  @override
  String get switchedToRegularMode => 'Mudado para o Modo Regular';

  @override
  String get liveNotifChannelName => 'Noor Guard ao Vivo';

  @override
  String get liveNotifChannelDescription =>
      'Contagem regressiva da oração e conteúdo islâmico diário na sua tela de bloqueio';

  @override
  String get liveNotifHeaderAyah => 'AYAH DO DIA';

  @override
  String get liveNotifHeaderDua => 'DUA DO DIA';

  @override
  String get liveNotifHeaderWord => 'PALAVRA DO DIA';

  @override
  String get liveNotifHeaderName => 'NOME DE ALLAH';

  @override
  String get liveNotifHeaderHadith => 'HADITH DO DIA';

  @override
  String liveNotifCountdownHoursMinutes(Object hours, Object minutes) {
    return 'em ${hours}h ${minutes}min';
  }

  @override
  String liveNotifCountdownMinutes(Object minutes) {
    return 'em ${minutes}min';
  }

  @override
  String get liveNotifCountdownNow => 'É hora de rezar';

  @override
  String get savedDuas => 'Duas salvas';

  @override
  String get savedVerses => 'Versículos salvos';

  @override
  String get savedNames => 'Nomes salvos';

  @override
  String get noSavedDuas => 'Ainda não há duas salvas';

  @override
  String get noSavedVerses => 'Ainda não há versículos salvos';

  @override
  String get noSavedNames => 'Ainda não há nomes salvos';

  @override
  String get heroVerse16 =>
      'Senhor nosso, não nos culpes se esquecermos ou errarmos.';

  @override
  String get heroVerse17 => 'Allah nos basta, e Ele é o melhor Guardião.';

  @override
  String get heroVerse18 =>
      'Ó vós que credes, crede em Allah e em Seu Mensageiro.';

  @override
  String get heroVerse19 =>
      'Ó vós que credes, temei a Allah e buscai o meio de vos aproximardes d\'Ele.';

  @override
  String get heroVerse20 =>
      'De fato, minha oração, meu sacrifício, minha vida e minha morte pertencem a Allah, Senhor dos mundos.';

  @override
  String get heroVerse21 =>
      'Decreta para nós o bem nesta vida e na próxima; a Ti retornámos.';

  @override
  String get heroVerse22 =>
      'Lembrai-vos muito de Allah para que possais prosperar.';

  @override
  String get heroVerse23 =>
      'Nada nos sucederá senão o que Allah decretou para nós; Ele é o nosso Protetor.';

  @override
  String get heroVerse24 =>
      'De fato, os amigos de Allah não terão medo nem se entristecerão.';

  @override
  String get heroVerse25 =>
      'Meu êxito vem somente de Allah; n\'Ele confio e a Ele me volto.';

  @override
  String get heroVerse26 => 'Não desespereis da misericórdia de Allah.';

  @override
  String get heroVerse27 =>
      'Aqueles que creem e cujos corações se tranquilizam com a lembrança de Allah.';

  @override
  String get heroVerse28 =>
      'E quando o vosso Senhor proclamou: Se fordes gratos, certamente vos darei ainda mais.';

  @override
  String get heroVerse29 => 'E adora o teu Senhor até que te chegue a certeza.';

  @override
  String get heroVerse30 =>
      'De fato, Allah está com os que O temem e com os que fazem o bem.';

  @override
  String get focusButtonSubtitle => 'Proteja seu tempo para o que importa';

  @override
  String get ourStories => 'Nossas histórias';

  @override
  String get storiesSeeAll => 'Ver todas';

  @override
  String get storiesReadMore => 'Ler mais';

  @override
  String get storiesFeaturedLabel => 'História em destaque';

  @override
  String get storiesFilterReverts => 'Convertidos';

  @override
  String get storyCategoryRevert => 'Convertido';

  @override
  String get storyCategoryBornMuslim => 'Muçulmano de nascença';

  @override
  String get storyCategoryReturning => 'Retornando';

  @override
  String get storiesShareYours => 'Compartilhe a sua';

  @override
  String get storiesEmptyTitle => 'Ainda não há histórias';

  @override
  String get storiesEmptySubtitle =>
      'Seja o primeiro a compartilhar sua jornada';

  @override
  String storyShahadaDate(Object date) {
    return 'Shahada: $date';
  }

  @override
  String get storiesComments => 'Comentários';

  @override
  String get storiesAddComment => 'Adicionar um comentário…';

  @override
  String get storiesAnonymous => 'Anônimo';

  @override
  String get storiesNameLabel => 'Seu nome';

  @override
  String get storiesPostAnonymously => 'Publicar anonimamente';

  @override
  String get storiesCountryLabel => 'País';

  @override
  String get storiesCategoryLabel => 'Categoria';

  @override
  String get storiesShahadaDateLabel => 'Data da Shahada (opcional)';

  @override
  String get storiesYourStoryLabel => 'Sua história';

  @override
  String get storiesStoryHint => 'Conte-nos sobre sua jornada…';

  @override
  String get storiesChooseBackground => 'Escolha um fundo';

  @override
  String get storiesBackgroundNone => 'Nenhum';

  @override
  String get storiesEditTitle => 'Editar sua história';

  @override
  String get storiesSaveChanges => 'Salvar alterações';

  @override
  String get storiesUpdated => 'Sua história foi atualizada';

  @override
  String get storiesUploadPhoto => 'Enviar foto (opcional)';

  @override
  String get storiesChangePhoto => 'Alterar foto';

  @override
  String get storiesSubmitButton => 'Enviar';

  @override
  String get storiesSubmitted =>
      'JazakAllah khair! Sua história foi enviada para revisão.';

  @override
  String get storiesSubmitError => 'Algo deu errado. Tente novamente.';

  @override
  String get storiesFillRequired => 'Adicione sua história e seu país.';

  @override
  String get storiesShareCardLabel => 'História da comunidade';

  @override
  String get storiesPreviewLabel => 'Pré-visualização';

  @override
  String get storiesPendingReview => 'Em análise';

  @override
  String get storiesFilterSaved => 'Salvas';

  @override
  String get storiesSavedEmpty => 'Ainda não há histórias salvas';

  @override
  String get storiesSearchCountryHint => 'Buscar país…';

  @override
  String get storiesChooseAvatar => 'Escolha um avatar';

  @override
  String get storiesAvatarInitials => 'Iniciais';

  @override
  String get storiesAvatarIcon => 'Ícone';

  @override
  String get storiesAvatarPattern => 'Padrão';

  @override
  String get storiesLoadError =>
      'Não foi possível carregar as histórias. Verifique sua conexão.';

  @override
  String get storiesDiscardTitle => 'Descartar sua história?';

  @override
  String get storiesDiscard => 'Descartar';

  @override
  String get storiesKeepWriting => 'Continuar escrevendo';

  @override
  String get storiesSaveDraft => 'Salvar rascunho';

  @override
  String get storiesDraftSaved => 'Rascunho salvo';

  @override
  String get storiesDeleteDraft => 'Excluir rascunho';

  @override
  String get storiesContinueDraft => 'Continue seu rascunho';

  @override
  String get storiesStartFresh => 'Começar de novo';

  @override
  String get shareCardGlossaryLabel => '✦ Glossário Islâmico';

  @override
  String get shareCardTafsirLabel => '✦ Tafsir';

  @override
  String shareCardAyahRef(String number) {
    return 'Versículo $number';
  }

  @override
  String get prayerReminderTitleFajr => '🕌 Hora do Fajr';

  @override
  String get prayerReminderTitleDhuhr => '☀️ Hora do Dhuhr';

  @override
  String get prayerReminderTitleAsr => '🌤️ Hora do Asr';

  @override
  String get prayerReminderTitleMaghrib => '🌅 Hora do Maghrib';

  @override
  String get prayerReminderTitleIsha => '🌙 Hora do Isha';

  @override
  String get prayerReminderBodyFajr =>
      'Levante-se e ore. Allah recompensa quem desperta por Ele.';

  @override
  String get prayerReminderBodyDhuhr =>
      'Reserve um momento para Allah. Sua oração de Dhuhr aguarda.';

  @override
  String get prayerReminderBodyAsr =>
      'A oração intermediária. Guarde-a com zelo. — Al-Báqara 2:238';

  @override
  String get prayerReminderBodyMaghrib =>
      'O sol se pôs. Responda ao chamado de Allah.';

  @override
  String get prayerReminderBodyIsha =>
      'Termine seu dia com Allah. Sua oração da noite aguarda.';

  @override
  String get prayerAlarmMessageFajr =>
      'Levante-se e ore. Allah recompensa quem desperta por Ele.';

  @override
  String get prayerAlarmMessageDhuhr =>
      'Reserve um momento para Allah. Sua oração de Dhuhr aguarda.';

  @override
  String get prayerAlarmMessageAsr =>
      'Guarde com zelo a oração intermediária. — Al-Báqara 2:238';

  @override
  String get prayerAlarmMessageMaghrib =>
      'O sol se pôs. Responda ao chamado de Allah.';

  @override
  String get prayerAlarmMessageIsha =>
      'Termine seu dia com Allah. Sua oração da noite aguarda.';

  @override
  String prayerReminderTitleGeneric(String prayer) {
    return '🕌 $prayer em 15 minutos';
  }

  @override
  String prayerReminderBodyGeneric(String prayer) {
    return 'É hora de se preparar para a oração de $prayer';
  }

  @override
  String prayerAlarmMessageGeneric(String prayer) {
    return 'É hora da oração de $prayer';
  }

  @override
  String get testNotificationTitle => '🔔 Notificação de teste';

  @override
  String get testNotificationBody =>
      'As notificações estão funcionando corretamente!';

  @override
  String get favoriteRecitersSection => 'Favoritos';

  @override
  String get favoriteRecitersLimit =>
      'Você só pode ter 3 recitadores favoritos. Remova um para adicionar outro.';

  @override
  String get findQiblaDirection => 'Encontrar a direção da Qibla';

  @override
  String get storyMenuShare => 'Compartilhar';

  @override
  String get storyMenuBookmark => 'Salvar';

  @override
  String get storyMenuReport => 'Denunciar';

  @override
  String get reportSheetTitle => 'Denunciar esta história';

  @override
  String get reportSheetSubtitle => 'Ajude-nos a manter o Noor Guard seguro';

  @override
  String get reportReasonInappropriate => 'Conteúdo impróprio';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHateSpeech => 'Discurso de ódio';

  @override
  String get reportReasonOther => 'Outro';

  @override
  String get reportSubmit => 'Enviar denúncia';

  @override
  String get reportThankYou => 'JazakAllah khair — obrigado por denunciar';

  @override
  String get adminMode => 'Modo administrador';

  @override
  String get adminTitle => 'Administrador';

  @override
  String get adminTabPending => 'Histórias pendentes';

  @override
  String get adminTabReported => 'Histórias denunciadas';

  @override
  String get adminApprove => 'Aprovar';

  @override
  String get adminReject => 'Rejeitar';

  @override
  String get adminDeleteStory => 'Excluir história';

  @override
  String get adminDismiss => 'Dispensar';

  @override
  String get adminEmptyPending => 'Nenhuma história pendente';

  @override
  String get adminEmptyReports => 'Nenhuma denúncia pendente';

  @override
  String get locating => 'Localizando...';

  @override
  String get prayerBegunTitleFajr => '🕌 Chegou a hora do Fajr';

  @override
  String get prayerBegunTitleDhuhr => '☀️ Chegou a hora do Dhuhr';

  @override
  String get prayerBegunTitleAsr => '🌤️ Chegou a hora do Asr';

  @override
  String get prayerBegunTitleMaghrib => '🌅 Chegou a hora do Maghrib';

  @override
  String get prayerBegunTitleIsha => '🌙 Chegou a hora do Isha';

  @override
  String get noCitiesFound => 'Nenhuma cidade encontrada';

  @override
  String get appBlockingAccessDialogTitle =>
      'Permissão de acessibilidade necessária';

  @override
  String get appBlockingAccessDialogBody =>
      'O Noor Guard usa o Serviço de Acessibilidade do Android para bloquear aplicativos que distraem durante a oração e o tempo de foco. Nenhum dado pessoal é coletado ou compartilhado. Toque em Continuar para abrir as Configurações e ativá-lo.';

  @override
  String get appBlockingAccessDialogContinue => 'Continuar';
}
