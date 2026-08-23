import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/asma_ul_husna_screen.dart';
import '../screens/duas_screen.dart';
import '../screens/hadith_detail_screen.dart';
import '../screens/islamic_glossary_screen.dart';
import '../screens/surah_screen.dart';
import 'quran_service.dart';

/// Routes a tap on the Noor Guard Live notification to the specific content
/// it was showing: ayah → Quran reader at that verse, dua → Duas screen
/// scrolled to that dua, glossary word → Islamic Glossary scrolled to that
/// term, Name of Allah → 99 Names scrolled to that name, hadith → a
/// lightweight single-hadith detail view. Anything unrecognized simply opens
/// the app at the home screen.
///
/// The native side attaches `noor_nav_type`/`noor_nav_data` extras to the
/// notification's launch intent (PrayerForegroundService); MainActivity's
/// `getPendingNotificationNav` hands them over exactly once. Two entry
/// points cover both launch shapes:
///  * cold start — the splash screen calls [onHomeReady] right after it
///    lands on a home screen, so navigation happens on top of home;
///  * warm tap (app already running) — the lifecycle observer sees the
///    `resumed` event that follows MainActivity's onNewIntent.
class NotificationNavService with WidgetsBindingObserver {
  NotificationNavService._();
  static final NotificationNavService instance = NotificationNavService._();

  /// Attached to the root MaterialApp so navigation works from anywhere,
  /// regardless of which screen the user was on when they tapped.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const _channel = MethodChannel('adhan_control');

  /// Set once the splash screen has landed on a home screen. Until then the
  /// navigator is still showing the splash (or onboarding), so the pending
  /// nav extras are deliberately left unconsumed on the native side.
  bool _homeReady = false;
  bool _checking = false;

  /// Payload from a flutter_local_notifications tap (prayer reminder /
  /// silent banner) that arrived before a home screen was up — e.g. the tap
  /// that cold-started the app. Consumed by [onHomeReady].
  String? _pendingLocalPayload;

  void init() {
    if (kIsWeb || !Platform.isAndroid) return;
    WidgetsBinding.instance.addObserver(this);
  }

  /// Called by the splash screen after it has replaced itself with a home
  /// screen — the earliest moment a content screen can be pushed on top.
  void onHomeReady() {
    if (kIsWeb) return;
    _homeReady = true;
    // Live-notification extras are Android-only; plugin payloads (below)
    // exist on both platforms.
    if (Platform.isAndroid) _checkPending();
    final payload = _pendingLocalPayload;
    _pendingLocalPayload = null;
    if (payload != null) _handleLocalPayload(payload);
  }

  /// Entry point for taps on plugin-shown notifications (the 15-minute
  /// prayer reminder, the silent banner, and — iOS only — the pre-scheduled
  /// Fajr content notifications, on Android AND iOS). Payload format is
  /// `<type>:<data>`, the same `type`/`data` pair the Android live
  /// notification's extras carry (see [_navigate]) — `verse:<surah>:<ayah>`
  /// is kept as a longstanding alias for `ayah:<surah>:<ayah>`. Anything
  /// unrecognized is ignored (the app just opens normally).
  void handleNotificationPayload(String? payload) {
    if (kIsWeb || payload == null || payload.isEmpty) return;
    if (_homeReady) {
      _handleLocalPayload(payload);
    } else {
      _pendingLocalPayload = payload;
    }
  }

  Future<void> _handleLocalPayload(String payload) async {
    if (payload.startsWith('verse:')) {
      await _openAyah(payload.substring('verse:'.length));
      return;
    }
    final separator = payload.indexOf(':');
    if (separator == -1) return;
    await _navigate(
      payload.substring(0, separator),
      payload.substring(separator + 1),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _homeReady) _checkPending();
  }

  Future<void> _checkPending() async {
    if (_checking) return;
    _checking = true;
    try {
      final result = await _channel
          .invokeMethod<Map<Object?, Object?>>('getPendingNotificationNav');
      if (result == null) return;
      final type = result['type'] as String? ?? '';
      final data = result['data'] as String? ?? '';
      await _navigate(type, data);
    } catch (e) {
      debugPrint('NotificationNavService: nav check failed: $e');
    } finally {
      _checking = false;
    }
  }

  Future<void> _navigate(String type, String data) async {
    switch (type) {
      case 'ayah':
        await _openAyah(data);
      case 'dua':
        if (data.isNotEmpty) {
          _push(DuasScreen(initialDuaArabic: data));
        }
      case 'glossary':
        if (data.isNotEmpty) {
          _push(IslamicGlossaryScreen(initialTerm: data));
        }
      case 'asma':
        final number = int.tryParse(data);
        if (number != null) {
          _push(AsmaUlHusnaScreen(initialNameNumber: number));
        }
      case 'hadith':
        final index = int.tryParse(data);
        if (index != null) {
          _push(HadithDetailScreen(hadithIndex: index));
        }
      default:
        // Missing/unknown data — the app already opened at the home screen,
        // which is the fallback.
        break;
    }
  }

  /// [data] is "surah:ayah" (e.g. "2:238"). The surah list comes from the
  /// same fetch the Quran tab uses; if it can't be loaded (offline), the tap
  /// falls back to the home screen the app already opened on.
  Future<void> _openAyah(String data) async {
    final parts = data.split(':');
    if (parts.length != 2) return;
    final surahNumber = int.tryParse(parts[0]);
    final verseNumber = int.tryParse(parts[1]);
    if (surahNumber == null || verseNumber == null) return;

    final surahs = await fetchSurahs();
    final matches = surahs.where((s) => s.number == surahNumber);
    if (matches.isEmpty) {
      debugPrint('NotificationNavService: surah $surahNumber unavailable '
          '(offline?), staying on home');
      return;
    }
    _push(SurahScreen(surah: matches.first, initialVerseNumber: verseNumber));
  }

  void _push(Widget screen) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
