import 'package:json_annotation/json_annotation.dart';
import 'package:weather_flutter/model/current_weather.dart';

import 'alerts.dart';
import 'forecast_day.dart';
import 'location.dart';

part 'weather_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherForecast {
  final Location location;

  // final CurrentWeather current;
  final ForecastWeather forecast;
  final Alerts alerts;

  const WeatherForecast({
    required this.location,
    // required this.current,
    required this.forecast,
    required this.alerts,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) => _$WeatherForecastFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastWeather {
  final List<ForecastDay> forecastday;

  const ForecastWeather({required this.forecastday});

  factory ForecastWeather.fromJson(Map<String, dynamic> json) => _$ForecastWeatherFromJson(json);
}
