import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import 'crescent_star_painter.dart';

const _kNavy = Color(0xFF0D1B2A);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

/// One-time popup explaining Noor Guard's ad model, shown the first time the
/// user reaches the home screen after finishing onboarding. Persists
/// 'ad_notice_shown' in SharedPreferences so it never appears again once
/// dismissed.
class AdNoticeDialog {
  AdNoticeDialog._();

  static Future<void> maybeShow(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('ad_notice_shown') ?? false) return;
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => const _AdNoticeDialogContent(),
    );
    await prefs.setBool('ad_notice_shown', true);
  }
}

class _AdNoticeDialogContent extends StatelessWidget {
  const _AdNoticeDialogContent();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bullets = [
      l10n.adNoticeBulletHalalAds,
      l10n.adNoticeBulletNoSellData,
      l10n.adNoticeBulletCommunityPremium,
      l10n.adNoticeBulletUpgradePremium,
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _kGold.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Crescent + star icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1E2E1E),
                border: Border.all(
                  color: _kGold.withValues(alpha: 0.33),
                  width: 1.5,
                ),
              ),
              child: const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CustomPaint(painter: CrescentStarPainter()),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              l10n.adNoticeTitle,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _kGold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              l10n.adNoticeSubtitle,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: _kCream.withValues(alpha: 0.65),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final bullet in bullets) _BulletRow(text: bullet),
              ],
            ),

            const SizedBox(height: 18),

            Text(
              l10n.adNoticeThanks,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: _kGold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: _kGold,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    l10n.adNoticeGotIt,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _kNavy,
                      letterSpacing: 0.3,
                    ),
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

class _BulletRow extends StatelessWidget {
  final String text;
  const _BulletRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✦',
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 13.5,
                color: _kCream.withValues(alpha: 0.85),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
