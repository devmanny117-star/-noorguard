import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../data/duas_data.dart';
import '../data/share_data.dart';
import '../l10n/app_localizations.dart';
import '../models/asma_ul_husna_model.dart';
import 'share_card.dart';
import 'geometric_pattern_painter.dart';

const _kNavy  = Color(0xFF0D1B2A);
const _kCard  = Color(0xFF0F1E30);
const _kGold  = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

// ── Public entry point ────────────────────────────────────────────────────────

void showShareSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => _ShareSheetBody(parentContext: context),
  );
}

// ── Bottom sheet body ─────────────────────────────────────────────────────────

class _ShareSheetBody extends StatefulWidget {
  /// The context of the calling screen (has a Scaffold + ScaffoldMessenger).
  final BuildContext parentContext;
  const _ShareSheetBody({required this.parentContext});

  @override
  State<_ShareSheetBody> createState() => _ShareSheetBodyState();
}

class _ShareSheetBodyState extends State<_ShareSheetBody> {
  bool _loading = false;

  // ── Capture helpers ─────────────────────────────────────────────────────────

  /// Renders [card] into the root Overlay at an off-screen position, waits one
  /// frame for Flutter to lay out and paint it, then captures it as PNG bytes.
  Future<List<int>> _renderCardToBytes(Widget card) async {
    const double pixelRatio = 3.0;
    const double cardWidth  = 400;

    final repaintKey = GlobalKey();
    final completer  = Completer<List<int>>();

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        // Far off-screen — invisible to the user but present in the render tree.
        left: -5000,
        top:  -5000,
        width: cardWidth,
        child: RepaintBoundary(
          key: repaintKey,
          child: Material(
            color: Colors.transparent,
            child: card,
          ),
        ),
      ),
    );

    // rootOverlay: true ensures we always attach to the Navigator's root
    // overlay, not a local one that might be inside the bottom sheet.
    Overlay.of(context, rootOverlay: true).insert(entry);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final boundary = repaintKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;
        if (boundary == null) {
          debugPrint('[ShareSheet] RepaintBoundary render object is null');
          throw Exception('RepaintBoundary not found after frame');
        }
        debugPrint('[ShareSheet] capturing image…');
        final ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        debugPrint('[ShareSheet] image size: ${image.width}×${image.height}');
        final ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData == null) throw Exception('image.toByteData returned null');
        completer.complete(byteData.buffer.asUint8List());
      } catch (e, stack) {
        debugPrint('[ShareSheet] render error: $e');
        debugPrintStack(stackTrace: stack);
        completer.completeError(e);
      } finally {
        entry.remove();
      }
    });

    return completer.future;
  }

  Future<void> _captureAndShare({
    required String typeLabel,
    required String arabic,
    required String transliteration,
    required String translation,
    required String source,
    required String brandingLabel,
  }) async {
    if (!mounted) return;
    setState(() => _loading = true);
    try {
      final card = ShareCardWidget(
        typeLabel: typeLabel,
        arabic: arabic,
        transliteration: transliteration,
        translation: translation,
        source: source,
        brandingLabel: brandingLabel,
      );
      debugPrint('[ShareSheet] starting render…');
      final bytes = await _renderCardToBytes(card);
      debugPrint('[ShareSheet] render complete, ${bytes.length} bytes');

      final dir  = await getTemporaryDirectory();
      final file = File('${dir.path}/noor_guard_share.png');
      await file.writeAsBytes(bytes);
      debugPrint('[ShareSheet] wrote to ${file.path}');

      if (!mounted) return;
      // Dismiss the sheet before the system share dialog opens.
      Navigator.pop(context);

      await SharePlus.instance.share(ShareParams(
        files: [XFile(file.path)],
        text: brandingLabel,
      ));
    } catch (e, stack) {
      debugPrint('[ShareSheet] _captureAndShare error: $e');
      debugPrintStack(stackTrace: stack);
      if (!mounted) return;
      setState(() => _loading = false);
      // Use parentContext so ScaffoldMessenger finds the home screen's Scaffold.
      if (widget.parentContext.mounted) {
        final l10n = AppLocalizations.of(widget.parentContext)!;
        ScaffoldMessenger.of(widget.parentContext).showSnackBar(SnackBar(
          content: Text(
            l10n.shareError,
            style: GoogleFonts.lato(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF2C2C2A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ));
      }
    }
  }

  // ── Per-type share helpers ───────────────────────────────────────────────────

  void _showAyahPicker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _AyahPickerScreen(
          onPick: (ayah) {
            final l10n = AppLocalizations.of(context)!;
            _captureAndShare(
              typeLabel: l10n.shareCardAyahLabel,
              arabic: ayah.arabic,
              transliteration: ayah.transliteration,
              translation: ayah.translationFor(l10n.localeName),
              source: ayah.source,
              brandingLabel: l10n.shareViaLabel,
            );
          },
        ),
      ),
    );
  }

  void _showNamePicker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _NamePickerScreen(
          onPick: (name) {
            final l10n = AppLocalizations.of(context)!;
            final loc  = l10n.localeName;
            _captureAndShare(
              typeLabel: l10n.shareCardNameLabel,
              arabic: name.arabic,
              transliteration: name.transliteration,
              translation: name.meaningText(loc),
              source: name.explanationText(loc),
              brandingLabel: l10n.shareViaLabel,
            );
          },
        ),
      ),
    );
  }

  void _showHadithPicker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _HadithPickerScreen(
          onPick: (hadith) {
            final l10n = AppLocalizations.of(context)!;
            final loc  = l10n.localeName;
            _captureAndShare(
              typeLabel: l10n.shareCardHadithLabel,
              arabic: hadith.arabic,
              transliteration: hadith.transliteration,
              translation: hadith.translationFor(loc),
              source: hadith.source,
              brandingLabel: l10n.shareViaLabel,
            );
          },
        ),
      ),
    );
  }

  void _showDuaPicker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _DuaPickerScreen(
          onPick: (dua) {
            final l10n = AppLocalizations.of(context)!;
            _captureAndShare(
              typeLabel: l10n.shareCardDuaLabel,
              arabic: dua.arabic,
              transliteration: dua.transliteration,
              translation: dua.translationFor(l10n.localeName),
              source: dua.source,
              brandingLabel: l10n.shareViaLabel,
            );
          },
        ),
      ),
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final options = [
      (
        icon: Icons.auto_stories_rounded,
        label: l10n.shareAnAyah,
        subtitle: l10n.shareAyahSubtitle,
        onTap: _showAyahPicker,
      ),
      (
        icon: Icons.volunteer_activism_rounded,
        label: l10n.shareADua,
        subtitle: l10n.shareDuaSubtitle,
        onTap: _showDuaPicker,
      ),
      (
        icon: Icons.star_rounded,
        label: l10n.shareANameOfAllah,
        subtitle: l10n.shareNameSubtitle,
        onTap: _showNamePicker,
      ),
      (
        icon: Icons.mosque_rounded,
        label: l10n.shareAHadith,
        subtitle: l10n.shareHadithSubtitle,
        onTap: _showHadithPicker,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: _kNavy,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          // Geometric watermark
          const Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              child: CustomPaint(
                painter: GeometricPatternPainter(color: _kGold, alpha: 0.07),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _kGold.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 4),
                child: Text(
                  l10n.shareSheetTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: _kGold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Divider(
                  color: _kGold.withValues(alpha: 0.22),
                  height: 1,
                ),
              ),
              if (_loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(
                    color: _kGold,
                    strokeWidth: 2.5,
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom +
                        MediaQuery.of(context).padding.bottom +
                        16,
                  ),
                  child: Column(
                    children: options
                        .map((o) => _ShareOptionTile(
                              icon: o.icon,
                              label: o.label,
                              subtitle: o.subtitle,
                              onTap: o.onTap,
                            ))
                        .toList(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Share option tile ─────────────────────────────────────────────────────────

class _ShareOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _ShareOptionTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: _kGold.withValues(alpha: 0.12),
        highlightColor: _kGold.withValues(alpha: 0.06),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _kGold.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _kGold.withValues(alpha: 0.35)),
                ),
                child: Icon(icon, color: _kGold, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _kCream,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: _kCream.withValues(alpha: 0.50),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: _kGold.withValues(alpha: 0.55),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Dua picker screen ─────────────────────────────────────────────────────────

class _DuaPickerScreen extends StatefulWidget {
  final void Function(CategorizedDua dua) onPick;
  const _DuaPickerScreen({required this.onPick});

  @override
  State<_DuaPickerScreen> createState() => _DuaPickerScreenState();
}

class _DuaPickerScreenState extends State<_DuaPickerScreen> {
  String _query = '';
  CategorizedDua? _selected;

  void _commit() {
    if (_selected == null) return;
    final dua = _selected!;
    Navigator.pop(context);
    widget.onPick(dua);
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = l10n.localeName;
    final duas   = allDuas.where((d) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return d.translationFor(locale).toLowerCase().contains(q) ||
          d.arabic.contains(q) ||
          d.transliteration.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: _kNavy,
      appBar: AppBar(
        backgroundColor: _kNavy,
        elevation: 0,
        iconTheme: const IconThemeData(color: _kGold),
        title: Text(
          l10n.sharePickDuaTitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: _kCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _kGold.withValues(alpha: 0.30)),
              ),
              child: TextField(
                style: GoogleFonts.lato(color: _kCream, fontSize: 14),
                decoration: InputDecoration(
                  hintText: l10n.searchDuas,
                  hintStyle: GoogleFonts.lato(
                    color: _kCream.withValues(alpha: 0.40),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: _kGold.withValues(alpha: 0.60),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 11),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
          ),
        ),
      ),
      // Sticky "Share This Dua" button — slides in when a dua is selected.
      bottomNavigationBar: AnimatedSwitcher(
        duration: const Duration(milliseconds: 260),
        transitionBuilder: (child, anim) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
          child: FadeTransition(opacity: anim, child: child),
        ),
        child: _selected != null
            ? Container(
                key: const ValueKey('share-btn'),
                color: _kNavy,
                padding: EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  MediaQuery.of(context).padding.bottom + 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD4AF37), Color(0xFFC9A84C)],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: _kGold.withValues(alpha: 0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        onTap: _commit,
                        borderRadius: BorderRadius.circular(14),
                        splashColor: Colors.white.withValues(alpha: 0.15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share_rounded,
                              color: _kNavy,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              l10n.shareThisDua,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: _kNavy,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(key: ValueKey('no-btn')),
      ),
      body: duas.isEmpty
          ? Center(
              child: Text(
                l10n.noDuasFound,
                style: GoogleFonts.lato(
                  color: _kCream.withValues(alpha: 0.50),
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(
                16,
                8,
                16,
                _selected != null ? 8 : 32,
              ),
              itemCount: duas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) {
                final dua   = duas[i];
                final isSel = _selected == dua;
                return _DuaCard(
                  dua: dua,
                  locale: locale,
                  isSelected: isSel,
                  onTap: () => setState(() => _selected = isSel ? null : dua),
                );
              },
            ),
    );
  }
}

// ── Shared bottom share button ────────────────────────────────────────────────

Widget _buildShareButton({
  required BuildContext context,
  required bool visible,
  required String label,
  required VoidCallback onTap,
}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 260),
    transitionBuilder: (child, anim) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
      child: FadeTransition(opacity: anim, child: child),
    ),
    child: visible
        ? Container(
            key: const ValueKey('share-btn'),
            color: _kNavy,
            padding: EdgeInsets.fromLTRB(
              16, 12, 16, MediaQuery.of(context).padding.bottom + 16,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD4AF37), Color(0xFFC9A84C)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: _kGold.withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(14),
                    splashColor: Colors.white.withValues(alpha: 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.share_rounded, color: _kNavy, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          label,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: _kNavy,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink(key: ValueKey('no-btn')),
  );
}

// ── Shared picker search bar ──────────────────────────────────────────────────

PreferredSizeWidget _buildPickerSearchBar({
  required String hintText,
  required ValueChanged<String> onChanged,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kGold.withValues(alpha: 0.30)),
        ),
        child: TextField(
          style: GoogleFonts.lato(color: _kCream, fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.lato(
              color: _kCream.withValues(alpha: 0.40),
              fontSize: 14,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: _kGold.withValues(alpha: 0.60),
              size: 20,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 11),
          ),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}

// ── Premium picker card ───────────────────────────────────────────────────────

class _PickerCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;
  const _PickerCard({required this.isSelected, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? _kGold.withValues(alpha: 0.70) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(color: _kGold.withValues(alpha: 0.22), blurRadius: 14)
          else
            const BoxShadow(color: Color(0x22000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: _kGold.withValues(alpha: 0.10),
          highlightColor: _kGold.withValues(alpha: 0.05),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(width: 3, color: _kGold),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF132235), _kCard],
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(11, 14, 12, 14),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _goldPill(String text) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
  decoration: BoxDecoration(
    color: _kGold.withValues(alpha: 0.12),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: _kGold.withValues(alpha: 0.40)),
  ),
  child: Text(
    text,
    style: GoogleFonts.lato(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: _kGold,
      letterSpacing: 0.3,
    ),
  ),
);

// ── Ayah picker screen ────────────────────────────────────────────────────────

class _AyahPickerScreen extends StatefulWidget {
  final void Function(ShareAyah ayah) onPick;
  const _AyahPickerScreen({required this.onPick});

  @override
  State<_AyahPickerScreen> createState() => _AyahPickerScreenState();
}

class _AyahPickerScreenState extends State<_AyahPickerScreen> {
  String _query = '';
  ShareAyah? _selected;

  void _commit() {
    if (_selected == null) return;
    final ayah = _selected!;
    Navigator.pop(context);
    widget.onPick(ayah);
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = l10n.localeName;

    final ayahs = shareAyahs.where((a) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return a.arabic.contains(q) ||
          a.transliteration.toLowerCase().contains(q) ||
          a.source.toLowerCase().contains(q) ||
          a.translationFor(locale).toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: _kNavy,
      appBar: AppBar(
        backgroundColor: _kNavy,
        elevation: 0,
        iconTheme: const IconThemeData(color: _kGold),
        title: Text(
          l10n.sharePickAyahTitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
        bottom: _buildPickerSearchBar(
          hintText: l10n.searchAyahs,
          onChanged: (v) => setState(() => _query = v),
        ),
      ),
      bottomNavigationBar: _buildShareButton(
        context: context,
        visible: _selected != null,
        label: l10n.shareThisAyah,
        onTap: _commit,
      ),
      body: ayahs.isEmpty
          ? Center(
              child: Text(
                l10n.noAyahsFoundShort,
                style: GoogleFonts.lato(
                  color: _kCream.withValues(alpha: 0.50),
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, _selected != null ? 8 : 32),
              itemCount: ayahs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) {
                final ayah  = ayahs[i];
                final isSel = _selected == ayah;
                return _AyahCard(
                  ayah: ayah,
                  locale: locale,
                  isSelected: isSel,
                  onTap: () => setState(() => _selected = isSel ? null : ayah),
                );
              },
            ),
    );
  }
}

// ── Ayah card ─────────────────────────────────────────────────────────────────

class _AyahCard extends StatelessWidget {
  final ShareAyah ayah;
  final String locale;
  final bool isSelected;
  final VoidCallback onTap;

  const _AyahCard({
    required this.ayah,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _PickerCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    ayah.arabic,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 22,
                      color: _kGold,
                      height: 1.6,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  ayah.translationFor(locale),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _kCream.withValues(alpha: 0.80),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                _goldPill(ayah.source),
              ],
            ),
          ),
          SizedBox(
            width: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isSelected
                  ? const Icon(Icons.check_circle_rounded,
                      key: ValueKey('check'), color: _kGold, size: 22)
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Name picker screen ────────────────────────────────────────────────────────

class _NamePickerScreen extends StatefulWidget {
  final void Function(AsmaName name) onPick;
  const _NamePickerScreen({required this.onPick});

  @override
  State<_NamePickerScreen> createState() => _NamePickerScreenState();
}

class _NamePickerScreenState extends State<_NamePickerScreen> {
  String _query = '';
  AsmaName? _selected;

  void _commit() {
    if (_selected == null) return;
    final name = _selected!;
    Navigator.pop(context);
    widget.onPick(name);
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = l10n.localeName;

    final names = asmaUlHusnaNames.where((n) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return n.arabic.contains(q) ||
          n.transliteration.toLowerCase().contains(q) ||
          n.meaningText(locale).toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: _kNavy,
      appBar: AppBar(
        backgroundColor: _kNavy,
        elevation: 0,
        iconTheme: const IconThemeData(color: _kGold),
        title: Text(
          l10n.sharePickNameTitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
        bottom: _buildPickerSearchBar(
          hintText: l10n.asmaSearchHint,
          onChanged: (v) => setState(() => _query = v),
        ),
      ),
      bottomNavigationBar: _buildShareButton(
        context: context,
        visible: _selected != null,
        label: l10n.shareThisName,
        onTap: _commit,
      ),
      body: names.isEmpty
          ? Center(
              child: Text(
                l10n.asmaNoResults,
                style: GoogleFonts.lato(
                  color: _kCream.withValues(alpha: 0.50),
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, _selected != null ? 8 : 32),
              itemCount: names.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) {
                final name  = names[i];
                final isSel = _selected == name;
                return _NameCard(
                  name: name,
                  locale: locale,
                  isSelected: isSel,
                  onTap: () => setState(() => _selected = isSel ? null : name),
                );
              },
            ),
    );
  }
}

// ── Name card ─────────────────────────────────────────────────────────────────

class _NameCard extends StatelessWidget {
  final AsmaName name;
  final String locale;
  final bool isSelected;
  final VoidCallback onTap;

  const _NameCard({
    required this.name,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _PickerCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _kGold.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(color: _kGold.withValues(alpha: 0.30)),
            ),
            child: Text(
              '${name.number}',
              style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _kGold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    name.arabic,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 24,
                      color: _kGold,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  name.transliteration,
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _kCream,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  name.meaningText(locale),
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: _kCream.withValues(alpha: 0.65),
                  ),
                ),
                const SizedBox(height: 5),
                Directionality(
                  textDirection: (locale == 'ar' || locale == 'ur' || locale == 'fa')
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Text(
                    name.explanationText(locale),
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: _kGold.withValues(alpha: 0.70),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isSelected
                  ? const Icon(Icons.check_circle_rounded,
                      key: ValueKey('check'), color: _kGold, size: 22)
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Hadith picker screen ──────────────────────────────────────────────────────

class _HadithPickerScreen extends StatefulWidget {
  final void Function(ShareHadith hadith) onPick;
  const _HadithPickerScreen({required this.onPick});

  @override
  State<_HadithPickerScreen> createState() => _HadithPickerScreenState();
}

class _HadithPickerScreenState extends State<_HadithPickerScreen> {
  String _query = '';
  ShareHadith? _selected;

  void _commit() {
    if (_selected == null) return;
    final hadith = _selected!;
    Navigator.pop(context);
    widget.onPick(hadith);
  }

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = l10n.localeName;

    final hadiths = shareHadiths.where((h) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return h.arabic.contains(q) ||
          h.transliteration.toLowerCase().contains(q) ||
          h.source.toLowerCase().contains(q) ||
          h.translationFor(locale).toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: _kNavy,
      appBar: AppBar(
        backgroundColor: _kNavy,
        elevation: 0,
        iconTheme: const IconThemeData(color: _kGold),
        title: Text(
          l10n.sharePickHadithTitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: _kGold,
          ),
        ),
        bottom: _buildPickerSearchBar(
          hintText: l10n.searchHadiths,
          onChanged: (v) => setState(() => _query = v),
        ),
      ),
      bottomNavigationBar: _buildShareButton(
        context: context,
        visible: _selected != null,
        label: l10n.shareThisHadith,
        onTap: _commit,
      ),
      body: hadiths.isEmpty
          ? Center(
              child: Text(
                l10n.noHadithsFound,
                style: GoogleFonts.lato(
                  color: _kCream.withValues(alpha: 0.50),
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, _selected != null ? 8 : 32),
              itemCount: hadiths.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) {
                final hadith = hadiths[i];
                final isSel  = _selected == hadith;
                return _HadithCard(
                  hadith: hadith,
                  locale: locale,
                  isSelected: isSel,
                  onTap: () => setState(() => _selected = isSel ? null : hadith),
                );
              },
            ),
    );
  }
}

// ── Hadith card ───────────────────────────────────────────────────────────────

class _HadithCard extends StatelessWidget {
  final ShareHadith hadith;
  final String locale;
  final bool isSelected;
  final VoidCallback onTap;

  const _HadithCard({
    required this.hadith,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _PickerCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    hadith.arabic,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 22,
                      color: _kGold,
                      height: 1.6,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  hadith.translationFor(locale),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _kCream.withValues(alpha: 0.80),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                _goldPill(hadith.source),
              ],
            ),
          ),
          SizedBox(
            width: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isSelected
                  ? const Icon(Icons.check_circle_rounded,
                      key: ValueKey('check'), color: _kGold, size: 22)
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Dua card (picker row) ─────────────────────────────────────────────────────

class _DuaCard extends StatelessWidget {
  final CategorizedDua dua;
  final String locale;
  final bool isSelected;
  final VoidCallback onTap;

  const _DuaCard({
    required this.dua,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _PickerCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    dua.arabic,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 22,
                      color: _kGold,
                      height: 1.6,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  dua.translationFor(locale),
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _kCream.withValues(alpha: 0.80),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                _goldPill(dua.source),
              ],
            ),
          ),
          SizedBox(
            width: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isSelected
                  ? const Icon(
                      Icons.check_circle_rounded,
                      key: ValueKey('check'),
                      color: _kGold,
                      size: 22,
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
        ],
      ),
    );
  }
}
