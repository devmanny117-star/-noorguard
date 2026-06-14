import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/prayer_state.dart';
import '../l10n/app_localizations.dart';

String _localizedPrayerName(AppLocalizations l10n, String name) {
  switch (name) {
    case 'Fajr':
      return l10n.fajr;
    case 'Dhuhr':
      return l10n.dhuhr;
    case 'Asr':
      return l10n.asr;
    case 'Maghrib':
      return l10n.maghrib;
    case 'Isha':
      return l10n.isha;
    default:
      return name;
  }
}

class PrayerCheckinWidget extends StatelessWidget {
  const PrayerCheckinWidget({super.key});

  static const _gold = Color(0xFFD4AF37);
  static const _cardDark = Color(0xFF1A2A3A);

  static const _prayers = [
    _PrayerMeta('Fajr', 'الفجر'),
    _PrayerMeta('Dhuhr', 'الظهر'),
    _PrayerMeta('Asr', 'العصر'),
    _PrayerMeta('Maghrib', 'المغرب'),
    _PrayerMeta('Isha', 'العشاء'),
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PrayerState>();
    final l10n = AppLocalizations.of(context)!;
    final count = state.completedCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
          child: Row(
            children: [
              Text(
                l10n.todaysPrayers,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  '$count / 5',
                  key: ValueKey(count),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _gold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: count / 5,
              backgroundColor: _cardDark,
              valueColor: const AlwaysStoppedAnimation<Color>(_gold),
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 96,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: _prayers.length,
            itemBuilder: (context, i) {
              final p = _prayers[i];
              final done = state.prayers[p.name] ?? false;
              return _PrayerCard(
                meta: p,
                done: done,
                beginnerMode: state.beginnerMode,
                onTap: () => context.read<PrayerState>().togglePrayer(p.name),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PrayerMeta {
  final String name;
  final String arabic;
  const _PrayerMeta(this.name, this.arabic);
}

class _PrayerCard extends StatelessWidget {
  final _PrayerMeta meta;
  final bool done;
  final bool beginnerMode;
  final VoidCallback onTap;

  const _PrayerCard({
    required this.meta,
    required this.done,
    required this.beginnerMode,
    required this.onTap,
  });

  static const _gold = Color(0xFFD4AF37);
  static const _cardDark = Color(0xFF1A2A3A);
  static const _navyText = Color(0xFF0D1B2A);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeInOut,
            width: 64,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: done ? _gold : _cardDark,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: done ? _gold : _gold.withValues(alpha: 0.22),
                width: 1.5,
              ),
              boxShadow: done
                  ? [
                      BoxShadow(
                        color: _gold.withValues(alpha: 0.38),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, anim) => FadeTransition(
                    opacity: anim,
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: done
                      ? const Icon(
                          Icons.check_rounded,
                          key: ValueKey('check'),
                          color: _navyText,
                          size: 24,
                        )
                      : Text(
                          meta.arabic,
                          key: ValueKey('arabic'),
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 19,
                            color: _gold,
                            height: 1.15,
                          ),
                        ),
                ),
                const SizedBox(height: 6),
                Text(
                  _localizedPrayerName(l10n, meta.name),
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: done ? _navyText : Colors.white.withValues(alpha: 0.82),
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          if (beginnerMode && !done)
            const Positioned(
              top: 6,
              right: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
                child: SizedBox(width: 8, height: 8),
              ),
            ),
        ],
      ),
    );
  }
}
