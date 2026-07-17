import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../widgets/geometric_pattern_painter.dart';
import '../widgets/prayer_stance_image.dart';
import 'qibla_screen.dart';

// ── Brand tokens ──────────────────────────────────────────────────────────────
const _kNavy  = Color(0xFF0D1B2A);
const _kCard  = Color(0xFF0F1E30);
const _kGold  = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);
const _kGrey  = Color(0xFF4A5A6A);

// ── Prayer catalogue ──────────────────────────────────────────────────────────

class _Prayer {
  final String l10nKey;
  final String arabicName;
  final int rakahs;
  const _Prayer(this.l10nKey, this.arabicName, this.rakahs);
}

const _kPrayers = [
  _Prayer('fajr',    'الفَجْر',    2),
  _Prayer('dhuhr',   'الظُّهْر',   4),
  _Prayer('asr',     'العَصْر',    4),
  _Prayer('maghrib', 'الْمَغْرِب', 3),
  _Prayer('isha',    'الْعِشَاء',  4),
];

String _prayerName(int i, AppLocalizations l) => switch (i) {
  0 => l.fajr,
  1 => l.dhuhr,
  2 => l.asr,
  3 => l.maghrib,
  _ => l.isha,
};

// ── Step type enum ────────────────────────────────────────────────────────────

enum _T {
  wudu, qibla, niyyah,
  takbir, openingDua,
  fatiha, surah,
  ruku, itidal,
  sujood, jalsa,
  tashahhudShort, tashahhudFull, salawat, tasleem,
}

// ── Step model ────────────────────────────────────────────────────────────────

class _Step {
  final _T type;
  final String arabicName;
  final String arabicText;
  final String translit;
  final int reps;
  final bool takbirCue;

  const _Step(this.type, {
    required this.arabicName,
    this.arabicText = '',
    this.translit   = '',
    this.reps       = 1,
    this.takbirCue  = false,
  });

  String name(AppLocalizations l) => switch (type) {
    _T.wudu           => l.howToPrayStep1Name,
    _T.qibla          => l.howToPrayStep2Name,
    _T.niyyah         => l.howToPrayStep3Name,
    _T.takbir         => l.howToPrayStep4Name,
    _T.openingDua     => l.howToPrayStepOpeningDua,
    _T.fatiha         => l.howToPrayStepAlFatiha,
    _T.surah          => l.howToPrayStepSurah,
    _T.ruku           => l.howToPrayStep6Name,
    _T.itidal         => l.howToPrayStep7Name,
    _T.sujood         => l.howToPrayStep8Name,
    _T.jalsa          => l.howToPrayStep9Name,
    _T.tashahhudShort => l.howToPrayStepTashahhudShort,
    _T.tashahhudFull  => l.howToPrayStep11Name,
    _T.salawat        => l.howToPrayStepSalawat,
    _T.tasleem        => l.howToPrayStep12Name,
  };

  String translation(AppLocalizations l) => switch (type) {
    _T.takbir         => l.howToPrayTransTakbir,
    _T.openingDua     => l.howToPrayTransOpeningDua,
    _T.fatiha         => l.howToPrayTransFatiha,
    _T.ruku           => l.howToPrayTransRuku,
    _T.itidal         => l.howToPrayTransItidal,
    _T.sujood         => l.howToPrayTransSujood,
    _T.jalsa          => l.howToPrayTransJalsa,
    _T.tashahhudShort => l.howToPrayTransTashahhud,
    _T.tashahhudFull  => l.howToPrayTransTashahhud,
    _T.salawat        => l.howToPrayTransSalawat,
    _T.tasleem        => l.howToPrayTransTasleem,
    _                 => '',
  };

  String instruction(AppLocalizations l) => switch (type) {
    _T.wudu           => l.howToPrayStep1Instruction,
    _T.qibla          => l.howToPrayStep2Instruction,
    _T.niyyah         => l.howToPrayStep3Instruction,
    _T.takbir         => l.howToPrayStep4Instruction,
    _T.openingDua     => l.howToPrayOpeningDuaInstruction,
    _T.fatiha         => l.howToPrayStep5Instruction,
    _T.surah          => l.howToPraySurahInstruction,
    _T.ruku           => l.howToPrayStep6Instruction,
    _T.itidal         => l.howToPrayItidalInstruction,
    _T.sujood         => l.howToPrayStep8Instruction,
    _T.jalsa          => l.howToPrayStep9Instruction,
    _T.tashahhudShort => l.howToPrayMiddleTashahhudInstruction,
    _T.tashahhudFull  => l.howToPrayStep11Instruction,
    _T.salawat        => l.howToPraySalawatInstruction,
    _T.tasleem        => l.howToPrayTasleemInstruction,
  };

  /// Which stance illustration to show in the expanded card, or null for
  /// steps with no physical stance of their own (wudu, niyyah, salawat,
  /// tasleem).
  PrayerStance? get stance => switch (type) {
    _T.qibla ||
    _T.takbir ||
    _T.openingDua ||
    _T.fatiha ||
    _T.surah ||
    _T.itidal =>
      PrayerStance.standing,
    _T.ruku => PrayerStance.bowing,
    _T.sujood => PrayerStance.prostrating,
    _T.jalsa || _T.tashahhudShort || _T.tashahhudFull => PrayerStance.sitting,
    _ => null,
  };

  String badge(AppLocalizations l) => switch (type) {
    _T.takbir         => l.howToPrayOnceOpens,
    _T.openingDua     => l.howToPrayFirstRakahOnly,
    _T.surah          => l.howToPrayFirst2RakahsOnly,
    _T.fatiha         => l.howToPrayEveryRakah,
    _T.ruku           => l.howToPrayEveryRakah,
    _T.itidal         => l.howToPrayEveryRakah,
    _T.sujood         => l.howToPrayEveryRakah,
    _T.jalsa          => l.howToPrayEveryRakah,
    _T.tashahhudShort => l.howToPrayAfter2ndRakah,
    _T.tashahhudFull  => l.howToPrayFinalSittingOnly,
    _T.salawat        => l.howToPrayFinalSittingOnly,
    _T.tasleem        => l.howToPrayClosesThePrayer,
    _                 => '',
  };
}

// ── Static step definitions ───────────────────────────────────────────────────

const _sWudu   = _Step(_T.wudu,   arabicName: 'الوُضُوء');
const _sQibla  = _Step(_T.qibla,  arabicName: 'القِبْلَة');
const _sNiyyah = _Step(_T.niyyah, arabicName: 'النِّيَّة');

const _sTakbir = _Step(_T.takbir,
  arabicName: 'تَكْبِيرَةُ الإِحْرَام',
  arabicText: 'اللَّهُ أَكْبَرُ',
  translit:   'Allāhu Akbar',
);

const _sOpeningDua = _Step(_T.openingDua,
  arabicName: 'دُعَاءُ الِاسْتِفْتَاح',
  arabicText:
    'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ\n'
    'وَتَبَارَكَ اسْمُكَ وَتَعَالَى جَدُّكَ\n'
    'وَلَا إِلَهَ غَيْرُكَ',
  translit:
    'Subḥānaka Allāhumma wa biḥamdika\n'
    'wa tabārakasmuka wa taʿālā jadduka\n'
    'wa lā ilāha ghayruk',
);

const _sFatiha = _Step(_T.fatiha,
  arabicName: 'سُورَةُ الْفَاتِحَة',
  arabicText:
    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ\n'
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ\n'
    'الرَّحْمَٰنِ الرَّحِيمِ\n'
    'مَالِكِ يَوْمِ الدِّينِ\n'
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ\n'
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ\n'
    'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ\n'
    'غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
  translit:
    'Bismillāhir-raḥmānir-raḥīm\n'
    'Al-ḥamdu lillāhi rabbil-ʿālamīn\n'
    'Ar-raḥmānir-raḥīm\n'
    'Māliki yawmid-dīn\n'
    'Iyyāka naʿbudu wa iyyāka nastaʿīn\n'
    'Ihdinās-ṣirāṭal-mustaqīm\n'
    'Ṣirāṭal-ladhīna anʿamta ʿalayhim\n'
    'ghayril-maghḍūbi ʿalayhim wa laḍ-ḍāllīn',
);

const _sSurah = _Step(_T.surah,
  arabicName: 'سُورَة قَصِيرَة',
  arabicText:
    'قُلْ هُوَ اللَّهُ أَحَدٌ\n'
    'اللَّهُ الصَّمَدُ\n'
    'لَمْ يَلِدْ وَلَمْ يُولَدْ\n'
    'وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
  translit:
    'Qul huwa Allāhu aḥad\n'
    'Allāhus-ṣamad\n'
    'Lam yalid wa lam yūlad\n'
    'Wa lam yakun lahu kufuwan aḥad',
);

const _sRuku = _Step(_T.ruku,
  arabicName: 'الرُّكُوع',
  arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ',
  translit:   'Subḥāna Rabbiya l-ʿAẓīm',
  reps: 3,
  takbirCue: true,
);

const _sItidal = _Step(_T.itidal,
  arabicName: 'الِاعْتِدَال',
  arabicText:
    'سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ\n'
    'رَبَّنَا وَلَكَ الْحَمْدُ',
  translit:
    'Samiʿa Allāhu liman ḥamidah\n'
    'Rabbanā wa lakal-ḥamd',
);

const _sSujood = _Step(_T.sujood,
  arabicName: 'السُّجُود',
  arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
  translit:   'Subḥāna Rabbiya l-Aʿlā',
  reps: 3,
  takbirCue: true,
);

const _sJalsa = _Step(_T.jalsa,
  arabicName: 'الْجَلْسَة',
  arabicText: 'رَبِّ اغْفِرْ لِي',
  translit:   'Rabbighfirlī',
  takbirCue: true,
);

const _sTashahhudShort = _Step(_T.tashahhudShort,
  takbirCue: true,
  arabicName: 'التَّشَهُّد',
  arabicText:
    'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ\n'
    'السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ\n'
    'وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ\n'
    'السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ\n'
    'أَشْهَدُ أَن لَّا إِلَٰهَ إِلَّا اللَّهُ\n'
    'وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ',
  translit:
    'At-taḥiyyātu lillāhi waṣ-ṣalawātu waṭ-ṭayyibāt\n'
    'As-salāmu ʿalayka ayyuhan-nabiyyu\n'
    'wa raḥmatullāhi wa barakātuh\n'
    'As-salāmu ʿalaynā wa ʿalā ʿibādillāhiṣ-ṣāliḥīn\n'
    'Ash-hadu an lā ilāha illallāhu\n'
    'wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh',
);

const _sTashahhudFull = _Step(_T.tashahhudFull,
  arabicName: 'التَّشَهُّد الأَخِير',
  arabicText:
    'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ\n'
    'السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ\n'
    'وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ\n'
    'السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ\n'
    'أَشْهَدُ أَن لَّا إِلَٰهَ إِلَّا اللَّهُ\n'
    'وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ',
  translit:
    'At-taḥiyyātu lillāhi waṣ-ṣalawātu waṭ-ṭayyibāt\n'
    'As-salāmu ʿalayka ayyuhan-nabiyyu\n'
    'wa raḥmatullāhi wa barakātuh\n'
    'As-salāmu ʿalaynā wa ʿalā ʿibādillāhiṣ-ṣāliḥīn\n'
    'Ash-hadu an lā ilāha illallāhu\n'
    'wa ash-hadu anna Muḥammadan ʿabduhu wa rasūluh',
);

const _sSalawat = _Step(_T.salawat,
  arabicName: 'الصَّلَاةُ عَلَى النَّبِيِّ',
  arabicText:
    'اللَّهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ\n'
    'كَمَا صَلَّيْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ\n'
    'إِنَّكَ حَمِيدٌ مَّجِيدٌ\n'
    'اللَّهُمَّ بَارِكْ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ\n'
    'كَمَا بَارَكْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ\n'
    'إِنَّكَ حَمِيدٌ مَّجِيدٌ',
  translit:
    'Allāhumma ṣalli ʿalā Muḥammadin wa ʿalā āli Muḥammad\n'
    'kamā ṣallayta ʿalā Ibrāhīma wa ʿalā āli Ibrāhīm\n'
    'innaka Ḥamīdun Majīd\n'
    'Allāhumma bārik ʿalā Muḥammadin wa ʿalā āli Muḥammad\n'
    'kamā bārakta ʿalā Ibrāhīma wa ʿalā āli Ibrāhīm\n'
    'innaka Ḥamīdun Majīd',
);

const _sTasleem = _Step(_T.tasleem,
  arabicName: 'التَّسْلِيم',
  arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللَّهِ',
  translit:   'As-salāmu ʿalaykum wa raḥmatullāh',
  reps: 2,
);

// ── Section ───────────────────────────────────────────────────────────────────

class _Section {
  final String title;
  final List<_Step> steps;
  const _Section(this.title, this.steps);
}

List<_Section> _buildSections(int rakahs, AppLocalizations l) {
  final out = <_Section>[];

  out.add(_Section(l.howToPraySectionBefore, [_sWudu, _sQibla, _sNiyyah]));

  for (int r = 1; r <= rakahs; r++) {
    final steps = <_Step>[];
    if (r == 1) steps.addAll([_sTakbir, _sOpeningDua]);
    steps.add(_sFatiha);
    if (r <= 2) steps.add(_sSurah);
    steps.addAll([_sRuku, _sItidal, _sSujood, _sJalsa, _sSujood]);
    out.add(_Section('${l.howToPraySectionRakah} $r', steps));

    if (r == 2 && rakahs > 2) {
      out.add(_Section(l.howToPraySectionMiddleSitting, [_sTashahhudShort]));
    }
  }

  out.add(_Section(l.howToPraySectionFinalSitting,
      [_sTashahhudFull, _sSalawat, _sTasleem]));
  return out;
}

// ── Prayer Selector Widget ────────────────────────────────────────────────────

class _PrayerSelector extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onSelect;
  const _PrayerSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SizedBox(
      height: 76,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: _kPrayers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (ctx, i) {
          final p      = _kPrayers[i];
          final active = i == selected;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: active
                    ? _kGold.withValues(alpha: 0.18)
                    : _kCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: active ? _kGold : _kGold.withValues(alpha: 0.2),
                  width: active ? 1.5 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _prayerName(i, l),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 13,
                      fontWeight:
                          active ? FontWeight.w700 : FontWeight.w500,
                      color: active
                          ? _kGold
                          : _kCream.withValues(alpha: 0.65),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    p.arabicName,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 13,
                      color: active
                          ? _kGold.withValues(alpha: 0.9)
                          : _kGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      p.rakahs,
                      (_) => Container(
                        width: 5,
                        height: 5,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active
                              ? _kGold
                              : _kGrey.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final int idx;
  const _SectionHeader({required this.title, required this.idx});

  static const _colors = [
    Color(0xFF122840), Color(0xFF122840), Color(0xFF102038),
    Color(0xFF102038), Color(0xFF101c32), Color(0xFF101c32),
    Color(0xFF0e1a2e),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _colors[idx % _colors.length],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kGold.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 22,
              decoration: BoxDecoration(
                color: _kGold,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _kGold,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Gold circle ───────────────────────────────────────────────────────────────

class _GoldCircle extends StatelessWidget {
  final int n;
  const _GoldCircle(this.n);

  @override
  Widget build(BuildContext context) => Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _kGold.withValues(alpha: 0.15),
          border: Border.all(
              color: _kGold.withValues(alpha: 0.55), width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          '$n',
          style: GoogleFonts.playfairDisplay(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
      );
}

// ── Badge ─────────────────────────────────────────────────────────────────────

class _Badge extends StatelessWidget {
  final String label;
  const _Badge(this.label);

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration: BoxDecoration(
          color: _kGold.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: _kGold.withValues(alpha: 0.35)),
        ),
        child: Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: _kGold.withValues(alpha: 0.9),
          ),
        ),
      );
}

// ── Takbir cue pill ───────────────────────────────────────────────────────────

class _TakbirCuePill extends StatelessWidget {
  const _TakbirCuePill();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: _kGold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              l.howToPraySayAllahuAkbar,
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _kGold,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'اللَّهُ أَكْبَرُ',
            textDirection: TextDirection.rtl,
            style: GoogleFonts.scheherazadeNew(
              fontSize: 13,
              color: _kGold,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Thin gold divider ─────────────────────────────────────────────────────────

class _GoldDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.transparent,
            _kGold.withValues(alpha: 0.4),
            Colors.transparent,
          ]),
        ),
      );
}

// ── Step Card ─────────────────────────────────────────────────────────────────

class _StepCard extends StatelessWidget {
  final int stepNumber;
  final _Step step;
  final bool expanded;
  final VoidCallback onTap;
  const _StepCard({
    required this.stepNumber,
    required this.step,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l           = AppLocalizations.of(context)!;
    final badge       = step.badge(l);
    final trans       = step.translation(l);
    final instr       = step.instruction(l);
    final hasArabic   = step.arabicText.isNotEmpty;
    final hasTranslit = step.translit.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        margin:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: expanded
                ? _kGold.withValues(alpha: 0.5)
                : _kGold.withValues(alpha: 0.13),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ────────────────────────────────────────────────
              Row(
                children: [
                  _GoldCircle(stepNumber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.name(l),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _kCream,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          step.arabicName,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 14,
                            color: _kGold.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 220),
                    turns: expanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: _kGold.withValues(alpha: 0.6),
                      size: 22,
                    ),
                  ),
                ],
              ),

              // ── Badge ─────────────────────────────────────────────────
              if (badge.isNotEmpty) ...[
                const SizedBox(height: 8),
                _Badge(badge),
              ],

              // ── Takbir cue ────────────────────────────────────────────
              if (step.takbirCue) ...[
                const SizedBox(height: 6),
                const _TakbirCuePill(),
              ],

              // ── Expanded body ──────────────────────────────────────────
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 220),
                crossFadeState: expanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Arabic + transliteration card
                      if (hasArabic)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _kNavy,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: _kGold.withValues(alpha: 0.22)),
                          ),
                          child: Column(
                            children: [
                              if (step.reps > 1)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: _kGold.withValues(alpha: 0.15),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                          color: _kGold.withValues(
                                              alpha: 0.4)),
                                    ),
                                    child: Text(
                                      '× ${step.reps}',
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: _kGold,
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 6),
                              Text(
                                step.arabicText,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 26,
                                  color: _kCream,
                                  height: 2.0,
                                ),
                              ),
                              if (hasTranslit) ...[
                                const SizedBox(height: 12),
                                _GoldDivider(),
                                const SizedBox(height: 12),
                                Text(
                                  step.translit,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    fontSize: 13.5,
                                    fontStyle: FontStyle.italic,
                                    color: _kGold.withValues(alpha: 0.85),
                                    height: 1.7,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                      // Translation
                      if (trans.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: _kGold.withValues(alpha: 0.07),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: _kGold.withValues(alpha: 0.2)),
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.format_quote_rounded,
                                  size: 14,
                                  color: _kGold.withValues(alpha: 0.55)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  trans,
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    color: _kCream.withValues(alpha: 0.8),
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Instruction
                      if (instr.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.info_outline_rounded,
                                  size: 15,
                                  color: _kGold.withValues(alpha: 0.65)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  instr,
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    color:
                                        _kCream.withValues(alpha: 0.6),
                                    height: 1.55,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Stance illustration — below the description text.
                      if (step.stance != null) ...[
                        const SizedBox(height: 12),
                        PrayerStanceImage(stance: step.stance!),
                      ],

                      // Shortcut to the Qibla compass on the Qibla step.
                      if (step.type == _T.qibla) ...[
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const QiblaScreen(isActive: true)),
                          ),
                          icon: const Icon(Icons.explore,
                              color: Color(0xFFC9A84C), size: 20),
                          label: Text(
                            l.findQiblaDirection,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFC9A84C),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFC9A84C)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                secondChild:
                    const SizedBox(width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Celebration overlay ───────────────────────────────────────────────────────

class _CelebrationOverlay extends StatefulWidget {
  final VoidCallback onDone;
  const _CelebrationOverlay({required this.onDone});

  @override
  State<_CelebrationOverlay> createState() =>
      _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<_CelebrationOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600));
    _scale = CurvedAnimation(
        parent: _ctrl, curve: Curves.elasticOut);
    _fade =
        CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
    Future.delayed(
        const Duration(milliseconds: 2400), widget.onDone);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return FadeTransition(
      opacity: _fade,
      child: Container(
        color: Colors.black.withValues(alpha: 0.7),
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: _scale,
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(
                horizontal: 32, vertical: 28),
            decoration: BoxDecoration(
              color: _kCard,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: _kGold, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: _kGold.withValues(alpha: 0.28),
                  blurRadius: 48,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _kGold.withValues(alpha: 0.15),
                    border: Border.all(color: _kGold, width: 2),
                  ),
                  child: const Icon(Icons.check_rounded,
                      color: _kGold, size: 38),
                ),
                const SizedBox(height: 18),
                Text(
                  l.howToPrayMashaallah,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: _kGold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l.howToPrayAccepted,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: _kCream.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Main Screen ───────────────────────────────────────────────────────────────

class HowToPrayScreen extends StatefulWidget {
  const HowToPrayScreen({super.key});

  @override
  State<HowToPrayScreen> createState() => _HowToPrayScreenState();
}

class _HowToPrayScreenState extends State<HowToPrayScreen> {
  int     _selectedPrayer   = 0;
  String? _expandedKey;
  bool    _completed        = false;
  bool    _showCelebration  = false;

  @override
  void initState() {
    super.initState();
    _loadCompletion();
  }

  Future<void> _loadCompletion() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() =>
        _completed = prefs.getBool('journey_task_month1_task1') ?? false);
  }

  Future<void> _markComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('journey_task_month1_task1', true);
    if (!mounted) return;
    setState(() {
      _completed       = true;
      _showCelebration = true;
    });
  }

  // Count list items: one header per section + one item per step
  int _totalItems(List<_Section> sections) =>
      sections.fold(0, (s, sec) => s + 1 + sec.steps.length);

  Widget _buildListItem(
      BuildContext context,
      int index,
      List<_Section> sections,
      AppLocalizations l) {
    int cursor = 0;
    int si     = 0;
    for (final sec in sections) {
      if (index == cursor) {
        return _SectionHeader(title: sec.title, idx: si);
      }
      cursor++;
      for (int s = 0; s < sec.steps.length; s++) {
        if (index == cursor) {
          final key  = '${si}_$s';
          final step = sec.steps[s];
          return _StepCard(
            stepNumber: s + 1,
            step:       step,
            expanded:   _expandedKey == key,
            onTap: () => setState(
              () => _expandedKey = _expandedKey == key ? null : key,
            ),
          );
        }
        cursor++;
      }
      si++;
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final l        = AppLocalizations.of(context)!;
    final rakahs   = _kPrayers[_selectedPrayer].rakahs;
    final sections = _buildSections(rakahs, l);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor:           Colors.transparent,
        statusBarIconBrightness:  Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: _kNavy,
        body: Stack(
          children: [
            // Geometric background
            const Positioned.fill(
              child: CustomPaint(
                painter: GeometricPatternPainter(
                    color: _kGold, alpha: 0.03),
              ),
            ),

            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Header ──────────────────────────────────────────
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                              borderRadius:
                                  BorderRadius.circular(12),
                              border: Border.all(
                                  color: _kGold.withValues(alpha: 0.25)),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: _kGold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                l.howToPray,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: _kCream,
                                ),
                              ),
                              Text(
                                l.howToPraySubtitle,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  color: _kCream.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_completed)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: _kGold.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: _kGold.withValues(alpha: 0.5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                    Icons.check_circle_rounded,
                                    size: 13,
                                    color: _kGold),
                                const SizedBox(width: 4),
                                Text(
                                  l.journeyCompleted,
                                  style: GoogleFonts.lato(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: _kGold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ── Prayer Selector ──────────────────────────────────
                  _PrayerSelector(
                    selected: _selectedPrayer,
                    onSelect: (i) => setState(() {
                      _selectedPrayer = i;
                      _expandedKey    = null;
                    }),
                  ),

                  const SizedBox(height: 8),

                  // ── Rak'ah info bar ──────────────────────────────────
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 9),
                      decoration: BoxDecoration(
                        color: _kGold.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: _kGold.withValues(alpha: 0.22)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _kPrayers[_selectedPrayer].arabicName,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.scheherazadeNew(
                              fontSize: 18,
                              color: _kGold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 1,
                            height: 18,
                            color: _kGold.withValues(alpha: 0.3),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$rakahs ${l.howToPrayRakahLabel}',
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: _kCream.withValues(alpha: 0.7),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: List.generate(
                              rakahs,
                              (_) => Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _kGold.withValues(alpha: 0.55),
                                  border: Border.all(
                                      color: _kGold.withValues(
                                          alpha: 0.7)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ── Steps list ───────────────────────────────────────
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 110),
                      itemCount: _totalItems(sections),
                      itemBuilder: (ctx, i) =>
                          _buildListItem(ctx, i, sections, l),
                    ),
                  ),
                ],
              ),
            ),

            // ── Complete button (bottom) ─────────────────────────────────
            if (!_completed)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _kNavy.withValues(alpha: 0),
                        _kNavy.withValues(alpha: 0.95),
                        _kNavy,
                      ],
                    ),
                  ),
                  padding:
                      const EdgeInsets.fromLTRB(20, 16, 20, 28),
                  child: SafeArea(
                    top: false,
                    child: GestureDetector(
                      onTap: _markComplete,
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color(0xFFD4A03A),
                            Color(0xFFC9A84C),
                          ]),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: _kGold.withValues(alpha: 0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle_outline_rounded,
                              color: _kNavy,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              l.howToPrayCompleteButton,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: _kNavy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // ── Celebration ──────────────────────────────────────────────
            if (_showCelebration)
              Positioned.fill(
                child: _CelebrationOverlay(
                  onDone: () =>
                      setState(() => _showCelebration = false),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
