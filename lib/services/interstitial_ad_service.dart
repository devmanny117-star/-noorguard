import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Loads and shows interstitial ads on demand via [showAdIfReady].
///
/// Gated the same way as `BannerAdWidget`: hidden until [_adDelay] has
/// passed since 'install_date' (SharedPreferences), and hidden entirely for
/// Premium users via the 'is_premium' placeholder bool — no real
/// purchase/entitlement system exists yet.
class InterstitialAdService {
  static final InterstitialAdService _instance =
      InterstitialAdService._internal();
  factory InterstitialAdService() => _instance;
  InterstitialAdService._internal();

  // TODO: change to `Duration(days: 5)` once install-date gating is verified
  // on device; 10 seconds is only for fast testing.
  static const _adDelay = Duration(seconds: 10);

  static String get _adUnitId => Platform.isIOS
      ? 'ca-app-pub-1882227858220460/7137362753' // Noor Guard interstitial (iOS)
      : 'ca-app-pub-3940256099942544/1033173712'; // Google test interstitial (Android)

  // In-memory only — resets on app restart, which is the point: each
  // trigger point gets one shot per session, not once ever.
  final Set<String> _shownThisSession = {};

  /// Loads and immediately shows an interstitial for [triggerKey], unless
  /// it has already shown for that key this session, the user is Premium,
  /// or the install-date grace period hasn't elapsed yet. Safe to call
  /// anywhere — silently does nothing when not eligible.
  Future<void> showAdIfReady(String triggerKey) async {
    if (kIsWeb) return; // google_mobile_ads has no web implementation.
    if (_shownThisSession.contains(triggerKey)) return;
    if (!await _isEligible()) return;

    // Marked consumed as soon as eligibility passes, so a rapid re-entry
    // into the same trigger point (e.g. back-and-forth navigation) can't
    // queue a second load while this one is in flight.
    _shownThisSession.add(triggerKey);
    await _loadAndShow();
  }

  Future<bool> _isEligible() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('is_premium') ?? false) return false;

    var installDateMs = prefs.getInt('install_date');
    if (installDateMs == null) {
      installDateMs = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt('install_date', installDateMs);
    }
    final installDate = DateTime.fromMillisecondsSinceEpoch(installDateMs);
    return DateTime.now().difference(installDate) >= _adDelay;
  }

  Future<void> _loadAndShow() async {
    await InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) => ad.dispose(),
            onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
          );
          ad.show();
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }
}
