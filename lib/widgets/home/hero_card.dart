import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

const _kMosqueImages = [
  'assets/images/mosques/mosque_1.jpg',
  'assets/images/mosques/mosque_2.jpg',
  'assets/images/mosques/mosque_3.jpg',
  'assets/images/mosques/mosque_4.jpg',
  'assets/images/mosques/mosque_5.jpg',
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
      if (mounted) setState(() => _index = (_index + 1) % _kMosqueImages.length);
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
                  _kMosqueImages[_index],
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
                      Colors.black.withOpacity(0.32),
                      Colors.black.withOpacity(0.10),
                      Colors.black.withOpacity(0.58),
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
                        Colors.black.withOpacity(0.68),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Verse text — bottom left
              Positioned(
                bottom: 20,
                left: 22,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '"${l10n.guardStrictlyYourPrayers}"',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      l10n.alBaqarah2238,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.85),
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
            ],
          ),
        ),
      ),
    );
  }
}
