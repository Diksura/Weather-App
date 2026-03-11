import 'package:json_annotation/json_annotation.dart';

import 'astro.dart';
import 'forecast_day.dart';
import 'forecast_hour.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final String date;

  @JsonKey(name: 'date_epoch')
  final int dateEpoch;

  @JsonKey(name: 'day')
  final ForecastDay fullDay;

  final Astro astro;

  @JsonKey(name: 'hour')
  final List<ForecastHour> hourly;

  Forecast({
    required this.date,
    required this.dateEpoch,
    required this.fullDay,
    required this.astro,
    required this.hourly,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}
