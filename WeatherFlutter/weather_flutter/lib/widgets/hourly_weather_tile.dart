import 'package:flutter/material.dart';
import 'package:weather_flutter/utility/weather_image_utility.dart';
import 'package:weather_flutter/utility/utility.dart';

import '../model/forecast_hour.dart';
import '../utility/custom_ui_core.dart';

class HourlyWeatherTile extends StatelessWidget {
  const HourlyWeatherTile({
    super.key,
    required this.hour,
  });

  final ForecastHour hour;

  @override
  Widget build(BuildContext context) {
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
            Text(Utility().formatTimeToHours(hour.time), style: kFontSizeCaption),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Image.asset("lib/assets/weather_icons/${getWeatherImageType(hour.condition.code).asset}.png", scale: 12),
            ),

            if (hour.precipIn > 0) Text("${hour.precipIn}", style: kFontSizeCaption2),

            Text("${hour.tempC.round()}°", style: kFontSizeSubHeadline),
          ],
        ),
      ),
    );
  }
}
