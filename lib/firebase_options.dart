// PLACEHOLDER — Firebase is not connected yet.
//
// To connect the app to a real Firebase project, run in Terminal:
//   dart pub global activate flutterfire_cli
//   flutterfire configure
// That command REPLACES this whole file with real per-platform options.
// Until then, [DefaultFirebaseOptions.currentPlatform] throws, which
// main.dart catches — the app runs normally with all Firebase-backed
// features (Community Stories) hidden.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    throw UnsupportedError(
      'Firebase has not been configured yet — run `flutterfire configure`.',
    );
  }
}
