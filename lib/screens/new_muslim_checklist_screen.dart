import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

const _prefsKey = 'new_muslim_checklist_completed';

const List<int> _weekNumbers = [1, 2, 3, 4];
const Map<int, int> _itemCountByWeek = {1: 6, 2: 4, 3: 4, 4: 4};

int get _totalItems => _itemCountByWeek.values.fold(0, (sum, count) => sum + count);

String _weekTitle(AppLocalizations l10n, int week) {
  switch (week) {
    case 1:
      return l10n.checklistWeek1Title;
    case 2:
      return l10n.checklistWeek2Title;
    case 3:
      return l10n.checklistWeek3Title;
    default:
      return l10n.checklistWeek4Title;
  }
}

List<String> _weekItems(AppLocalizations l10n, int week) {
  switch (week) {
    case 1:
      return [
        l10n.checklistWeek1Item1,
        l10n.checklistWeek1Item2,
        l10n.checklistWeek1Item3,
        l10n.checklistWeek1Item4,
        l10n.checklistWeek1Item5,
        l10n.checklistWeek1Item6,
      ];
    case 2:
      return [
        l10n.checklistWeek2Item1,
        l10n.checklistWeek2Item2,
        l10n.checklistWeek2Item3,
        l10n.checklistWeek2Item4,
      ];
    case 3:
      return [
        l10n.checklistWeek3Item1,
        l10n.checklistWeek3Item2,
        l10n.checklistWeek3Item3,
        l10n.checklistWeek3Item4,
      ];
    default:
      return [
        l10n.checklistWeek4Item1,
        l10n.checklistWeek4Item2,
        l10n.checklistWeek4Item3,
        l10n.checklistWeek4Item4,
      ];
  }
}

class NewMuslimChecklistScreen extends StatefulWidget {
  const NewMuslimChecklistScreen({super.key});

  @override
  State<NewMuslimChecklistScreen> createState() => _NewMuslimChecklistScreenState();
}

class _NewMuslimChecklistScreenState extends State<NewMuslimChecklistScreen> {
  Set<String> _completed = {};
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _completed = (prefs.getStringList(_prefsKey) ?? []).toSet();
      _loaded = true;
    });
  }

  Future<void> _toggle(String id) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_completed.contains(id)) {
        _completed.remove(id);
      } else {
        _completed.add(id);
      }
    });
    await prefs.setStringList(_prefsKey, _completed.toList());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = _totalItems == 0 ? 0.0 : _completed.length / _totalItems;

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
                    l10n.newMuslimChecklist,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.newMuslimChecklistSubtitle,
                        style: GoogleFonts.lato(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                      ),
                      Text(
                        '${_completed.length} / $_totalItems complete',
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: _gold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Colors.white.withValues(alpha: 0.08),
                      valueColor: const AlwaysStoppedAnimation<Color>(_gold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: !_loaded
                  ? const Center(
                      child: CircularProgressIndicator(color: _gold),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                      children: [
                        for (final week in _weekNumbers) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text(
                              _weekTitle(l10n, week),
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: _gold,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: _cardNavy,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: _gold.withValues(alpha: 0.14)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 14,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                for (var i = 0; i < _itemCountByWeek[week]!; i++) ...[
                                  if (i != 0)
                                    Divider(
                                      height: 1,
                                      color: _gold.withValues(alpha: 0.1),
                                      indent: 16,
                                      endIndent: 16,
                                    ),
                                  _ChecklistRow(
                                    label: _weekItems(l10n, week)[i],
                                    checked: _completed.contains('week${week}_item${i + 1}'),
                                    onTap: () => _toggle('week${week}_item${i + 1}'),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChecklistRow extends StatelessWidget {
  final String label;
  final bool checked;
  final VoidCallback onTap;

  const _ChecklistRow({
    required this.label,
    required this.checked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: checked ? _gold : Colors.transparent,
                border: Border.all(
                  color: checked ? _gold : _gold.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: checked
                  ? const Icon(Icons.check_rounded, size: 16, color: _navy)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: checked
                      ? Colors.white.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.85),
                  decoration: checked ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.white.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
