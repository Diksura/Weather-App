import 'package:json_annotation/json_annotation.dart';
import 'package:weather_flutter/model/current_weather.dart';

import 'alerts.dart';
import 'forecast.dart';
import 'forecast_day.dart';
import 'location.dart';

part 'json_serialising/weather_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherForecast {
  final Location location;

  final CurrentWeather current;
  final ForecastDayWeather forecast;
  final Alerts alerts;

  const WeatherForecast({
    required this.location,
    required this.current,
    required this.forecast,
    required this.alerts,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) => _$WeatherForecastFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastDayWeather {
  final List<Forecast> forecastday;

  const ForecastDayWeather({required this.forecastday});

  factory ForecastDayWeather.fromJson(Map<String, dynamic> json) => _$ForecastDayWeatherFromJson(json);
}
