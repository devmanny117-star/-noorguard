# Noor Guard – Project Context

**Tagline:** Guard your time. Honor your prayers.  
**Platform:** iOS + Android (Flutter)  
**Bundle ID:** com.noorguard.noor_guard

---

## What Is This App?

Noor Guard is an Islamic productivity app with three core pillars:

1. **Islamic Lock Screen** – Replace the phone lock screen with Quranic verses, prayer times, and reminders that connect the user to their deen every time they pick up their phone.
2. **Prayer-Time App Blocking** – Automatically block distracting apps (social media, games) during the 5 daily prayer times, so nothing pulls the user away from salah.
3. **Focus Mode** – A manual mode the user can activate to block all non-essential apps for a set duration (for Quran reading, studying, etc.).

---

## Brand & Design

### Colors
| Name             | Hex       | Usage                                   |
|------------------|-----------|-----------------------------------------|
| Cream Background | `#F5EFE6` | App scaffold background                 |
| Soft Cream       | `#FAF5EE` | Card backgrounds                        |
| Gold Accent      | `#C9A84C` | Highlights, prayer times, CTAs          |
| Light Gold       | `#E8D5A3` | Secondary gold, icon backgrounds        |
| Deep Green       | `#1B5E20` | Primary color, active states, headers   |
| Medium Green     | `#2E7D32` | Gradient partner to deep green          |
| Dark Text        | `#2C2C2A` | Body text, headings                     |
| Muted Text       | `#7A7570` | Subtitles, secondary info               |
| Divider          | `#E8DFD0` | Borders, separators                     |

### Fonts
- **Headings / Titles:** Playfair Display (serif, feels classic and trustworthy)
- **Body / UI text:** Lato (clean, readable sans-serif)
- **Arabic text:** Scheherazade New (designed for Arabic script)

### Design Philosophy
- Warm, calm, and grounded – like a well-lit prayer space
- No harsh white or cold blue; everything leans cream/sand/gold
- Large readable text for prayer names and times
- Mosque and crescent motifs drawn in code (no external image files required for core UI)

---

## File Structure

```
lib/
├── main.dart                        # App entry point + splash screen
├── theme/
│   └── app_theme.dart               # All colors, text styles, Material theme
├── models/
│   ├── prayer_model.dart            # Prayer data class + sample prayer times
│   ├── dua_model.dart               # Dua data (lock screen duas + focus duas)
│   └── app_model.dart               # App list for blocking (categories + icons)
├── screens/
│   ├── home_screen.dart             # Main screen with bottom nav
│   ├── lock_screen.dart             # Full-screen dark Islamic lock screen preview
│   ├── focus_mode_screen.dart       # Timer circle + blocked app preview + start/stop
│   └── app_blocking_screen.dart     # Per-app toggle list grouped by category
└── widgets/
    └── home/
        ├── header_section.dart      # Greeting + notification + profile icons
        ├── hero_card.dart           # Painted mosque/desert landscape + Quran verse
        ├── prayer_times_card.dart   # Next prayer + all 5 prayers horizontal row
        ├── feature_grid.dart        # 5 feature tiles — Lock Screen/Focus/Blocking navigate
        └── quote_banner.dart        # Quote with Islamic geometric pattern
```

---

## Home Screen Sections (Top to Bottom)

### 1. Header
- "As-Salamu / Alaikum" in Playfair Display, green accent on second word
- Subtitle: "May Allah bless your day" in muted text
- Top-right: notification bell (with gold dot badge) + green profile button

### 2. Hero Card (mosque painting)
- Drawn entirely in Flutter's `CustomPainter` – no image assets needed
- Night sky gradient (deep indigo → amber at horizon)
- Twinkling stars, mosque silhouette with domes, minarets, gold crescents
- Quran verse overlay (Al-Baqarah 2:238) with gold underline accent

### 3. Prayer Times Card
- Green gradient header showing next prayer (name large in Playfair, time in gold chip)
- Countdown ("In 1h 23m") with clock icon
- Horizontal row of all 5 prayers: passed ones muted, next one highlighted green

### 4. Feature Grid
- Top row: 3 tiles — Qibla, Duas, Lock Screen
- Bottom row: 2 wider tiles — Focus Mode, App Blocking
- Each tile: colored icon in a soft-tinted circle, label, short subtitle

### 5. Quote Banner
- Dark gold gradient background
- Islamic 8-point geometric star pattern (CustomPainter overlay at 6% opacity)
- Quran quote (Ash-Sharh 94:6) in italic Playfair Display

### Bottom Navigation Bar
Home | Quran | Prayers | Duas | More

---

## Splash Screen

- Deep green background
- Crescent moon icon in gold
- "Noor Guard" in large Playfair Display white text
- Tagline below in muted white
- Fades and scales in, then transitions to home after 2.2 seconds

---

## How to Run (for non-developers)

### Step 1 – Install Flutter
1. Go to https://docs.flutter.dev/get-started/install/macos
2. Download Flutter for macOS (ARM for M1/M2/M3 Mac, Intel for older Mac)
3. Unzip and move the `flutter` folder to `~/development/flutter`
4. Open Terminal and run:
   ```
   export PATH="$HOME/development/flutter/bin:$PATH"
   ```
5. Then run: `flutter doctor` – this tells you what else to install

### Step 2 – Install Xcode (for iOS)
- Open the App Store, search "Xcode", install it (it's large, ~14GB)
- After install run: `sudo xcode-select --switch /Applications/Xcode.app`

### Step 3 – Run the setup script
Open Terminal, then run:
```bash
bash ~/Documents/noor_guard/setup.sh
```

This will:
- Create a full Flutter project
- Copy all the Noor Guard source files in
- Install all packages

### Step 4 – Run the app
```bash
cd ~/Documents/noor_guard_app
flutter run
```

If you have an iPhone plugged in, it will run on your phone.  
If you want to see it in a simulator: open Xcode → Simulator first, then run `flutter run`.

---

## Packages Used

| Package        | Version | Purpose                              |
|----------------|---------|--------------------------------------|
| `google_fonts` | ^6.2.1  | Playfair Display + Lato font loading |
| `cupertino_icons` | ^1.0.8 | iOS-style icons                   |

---

## Built Screens

### Lock Screen (`lock_screen.dart`)
- Full dark navy background (`#070B14`) covered in a dense gold 8-pointed star field drawn in CustomPainter at 8% opacity
- Live clock that ticks every second; large gold Playfair Display numerals (~88px)
- Animated crescent moon + 5-pointed star at top that gently pulses with a glow
- Prayer pill showing next prayer name, time, and countdown
- 5 rotating duas: Arabic text (RTL), gold divider, English translation in italic Playfair
- Dua crossfades every 7 seconds; dot indicators show which dua is active
- "Swipe up to unlock" hint at bottom; nav bar switches to light icons automatically

### Focus Mode (`focus_mode_screen.dart`)
- 290px circular timer with a SweepGradient gold progress arc and animated leading dot
- Live countdown (counts down from preset, stops at 0, resets)
- Dua displayed inside the circle, rotates with crossfade every 30 seconds
- 4 preset duration pills: 15, 25, 45, 60 min — highlights in gold when selected
- Blocked apps section: greyed-out icons with a red block badge, pulled from `sampleApps`
- Start/Stop button: gold when starting, red when stopping, with colored glow shadow

### App Blocking (`app_blocking_screen.dart`)
- Collapsing sliver header with green gradient stats card showing blocked count + progress bar
- "Block all" master toggle at top (white switch on green card)
- Apps listed in sections: Social Media, Entertainment, Games, Messaging
- Each row: full-color or greyed-out app icon, name, status text, custom deep-green toggle
- Toggle switch is custom-built (not the system widget) — animated slide + color transition
- Info banner explains timing: blocks 5 min before prayer, lifts 15 min after

---

## Planned Features (Not Yet Built)

- [ ] Real prayer time calculation using device location
- [ ] Actual Qibla compass using device magnetometer
- [ ] Dua library with categories (morning, evening, after prayer, etc.)
- [ ] App blocking using iOS Screen Time API / Android UsageStatsManager
- [ ] Lock screen widget (iOS 16+ Live Activities or home screen widget)
- [ ] Notification reminders 15 minutes before each prayer
- [ ] Quran reader with translation
- [ ] Streak tracking for prayers completed on time

---

## Notes for Future Claude Sessions

- All custom painting (mosque, stars, Islamic patterns) is in `CustomPainter` subclasses — no image assets required
- Prayer times are currently hardcoded in `prayer_model.dart` — needs real calculation
- The `IndexedStack` in `home_screen.dart` holds placeholder tabs; replace with real screen widgets as features are built
- Arabic text uses `Scheherazade New` from google_fonts — import it before using
- Keep warm/cream tones; avoid pure white or cold blue; the brand is warm and grounded

---

## Workflow Rules

- Never explain GitHub setup or ask about pushing to GitHub unprompted
- Always put prompts and commands in code blocks
- Be concise — no long explanations unless asked
- No motivational filler phrases
- **Build order is mandatory:** After every change, always run `flutter run -d chrome` first for visual inspection. Only run `flutter run -d RFCY71SEQZJ` (Z Fold 7) or `flutter run -d 00008150-00093840119B401C` (iPhone 17e) after Chrome review is approved by Manny.
- Never deploy to a physical device without Chrome approval first.
- Chrome first always before deploying to device
- Never stack multiple `flutter run` commands — kill the existing one first, only one active at a time
- Commit after every completed feature

---

## Build Flavors (added July 31, 2026)

Android has two product flavors. **Always pass `--flavor`** — see the warning below.

| Flavor | applicationId          | Launcher name    | Icon                |
|--------|------------------------|------------------|---------------------|
| `prod` | `com.noorguard.app`    | Noor Guard       | normal              |
| `dev`  | `com.noorguard.app.dev`| Noor Guard DEV   | red **DEV** badge   |

Different applicationIds, so both install side by side on one device.

```bash
flutter run -d chrome --flavor dev          # Chrome review (flavor ignored on web, but harmless)
flutter run -d RFCY71SEQZJ --flavor dev     # Z Fold 7
flutter build appbundle --flavor prod       # Play Store upload
```

**Never omit `--flavor` on a build.** Gradle silently builds *both* flavors and
Flutter then prints a success line pointing at the old unflavored path
(`app-debug.apk` / `bundle/release/app-release.aab`) — a file the build did not
write. That path may hold a stale artifact from weeks ago, so the reported
output is not the build you just made. Real outputs are:

- `build/app/outputs/flutter-apk/app-<flavor>-debug.apk`
- `build/app/outputs/bundle/<flavor>Release/app-<flavor>-release.aab`

### Where flavor-specific files live

`android/app/src/dev/` overlays `src/main/` for dev builds only:
- `res/mipmap-*/ic_launcher.png` + `res/drawable-*/ic_launcher_foreground.png` — DEV-badged icons
- `google-services.json` — see `src/dev/README.md`

App name comes from `resValue("string", "app_name", …)` per flavor in
`android/app/build.gradle.kts`; the manifest just references `@string/app_name`.
Do not add `app_name` to `res/values/strings.xml` — it would collide.

### Known gaps

- **iOS has no flavors yet.** Needs Xcode build configurations and a second
  scheme; `--flavor` on iOS will fail until that is done.
- **Dev shares production Firestore data.** The dev `google-services.json`
  reuses the prod Firebase app. See `android/app/src/dev/README.md`.

---

## Languages

- App supports **17 languages** (Persian/Farsi added June 2026, Russian added July 2026)
- Every feature must work in ALL 17 languages from day one — never ship English-only
- Languages: English, Arabic, Urdu, Mexican Spanish, French, Indonesian, Chinese, Japanese, Bengali, Turkish, Swahili, German, Dutch, Portuguese, Italian, Persian/Farsi, Russian

---

## Key Fixes (Lessons Learned)

- **Home screen overflow:** `AspectRatio` changed from `1.2` to `1.15` in `feature_grid.dart`
- **BeginnerHomeScreen gap:** use `Column + Spacer() + SizedBox(16)` not hardcoded padding in `SliverFillRemaining`
- **Block screen speed:** `BlockScreenCache` pre-loads bitmaps at startup
- **App selector speed:** installed apps pre-loaded in background at startup
- **Notification toggle:** must gate ALL layers — Dart + native Android + foreground service
- **iOS HomeWidget:** all calls guarded with `Platform.isAndroid`
- **Quran search:** uses `QuranFullIndex` with 6,236 ayahs, synonym expansion, 16 languages
- **Revert Corner banner subtitle:** wraps to 2 lines at 12px (was 1-line ellipsis) in `feature_grid.dart`; card's fixed 140px height fits worst case (2-line title + 2-line subtitle)

---

## New Features Built (June–July 2026)

- **Share feature** (`widgets/share_card.dart`, `widgets/share_sheet.dart`, `services/share_helper.dart`) — share Ayah/Dua/Name/Hadith with branded card
- **Bookmarks** (`services/bookmark_service.dart` + `screens/saved_duas_screen.dart`, `saved_verses_screen.dart`, `saved_names_screen.dart`) — saved duas, saved Quran verses, saved 99 Names; persists in SharedPreferences; gold bookmark header icons on Duas, Quran reader, and 99 Names screens
- **Back to Basics screen** (`screens/new_muslim_hub_screen.dart`, `NewMuslimHubScreen`) — renamed from Revert Corner, 5 Pillars expandable
- **Persistent notification** (`services/live_notification_service.dart`) — lock screen notification with rotating content
- **Mode toggle button** — crescent moon icon switches between Regular and Beginner Mode
- **Explore All Features modal** — premium bottom sheet on BeginnerHomeScreen
- **BeginnerHomeScreen color fixes** — dark navy `#0D1B2A` cards hardcoded in both light and dark mode (Journey card, Beginner Toolbox, Explore All button); never use theme-dependent colors on these
- **99 Names descriptions** — all 16 languages in `data/asma_explanations.dart`
- **Share buttons** on Duas, Quran reader, and 99 Names screens
- **Gold borders** on all Android home screen widgets
- **Noor Guard Live notification** (July 2, 2026) — the keep-alive foreground notification (`PrayerForegroundService.kt`) upgraded into a rich persistent lock-screen notification: title "next prayer • time", countdown subtitle, expanded BigTextStyle with gold divider + rotating daily content (5-day cycle: Ayah → Dua → Glossary Word → Name of Allah → Hadith, Sunni sources). Channel `noor_guard_live` (LOW, silent, public lock-screen visibility; old `prayer_keep_alive` channel deleted). Dart side `services/live_notification_service.dart` writes a 7-day localized payload to SharedPreferences (`live_notif_payload`); native self-refreshes every 30 min and at prayer-time boundaries, rolls to tomorrow's Fajr overnight. New monochrome status-bar icon `drawable/ic_notif_crescent.xml`. Also added the missing Persian ('fa') translations to all 9 duas in `models/dua_model.dart`, and exposed glossary terms read-only via `glossaryTermAt()` in `islamic_glossary_screen.dart`
- **Hero card upgrades** (July 2, 2026) — bottom gradient now covers bottom 60% (transparent → black 0.75) for verse legibility; verse deck doubled from 15 to 30 slides (`heroVerse16`–`heroVerse30` in all 16 ARB files; 4 refs that already existed use different excerpts of the same verse so no text repeats)
- **Islamic Calendar premium redesign** (July 2, 2026) — `screens/islamic_calendar_screen.dart` rebuilt as a fixed dark-navy/gold surface in both themes: live Hijri date hero (computed via `HijriDate.fromGregorian`, no longer hardcoded) with Arabic date + geometric star pattern, horizontal Hijri month strip with today gold-highlighted and auto-centered (tabular 29/30-day month lengths), gold-accent event cards with "NEXT" badge, diamond ornament (◆) section headers. Upcoming section now before Past. Fully RTL-safe (directional edges/borders); no new l10n keys needed
- **Kotlin string localization** (July 2, 2026) — `PrayerForegroundService.kt` fallback strings moved to Android resources (`keep_alive_title`, `keep_alive_text`, `live_channel_name`) in `res/values/strings.xml` + all 15 language folders (`values-fa/` newly created), reusing the exact ARB translations. Caveat: Android resources follow the device language, not the in-app language — acceptable since these show only before Dart pushes its localized strings

---

## Remaining Launch Items

- [x] Islamic Calendar premium redesign (done July 2, 2026 — deployed to Z Fold 7)
- [ ] Focus Mode premium redesign
- [ ] Full language spot check (automated scan July 2, 2026 passed: no hardcoded English in Dart UI or Kotlin service strings; visual per-language pass still to do)
- [ ] Learn Salah icon
- [ ] Community Stories redesign (WIP in working tree: `community_stories_screen.dart`, `our_stories_card.dart`, Firebase setup — uncommitted)
- [ ] Full iPhone testing
- [ ] Full Z Fold 7 testing
- [ ] Store submission

---

## Git Tags

- `v1-pre-launch-stable` — safe restore point before overflow fixes
- `v1-pre-launch-stable-2` — safe restore point after overflow fixes

---

## Design System

- **Colors:** dark navy `#0D1B2A`, gold `#C9A84C`, cream `#F5EFE6`
- **Fonts:** Playfair Display for headings, Scheherazade New for Arabic/Persian text
- **No moon emoji** — use `Icons.nightlight_round` colored `#C9A84C`
- Premium aesthetic throughout — this is a paid app
