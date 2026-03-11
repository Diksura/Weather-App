import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';

import '../model/location.dart';

///GeoLocator
Future<Position?> getUserCoordinates() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return null;

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) return null;
  }

  if (permission == LocationPermission.deniedForever) return null;

  try {
    // Try cached location first
    Position? lastPosition = await Geolocator.getLastKnownPosition();

    if (lastPosition != null) {
      return lastPosition;
    }

    // If cached location not available → request GPS
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium, timeLimit: Duration(seconds: 10)),
    );
  } catch (e) {
    debugPrint("ERROR | getUserCoordinates() --> $e");
    return null;
  }
}

/// Take position from [getUserCoordinates()] then convert to [Location]
Future<Location?> getUserCoordinatesAsLocation() async {
  Position? position = await getUserCoordinates();

  if (position == null) return null;

  return Location(
    name: "Unknown Location",
    region: "Unknown Region",
    country: "Unknown Country",
    lat: position.latitude,
    lon: position.longitude,
    tzId: "Unknown Timezone",
    localtimeEpoch: 0,
    localtime: DateTime.now().toIso8601String(),
  );
}

/// GeoCoding
Future<Location?> getUserLocationDetails(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude).timeout(Duration(seconds: 10));

    if (placemarks.isEmpty) return null;

    Placemark place = placemarks.first;

    return Location(
      name: place.locality ?? place.subAdministrativeArea ?? place.name ?? "Unknown Location",
      region: place.administrativeArea ?? "Unknown Region",
      country: place.country ?? "Unknown Country",
      lat: latitude,
      lon: longitude,
      tzId: DateTime.now().timeZoneName,
      localtimeEpoch: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      localtime: DateTime.now().toIso8601String(),
    );
  } catch (e) {
    debugPrint("ERROR | getUserLocationDetails() --> $e");
    return null;
  }
}
