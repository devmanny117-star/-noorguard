import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../services/hijri_date_service.dart';
import '../theme/app_theme.dart';
import '../widgets/geometric_pattern_painter.dart';

// The calendar is deliberately a fixed dark-navy/gold design in BOTH app
// themes — like the lock screen and Revert Corner card, it reads as one of
// the app's "night sky" premium surfaces rather than following the
// light/dark scheme.
const _navy = Color(0xFF0D1B2A);
const _navyCard = Color(0xFF13253A);
const _cream = AppColors.cream;

class IslamicCalendarScreen extends StatelessWidget {
  const IslamicCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _navy,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _SliverHeader(),
          SliverToBoxAdapter(child: _HeroSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(child: _MonthStrip()),
          const SliverToBoxAdapter(child: SizedBox(height: 26)),
          SliverToBoxAdapter(child: _SectionHeader(text: l10n.upcomingEvents)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _EventCard(
                event: _upcomingEvents[i],
                isNext: i == 0,
              ),
              childCount: _upcomingEvents.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 26)),
          SliverToBoxAdapter(child: _SectionHeader(text: l10n.pastEvents)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _EventCard(
                event: _pastEvents[i],
                isPast: true,
              ),
              childCount: _pastEvents.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// ─── Data ────────────────────────────────────────────────────────────────────

enum _IslamicMonth { muharram, rabiAlAwwal, ramadan, shawwal, dhulHijjah }

enum _EventName {
  islamicNewYear,
  ashura,
  mawlidAlNabi,
  ramadanBegins,
  laylatAlQadr,
  eidAlFitr,
  dayOfArafah,
  eidAlAdha,
}

String _hijriMonthName(AppLocalizations l10n, _IslamicMonth month) {
  switch (month) {
    case _IslamicMonth.muharram:
      return l10n.islamicMonthMuharram;
    case _IslamicMonth.rabiAlAwwal:
      return l10n.islamicMonthRabiAlAwwal;
    case _IslamicMonth.ramadan:
      return l10n.islamicMonthRamadan;
    case _IslamicMonth.shawwal:
      return l10n.islamicMonthShawwal;
    case _IslamicMonth.dhulHijjah:
      return l10n.islamicMonthDhulHijjah;
  }
}

String _eventName(AppLocalizations l10n, _EventName name) {
  switch (name) {
    case _EventName.islamicNewYear:
      return l10n.islamicNewYear;
    case _EventName.ashura:
      return l10n.ashura;
    case _EventName.mawlidAlNabi:
      return l10n.mawlidAlNabi;
    case _EventName.ramadanBegins:
      return l10n.ramadanBegins;
    case _EventName.laylatAlQadr:
      return l10n.laylatAlQadr;
    case _EventName.eidAlFitr:
      return l10n.eidAlFitr;
    case _EventName.dayOfArafah:
      return l10n.dayOfArafah;
    case _EventName.eidAlAdha:
      return l10n.eidAlAdha;
  }
}

class _EventData {
  final _EventName name;
  final int? yearSuffix;
  final int hijriDay;
  final _IslamicMonth hijriMonth;
  final int hijriYear;
  final DateTime gregorianDate;

  _EventData({
    required this.name,
    this.yearSuffix,
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
    required this.gregorianDate,
  });

  String localizedName(AppLocalizations l10n) {
    final base = _eventName(l10n, name);
    return yearSuffix == null ? base : '$base $yearSuffix';
  }

  String localizedHijriDate(AppLocalizations l10n) =>
      '$hijriDay ${_hijriMonthName(l10n, hijriMonth)} $hijriYear';

  String localizedGregorianDate(String localeCode) =>
      DateFormat.yMMMMd(localeCode).format(gregorianDate);
}

final _pastEvents = [
  _EventData(name: _EventName.islamicNewYear, hijriDay: 1, hijriMonth: _IslamicMonth.muharram, hijriYear: 1447, gregorianDate: DateTime(2025, 6, 26)),
  _EventData(name: _EventName.ashura, hijriDay: 10, hijriMonth: _IslamicMonth.muharram, hijriYear: 1447, gregorianDate: DateTime(2025, 7, 5)),
  _EventData(name: _EventName.mawlidAlNabi, hijriDay: 12, hijriMonth: _IslamicMonth.rabiAlAwwal, hijriYear: 1447, gregorianDate: DateTime(2025, 9, 4)),
  _EventData(name: _EventName.ramadanBegins, hijriDay: 1, hijriMonth: _IslamicMonth.ramadan, hijriYear: 1447, gregorianDate: DateTime(2026, 2, 17)),
  _EventData(name: _EventName.laylatAlQadr, hijriDay: 27, hijriMonth: _IslamicMonth.ramadan, hijriYear: 1447, gregorianDate: DateTime(2026, 3, 15)),
  _EventData(name: _EventName.eidAlFitr, hijriDay: 1, hijriMonth: _IslamicMonth.shawwal, hijriYear: 1447, gregorianDate: DateTime(2026, 3, 19)),
  _EventData(name: _EventName.dayOfArafah, hijriDay: 9, hijriMonth: _IslamicMonth.dhulHijjah, hijriYear: 1447, gregorianDate: DateTime(2026, 5, 25)),
  _EventData(name: _EventName.eidAlAdha, hijriDay: 10, hijriMonth: _IslamicMonth.dhulHijjah, hijriYear: 1447, gregorianDate: DateTime(2026, 5, 26)),
];

final _upcomingEvents = [
  _EventData(name: _EventName.islamicNewYear, yearSuffix: 1448, hijriDay: 1, hijriMonth: _IslamicMonth.muharram, hijriYear: 1448, gregorianDate: DateTime(2026, 6, 16)),
  _EventData(name: _EventName.ashura, hijriDay: 10, hijriMonth: _IslamicMonth.muharram, hijriYear: 1448, gregorianDate: DateTime(2026, 6, 25)),
  _EventData(name: _EventName.mawlidAlNabi, hijriDay: 12, hijriMonth: _IslamicMonth.rabiAlAwwal, hijriYear: 1448, gregorianDate: DateTime(2026, 8, 25)),
  _EventData(name: _EventName.ramadanBegins, hijriDay: 1, hijriMonth: _IslamicMonth.ramadan, hijriYear: 1448, gregorianDate: DateTime(2027, 2, 7)),
  _EventData(name: _EventName.laylatAlQadr, hijriDay: 27, hijriMonth: _IslamicMonth.ramadan, hijriYear: 1448, gregorianDate: DateTime(2027, 3, 5)),
  _EventData(name: _EventName.eidAlFitr, hijriDay: 1, hijriMonth: _IslamicMonth.shawwal, hijriYear: 1448, gregorianDate: DateTime(2027, 3, 9)),
  _EventData(name: _EventName.dayOfArafah, hijriDay: 9, hijriMonth: _IslamicMonth.dhulHijjah, hijriYear: 1448, gregorianDate: DateTime(2027, 5, 15)),
  _EventData(name: _EventName.eidAlAdha, hijriDay: 10, hijriMonth: _IslamicMonth.dhulHijjah, hijriYear: 1448, gregorianDate: DateTime(2027, 5, 16)),
];

// ─── Hijri helpers ───────────────────────────────────────────────────────────

const _arabicMonthNames = [
  'محرم',
  'صفر',
  'ربيع الأول',
  'ربيع الآخر',
  'جمادى الأولى',
  'جمادى الآخرة',
  'رجب',
  'شعبان',
  'رمضان',
  'شوال',
  'ذو القعدة',
  'ذو الحجة',
];

String _arabicIndicDigits(int number) {
  const digits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  return number.toString().split('').map((c) => digits[int.parse(c)]).join();
}

List<String> _hijriMonthNames(AppLocalizations l10n) => [
      l10n.islamicMonthMuharram,
      l10n.islamicMonthSafar,
      l10n.islamicMonthRabiAlAwwal,
      l10n.islamicMonthRabiAlThani,
      l10n.islamicMonthJumadaAlAwwal,
      l10n.islamicMonthJumadaAlThani,
      l10n.islamicMonthRajab,
      l10n.islamicMonthShaban,
      l10n.islamicMonthRamadan,
      l10n.islamicMonthShawwal,
      l10n.islamicMonthDhulQadah,
      l10n.islamicMonthDhulHijjah,
    ];

/// Days in a tabular (civil) Hijri month: odd months 30, even months 29,
/// plus one leap day on Dhul Hijjah in leap years of the 30-year cycle.
int _hijriMonthLength(int year, int month) {
  if (month.isOdd) return 30;
  final isLeap = ((11 * year) + 14) % 30 < 11;
  return (month == 12 && isLeap) ? 30 : 29;
}

// ─── Sliver app bar ───────────────────────────────────────────────────────────

class _SliverHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SliverAppBar(
      pinned: true,
      backgroundColor: _navy,
      elevation: 0,
      scrolledUnderElevation: 0.8,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      iconTheme: const IconThemeData(color: _cream),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: _cream),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        l10n.islamicCalendar,
        style: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: _cream,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.gold.withValues(alpha: 0.18),
        ),
      ),
    );
  }
}

// ─── Hero section: today's Hijri date ────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).toString();
    final now = DateTime.now();
    final hijri = HijriDate.fromGregorian(now);
    final monthName = _hijriMonthNames(l10n)[hijri.month - 1];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF16283F), _navy],
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.gold.withValues(alpha: 0.30),
            ),
          ),
          child: Stack(
            children: [
              // Subtle 8-pointed star field, same texture as the Revert
              // Corner card and unified prayer card.
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(alpha: 0.05),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 22, 20, 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.today.toUpperCase(),
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gold,
                              letterSpacing: 2.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${hijri.day} $monthName',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: AppColors.gold,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l10n.hijriYearLabel(hijri.year),
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _cream,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded,
                                  size: 13,
                                  color: _cream.withValues(alpha: 0.55)),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  DateFormat.yMMMMd(localeCode).format(now),
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _cream.withValues(alpha: 0.55),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Arabic date, always in Arabic script regardless of the
                    // app language — decorative, like the lock screen.
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _arabicIndicDigits(hijri.day),
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 54,
                            color: AppColors.gold.withValues(alpha: 0.85),
                            height: 1.0,
                          ),
                        ),
                        Text(
                          _arabicMonthNames[hijri.month - 1],
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 20,
                            color: _cream.withValues(alpha: 0.75),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Month strip: horizontal scrollable current Hijri month ──────────────────

class _MonthStrip extends StatefulWidget {
  @override
  State<_MonthStrip> createState() => _MonthStripState();
}

class _MonthStripState extends State<_MonthStrip> {
  static const _itemExtent = 54.0; // 46 chip + 8 separator

  late final ScrollController _controller;
  late final HijriDate _todayHijri;
  late final DateTime _todayGregorian;

  @override
  void initState() {
    super.initState();
    _todayGregorian = DateTime.now();
    _todayHijri = HijriDate.fromGregorian(_todayGregorian);
    // Start with today's chip roughly centered.
    _controller = ScrollController(
      initialScrollOffset: (_todayHijri.day - 4) * _itemExtent,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localeCode = Localizations.localeOf(context).toString();
    final daysInMonth = _hijriMonthLength(_todayHijri.year, _todayHijri.month);

    return SizedBox(
      height: 74,
      child: ListView.separated(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
        itemCount: daysInMonth,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final day = i + 1;
          final isToday = day == _todayHijri.day;
          // The matching Gregorian date, for the weekday label.
          final gregorian = _todayGregorian
              .add(Duration(days: day - _todayHijri.day));
          final weekday = DateFormat.E(localeCode).format(gregorian);

          return Container(
            width: 46,
            decoration: BoxDecoration(
              color: isToday ? AppColors.gold : _navyCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isToday
                    ? AppColors.gold
                    : AppColors.gold.withValues(alpha: 0.16),
              ),
              boxShadow: isToday
                  ? [
                      BoxShadow(
                        color: AppColors.gold.withValues(alpha: 0.35),
                        blurRadius: 12,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekday,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: isToday
                        ? _navy.withValues(alpha: 0.75)
                        : _cream.withValues(alpha: 0.55),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '$day',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isToday ? _navy : _cream,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ─── Section header with diamond ornament ────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 14),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.gold,
            ),
          ),
          const SizedBox(width: 12),
          // Diamond ornament divider, matching the feature grid's.
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.gold.withValues(alpha: 0.30),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '◆',
                    style: TextStyle(color: AppColors.gold, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.gold.withValues(alpha: 0.30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Event card ───────────────────────────────────────────────────────────────

class _EventCard extends StatelessWidget {
  final _EventData event;
  final bool isNext;
  final bool isPast;

  const _EventCard({
    required this.event,
    this.isNext = false,
    this.isPast = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).toString();

    // Past events keep the same premium card, just quieter.
    final double dim = isPast ? 0.55 : 1.0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
      child: Container(
        decoration: BoxDecoration(
          color: _navyCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.gold.withValues(alpha: isNext ? 0.45 : 0.16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Gold accent bar on the leading edge (mirrors under RTL).
              Container(
                width: 4,
                margin: const EdgeInsetsDirectional.only(start: 0),
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: dim),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(16),
                    bottomStart: Radius.circular(16),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(18, 14, 16, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              event.localizedHijriDate(l10n),
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.4,
                                color: AppColors.gold.withValues(alpha: dim),
                              ),
                            ),
                          ),
                          if (isNext)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.gold.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: AppColors.gold
                                      .withValues(alpha: 0.55),
                                ),
                              ),
                              child: Text(
                                l10n.next,
                                style: GoogleFonts.lato(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                  color: AppColors.gold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        event.localizedName(l10n),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: _cream.withValues(alpha: dim),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.localizedGregorianDate(localeCode),
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: _cream.withValues(alpha: 0.55 * dim),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
