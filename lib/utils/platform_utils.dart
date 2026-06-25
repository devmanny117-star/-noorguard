import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Safe replacements for `dart:io`'s `Platform.isAndroid` / `Platform.isIOS`
/// — those getters throw `Unsupported operation: Platform._operatingSystem`
/// at runtime on web, so [kIsWeb] must short-circuit before either is ever
/// touched.
bool get isAndroidPlatform => !kIsWeb && Platform.isAndroid;
bool get isIOSPlatform => !kIsWeb && Platform.isIOS;
