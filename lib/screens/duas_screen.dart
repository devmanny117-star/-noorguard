import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/duas_data.dart';
import '../theme/app_theme.dart';
import '../l10n/app_localizations.dart';
import '../widgets/font_size_slider.dart';

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
  final Set<int> _bookmarked = {};

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

  void _toggleBookmark(int index) {
    setState(() {
      if (_bookmarked.contains(index)) {
        _bookmarked.remove(index);
      } else {
        _bookmarked.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final duas = _visibleDuas;

    return Scaffold(
      backgroundColor: colors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _DuasSliverAppBar(
            searchController: _searchController,
            selectedCategoryId: _selectedCategoryId,
            onCategorySelected: _selectCategory,
          ),
          SliverToBoxAdapter(
            child: FontSizeSlider(
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
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
                            child: Text(
                              l10n.supplications(duas.length),
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: colors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                            itemCount: duas.length,
                            itemBuilder: (context, i) {
                              final globalIndex = allDuas.indexOf(duas[i]);
                              return _DuaCard(
                                dua: duas[i],
                                isBookmarked: _bookmarked.contains(globalIndex),
                                onBookmarkTap: () => _toggleBookmark(globalIndex),
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
    );
  }
}

// ─── Sliver App Bar ───────────────────────────────────────────────────────────

class _DuasSliverAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedCategoryId;
  final ValueChanged<String> onCategorySelected;

  const _DuasSliverAppBar({
    required this.searchController,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 176,
      backgroundColor: colors.background,
      elevation: 0,
      scrolledUnderElevation: 0.6,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,
            size: 20, color: colors.primaryText),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: _Header(),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(104),
        child: Container(
          color: colors.background,
          child: Column(
            children: [
              _SearchBar(controller: searchController),
              const SizedBox(height: 8),
              _CategoryRow(
                selected: selectedCategoryId,
                onSelected: onCategorySelected,
              ),
              const SizedBox(height: 6),
              Container(height: 1, color: colors.border),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: colors.background,
      padding: const EdgeInsets.only(top: 90, left: 22, right: 22, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.duas,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: colors.primaryText,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.dailySupplications,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: colors.secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'دُعَاء',
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 38,
                  color: AppColors.gold.withValues(alpha: 0.15),
                  height: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
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
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: colors.secondaryBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          controller: controller,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: colors.primaryText,
          ),
          decoration: InputDecoration(
            hintText: l10n.searchDuas,
            hintStyle: GoogleFonts.lato(
              fontSize: 14,
              color: colors.secondaryText,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color: colors.secondaryText,
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
                        color: colors.secondaryText,
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
    case 'morning_evening':
      return l10n.morningAndEvening;
    case 'prayer':
      return l10n.prayer;
    case 'food':
      return l10n.foodAndDrink;
    case 'travel':
      return l10n.travel;
    case 'home':
      return l10n.home;
    case 'anxiety':
      return l10n.anxietyAndStress;
    case 'gratitude':
      return l10n.gratitude;
    case 'protection':
      return l10n.protection;
    case 'family':
      return l10n.family;
    case 'forgiveness':
      return l10n.forgiveness;
    default:
      return category.label;
  }
}

// ─── Category Row ─────────────────────────────────────────────────────────────

class _CategoryRow extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const _CategoryRow({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
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
                color: isActive ? AppColors.gold : colors.secondaryBg,
                borderRadius: BorderRadius.circular(20),
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
                      color: isActive ? Colors.white : colors.secondaryText,
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

// ─── Dua Card ────────────────────────────────────────────────────────────────

class _DuaCard extends StatelessWidget {
  final CategorizedDua dua;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  const _DuaCard({
    required this.dua,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  String? _localizedTranslation(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') return null;
    return dua.translationFor(locale);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final translation = _localizedTranslation(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.055),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: colors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                      fontSize: 24,
                      color: colors.primaryText,
                      height: 1.85,
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
                      color: isBookmarked ? AppColors.gold : colors.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: 1.5,
                  width: 36,
                  color: AppColors.gold,
                ),
                Expanded(
                  child: Container(height: 1, color: colors.border),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              dua.transliteration,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: colors.secondaryText,
                height: 1.6,
              ),
            ),
          ),

          if (translation != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                translation,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: colors.primaryText,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],

          const SizedBox(height: 14),

          Container(
            decoration: BoxDecoration(
              color: colors.secondaryBg,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.menu_book_outlined,
                    size: 13, color: AppColors.gold),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dua.source,
                    style: GoogleFonts.lato(
                      fontSize: 11.5,
                      color: AppColors.gold,
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
    final colors = context.appColors;
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
              color: colors.primaryText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different category or search term.',
            style: GoogleFonts.lato(fontSize: 13, color: colors.secondaryText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
