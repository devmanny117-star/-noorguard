import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../l10n/app_localizations.dart';
import '../models/surah_model.dart';
import '../screens/surah_screen.dart';
import '../services/quran_player_controller.dart';

const _navy = Color(0xFF0D1B2A);
const _gold = Color(0xFFD4AF37);
const _cardColor = Color(0xFF152030);
const _mutedText = Color(0xFF8A9BB0);

/// Fixed-height bar shown above the Quran tab's bottom nav (and its ad
/// banner, when one is up) whenever Quran audio is loaded — the counterpart
/// to the reader's own in-screen player bar, but visible after navigating
/// back to the surah list, since it reads the shared
/// [QuranPlayerController] rather than screen-local state. Animates its own
/// height, so a parent [Column] positioned above the bottom nav needs no
/// extra plumbing to slide sibling content (e.g. an ad banner) along with
/// it as this appears/disappears.
class QuranMiniPlayer extends StatelessWidget {
  const QuranMiniPlayer({super.key});

  static const double height = 64.0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: QuranPlayerController.instance,
      builder: (context, _) {
        final controller = QuranPlayerController.instance;
        final surah = controller.surah;
        return AnimatedSize(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          alignment: Alignment.bottomCenter,
          child: surah == null
              ? const SizedBox(width: double.infinity, height: 0)
              : _MiniPlayerBar(
                  surah: surah,
                  reciterName: controller.reciter?.shortName ?? '',
                  verseNumber: controller.verseNumber ?? 1,
                ),
        );
      },
    );
  }
}

class _MiniPlayerBar extends StatelessWidget {
  final Surah surah;
  final String reciterName;
  final int verseNumber;

  const _MiniPlayerBar({
    required this.surah,
    required this.reciterName,
    required this.verseNumber,
  });

  void _expand(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SurahScreen(
          surah: surah,
          initialVerseNumber: verseNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final player = QuranPlayerController.instance.player;

    // No bottom padding here, deliberately: this bar must sit flush against
    // whatever's directly below it in the fixed bottom cluster (the nav bar
    // when no ad is showing, or the ad banner when one is) — any gap above
    // the nav bar belongs to the ad banner's own conditional spacing in
    // QuranScreen, not baked into this widget unconditionally.
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: GestureDetector(
        onTap: () => _expand(context),
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: QuranMiniPlayer.height,
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _gold.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _ProgressBar(player: player),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      _PlayPauseButton(player: player),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${surah.englishName} • '
                              '${l10n.quranMiniPlayerAyah(verseNumber)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            if (reciterName.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                reciterName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 11.5,
                                  color: _mutedText,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: _gold.withValues(alpha: 0.6),
                        size: 20,
                      ),
                    ],
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

/// Thin progress indicator pinned to the top edge of the mini player.
class _ProgressBar extends StatelessWidget {
  final AudioPlayer player;
  const _ProgressBar({required this.player});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      child: StreamBuilder<Duration>(
        stream: player.positionStream,
        builder: (context, snapshot) {
          final position = snapshot.data ?? player.position;
          final duration = player.duration;
          final progress = (duration != null && duration.inMilliseconds > 0)
              ? (position.inMilliseconds / duration.inMilliseconds)
                  .clamp(0.0, 1.0)
              : 0.0;
          return Stack(
            children: [
              Container(color: _gold.withValues(alpha: 0.12)),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(color: _gold),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PlayPauseButton extends StatelessWidget {
  final AudioPlayer player;
  const _PlayPauseButton({required this.player});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playing = snapshot.data?.playing ?? player.playing;
        return GestureDetector(
          // resume() (not a bare player.play()) — this session may be a
          // cold restore from disk (app just launched, nothing actually
          // loaded into the player yet), which resume() detects and builds
          // a fresh playlist for before playing; a normal in-app pause just
          // resumes in place either way.
          onTap: () => playing
              ? player.pause()
              : QuranPlayerController.instance.resume(
                  locale: Localizations.localeOf(context).languageCode,
                ),
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: _gold,
            ),
            child: Icon(
              playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: _navy,
              size: 22,
            ),
          ),
        );
      },
    );
  }
}
