import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';

import '../model/location.dart';

Future<Location?> getUserLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return null;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) return null;
  }

  if (permission == LocationPermission.deniedForever) return null;

  try {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isEmpty) return null;

    Placemark place = placemarks.first;

    return Location(
      name: place.locality ?? place.name ?? "Unknown Location",
      region: place.administrativeArea ?? "Unknown Region",
      country: place.country ?? "Unknown Country",
      lat: position.latitude,
      lon: position.longitude,
      tzId: DateTime.now().timeZoneName,
      localTimeEpoch: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      localTime: DateTime.now().toString(),
    );
  } catch (e) {
    debugPrint("ERROR | getUserLocation() --> $e");
    return null;
  }
}
