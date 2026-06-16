import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_compass/flutter_compass.dart';

class QiblaService {
  static const double _meccaLat = 21.4225;
  static const double _meccaLng = 39.8262;

  /// Returns the clockwise bearing (0–360°) from [userLat]/[userLng] to Mecca
  /// using the great-circle initial bearing formula.
  static double calculateQiblaDirection(double userLat, double userLng) {
    final lat1 = userLat * math.pi / 180;
    const lat2 = _meccaLat * math.pi / 180;
    final deltaLng = (_meccaLng - userLng) * math.pi / 180;

    final y = math.sin(deltaLng) * math.cos(lat2);
    final x = math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(deltaLng);

    final bearing = math.atan2(y, x) * 180 / math.pi;
    return (bearing + 360) % 360;
  }

  /// Returns a stream of needle rotation angles (0–360°).
  /// Each value is how far clockwise from screen-up the qibla needle should
  /// point, given the device's current compass heading.
  ///
  /// Pass the result of [calculateQiblaDirection] as [qiblaBearing].
  /// Returns Stream.value(0) on web or when the compass is unavailable.
  static Stream<double> getQiblaStream(double qiblaBearing) {
    if (kIsWeb) return Stream.value(0);

    try {
      final events = FlutterCompass.events;
      if (events == null) return Stream.value(0);

      return events
          .where((e) => e.heading != null)
          .map((e) => (qiblaBearing - e.heading! + 360) % 360);
    } catch (_) {
      return Stream.value(0);
    }
  }
}
