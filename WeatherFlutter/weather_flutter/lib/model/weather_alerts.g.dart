// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_alerts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAlerts _$WeatherAlertsFromJson(Map<String, dynamic> json) =>
    WeatherAlerts(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      alerts: Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherAlertsToJson(WeatherAlerts instance) =>
    <String, dynamic>{'location': instance.location, 'alerts': instance.alerts};
