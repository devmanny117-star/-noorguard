import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Outcome of a purchase or restore attempt, broadcast on [PremiumService.events]
/// so the paywall UI can react (close itself, show an error) without polling
/// SharedPreferences.
enum PremiumPurchaseEvent {
  /// A purchase (or a restore that found at least one purchase) completed —
  /// `is_premium` is now true.
  purchased,

  /// A restore completed but found nothing to restore. Not an error: the
  /// user simply has no prior purchase on this Apple/Google account.
  restoredNothing,

  /// The purchase or restore failed.
  error,

  /// The user dismissed the platform purchase sheet without buying.
  canceled,
}

/// Wraps the `in_app_purchase` plugin for Noor Guard's two subscription
/// products, and is the single place that flips the `is_premium`
/// SharedPreferences flag every other screen already reads (see
/// `prefs.getBool('is_premium')` in surah_screen.dart, settings_screen.dart,
/// adhan_screen.dart, community_stories_screen.dart, feature_grid.dart,
/// banner_ad_widget.dart, interstitial_ad_service.dart) — none of those
/// call sites change; this service is only responsible for *setting* the
/// flag correctly from a real purchase instead of it staying permanently
/// false.
class PremiumService {
  PremiumService._();
  static final PremiumService instance = PremiumService._();

  static const String monthlyProductId = 'com.noorguard.app.premium.monthly';
  static const String annualProductId = 'com.noorguard.app.premium.annual';
  static const Set<String> productIds = {monthlyProductId, annualProductId};

  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  bool _initialized = false;

  final _eventsController = StreamController<PremiumPurchaseEvent>.broadcast();

  /// Broadcasts the outcome of whatever purchase/restore is currently in
  /// flight. The paywall dialog listens to this while a button shows a
  /// loading spinner; nothing else in the app needs to.
  Stream<PremiumPurchaseEvent> get events => _eventsController.stream;

  /// The most recent [IAPError] message, set right before an
  /// [PremiumPurchaseEvent.error] event — for UI that wants the raw detail
  /// beyond the generic "purchase failed" copy.
  String? lastErrorMessage;

  /// Starts listening to the platform purchase stream. Must be called once,
  /// early at app startup (see main.dart) — the plugin docs warn that
  /// purchases made before a listener is attached (e.g. a purchase that
  /// didn't finish last session) are only redelivered to a listener that was
  /// already subscribed when the app resumes.
  void init() {
    if (_initialized || kIsWeb) return;
    _initialized = true;
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (Object e) => debugPrint('PremiumService: purchase stream error: $e'),
    );
  }

  void dispose() {
    _subscription?.cancel();
    _eventsController.close();
  }

  Future<bool> isAvailable() => _iap.isAvailable();

  /// Fetches live prices for [productIds] from the App Store / Play Store.
  /// Returns an empty list (never throws) if the store is unreachable or the
  /// products aren't configured yet — callers fall back to static pricing
  /// copy in that case.
  Future<List<ProductDetails>> queryProducts() async {
    try {
      if (!await _iap.isAvailable()) return const [];
      final response = await _iap.queryProductDetails(productIds);
      if (response.notFoundIDs.isNotEmpty) {
        debugPrint('PremiumService: products not found in store: ${response.notFoundIDs}');
      }
      return response.productDetails;
    } catch (e) {
      debugPrint('PremiumService: queryProducts failed: $e');
      return const [];
    }
  }

  /// Starts the platform purchase sheet for [product]. The outcome arrives
  /// asynchronously on [events] — this only reports whether the request was
  /// *sent*, not whether it succeeded.
  Future<void> buy(ProductDetails product) async {
    final param = PurchaseParam(productDetails: product);
    try {
      await _iap.buyNonConsumable(purchaseParam: param);
    } catch (e) {
      lastErrorMessage = e.toString();
      _eventsController.add(PremiumPurchaseEvent.error);
    }
  }

  /// Required by Apple: lets a user who already bought Premium (e.g. on a
  /// previous install, or another device signed into the same Apple ID)
  /// unlock it again without paying twice. Outcome arrives on [events].
  Future<void> restore() async {
    try {
      await _iap.restorePurchases();
      // restorePurchases() doesn't itself signal "nothing found" — give the
      // platform a moment to redeliver any restored purchases via
      // purchaseStream, then treat silence as "nothing to restore".
      await Future.delayed(const Duration(seconds: 2));
      if (!(await _isPremium())) {
        _eventsController.add(PremiumPurchaseEvent.restoredNothing);
      }
    } catch (e) {
      lastErrorMessage = e.toString();
      _eventsController.add(PremiumPurchaseEvent.error);
    }
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          await _grantPremium();
          _eventsController.add(PremiumPurchaseEvent.purchased);
        case PurchaseStatus.error:
          lastErrorMessage = purchase.error?.message;
          _eventsController.add(PremiumPurchaseEvent.error);
        case PurchaseStatus.canceled:
          _eventsController.add(PremiumPurchaseEvent.canceled);
        case PurchaseStatus.pending:
          break;
      }
      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> _grantPremium() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_premium', true);
  }

  Future<bool> _isPremium() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_premium') ?? false;
  }
}
