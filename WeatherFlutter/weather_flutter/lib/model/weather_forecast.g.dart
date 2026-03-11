// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

ForecastDayWeather _$ForecastDayWeatherFromJson(Map<String, dynamic> json) =>
    ForecastDayWeather(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayWeatherToJson(ForecastDayWeather instance) =>
    <String, dynamic>{'forecastday': instance.forecastday};
