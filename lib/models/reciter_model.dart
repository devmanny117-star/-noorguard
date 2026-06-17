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

/// All folder names are verified against live EveryAyah.com responses.
const List<Reciter> reciters = [
  Reciter(
    id: 'alafasy',
    name: 'Mishary Rashid Alafasy',
    shortName: 'Alafasy',
    folder: 'Alafasy_128kbps',
  ),
  Reciter(
    id: 'sudais',
    name: 'Abdul Rahman Al-Sudais',
    shortName: 'Al-Sudais',
    folder: 'Abdurrahmaan_As-Sudais_192kbps',
  ),
  Reciter(
    id: 'ghamadi',
    name: 'Saad Al-Ghamdi',
    shortName: 'Al-Ghamdi',
    folder: 'Ghamadi_40kbps',
  ),
  Reciter(
    id: 'maher',
    name: 'Maher Al-Muaiqly',
    shortName: 'Al-Muaiqly',
    folder: 'MaherAlMuaiqly128kbps',
  ),
  Reciter(
    id: 'yasser_dosari',
    name: 'Yasser Al-Dosari',
    shortName: 'Al-Dosari',
    folder: 'Yasser_Ad-Dussary_128kbps',
  ),
  Reciter(
    id: 'hani_rifai',
    name: 'Hani Ar-Rifai',
    shortName: 'Ar-Rifai',
    folder: 'Hani_Rifai_192kbps',
  ),
  Reciter(
    id: 'basfar',
    name: 'Abdullah Basfar',
    shortName: 'Basfar',
    folder: 'Abdullah_Basfar_192kbps',
  ),
  Reciter(
    id: 'ajamy',
    name: 'Ahmed Al-Ajmy',
    shortName: 'Al-Ajmy',
    folder: 'ahmed_ibn_ali_al_ajamy_128kbps',
  ),
  Reciter(
    id: 'shuraim',
    name: 'Saud Al-Shuraim',
    shortName: 'Al-Shuraim',
    folder: 'Saood_ash-Shuraym_128kbps',
  ),
  Reciter(
    id: 'bukhatir',
    name: 'Salah Bukhatir',
    shortName: 'Bukhatir',
    folder: 'Salaah_AbdulRahman_Bukhatir_128kbps',
  ),
  Reciter(
    id: 'abdul_basit',
    name: 'Abdul Basit Abd us-Samad',
    shortName: 'Abdul Basit',
    folder: 'Abdul_Basit_Murattal_192kbps',
  ),
  Reciter(
    id: 'husary',
    name: 'Mahmoud Khalil Al-Husary',
    shortName: 'Al-Husary',
    folder: 'Husary_128kbps',
  ),
  Reciter(
    id: 'minshawy',
    name: 'Mohamed Siddiq Al-Minshawi',
    shortName: 'Al-Minshawi',
    folder: 'Minshawy_Murattal_128kbps',
  ),
];
