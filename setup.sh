#!/bin/bash
# ============================================================
# Noor Guard – Flutter Project Setup Script
# Run this AFTER installing Flutter (see CLAUDE.md step 1)
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_NAME="noor_guard"
TARGET_DIR="$HOME/Documents/$PROJECT_NAME"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   Noor Guard – Project Setup              ║"
echo "║   Guard your time. Honor your prayers.    ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# 1. Check Flutter is installed
if ! command -v flutter &> /dev/null; then
  echo "❌  Flutter not found. Please install Flutter first."
  echo "    Visit: https://docs.flutter.dev/get-started/install/macos"
  exit 1
fi

echo "✅  Flutter found: $(flutter --version | head -1)"
echo ""

# 2. Create Flutter project next to the source folder
PARENT_DIR="$(dirname "$TARGET_DIR")"
FLUTTER_DIR="$PARENT_DIR/${PROJECT_NAME}_app"

echo "📁  Creating Flutter project at: $FLUTTER_DIR"
cd "$PARENT_DIR"
flutter create --org com.noorguard --project-name $PROJECT_NAME $FLUTTER_DIR
echo "✅  Flutter project scaffold created."
echo ""

# 3. Copy custom source files over the generated ones
echo "📋  Copying Noor Guard source files..."
cp -r "$TARGET_DIR/lib/" "$FLUTTER_DIR/lib/"
cp "$TARGET_DIR/pubspec.yaml" "$FLUTTER_DIR/pubspec.yaml"
echo "✅  Source files copied."
echo ""

# 4. Get dependencies
echo "📦  Installing Flutter packages..."
cd "$FLUTTER_DIR"
flutter pub get
echo "✅  Packages installed."
echo ""

# 5. Done
echo "╔══════════════════════════════════════════╗"
echo "║  🎉  Setup complete!                      ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "To run the app:"
echo "  cd $FLUTTER_DIR"
echo "  flutter run"
echo ""
echo "To run on a specific device:"
echo "  flutter devices          (list connected devices)"
echo "  flutter run -d <device>  (run on that device)"
echo ""
