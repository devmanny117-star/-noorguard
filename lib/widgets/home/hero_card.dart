import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

// Each slide pairs one image with one Quran verse so both rotate together.
typedef _Slide = ({String image, String verse, String ref});

const int _kSlideCount = 15;

List<_Slide> _buildSlides(AppLocalizations l10n) => [
  (image: 'assets/images/mosques/mosque_1.jpg', verse: l10n.heroVerse1,  ref: 'Al-Baqarah 2:238'),
  (image: 'assets/images/mosques/mosque_2.jpg', verse: l10n.heroVerse2,  ref: 'An-Nisaʼ 4:103'),
  (image: 'assets/images/mosques/mosque_3.jpg', verse: l10n.heroVerse3,  ref: 'Al-Baqarah 2:45'),
  (image: 'assets/images/mosques/mosque_4.jpg', verse: l10n.heroVerse4,  ref: 'Al-Baqarah 2:152'),
  (image: 'assets/images/mosques/mosque_5.jpg', verse: l10n.heroVerse5,  ref: 'At-Talaq 65:3'),
  (image: 'assets/images/mosques/mosque_6.jpg', verse: l10n.heroVerse6,  ref: 'Ali ʼImran 3:96'),   // Kaaba during Hajj
  (image: 'assets/images/mosques/mosque_7.jpg', verse: l10n.heroVerse7,  ref: 'Al-ʻAnkabut 29:45'), // Prophet's Mosque interior
  (image: 'assets/images/mosques/mosque_8.jpg', verse: l10n.heroVerse8,  ref: 'Ar-Raʻd 13:28'),    // Blue Mosque interior
  (image: 'assets/images/mosques/mosque_1.jpg', verse: l10n.heroVerse9,  ref: 'Ghafir 40:60'),
  (image: 'assets/images/mosques/mosque_2.jpg', verse: l10n.heroVerse10, ref: 'Ibrahim 14:7'),
  (image: 'assets/images/mosques/mosque_3.jpg', verse: l10n.heroVerse11, ref: 'Al-Baqarah 2:286'),
  (image: 'assets/images/mosques/mosque_4.jpg', verse: l10n.heroVerse12, ref: 'Al-Baqarah 2:153'),
  (image: 'assets/images/mosques/mosque_5.jpg', verse: l10n.heroVerse13, ref: 'Al-Aʻraf 7:156'),
  (image: 'assets/images/mosques/mosque_6.jpg', verse: l10n.heroVerse14, ref: 'Al-Baqarah 2:195'),
  (image: 'assets/images/mosques/mosque_7.jpg', verse: l10n.heroVerse15, ref: 'Al-Baqarah 2:2'),
];

class HeroCard extends StatefulWidget {
  const HeroCard({super.key});

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (mounted) setState(() => _index = (_index + 1) % _kSlideCount);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final slide = _buildSlides(l10n)[_index];
    // Android text is slightly larger for readability on the wider range of
    // screen densities and OEM fonts encountered on Android devices.
    final bool isAndroid = !kIsWeb && Platform.isAndroid;
    final double verseSize = isAndroid ? 15.5 : 13.5;
    final double refSize = isAndroid ? 12.5 : 11.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 230,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Auto-rotating mosque photos with crossfade
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 900),
                layoutBuilder: (current, previous) => Stack(
                  fit: StackFit.expand,
                  children: [
                    ...previous,
                    if (current != null) current,
                  ],
                ),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: Image.asset(
                  slide.image,
                  key: ValueKey(_index),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),

              // Dark gradient overlay — keeps text readable across all photos
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.32),
                      Colors.black.withValues(alpha: 0.10),
                      Colors.black.withValues(alpha: 0.58),
                    ],
                    stops: const [0.0, 0.42, 1.0],
                  ),
                ),
              ),

              // Bottom gradient for text legibility
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 110,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.68),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Verse text — bottom left, crossfades with the image
              Positioned(
                bottom: 20,
                left: 22,
                right: 80,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    key: ValueKey(_index),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '"${slide.verse}"',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: verseSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        slide.ref,
                        style: GoogleFonts.lato(
                          fontSize: refSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.85),
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 40,
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
