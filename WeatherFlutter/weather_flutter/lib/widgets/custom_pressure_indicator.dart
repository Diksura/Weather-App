import 'dart:math';

import 'package:flutter/material.dart';

import '../utility/custom_ui_core.dart';

class CustomPressureIndicator extends StatelessWidget {
  final double pressure;

  const CustomPressureIndicator({super.key, required this.pressure});

  double meterValue(double pressureMb) {
    const minPressure = 850.0;
    const maxPressure = 1100.0;
    const minCode = 0.0;
    const maxCode = 0.7;

    return (pressureMb - minPressure) * (maxCode - minCode) / (maxPressure - minPressure) + minCode;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(size: Size(120, 120), painter: PressureGaugePainter(meterValue(pressure))),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(pressure.toStringAsFixed(0), style: kFontSizeTitle),
            SizedBox(height: 2),
            Text('hPa', style: kFontSizeHeadCaption),
            SizedBox(height: 16.0),
          ],
        ),
      ],
    );
  }
}

class PressureGaugePainter extends CustomPainter {
  final double value;

  PressureGaugePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.0;

    final rect = Rect.fromLTWH(strokeWidth, strokeWidth, size.width - strokeWidth * 2, size.height - strokeWidth * 2);

    final startAngle = 145 * pi / 180;
    const totalSweep = 0.7 * 2 * pi;

    final backgroundPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, totalSweep, false, backgroundPaint);

    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + totalSweep,
      colors: [Colors.blue.withValues(alpha: 0.7), Colors.purple.withValues(alpha: 0.7)],
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, totalSweep * value, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}