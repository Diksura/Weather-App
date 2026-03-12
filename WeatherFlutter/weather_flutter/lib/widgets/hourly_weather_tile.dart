import 'package:flutter/material.dart';

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
            Text(hour.time, style: kFontSizeCaption),

            Image.asset("lib/assets/weather_icons/1.png", scale: 12),

            if (hour.precipIn > 0) Text("${hour.precipIn}", style: kFontSizeCaption2),

            Text("${hour.tempC}°", style: kFontSizeSubHeadline),
          ],
        ),
      ),
    );
  }
}
