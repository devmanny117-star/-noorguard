import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../l10n/app_localizations.dart';
import '../services/premium_service.dart';
import '../theme/app_theme.dart';
import 'geometric_pattern_painter.dart';

const _navy = Color(0xFF0D1B2A);
const _cream = AppColors.cream;

/// "Unlock Premium" paywall shown when a free user taps a Premium-gated
/// feature. Fetches live monthly/annual pricing from the App Store / Play
/// Store and runs the real purchase (and Apple-required restore) flow via
/// [PremiumService]; falls back to a plain "pricing unavailable" message if
/// the store can't be reached or the products aren't configured yet.
class PremiumUpgradeDialog extends StatefulWidget {
  final String featureName;
  final String featureDescription;

  const PremiumUpgradeDialog({
    super.key,
    required this.featureName,
    required this.featureDescription,
  });

  /// Convenience helper to show the dialog.
  static Future<void> show(
    BuildContext context, {
    required String featureName,
    required String featureDescription,
  }) {
    return showDialog(
      context: context,
      builder: (_) => PremiumUpgradeDialog(
        featureName: featureName,
        featureDescription: featureDescription,
      ),
    );
  }

  @override
  State<PremiumUpgradeDialog> createState() => _PremiumUpgradeDialogState();
}

class _PremiumUpgradeDialogState extends State<PremiumUpgradeDialog> {
  List<ProductDetails> _products = [];
  bool _loadingProducts = true;

  /// Which action is currently in flight — a specific product id being
  /// purchased, or the literal 'restore' — so only that button spins and
  /// every button is disabled for the duration.
  String? _busyAction;
  String? _inlineError;

  StreamSubscription<PremiumPurchaseEvent>? _eventsSub;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _eventsSub = PremiumService.instance.events.listen(_onPurchaseEvent);
  }

  @override
  void dispose() {
    _eventsSub?.cancel();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    final products = await PremiumService.instance.queryProducts();
    if (!mounted) return;
    setState(() {
      _products = products;
      _loadingProducts = false;
    });
  }

  void _onPurchaseEvent(PremiumPurchaseEvent event) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    final wasRestore = _busyAction == 'restore';
    switch (event) {
      case PremiumPurchaseEvent.purchased:
        final messenger = ScaffoldMessenger.maybeOf(context);
        Navigator.of(context).pop();
        messenger?.showSnackBar(SnackBar(
          content: Text(l10n.premiumStatusActive,
              style: GoogleFonts.lato(color: Colors.white)),
          backgroundColor: const Color(0xFF2C2C2A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ));
      case PremiumPurchaseEvent.restoredNothing:
        setState(() {
          _busyAction = null;
          _inlineError = l10n.premiumRestoreNone;
        });
      case PremiumPurchaseEvent.error:
        setState(() {
          _busyAction = null;
          _inlineError = wasRestore ? l10n.premiumRestoreError : l10n.premiumPurchaseError;
        });
      case PremiumPurchaseEvent.canceled:
        setState(() => _busyAction = null);
    }
  }

  Future<void> _buy(ProductDetails product) async {
    setState(() {
      _busyAction = product.id;
      _inlineError = null;
    });
    await PremiumService.instance.buy(product);
  }

  Future<void> _restore() async {
    setState(() {
      _busyAction = 'restore';
      _inlineError = null;
    });
    await PremiumService.instance.restore();
  }

  ProductDetails? _findProduct(String id) {
    for (final p in _products) {
      if (p.id == id) return p;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final annual = _findProduct(PremiumService.annualProductId);
    final monthly = _findProduct(PremiumService.monthlyProductId);
    final busy = _busyAction != null;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF16283F), _navy],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.gold.withValues(alpha: 0.35),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(alpha: 0.05),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Gold lock icon.
                    Center(
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gold.withValues(alpha: 0.14),
                          border: Border.all(
                            color: AppColors.gold.withValues(alpha: 0.55),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold.withValues(alpha: 0.30),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.lock_rounded,
                          color: AppColors.gold,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Title.
                    Text(
                      l10n.premiumUnlock,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.gold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Feature name.
                    Text(
                      widget.featureName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gold.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Feature description.
                    Text(
                      widget.featureDescription,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        height: 1.4,
                        color: _cream.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 22),
                    // Plan buttons — live pricing from the store, or a
                    // graceful fallback if it can't be reached.
                    if (_loadingProducts)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Center(
                          child: SizedBox(
                            width: 26,
                            height: 26,
                            child: CircularProgressIndicator(
                              color: AppColors.gold,
                              strokeWidth: 2.5,
                            ),
                          ),
                        ),
                      )
                    else if (annual == null && monthly == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          l10n.premiumProductsUnavailable,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: _cream.withValues(alpha: 0.7),
                          ),
                        ),
                      )
                    else ...[
                      if (annual != null)
                        _PlanButton(
                          label: l10n.premiumAnnualPlan,
                          price: annual.price,
                          badge: l10n.premiumBestValue,
                          primary: true,
                          busy: _busyAction == annual.id,
                          disabled: busy,
                          onPressed: () => _buy(annual),
                        ),
                      if (monthly != null)
                        _PlanButton(
                          label: l10n.premiumMonthlyPlan,
                          price: monthly.price,
                          primary: false,
                          busy: _busyAction == monthly.id,
                          disabled: busy,
                          onPressed: () => _buy(monthly),
                        ),
                    ],
                    if (_inlineError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 4),
                        child: Text(
                          _inlineError!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent.shade100,
                          ),
                        ),
                      ),
                    const SizedBox(height: 6),
                    // Restore purchases — required by Apple, so it's always
                    // reachable from the paywall regardless of whether live
                    // pricing loaded.
                    Center(
                      child: TextButton(
                        onPressed: busy ? null : _restore,
                        child: _busyAction == 'restore'
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.gold,
                                ),
                              )
                            : Text(
                                l10n.premiumRestorePurchases,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gold.withValues(alpha: 0.75),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Maybe later button.
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.gold,
                          side: BorderSide(
                            color: AppColors.gold.withValues(alpha: 0.55),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          l10n.premiumMaybeLater,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One purchasable plan row: label + live store price, an optional "Best
/// Value" badge (annual), and a loading state while its purchase is in
/// flight.
class _PlanButton extends StatelessWidget {
  final String label;
  final String price;
  final String? badge;
  final bool primary;
  final bool busy;
  final bool disabled;
  final VoidCallback onPressed;

  const _PlanButton({
    required this.label,
    required this.price,
    this.badge,
    required this.primary,
    required this.busy,
    required this.disabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final child = busy
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: primary ? _navy : AppColors.gold,
            ),
          )
        : Text(
            '$label • $price',
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: primary ? FontWeight.w700 : FontWeight.w600,
              letterSpacing: 0.3,
            ),
          );

    final button = primary
        ? ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: _navy,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: child,
          )
        : OutlinedButton(
            onPressed: disabled ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.gold,
              side: BorderSide(color: AppColors.gold.withValues(alpha: 0.55)),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: child,
          );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: badge == null
            ? button
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  button,
                  PositionedDirectional(
                    top: -10,
                    end: 12,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _navy,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.gold.withValues(alpha: 0.6),
                        ),
                      ),
                      child: Text(
                        badge!,
                        style: GoogleFonts.lato(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
