import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';

class WeatherMainSquareTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const WeatherMainSquareTile({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kBoxBackgroundColour, borderRadius: kOuterBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(title, style: kFontSizeCaption),
            ),

            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: children),
            ),
          ],
        ),
      ),
    );
  }
}
