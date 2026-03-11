// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      forecast: ForecastWeather.fromJson(
        json['forecast'] as Map<String, dynamic>,
      ),
      alerts: Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'forecast': instance.forecast,
      'alerts': instance.alerts,
    };

ForecastWeather _$ForecastWeatherFromJson(Map<String, dynamic> json) =>
    ForecastWeather(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastWeatherToJson(ForecastWeather instance) =>
    <String, dynamic>{'forecastday': instance.forecastday};
