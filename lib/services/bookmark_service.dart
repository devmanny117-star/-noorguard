import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// One bookmarked Quran verse, stored as a JSON snapshot so the Saved Verses
/// screen can render offline without re-fetching the surah.
class SavedVerse {
  final int surahNumber;
  final String surahEnglishName;
  final String surahArabicName;
  final int verseNumber;
  final String arabic;
  final String translation;

  const SavedVerse({
    required this.surahNumber,
    required this.surahEnglishName,
    required this.surahArabicName,
    required this.verseNumber,
    required this.arabic,
    required this.translation,
  });

  /// Unique key: "surah:verse".
  String get key => '$surahNumber:$verseNumber';

  Map<String, dynamic> toJson() => {
        'surah': surahNumber,
        'surahEn': surahEnglishName,
        'surahAr': surahArabicName,
        'verse': verseNumber,
        'arabic': arabic,
        'translation': translation,
      };

  factory SavedVerse.fromJson(Map<String, dynamic> json) => SavedVerse(
        surahNumber: json['surah'] as int,
        surahEnglishName: json['surahEn'] as String? ?? '',
        surahArabicName: json['surahAr'] as String? ?? '',
        verseNumber: json['verse'] as int,
        arabic: json['arabic'] as String? ?? '',
        translation: json['translation'] as String? ?? '',
      );
}

/// SharedPreferences-backed persistence for the three Saved/Bookmarks
/// features: duas (keyed by Arabic text), Quran verses (JSON snapshots) and
/// the 99 Names (keyed by name number 1-99).
class BookmarkService {
  static const _duasKey = 'bookmarked_duas';
  static const _versesKey = 'bookmarked_verses';
  static const _namesKey = 'bookmarked_names';

  // ── Duas ──────────────────────────────────────────────────────────────────

  static Future<Set<String>> loadDuaBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_duasKey) ?? const []).toSet();
  }

  static Future<Set<String>> toggleDuaBookmark(String arabic) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = (prefs.getStringList(_duasKey) ?? const []).toSet();
    if (!saved.remove(arabic)) saved.add(arabic);
    await prefs.setStringList(_duasKey, saved.toList());
    return saved;
  }

  // ── Quran verses ──────────────────────────────────────────────────────────

  static Future<List<SavedVerse>> loadVerseBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_versesKey) ?? const [];
    final verses = <SavedVerse>[];
    for (final entry in raw) {
      try {
        verses.add(
            SavedVerse.fromJson(jsonDecode(entry) as Map<String, dynamic>));
      } catch (_) {
        // Skip malformed entries rather than break the whole list.
      }
    }
    return verses;
  }

  static Future<void> saveVerseBookmarks(List<SavedVerse> verses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _versesKey, verses.map((v) => jsonEncode(v.toJson())).toList());
  }

  /// Adds the verse if not bookmarked, removes it if it is. Returns the new
  /// set of bookmark keys ("surah:verse").
  static Future<Set<String>> toggleVerseBookmark(SavedVerse verse) async {
    final verses = await loadVerseBookmarks();
    final existing = verses.indexWhere((v) => v.key == verse.key);
    if (existing >= 0) {
      verses.removeAt(existing);
    } else {
      verses.add(verse);
    }
    await saveVerseBookmarks(verses);
    return verses.map((v) => v.key).toSet();
  }

  // ── 99 Names ──────────────────────────────────────────────────────────────

  static Future<Set<int>> loadNameBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_namesKey) ?? const [])
        .map(int.tryParse)
        .whereType<int>()
        .toSet();
  }

  static Future<Set<int>> toggleNameBookmark(int number) async {
    final saved = await loadNameBookmarks();
    if (!saved.remove(number)) saved.add(number);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _namesKey, saved.map((n) => n.toString()).toList());
    return saved;
  }
}
