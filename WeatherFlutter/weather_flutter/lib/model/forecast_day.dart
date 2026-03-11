import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  String id;
  String date;

  @JsonKey(name: 'maxtemp_c')
  final double maxtempC;

  @JsonKey(name: 'maxtemp_f')
  final double maxtempF;

  @JsonKey(name: 'mintemp_c')
  final double mintempC;

  @JsonKey(name: 'mintemp_f')
  final double mintempF;

  @JsonKey(name: 'avgtemp_c')
  final double avgtempC;

  @JsonKey(name: 'avgtemp_f')
  final double avgtempF;

  @JsonKey(name: 'maxwind_mph')
  final double maxwindMph;

  @JsonKey(name: 'maxwind_kph')
  final double maxwindKph;

  @JsonKey(name: 'totalprecip_mm')
  final double totalprecipMm;

  @JsonKey(name: 'totalprecip_in')
  final double totalprecipIn;

  @JsonKey(name: 'totalsnow_cm')
  final double totalsnowCm;

  @JsonKey(name: 'avgvis_km')
  final double avgvisKm;

  @JsonKey(name: 'avgvis_miles')
  final double avgvisMiles;

  final double avghumidity;

  @JsonKey(name: 'daily_will_it_rain')
  final int dailyWillItRain;

  @JsonKey(name: 'daily_chance_of_rain')
  final double dailyChanceOfRain;

  @JsonKey(name: 'daily_will_it_snow')
  final int dailyWillItSnow;

  @JsonKey(name: 'daily_chance_of_snow')
  final double dailyChanceOfSnow;

  final Condition condition;

  final double uv;

  // @JsonKey(name: 'air_quality')
  // final AirQuality airQuality;

  ForecastDay({
    this.id = '',
    this.date = '',
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
    // this.airQuality,
  });

  /// air quality property temporarily removed due to api has no longer supporting (11/03/2026)

  factory ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);
}
