/// A style of Adhan (call to prayer) available for audio playback.
class AdhanStyle {
  final String id;
  final String name;
  final String arabicName;
  final String audioUrl;

  const AdhanStyle({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.audioUrl,
  });
}

const List<AdhanStyle> adhanStyles = [
  AdhanStyle(
    id: 'makkah',
    name: 'Makkah',
    arabicName: 'مكة المكرمة',
    audioUrl: 'https://archive.org/download/adhans_sunnah/adhan_makkah.mp3',
  ),
  AdhanStyle(
    id: 'madinah',
    name: 'Madinah',
    arabicName: 'المدينة المنورة',
    audioUrl: 'https://archive.org/download/adhans_sunnah/adhan_madina.mp3',
  ),
  AdhanStyle(
    id: 'egyptian',
    name: 'Egyptian',
    arabicName: 'الطراز المصري',
    audioUrl: 'https://archive.org/download/adhans_sunnah/adhan_egypt.mp3',
  ),
  AdhanStyle(
    id: 'alafasy',
    name: 'Mishary Alafasy',
    arabicName: 'مشاري راشد العفاسي',
    audioUrl: 'https://archive.org/download/AdzanMisyariRasyid2/adzan_by_mishari_rashid_al-afasy-2_2.mp3',
  ),
  AdhanStyle(
    id: 'alaqsa',
    name: 'Al-Aqsa',
    arabicName: 'المسجد الأقصى',
    audioUrl: 'https://archive.org/download/AdzanMisyariRasyid2/alaqsa1_64_22_2.mp3',
  ),
  AdhanStyle(
    id: 'turkish',
    name: 'Turkish',
    arabicName: 'الطراز التركي',
    audioUrl: 'https://archive.org/download/AdzanMisyariRasyid2/adzan_turkey-1_2.mp3',
  ),
  AdhanStyle(
    id: 'pakistani',
    name: 'Pakistani',
    arabicName: 'الطراز الباكستاني',
    audioUrl: 'https://archive.org/download/AdzanMisyariRasyid2/Pakistan-Adzan_2.mp3',
  ),
  AdhanStyle(
    id: 'indonesian',
    name: 'Indonesian',
    arabicName: 'الطراز الإندونيسي',
    audioUrl: 'https://archive.org/download/AdzanMisyariRasyid2/adzan_magrib_di_trans_tv_2.mp3',
  ),
];
