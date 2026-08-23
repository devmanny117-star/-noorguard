import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Reusable banner ad. Hidden until [_adDelay] has passed since first
/// launch, and hidden entirely for Premium users.
///
/// Premium is checked via the 'is_premium' SharedPreferences bool. No real
/// purchase/entitlement system exists yet, so this is a placeholder — flip
/// it manually for testing until one is built.
class BannerAdWidget extends StatefulWidget {
  /// Fires once, the moment an ad actually loads and starts rendering (never
  /// with `false` — this widget never un-shows an ad once loaded). Lets a
  /// parent that reserves fixed layout space for this widget (e.g. a
  /// scroll view's bottom padding) react to whether an ad will actually
  /// occupy that space, instead of assuming premium-status alone decides it
  /// (the ad-delay window and network load can both still resolve to "no
  /// ad" for a free user).
  final ValueChanged<bool>? onVisibilityChanged;

  const BannerAdWidget({super.key, this.onVisibilityChanged});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  static const _adDelay = Duration(days: 3);

  static String get _adUnitId => Platform.isIOS
      ? 'ca-app-pub-1882227858220460/9909343247' // Noor Guard banner (iOS)
      : 'ca-app-pub-3940256099942544/6300978111'; // Google test banner (Android)

  BannerAd? _bannerAd;
  bool _shouldShow = false;

  @override
  void initState() {
    super.initState();
    // google_mobile_ads has no web implementation — mobile only.
    if (!kIsWeb) _evaluate();
  }

  Future<void> _evaluate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('is_premium') ?? false) return;

    var installDateMs = prefs.getInt('install_date');
    if (installDateMs == null) {
      installDateMs = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt('install_date', installDateMs);
    }
    final installDate = DateTime.fromMillisecondsSinceEpoch(installDateMs);
    if (DateTime.now().difference(installDate) < _adDelay) return;

    if (!mounted) return;
    _loadAd();
  }

  Future<void> _loadAd() async {
    final width = MediaQuery.sizeOf(context).width.truncate();
    final size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(width);
    if (size == null || !mounted) return;

    BannerAd(
      adUnitId: _adUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
            _shouldShow = true;
          });
          widget.onVisibilityChanged?.call(true);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _bannerAd;
    if (!_shouldShow || ad == null) return const SizedBox.shrink();
    return Center(
      child: SizedBox(
        width: ad.size.width.toDouble(),
        height: ad.size.height.toDouble(),
        child: AdWidget(ad: ad),
      ),
    );
  }
}
