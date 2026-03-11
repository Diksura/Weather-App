import 'package:json_annotation/json_annotation.dart';

import 'air_quality.dart';
import 'condition.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;

  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  @JsonKey(name: 'temp_c')
  final double tempC;

  @JsonKey(name: 'temp_f')
  final double tempF;

  @JsonKey(name: 'is_day')
  final int isDay;

  final Condition condition;

  @JsonKey(name: 'wind_mph')
  final double windMph;

  @JsonKey(name: 'wind_kph')
  final double windKph;

  @JsonKey(name: 'wind_degree')
  final double windDegree;

  @JsonKey(name: 'wind_dir')
  final String windDir;

  @JsonKey(name: 'pressure_mb')
  final double pressureMb;

  @JsonKey(name: 'pressure_in')
  final double pressureIn;

  @JsonKey(name: 'precip_mm')
  final double precipMM;

  @JsonKey(name: 'precip_in')
  final double precipIn;

  final int humidity;
  final int cloud;

  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;

  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;

  @JsonKey(name: 'windchill_c')
  final double windchillC;

  @JsonKey(name: 'windchill_f')
  final double windchillF;

  @JsonKey(name: 'heatindex_c')
  final double heatindexC;

  @JsonKey(name: 'heatindex_f')
  final double heatindexF;

  @JsonKey(name: 'dewpoint_c')
  final double dewpointC;

  @JsonKey(name: 'dewpoint_f')
  final double dewpointF;

  @JsonKey(name: 'vis_km')
  final double visKm;

  @JsonKey(name: 'vis_miles')
  final double visMiles;

  final double uv;

  @JsonKey(name: 'gust_mph')
  final double gustMph;

  @JsonKey(name: 'gust_kph')
  final double gustKph;

  @JsonKey(name: 'air_quality')
  final AirQuality airQuality;

  CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMM,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);
}
