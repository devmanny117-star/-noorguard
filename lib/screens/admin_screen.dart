import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../l10n/app_localizations.dart';
import '../models/community_story.dart';
import '../services/community_stories_service.dart';
import '../widgets/geometric_pattern_painter.dart';
import 'community_stories_screen.dart' show reportReasonLabel, storyDisplayName;

const _kBg = Color(0xFF0D1B2A);
const _kCard = Color(0xFF0D1F35);
const _kGold = Color(0xFFC9A84C);
const _kCream = Color(0xFFF5EFE6);
const _kRed = Color(0xFFE57373);

String _formatDate(BuildContext context, DateTime date) =>
    DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(date);

/// Moderation panel (Settings → Admin Mode): approve/reject pending story
/// submissions and handle reports filed from the story 3-dot menu.
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: _kBg,
        appBar: AppBar(
          backgroundColor: _kBg,
          foregroundColor: _kGold,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text(
            l10n.adminTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _kGold,
            ),
          ),
          bottom: TabBar(
            indicatorColor: _kGold,
            labelColor: _kGold,
            unselectedLabelColor: _kCream.withValues(alpha: 0.5),
            labelStyle:
                GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w700),
            tabs: [
              Tab(text: l10n.adminTabPending),
              Tab(text: l10n.adminTabReported),
            ],
          ),
        ),
        body: const Stack(
          children: [
            // Islamic 8-point star pattern behind both tabs.
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: GeometricPatternPainter(color: _kGold, alpha: 0.05),
                ),
              ),
            ),
            TabBarView(
              children: [
                _PendingStoriesTab(),
                _ReportedStoriesTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PENDING STORIES TAB
// ─────────────────────────────────────────────────────────────────────────────

class _PendingStoriesTab extends StatefulWidget {
  const _PendingStoriesTab();

  @override
  State<_PendingStoriesTab> createState() => _PendingStoriesTabState();
}

class _PendingStoriesTabState extends State<_PendingStoriesTab>
    with AutomaticKeepAliveClientMixin {
  final _service = CommunityStoriesService();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = AppLocalizations.of(context)!;
    if (!CommunityStoriesService.firebaseAvailable) {
      return _AdminEmptyState(message: l10n.adminEmptyPending);
    }
    return StreamBuilder<List<CommunityStory>>(
      stream: _service.allPendingStories(),
      builder: (context, snap) {
        if (snap.hasError) {
          return _AdminEmptyState(message: l10n.storiesLoadError);
        }
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator(color: _kGold));
        }
        final stories = snap.data!;
        if (stories.isEmpty) {
          return _AdminEmptyState(message: l10n.adminEmptyPending);
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
          itemCount: stories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, i) =>
              _PendingStoryCard(story: stories[i], service: _service),
        );
      },
    );
  }
}

class _PendingStoryCard extends StatelessWidget {
  final CommunityStory story;
  final CommunityStoriesService service;

  const _PendingStoryCard({required this.story, required this.service});

  Future<void> _setStatus(BuildContext context, String status) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await service.setStoryStatus(story.id, status);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storiesSubmitError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kGold.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  storyDisplayName(l10n, story),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _kGold,
                  ),
                ),
              ),
              if (story.dateSubmitted != null)
                Text(
                  _formatDate(context, story.dateSubmitted!),
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: _kCream.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            story.story,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontSize: 13,
              height: 1.5,
              color: _kCream.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _AdminButton(
                  label: l10n.adminApprove,
                  icon: Icons.check_rounded,
                  style: _AdminButtonStyle.goldFilled,
                  onTap: () => _setStatus(context, 'approved'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AdminButton(
                  label: l10n.adminReject,
                  icon: Icons.close_rounded,
                  style: _AdminButtonStyle.redOutlined,
                  onTap: () => _setStatus(context, 'rejected'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// REPORTED STORIES TAB
// ─────────────────────────────────────────────────────────────────────────────

class _ReportedStoriesTab extends StatefulWidget {
  const _ReportedStoriesTab();

  @override
  State<_ReportedStoriesTab> createState() => _ReportedStoriesTabState();
}

class _ReportedStoriesTabState extends State<_ReportedStoriesTab>
    with AutomaticKeepAliveClientMixin {
  final _service = CommunityStoriesService();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = AppLocalizations.of(context)!;
    if (!CommunityStoriesService.firebaseAvailable) {
      return _AdminEmptyState(message: l10n.adminEmptyReports);
    }
    return StreamBuilder<List<StoryReport>>(
      stream: _service.pendingReports(),
      builder: (context, snap) {
        if (snap.hasError) {
          return _AdminEmptyState(message: l10n.storiesLoadError);
        }
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator(color: _kGold));
        }
        final reports = snap.data!;
        if (reports.isEmpty) {
          return _AdminEmptyState(message: l10n.adminEmptyReports);
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
          itemCount: reports.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, i) =>
              _ReportCard(report: reports[i], service: _service),
        );
      },
    );
  }
}

class _ReportCard extends StatelessWidget {
  final StoryReport report;
  final CommunityStoriesService service;

  const _ReportCard({required this.report, required this.service});

  /// Delete Story also resolves the report so it leaves the queue instead of
  /// lingering as a pending report pointing at a deleted document.
  Future<void> _deleteStory(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await service.deleteStory(report.storyId);
      await service.resolveReport(report.id);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storiesSubmitError)),
        );
      }
    }
  }

  Future<void> _dismiss(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await service.resolveReport(report.id);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.storiesSubmitError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kRed.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _kRed.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _kRed.withValues(alpha: 0.55)),
                ),
                child: Text(
                  reportReasonLabel(l10n, report.reason),
                  style: GoogleFonts.lato(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: _kRed,
                  ),
                ),
              ),
              const Spacer(),
              if (report.reportedAt != null)
                Text(
                  _formatDate(context, report.reportedAt!),
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: _kCream.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          // Live preview of the reported story; "—" once it's been deleted.
          StreamBuilder<CommunityStory?>(
            stream: service.storyById(report.storyId),
            builder: (context, snap) {
              final story = snap.data;
              if (story == null) {
                return Text(
                  '—',
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: _kCream.withValues(alpha: 0.4),
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storyDisplayName(l10n, story),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _kGold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    story.story,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      height: 1.5,
                      color: _kCream.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _AdminButton(
                  label: l10n.adminDeleteStory,
                  icon: Icons.delete_outline_rounded,
                  style: _AdminButtonStyle.redOutlined,
                  onTap: () => _deleteStory(context),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AdminButton(
                  label: l10n.adminDismiss,
                  icon: Icons.visibility_off_outlined,
                  style: _AdminButtonStyle.goldOutlined,
                  onTap: () => _dismiss(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED PIECES
// ─────────────────────────────────────────────────────────────────────────────

enum _AdminButtonStyle { goldFilled, goldOutlined, redOutlined }

class _AdminButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final _AdminButtonStyle style;
  final VoidCallback onTap;

  const _AdminButton({
    required this.label,
    required this.icon,
    required this.style,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final filled = style == _AdminButtonStyle.goldFilled;
    final accent = style == _AdminButtonStyle.redOutlined ? _kRed : _kGold;
    final foreground = filled ? _kBg : accent;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: filled ? _kGold : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: filled ? _kGold : accent.withValues(alpha: 0.7),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: foreground),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: foreground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminEmptyState extends StatelessWidget {
  final String message;
  const _AdminEmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_user_outlined,
              size: 44,
              color: _kGold.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 14),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _kCream.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
