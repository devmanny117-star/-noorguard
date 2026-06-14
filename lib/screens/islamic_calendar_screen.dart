import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

class IslamicCalendarScreen extends StatelessWidget {
  const IslamicCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _SliverHeader(),
          SliverToBoxAdapter(child: _HijriDateCard()),
          const SliverToBoxAdapter(child: SizedBox(height: 28)),
          SliverToBoxAdapter(child: _SectionLabel(text: l10n.pastEvents)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _EventTile(
                event: _pastEvents[i],
                isLast: i == _pastEvents.length - 1,
              ),
              childCount: _pastEvents.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: _SectionLabel(text: l10n.upcomingEvents)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _EventTile(
                event: _upcomingEvents[i],
                isLast: i == _upcomingEvents.length - 1,
                isUpcoming: true,
              ),
              childCount: _upcomingEvents.length,
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

// ─── Sliver app bar ───────────────────────────────────────────────────────────

class _SliverHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return SliverAppBar(
      pinned: true,
      backgroundColor: colors.background,
      elevation: 0,
      scrolledUnderElevation: 0.8,
      shadowColor: Colors.black.withOpacity(0.08),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,
            size: 20, color: colors.primaryText),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        l10n.islamicCalendar,
        style: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colors.primaryText,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: colors.border),
      ),
    );
  }
}

// ─── Today's hijri date card ──────────────────────────────────────────────────

class _HijriDateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).toString();

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
      child: Container(
        decoration: BoxDecoration(
          color: colors.warmBg,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
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
                  const SizedBox(height: 6),
                  Text(
                    '17 ${l10n.islamicMonthDhulHijjah}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.gold,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    l10n.hijriYearLabel(1447),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gold.withOpacity(0.70),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded,
                          size: 13, color: colors.secondaryText),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat.yMMMMd(localeCode).format(DateTime(2026, 6, 3)),
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '١٧',
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 56,
                    color: AppColors.gold.withOpacity(0.18),
                    height: 1.0,
                  ),
                ),
                Text(
                  'ذو الحجة',
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 20,
                    color: AppColors.gold.withOpacity(0.22),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colors.primaryText,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(height: 1, color: colors.border),
          ),
        ],
      ),
    );
  }
}

// ─── Event tile ───────────────────────────────────────────────────────────────

class _EventTile extends StatelessWidget {
  final _EventData event;
  final bool isLast;
  final bool isUpcoming;

  const _EventTile({
    required this.event,
    this.isLast = false,
    this.isUpcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = context.isDark;
    final l10n = AppLocalizations.of(context)!;
    final localeCode = Localizations.localeOf(context).toString();

    final dotColor = isUpcoming
        ? AppColors.gold
        : (isDark ? const Color(0xFF444444) : const Color(0xFFCCCCCC));
    final lineColor = isUpcoming
        ? AppColors.gold.withOpacity(0.20)
        : colors.border;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Column(
              children: [
                const SizedBox(height: 3),
                Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isUpcoming ? AppColors.gold : colors.cardBg,
                    border: Border.all(color: dotColor, width: 2),
                  ),
                ),
                if (!isLast)
                  Container(width: 1.5, height: 58, color: lineColor),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 4 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.localizedName(l10n),
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isUpcoming
                                ? colors.primaryText
                                : colors.secondaryText,
                          ),
                        ),
                      ),
                      if (isUpcoming && event == _upcomingEvents.first)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            l10n.next,
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    event.localizedHijriDate(l10n),
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isUpcoming
                          ? AppColors.gold
                          : AppColors.gold.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    event.localizedGregorianDate(localeCode),
                    style: GoogleFonts.lato(
                      fontSize: 11.5,
                      color: isUpcoming
                          ? colors.secondaryText
                          : colors.secondaryText.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
