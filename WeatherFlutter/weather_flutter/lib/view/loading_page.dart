import 'package:flutter/material.dart';
import 'package:weather_flutter/model/location.dart';
import 'package:weather_flutter/model/weather_alerts.dart';
import 'package:weather_flutter/model/weather_astro.dart';
import 'package:weather_flutter/model/weather_forecast.dart';
import 'package:weather_flutter/services/http_requests.dart';
import 'package:weather_flutter/services/location_helper.dart';
import 'package:weather_flutter/utility/debug_helpers.dart';
import 'package:weather_flutter/view/home_page.dart';

import '../model/weather.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Weather? currentWeather;
  WeatherForecast? forecastWeather;
  WeatherAstro? weatherAstro;
  WeatherAlerts? weatherAlerts;

  void process() async {
    Location? location = await getUserCoordinatesAsLocation();

    if (location != null) {
      currentWeather = await HttpRequests().getCurrentWeather(location, "en");
      forecastWeather = await HttpRequests().getForecastWeather(location, "en");
      weatherAstro = await HttpRequests().getAstroWeather(location, "en", location.localtime);
      weatherAlerts = await HttpRequests().getWeatherAlert(location, "en");

      checkPrint("Data Fetching Completed");

      if (currentWeather != null && forecastWeather != null && weatherAstro != null && weatherAlerts != null) {
        navigateToHome(currentWeather!, forecastWeather!, weatherAstro!, weatherAlerts!);
      }
      else{
        warningPrint("Data Fetching Failed | Trying again Fetching Data");
        process();
      }
    }
  }

  void navigateToHome(
    Weather currentWeather,
    WeatherForecast forecastWeather,
    WeatherAstro weatherAstro,
    WeatherAlerts weatherAlerts,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          currentWeather: currentWeather,
          forecastWeather: forecastWeather,
          weatherAstro: weatherAstro,
          weatherAlerts: weatherAlerts,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    process();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("data")],
        ),
      ),
    );
  }
}
