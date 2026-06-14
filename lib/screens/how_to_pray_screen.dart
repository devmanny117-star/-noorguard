import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

class _PrayerStep {
  final int number;
  final String? arabicPhrase;

  const _PrayerStep({required this.number, this.arabicPhrase});

  String name(AppLocalizations l10n) => [
        l10n.howToPrayStep1Name,
        l10n.howToPrayStep2Name,
        l10n.howToPrayStep3Name,
        l10n.howToPrayStep4Name,
        l10n.howToPrayStep5Name,
        l10n.howToPrayStep6Name,
        l10n.howToPrayStep7Name,
        l10n.howToPrayStep8Name,
        l10n.howToPrayStep9Name,
        l10n.howToPrayStep10Name,
        l10n.howToPrayStep11Name,
        l10n.howToPrayStep12Name,
      ][number - 1];

  String instruction(AppLocalizations l10n) => [
        l10n.howToPrayStep1Instruction,
        l10n.howToPrayStep2Instruction,
        l10n.howToPrayStep3Instruction,
        l10n.howToPrayStep4Instruction,
        l10n.howToPrayStep5Instruction,
        l10n.howToPrayStep6Instruction,
        l10n.howToPrayStep7Instruction,
        l10n.howToPrayStep8Instruction,
        l10n.howToPrayStep9Instruction,
        l10n.howToPrayStep10Instruction,
        l10n.howToPrayStep11Instruction,
        l10n.howToPrayStep12Instruction,
      ][number - 1];

  String tip(AppLocalizations l10n) => [
        l10n.howToPrayStep1Tip,
        l10n.howToPrayStep2Tip,
        l10n.howToPrayStep3Tip,
        l10n.howToPrayStep4Tip,
        l10n.howToPrayStep5Tip,
        l10n.howToPrayStep6Tip,
        l10n.howToPrayStep7Tip,
        l10n.howToPrayStep8Tip,
        l10n.howToPrayStep9Tip,
        l10n.howToPrayStep10Tip,
        l10n.howToPrayStep11Tip,
        l10n.howToPrayStep12Tip,
      ][number - 1];
}

const List<_PrayerStep> _prayerSteps = [
  _PrayerStep(number: 1),
  _PrayerStep(number: 2),
  _PrayerStep(number: 3, arabicPhrase: 'النِّيَّة'),
  _PrayerStep(number: 4, arabicPhrase: 'اللَّهُ أَكْبَر — Allahu Akbar'),
  _PrayerStep(number: 5, arabicPhrase: 'الفَاتِحَة'),
  _PrayerStep(number: 6, arabicPhrase: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ'),
  _PrayerStep(number: 7, arabicPhrase: 'سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ'),
  _PrayerStep(number: 8, arabicPhrase: 'سُبْحَانَ رَبِّيَ الأَعْلَى'),
  _PrayerStep(number: 9, arabicPhrase: 'رَبِّ اغْفِرْ لِي'),
  _PrayerStep(number: 10),
  _PrayerStep(number: 11, arabicPhrase: 'التَّحِيَّاتُ لِلَّهِ'),
  _PrayerStep(number: 12, arabicPhrase: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللَّهِ'),
];

// ── Prayer Position Illustration ──────────────────────────────────────────────

class _PrayerIllustration extends StatelessWidget {
  final int step;
  const _PrayerIllustration({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: _navy,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.28)),
      ),
      child: CustomPaint(
        painter: _PosePainter(step: step),
      ),
    );
  }
}

class _PosePainter extends CustomPainter {
  final int step;
  const _PosePainter({required this.step});

  static const double _cx = 60;

  Paint get _stroke => Paint()
    ..color = _gold
    ..strokeWidth = 2.5
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..style = PaintingStyle.stroke;

  Paint get _fill => Paint()
    ..color = _gold
    ..style = PaintingStyle.fill;

  Paint _thinStroke({double width = 1.5, double alpha = 1.0}) => Paint()
    ..color = _gold.withValues(alpha: alpha)
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..style = PaintingStyle.stroke;

  void _line(Canvas c, double x1, double y1, double x2, double y2) =>
      c.drawLine(Offset(x1, y1), Offset(x2, y2), _stroke);

  void _thinLine(Canvas c, double x1, double y1, double x2, double y2,
          {double alpha = 0.55}) =>
      c.drawLine(Offset(x1, y1), Offset(x2, y2), _thinStroke(alpha: alpha));

  void _dot(Canvas c, double x, double y, double r) =>
      c.drawCircle(Offset(x, y), r, _fill);

  void _ring(Canvas c, double x, double y, double r) =>
      c.drawCircle(Offset(x, y), r, _stroke);

  // ── Common figure parts ────────────────────────────────────────────────────

  void _head(Canvas c, {double cx = _cx, double cy = 18}) {
    _dot(c, cx, cy, 9);
  }

  void _standingTorso(Canvas c, {double y2 = 74}) {
    _line(c, _cx, 27, _cx, y2);
  }

  void _standingLegs(Canvas c, {double hipY = 74}) {
    _line(c, _cx, hipY, 47, 110);
    _line(c, _cx, hipY, 73, 110);
  }

  // ── Step painters ──────────────────────────────────────────────────────────

  // Step 1 – Wudu: standing, hands near face + water drop
  void _drawWudu(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Arms raised to face level
    _line(c, _cx, 44, 36, 26);
    _line(c, _cx, 44, 84, 26);
    // Water droplet shape below cupped hands
    final path = Path()
      ..moveTo(60, 52)
      ..cubicTo(50, 57, 48, 68, 60, 74)
      ..cubicTo(72, 68, 70, 57, 60, 52)
      ..close();
    c.drawPath(
        path,
        Paint()
          ..color = _gold.withValues(alpha: 0.25)
          ..style = PaintingStyle.fill);
    c.drawPath(path, _thinStroke(alpha: 0.75));
  }

  // Step 2 – Qibla: standing, arm pointing + compass
  void _drawQibla(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Right arm extended pointing
    _line(c, _cx, 44, 99, 36);
    // Left arm at side
    _line(c, _cx, 44, 40, 64);
    // Compass circle at arm tip
    _ring(c, 104, 34, 10);
    // Compass needle (north arrow)
    _line(c, 104, 26, 104, 33);
    _line(c, 101, 29, 104, 26);
    _line(c, 107, 29, 104, 26);
    // Faint crosshairs
    _thinLine(c, 104, 24, 104, 44, alpha: 0.2);
    _thinLine(c, 94, 34, 114, 34, alpha: 0.2);
  }

  // Step 3 – Niyyah: standing, right hand on heart
  void _drawNiyyah(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Right arm to heart
    _line(c, _cx, 44, 46, 52);
    // Left arm at side
    _line(c, _cx, 44, 76, 62);
    // Heart at chest
    final hp = Path();
    const hx = 46.0;
    const hy = 54.0;
    hp.moveTo(hx, hy + 6);
    hp.cubicTo(hx - 9, hy - 1, hx - 9, hy - 10, hx, hy - 5);
    hp.cubicTo(hx + 9, hy - 10, hx + 9, hy - 1, hx, hy + 6);
    hp.close();
    c.drawPath(
        hp,
        Paint()
          ..color = _gold.withValues(alpha: 0.4)
          ..style = PaintingStyle.fill);
    c.drawPath(hp, _thinStroke(alpha: 0.85));
  }

  // Step 4 – Takbir: standing, hands raised to ears (open palms)
  void _drawTakbir(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Arms raised to ear level
    _line(c, _cx, 44, 36, 22);
    _line(c, _cx, 44, 84, 22);
    // Flat palm indicators
    _thinLine(c, 32, 22, 40, 20, alpha: 0.9);
    _thinLine(c, 80, 20, 88, 22, alpha: 0.9);
  }

  // Step 5 – Qiyam: standing, arms folded on chest
  void _drawQiyam(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Right forearm over left (folded)
    _line(c, 72, 42, 48, 56);
    _line(c, 48, 42, 72, 56);
  }

  // Step 6 – Ruku: 90-degree bow
  void _drawRuku(Canvas c) {
    // Legs straight down from hip
    _line(c, 70, 53, 57, 100);
    _line(c, 70, 53, 82, 100);
    // Upper torso horizontal to the left
    _line(c, 70, 53, 14, 53);
    // Head at end of torso
    _dot(c, 14, 44, 9);
    // Neck
    _line(c, 14, 53, 14, 53);
    // Arms hanging down from torso to knee area
    _line(c, 36, 53, 36, 78);
    _line(c, 52, 53, 52, 70);
    // Hands on knees (short horizontal tick)
    _thinLine(c, 32, 78, 40, 78, alpha: 0.8);
    _thinLine(c, 48, 70, 56, 70, alpha: 0.8);
  }

  // Step 7 – Itidal: standing upright, arms at sides
  void _drawItidal(Canvas c) {
    _head(c);
    _standingTorso(c);
    _standingLegs(c);
    // Arms hanging at sides
    _line(c, _cx, 44, 40, 68);
    _line(c, _cx, 44, 80, 68);
  }

  // Step 8 – Sujood: full prostration
  void _drawSujood(Canvas c) {
    // Forehead on ground
    _dot(c, 22, 104, 8);
    // Neck going up from forehead
    _line(c, 22, 96, 28, 80);
    // Torso diagonal up-right (hips are highest)
    _line(c, 28, 80, 64, 55);
    // Hips, legs folded and going to ground
    _line(c, 64, 55, 82, 70);
    _line(c, 82, 70, 84, 102);
    _line(c, 64, 55, 73, 68);
    _line(c, 73, 68, 72, 102);
    // Arms flat on ground, extending from head
    _line(c, 24, 97, 8, 104);
    _line(c, 24, 97, 42, 104);
  }

  // Step 9 – Jalsa: sitting between prostrations
  void _drawJalsa(Canvas c) {
    _head(c);
    _standingTorso(c, y2: 64);
    // Thighs going out (seated)
    _line(c, _cx, 64, 38, 84);
    _line(c, 38, 84, 40, 110);
    _line(c, _cx, 64, 82, 84);
    _line(c, 82, 84, 80, 110);
    // Arms resting on knees
    _line(c, _cx, 44, 42, 77);
    _line(c, _cx, 44, 78, 77);
  }

  // Step 10 – Second Rakat: same standing Takbir position
  void _drawSecondRakat(Canvas c) => _drawTakbir(c);

  // Step 11 – Tashahhud: sitting, right index finger raised
  void _drawTashahhud(Canvas c) {
    _head(c);
    _standingTorso(c, y2: 64);
    _line(c, _cx, 64, 38, 84);
    _line(c, 38, 84, 40, 110);
    _line(c, _cx, 64, 82, 84);
    _line(c, 82, 84, 80, 110);
    // Left arm on knee
    _line(c, _cx, 44, 42, 77);
    // Right arm raised with index finger pointing up
    _line(c, _cx, 44, 84, 36);
    _line(c, 84, 36, 84, 14); // index finger
    _dot(c, 84, 10, 3);
  }

  // Step 12 – Tasleem: sitting, head turned to right
  void _drawTasleem(Canvas c) {
    // Torso and legs (same as Jalsa)
    _line(c, _cx, 27, _cx, 64);
    _line(c, _cx, 64, 38, 84);
    _line(c, 38, 84, 40, 110);
    _line(c, _cx, 64, 82, 84);
    _line(c, 82, 84, 80, 110);
    _line(c, _cx, 44, 42, 77);
    _line(c, _cx, 44, 78, 77);
    // Head shifted right to indicate turning
    _dot(c, 68, 18, 9);
    // Angled neck back to torso
    _thinLine(c, 68, 27, 60, 27, alpha: 0.8);
    // Arrow showing head-turn direction
    final ap = _thinStroke(width: 1.8, alpha: 0.55);
    c.drawLine(const Offset(84, 18), const Offset(96, 18), ap);
    c.drawLine(const Offset(92, 14), const Offset(96, 18), ap);
    c.drawLine(const Offset(92, 22), const Offset(96, 18), ap);
  }

  @override
  void paint(Canvas canvas, Size size) {
    switch (step) {
      case 1:  _drawWudu(canvas);         break;
      case 2:  _drawQibla(canvas);        break;
      case 3:  _drawNiyyah(canvas);       break;
      case 4:  _drawTakbir(canvas);       break;
      case 5:  _drawQiyam(canvas);        break;
      case 6:  _drawRuku(canvas);         break;
      case 7:  _drawItidal(canvas);       break;
      case 8:  _drawSujood(canvas);       break;
      case 9:  _drawJalsa(canvas);        break;
      case 10: _drawSecondRakat(canvas);  break;
      case 11: _drawTashahhud(canvas);    break;
      case 12: _drawTasleem(canvas);      break;
    }
  }

  @override
  bool shouldRepaint(_PosePainter old) => old.step != step;
}

// ── Screen ────────────────────────────────────────────────────────────────────

class HowToPrayScreen extends StatefulWidget {
  const HowToPrayScreen({super.key});

  @override
  State<HowToPrayScreen> createState() => _HowToPrayScreenState();
}

class _HowToPrayScreenState extends State<HowToPrayScreen> {
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
                    l10n.howToPray,
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
                  l10n.howToPraySubtitle,
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
                itemCount: _prayerSteps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final step = _prayerSteps[index];
                  final expanded = _expandedStep == step.number;
                  return _PrayerStepCard(
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

// ── Step Card ─────────────────────────────────────────────────────────────────

class _PrayerStepCard extends StatelessWidget {
  final _PrayerStep step;
  final bool expanded;
  final VoidCallback onTap;

  const _PrayerStepCard({
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
            color: expanded
                ? _gold.withValues(alpha: 0.45)
                : _gold.withValues(alpha: 0.14),
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
                  child: Text(
                    step.name(l10n),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
                    // ── Illustration ───────────────────────────────────────
                    Center(child: _PrayerIllustration(step: step.number)),
                    const SizedBox(height: 14),
                    if (step.arabicPhrase != null) ...[
                      Text(
                        step.arabicPhrase!,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.scheherazadeNew(
                          fontSize: 22,
                          color: _gold,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
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
