import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/model/current_weather.dart';
import 'package:weather_flutter/model/forecast_day.dart';
import 'package:weather_flutter/model/forecast_hour.dart';
import 'package:weather_flutter/services/http_requests.dart';
import 'package:weather_flutter/utility/wether_image_utility.dart';
import 'package:weather_flutter/widgets/forecast_day_weather_tile.dart';

import '../model/forecast.dart';
import '../model/location.dart';
import '../model/weather.dart';
import '../model/weather_alerts.dart';
import '../model/weather_astro.dart';
import '../model/weather_forecast.dart';
import '../utility/custom_ui_core.dart';
import '../widgets/weather_main_rectangle_tile.dart';
import '../widgets/weather_main_square_tile.dart';
import '../widgets/weather_tile_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.currentWeather,
    required this.forecastWeather,
    required this.weatherAstro,
    required this.weatherAlerts,
  });

  final Weather currentWeather;
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

    List<Forecast> forecastDay = widget.forecastWeather.forecast.forecastday;

    final Location location = widget.currentWeather.location;
    final CurrentWeather current = widget.currentWeather.current;

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
                    if (widget.weatherAlerts.alerts.alert.isNotEmpty)
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 8, right: 18),
                        child: Icon(CupertinoIcons.exclamationmark_triangle, size: 32),
                      ),

                    Spacer(flex: 3),

                    Column(
                      children: [
                        Image.asset(
                          "lib/assets/weather_icons/${getWeatherImageType(current.condition.code).asset}.png",
                          scale: 1.7,
                        ),

                        Text("${current.tempC.round()}°C", style: TextStyle(fontSize: 102, color: Colors.black)),

                        Text(location.name, style: kFontSizeTitle, textAlign: .center),

                        // TODO: add data
                        Text(current.condition.text, style: kFontSizeBody, textAlign: .center),
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
                      return Container();
                      // TODO: Hourly Weather Tile
                      // return HourlyWeatherTile(hour: );
                    },
                  ),
                ),
              ),
            ),

            // Forecast Days
            WeatherMainRectangleTile(
              title: "Forecasting Days",
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemCount: forecastDay.length,
                    itemBuilder: (context, index) {
                      return ForecastDayWeatherTile(forecastDay: forecastDay[index].day);
                    },
                  ),
                ),
              ],
            ),

            WeatherTileGrid(
              delegateChildren: [
                WeatherMainSquareTile(title: 'Wind Details', children: []),

                WeatherMainSquareTile(title: 'Humidity Details', children: []),
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
