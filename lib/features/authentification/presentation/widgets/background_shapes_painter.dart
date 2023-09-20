import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade200.withOpacity(.3) // Adjust color as needed.
      ..style = PaintingStyle.fill;

    // Draw a circle representing a camera lens
    canvas
      ..drawCircle(
          Offset(size.width * 0.2, size.height * 0.3), size.width * 0.1, paint)

      // Inner circle for the lens
      ..drawCircle(
          Offset(size.width * 0.2, size.height * 0.3),
          size.width * 0.07,
          Paint()..color = Colors.grey.shade300.withOpacity(.3));

    // Draw a semi-circle representing a shutter part
    final Rect arcRect = Rect.fromCircle(
        center: Offset(size.width * 0.7, size.height * 0.3),
        radius: size.width * 0.2);
    canvas.drawArc(arcRect, -pi / 4, pi / 2, true, paint);

// ... (Other painting operations)

// Drawing a circled camera body
    final cameraDiameter = size.width * 0.24;
    final cameraCenter = Offset(size.width * 0.82,
        size.height * 0.78); // Slightly adjusting position for variation
    canvas.drawCircle(cameraCenter, cameraDiameter / 2, paint);

// Camera lens in the middle of the circled body
    final lensRadius =
        cameraDiameter * 0.36; // A bit larger lens for a modern look
    canvas.drawCircle(
        cameraCenter,
        lensRadius,
        Paint()
          ..color = Colors.grey.shade300
              .withOpacity(.35)); // Slightly adjusted opacity
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
