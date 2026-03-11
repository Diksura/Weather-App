import 'package:json_annotation/json_annotation.dart';
import 'package:weather_flutter/model/current_weather.dart';

import 'location.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Weather {
  final Location location;
  final CurrentWeather current;

  const Weather({required this.location, required this.current});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
