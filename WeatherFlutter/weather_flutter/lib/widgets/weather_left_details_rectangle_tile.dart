import 'package:flutter/material.dart';

import '../model/current_weather.dart';
import '../utility/custom_ui_core.dart';

class WeatherLeftDetailsRectangleTile extends StatelessWidget {
  final CurrentWeather current;
  final Widget icon;
  final int? flex;
  final double? iconPaddingLeft;
  final double? containerPaddingRight;
  final List<Widget> children;

  const WeatherLeftDetailsRectangleTile({super.key, required this.current, required this.icon, required this.children, this.flex, this.iconPaddingLeft, this.containerPaddingRight,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: containerPaddingRight ?? 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Details
          Expanded(
            flex: flex ?? 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(children: children),
            ),
          ),

          // Image
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: iconPaddingLeft ?? 16.0),
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherLeftDetailsRectangleTextRow extends StatelessWidget {
  const WeatherLeftDetailsRectangleTextRow({super.key, required this.description, required this.contentText, this.fontStyle});

  final String description;
  final String contentText;
  final TextStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$description :", style: fontStyle ?? kFontSizeSubHeadline),
          Text(contentText, style: fontStyle ?? kFontSizeSubHeadline,),
        ],
      ),
    );
  }
}
