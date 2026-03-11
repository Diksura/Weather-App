import 'package:json_annotation/json_annotation.dart';

import 'astro.dart';
import 'location.dart';

part 'weather_astro.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherAstro {
  final Location location;
  final Astronomy astronomy;

  const WeatherAstro({required this.location, required this.astronomy});

  factory WeatherAstro.fromJson(Map<String, dynamic> json) => _$WeatherAstroFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Astronomy {
  final Astro astro;

  const Astronomy({required this.astro});

  factory Astronomy.fromJson(Map<String, dynamic> json) => _$AstronomyFromJson(json);
}
