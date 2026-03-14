import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';

class WeatherMainRectangleTile extends StatelessWidget {
  final String title;
  final List<Widget> extendedChildren;

  const WeatherMainRectangleTile({super.key, required this.title, required this.extendedChildren});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: kBoxBackgroundColour, borderRadius: kOuterBorderRadius),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: kFontSizeCaption),

                Divider(),

                /// Since already in a List<Widget> we are extending the list into individual widgets using
                /// the spread operator.
                /// So Flutter receives:
                ///       [
                ///         Text(),
                ///         Divider(),
                ///         Widget1,
                ///         Widget2,
                ///         Widget3
                ///      ]
                ...extendedChildren,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
