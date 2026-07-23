import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../models/saved_location_model.dart';
import '../services/location_service.dart';

/// Modal city picker shown when prayer times have no location to work from
/// (GPS unavailable/denied and no saved Qibla city). The chosen city is
/// persisted as a saved Qibla location and selected, so the Qibla screen and
/// every later prayer-time load use it too. Returns null if dismissed.
///
/// Reuses the Qibla screen's existing localized strings
/// (selectLocationTitle / searchCityHint / locationNotFound), so no new
/// translations are needed.
Future<SavedLocation?> showCityPickerDialog(BuildContext context) {
  return showDialog<SavedLocation>(
    context: context,
    builder: (_) => const _CityPickerDialog(),
  );
}

class _CityPickerDialog extends StatefulWidget {
  const _CityPickerDialog();

  @override
  State<_CityPickerDialog> createState() => _CityPickerDialogState();
}

class _CityPickerDialogState extends State<_CityPickerDialog> {
  final _controller = TextEditingController();
  final _locationService = LocationService();
  bool _isSearching = false;
  bool _notFound = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final query = _controller.text.trim();
    if (query.isEmpty || _isSearching) return;
    setState(() {
      _isSearching = true;
      _notFound = false;
    });
    try {
      final location = await _locationService.geocodeCityName(query);
      // Persist as a saved Qibla location and select it, so the Qibla
      // screen and future prayer-time loads pick the same city up. If the
      // 5-location cap is hit, still use the city for this session.
      try {
        await _locationService.addLocation(location);
        await _locationService.saveSelectedLocationId(location.id);
      } catch (_) {}
      if (!mounted) return;
      Navigator.of(context).pop(location);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isSearching = false;
        _notFound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(
        l10n.selectLocationTitle,
        style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(hintText: l10n.searchCityHint),
          ),
          if (_notFound)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                l10n.locationNotFound,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed:
              _isSearching ? null : () => Navigator.of(context).pop(null),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: _isSearching ? null : _submit,
          child: _isSearching
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.done),
        ),
      ],
    );
  }
}
