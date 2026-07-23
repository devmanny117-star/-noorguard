import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/saved_location_model.dart';

/// A city + ISO country code pair, the addressing scheme the AlAdhan by-city
/// prayer times API uses.
class PrayerCity {
  final String city;
  final String country;
  const PrayerCity({required this.city, required this.country});

  String get label => '$city, $country';
}

/// Persists the user's saved Qibla locations (home/work/travel, etc.) and
/// the id of whichever one is currently selected. A `null` selected id means
/// "use the device's live GPS position" — the original Qibla screen behavior.
class LocationService {
  static const maxSavedLocations = 5;

  static const _kLocationsKey = 'qibla_saved_locations';
  static const _kSelectedIdKey = 'qibla_selected_location_id';

  Future<List<SavedLocation>> loadSavedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_kLocationsKey) ?? [];
    return raw
        .map((s) => SavedLocation.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  Future<String?> loadSelectedLocationId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kSelectedIdKey);
  }

  Future<void> saveSelectedLocationId(String? id) async {
    final prefs = await SharedPreferences.getInstance();
    if (id == null) {
      await prefs.remove(_kSelectedIdKey);
    } else {
      await prefs.setString(_kSelectedIdKey, id);
    }
  }

  /// Forward-geocodes [query] (a city name) to coordinates, then
  /// reverse-geocodes those coordinates into a clean "City, Region" label.
  /// Throws if the city can't be resolved.
  Future<SavedLocation> geocodeCityName(String query) async {
    final results = await locationFromAddress(query);
    if (results.isEmpty) {
      throw Exception('No location found for "$query"');
    }
    final loc = results.first;
    final name = await _reverseGeocodeLabel(loc.latitude, loc.longitude) ?? query;
    return SavedLocation(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: name,
      latitude: loc.latitude,
      longitude: loc.longitude,
    );
  }

  /// The saved Qibla location to use for prayer times when live GPS isn't
  /// available: the explicitly selected one, else the first saved one, else
  /// null (the caller must ask the user to pick a city — never default
  /// silently). The lat/lng is reverse-geocoded to the city + ISO country
  /// code the AlAdhan by-city API needs; a location whose reverse-geocode
  /// fails is skipped in favor of the next saved one.
  Future<PrayerCity?> savedPrayerCity() async {
    final locations = await loadSavedLocations();
    if (locations.isEmpty) return null;
    final selectedId = await loadSelectedLocationId();
    final ordered = [
      ...locations.where((l) => l.id == selectedId),
      ...locations.where((l) => l.id != selectedId),
    ];
    for (final location in ordered) {
      final city = await cityFromLatLng(location.latitude, location.longitude);
      if (city != null) return city;
    }
    return null;
  }

  /// Reverse-geocodes coordinates to the city + ISO country code pair the
  /// prayer-times API needs, or null if that can't be resolved.
  Future<PrayerCity?> cityFromLatLng(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return null;
      final p = placemarks.first;
      final city = (p.locality?.isNotEmpty ?? false)
          ? p.locality!
          : (p.subAdministrativeArea ?? '');
      final country = p.isoCountryCode ?? '';
      if (city.isEmpty || country.isEmpty) return null;
      return PrayerCity(city: city, country: country);
    } catch (_) {
      return null;
    }
  }

  Future<String?> _reverseGeocodeLabel(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return null;
      final p = placemarks.first;
      final city = (p.locality?.isNotEmpty ?? false)
          ? p.locality!
          : (p.subAdministrativeArea?.isNotEmpty ?? false)
              ? p.subAdministrativeArea!
              : (p.name ?? '');
      final region = (p.administrativeArea?.isNotEmpty ?? false)
          ? p.administrativeArea!
          : (p.isoCountryCode ?? '');
      if (city.isEmpty) return region.isEmpty ? null : region;
      if (region.isEmpty) return city;
      return '$city, $region';
    } catch (_) {
      return null;
    }
  }

  Future<List<SavedLocation>> addLocation(SavedLocation location) async {
    final locations = await loadSavedLocations();
    if (locations.length >= maxSavedLocations) {
      throw Exception('Maximum of $maxSavedLocations saved locations reached');
    }
    locations.add(location);
    await _persist(locations);
    return locations;
  }

  Future<List<SavedLocation>> deleteLocation(String id) async {
    final locations = await loadSavedLocations();
    locations.removeWhere((l) => l.id == id);
    await _persist(locations);
    return locations;
  }

  Future<void> _persist(List<SavedLocation> locations) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _kLocationsKey,
      locations.map((l) => jsonEncode(l.toJson())).toList(),
    );
  }
}
