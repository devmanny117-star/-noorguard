import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../geometric_pattern_painter.dart';

// ── Colours ───────────────────────────────────────────────────────────────────

const _kGold       = Color(0xFFD4AF37);
const _kBorderGold = Color(0xFFD4AF37);
const _kBg         = Color(0xFF0B1320);
const _kInactive   = Color(0xFFA7ADB8);

// ── Public widgets ────────────────────────────────────────────────────────────

/// Floating frosted-glass pill navigation bar.
/// Place in [Scaffold.bottomNavigationBar] with [Scaffold.extendBody] = true.
class PremiumBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PremiumBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final width  = MediaQuery.of(context).size.width * 0.92;

    final items = [
      (icon: Icons.home_outlined,      activeIcon: Icons.home_rounded,       label: l10n.home),
      (icon: Icons.menu_book_outlined, activeIcon: Icons.menu_book_rounded,  label: l10n.quran),
      (icon: Icons.explore_outlined,   activeIcon: Icons.explore_rounded,    label: l10n.qibla),
      (icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view_rounded,  label: l10n.more),
    ];

    return SafeArea(
      top: false,
      child: SizedBox(
        height: 92, // 82px pill + 10px gap from bottom
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _Pill(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < items.length; i++)
                    Expanded(
                      child: NavigationItem(
                        icon:       items[i].icon,
                        activeIcon: items[i].activeIcon,
                        label:      items[i].label,
                        isActive:   currentIndex == i,
                        onTap:      () => onTap(i),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Single tab item inside [PremiumBottomNavigationBar].
/// Animates circle, icon colour, label colour, and icon scale on activation.
class NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: isActive ? 1.0 : 0.0),
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        builder: (_, t, __) {
          final iconColor  = Color.lerp(_kInactive, _kBg, t)!;
          final labelColor = Color.lerp(
            _kInactive.withValues(alpha: 0.8),
            _kGold,
            t,
          )!;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.0 + 0.08 * t,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _kGold.withValues(alpha: t),
                  ),
                  child: Icon(
                    isActive ? activeIcon : icon,
                    color: iconColor,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: labelColor,
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.transparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ── Private: pill container ───────────────────────────────────────────────────

class _Pill extends StatelessWidget {
  final double width;
  final Widget child;

  const _Pill({required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(42),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: _kBg.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(42),
              border: Border.all(color: _kBorderGold, width: 1),
            ),
            child: Stack(
              children: [
                const Positioned.fill(
                  child: CustomPaint(
                    painter: GeometricPatternPainter(
                      color: _kBorderGold,
                      alpha: 0.09,
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
