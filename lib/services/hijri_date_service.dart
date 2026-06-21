/// Gregorian-to-Hijri conversion using the tabular (civil epoch) Islamic
/// calendar algorithm. This is an algorithmic estimate — like any calculated
/// Hijri date, it can differ by a day from the date locally announced after
/// moon sighting, which varies by region and isn't predictable in advance.
class HijriDate {
  final int year;
  final int month; // 1-12
  final int day;

  const HijriDate({required this.year, required this.month, required this.day});

  factory HijriDate.fromGregorian(DateTime date) {
    final jdn = _gregorianToJdn(date.year, date.month, date.day);
    return HijriDate.fromJdn(jdn);
  }

  factory HijriDate.fromJdn(int jdn) {
    var l = jdn - 1948440 + 10632;
    final n = (l - 1) ~/ 10631;
    l = l - 10631 * n + 354;
    final j = ((10985 - l) ~/ 5316) * ((50 * l) ~/ 17719) +
        (l ~/ 5670) * ((43 * l) ~/ 15238);
    l = l -
        ((30 - j) ~/ 15) * ((17719 * j) ~/ 50) -
        (j ~/ 16) * ((15238 * j) ~/ 43) +
        29;
    final month = (24 * l) ~/ 709;
    final day = l - (709 * month) ~/ 24;
    final year = 30 * n + j - 30;
    return HijriDate(year: year, month: month, day: day);
  }

  static int _gregorianToJdn(int year, int month, int day) {
    return ((1461 * (year + 4800 + (month - 14) ~/ 12)) ~/ 4) +
        ((367 * (month - 2 - 12 * ((month - 14) ~/ 12))) ~/ 12) -
        ((3 * ((year + 4900 + (month - 14) ~/ 12) ~/ 100)) ~/ 4) +
        day -
        32075;
  }

  /// Formats as "5 Muharram 1448" using the given list of 12 localized
  /// month names (index 0 = Muharram ... index 11 = Dhul Hijjah).
  String format(List<String> localizedMonthNames) {
    return '$day ${localizedMonthNames[month - 1]} $year';
  }
}
