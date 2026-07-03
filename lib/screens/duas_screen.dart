import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/duas_data.dart';
import '../l10n/app_localizations.dart';
import '../services/bookmark_service.dart';
import '../services/share_helper.dart';
import 'saved_duas_screen.dart';
import '../widgets/font_size_slider.dart';
import '../widgets/geometric_pattern_painter.dart';

const _kNavy  = Color(0xFF0D1B2A);
const _kCard  = Color(0xFF152840);
const _kGold  = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen>
    with SingleTickerProviderStateMixin {
  String _selectedCategoryId = 'all';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Set<String> _bookmarked = {};

  late final AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  int _fontScaleIndex = kDefaultFontScaleIndex;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.trim().toLowerCase());
    });
    _loadFontScale();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final saved = await BookmarkService.loadDuaBookmarks();
    if (mounted) setState(() => _bookmarked = saved);
  }

  Future<void> _loadFontScale() async {
    final index = await loadFontScaleIndex('duas');
    if (mounted) setState(() => _fontScaleIndex = index);
  }

  void _onFontScaleChanged(int index) {
    setState(() => _fontScaleIndex = index);
    saveFontScaleIndex('duas', index);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<CategorizedDua> get _visibleDuas {
    List<CategorizedDua> base;
    if (_selectedCategoryId == 'all') {
      base = allDuas;
    } else {
      base = allDuaCategories
          .firstWhere((c) => c.id == _selectedCategoryId)
          .duas;
    }
    if (_searchQuery.isEmpty) return base;
    final locale = Localizations.localeOf(context).languageCode;
    return base.where((d) {
      return d.translationFor(locale).toLowerCase().contains(_searchQuery) ||
          d.transliteration.toLowerCase().contains(_searchQuery) ||
          d.arabic.contains(_searchQuery) ||
          d.source.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  void _selectCategory(String id) {
    if (id == _selectedCategoryId) return;
    _fadeController.reset();
    setState(() => _selectedCategoryId = id);
    _fadeController.forward();
  }

  Future<void> _toggleBookmark(String arabic) async {
    final saved = await BookmarkService.toggleDuaBookmark(arabic);
    if (mounted) setState(() => _bookmarked = saved);
  }

  Future<void> _shareDua(CategorizedDua dua) async {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final translation = locale == 'ar' ? dua.arabic : dua.translationFor(locale);
    try {
      await shareContent(
        context: context,
        typeLabel: l10n.shareCardDuaLabel,
        arabic: dua.arabic,
        transliteration: dua.transliteration,
        translation: translation,
        source: dua.source,
        brandingLabel: l10n.shareViaLabel,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l10n.shareError,
            style: GoogleFonts.lato(color: Colors.white)),
        backgroundColor: const Color(0xFF2C2C2A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final duas = _visibleDuas;

    return Scaffold(
      backgroundColor: _kNavy,
      body: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(
              painter: GeometricPatternPainter(color: _kGold, alpha: 0.04),
            ),
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _DuasSliverAppBar(
                searchController: _searchController,
                selectedCategoryId: _selectedCategoryId,
                onCategorySelected: _selectCategory,
                onSavedTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SavedDuasScreen()),
                  );
                  _loadBookmarks();
                },
              ),
              SliverToBoxAdapter(
                child: _PremiumFontSizeSlider(
                  index: _fontScaleIndex,
                  onChanged: _onFontScaleChanged,
                ),
              ),
              SliverToBoxAdapter(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(kFontScaleSteps[_fontScaleIndex]),
                  ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: duas.isEmpty
                        ? const _EmptyState()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                                child: Text(
                                  l10n.supplications(duas.length),
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: _kCream.withValues(alpha: 0.45),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(16, 6, 16, 40),
                                itemCount: duas.length,
                                itemBuilder: (context, i) {
                                  return _DuaCard(
                                    dua: duas[i],
                                    isBookmarked:
                                        _bookmarked.contains(duas[i].arabic),
                                    onBookmarkTap: () =>
                                        _toggleBookmark(duas[i].arabic),
                                    onShareTap: () => _shareDua(duas[i]),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Sliver App Bar ───────────────────────────────────────────────────────────

class _DuasSliverAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedCategoryId;
  final ValueChanged<String> onCategorySelected;
  final VoidCallback onSavedTap;

  const _DuasSliverAppBar({
    required this.searchController,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.onSavedTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SliverAppBar(
      pinned: true,
      backgroundColor: _kNavy,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _kCard,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _kGold.withValues(alpha: 0.3)),
          ),
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 16, color: _kGold),
        ),
      ),
      title: Text(
        l10n.duas,
        style: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: _kGold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark_rounded, color: _kGold),
          tooltip: l10n.savedDuas,
          onPressed: onSavedTap,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(112),
        child: Container(
          color: _kNavy,
          child: Column(
            children: [
              const SizedBox(height: 12),
              _SearchBar(controller: searchController),
              const SizedBox(height: 8),
              _CategoryRow(
                selected: selectedCategoryId,
                onSelected: onCategorySelected,
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                color: _kGold.withValues(alpha: 0.15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Search Bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kGold.withValues(alpha: 0.4)),
        ),
        child: TextField(
          controller: controller,
          style: GoogleFonts.lato(fontSize: 14, color: _kCream),
          decoration: InputDecoration(
            hintText: l10n.searchDuas,
            hintStyle: GoogleFonts.lato(
              fontSize: 14,
              color: _kCream.withValues(alpha: 0.35),
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color: _kGold.withValues(alpha: 0.8),
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (_, value, __) => value.text.isEmpty
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () => controller.clear(),
                      child: Icon(
                        Icons.cancel_rounded,
                        size: 18,
                        color: _kGold.withValues(alpha: 0.6),
                      ),
                    ),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}

String _localizedCategoryLabel(AppLocalizations l10n, DuaCategory category) {
  switch (category.id) {
    case 'morning_evening': return l10n.morningAndEvening;
    case 'prayer':          return l10n.prayer;
    case 'food':            return l10n.foodAndDrink;
    case 'travel':          return l10n.travel;
    case 'home':            return l10n.home;
    case 'anxiety':         return l10n.anxietyAndStress;
    case 'gratitude':       return l10n.gratitude;
    case 'protection':      return l10n.protection;
    case 'family':          return l10n.family;
    case 'forgiveness':     return l10n.forgiveness;
    default:                return category.label;
  }
}

// ─── Category Row ─────────────────────────────────────────────────────────────

class _CategoryRow extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const _CategoryRow({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categories = [
      ('all', l10n.all, '📖'),
      ...allDuaCategories.map((c) => (c.id, _localizedCategoryLabel(l10n, c), c.emoji)),
    ];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final (id, label, emoji) = categories[i];
          final isActive = selected == id;
          return GestureDetector(
            onTap: () => onSelected(id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? _kGold : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive
                      ? _kGold
                      : _kGold.withValues(alpha: 0.35),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 13)),
                  const SizedBox(width: 5),
                  Text(
                    label,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isActive ? _kNavy : _kCream.withValues(alpha: 0.7),
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

// ─── Font Size Slider ─────────────────────────────────────────────────────────

class _PremiumFontSizeSlider extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const _PremiumFontSizeSlider({required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
      child: Row(
        children: [
          Text(
            'A',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _kGold.withValues(alpha: 0.45),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                activeTrackColor: _kGold.withValues(alpha: 0.7),
                inactiveTrackColor: _kGold.withValues(alpha: 0.15),
                thumbColor: _kGold,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                tickMarkShape: SliderTickMarkShape.noTickMark,
              ),
              child: Slider(
                value: index.toDouble(),
                min: 0,
                max: (kFontScaleSteps.length - 1).toDouble(),
                divisions: kFontScaleSteps.length - 1,
                onChanged: (v) => onChanged(v.round()),
              ),
            ),
          ),
          Text(
            'A',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _kGold.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Dua Card ────────────────────────────────────────────────────────────────

class _DuaCard extends StatelessWidget {
  final CategorizedDua dua;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;
  final VoidCallback onShareTap;

  const _DuaCard({
    required this.dua,
    required this.isBookmarked,
    required this.onBookmarkTap,
    required this.onShareTap,
  });

  String? _localizedTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') return null;
    return dua.translationFor(locale);
  }

  @override
  Widget build(BuildContext context) {
    final translation = _localizedTranslation(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Arabic text + share + bookmark
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    dua.arabic,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 26,
                      color: _kGold,
                      height: 1.85,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onShareTap,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _kGold.withValues(alpha: 0.10),
                      border: Border.all(
                          color: _kGold.withValues(alpha: 0.50), width: 1),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.share_rounded,
                      size: 15,
                      color: _kGold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onBookmarkTap,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: Icon(
                      isBookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      key: ValueKey(isBookmarked),
                      size: 22,
                      color: _kGold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: 1.5,
                  width: 36,
                  decoration: BoxDecoration(
                    color: _kGold,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: _kGold.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Transliteration
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              dua.transliteration,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: _kCream.withValues(alpha: 0.6),
                height: 1.6,
              ),
            ),
          ),

          // Translation
          if (translation != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                translation,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: _kCream.withValues(alpha: 0.88),
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],

          const SizedBox(height: 14),

          // Source footer
          Container(
            decoration: BoxDecoration(
              color: _kNavy.withValues(alpha: 0.5),
              border: Border(
                top: BorderSide(color: _kGold.withValues(alpha: 0.15)),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.menu_book_outlined,
                    size: 13, color: _kGold.withValues(alpha: 0.8)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dua.source,
                    style: GoogleFonts.lato(
                      fontSize: 11.5,
                      color: _kGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          const Text('🤲', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          Text(
            l10n.noDuasFound,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _kCream,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.duasSearchEmpty,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: _kCream.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
