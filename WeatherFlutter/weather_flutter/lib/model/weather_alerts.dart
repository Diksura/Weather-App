import 'package:json_annotation/json_annotation.dart';

import 'alerts.dart';
import 'location.dart';

part 'weather_alerts.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherAlerts {
  final Location location;
  final Alerts alerts;

  const WeatherAlerts({required this.location, required this.alerts});

  factory WeatherAlerts.fromJson(Map<String, dynamic> json) => _$WeatherAlertsFromJson(json);
}
