import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dhikr_model.dart';
import '../models/tasbih_sound.dart';

class TapResult {
  final bool reachedDhikrTarget;
  final bool completedRound;
  const TapResult({
    required this.reachedDhikrTarget,
    required this.completedRound,
  });
}

class TasbihStats {
  final int allTimeTotal;
  final int todayTaps;
  final int todayRounds;
  final int currentStreak;
  final int longestStreak;
  final List<int> last7Days; // oldest to newest

  const TasbihStats({
    required this.allTimeTotal,
    required this.todayTaps,
    required this.todayRounds,
    required this.currentStreak,
    required this.longestStreak,
    required this.last7Days,
  });
}

class _UndoSnapshot {
  final int dhikrIndex;
  final int count;
  final int sessionTotal;
  final int allTimeTotal;
  final int dailyTaps;
  final int dailyRounds;
  const _UndoSnapshot({
    required this.dhikrIndex,
    required this.count,
    required this.sessionTotal,
    required this.allTimeTotal,
    required this.dailyTaps,
    required this.dailyRounds,
  });
}

/// Singleton ChangeNotifier holding all tasbih counter state — the active
/// dhikr/count (which survives app restarts), the user's custom dhikr list,
/// and the daily-taps log that streak/stats are computed from. Mirrors the
/// PrayerState / StreakService pattern used for prayer tracking elsewhere.
class TasbihService extends ChangeNotifier {
  static final TasbihService _instance = TasbihService._internal();
  factory TasbihService() => _instance;
  TasbihService._internal();

  static const _keyCustomDhikr = 'tasbih_custom_dhikr';
  static const _keyDhikrIndex = 'tasbih_dhikr_index';
  static const _keyCount = 'tasbih_count';
  static const _keySessionTotal = 'tasbih_session_total';
  static const _keySoundEnabled = 'tasbih_sound_enabled';
  static const _keySoundOption = 'tasbih_sound_option';
  static const _keyAllTimeTotal = 'tasbih_alltime_total';
  static const _keyTapHintShown = 'tasbih_tap_hint_shown';
  static const _dailyTapsPrefix = 'tasbih_daily_taps_';
  static const _dailyRoundsPrefix = 'tasbih_daily_rounds_';

  bool _ready = false;
  bool get ready => _ready;

  List<DhikrItem> _customDhikr = [];
  int _dhikrIndex = 0;
  int _count = 0;
  int _sessionTotal = 0;
  int _allTimeTotal = 0;
  bool _soundEnabled = false;
  String _selectedSoundId = tasbihDefaultSoundId;
  bool _tapHintShown = false;
  _UndoSnapshot? _undoSnapshot;

  late SharedPreferences _prefs;

  List<DhikrItem> get dhikrList => [...builtInDhikr, ..._customDhikr];
  int get dhikrIndex => _dhikrIndex;
  int get count => _count;
  int get sessionTotal => _sessionTotal;
  int get allTimeTotal => _allTimeTotal;
  bool get soundEnabled => _soundEnabled;
  String get selectedSoundId => _selectedSoundId;
  bool get tapHintShown => _tapHintShown;
  bool get canUndo => _undoSnapshot != null;

  DhikrItem get currentDhikr =>
      dhikrList[_dhikrIndex.clamp(0, dhikrList.length - 1)];

  int get roundTarget => dhikrList.fold<int>(0, (sum, d) => sum + d.target);

  String _dayKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> init() async {
    if (_ready) return;
    _prefs = await SharedPreferences.getInstance();

    final customJson = _prefs.getString(_keyCustomDhikr);
    if (customJson != null) {
      final list = jsonDecode(customJson) as List;
      _customDhikr = list
          .map((e) => DhikrItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    _dhikrIndex = _prefs.getInt(_keyDhikrIndex) ?? 0;
    _count = _prefs.getInt(_keyCount) ?? 0;
    _sessionTotal = _prefs.getInt(_keySessionTotal) ?? 0;
    _allTimeTotal = _prefs.getInt(_keyAllTimeTotal) ?? 0;
    _soundEnabled = _prefs.getBool(_keySoundEnabled) ?? false;
    final storedSoundId = _prefs.getString(_keySoundOption);
    if (storedSoundId != null && isValidTasbihSoundId(storedSoundId)) {
      _selectedSoundId = storedSoundId;
    }
    _tapHintShown = _prefs.getBool(_keyTapHintShown) ?? false;
    if (_dhikrIndex >= dhikrList.length) _dhikrIndex = 0;

    _ready = true;
    notifyListeners();
  }

  Future<void> _persistSession() async {
    if (!_ready) return;
    await _prefs.setInt(_keyDhikrIndex, _dhikrIndex);
    await _prefs.setInt(_keyCount, _count);
    await _prefs.setInt(_keySessionTotal, _sessionTotal);
    await _prefs.setInt(_keyAllTimeTotal, _allTimeTotal);
  }

  // These are read during the very first build of the tasbih screen, before
  // the async init() below has had a chance to resolve — must stay safe
  // (returning the same 0 default init() would have loaded anyway) even
  // when called before _prefs exists.
  int dailyTapsOn(DateTime day) =>
      !_ready ? 0 : _prefs.getInt('$_dailyTapsPrefix${_dayKey(day)}') ?? 0;

  int dailyRoundsOn(DateTime day) =>
      !_ready ? 0 : _prefs.getInt('$_dailyRoundsPrefix${_dayKey(day)}') ?? 0;

  /// Cheap enough to call on every rebuild (e.g. from a stats bar) — just a
  /// bounded backward walk through already-cached SharedPreferences reads.
  /// Same convention as StreakService: a streak in progress through
  /// yesterday still counts even if today hasn't been touched yet.
  int get currentStreak {
    if (!_ready) return 0;
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);
    int streak = 0;
    DateTime cursor = todayNorm.subtract(const Duration(days: 1));
    while (dailyTapsOn(cursor) > 0) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    if (dailyTapsOn(todayNorm) > 0) streak++;
    return streak;
  }

  /// Applies one tap: advances the count, persists it, and reports whether
  /// this tap just finished a dhikr (hit its target) or a full round (hit
  /// the combined target of every dhikr in the list). Saves a one-level
  /// undo snapshot of everything this call touches.
  TapResult tap() {
    if (!_ready) {
      return const TapResult(reachedDhikrTarget: false, completedRound: false);
    }
    final today = DateTime.now();
    final key = _dayKey(today);
    final dailyTapsBefore = dailyTapsOn(today);
    final dailyRoundsBefore = dailyRoundsOn(today);

    _undoSnapshot = _UndoSnapshot(
      dhikrIndex: _dhikrIndex,
      count: _count,
      sessionTotal: _sessionTotal,
      allTimeTotal: _allTimeTotal,
      dailyTaps: dailyTapsBefore,
      dailyRounds: dailyRoundsBefore,
    );

    _count++;
    _sessionTotal++;
    _allTimeTotal++;
    final reachedTarget = _count >= currentDhikr.target;
    final completedRound = _sessionTotal >= roundTarget;

    _prefs.setInt('$_dailyTapsPrefix$key', dailyTapsBefore + 1);
    if (completedRound) {
      _prefs.setInt('$_dailyRoundsPrefix$key', dailyRoundsBefore + 1);
    }
    _persistSession();
    notifyListeners();

    return TapResult(
      reachedDhikrTarget: reachedTarget,
      completedRound: completedRound,
    );
  }

  /// Called by the UI once its auto-advance animation delay elapses.
  /// No-ops if the state has since changed (e.g. the tap was undone),
  /// so a stale delayed call can never corrupt newer state.
  void advanceToNextDhikr() {
    if (_count < currentDhikr.target) return;
    if (_dhikrIndex >= dhikrList.length - 1) return;
    _dhikrIndex++;
    _count = 0;
    _persistSession();
    notifyListeners();
  }

  void undo() {
    if (!_ready) return;
    final snap = _undoSnapshot;
    if (snap == null) return;
    final key = _dayKey(DateTime.now());

    _dhikrIndex = snap.dhikrIndex;
    _count = snap.count;
    _sessionTotal = snap.sessionTotal;
    _allTimeTotal = snap.allTimeTotal;
    _prefs.setInt('$_dailyTapsPrefix$key', snap.dailyTaps);
    _prefs.setInt('$_dailyRoundsPrefix$key', snap.dailyRounds);
    _undoSnapshot = null;

    _persistSession();
    notifyListeners();
  }

  /// Resets the active dhikr/count back to the start of a new 99-count
  /// session. Daily/all-time stats are untouched — only "Reset" on the
  /// counter itself, not the user's history.
  void resetSession() {
    if (!_ready) return;
    _dhikrIndex = 0;
    _count = 0;
    _sessionTotal = 0;
    _undoSnapshot = null;
    _persistSession();
    notifyListeners();
  }

  Future<void> setSoundEnabled(bool value) async {
    _soundEnabled = value;
    notifyListeners();
    if (!_ready) return;
    await _prefs.setBool(_keySoundEnabled, value);
  }

  Future<void> setSelectedSound(String id) async {
    if (!isValidTasbihSoundId(id)) return;
    _selectedSoundId = id;
    notifyListeners();
    if (!_ready) return;
    await _prefs.setString(_keySoundOption, id);
  }

  Future<void> markTapHintShown() async {
    _tapHintShown = true;
    if (!_ready) return;
    await _prefs.setBool(_keyTapHintShown, true);
  }

  Future<void> _persistCustomDhikr() async {
    if (!_ready) return;
    final encoded = jsonEncode(_customDhikr.map((d) => d.toJson()).toList());
    await _prefs.setString(_keyCustomDhikr, encoded);
  }

  Future<void> addCustomDhikr(String name, String arabic) async {
    if (!_ready) return;
    final item = DhikrItem(
      id: 'custom_${DateTime.now().microsecondsSinceEpoch}',
      name: name.trim(),
      arabic: arabic.trim(),
      isCustom: true,
    );
    _customDhikr.add(item);
    await _persistCustomDhikr();
    notifyListeners();
  }

  /// Returns false (and changes nothing) if [id] is the only dhikr left.
  Future<bool> deleteCustomDhikr(String id) async {
    if (!_ready) return false;
    if (dhikrList.length <= 1) return false;
    final removedIndex = dhikrList.indexWhere((d) => d.id == id);
    if (removedIndex == -1) return false;

    _customDhikr.removeWhere((d) => d.id == id);
    await _persistCustomDhikr();

    if (_dhikrIndex >= dhikrList.length) {
      _dhikrIndex = dhikrList.length - 1;
      _count = 0;
    } else if (removedIndex < _dhikrIndex) {
      _dhikrIndex--;
    }
    _undoSnapshot = null;

    await _persistSession();
    notifyListeners();
    return true;
  }

  Future<TasbihStats> getStats() async {
    if (!_ready) await init();
    final today = DateTime.now();
    final todayNorm = DateTime(today.year, today.month, today.day);

    final last7Days = <int>[];
    for (int i = 6; i >= 0; i--) {
      last7Days.add(dailyTapsOn(todayNorm.subtract(Duration(days: i))));
    }

    final streak = currentStreak;

    final activeDays = <DateTime>{};
    for (final k in _prefs.getKeys()) {
      if (!k.startsWith(_dailyTapsPrefix)) continue;
      final value = _prefs.getInt(k) ?? 0;
      if (value <= 0) continue;
      final parts = k.substring(_dailyTapsPrefix.length).split('-');
      if (parts.length != 3) continue;
      final y = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      final d = int.tryParse(parts[2]);
      if (y == null || m == null || d == null) continue;
      activeDays.add(DateTime(y, m, d));
    }
    final sortedDays = activeDays.toList()..sort();
    int longestStreak = streak;
    int run = 0;
    DateTime? prev;
    for (final day in sortedDays) {
      run = (prev != null && day.difference(prev).inDays == 1) ? run + 1 : 1;
      if (run > longestStreak) longestStreak = run;
      prev = day;
    }

    return TasbihStats(
      allTimeTotal: _allTimeTotal,
      todayTaps: dailyTapsOn(todayNorm),
      todayRounds: dailyRoundsOn(todayNorm),
      currentStreak: streak,
      longestStreak: longestStreak,
      last7Days: last7Days,
    );
  }
}
