import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';

class WeatherMainSquareTile extends StatelessWidget {

  final String title;
  final List<Widget> children;

  const WeatherMainSquareTile({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBoxBackgroundColour,
          borderRadius: kOuterBorderRadius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kFontSizeCaption,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
