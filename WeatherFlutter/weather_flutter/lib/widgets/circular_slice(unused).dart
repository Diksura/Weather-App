import 'dart:math';

import 'package:flutter/material.dart';

class FiveSeventhCircle extends StatelessWidget {
  const FiveSeventhCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: FiveSeventhPainter(),
    );
  }
}

class FiveSeventhPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final sweepAngle = 2 * pi * (5 / 7); // 5/7 of full circle

    canvas.drawArc(
      rect,
      -pi / 2, // start from top
      sweepAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}