import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';

// Each slide pairs one image with one Quran verse so both rotate together.
typedef _Slide = ({String image, String verse, String ref});

const List<_Slide> _kSlides = [
  (
    image: 'assets/images/mosques/mosque_1.jpg',
    verse: 'Guard strictly your prayers, especially the middle prayer.',
    ref: 'Al-Baqarah 2:238',
  ),
  (
    image: 'assets/images/mosques/mosque_2.jpg',
    verse: 'Indeed, prayer has been decreed upon the believers a decree of specified times.',
    ref: 'An-Nisaʼ 4:103',
  ),
  (
    image: 'assets/images/mosques/mosque_3.jpg',
    verse: 'And seek help through patience and prayer.',
    ref: 'Al-Baqarah 2:45',
  ),
  (
    image: 'assets/images/mosques/mosque_4.jpg',
    verse: 'So remember Me; I will remember you. And be grateful to Me and do not deny Me.',
    ref: 'Al-Baqarah 2:152',
  ),
  (
    image: 'assets/images/mosques/mosque_5.jpg',
    verse: 'And whoever relies upon Allah — then He is sufficient for him.',
    ref: 'At-Talaq 65:3',
  ),
  (
    image: 'assets/images/mosques/mosque_6.jpg', // Kaaba during Hajj
    verse: 'Indeed, the first House established for mankind was that at Makkah — blessed and a guidance for the worlds.',
    ref: 'Ali ʼImran 3:96',
  ),
  (
    image: 'assets/images/mosques/mosque_7.jpg', // Prophet's Mosque interior — worshippers praying
    verse: 'Indeed, prayer prohibits immorality and wrongdoing, and the remembrance of Allah is greater.',
    ref: 'Al-ʻAnkabut 29:45',
  ),
  (
    image: 'assets/images/mosques/mosque_8.jpg', // Blue Mosque interior
    verse: 'Verily, in the remembrance of Allah do hearts find rest.',
    ref: 'Ar-Raʻd 13:28',
  ),
  (
    image: 'assets/images/mosques/mosque_1.jpg',
    verse: 'Call upon Me; I will respond to you.',
    ref: 'Ghafir 40:60',
  ),
  (
    image: 'assets/images/mosques/mosque_2.jpg',
    verse: 'If you are grateful, I will surely increase you in favor.',
    ref: 'Ibrahim 14:7',
  ),
  (
    image: 'assets/images/mosques/mosque_3.jpg',
    verse: 'Allah does not burden a soul beyond that it can bear.',
    ref: 'Al-Baqarah 2:286',
  ),
  (
    image: 'assets/images/mosques/mosque_4.jpg',
    verse: 'Indeed, Allah is with the patient.',
    ref: 'Al-Baqarah 2:153',
  ),
  (
    image: 'assets/images/mosques/mosque_5.jpg',
    verse: 'My mercy encompasses all things.',
    ref: 'Al-Aʻraf 7:156',
  ),
  (
    image: 'assets/images/mosques/mosque_6.jpg',
    verse: 'And do good; indeed, Allah loves the doers of good.',
    ref: 'Al-Baqarah 2:195',
  ),
  (
    image: 'assets/images/mosques/mosque_7.jpg',
    verse: 'This is the Book about which there is no doubt, a guidance for those conscious of Allah.',
    ref: 'Al-Baqarah 2:2',
  ),
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
      if (mounted) setState(() => _index = (_index + 1) % _kSlides.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slide = _kSlides[_index];
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
