class Prayer {
  final String name;
  final String arabicName;
  final String time;
  final String iconPath;
  final bool isNext;
  final bool isPassed;

  const Prayer({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.iconPath,
    this.isNext = false,
    this.isPassed = false,
  });
}

final List<Prayer> todaysPrayers = [
  Prayer(
    name: 'Fajr',
    arabicName: 'الفجر',
    time: '5:23 AM',
    iconPath: 'fajr',
    isPassed: true,
  ),
  Prayer(
    name: 'Dhuhr',
    arabicName: 'الظهر',
    time: '1:15 PM',
    iconPath: 'dhuhr',
    isPassed: true,
  ),
  Prayer(
    name: 'Asr',
    arabicName: 'العصر',
    time: '4:47 PM',
    iconPath: 'asr',
    isNext: true,
  ),
  Prayer(
    name: 'Maghrib',
    arabicName: 'المغرب',
    time: '7:52 PM',
    iconPath: 'maghrib',
  ),
  Prayer(
    name: 'Isha',
    arabicName: 'العشاء',
    time: '9:15 PM',
    iconPath: 'isha',
  ),
];
