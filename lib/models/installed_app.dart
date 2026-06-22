import 'dart:typed_data';

/// A real, on-device app returned by the native `getInstalledApps` call —
/// distinct from the hardcoded preview apps in `app_model.dart`, which Focus
/// Mode still uses for its own mock "blocked apps" chips.
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
        iconBytes: map['icon'] != null
            ? Uint8List.fromList(List<int>.from(map['icon'] as List))
            : null,
        isSystemApp: map['isSystemApp'] as bool? ?? false,
      );
}
