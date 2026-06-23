import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../services/app_blocking_service.dart';
import '../services/prayer_state.dart';
import '../services/streak_service.dart';
import 'app_blocking_setup_screen.dart';
import 'installed_apps_picker_screen.dart';

// Fixed dark palette — matches the Lock Screen / Focus Mode / setup-screen
// family this feature belongs to, per the brand's navy + gold spec.
const _navy = Color(0xFF0D1B2A);
const _cardBg = Color(0xFF152535);
const _cardBorder = Color(0xFF1E3348);
const _white = Color(0xFFF5F5F0);
const _grey = Color(0xFF8A9BB0);
const _gold = Color(0xFFC9A84C);

class AppBlockingScreen extends StatefulWidget {
  const AppBlockingScreen({super.key});

  @override
  State<AppBlockingScreen> createState() => _AppBlockingScreenState();
}

class _AppBlockingScreenState extends State<AppBlockingScreen>
    with WidgetsBindingObserver {
  final _service = AppBlockingService();
  bool _loading = true;
  bool _accessibilityEnabled = false;
  int _streak = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshAccessibility();
  }

  Future<void> _load() async {
    await _service.loadSettings();
    final streak = await StreakService().getStreak();
    final accessibility = await _service.isAccessibilityServiceEnabled();
    if (!mounted) return;
    setState(() {
      _streak = streak;
      _accessibilityEnabled = accessibility;
      _loading = false;
    });
  }

  Future<void> _refreshAccessibility() async {
    final enabled = await _service.isAccessibilityServiceEnabled();
    if (!mounted) return;
    setState(() => _accessibilityEnabled = enabled);
  }

  Future<void> _syncNative() async {
    final prayers = PrayerState().lastKnownPrayers;
    if (prayers != null && mounted) {
      await _service.syncToNative(context, prayers);
    }
  }

  Future<void> _onToggleEnabled(bool value) async {
    if (value && Platform.isAndroid && !_accessibilityEnabled) {
      await Navigator.push<bool>(
        context,
        MaterialPageRoute(builder: (_) => const AppBlockingSetupScreen()),
      );
      await _refreshAccessibility();
    }
    await _service.setEnabled(value);
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  Future<void> _onSelectMode(BlockingMode mode) async {
    await _service.setMode(mode);
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  Future<void> _onTogglePrayer(String prayer, bool value) async {
    await _service.togglePrayer(prayer, value);
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  Future<void> _onSetPreMinutes(int minutes) async {
    await _service.setPreMinutes(minutes);
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  Future<void> _onSetPostMinutes(int minutes) async {
    await _service.setPostMinutes(minutes);
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  Future<void> _testAppBlocking() async {
    if (!_accessibilityEnabled) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AppBlockingSetupScreen()),
      );
      await _refreshAccessibility();
      if (!_accessibilityEnabled) return;
    }
    if (!mounted) return;
    // Make sure native has the current blocked-apps list before testing —
    // the test window reuses the same prayer-time list and block screen.
    await _syncNative();
    if (!mounted) return;
    await _service.startTestBlockWindow(const Duration(minutes: 2));
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.appBlockingTestActiveSnackbar)),
    );
  }

  Future<void> _openAppsPicker() async {
    final l10n = AppLocalizations.of(context)!;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InstalledAppsPickerScreen(
          title: l10n.appBlockingAppsTitle,
          initiallySelected: _service.blockedPackages,
          onToggle: _service.toggleBlockedPackage,
          pinSelectedToTop: true,
        ),
      ),
    );
    if (!mounted) return;
    setState(() {});
    await _syncNative();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: _gold))
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_rounded,
                            size: 20, color: _white),
                      ),
                      Text(
                        l10n.appBlocking,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: _white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _HeroCard(
                    enabled: _service.enabled,
                    streak: _streak,
                    onToggle: _onToggleEnabled,
                  ),
                  if (_service.enabled &&
                      Platform.isAndroid &&
                      !_accessibilityEnabled) ...[
                    const SizedBox(height: 14),
                    _PermissionBanner(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AppBlockingSetupScreen()),
                        );
                        await _refreshAccessibility();
                      },
                    ),
                  ],
                  const SizedBox(height: 18),
                  if (Platform.isAndroid) ...[
                    _SectionLabel(text: l10n.appBlockingModeLabel),
                    const SizedBox(height: 10),
                    _ModeCard(
                      mode: BlockingMode.soft,
                      selected: _service.mode == BlockingMode.soft,
                      title: l10n.appBlockingModeSoft,
                      description: l10n.appBlockingModeSoftDesc,
                      onTap: () => _onSelectMode(BlockingMode.soft),
                    ),
                    const SizedBox(height: 10),
                    _ModeCard(
                      mode: BlockingMode.firm,
                      selected: _service.mode == BlockingMode.firm,
                      title: l10n.appBlockingModeFirm,
                      description: l10n.appBlockingModeFirmDesc,
                      onTap: () => _onSelectMode(BlockingMode.firm),
                    ),
                    const SizedBox(height: 10),
                    _ModeCard(
                      mode: BlockingMode.hard,
                      selected: _service.mode == BlockingMode.hard,
                      title: l10n.appBlockingModeHard,
                      description: l10n.appBlockingModeHardDesc,
                      onTap: () => _onSelectMode(BlockingMode.hard),
                    ),
                    const SizedBox(height: 22),
                  ],
                  _SectionLabel(text: l10n.appBlockingSelectPrayersLabel),
                  const SizedBox(height: 10),
                  _Card(
                    child: Column(
                      children: [
                        for (final prayer in AppBlockingService.prayerNames)
                          _PrayerToggleRow(
                            prayer: prayer,
                            value: _service.selectedPrayers.contains(prayer),
                            isLast: prayer == AppBlockingService.prayerNames.last,
                            onChanged: (v) => _onTogglePrayer(prayer, v),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  _SectionLabel(text: l10n.appBlockingBufferBeforeLabel),
                  const SizedBox(height: 10),
                  _BufferSelector(
                    value: _service.preMinutes,
                    onSelected: _onSetPreMinutes,
                  ),
                  const SizedBox(height: 18),
                  _SectionLabel(text: l10n.appBlockingBufferAfterLabel),
                  const SizedBox(height: 10),
                  _BufferSelector(
                    value: _service.postMinutes,
                    onSelected: _onSetPostMinutes,
                  ),
                  const SizedBox(height: 22),
                  _SectionLabel(text: l10n.appBlockingAppsTitle),
                  const SizedBox(height: 10),
                  if (Platform.isAndroid)
                    _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.appBlockingAppsSelectedCount(
                                _service.blockedPackages.length),
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: _white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _openAppsPicker,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: _gold,
                                side: BorderSide(
                                    color: _gold.withValues(alpha: 0.5)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                l10n.appBlockingSelectAppsButton,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.hourglass_top_rounded,
                                  size: 18, color: _gold),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  l10n.appBlockingIosComingSoonTitle,
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: _white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.appBlockingIosComingSoonBody,
                            style: GoogleFonts.lato(
                              fontSize: 12.5,
                              color: _grey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (Platform.isAndroid) ...[
                    const SizedBox(height: 22),
                    _SectionLabel(text: l10n.appBlockingTestSectionLabel),
                    const SizedBox(height: 10),
                    _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.appBlockingTestDescription,
                            style: GoogleFonts.lato(
                              fontSize: 12.5,
                              color: _grey,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _testAppBlocking,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: _gold,
                                side: BorderSide(
                                    color: _gold.withValues(alpha: 0.5)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                l10n.appBlockingTestButton,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// HERO CARD — master toggle + streak
// ─────────────────────────────────────────────
class _HeroCard extends StatelessWidget {
  final bool enabled;
  final int streak;
  final ValueChanged<bool> onToggle;

  const _HeroCard({
    required this.enabled,
    required this.streak,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_cardBg, _navy],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.appBlockingEnableToggle,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _white,
                  ),
                ),
              ),
              Switch(
                value: enabled,
                activeThumbColor: _gold,
                inactiveTrackColor: _cardBorder,
                onChanged: onToggle,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.streakDays(streak),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _gold,
                    ),
                  ),
                  Text(
                    l10n.currentStreak,
                    style: GoogleFonts.lato(fontSize: 12, color: _grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PERMISSION BANNER
// ─────────────────────────────────────────────
class _PermissionBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _PermissionBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: _gold.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _gold.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, size: 18, color: _gold),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l10n.appBlockingPermissionNeeded,
                style: GoogleFonts.lato(
                  fontSize: 12.5,
                  color: _gold,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, size: 18, color: _gold),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SECTION LABEL
// ─────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        color: _grey,
        letterSpacing: 1.1,
      ),
    );
  }
}

// ─────────────────────────────────────────────
// GENERIC CARD
// ─────────────────────────────────────────────
class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: child,
    );
  }
}

// ─────────────────────────────────────────────
// MODE CARD
// ─────────────────────────────────────────────
class _ModeCard extends StatelessWidget {
  final BlockingMode mode;
  final bool selected;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ModeCard({
    required this.mode,
    required this.selected,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? _gold.withValues(alpha: 0.10) : _cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? _gold : _cardBorder,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              size: 20,
              color: selected ? _gold : _grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: _white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: GoogleFonts.lato(fontSize: 12.5, color: _grey, height: 1.4),
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

// ─────────────────────────────────────────────
// PRAYER TOGGLE ROW
// ─────────────────────────────────────────────
class _PrayerToggleRow extends StatelessWidget {
  final String prayer;
  final bool value;
  final bool isLast;
  final ValueChanged<bool> onChanged;

  const _PrayerToggleRow({
    required this.prayer,
    required this.value,
    required this.isLast,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                prayer,
                style: GoogleFonts.lato(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                  color: _white,
                ),
              ),
            ),
            Switch(
              value: value,
              activeThumbColor: _gold,
              inactiveTrackColor: _cardBorder,
              onChanged: onChanged,
            ),
          ],
        ),
        if (!isLast) Container(height: 0.7, color: _cardBorder),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// BUFFER MINUTES SELECTOR
// ─────────────────────────────────────────────
class _BufferSelector extends StatelessWidget {
  final int value;
  final ValueChanged<int> onSelected;

  const _BufferSelector({required this.value, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        for (final option in AppBlockingService.bufferOptions)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: value == option ? _gold : _cardBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: value == option ? _gold : _cardBorder,
                    ),
                  ),
                  child: Text(
                    l10n.appBlockingMinutesShort(option),
                    style: GoogleFonts.lato(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: value == option ? _navy : _grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
