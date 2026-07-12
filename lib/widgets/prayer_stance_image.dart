import 'package:flutter/material.dart';

/// The four physical stances illustrated on the combined sprite sheet
/// `assets/images/prayer/prayer_stances.png` (four gold figures side by
/// side: standing, bowing, prostrating, sitting).
enum PrayerStance { standing, bowing, prostrating, sitting }

/// Shows a single stance cropped out of the combined sheet.
///
/// The sheet holds the four stances in equal quarters, so each one is
/// isolated by rendering the full image and clipping to a quarter-width
/// window aligned over the wanted figure — no separate image files needed.
class PrayerStanceImage extends StatelessWidget {
  final PrayerStance stance;
  final double height;

  const PrayerStanceImage({
    super.key,
    required this.stance,
    this.height = 180,
  });

  static const Map<PrayerStance, Alignment> _alignments = {
    PrayerStance.standing: Alignment(-1.0, 0.0), // leftmost quarter
    PrayerStance.bowing: Alignment(-0.33, 0.0), // second quarter
    PrayerStance.prostrating: Alignment(0.33, 0.0), // third quarter
    PrayerStance.sitting: Alignment(1.0, 0.0), // rightmost quarter
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ClipRect(
          child: Align(
            alignment: _alignments[stance]!,
            widthFactor: 0.25,
            child: Image.asset(
              'assets/images/prayer/prayer_stances.png',
              height: height,
              fit: BoxFit.contain,
              // If the sheet ever fails to load, collapse quietly rather
              // than showing a broken-image placeholder mid-lesson.
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
