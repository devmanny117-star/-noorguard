import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/share_card.dart';

/// Renders a [ShareCardWidget] off-screen via a root Overlay entry, captures
/// it as a PNG, and opens the system share sheet.
///
/// [context] must be a context with a valid root Overlay above it.
Future<void> shareContent({
  required BuildContext context,
  required String typeLabel,
  required String arabic,
  required String transliteration,
  required String translation,
  required String source,
  required String brandingLabel,
}) =>
    shareCardWidget(
      context: context,
      card: ShareCardWidget(
        typeLabel: typeLabel,
        arabic: arabic,
        transliteration: transliteration,
        translation: translation,
        source: source,
        brandingLabel: brandingLabel,
      ),
      shareText: brandingLabel,
    );

/// Renders any pre-built share card off-screen, captures it as a PNG and
/// opens the system share sheet. [precacheAssets] must list every asset image
/// the card displays — the capture happens one frame after insertion, so an
/// undecoded image would come out blank.
Future<void> shareCardWidget({
  required BuildContext context,
  required Widget card,
  required String shareText,
  List<String> precacheAssets = const [],
}) async {
  for (final asset in precacheAssets) {
    await precacheImage(AssetImage(asset), context);
  }
  if (!context.mounted) return;

  final repaintKey = GlobalKey();
  final completer = Completer<Uint8List>();
  const cardWidth = 400.0;
  const pixelRatio = 3.0;

  late OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => Positioned(
      left: -5000,
      top: -5000,
      width: cardWidth,
      child: RepaintBoundary(
        key: repaintKey,
        child: Material(
          color: Colors.transparent,
          child: card,
        ),
      ),
    ),
  );

  Overlay.of(context, rootOverlay: true).insert(entry);

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    try {
      final boundary = repaintKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) throw Exception('RepaintBoundary not found');
      final ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw Exception('image.toByteData returned null');
      completer.complete(byteData.buffer.asUint8List());
    } catch (e) {
      completer.completeError(e);
    } finally {
      entry.remove();
    }
  });

  final bytes = await completer.future;
  final dir = await getTemporaryDirectory();
  // Unique filename per share: the system share sheet caches its preview
  // thumbnail by content URI, so reusing one path shows the previous share's
  // image (e.g. a Dua card when sharing a story). Old files are cleaned up
  // first so they don't pile up in the temp directory.
  try {
    await for (final f in dir.list()) {
      if (f is File && f.uri.pathSegments.last.startsWith('noor_guard_share')) {
        await f.delete();
      }
    }
  } catch (_) {
    // Best-effort cleanup; sharing still works if a stale file lingers.
  }
  final file = File(
      '${dir.path}/noor_guard_share_${DateTime.now().millisecondsSinceEpoch}.png');
  await file.writeAsBytes(bytes);

  await SharePlus.instance.share(ShareParams(
    files: [XFile(file.path)],
    text: shareText,
  ));
}
