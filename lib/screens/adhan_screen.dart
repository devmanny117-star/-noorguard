import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../models/adhan_model.dart';

class AdhanScreen extends StatefulWidget {
  const AdhanScreen({super.key});

  @override
  State<AdhanScreen> createState() => _AdhanScreenState();
}

class _AdhanScreenState extends State<AdhanScreen>
    with SingleTickerProviderStateMixin {
  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);

  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _playingId;
  bool _isPlaying = false;

  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _pulse = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _isPlaying = state == PlayerState.playing);
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() {
        _isPlaying = false;
        _playingId = null;
      });
    });
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlay(AdhanStyle style) async {
    if (_playingId == style.id) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
      return;
    }
    setState(() => _playingId = style.id);
    await _audioPlayer.play(UrlSource(style.audioUrl));
  }

  Future<void> _stop() async {
    await _audioPlayer.stop();
    if (mounted) {
      setState(() {
        _playingId = null;
        _isPlaying = false;
      });
    }
  }

  String _styleName(AppLocalizations l10n, String id) {
    switch (id) {
      case 'makkah':
        return l10n.makkahStyle;
      case 'madinah':
        return l10n.madinahStyle;
      case 'egyptian':
        return l10n.egyptianStyle;
      case 'alafasy':
        return l10n.alafasyStyle;
      case 'alaqsa':
        return l10n.alaqsaStyle;
      case 'turkish':
        return l10n.turkishStyle;
      case 'pakistani':
        return l10n.pakistaniStyle;
      case 'indonesian':
        return l10n.indonesianStyle;
      default:
        return id;
    }
  }

  String _styleDescription(AppLocalizations l10n, String id) {
    switch (id) {
      case 'makkah':
        return l10n.makkahDescription;
      case 'madinah':
        return l10n.madinahDescription;
      case 'egyptian':
        return l10n.egyptianDescription;
      case 'alafasy':
        return l10n.alafasyDescription;
      case 'alaqsa':
        return l10n.alaqsaDescription;
      case 'turkish':
        return l10n.turkishDescription;
      case 'pakistani':
        return l10n.pakistaniDescription;
      case 'indonesian':
        return l10n.indonesianDescription;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final playing = _playingId == null
        ? null
        : adhanStyles.firstWhere((s) => s.id == _playingId);

    return Scaffold(
      backgroundColor: _navy,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              l10n.adhan,
              style: GoogleFonts.playfairDisplay(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              'الأذان',
              style: GoogleFonts.scheherazadeNew(
                fontSize: 15,
                color: _gold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _DescriptionCard(
            subtitle: l10n.adhanCallToWorship,
            description: l10n.adhanDescriptionFull,
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < adhanStyles.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            _AdhanCard(
              style: adhanStyles[i],
              displayName: _styleName(l10n, adhanStyles[i].id),
              description: _styleDescription(l10n, adhanStyles[i].id),
              isActive: _playingId == adhanStyles[i].id,
              isPlaying: _playingId == adhanStyles[i].id && _isPlaying,
              pulse: _pulse,
              onTap: () => _togglePlay(adhanStyles[i]),
            ),
          ],
        ],
      ),
      bottomNavigationBar: playing == null
          ? null
          : _AdhanMiniPlayer(
              displayName: _styleName(l10n, playing.id),
              nowPlayingLabel: l10n.adhanPlaying,
              isPlaying: _isPlaying,
              onPlayPause: () => _togglePlay(playing),
              onStop: _stop,
            ),
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String subtitle;
  final String description;

  const _DescriptionCard({required this.subtitle, required this.description});

  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _gold.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.campaign_rounded, color: _gold, size: 22),
              const SizedBox(width: 10),
              Text(
                subtitle,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: _mutedText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _AdhanCard extends StatelessWidget {
  final AdhanStyle style;
  final String displayName;
  final String description;
  final bool isActive;
  final bool isPlaying;
  final Animation<double> pulse;
  final VoidCallback onTap;

  const _AdhanCard({
    required this.style,
    required this.displayName,
    required this.description,
    required this.isActive,
    required this.isPlaying,
    required this.pulse,
    required this.onTap,
  });

  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);
  static const _mutedText = Color(0xFF8A9BB0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _gold.withValues(alpha: isActive ? 0.6 : 0.15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  style.arabicName,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 18,
                    color: _gold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: _mutedText,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          AnimatedBuilder(
            animation: pulse,
            builder: (_, __) {
              final glowRadius = isPlaying ? 6 + pulse.value * 8 : 0.0;
              return Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: isPlaying
                      ? [
                          BoxShadow(
                            color: _gold.withValues(
                              alpha: 0.25 + pulse.value * 0.25,
                            ),
                            blurRadius: glowRadius,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
                child: Material(
                  color: _gold,
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: onTap,
                    customBorder: const CircleBorder(),
                    child: Center(
                      child: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: _navy,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AdhanMiniPlayer extends StatelessWidget {
  final String displayName;
  final String nowPlayingLabel;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onStop;

  const _AdhanMiniPlayer({
    required this.displayName,
    required this.nowPlayingLabel,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onStop,
  });

  static const _navy = Color(0xFF0D1B2A);
  static const _gold = Color(0xFFD4AF37);
  static const _cardColor = Color(0xFF152030);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardColor,
        border: Border(top: BorderSide(color: _gold.withValues(alpha: 0.2))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nowPlayingLabel,
                      style: GoogleFonts.lato(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    Text(
                      displayName,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _gold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: _gold,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                      color: _navy,
                      onPressed: onPlayPause,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    color: _gold,
                    onPressed: onStop,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
