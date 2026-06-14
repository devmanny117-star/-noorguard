import '../l10n/app_localizations.dart';

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

/// Localized display name for an [AdhanStyle.id], shared by every screen
/// that lists adhan styles (Adhan screen, Settings adhan picker).
String adhanStyleName(AppLocalizations l10n, String id) {
  switch (id) {
    case 'makkah':
      return l10n.makkahStyle;
    case 'madinah':
      return l10n.madinahStyle;
    case 'egyptian':
      return l10n.egyptianStyle;
    case 'alafasy':
      return l10n.alafasyStyle;
    case 'alaqsa':
      return l10n.alaqsaStyle;
    case 'turkish':
      return l10n.turkishStyle;
    case 'pakistani':
      return l10n.pakistaniStyle;
    case 'indonesian':
      return l10n.indonesianStyle;
    default:
      return id;
  }
}

/// Localized description for an [AdhanStyle.id], shared by every screen
/// that lists adhan styles (Adhan screen, Settings adhan picker).
String adhanStyleDescription(AppLocalizations l10n, String id) {
  switch (id) {
    case 'makkah':
      return l10n.makkahDescription;
    case 'madinah':
      return l10n.madinahDescription;
    case 'egyptian':
      return l10n.egyptianDescription;
    case 'alafasy':
      return l10n.alafasyDescription;
    case 'alaqsa':
      return l10n.alaqsaDescription;
    case 'turkish':
      return l10n.turkishDescription;
    case 'pakistani':
      return l10n.pakistaniDescription;
    case 'indonesian':
      return l10n.indonesianDescription;
    default:
      return '';
  }
}
