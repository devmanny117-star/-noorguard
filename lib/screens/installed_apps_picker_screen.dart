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
/// with a gold divider before the remaining apps — both callers enable it.
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

  /// How many items at the front of [_displayed] are the pinned-selected
  /// ones — also where the divider goes, if there's at least one of each.
  int get _pinnedCount {
    if (!widget.pinSelectedToTop) return 0;
    return _filtered.where((a) => _selected.contains(a.packageName)).length;
  }

  /// Fixed slot height every row animates between — must match
  /// [_AppPickerRow]'s height + bottom margin exactly, since [_topFor] uses
  /// it to lay rows out in a [Stack] instead of a [ListView].
  static const double _rowExtent = 70;
  static const double _dividerSpace = 26;

  double _topFor(int index, int pinnedCount, bool showDivider) {
    final afterDivider = showDivider && index >= pinnedCount;
    return index * _rowExtent + (afterDivider ? _dividerSpace : 0);
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
    final pinnedCount = _pinnedCount;
    final showDivider = pinnedCount > 0 && pinnedCount < displayed.length;

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
                      : SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
                          child: SizedBox(
                            height: displayed.length * _rowExtent +
                                (showDivider ? _dividerSpace : 0),
                            // A Stack of AnimatedPositioned rows (keyed by
                            // package name) instead of ListView.builder —
                            // toggling an app re-sorts `displayed`, and since
                            // each row keeps the same key/element across that
                            // rebuild, Flutter tweens its `top` to the new
                            // slot instead of snapping there.
                            child: Stack(
                              children: [
                                for (var i = 0; i < displayed.length; i++)
                                  AnimatedPositioned(
                                    key: ValueKey(displayed[i].packageName),
                                    duration: const Duration(milliseconds: 320),
                                    curve: Curves.easeOutCubic,
                                    top: _topFor(i, pinnedCount, showDivider),
                                    left: 0,
                                    right: 0,
                                    height: _rowExtent,
                                    child: _AppPickerRow(
                                      app: displayed[i],
                                      selected: _selected
                                          .contains(displayed[i].packageName),
                                      onToggle: (value) =>
                                          _toggle(displayed[i], value),
                                    ),
                                  ),
                                if (showDivider)
                                  AnimatedPositioned(
                                    key: const ValueKey('_pinnedDivider'),
                                    duration: const Duration(milliseconds: 320),
                                    curve: Curves.easeOutCubic,
                                    top: pinnedCount * _rowExtent +
                                        (_dividerSpace - 1.5) / 2,
                                    left: 0,
                                    right: 0,
                                    height: 1.5,
                                    child: const _PinnedDividerLine(),
                                  ),
                              ],
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Marks the boundary between pinned-selected apps and the rest, when
/// [InstalledAppsPickerScreen.pinSelectedToTop] is on. Positioning/spacing is
/// handled by the parent's AnimatedPositioned — this is just the line.
class _PinnedDividerLine extends StatelessWidget {
  const _PinnedDividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(color: _gold.withValues(alpha: 0.35));
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
      height: 60,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14),
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
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}
