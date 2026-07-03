import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

const _navy = Color(0xFF0D1B2A);
const _cardNavy = Color(0xFF152840);
const _gold = Color(0xFFD4AF37);

// ── Data ─────────────────────────────────────────────────────────────────────

class _Story {
  final String flag;
  final String Function(AppLocalizations) name;
  final String Function(AppLocalizations) location;
  final String Function(AppLocalizations) time;
  final String Function(AppLocalizations) text;

  const _Story({
    required this.flag,
    required this.name,
    required this.location,
    required this.time,
    required this.text,
  });
}

List<_Story> _stories(AppLocalizations l10n) => [
  _Story(
    flag: '🇺🇸',
    name:     (_) => l10n.communityStory1Name,
    location: (_) => l10n.communityStory1Location,
    time:     (_) => l10n.communityStory1Time,
    text:     (_) => l10n.communityStory1Text,
  ),
  _Story(
    flag: '🇬🇧',
    name:     (_) => l10n.communityStory2Name,
    location: (_) => l10n.communityStory2Location,
    time:     (_) => l10n.communityStory2Time,
    text:     (_) => l10n.communityStory2Text,
  ),
  _Story(
    flag: '🇲🇽',
    name:     (_) => l10n.communityStory3Name,
    location: (_) => l10n.communityStory3Location,
    time:     (_) => l10n.communityStory3Time,
    text:     (_) => l10n.communityStory3Text,
  ),
  _Story(
    flag: '🇨🇦',
    name:     (_) => l10n.communityStory4Name,
    location: (_) => l10n.communityStory4Location,
    time:     (_) => l10n.communityStory4Time,
    text:     (_) => l10n.communityStory4Text,
  ),
  _Story(
    flag: '🇦🇺',
    name:     (_) => l10n.communityStory5Name,
    location: (_) => l10n.communityStory5Location,
    time:     (_) => l10n.communityStory5Time,
    text:     (_) => l10n.communityStory5Text,
  ),
  _Story(
    flag: '🇿🇦',
    name:     (_) => l10n.communityStory6Name,
    location: (_) => l10n.communityStory6Location,
    time:     (_) => l10n.communityStory6Time,
    text:     (_) => l10n.communityStory6Text,
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class CommunityStoriesScreen extends StatelessWidget {
  const CommunityStoriesScreen({super.key});

  void _openStoryForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _StoryFormSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final stories = _stories(l10n);

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(l10n: l10n),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                itemCount: stories.length + 1,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, i) {
                  if (i == stories.length) {
                    return _ShareButton(
                      label: l10n.communityStoriesShareBtn,
                      onTap: () => _openStoryForm(context),
                    );
                  }
                  final s = stories[i];
                  return _StoryCard(
                    flag: s.flag,
                    name: s.name(l10n),
                    location: s.location(l10n),
                    time: s.time(l10n),
                    timeLabel: l10n.communityStoriesTimeLabel,
                    text: s.text(l10n),
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

// ── Header ────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final AppLocalizations l10n;
  const _Header({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _gold.withValues(alpha: 0.25)),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 16, color: _gold),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.communityStories,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.communityStoriesScreenSubtitle,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.55),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            l10n.inspiredByRealStories,
            style: GoogleFonts.lato(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: _gold.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Story Card ────────────────────────────────────────────────────────────────

class _StoryCard extends StatefulWidget {
  final String flag;
  final String name;
  final String location;
  final String time;
  final String timeLabel;
  final String text;

  const _StoryCard({
    required this.flag,
    required this.name,
    required this.location,
    required this.time,
    required this.timeLabel,
    required this.text,
  });

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        decoration: BoxDecoration(
          color: _cardNavy,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _gold.withValues(alpha: _expanded ? 0.38 : 0.12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  _gold.withValues(alpha: 0.6),
                  _gold.withValues(alpha: 0.0),
                ]),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.flag, style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.location,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _gold.withValues(alpha: 0.13),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: _gold.withValues(alpha: 0.35)),
                            ),
                            child: Text(
                              widget.time,
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: _gold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.timeLabel,
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              color: Colors.white.withValues(alpha: 0.4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _expanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: _gold.withValues(alpha: 0.6),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 220),
                    crossFadeState: _expanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: _gold.withValues(alpha: 0.12),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 42,
                                color: _gold.withValues(alpha: 0.4),
                                height: 0.85,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                widget.text,
                                style: GoogleFonts.lato(
                                  fontSize: 13.5,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  height: 1.65,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    secondChild: Text(
                      widget.text,
                      style: GoogleFonts.lato(
                        fontSize: 13.5,
                        color: Colors.white.withValues(alpha: 0.6),
                        height: 1.55,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Share Button ──────────────────────────────────────────────────────────────

class _ShareButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _ShareButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _gold.withValues(alpha: 0.18),
              _gold.withValues(alpha: 0.08),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _gold.withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit_outlined, color: _gold, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.playfairDisplay(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _gold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Story Submission Form Sheet ───────────────────────────────────────────────

class _StoryFormSheet extends StatefulWidget {
  const _StoryFormSheet();

  @override
  State<_StoryFormSheet> createState() => _StoryFormSheetState();
}

class _StoryFormSheetState extends State<_StoryFormSheet> {
  final _nameCtrl    = TextEditingController();
  final _countryCtrl = TextEditingController();
  final _timeCtrl    = TextEditingController();
  final _storyCtrl   = TextEditingController();

  bool _submitting = false;
  bool _submitted  = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _countryCtrl.dispose();
    _timeCtrl.dispose();
    _storyCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit(AppLocalizations l10n) async {
    final name    = _nameCtrl.text.trim();
    final country = _countryCtrl.text.trim();
    final time    = _timeCtrl.text.trim();
    final story   = _storyCtrl.text.trim();

    if (name.isEmpty || country.isEmpty || time.isEmpty || story.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.storyFormRequiredError,
              style: GoogleFonts.lato(color: Colors.white)),
          backgroundColor: const Color(0xFF1A1A1A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    setState(() => _submitting = true);

    final prefs    = await SharedPreferences.getInstance();
    final existing = prefs.getStringList('submitted_stories') ?? [];
    existing.add(jsonEncode({
      'name':      name,
      'country':   country,
      'time':      time,
      'story':     story,
      'timestamp': DateTime.now().toIso8601String(),
    }));
    await prefs.setStringList('submitted_stories', existing);

    if (!mounted) return;
    setState(() {
      _submitting = false;
      _submitted  = true;
    });
  }

  Widget _buildField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: _gold.withValues(alpha: 0.75),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          minLines: maxLines > 1 ? 4 : 1,
          style: GoogleFonts.lato(fontSize: 14, color: Colors.white),
          cursorColor: _gold,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.3)),
            filled: true,
            fillColor: _navy,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 14, vertical: maxLines > 1 ? 14 : 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: _gold.withValues(alpha: 0.22)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: _gold.withValues(alpha: 0.65), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag handle ──────────────────────────────────────────────────
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 22),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: _gold.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            l10n.storyFormTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildField(
            label: l10n.storyFormNameLabel,
            hint: l10n.storyFormNameHint,
            controller: _nameCtrl,
          ),
          const SizedBox(height: 16),
          _buildField(
            label: l10n.storyFormCountryLabel,
            hint: l10n.storyFormCountryHint,
            controller: _countryCtrl,
          ),
          const SizedBox(height: 16),
          _buildField(
            label: l10n.storyFormTimeLabel,
            hint: l10n.storyFormTimeHint,
            controller: _timeCtrl,
          ),
          const SizedBox(height: 16),
          _buildField(
            label: l10n.storyFormStoryLabel,
            hint: l10n.storyFormStoryHint,
            controller: _storyCtrl,
            maxLines: 6,
          ),
          const SizedBox(height: 28),
          if (_submitting)
            const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(_gold)),
            )
          else
            GestureDetector(
              onTap: () => _submit(l10n),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_gold, _gold.withValues(alpha: 0.78)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: _gold.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    l10n.storyFormSubmitBtn,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _navy,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildThankYou(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _gold.withValues(alpha: 0.14),
              border: Border.all(color: _gold.withValues(alpha: 0.5)),
            ),
            child: const Icon(Icons.check_rounded, color: _gold, size: 36),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.storyFormThankYouTitle,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.storyFormThankYouBody,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.72),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 36),
              decoration: BoxDecoration(
                color: _gold.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _gold.withValues(alpha: 0.4)),
              ),
              child: Text(
                l10n.done,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: _gold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n      = AppLocalizations.of(context)!;
    final kbHeight  = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: kbHeight),
      decoration: const BoxDecoration(
        color: _cardNavy,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _submitted
            ? _buildThankYou(l10n)
            : _buildForm(l10n),
      ),
    );
  }
}
