import 'dart:typed_data';

/// A real, on-device app — name, package, and real launcher icon — returned
/// by the native `getInstalledApps` call.
class InstalledApp {
  final String packageName;
  final String appName;
  final Uint8List? iconBytes;
  final bool isSystemApp;

  const InstalledApp({
    required this.packageName,
    required this.appName,
    this.iconBytes,
    this.isSystemApp = false,
  });

  factory InstalledApp.fromMap(Map<dynamic, dynamic> map) => InstalledApp(
        packageName: map['packageName'] as String,
        appName: map['appName'] as String,
        // The platform channel's standard codec already decodes a Kotlin
        // ByteArray straight into a Uint8List — no further conversion needed.
        iconBytes: map['icon'] as Uint8List?,
        isSystemApp: map['isSystemApp'] as bool? ?? false,
      );
}
