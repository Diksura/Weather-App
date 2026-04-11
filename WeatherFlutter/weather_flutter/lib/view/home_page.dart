import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_flutter/model/current_weather.dart';
import 'package:weather_flutter/model/forecast_hour.dart';
import 'package:weather_flutter/utility/weather_image_utility.dart';
import 'package:weather_flutter/widgets/forecast_day_weather_tile.dart';

import '../model/astro.dart';
import '../model/forecast.dart';
import '../model/location.dart';
import '../model/weather.dart';
import '../model/weather_alerts.dart';
import '../model/weather_astro.dart';
import '../model/weather_forecast.dart';
import '../utility/cloud_coverage_helper.dart';
import '../utility/custom_ui_core.dart';
import '../utility/precipitation_helper.dart';
import '../widgets/air_details.dart';
import '../widgets/custom_pressure_indicator.dart';
import '../widgets/custom_wind_tile_content.dart';
import '../widgets/icon_value_description_tile.dart';
import '../widgets/weather_left_details_rectangle_tile.dart';
import '../widgets/hourly_weather_tile.dart';
import '../widgets/temperature_range_bar.dart';
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
    required this.location,
  });

  final Location location;
  final Weather currentWeather;
  final WeatherForecast forecastWeather;
  final WeatherAstro weatherAstro;
  final WeatherAlerts weatherAlerts;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// populating the list using upcoming hourly weather
  List<ForecastHour> hourlyData = List.empty(growable: true);

  /// Count of next hours data that viewed in hourly forecast [ForecastDayWeatherTile].
  /// This will determine how many tiles of [ForecastDayWeatherTile] will be viewed.
  int? showingForecastHoursCnt = 24;

  void processHourlyData() {
    final now = DateTime.now();

    hourlyData = widget.forecastWeather.forecast.forecastday
        .expand((day) => day.hour) // flatten all days into one list
        .where((hour) {
          final hourTime = DateTime.parse(hour.time);
          return hourTime.isAfter(now);
        })
        .toList();
  }

  @override
  void initState() {
    processHourlyData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List<Forecast> forecastDay = widget.forecastWeather.forecast.forecastday;

    final Location location = widget.currentWeather.location;
    final CurrentWeather current = widget.currentWeather.current;
    final Astro astro = widget.weatherAstro.astronomy.astro;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          child: Icon(CupertinoIcons.exclamationmark_triangle, size: 32, color: Colors.red),
                        ),

                      Spacer(flex: 3),

                      Column(
                        children: [
                          Image.asset(
                            "lib/assets/weather_icons/${getWeatherImageType(current.condition.code).asset}.png",
                            scale: 1.7,
                          ),

                          Text("${current.tempC.round()}°C", style: TextStyle(fontSize: 102, color: Colors.black)),

                          Text(widget.location.name, style: kFontSizeTitle, textAlign: .center),

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
                      itemCount: showingForecastHoursCnt ?? hourlyData.length,
                      itemBuilder: (context, index) {
                        return HourlyWeatherTile(hour: hourlyData[index]);
                      },
                    ),
                  ),
                ),
              ),

              // Forecast Days
              WeatherMainRectangleTile(
                title: "Forecasting Days",
                extendedChildren: [
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: forecastDay.length,
                      itemBuilder: (context, index) {
                        return ForecastDayWeatherTile(
                          forecastDay: forecastDay[index].day,
                          date: forecastDay[index].date,
                        );
                      },
                    ),
                  ),
                ],
              ),

              WeatherTileGrid(
                delegateChildren: [
                  WeatherMainSquareTile(
                    title: 'Wind Details',
                    children: [
                      CustomWindTileContent(
                        direction: current.windDir,
                        speed: current.windKph,
                        windDegree: current.windDegree,
                      ),
                    ],
                  ),

                  WeatherMainSquareTile(
                    title: 'Humidity Details',
                    children: [
                      SvgPicture.asset(
                        "lib/assets/apple_icons/humidity.svg",
                        height: 40,
                        colorFilter: ColorFilter.mode(Colors.grey.withValues(alpha: 0.8), BlendMode.srcIn),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: .alphabetic,
                        children: [
                          Text("${current.humidity}", style: kFontSizeTitle.copyWith(fontSize: 50)),
                          Text("%", style: kFontSizeTitle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              WeatherMainRectangleTile(
                title: "Feels Like, Wind Chills Details",
                extendedChildren: [
                  WeatherLeftDetailsRectangleTile(
                    current: current,
                    icon: SvgPicture.asset("lib/assets/apple_icons/thermometer_sun.svg", height: 54),
                    children: [
                      WeatherLeftDetailsRectangleTextRow(
                        contentText: "${current.feelslikeC.round()} °C",
                        description: "Feels Like",
                      ),

                      Divider(),

                      WeatherLeftDetailsRectangleTextRow(
                        contentText: "${current.windchillC.round()} °C",
                        description: 'Wind Chill',
                      ),

                      Divider(),

                      WeatherLeftDetailsRectangleTextRow(
                        contentText: "${current.heatindexC.round()} °C",
                        description: 'Heat Index',
                      ),
                    ],
                  ),
                ],
              ),

              WeatherTileGrid(
                delegateChildren: [
                  WeatherMainSquareTile(
                    title: 'Precipitation',
                    children: [
                      IconValueDescriptionTile(
                        icon: SvgPicture.asset("lib/assets/apple_icons/cloud_sun_rain.svg", height: 28),
                        measureType: 'mm',
                        value: precipitationValue(current.precipMm),
                        description: precipitationMessage(current.precipMm),
                      ),
                    ],
                  ),

                  WeatherMainSquareTile(
                    padding: EdgeInsets.all(16.0).copyWith(bottom: 0.0),
                    title: 'Pressure Details',
                    children: [FittedBox(child: CustomPressureIndicator(pressure: current.pressureMb))],
                  ),

                  WeatherMainSquareTile(
                    title: 'UV Details',
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          SvgPicture.asset("lib/assets/apple_icons/sun_min.svg", height: 48),

                          Text("${current.uv.round()}", style: kFontSizeTitle.copyWith(fontSize: 52)),
                        ],
                      ),

                      TemperatureRangeBar(uvValue: current.uv),
                    ],
                  ),

                  WeatherMainSquareTile(
                    title: 'Visibility',
                    children: [
                      Spacer(),
                      SvgPicture.asset("lib/assets/apple_icons/vision_pro.svg", height: 32),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Column(
                                children: [
                                  Text("${current.visKm.round()}", style: kFontSizeLargeTitle),
                                  Text("km", style: kFontSizeSubHeadline),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                                child: VerticalDivider(),
                              ),

                              Column(
                                children: [
                                  Text("${current.visMiles.round()}", style: kFontSizeLargeTitle),
                                  Text("mi", style: kFontSizeSubHeadline),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              WeatherMainRectangleTile(
                title: "Moon Details",
                extendedChildren: [
                  WeatherLeftDetailsRectangleTile(
                    current: current,
                    icon: Image.asset("lib/assets/weather_icons/Full-Moon.png"),
                    iconPaddingLeft: 4,
                    containerPaddingRight: 0,
                    flex: 2,
                    children: [
                      WeatherLeftDetailsRectangleTextRow(
                        description: "Phase",
                        contentText: astro.moonPhase,
                        fontStyle: kFontSizeCaption,
                      ),

                      Divider(),

                      WeatherLeftDetailsRectangleTextRow(
                        description: 'Illumination',
                        contentText: "${astro.moonIllumination}",
                        fontStyle: kFontSizeCaption,
                      ),

                      Divider(),

                      WeatherLeftDetailsRectangleTextRow(
                        description: 'Moon-Rise',
                        contentText: astro.moonrise,
                        fontStyle: kFontSizeCaption,
                      ),

                      Divider(),

                      WeatherLeftDetailsRectangleTextRow(
                        description: 'Moon-Set',
                        contentText: astro.moonset,
                        fontStyle: kFontSizeCaption,
                      ),
                    ],
                  ),
                ],
              ),

              WeatherTileGrid(
                delegateChildren: [
                  WeatherMainSquareTile(
                    title: 'Cloud Cover',
                    children: [
                      IconValueDescriptionTile(
                        icon: Icon(CupertinoIcons.cloud_fill, size: 32, color: Colors.blue.shade200),
                        measureType: '%',
                        value: current.cloud.toString(),
                        description: cloudCoverMessage(current.cloud),
                        descriptionTextStyle: kFontSizeCaption2,
                        iconPositionLeft: 60,
                      ),
                    ],
                  ),

                  WeatherMainSquareTile(
                    title: 'Sun Behaviour',
                    children: [
                      Spacer(flex: 2),

                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset("lib/assets/apple_icons/sunrise.svg", height: 36),

                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Sunrise", style: kFontSizeCaption),
                                ),

                                Text(astro.sunrise, style: kFontSizeCaption),
                              ],
                            ),

                            Expanded(child: VerticalDivider()),

                            Column(
                              children: [
                                SvgPicture.asset("lib/assets/apple_icons/sunset.svg", height: 36),

                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Sunset", style: kFontSizeCaption),
                                ),

                                Text(astro.sunset, style: kFontSizeCaption),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                    ],
                  ),
                ],
              ),

              AirDetails(current: current),
            ],
          ),
        ),
      ),
    );
  }
}
