import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'geometric_pattern_painter.dart';

const _kNavy   = Color(0xFF0D1B2A);
const _kGold   = Color(0xFFC9A84C);
const _kCream  = Color(0xFFF5EFE6);

/// Rendered off-screen and captured by [ScreenshotController].
/// All localised strings must be resolved by the caller and passed in.
class ShareCardWidget extends StatelessWidget {
  final String typeLabel;      // e.g. "✦ Ayah of the Day"
  final String arabic;
  final String transliteration;
  final String translation;
  final String source;
  final String brandingLabel;  // e.g. "Shared via Noor Guard"

  const ShareCardWidget({
    super.key,
    required this.typeLabel,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.source,
    required this.brandingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _kGold.withValues(alpha: 0.55), width: 1.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Stack(
            children: [
              // Geometric watermark
              const Positioned.fill(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.09),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Type label
                    Text(
                      typeLabel,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _kGold,
                        letterSpacing: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Arabic text
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        arabic,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 26,
                          color: _kGold,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Gold divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.8,
                            color: _kGold.withValues(alpha: 0.45),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: _kGold,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 0.8,
                            color: _kGold.withValues(alpha: 0.45),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Transliteration
                    Text(
                      transliteration,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: _kCream.withValues(alpha: 0.75),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Translation
                    Text(
                      translation,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: _kCream,
                        height: 1.55,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    // Source
                    Text(
                      source,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: _kGold.withValues(alpha: 0.80),
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Divider before branding
                    Container(
                      height: 0.5,
                      color: _kGold.withValues(alpha: 0.25),
                    ),
                    const SizedBox(height: 16),
                    // Branding row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.nightlight_round,
                          color: _kGold,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'NOOR GUARD',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          brandingLabel,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            color: _kCream.withValues(alpha: 0.50),
                          ),
                        ),
                      ],
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
