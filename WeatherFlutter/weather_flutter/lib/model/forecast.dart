import 'package:json_annotation/json_annotation.dart';

import 'astro.dart';
import 'forecast_day.dart';
import 'forecast_hour.dart';

part 'forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Forecast {
  final String date;
  final int dateEpoch;
  final ForecastDay day;
  final Astro astro;
  final List<ForecastHour> hour;

  Forecast({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}
