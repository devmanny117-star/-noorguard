import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

class _WuduStep {
  final int number;
  final String arabicName;

  const _WuduStep({
    required this.number,
    required this.arabicName,
  });

  String localizedName(AppLocalizations l10n) {
    switch (number) {
      case 1:
        return l10n.wuduStep1;
      case 2:
        return l10n.wuduStep2;
      case 3:
        return l10n.wuduStep3;
      case 4:
        return l10n.wuduStep4;
      case 5:
        return l10n.wuduStep5;
      case 6:
        return l10n.wuduStep6;
      case 7:
        return l10n.wuduStep7;
      case 8:
        return l10n.wuduStep8;
      default:
        return l10n.wuduStep9;
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

const List<_WuduStep> _wuduSteps = [
  _WuduStep(number: 1, arabicName: 'النِّيَّة'),
  _WuduStep(number: 2, arabicName: 'بِسْمِ اللَّهِ'),
  _WuduStep(number: 3, arabicName: 'غَسْلُ الْيَدَيْنِ'),
  _WuduStep(number: 4, arabicName: 'الْمَضْمَضَة'),
  _WuduStep(number: 5, arabicName: 'الِاسْتِنْشَاق'),
  _WuduStep(number: 6, arabicName: 'غَسْلُ الْوَجْه'),
  _WuduStep(number: 7, arabicName: 'غَسْلُ الْيَدَيْنِ إِلَى الْمِرْفَقَيْن'),
  _WuduStep(number: 8, arabicName: 'مَسْحُ الرَّأْس'),
  _WuduStep(number: 9, arabicName: 'غَسْلُ الْقَدَمَيْن'),
];

class WuduGuideScreen extends StatefulWidget {
  const WuduGuideScreen({super.key});

  @override
  State<WuduGuideScreen> createState() => _WuduGuideScreenState();
}

class _WuduGuideScreenState extends State<WuduGuideScreen> {
  int? _expandedStep = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Align(
                alignment: Alignment.centerLeft,
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
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                itemCount: _wuduSteps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final step = _wuduSteps[index];
                  final expanded = _expandedStep == step.number;
                  return _StepCard(
                    step: step,
                    expanded: expanded,
                    onTap: () => setState(
                      () => _expandedStep = expanded ? null : step.number,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final _WuduStep step;
  final bool expanded;
  final VoidCallback onTap;

  const _StepCard({
    required this.step,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: expanded ? _gold.withValues(alpha: 0.45) : _gold.withValues(alpha: 0.14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                    border: Border.all(color: _gold.withValues(alpha: 0.4)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${step.number}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
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
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 220),
              crossFadeState:
                  expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.instruction(l10n),
                      style: GoogleFonts.lato(
                        fontSize: 13.5,
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _gold.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _gold.withValues(alpha: 0.2)),
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
                              style: GoogleFonts.lato(
                                fontSize: 12.5,
                                fontStyle: FontStyle.italic,
                                color: Colors.white.withValues(alpha: 0.6),
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
