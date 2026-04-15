import 'package:flutter/material.dart';
import 'package:weather_flutter/utility/utility.dart';
import 'package:weather_flutter/utility/weather_image_utility.dart';

import '../model/forecast_day.dart';
import '../utility/custom_ui_core.dart';

class ForecastDayWeatherTile extends StatelessWidget {
  final ForecastDay forecastDay;
  final String date;

  const ForecastDayWeatherTile({super.key, required this.forecastDay, required this.date});

  @override
  Widget build(BuildContext context) {

    String dateString = Utility().formatDateString(date);

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
                      child: Text(dateString, style: kFontSizeCaption),
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
                  Image.asset("lib/assets/weather_icons/${getWeatherImageType(forecastDay.condition.code).asset}.png", scale: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Text("${forecastDay.dailyChanceOfRain}%", style: kFontSizeCaption.copyWith(color: Colors.blue)),
                      Spacer(),
                      Text("|", style: kFontSizeCaption),
                      Spacer(),
                      Text("${forecastDay.dailyChanceOfSnow}%", style: kFontSizeCaption),
                      Spacer(),
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
