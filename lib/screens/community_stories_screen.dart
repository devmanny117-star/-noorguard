import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../data/countries.dart';
import '../l10n/app_localizations.dart';
import '../models/community_story.dart';
import '../services/community_stories_service.dart';
import '../services/share_helper.dart';
import '../widgets/geometric_pattern_painter.dart';
import '../widgets/story_avatar.dart';

const _kBg = Color(0xFF0A1628);
const _kNavy = Color(0xFF0D1B2A);
const _kCard = Color(0xFF0D1F35);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);

/// Bundled backgrounds selectable in the submit form: mosque set first,
/// then the general stories set.
final List<String> _storyBackgroundAssets = List.unmodifiable([
  for (var i = 1; i <= 8; i++) 'assets/images/mosques/mosque_$i.jpg',
  for (var i = 1; i <= 16; i++) 'assets/images/stories/story_$i.jpg',
]);

/// Classic serif ("Georgia") used for the featured story quote. Georgia is
/// bundled on iOS/macOS/web; Android falls back to its system serif.
TextStyle _storySerif({required Color color, double fontSize = 14.5}) =>
    TextStyle(
      fontFamily: 'Georgia',
      fontFamilyFallback: const ['Times New Roman', 'serif'],
      fontStyle: FontStyle.italic,
      fontSize: fontSize,
      height: 1.7,
      color: color,
    );

/// Oversized decorative quote mark for the featured card.
TextStyle _quoteMarkStyle() => TextStyle(
      fontFamily: 'Georgia',
      fontFamilyFallback: const ['Times New Roman', 'serif'],
      fontSize: 64,
      height: 0.7,
      fontWeight: FontWeight.w700,
      color: _kGold.withValues(alpha: 0.35),
    );

String storyCategoryLabel(AppLocalizations l10n, StoryCategory category) {
  switch (category) {
    case StoryCategory.revert:
      return l10n.storyCategoryRevert;
    case StoryCategory.bornMuslim:
      return l10n.storyCategoryBornMuslim;
    case StoryCategory.returning:
      return l10n.storyCategoryReturning;
  }
}

String storyDisplayName(AppLocalizations l10n, CommunityStory story) =>
    (story.anonymous || story.name.isEmpty)
        ? l10n.storiesAnonymous
        : story.name;

String _formatMonthYear(BuildContext context, DateTime date) =>
    DateFormat.yMMM(Localizations.localeOf(context).toString()).format(date);

Future<void> shareStory(BuildContext context, CommunityStory story) async {
  final l10n = AppLocalizations.of(context)!;
  final excerpt = story.story.length > 220
      ? '${story.story.substring(0, 220)}…'
      : story.story;
  try {
    await shareContent(
      context: context,
      typeLabel: '✦ ${l10n.storiesShareCardLabel}',
      arabic: 'بِسْمِ اللَّهِ',
      transliteration: '',
      translation: '"$excerpt"',
      source:
          '${storyDisplayName(l10n, story)} · ${story.countryFlag} ${story.country}',
      brandingLabel: l10n.shareViaLabel,
    );
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.shareError)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class CommunityStoriesScreen extends StatefulWidget {
  const CommunityStoriesScreen({super.key});

  @override
  State<CommunityStoriesScreen> createState() => _CommunityStoriesScreenState();
}

class _CommunityStoriesScreenState extends State<CommunityStoriesScreen> {
  final _service = CommunityStoriesService();

  /// null = All
  StoryCategory? _filter;

  /// True when the "Saved" filter tab is active.
  bool _savedOnly = false;

  /// Locally bookmarked story ids (SharedPreferences).
  Set<String> _saved = {};

  /// This install's anonymous user id — the edit button shows only on
  /// stories whose `userId` matches it.
  String? _uid;

  /// The user's own pending submissions (created once, not per build).
  Stream<List<CommunityStory>>? _pendingStream;

  @override
  void initState() {
    super.initState();
    CommunityStoriesService.userId().then((id) {
      if (mounted) setState(() => _uid = id);
    });
    CommunityStoriesService.savedStoryIds().then((ids) {
      if (mounted) setState(() => _saved = ids);
    });
    if (CommunityStoriesService.firebaseAvailable) {
      _pendingStream = _service.myPendingStories();
    }
  }

  Future<void> _toggleSaved(String id) async {
    final ids = await CommunityStoriesService.toggleSavedStory(id);
    if (mounted) setState(() => _saved = ids);
  }

  void _openSubmitSheet() {
    final l10n = AppLocalizations.of(context)!;
    if (!CommunityStoriesService.firebaseAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.storiesSubmitError)),
      );
      return;
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SubmitStorySheet(service: _service),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        foregroundColor: _kGold,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Subtle Islamic geometric pattern behind the header, fading out.
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: SizedBox(
              height: 150,
              child: IgnorePointer(
                child: ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.transparent],
                  ).createShader(rect),
                  child: const CustomPaint(
                    size: Size.infinite,
                    painter: GeometricPatternPainter(
                      color: _kGold,
                      alpha: 0.06,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _buildBody(context, l10n),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(onShareYours: _openSubmitSheet),
        const SizedBox(height: 14),
        _FilterTabs(
          selectedCategory: _filter,
          savedOnly: _savedOnly,
          onSelected: (f, saved) => setState(() {
            _filter = f;
            _savedOnly = saved;
          }),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: !CommunityStoriesService.firebaseAvailable
              ? _EmptyState(
                  title: l10n.storiesEmptyTitle,
                  subtitle: l10n.storiesEmptySubtitle,
                )
              : StreamBuilder<List<CommunityStory>>(
                  stream: _service.approvedStories(),
                  builder: (context, snap) {
                    if (snap.hasError) {
                      return _EmptyState(
                        title: l10n.storiesLoadError,
                        subtitle: '',
                      );
                    }
                    if (!snap.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(color: _kGold),
                      );
                    }
                    final all = snap.data!;
                    final featured = (_filter == null && !_savedOnly)
                        ? all.where((s) => s.featured).firstOrNull
                        : null;
                    final regular = all
                        .where((s) =>
                            (_savedOnly
                                ? _saved.contains(s.id)
                                : (_filter == null ||
                                    s.category == _filter)) &&
                            s.id != featured?.id)
                        .toList();
                    return StreamBuilder<List<CommunityStory>>(
                      stream: _pendingStream,
                      builder: (context, pendingSnap) {
                        // Own pending stories show only on the "All" tab.
                        final pending = (_filter == null && !_savedOnly)
                            ? (pendingSnap.data ?? const <CommunityStory>[])
                            : const <CommunityStory>[];
                        if (featured == null &&
                            regular.isEmpty &&
                            pending.isEmpty) {
                          return _EmptyState(
                            title: _savedOnly
                                ? l10n.storiesSavedEmpty
                                : l10n.storiesEmptyTitle,
                            subtitle:
                                _savedOnly ? '' : l10n.storiesEmptySubtitle,
                          );
                        }
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
                          children: [
                            for (final story in pending) ...[
                              _StoryCard(
                                story: story,
                                service: _service,
                                currentUserId: _uid,
                                pending: true,
                                saved: _saved.contains(story.id),
                                onToggleSave: () => _toggleSaved(story.id),
                              ),
                              const SizedBox(height: 14),
                            ],
                            if (featured != null) ...[
                              _FeaturedStoryCard(
                                story: featured,
                                service: _service,
                                currentUserId: _uid,
                                saved: _saved.contains(featured.id),
                                onToggleSave: () => _toggleSaved(featured.id),
                              ),
                              const SizedBox(height: 16),
                            ],
                            for (final story in regular) ...[
                              _StoryCard(
                                story: story,
                                service: _service,
                                currentUserId: _uid,
                                saved: _saved.contains(story.id),
                                onToggleSave: () => _toggleSaved(story.id),
                              ),
                              const SizedBox(height: 14),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HEADER
// ─────────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final VoidCallback onShareYours;
  const _Header({required this.onShareYours});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 34,
            height: 34,
            child: CustomPaint(
              painter: CrescentStarPainter(color: _kGold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.ourStories,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: _kGold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.communityStoriesScreenSubtitle,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: _kGold.withValues(alpha: 0.65),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onShareYours,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: _kGold,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: _kGold.withValues(alpha: 0.30),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '✍️ ${l10n.storiesShareYours}',
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: _kBg,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FILTER TABS
// ─────────────────────────────────────────────────────────────────────────────

class _FilterTabs extends StatelessWidget {
  final StoryCategory? selectedCategory;
  final bool savedOnly;
  final void Function(StoryCategory? category, bool saved) onSelected;

  const _FilterTabs({
    required this.selectedCategory,
    required this.savedOnly,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // (category, savedTab, label)
    final tabs = <(StoryCategory?, bool, String)>[
      (null, false, l10n.all),
      (StoryCategory.revert, false, l10n.storiesFilterReverts),
      (StoryCategory.bornMuslim, false, l10n.storyCategoryBornMuslim),
      (StoryCategory.returning, false, l10n.storyCategoryReturning),
      (null, true, l10n.storiesFilterSaved),
    ];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final (category, savedTab, label) = tabs[i];
          final isActive = savedTab
              ? savedOnly
              : (!savedOnly && selectedCategory == category);
          return GestureDetector(
            onTap: () => onSelected(category, savedTab),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: isActive ? _kGold : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive ? _kGold : _kGold.withValues(alpha: 0.45),
                ),
              ),
              child: Text(
                label,
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isActive ? _kBg : _kGold.withValues(alpha: 0.85),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FEATURED STORY CARD
// ─────────────────────────────────────────────────────────────────────────────

class _FeaturedStoryCard extends StatelessWidget {
  final CommunityStory story;
  final CommunityStoriesService service;
  final String? currentUserId;
  final bool saved;
  final VoidCallback onToggleSave;

  const _FeaturedStoryCard({
    required this.story,
    required this.service,
    required this.saved,
    required this.onToggleSave,
    this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = storyDisplayName(l10n, story);
    final isMine = currentUserId != null && story.userId == currentUserId;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D2235),
            Color(0xFF0A1628),
            Color(0xFF0D1E30),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kGold.withValues(alpha: 0.40)),
        boxShadow: [
          BoxShadow(
            color: _kGold.withValues(alpha: 0.13),
            blurRadius: 24,
          ),
          BoxShadow(
            color: _kGold.withValues(alpha: 0.27),
            blurRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // ── Background: chosen image, else geometric watermarks ─────
          if (story.backgroundImage != null) ...[
            Positioned.fill(
              child: Image.asset(
                story.backgroundImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.45)),
            ),
          ] else ...[
            const Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: Opacity(
                    opacity: 0.04,
                    child: SizedBox(
                      width: 220,
                      height: 220,
                      child: CustomPaint(
                        painter: _HexagonWatermarkPainter(color: _kGold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const PositionedDirectional(
              bottom: -18,
              end: -14,
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.06,
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: CustomPaint(
                      painter: _CrescentPainter(color: _kGold),
                    ),
                  ),
                ),
              ),
            ),
          ],
          // ── Content ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(18, 16, 18, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      '✦ ${l10n.storiesFeaturedLabel.toUpperCase()}',
                      style: GoogleFonts.lato(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                        color: _kGold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [
                              _kGold.withValues(alpha: 0.53),
                              _kGold.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isMine) ...[
                      const SizedBox(width: 8),
                      _EditButton(
                        onTap: () => _openEditSheet(context, service, story),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('“', style: _quoteMarkStyle()),
                ),
                Text(
                  story.story,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: _storySerif(color: _kCream, fontSize: 15),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('”', style: _quoteMarkStyle()),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _kGold.withValues(alpha: 0.0),
                        _kGold.withValues(alpha: 0.33),
                        _kGold.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: _kGold.withValues(alpha: 0.35),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: _AuthorAvatar(
                        story: story,
                        size: 38,
                        borderWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: _kGold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${story.countryFlag} ${story.country}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontSize: 11.5,
                              color: _kCream.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (story.shahadaDate != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _kGold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          l10n.storyShahadaDate('${story.shahadaDate!.year}'),
                          style: GoogleFonts.lato(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w800,
                            color: _kBg,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                _ReactionsRow(
                  story: story,
                  service: service,
                  saved: saved,
                  onToggleSave: onToggleSave,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STORY CARD
// ─────────────────────────────────────────────────────────────────────────────

class _StoryCard extends StatefulWidget {
  final CommunityStory story;
  final CommunityStoriesService service;
  final String? currentUserId;

  /// True for the user's own not-yet-approved submission.
  final bool pending;
  final bool saved;
  final VoidCallback onToggleSave;

  const _StoryCard({
    required this.story,
    required this.service,
    required this.saved,
    required this.onToggleSave,
    this.currentUserId,
    this.pending = false,
  });

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final story = widget.story;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kGold.withValues(alpha: 0.15)),
      ),
      child: Stack(
        children: [
          // Chosen background image with a dark overlay for readability;
          // no image = plain card color (Bismillah placeholder look).
          if (story.backgroundImage != null) ...[
            Positioned.fill(
              child: Image.asset(
                story.backgroundImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.45)),
            ),
          ],
          // Gold accent strip on the start edge.
          PositionedDirectional(
            start: 0,
            top: 0,
            bottom: 0,
            child: Container(width: 3, color: _kGold),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(19, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Category badge + timestamp ──────────────────────────
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _kGold.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: _kGold.withValues(alpha: 0.55)),
                      ),
                      child: Text(
                        storyCategoryLabel(l10n, story.category),
                        style: GoogleFonts.lato(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: _kGold,
                        ),
                      ),
                    ),
                    if (widget.pending) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _kGold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          l10n.storiesPendingReview,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: _kBg,
                          ),
                        ),
                      ),
                    ],
                    const Spacer(),
                    if (story.dateSubmitted != null)
                      Text(
                        _formatMonthYear(context, story.dateSubmitted!),
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          color: _kCream.withValues(alpha: 0.5),
                        ),
                      ),
                    if (widget.currentUserId != null &&
                        story.userId == widget.currentUserId) ...[
                      const SizedBox(width: 8),
                      _EditButton(
                        onTap: () =>
                            _openEditSheet(context, widget.service, story),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                // ── Author row ──────────────────────────────────────────
                Row(
                  children: [
                    _AuthorAvatar(story: story, size: 40),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storyDisplayName(l10n, story),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: _kGold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            [
                              '${story.countryFlag} ${story.country}',
                              if (story.shahadaDate != null)
                                l10n.storyShahadaDate(
                                    '${story.shahadaDate!.year}'),
                            ].join(' · '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontSize: 11.5,
                              color: _kCream.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  story.story,
                  maxLines: _expanded ? null : 3,
                  overflow: _expanded ? null : TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 13.5,
                    color: _kCream.withValues(alpha: 0.88),
                    height: 1.55,
                  ),
                ),
                if (!_expanded && story.story.length > 140) ...[
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => setState(() => _expanded = true),
                    child: Text(
                      l10n.storiesReadMore,
                      style: GoogleFonts.lato(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: _kGold,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                _ReactionsRow(
                  story: story,
                  service: widget.service,
                  saved: widget.saved,
                  onToggleSave: widget.onToggleSave,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Opens the submission sheet pre-filled with an existing story for editing.
void _openEditSheet(
  BuildContext context,
  CommunityStoriesService service,
  CommunityStory story,
) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _SubmitStorySheet(service: service, editing: story),
  );
}

/// Small gold pencil button shown on the user's own stories.
class _EditButton extends StatelessWidget {
  final VoidCallback onTap;
  const _EditButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _kGold.withValues(alpha: 0.12),
          border: Border.all(color: _kGold.withValues(alpha: 0.55)),
        ),
        child: const Icon(Icons.edit_rounded, size: 13, color: _kGold),
      ),
    );
  }
}

class _AuthorAvatar extends StatelessWidget {
  final CommunityStory story;
  final double size;
  final double borderWidth;
  const _AuthorAvatar({
    required this.story,
    this.size = 40,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final initials = (story.anonymous || story.name.isEmpty)
        ? l10n.storiesAnonymous.substring(0, 1).toUpperCase()
        : story.initials;
    if (story.photoUrl == null) {
      return StoryAvatar(
        avatarType: story.avatarType ?? 'initials',
        avatarData: story.avatarData,
        initials: initials,
        size: size,
        borderWidth: borderWidth,
      );
    }
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _kGold.withValues(alpha: 0.12),
        border: Border.all(
          color: _kGold.withValues(alpha: 0.7),
          width: borderWidth,
        ),
      ),
      child: Image.network(
        story.photoUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            initials,
            style: GoogleFonts.playfairDisplay(
              fontSize: size * 0.35,
              fontWeight: FontWeight.w800,
              color: _kGold,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// REACTIONS ROW
// ─────────────────────────────────────────────────────────────────────────────

class _ReactionsRow extends StatelessWidget {
  final CommunityStory story;
  final CommunityStoriesService service;
  final bool saved;
  final VoidCallback onToggleSave;

  const _ReactionsRow({
    required this.story,
    required this.service,
    required this.saved,
    required this.onToggleSave,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserReactions>(
      stream: service.userReactions(story.id),
      builder: (context, snap) {
        final mine = snap.data ?? const UserReactions();
        return Row(
          children: [
            _ReactionChip(
              emoji: '🤲',
              count: story.duaCount,
              active: mine.dua,
              onTap: () => service.toggleReaction(story.id, 'dua'),
            ),
            const SizedBox(width: 8),
            _ReactionChip(
              emoji: '❤️',
              count: story.heartCount,
              active: mine.heart,
              onTap: () => service.toggleReaction(story.id, 'heart'),
            ),
            const SizedBox(width: 8),
            _ReactionChip(
              emoji: '💬',
              count: story.commentCount,
              active: false,
              onTap: () => _openComments(context),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onToggleSave,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kGold.withValues(alpha: saved ? 0.25 : 0.10),
                  border: Border.all(
                    color: _kGold.withValues(alpha: saved ? 0.9 : 0.5),
                  ),
                ),
                child: Icon(
                  saved
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  size: 14,
                  color: _kGold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => shareStory(context, story),
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kGold.withValues(alpha: 0.10),
                  border: Border.all(color: _kGold.withValues(alpha: 0.5)),
                ),
                child: const Icon(Icons.share_rounded, size: 14, color: _kGold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _openComments(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CommentsSheet(story: story, service: service),
    );
  }
}

class _ReactionChip extends StatelessWidget {
  final String emoji;
  final int count;
  final bool active;
  final VoidCallback onTap;

  const _ReactionChip({
    required this.emoji,
    required this.count,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _kGold.withValues(alpha: active ? 0.18 : 0.09),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _kGold.withValues(alpha: active ? 0.7 : 0.3),
          ),
        ),
        child: Text(
          '$emoji $count',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: active ? _kGold : _kGold.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// COMMENTS SHEET
// ─────────────────────────────────────────────────────────────────────────────

class _CommentsSheet extends StatefulWidget {
  final CommunityStory story;
  final CommunityStoriesService service;

  const _CommentsSheet({required this.story, required this.service});

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  final _controller = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final l10n = AppLocalizations.of(context)!;
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      final savedName = await CommunityStoriesService.savedAuthorName();
      await widget.service.addComment(
        storyId: widget.story.id,
        name: savedName.isEmpty ? l10n.storiesAnonymous : savedName,
        comment: text,
      );
      _controller.clear();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storiesSubmitError)),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: MediaQuery.of(context).size.height * 0.72,
      decoration: const BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(top: 10, bottom: 14),
            decoration: BoxDecoration(
              color: _kGold.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            l10n.storiesComments,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<StoryComment>>(
              stream: widget.service.comments(widget.story.id),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: _kGold),
                  );
                }
                final comments = snap.data!;
                if (comments.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.storiesAddComment,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: _kCream.withValues(alpha: 0.4),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  itemCount: comments.length,
                  separatorBuilder: (_, __) => Divider(
                    color: _kGold.withValues(alpha: 0.10),
                    height: 18,
                  ),
                  itemBuilder: (context, i) {
                    final c = comments[i];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                c.name.isEmpty ? l10n.storiesAnonymous : c.name,
                                style: GoogleFonts.lato(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700,
                                  color: _kGold,
                                ),
                              ),
                            ),
                            if (c.timestamp != null)
                              Text(
                                DateFormat.yMMMd(
                                  Localizations.localeOf(context).toString(),
                                ).format(c.timestamp!),
                                style: GoogleFonts.lato(
                                  fontSize: 10.5,
                                  color: _kCream.withValues(alpha: 0.4),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          c.comment,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: _kCream.withValues(alpha: 0.85),
                            height: 1.45,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: GoogleFonts.lato(fontSize: 13.5, color: _kCream),
                    maxLength: 500,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: l10n.storiesAddComment,
                      hintStyle: GoogleFonts.lato(
                        fontSize: 13,
                        color: _kCream.withValues(alpha: 0.35),
                      ),
                      filled: true,
                      fillColor: _kNavy,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide:
                            BorderSide(color: _kGold.withValues(alpha: 0.35)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: const BorderSide(color: _kGold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: _kGold,
                    ),
                    child: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color: _kNavy,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.send_rounded,
                            size: 18, color: _kNavy),
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

// ─────────────────────────────────────────────────────────────────────────────
// SUBMIT STORY SHEET
// ─────────────────────────────────────────────────────────────────────────────

class _SubmitStorySheet extends StatefulWidget {
  final CommunityStoriesService service;

  /// Non-null = editing an existing story: fields are pre-filled and saving
  /// updates the document in place (status untouched, no re-moderation).
  final CommunityStory? editing;
  const _SubmitStorySheet({required this.service, this.editing});

  @override
  State<_SubmitStorySheet> createState() => _SubmitStorySheetState();
}

class _SubmitStorySheetState extends State<_SubmitStorySheet>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _storyController = TextEditingController();
  final _countryController = TextEditingController();
  final _storyFocus = FocusNode();

  /// Drives the gold pulsing border while the card editor is focused.
  late final AnimationController _pulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  );
  bool _anonymous = false;
  Country? _country;
  StoryCategory _category = StoryCategory.revert;
  DateTime? _shahadaDate;

  /// Selected background asset path; null = none (Bismillah placeholder).
  String? _background;

  /// Avatar style: 'initials' | 'icon' | 'pattern'.
  String _avatarType = 'initials';

  /// Icon id ('icon') or pattern seed ('pattern'); null for 'initials'.
  String? _avatarData;

  /// This install's user id — seeds the generated pattern avatars.
  String? _sheetUid;
  bool _submitting = false;

  /// True while a draft exists in SharedPreferences (shows Delete Draft).
  bool _hasDraft = false;

  /// True after a draft was restored into the form ("Continue your draft").
  bool _showDraftBanner = false;

  @override
  void initState() {
    super.initState();
    _storyFocus.addListener(_onStoryFocusChange);
    CommunityStoriesService.userId().then((id) {
      if (mounted) setState(() => _sheetUid = id);
    });
    final editing = widget.editing;
    if (editing != null) {
      _avatarType = editing.avatarType ?? 'initials';
      _avatarData = editing.avatarData;
      _nameController.text = editing.name;
      _storyController.text = editing.story;
      _anonymous = editing.anonymous;
      _country =
          storyCountries.where((c) => c.name == editing.country).firstOrNull;
      if (_country != null) {
        _countryController.text = '${_country!.flag}  ${_country!.name}';
      }
      _category = editing.category;
      _shahadaDate = editing.shahadaDate;
      _background = editing.backgroundImage;
    } else {
      CommunityStoriesService.savedStoryDraft().then((draft) {
        if (!mounted) return;
        if (draft != null) {
          setState(() {
            _applyDraft(draft);
            _hasDraft = true;
            _showDraftBanner = true;
          });
        } else {
          CommunityStoriesService.savedAuthorName().then((name) {
            if (mounted && name.isNotEmpty) _nameController.text = name;
          });
        }
      });
    }
  }

  void _applyDraft(Map<String, dynamic> draft) {
    _nameController.text = (draft['name'] as String?) ?? '';
    _anonymous = (draft['anonymous'] as bool?) ?? false;
    _country = storyCountries
        .where((c) => c.name == (draft['country'] as String?))
        .firstOrNull;
    _countryController.text =
        _country == null ? '' : '${_country!.flag}  ${_country!.name}';
    _category = StoryCategory.values
            .where((c) => c.name == (draft['category'] as String?))
            .firstOrNull ??
        StoryCategory.revert;
    final shahadaMillis = draft['shahadaDate'] as int?;
    _shahadaDate = shahadaMillis == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(shahadaMillis);
    _storyController.text = (draft['story'] as String?) ?? '';
    _background = draft['background'] as String?;
    _avatarType = (draft['avatarType'] as String?) ?? 'initials';
    _avatarData = draft['avatarData'] as String?;
  }

  /// Writes the current form state to SharedPreferences.
  Future<void> _persistDraft() => CommunityStoriesService.saveStoryDraft({
        'name': _nameController.text.trim(),
        'anonymous': _anonymous,
        'country': _country?.name,
        'category': _category.name,
        'shahadaDate': _shahadaDate?.millisecondsSinceEpoch,
        'story': _storyController.text,
        'background': _background,
        'avatarType': _avatarType,
        'avatarData': _avatarData,
      });

  SnackBar _draftSavedSnackBar(AppLocalizations l10n) => SnackBar(
        content: Text(l10n.storiesDraftSaved),
        backgroundColor: _kCard,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _kGold.withValues(alpha: 0.5)),
        ),
      );

  /// Header pill: save the draft and stay on the form.
  Future<void> _saveDraft() async {
    final l10n = AppLocalizations.of(context)!;
    await _persistDraft();
    if (!mounted) return;
    setState(() => _hasDraft = true);
    ScaffoldMessenger.of(context).showSnackBar(_draftSavedSnackBar(l10n));
  }

  /// Delete Draft button and the banner's "Start fresh": clears the stored
  /// draft and resets every field to a blank form.
  Future<void> _deleteDraft() async {
    await CommunityStoriesService.clearStoryDraft();
    if (!mounted) return;
    setState(() {
      _hasDraft = false;
      _showDraftBanner = false;
      _nameController.clear();
      _storyController.clear();
      _countryController.clear();
      _anonymous = false;
      _country = null;
      _category = StoryCategory.revert;
      _shahadaDate = null;
      _background = null;
      _avatarType = 'initials';
      _avatarData = null;
    });
  }

  /// Back always asks: Save Draft (new stories only) / Discard / Keep
  /// Writing — even when nothing has been typed yet.
  Future<void> _onBackPressed() async {
    final l10n = AppLocalizations.of(context)!;
    Widget option({
      required String label,
      required Color color,
      required String result,
      required BuildContext dialogContext,
    }) =>
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, result),
          child: Text(
            label,
            style: GoogleFonts.lato(fontWeight: FontWeight.w700, color: color),
          ),
        );

    final choice = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: _kCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: _kGold.withValues(alpha: 0.35)),
        ),
        title: Text(
          l10n.storiesDiscardTitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _kCream,
          ),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.editing == null)
                option(
                  label: l10n.storiesSaveDraft,
                  color: _kGold,
                  result: 'save',
                  dialogContext: dialogContext,
                ),
              option(
                label: l10n.storiesDiscard,
                color: const Color(0xFFE57373),
                result: 'discard',
                dialogContext: dialogContext,
              ),
              option(
                label: l10n.storiesKeepWriting,
                color: _kCream.withValues(alpha: 0.8),
                result: 'keep',
                dialogContext: dialogContext,
              ),
            ],
          ),
        ],
      ),
    );
    if (!mounted) return;
    switch (choice) {
      case 'save':
        final messenger = ScaffoldMessenger.of(context);
        await _persistDraft();
        if (!mounted) return;
        Navigator.pop(context);
        messenger.showSnackBar(_draftSavedSnackBar(l10n));
      case 'discard':
        if (widget.editing == null) {
          await CommunityStoriesService.clearStoryDraft();
        }
        if (!mounted) return;
        Navigator.pop(context);
      default:
      // Keep Writing (or dialog dismissed) — stay on the form.
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _storyController.dispose();
    _countryController.dispose();
    _storyFocus.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onStoryFocusChange() {
    if (_storyFocus.hasFocus) {
      _pulseController.repeat(reverse: true);
    } else {
      _pulseController.stop();
      _pulseController.value = 0;
    }
    setState(() {});
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _shahadaDate ?? now,
      firstDate: DateTime(1940),
      lastDate: now,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: _kGold,
            onPrimary: _kNavy,
            surface: _kCard,
            onSurface: _kCream,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _shahadaDate = picked);
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    if (_submitting) return;
    if (_storyController.text.trim().isEmpty || _country == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.storiesFillRequired)),
      );
      return;
    }
    setState(() => _submitting = true);
    try {
      final name = _nameController.text.trim();
      if (name.isNotEmpty) {
        await CommunityStoriesService.rememberAuthorName(name);
      }
      if (!mounted) return;
      final editing = widget.editing;
      if (editing != null) {
        await widget.service.updateStory(
          id: editing.id,
          name: _anonymous ? '' : name,
          anonymous: _anonymous || name.isEmpty,
          country: _country!.name,
          countryFlag: _country!.flag,
          category: _category,
          shahadaDate: _shahadaDate,
          story: _storyController.text,
          language: Localizations.localeOf(context).languageCode,
          backgroundImage: _background,
          avatarType: _avatarType,
          avatarData: _avatarData,
        );
      } else {
        await widget.service.submitStory(
          name: _anonymous ? '' : name,
          anonymous: _anonymous || name.isEmpty,
          country: _country!.name,
          countryFlag: _country!.flag,
          category: _category,
          shahadaDate: _shahadaDate,
          story: _storyController.text,
          language: Localizations.localeOf(context).languageCode,
          backgroundImage: _background,
          avatarType: _avatarType,
          avatarData: _avatarData,
        );
        // The story is submitted — a leftover draft would just resurface it.
        await CommunityStoriesService.clearStoryDraft();
      }
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              editing != null ? l10n.storiesUpdated : l10n.storiesSubmitted),
          backgroundColor: _kCard,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: _kGold.withValues(alpha: 0.5)),
          ),
        ),
      );
    } catch (_) {
      if (mounted) {
        setState(() => _submitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storiesSubmitError)),
        );
      }
    }
  }

  InputDecoration _fieldDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(color: _kCream.withValues(alpha: 0.35)),
        filled: true,
        fillColor: _kNavy,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _kGold.withValues(alpha: 0.35)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _kGold),
        ),
      );

  Text _label(String text) => Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
          color: _kGold,
        ),
      );

  String _previewInitials(AppLocalizations l10n) {
    final name = _nameController.text.trim();
    if (_anonymous || name.isEmpty) {
      return l10n.storiesAnonymous.substring(0, 1).toUpperCase();
    }
    final parts =
        name.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '؟';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  /// Style pills (Initials | Icon | Pattern) plus the matching sub-picker
  /// row of icons or generated pattern variants.
  List<Widget> _avatarPicker(AppLocalizations l10n) {
    final styles = <(String, String)>[
      ('initials', l10n.storiesAvatarInitials),
      ('icon', l10n.storiesAvatarIcon),
      ('pattern', l10n.storiesAvatarPattern),
    ];
    // Variants 1 and 5 dropped by design; keeping the original seed indices
    // so previously picked patterns keep rendering identically.
    final patternSeeds = _sheetUid == null
        ? const <String>[]
        : [for (final i in [0, 2, 3, 4]) '$_sheetUid#$i'];

    return [
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final (type, label) in styles)
            GestureDetector(
              onTap: () => setState(() {
                _avatarType = type;
                switch (type) {
                  case 'icon':
                    if (!kStoryAvatarIcons.contains(_avatarData)) {
                      _avatarData = kStoryAvatarIcons.first;
                    }
                  case 'pattern':
                    if (!(_avatarData?.contains('#') ?? false)) {
                      _avatarData =
                          patternSeeds.isEmpty ? null : patternSeeds.first;
                    }
                  default:
                    _avatarData = null;
                }
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: _avatarType == type ? _kGold : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _avatarType == type
                        ? _kGold
                        : _kGold.withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  label,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _avatarType == type
                        ? _kNavy
                        : _kCream.withValues(alpha: 0.75),
                  ),
                ),
              ),
            ),
        ],
      ),
      if (_avatarType == 'icon')
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _avatarOptionRow(
            options: kStoryAvatarIcons,
            type: 'icon',
          ),
        )
      else if (_avatarType == 'pattern' && patternSeeds.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _avatarOptionRow(
            options: patternSeeds,
            type: 'pattern',
          ),
        ),
    ];
  }

  Widget _avatarOptionRow({
    required List<String> options,
    required String type,
  }) {
    // Wrap instead of a horizontal ListView so every option is fully
    // visible (no edge clipping, no hidden icons behind a scroll).
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final data in options)
          GestureDetector(
            onTap: () => setState(() => _avatarData = data),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: _avatarData == data
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _kGold.withValues(alpha: 0.4),
                          blurRadius: 8,
                        ),
                      ],
                    )
                  : null,
              child: StoryAvatar(
                avatarType: type,
                avatarData: data,
                initials: '',
                size: 48,
                borderWidth: _avatarData == data ? 2.5 : 1,
              ),
            ),
          ),
      ],
    );
  }

  /// The card editor: the user types their story directly onto a live
  /// preview of the finished card (background, overlay, author footer).
  Widget _cardEditor(AppLocalizations l10n) {
    final name = (_anonymous || _nameController.text.trim().isEmpty)
        ? l10n.storiesAnonymous
        : _nameController.text.trim();

    return GestureDetector(
      onTap: _storyFocus.requestFocus,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          final focused = _storyFocus.hasFocus;
          final t = _pulseController.value;
          return Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: _kNavy,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _kGold.withValues(
                    alpha: focused ? 0.45 + 0.5 * t : 0.35),
                width: focused ? 1.6 : 1,
              ),
              boxShadow: focused
                  ? [
                      BoxShadow(
                        color: _kGold.withValues(alpha: 0.10 + 0.18 * t),
                        blurRadius: 16,
                      ),
                    ]
                  : null,
            ),
            child: child,
          );
        },
        child: Stack(
          children: [
            if (_background != null) ...[
              Positioned.fill(
                child: Image.asset(
                  _background!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: 0.5)),
              ),
            ] else
              Positioned.fill(
                child: Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'بِسْمِ اللَّهِ',
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 36,
                        color: _kGold.withValues(alpha: 0.30),
                      ),
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 14, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _storyController,
                        focusNode: _storyFocus,
                        maxLines: null,
                        expands: true,
                        maxLength: 3000,
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (_) => setState(() {}),
                        scrollPadding: const EdgeInsets.only(bottom: 220),
                        cursorColor: _kGold,
                        style: _storySerif(color: _kCream, fontSize: 14),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          counterText: '',
                          hintText: l10n.storiesStoryHint,
                          hintStyle: _storySerif(
                            color: _kCream.withValues(alpha: 0.5),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        StoryAvatar(
                          avatarType: _avatarType,
                          avatarData: _avatarData,
                          initials: _previewInitials(l10n),
                          size: 26,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: _kGold,
                            ),
                          ),
                        ),
                        if (_country != null) ...[
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              '${_country!.flag} ${_country!.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                color: _kCream.withValues(alpha: 0.65),
                              ),
                            ),
                          ),
                        ],
                        const Spacer(),
                        Text(
                          '${_storyController.text.length}/3000',
                          style: GoogleFonts.lato(
                            fontSize: 10.5,
                            color: _kCream.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Instant type-ahead results under the country field; hidden once a
  /// country is picked (typing again clears the pick and re-opens them).
  List<Widget> _countrySuggestions() {
    final query = _countryController.text.trim().toLowerCase();
    if (_country != null || query.isEmpty) return const [];
    final matches = storyCountries
        .where((c) => c.name.toLowerCase().contains(query))
        .toList();
    if (matches.isEmpty) return const [];
    return [
      Container(
        margin: const EdgeInsets.only(top: 6),
        constraints: const BoxConstraints(maxHeight: 180),
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kGold.withValues(alpha: 0.35)),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: matches.length,
          itemBuilder: (context, i) {
            final c = matches[i];
            return InkWell(
              onTap: () => setState(() {
                _country = c;
                _countryController.text = '${c.flag}  ${c.name}';
              }),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                child: Text(
                  '${c.flag}  ${c.name}',
                  style: GoogleFonts.lato(fontSize: 13.5, color: _kCream),
                ),
              ),
            );
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _kGold.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  // iOS-style back chevron — confirms first if the form has
                  // unsaved changes.
                  GestureDetector(
                    onTap: _onBackPressed,
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _kNavy,
                        border:
                            Border.all(color: _kGold.withValues(alpha: 0.35)),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 16, color: _kGold),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          widget.editing != null
                              ? l10n.storiesEditTitle
                              : l10n.communityStoriesShareBtn,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: _kGold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.editing == null) ...[
                    if (_hasDraft) ...[
                      Tooltip(
                        message: l10n.storiesDeleteDraft,
                        child: GestureDetector(
                          onTap: _deleteDraft,
                          child: Container(
                            width: 36,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _kNavy,
                              border: Border.all(
                                color: const Color(0xFFE57373)
                                    .withValues(alpha: 0.45),
                              ),
                            ),
                            child: const Icon(Icons.delete_outline_rounded,
                                size: 18, color: Color(0xFFE57373)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    GestureDetector(
                      onTap: _saveDraft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: _kGold,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          l10n.storiesSaveDraft,
                          style: GoogleFonts.lato(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: _kNavy,
                          ),
                        ),
                      ),
                    ),
                  ] else
                    // Keeps the title centered when there are no end buttons.
                    const SizedBox(width: 36),
                ],
              ),
              const SizedBox(height: 18),
              if (_showDraftBanner) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 6, 8),
                  decoration: BoxDecoration(
                    color: _kGold.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _kGold.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.edit_note_rounded,
                          size: 20, color: _kGold),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.storiesContinueDraft,
                          style: GoogleFonts.lato(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            color: _kCream,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _deleteDraft,
                        style: TextButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          minimumSize: const Size(0, 32),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          l10n.storiesStartFresh,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: _kGold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ],
              _label(l10n.storiesNameLabel.toUpperCase()),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                enabled: !_anonymous,
                style: GoogleFonts.lato(fontSize: 14, color: _kCream),
                onChanged: (_) => setState(() {}),
                decoration: _fieldDecoration(l10n.storiesNameLabel),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  SizedBox(
                    width: 38,
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Switch(
                        value: _anonymous,
                        activeThumbColor: _kGold,
                        activeTrackColor: _kGold.withValues(alpha: 0.35),
                        inactiveThumbColor: _kCream.withValues(alpha: 0.5),
                        inactiveTrackColor: _kNavy,
                        onChanged: (v) => setState(() => _anonymous = v),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.storiesPostAnonymously,
                    style: GoogleFonts.lato(
                      fontSize: 12.5,
                      color: _kCream.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _label(l10n.storiesCountryLabel.toUpperCase()),
              const SizedBox(height: 8),
              TextField(
                controller: _countryController,
                style: GoogleFonts.lato(fontSize: 14, color: _kCream),
                onChanged: (_) => setState(() => _country = null),
                decoration:
                    _fieldDecoration(l10n.storiesSearchCountryHint).copyWith(
                  prefixIcon: const Icon(Icons.search_rounded,
                      size: 18, color: _kGold),
                  suffixIcon: _country != null
                      ? const Icon(Icons.check_circle_rounded,
                          size: 18, color: _kGold)
                      : null,
                ),
              ),
              ..._countrySuggestions(),
              const SizedBox(height: 14),
              _label(l10n.storiesCategoryLabel.toUpperCase()),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final category in StoryCategory.values)
                    GestureDetector(
                      onTap: () => setState(() => _category = category),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 7),
                        decoration: BoxDecoration(
                          color: _category == category
                              ? _kGold
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: _category == category
                                ? _kGold
                                : _kGold.withValues(alpha: 0.35),
                          ),
                        ),
                        child: Text(
                          storyCategoryLabel(l10n, category),
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _category == category
                                ? _kNavy
                                : _kCream.withValues(alpha: 0.75),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              _label(l10n.storiesShahadaDateLabel.toUpperCase()),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: _kNavy,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _kGold.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded,
                          size: 16, color: _kGold),
                      const SizedBox(width: 8),
                      Text(
                        _shahadaDate == null
                            ? l10n.storiesShahadaDateLabel
                            : _formatMonthYear(context, _shahadaDate!),
                        style: GoogleFonts.lato(
                          fontSize: 13.5,
                          color: _shahadaDate == null
                              ? _kCream.withValues(alpha: 0.35)
                              : _kCream,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              _label(l10n.storiesYourStoryLabel.toUpperCase()),
              const SizedBox(height: 8),
              _cardEditor(l10n),
              const SizedBox(height: 14),
              _label(l10n.storiesChooseAvatar.toUpperCase()),
              const SizedBox(height: 8),
              ..._avatarPicker(l10n),
              const SizedBox(height: 14),
              _label(l10n.storiesChooseBackground.toUpperCase()),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // Explicit padding + no clip: without these the grid crops
                // the last row (and the selected tile's glow) against the
                // Submit button.
                padding: const EdgeInsets.only(top: 2, bottom: 14),
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: _storyBackgroundAssets.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _BackgroundTile(
                      selected: _background == null,
                      onTap: () => setState(() => _background = null),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'بِسْمِ اللَّهِ',
                            style: GoogleFonts.scheherazadeNew(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: _kGold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            l10n.storiesBackgroundNone,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontSize: 9.5,
                              color: _kCream.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  final asset = _storyBackgroundAssets[index - 1];
                  return _BackgroundTile(
                    selected: _background == asset,
                    onTap: () => setState(() => _background = asset),
                    child: Image.asset(
                      asset,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const ColoredBox(color: _kNavy),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: _submit,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _kGold.withValues(alpha: 0.9),
                        _kGold.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: _submitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: _kNavy,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          widget.editing != null
                              ? l10n.storiesSaveChanges
                              : l10n.storiesSubmitButton,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: _kNavy,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One ~70px rounded-square thumbnail in the background picker; the selected
/// tile gets a gold border and glow.
class _BackgroundTile extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  const _BackgroundTile({
    required this.selected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 70,
        height: 70,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _kNavy,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? _kGold : _kGold.withValues(alpha: 0.25),
            width: selected ? 2.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: _kGold.withValues(alpha: 0.35),
                    blurRadius: 8,
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// EMPTY STATE + CRESCENT PAINTER
// ─────────────────────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EmptyState({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Opacity(
              opacity: 0.5,
              child: SizedBox(
                width: 64,
                height: 64,
                child: CustomPaint(
                  painter: CrescentStarPainter(color: _kGold),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _kCream.withValues(alpha: 0.85),
              ),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  color: _kCream.withValues(alpha: 0.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Noor Guard crescent + 5-pointed star, drawn in code (no assets).
class CrescentStarPainter extends CustomPainter {
  final Color color;
  const CrescentStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final r = size.width * 0.38;
    final center = Offset(size.width * 0.42, size.height * 0.52);

    // Crescent = full circle minus an offset circle.
    final crescent = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: center, radius: r)),
      Path()
        ..addOval(Rect.fromCircle(
          center: center.translate(r * 0.42, -r * 0.18),
          radius: r * 0.82,
        )),
    );
    canvas.drawPath(crescent, paint);

    // 5-pointed star at the crescent's opening.
    final starCenter = Offset(size.width * 0.72, size.height * 0.30);
    final star = Path();
    final outer = size.width * 0.13;
    final inner = outer * 0.4;
    for (int i = 0; i < 10; i++) {
      final angle = -math.pi / 2 + i * math.pi / 5;
      final radius = i.isEven ? outer : inner;
      final p = Offset(
        starCenter.dx + radius * math.cos(angle),
        starCenter.dy + radius * math.sin(angle),
      );
      if (i == 0) {
        star.moveTo(p.dx, p.dy);
      } else {
        star.lineTo(p.dx, p.dy);
      }
    }
    star.close();
    canvas.drawPath(star, paint);
  }

  @override
  bool shouldRepaint(CrescentStarPainter old) => old.color != color;
}

/// Concentric hexagons with connecting spokes — the featured card's
/// centered geometric watermark.
class _HexagonWatermarkPainter extends CustomPainter {
  final Color color;
  const _HexagonWatermarkPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final center = Offset(size.width / 2, size.height / 2);
    final maxR = size.shortestSide / 2;

    Offset vertex(double r, int i) {
      final angle = -math.pi / 2 + i * math.pi / 3;
      return center + Offset(r * math.cos(angle), r * math.sin(angle));
    }

    for (final r in [maxR, maxR * 0.72, maxR * 0.44, maxR * 0.16]) {
      final path = Path();
      for (int i = 0; i < 6; i++) {
        final p = vertex(r, i);
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
    for (int i = 0; i < 6; i++) {
      canvas.drawLine(vertex(maxR, i), center, paint);
    }
  }

  @override
  bool shouldRepaint(_HexagonWatermarkPainter old) => old.color != color;
}

/// Plain crescent (no star) — the featured card's corner watermark.
class _CrescentPainter extends CustomPainter {
  final Color color;
  const _CrescentPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.shortestSide * 0.42;
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final crescent = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: center, radius: r)),
      Path()
        ..addOval(Rect.fromCircle(
          center: center.translate(r * 0.45, -r * 0.2),
          radius: r * 0.85,
        )),
    );
    canvas.drawPath(crescent, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_CrescentPainter old) => old.color != color;
}
