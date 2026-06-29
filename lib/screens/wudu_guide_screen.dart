import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../widgets/font_size_slider.dart';

const _navy  = Color(0xFF0D1B2A);
const _card  = Color(0xFF152840);
const _gold  = Color(0xFFC9A84C);
const _cream = Color(0xFFF5EFE6);

// ── Step model ─────────────────────────────────────────────────────────────────

class _WuduStep {
  final int    number;
  final String arabicName;
  final int?   reps; // null = once (no badge shown)

  const _WuduStep({
    required this.number,
    required this.arabicName,
    this.reps,
  });

  String localizedName(AppLocalizations l10n) {
    switch (number) {
      case 1: return l10n.wuduStep1;
      case 2: return l10n.wuduStep2;
      case 3: return l10n.wuduStep3;
      case 4: return l10n.wuduStep4;
      case 5: return l10n.wuduStep5;
      case 6: return l10n.wuduStep6;
      case 7: return l10n.wuduStep7;
      case 8: return l10n.wuduStep8;
      default: return l10n.wuduStep9;
    }
  }

  String instruction(AppLocalizations l10n) => [
    l10n.wuduStep1Instruction,
    l10n.wuduStep2Instruction,
    l10n.wuduStep3Instruction,
    l10n.wuduStep4Instruction,
    l10n.wuduStep5Instruction,
    l10n.wuduStep6Instruction,
    l10n.wuduStep7Instruction,
    l10n.wuduStep8Instruction,
    l10n.wuduStep9Instruction,
  ][number - 1];

  String tip(AppLocalizations l10n) => [
    l10n.wuduStep1Tip,
    l10n.wuduStep2Tip,
    l10n.wuduStep3Tip,
    l10n.wuduStep4Tip,
    l10n.wuduStep5Tip,
    l10n.wuduStep6Tip,
    l10n.wuduStep7Tip,
    l10n.wuduStep8Tip,
    l10n.wuduStep9Tip,
  ][number - 1];
}

const List<_WuduStep> _steps = [
  _WuduStep(number: 1, arabicName: 'النِّيَّة'),
  _WuduStep(number: 2, arabicName: 'بِسْمِ اللَّهِ'),
  _WuduStep(number: 3, arabicName: 'غَسْلُ الْيَدَيْنِ',               reps: 3),
  _WuduStep(number: 4, arabicName: 'الْمَضْمَضَة',                     reps: 3),
  _WuduStep(number: 5, arabicName: 'الِاسْتِنْشَاق',                   reps: 3),
  _WuduStep(number: 6, arabicName: 'غَسْلُ الْوَجْه',                  reps: 3),
  _WuduStep(number: 7, arabicName: 'غَسْلُ الْيَدَيْنِ إِلَى الْمِرْفَقَيْن', reps: 3),
  _WuduStep(number: 8, arabicName: 'مَسْحُ الرَّأْس'),
  _WuduStep(number: 9, arabicName: 'غَسْلُ الْقَدَمَيْن',              reps: 3),
];

// ── Screen ─────────────────────────────────────────────────────────────────────

class WuduGuideScreen extends StatefulWidget {
  const WuduGuideScreen({super.key});

  @override
  State<WuduGuideScreen> createState() => _WuduGuideScreenState();
}

class _WuduGuideScreenState extends State<WuduGuideScreen> {
  int?  _expandedStep   = 1;
  int   _fontScaleIndex = kDefaultFontScaleIndex;

  @override
  void initState() {
    super.initState();
    _loadFontScale();
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('wudu');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('wudu', index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── App bar ───────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _gold.withValues(alpha: 0.25)),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            size: 16, color: _gold),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      l10n.wuduGuide,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                child: Text(
                  l10n.wuduGuideSubtitle,
                  style: GoogleFonts.lato(
                    fontSize: 13.5,
                    color: Colors.white.withValues(alpha: 0.55),
                    height: 1.4,
                  ),
                ),
              ),
            ),

            // ── A-A font size slider ──────────────────────────────────────
            SliverToBoxAdapter(
              child: FontSizeSlider(
                index:     _fontScaleIndex,
                onChanged: _onFontScaleChanged,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // ── Dua Before card ───────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: _DuaCard(
                  label:          l10n.wuduDuaBefore,
                  arabic:         l10n.wuduDuaBeforeArabic,
                  translit:       l10n.wuduDuaBeforeTranslit,
                  translation:    l10n.wuduDuaBeforeTranslation,
                  isBefore:       true,
                  fontScaleIndex: _fontScaleIndex,
                ),
              ),
            ),

            // ── Step cards ────────────────────────────────────────────────
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, 0, 20, index == _steps.length - 1 ? 0 : 10),
                  child: _StepCard(
                    step:           _steps[index],
                    expanded:       _expandedStep == _steps[index].number,
                    fontScaleIndex: _fontScaleIndex,
                    onTap: () => setState(() =>
                        _expandedStep = _expandedStep == _steps[index].number
                            ? null
                            : _steps[index].number),
                  ),
                ),
                childCount: _steps.length,
              ),
            ),

            // ── Dua After card ────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: _DuaCard(
                  label:          l10n.wuduDuaAfter,
                  arabic:         l10n.wuduDuaAfterArabic,
                  translit:       l10n.wuduDuaAfterTranslit,
                  translation:    l10n.wuduDuaAfterTranslation,
                  isBefore:       false,
                  fontScaleIndex: _fontScaleIndex,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 36)),
          ],
        ),
      ),
    );
  }
}

// ── Dua card ───────────────────────────────────────────────────────────────────

class _DuaCard extends StatelessWidget {
  final String label;
  final String arabic;
  final String translit;
  final String translation;
  final bool   isBefore;
  final int    fontScaleIndex;

  const _DuaCard({
    required this.label,
    required this.arabic,
    required this.translit,
    required this.translation,
    required this.isBefore,
    this.fontScaleIndex = kDefaultFontScaleIndex,
  });

  @override
  Widget build(BuildContext context) {
    final scale = kFontScaleSteps[fontScaleIndex];
    return Container(
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.50), width: 1),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label pill
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _gold.withValues(alpha: 0.40)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isBefore
                            ? Icons.water_drop_outlined
                            : Icons.check_circle_outline_rounded,
                        size: 12,
                        color: _gold,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        label,
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _gold,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Arabic text — size controlled by A-A slider
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                arabic,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                textScaler: TextScaler.linear(scale),
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 22,
                  color: _gold,
                  height: 1.8,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Divider(color: _gold.withValues(alpha: 0.15), height: 1),
            const SizedBox(height: 10),

            // Transliteration
            Text(
              translit,
              textScaler: TextScaler.linear(scale),
              style: GoogleFonts.lato(
                fontSize: 12.5,
                fontStyle: FontStyle.italic,
                color: _cream.withValues(alpha: 0.70),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 8),

            // Translation
            Text(
              translation,
              textScaler: TextScaler.linear(scale),
              style: GoogleFonts.lato(
                fontSize: 12.5,
                color: Colors.white.withValues(alpha: 0.60),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Step card ──────────────────────────────────────────────────────────────────

class _StepCard extends StatelessWidget {
  final _WuduStep    step;
  final bool         expanded;
  final int          fontScaleIndex;
  final VoidCallback onTap;

  const _StepCard({
    required this.step,
    required this.expanded,
    required this.fontScaleIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n  = AppLocalizations.of(context)!;
    final scale = kFontScaleSteps[fontScaleIndex];
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: expanded
                ? _gold.withValues(alpha: 0.55)
                : _gold.withValues(alpha: 0.14),
          ),
          boxShadow: expanded
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.20),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.20),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Solid gold number circle
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: _gold,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${step.number}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: _navy,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Name + Arabic header (fixed size — these are labels)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.localizedName(l10n),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        step.arabicName,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 14,
                          color: _gold.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ),
                ),

                AnimatedRotation(
                  duration: const Duration(milliseconds: 220),
                  turns: expanded ? 0.5 : 0,
                  child: Icon(Icons.keyboard_arrow_down_rounded,
                      color: _gold.withValues(alpha: 0.7), size: 24),
                ),
              ],
            ),

            // Rep badge
            if (step.reps != null)
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 52),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _gold.withValues(alpha: 0.35)),
                  ),
                  child: Text(
                    l10n.wuduThreeTimes,
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),

            // Expanded content — scaled by slider
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 220),
              crossFadeState: expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.instruction(l10n),
                      textScaler: TextScaler.linear(scale),
                      style: GoogleFonts.lato(
                        fontSize: 13.5,
                        color: Colors.white.withValues(alpha: 0.80),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _gold.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: _gold.withValues(alpha: 0.20)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.lightbulb_outline_rounded,
                              size: 16, color: _gold.withValues(alpha: 0.85)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              step.tip(l10n),
                              textScaler: TextScaler.linear(scale),
                              style: GoogleFonts.lato(
                                fontSize: 12.5,
                                fontStyle: FontStyle.italic,
                                color: Colors.white.withValues(alpha: 0.60),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              secondChild: const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}

