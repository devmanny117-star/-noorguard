import '../../l10n/app_localizations.dart';

/// Maps a 0-based slide index to the correct l10n heroVerse getter.
/// Matches the order in hero_card.dart's _buildSlides().
String heroVerseTranslation(AppLocalizations l10n, int idx) {
  switch (idx % 15) {
    case 0:  return l10n.heroVerse1;
    case 1:  return l10n.heroVerse2;
    case 2:  return l10n.heroVerse3;
    case 3:  return l10n.heroVerse4;
    case 4:  return l10n.heroVerse5;
    case 5:  return l10n.heroVerse6;
    case 6:  return l10n.heroVerse7;
    case 7:  return l10n.heroVerse8;
    case 8:  return l10n.heroVerse9;
    case 9:  return l10n.heroVerse10;
    case 10: return l10n.heroVerse11;
    case 11: return l10n.heroVerse12;
    case 12: return l10n.heroVerse13;
    case 13: return l10n.heroVerse14;
    default: return l10n.heroVerse15;
  }
}
