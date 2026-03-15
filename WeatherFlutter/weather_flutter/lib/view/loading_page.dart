import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_flutter/model/location.dart';
import 'package:weather_flutter/model/weather_alerts.dart';
import 'package:weather_flutter/model/weather_astro.dart';
import 'package:weather_flutter/model/weather_forecast.dart';
import 'package:weather_flutter/services/http_requests.dart';
import 'package:weather_flutter/services/location_helper.dart';
import 'package:weather_flutter/utility/custom_ui_core.dart';
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

  String retryDetail = 'But don\' worry... We are trying again';
  bool connectionFailed = false;
  int retryCnt = 0;

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
      } else if (retryCnt < 3) {
        connectionFailed = true;
        setState(() {});
        warningPrint("Data Fetching Failed | Trying again Fetching Data");
        retryCnt++;

        process();
      } else {
        setState(() {
          retryDetail =
              'We are sorry, looks like something went wrong. Please check your internet connection and try again later.';
        });

        return;
      }
    } else {
      setState(() {
        retryDetail = 'Looks like something went wrong. Please check your location permissions and try again later.';
      });

      return;
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
    super.initState();

    process();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (connectionFailed) Text('Connection Failed', style: kFontSizeTitle.copyWith(fontWeight: .w300)),

            Lottie.asset('lib/assets/loading_animations/Summer-Vibes.json'),

            if (connectionFailed)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  retryDetail,
                  style: kFontSizeSubHeadline.copyWith(fontWeight: .w300),
                  textAlign: .center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
