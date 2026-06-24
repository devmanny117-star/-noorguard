import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../services/tasbih_service.dart';

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFC9A84C);
const _cream = Color(0xFFF5EFE6);
const _creamMuted = Color(0xB3F5EFE6);

Future<void> showManageDhikrSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _ManageDhikrSheet(),
  );
}

InputDecoration _fieldDecoration(String label, String hint) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    labelStyle: GoogleFonts.lato(color: _creamMuted, fontSize: 13),
    hintStyle: GoogleFonts.lato(
        color: _creamMuted.withValues(alpha: 0.45), fontSize: 13),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: _gold.withValues(alpha: 0.3))),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _gold.withValues(alpha: 0.3))),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: _gold, width: 1.6)),
  );
}

class _ManageDhikrSheet extends StatelessWidget {
  const _ManageDhikrSheet();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final maxHeight = MediaQuery.of(context).size.height * 0.75;

    return ListenableBuilder(
      listenable: TasbihService(),
      builder: (context, _) {
        final service = TasbihService();
        final dhikrList = service.dhikrList;
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Container(
            decoration: const BoxDecoration(
              color: _navy,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _gold.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.tasbihManageDhikrTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _cream,
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: dhikrList.length,
                    itemBuilder: (context, i) {
                      final item = dhikrList[i];
                      return ListTile(
                        title: Text(
                          item.name,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: _cream,
                          ),
                        ),
                        subtitle: item.arabic.isNotEmpty
                            ? Text(
                                item.arabic,
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 16,
                                  color: _creamMuted,
                                ),
                              )
                            : null,
                        trailing: item.isCustom
                            ? IconButton(
                                tooltip: l10n.tasbihDeleteDhikrTooltip,
                                icon: Icon(Icons.delete_outline_rounded,
                                    color: Colors.redAccent
                                        .withValues(alpha: 0.85)),
                                onPressed: () async {
                                  final ok =
                                      await service.deleteCustomDhikr(item.id);
                                  if (!ok && context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            l10n.tasbihCannotDeleteLastDhikr),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _gold.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  l10n.tasbihBuiltInDhikrBadge,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                    color: _gold,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, 8, 20, MediaQuery.of(context).padding.bottom + 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (_) => const _AddCustomDhikrDialog(),
                      ),
                      icon: const Icon(Icons.add_rounded),
                      label: Text(
                        l10n.tasbihAddCustomDhikrButton,
                        style: GoogleFonts.lato(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _gold,
                        foregroundColor: _navy,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddCustomDhikrDialog extends StatefulWidget {
  const _AddCustomDhikrDialog();

  @override
  State<_AddCustomDhikrDialog> createState() => _AddCustomDhikrDialogState();
}

class _AddCustomDhikrDialogState extends State<_AddCustomDhikrDialog> {
  final _nameCtrl = TextEditingController();
  final _arabicCtrl = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _arabicCtrl.dispose();
    super.dispose();
  }

  void _save(AppLocalizations l10n) {
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) {
      setState(() => _error = l10n.tasbihDhikrNameRequiredError);
      return;
    }
    TasbihService().addCustomDhikr(name, _arabicCtrl.text.trim());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Dialog(
      backgroundColor: _navy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: _gold.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.tasbihAddCustomDhikrButton,
              style: GoogleFonts.playfairDisplay(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: _gold,
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _nameCtrl,
              autofocus: true,
              style: GoogleFonts.lato(color: _cream),
              decoration: _fieldDecoration(
                  l10n.tasbihDhikrNameLabel, l10n.tasbihDhikrNameHint),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  _error!,
                  style: GoogleFonts.lato(
                      color: Colors.redAccent.shade100, fontSize: 12),
                ),
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _arabicCtrl,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.scheherazadeNew(color: _cream, fontSize: 20),
              decoration: _fieldDecoration(
                  l10n.tasbihDhikrArabicLabel, l10n.tasbihDhikrArabicHint),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    l10n.cancel,
                    style: GoogleFonts.lato(
                        color: _creamMuted, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _save(l10n),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gold,
                    foregroundColor: _navy,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    l10n.tasbihSaveDhikrButton,
                    style: GoogleFonts.lato(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
