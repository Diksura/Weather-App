
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/utility/air_quality_helper.dart';
import 'package:weather_flutter/widgets/weather_left_details_rectangle_tile.dart';
import 'package:weather_flutter/widgets/weather_main_rectangle_tile.dart';

import '../model/current_weather.dart';
import '../utility/custom_ui_core.dart';

class AirDetails extends StatelessWidget {
  const AirDetails({
    super.key,
    required this.current,
  });

  final CurrentWeather current;

  @override
  Widget build(BuildContext context) {

    var airQualityDetails = airQualityBand(current.airQuality.gbDefraIndex.round(), true);

    return WeatherMainRectangleTile(
      title: "Air Details",
      extendedChildren: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(current.airQuality.gbDefraIndex.round().toString(), style: TextStyle(fontSize: 68)),
                    Text("GB-DEFRA", style: kFontSizeCaption2),
                  ],
                ),

                Text('${airQualityDetails.range} µgm\u{207B}\u{00B3}', style: kFontSizeCaption),
              ],
            ),

            Text(airQualityDetails.band, style: kFontSizeSubTitle.copyWith(color: airQualityDetails.color)),

            Padding(padding: const EdgeInsets.only(right: 12.0), child: Icon(CupertinoIcons.wind, size: 42)),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
          child: Text("Air Index", style: kFontSizeSubTitle2.copyWith(fontWeight: .bold)),
        ),

        Column(
          children: [
            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'Carbon Monoxide (CO)',
              contentText: '${current.airQuality.co} µgm\u{207B}\u{00B3}',
            ),

            Divider(),

            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'Ozone (O\u2083)',
              contentText: '${current.airQuality.o3} µgm\u{207B}\u{00B3}',
            ),

            Divider(),

            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'Nitrogen Dioxide (NO\u2082)',
              contentText: '${current.airQuality.no2} µgm\u{207B}\u{00B3}',
            ),

            Divider(),

            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'Sulfur Dioxide (SO\u2082)',
              contentText: '${current.airQuality.so2} µgm\u{207B}\u{00B3}',
            ),

            Divider(),

            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'PM2.5 (PM\u2082.\u2085)',
              contentText: '${current.airQuality.pm2_5} µgm\u{207B}\u{00B3}',
            ),

            Divider(),

            WeatherLeftDetailsRectangleTextRow(
              fontStyle: kFontSizeHeadCaption,
              description: 'PM10 (PM\u2081\u2080)',
              contentText: '${current.airQuality.pm10} µgm\u{207B}\u{00B3}',
            ),

          ],
        ),

        SizedBox(height: 12,),

      ],

    );
  }
}
