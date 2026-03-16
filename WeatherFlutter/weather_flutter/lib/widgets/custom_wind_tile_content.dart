import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';

class CustomWindTileContent extends StatelessWidget {
  final String direction;
  final double speed;
  final double windDegree;

  const CustomWindTileContent({super.key, required this.direction, required this.speed, required this.windDegree});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side text
        Column(
          children: [
            Text(direction, style: kFontSizeBody),

            Column(
              children: [
                Text("${speed.round()}", style: kFontSizeLargeTitle.copyWith(fontWeight: FontWeight.w500)),
                Text("km/h", style: kFontSizeCaption),
              ],
            ),
          ],
        ),

        // Compass
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(size: Size(double.infinity, double.infinity), painter: CompassPainter()),

                Transform.rotate(
                  angle: windDegree * pi / 180,
                  child: Icon(CupertinoIcons.location_north_fill, size: 46, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CompassPainter extends CustomPainter {
  final int majorTickCount;
  final int minorTickCount;
  final double majorTickLength;
  final double minorTickLength;

  CompassPainter({
    this.majorTickCount = 12,
    this.minorTickCount = 3,
    this.majorTickLength = 10,
    this.minorTickLength = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 10;

    final majorTickAngle = 2 * pi / majorTickCount;
    final minorTickAngle = majorTickAngle / (minorTickCount + 1);

    for (int i = 0; i < majorTickCount; i++) {
      final angle = i * majorTickAngle;

      final start = Offset(center.dx + radius * cos(angle), center.dy + radius * sin(angle));

      final end = Offset(
        center.dx + (radius + majorTickLength) * cos(angle),
        center.dy + (radius + majorTickLength) * sin(angle),
      );

      canvas.drawLine(start, end, paint);

      for (int j = 1; j <= minorTickCount; j++) {
        final minorAngle = angle + j * minorTickAngle;

        final minorStart = Offset(center.dx + radius * cos(minorAngle), center.dy + radius * sin(minorAngle));

        final minorEnd = Offset(
          center.dx + (radius + minorTickLength) * cos(minorAngle),
          center.dy + (radius + minorTickLength) * sin(minorAngle),
        );

        canvas.drawLine(minorStart, minorEnd, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
