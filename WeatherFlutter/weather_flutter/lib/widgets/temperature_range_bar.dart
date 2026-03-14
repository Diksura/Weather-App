import 'package:flutter/material.dart';

class TemperatureRangeBar extends StatelessWidget {
  final double uvValue;

  const TemperatureRangeBar({super.key, required this.uvValue});

  final int minRange = 0;
  final int maxRange = 11;


  @override
  Widget build(BuildContext context) {
    /// Normalizes a UV index value into a position between 0.0 and 1.0.
    ///
    /// The UV index range used here is assumed to be **0–11**, which covers
    /// the standard UV scale where values above 11 are considered extreme.
    ///
    /// Formula:
    /// (value - min) / (max - min)
    ///
    /// In this case:
    /// min = 0
    /// max = 11
    ///
    /// This converts the UV index into a proportional value suitable for
    /// UI elements such as progress indicators, sliders, or gradient bars.
    ///
    /// The result is clamped between **0.0 and 1.0** to ensure the value
    /// stays within valid UI bounds even if the UV index exceeds the
    /// expected range (e.g., 12+).
    double position = ((uvValue - minRange) / (maxRange - minRange)).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient Bar
        LayoutBuilder(
          builder: (context, constraints) {
            double barWidth = constraints.maxWidth;
            double indicatorLeft = position * barWidth;

            return Stack(
              clipBehavior: .none,
              children: [
                // Gradient line
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff2ec7ff),
                          Color(0xff3ddc84),
                          Color(0xffffc107),
                          Color(0xffff5722),],
                      ),
                    ),
                  ),
                ),

                // Indicator
                Positioned(
                  top: 5,
                  left: indicatorLeft - 6,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.grey.withValues(alpha: 0.8), width: 2)),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // Min / Max labels
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Min"), Text("Max")]),
      ],
    );
  }
}
