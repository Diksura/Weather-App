import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';
import '../widgets/weather_main_tile.dart';
import '../widgets/weather_tile_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

                        ForecastDayWeatherTile(date: '', maxTemp: 30.0, windSpeed: 30.0, minTemp: 30.0, visibility: 30.0, dailyChanceOfRain: 30, dailyChanceOfSnow: 30, avgTemp: 30.0,),
                        ForecastDayWeatherTile(date: '', maxTemp: 30.0, windSpeed: 30.0, minTemp: 30.0, visibility: 30.0, dailyChanceOfRain: 30, dailyChanceOfSnow: 30, avgTemp: 30.0,),
                        ForecastDayWeatherTile(date: '', maxTemp: 30.0, windSpeed: 30.0, minTemp: 30.0, visibility: 30.0, dailyChanceOfRain: 30, dailyChanceOfSnow: 30, avgTemp: 30.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            WeatherTileGrid(
              delegateChildren: [

                WeatherMainTile(
                  title: 'Wind Details',
                  children: [],
                ),

                WeatherMainTile(
                  title: 'Humidity Details',
                  children: [],
                ),

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

  final String date;
  final double maxTemp;
  final double windSpeed;
  final double minTemp;
  final double visibility;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final double avgTemp;

  const ForecastDayWeatherTile({
    super.key, required this.date, required this.maxTemp, required this.windSpeed, required this.minTemp, required this.visibility, required this.dailyChanceOfRain, required this.dailyChanceOfSnow, required this.avgTemp,
  });

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
                      child: Text(date, style: kFontSizeCaption),
                    ),

                    Text("Temperature", style: kFontSizeSubHeadline),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Text("Max : ${maxTemp}°", style: kFontSizeCaption),

                          Spacer(),

                          Text("Min : ${minTemp}°", style: kFontSizeCaption),
                        ],
                      ),
                    ),

                    Divider(),

                    Text("Wind Speed: ${windSpeed}", style: kFontSizeSubHeadline),

                    Divider(),

                    Text("Visibility: ${visibility}", style: kFontSizeSubHeadline),
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
                      Text("${dailyChanceOfRain}%", style: kFontSizeCaption.copyWith(color: Colors.blue)),
                      Text("|", style: kFontSizeCaption),
                      Text("${dailyChanceOfSnow}%", style: kFontSizeCaption),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${avgTemp}",
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



