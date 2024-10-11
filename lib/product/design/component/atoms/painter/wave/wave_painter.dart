import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  WavePainter(
    this.animationValue,
    this.context,
    this.waveColor,
    this.waveHeight,
  );

  final double animationValue;
  final double waveHeight;
  final BuildContext context;
  final Color waveColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill;

    final path = Path();

    final waveSpeed = 2 * pi * animationValue;

    path.moveTo(size.width, size.height - waveHeight);

    for (var i = size.width; i >= 0; i -= 1) {
      final yOffset = sin((i * 0.05) + waveSpeed) * 10;
      path.lineTo(i, size.height - waveHeight + yOffset);
    }

    path
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
