import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';

const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF0F1E30);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

/// Premium navy/gold hours + minutes picker used by the Focus Mode custom
/// timer and the Quran reader sleep timer. Hours 0-8, minutes 0-59.
/// Returns the total duration in minutes, or null if cancelled.
Future<int?> showHoursMinutesPickerDialog(BuildContext context) {
  return showDialog<int>(
    context: context,
    builder: (_) => const _HoursMinutesDialog(),
  );
}

class _HoursMinutesDialog extends StatefulWidget {
  const _HoursMinutesDialog();

  @override
  State<_HoursMinutesDialog> createState() => _HoursMinutesDialogState();
}

class _HoursMinutesDialogState extends State<_HoursMinutesDialog> {
  static const _maxHours = 8;
  static const _maxMinutes = 59;

  final _hoursController = TextEditingController(text: '0');
  final _minutesController = TextEditingController(text: '20');

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  int get _totalMinutes {
    final hours =
        (int.tryParse(_hoursController.text.trim()) ?? 0).clamp(0, _maxHours);
    final minutes = (int.tryParse(_minutesController.text.trim()) ?? 0)
        .clamp(0, _maxMinutes);
    return hours * 60 + minutes;
  }

  void _submit() {
    final total = _totalMinutes;
    if (total > 0) Navigator.pop(context, total);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: _kCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: _kGold.withValues(alpha: 0.3)),
      ),
      title: Text(
        l10n.customTimerMinutesTitle,
        style: GoogleFonts.lato(
          color: _kCream,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NumberField(
            controller: _hoursController,
            maxLength: 1,
            autofocus: true,
          ),
          const SizedBox(width: 8),
          Text(
            l10n.hoursAbbreviation,
            style: GoogleFonts.lato(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
          const SizedBox(width: 18),
          _NumberField(
            controller: _minutesController,
            maxLength: 2,
          ),
          const SizedBox(width: 8),
          Text(
            l10n.minutesAbbreviation,
            style: GoogleFonts.lato(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            l10n.cancel,
            style: GoogleFonts.lato(color: _kCream.withValues(alpha: 0.6)),
          ),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(
            l10n.start,
            style: GoogleFonts.lato(color: _kGold, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _NumberField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final bool autofocus;

  const _NumberField({
    required this.controller,
    required this.maxLength,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(maxLength),
        ],
        style: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: _kCream,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: _kNavy,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _kGold.withValues(alpha: 0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _kGold, width: 1.5),
          ),
        ),
      ),
    );
  }
}
