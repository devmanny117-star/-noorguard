/// A Quran reciter available for verse-by-verse audio playback via
/// EveryAyah.com.
class Reciter {
  final String id;
  final String name;
  final String shortName;
  final String folder;

  const Reciter({
    required this.id,
    required this.name,
    required this.shortName,
    required this.folder,
  });

  /// Builds the EveryAyah.com audio URL for a given surah and ayah number.
  String audioUrl(int surahNumber, int ayahNumber) {
    final surah = surahNumber.toString().padLeft(3, '0');
    final ayah = ayahNumber.toString().padLeft(3, '0');
    return 'https://everyayah.com/data/$folder/$surah$ayah.mp3';
  }
}

const List<Reciter> reciters = [
  Reciter(
    id: 'abdul_basit',
    name: 'Abdul Basit Abd us-Samad',
    shortName: 'Abdul Basit',
    folder: 'Abdul_Basit_Murattal_192kbps',
  ),
  Reciter(
    id: 'alafasy',
    name: 'Mishary Rashid Alafasy',
    shortName: 'Alafasy',
    folder: 'Mishary_Rashid_Alafasy_128kbps',
  ),
  Reciter(
    id: 'husary',
    name: 'Mahmoud Khalil Al-Husary',
    shortName: 'Al-Husary',
    folder: 'Husary_128kbps',
  ),
  Reciter(
    id: 'minshawi',
    name: 'Mohamed Siddiq Al-Minshawi',
    shortName: 'Al-Minshawi',
    folder: 'Minshawi_Murattal_128kbps',
  ),
  Reciter(
    id: 'ghamdi',
    name: 'Saad Al-Ghamdi',
    shortName: 'Al-Ghamdi',
    folder: 'Ghamdi_40kbps',
  ),
];
