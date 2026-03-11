import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/model/current_weather.dart';
import 'package:weather_flutter/model/forecast_day.dart';
import 'package:weather_flutter/services/http_requests.dart';

import '../model/weather_alerts.dart';
import '../model/weather_astro.dart';
import '../model/weather_forecast.dart';
import '../utility/custom_ui_core.dart';
import '../widgets/weather_main_tile.dart';
import '../widgets/weather_tile_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.currentWeather,
    required this.forecastWeather,
    required this.weatherAstro,
    required this.weatherAlerts,
  });

  final CurrentWeather currentWeather;
  final WeatherForecast forecastWeather;
  final WeatherAstro weatherAstro;
  final WeatherAlerts weatherAlerts;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    String precipitation = "10%";
    bool alert = true;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Hero Section
            SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                height: screenHeight * .95,
                child: Column(
                  children: [
                    if (alert)
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 8, right: 18),
                        child: Icon(CupertinoIcons.exclamationmark_triangle, size: 32),
                      ),

                    Spacer(flex: 3),

                    Column(
                      children: [
                        Image.asset("lib/assets/weather_icons/1.png", scale: 1.7),

                        Text("88 °C", style: TextStyle(fontSize: 102, color: Colors.black)),

                        Text("Unknown Location", style: kFontSizeTitle),

                        Text("Unknown Weather", style: kFontSizeBody),
                      ],
                    ),

                    Spacer(flex: 3),

                    Column(
                      children: [
                        Icon(CupertinoIcons.arrow_down, size: 18),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                          child: Text("Scroll Down for More", style: kFontSizeCaption2),
                        ),
                      ],
                    ),

                    // Spacer(),
                  ],
                ),
              ),
            ),

            // Hourly Forecast
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // TODO: Get this from the API
                    itemBuilder: (context, index) {
                      return Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(borderRadius: kOuterBorderRadius, color: kBoxBackgroundColour),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("5AM", style: kFontSizeCaption),

                              Image.asset("lib/assets/weather_icons/1.png", scale: 12),

                              if (precipitation != "0%") Text("50%", style: kFontSizeCaption2),

                              Text("23°", style: kFontSizeSubHeadline),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Forecast Days
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: kBoxBackgroundColour, borderRadius: kOuterBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Forecasting Days", style: kFontSizeCaption),

                        Divider(),

                        // TODO
                        // ForecastDayWeatherTile(),
                        // ForecastDayWeatherTile(),
                        // ForecastDayWeatherTile(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            WeatherTileGrid(
              delegateChildren: [
                WeatherMainTile(title: 'Wind Details', children: []),

                WeatherMainTile(title: 'Humidity Details', children: []),
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text("Upcoming hour data", style: TextStyle(fontSize: 22)),
                ),

                Container(height: 300, color: Colors.blue.shade100),

                Container(height: 300, color: Colors.green.shade100),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ForecastDayWeatherTile extends StatelessWidget {
  final ForecastDay forecastDay;

  const ForecastDayWeatherTile({super.key, required this.forecastDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: kBoxBackgroundColour, borderRadius: kInnerBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Details
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(forecastDay.date, style: kFontSizeCaption),
                    ),

                    Text("Temperature", style: kFontSizeSubHeadline),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Text("Max : ${forecastDay.maxtempC}°", style: kFontSizeCaption),

                          Spacer(),

                          Text("Min : ${forecastDay.mintempC}°", style: kFontSizeCaption),
                        ],
                      ),
                    ),

                    Divider(),

                    Text("Wind Speed: ${forecastDay.maxwindKph}", style: kFontSizeSubHeadline),

                    Divider(),

                    Text("Visibility: ${forecastDay.avgvisKm}", style: kFontSizeSubHeadline),
                  ],
                ),
              ),
            ),

            // Image
            Expanded(
              child: Column(
                children: [
                  Image.asset("lib/assets/weather_icons/1.png", scale: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${forecastDay.dailyChanceOfRain}%", style: kFontSizeCaption.copyWith(color: Colors.blue)),
                      Text("|", style: kFontSizeCaption),
                      Text("${forecastDay.dailyChanceOfSnow}%", style: kFontSizeCaption),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${forecastDay.avgtempC}",
                            style: kFontSizeTitle.copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: "°C",
                            style: kFontSizeCaption.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
