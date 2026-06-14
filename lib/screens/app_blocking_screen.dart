import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_model.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';

String _localizedCategoryName(AppLocalizations l10n, String category) {
  switch (category) {
    case 'Social Media':
      return l10n.socialMedia;
    case 'Entertainment':
      return l10n.entertainment;
    case 'Games':
      return l10n.games;
    case 'Messaging':
      return l10n.messaging;
    default:
      return category;
  }
}

class AppBlockingScreen extends StatefulWidget {
  const AppBlockingScreen({super.key});

  @override
  State<AppBlockingScreen> createState() => _AppBlockingScreenState();
}

class _AppBlockingScreenState extends State<AppBlockingScreen> {
  late final List<AppItem> _apps;
  bool _blockAll = false;

  @override
  void initState() {
    super.initState();
    _apps = sampleApps
        .map((a) => AppItem(
              name: a.name,
              category: a.category,
              icon: a.icon,
              iconColor: a.iconColor,
              iconBg: a.iconBg,
              isBlocked: a.isBlocked,
            ))
        .toList();
    _updateBlockAll();
  }

  void _updateBlockAll() {
    _blockAll = _apps.every((a) => a.isBlocked);
  }

  void _toggleApp(AppItem app) {
    setState(() {
      app.isBlocked = !app.isBlocked;
      _updateBlockAll();
    });
  }

  void _toggleAll(bool value) {
    setState(() {
      for (final a in _apps) {
        a.isBlocked = value;
      }
      _blockAll = value;
    });
  }

  int get _blockedCount => _apps.where((a) => a.isBlocked).length;

  Map<String, List<AppItem>> get _grouped {
    final m = <String, List<AppItem>>{};
    for (final a in _apps) {
      m.putIfAbsent(a.category, () => []).add(a);
    }
    return m;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final grouped = _grouped;
    final categories = grouped.keys.toList();

    return Scaffold(
      backgroundColor: colors.warmBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _AppBlockingSliverHeader(
            blockedCount: _blockedCount,
            totalCount: _apps.length,
            blockAll: _blockAll,
            onBlockAll: _toggleAll,
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 32),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  int rowIndex = 0;
                  for (final cat in categories) {
                    if (i == rowIndex) {
                      return _SectionHeader(title: _localizedCategoryName(l10n, cat));
                    }
                    rowIndex++;
                    final apps = grouped[cat]!;
                    for (int j = 0; j < apps.length; j++) {
                      if (i == rowIndex) {
                        return _AppRow(
                          app: apps[j],
                          isFirst: j == 0,
                          isLast: j == apps.length - 1,
                          onToggle: () => _toggleApp(apps[j]),
                        );
                      }
                      rowIndex++;
                    }
                    if (i == rowIndex) return const SizedBox(height: 10);
                    rowIndex++;
                  }
                  return null;
                },
                childCount: categories.fold<int>(0, (sum, cat) {
                  return sum + 1 + (grouped[cat]!.length) + 1;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SLIVER HEADER
// ─────────────────────────────────────────────
class _AppBlockingSliverHeader extends StatelessWidget {
  final int blockedCount;
  final int totalCount;
  final bool blockAll;
  final ValueChanged<bool> onBlockAll;

  const _AppBlockingSliverHeader({
    required this.blockedCount,
    required this.totalCount,
    required this.blockAll,
    required this.onBlockAll,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 22, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_rounded,
                        size: 20, color: colors.primaryText),
                  ),
                  Text(
                    l10n.appBlocking,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: colors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stats + block-all card
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.deepGreen, AppColors.mediumGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.deepGreen.withOpacity(0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.blockDuringPrayerTimes,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              l10n.blockDuringPrayerTimesSubtitle,
                              style: GoogleFonts.lato(
                                fontSize: 12.5,
                                color: Colors.white.withOpacity(0.72),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$blockedCount',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: AppColors.gold,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              l10n.blockedLabel,
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: totalCount > 0 ? blockedCount / totalCount : 0,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(AppColors.gold),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        l10n.blockAllApps,
                        style: GoogleFonts.lato(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      _GreenSwitch(
                        value: blockAll,
                        onChanged: onBlockAll,
                        onDark: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gold.withOpacity(0.22)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded,
                      size: 16, color: AppColors.mutedGold),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      l10n.blockingTimingInfo,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: AppColors.mutedGold,
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SECTION HEADER
// ─────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8, left: 4),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.lato(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: colors.secondaryText,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// APP ROW
// ─────────────────────────────────────────────
class _AppRow extends StatelessWidget {
  final AppItem app;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onToggle;

  const _AppRow({
    required this.app,
    required this.isFirst,
    required this.isLast,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBg,
          borderRadius: BorderRadius.vertical(
            top: isFirst ? const Radius.circular(16) : Radius.zero,
            bottom: isLast ? const Radius.circular(16) : Radius.zero,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: app.isBlocked ? colors.secondaryBg : app.iconBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: app.isBlocked
                        ? ColorFiltered(
                            colorFilter: const ColorFilter.matrix([
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0,      0,      0,      0.6, 0,
                            ]),
                            child: Icon(app.icon,
                                color: app.iconColor, size: 22),
                          )
                        : Icon(app.icon, color: app.iconColor, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app.name,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: app.isBlocked
                                ? colors.secondaryText
                                : colors.primaryText,
                          ),
                        ),
                        Text(
                          app.isBlocked
                              ? l10n.blockedDuringPrayers
                              : l10n.notBlocked,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: app.isBlocked
                                ? const Color(0xFFB71C1C).withOpacity(0.7)
                                : colors.secondaryText.withOpacity(0.65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _GreenSwitch(
                    value: app.isBlocked,
                    onChanged: (_) => onToggle(),
                  ),
                ],
              ),
            ),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.only(left: 74),
                child: Container(height: 0.7, color: colors.border),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CUSTOM GREEN SWITCH
// ─────────────────────────────────────────────
class _GreenSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool onDark;

  const _GreenSwitch({
    required this.value,
    required this.onChanged,
    this.onDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        width: 48,
        height: 27,
        decoration: BoxDecoration(
          color: value
              ? AppColors.deepGreen
              : onDark
                  ? Colors.white.withOpacity(0.2)
                  : colors.border,
          borderRadius: BorderRadius.circular(14),
          boxShadow: value
              ? [
                  BoxShadow(
                    color: AppColors.deepGreen.withOpacity(0.35),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 21,
            height: 21,
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
