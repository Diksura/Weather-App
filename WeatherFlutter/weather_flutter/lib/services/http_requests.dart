import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_flutter/model/location.dart';
import 'package:weather_flutter/model/weather.dart';
import 'package:weather_flutter/model/weather_alerts.dart';
import 'package:weather_flutter/model/weather_astro.dart';
import 'package:weather_flutter/model/weather_forecast.dart';
import 'package:weather_flutter/services/http_helper.dart';
import 'package:weather_flutter/utility/debug_helpers.dart';

class HttpRequests {
  final HttpHelper _httpHelper = HttpHelper();

  Future<Weather?> getCurrentWeather(Location location, String language) async {
    Weather? weather;

    try {
      Response response = await _httpHelper.getRequest(
        path: "/current",
        queryParameters: {"latitude": "${location.lat}", "longitude": "${location.lon}", "language": language},
      );

      if (response.statusCode == 200) {
        // debugPrint(response.body);
        Map<String, dynamic> map = jsonDecode(response.body);
        weather = Weather.fromJson(map);
      }
    } catch (e) {
      errorPrint("HttpRequests().getCurrentWeather --> ${e.toString()}");
      return null;
    }

    successPrint("HttpRequests().getCurrentWeather");
    return weather;
  }

  Future<WeatherForecast?> getForecastWeather(Location location, String language) async {
    WeatherForecast? forecastWeather;

    try {
      Response response = await _httpHelper.getRequest(
        path: "/forecast",
        queryParameters: {
          "latitude": "${location.lat}",
          "longitude": "${location.lon}",
          "language": language,
          "days": "3",
          "aqi": "yes",
          "alerts": "yes",
        },
      );

      if (response.statusCode == 200) {
        // debugPrint(response.body);
        Map<String, dynamic> map = jsonDecode(response.body);
        forecastWeather = WeatherForecast.fromJson(map);
      }
    } catch (e) {
      errorPrint("HttpRequests().getForecastWeather --> ${e.toString()}");
      return null;
    }

    successPrint("HttpRequests().getForecastWeather");
    return forecastWeather;
  }

  Future<WeatherAstro?> getAstroWeather(Location location, String language, String date) async {
    WeatherAstro? astroWeather;

    try {
      Response response = await _httpHelper.getRequest(
        path: "/astro",
        queryParameters: {
          "latitude": "${location.lat}",
          "longitude": "${location.lon}",
          "language": language,
          "date": date,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        astroWeather = WeatherAstro.fromJson(map);
      }
    } catch (e) {
      errorPrint("HttpRequests().getAstroWeather --> ${e.toString()}");
      return null;
    }

    successPrint("HttpRequests().getAstroWeather");
    return astroWeather;
  }

  Future<WeatherAlerts?> getWeatherAlert(Location location, String language) async {
    WeatherAlerts? weatherAlerts;

    try {
      Response response = await _httpHelper.getRequest(
        path: "/alerts",
        queryParameters: {"latitude": "${location.lat}", "longitude": "${location.lon}", "language": language},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        weatherAlerts = WeatherAlerts.fromJson(map);
      }
    } catch (e) {
      errorPrint("HttpRequests().getWeatherAlerts --> ${e.toString()}");
      return null;
    }

    successPrint("HttpRequests().getWeatherAlert");
    return weatherAlerts;
  }
}
