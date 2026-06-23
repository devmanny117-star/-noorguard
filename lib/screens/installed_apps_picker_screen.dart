import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../models/installed_app.dart';
import '../services/app_blocking_service.dart';

// Same fixed dark palette as app_blocking_screen.dart / BlockActivity.
const _navy = Color(0xFF0D1B2A);
const _cardBg = Color(0xFF152535);
const _cardBorder = Color(0xFF1E3348);
const _white = Color(0xFFF5F5F0);
const _grey = Color(0xFF8A9BB0);
const _gold = Color(0xFFC9A84C);

/// Searchable, real-icon installed-apps picker shared by App Blocking's
/// prayer-time list and Focus Mode's own list — which list it's editing is
/// entirely up to [initiallySelected]/[onToggle], this screen has no opinion
/// on that. [pinSelectedToTop] sorts already-selected apps above the rest
/// (Focus Mode); leave it off to keep the plain alphabetical order App
/// Blocking's picker already had.
class InstalledAppsPickerScreen extends StatefulWidget {
  final String title;
  final Set<String> initiallySelected;
  final Future<void> Function(String packageName, bool value) onToggle;
  final bool pinSelectedToTop;

  const InstalledAppsPickerScreen({
    super.key,
    required this.title,
    required this.initiallySelected,
    required this.onToggle,
    this.pinSelectedToTop = false,
  });

  @override
  State<InstalledAppsPickerScreen> createState() =>
      _InstalledAppsPickerScreenState();
}

class _InstalledAppsPickerScreenState extends State<InstalledAppsPickerScreen> {
  List<InstalledApp> _apps = [];
  List<InstalledApp> _filtered = [];
  late Set<String> _selected;
  bool _loading = true;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selected = {...widget.initiallySelected};
    _load();
    _searchController.addListener(_onSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final apps =
        await AppBlockingService().getInstalledApps(forceRefresh: true);
    if (!mounted) return;
    setState(() {
      _apps = apps;
      _filtered = apps;
      _loading = false;
    });
  }

  void _onSearch() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      _filtered = q.isEmpty
          ? _apps
          : _apps.where((a) => a.appName.toLowerCase().contains(q)).toList();
    });
  }

  List<InstalledApp> get _displayed {
    if (!widget.pinSelectedToTop) return _filtered;
    final selected = <InstalledApp>[];
    final unselected = <InstalledApp>[];
    for (final app in _filtered) {
      (_selected.contains(app.packageName) ? selected : unselected).add(app);
    }
    return [...selected, ...unselected];
  }

  Future<void> _toggle(InstalledApp app, bool value) async {
    setState(() {
      if (value) {
        _selected.add(app.packageName);
      } else {
        _selected.remove(app.packageName);
      }
    });
    await widget.onToggle(app.packageName, value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final displayed = _displayed;

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 18, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_rounded,
                        size: 20, color: _white),
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: TextField(
                controller: _searchController,
                style: GoogleFonts.lato(color: _white, fontSize: 14),
                decoration: InputDecoration(
                  hintText: l10n.appBlockingSearchHint,
                  hintStyle: GoogleFonts.lato(color: _grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search_rounded, color: _grey),
                  filled: true,
                  fillColor: _cardBg,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: _cardBorder),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: _cardBorder),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator(color: _gold))
                  : displayed.isEmpty
                      ? Center(
                          child: Text(
                            l10n.appBlockingNoAppsSelected,
                            style: GoogleFonts.lato(color: _grey, fontSize: 14),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
                          itemCount: displayed.length,
                          itemBuilder: (context, index) {
                            final app = displayed[index];
                            final selected = _selected.contains(app.packageName);
                            return _AppPickerRow(
                              app: app,
                              selected: selected,
                              onToggle: (value) => _toggle(app, value),
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

class _AppPickerRow extends StatelessWidget {
  final InstalledApp app;
  final bool selected;
  final ValueChanged<bool> onToggle;

  const _AppPickerRow({
    required this.app,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: selected ? _gold.withValues(alpha: 0.4) : _cardBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: app.iconBytes != null
                ? Image.memory(app.iconBytes!,
                    width: 38, height: 38, fit: BoxFit.cover)
                : Container(
                    width: 38,
                    height: 38,
                    color: _cardBorder,
                    child: const Icon(Icons.apps_rounded, color: _grey, size: 20),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              app.appName,
              style: GoogleFonts.lato(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                color: _white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Switch(
            value: selected,
            activeThumbColor: _gold,
            inactiveTrackColor: _cardBorder,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}
