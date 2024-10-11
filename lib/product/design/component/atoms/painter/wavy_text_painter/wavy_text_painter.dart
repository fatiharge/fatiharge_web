import 'dart:math' as math;

import 'package:flutter/material.dart';

class WavyTextPainter extends CustomPainter {
  WavyTextPainter({
    required this.progress,
    required this.text,
    required this.textStyle,
  });

  final double progress;

  final String text;

  final _textLayoutInfo = <_TextLayoutInfo>[];
  final TextStyle textStyle;

  @override
  void paint(Canvas canvas, Size size) {
    if (_textLayoutInfo.isEmpty) {
      calculateLayoutInfo(text, _textLayoutInfo);
    }
    canvas.save();

    for (final textLayout in _textLayoutInfo) {
      final centerOffset =
          Offset(size.width / 2, size.height / 2 - textLayout.height / 2);

      if (textLayout.isMoving) {
        final p = math.min(progress * 2, 1);
        drawText(
          canvas,
          textLayout.text,
          Offset(
                textLayout.offsetX,
                textLayout.offsetY -
                    (textLayout.offsetY - textLayout.riseHeight) * p,
              ) +
              centerOffset,
          textLayout,
        );
      } else {
        drawText(
          canvas,
          textLayout.text,
          Offset(textLayout.offsetX, textLayout.offsetY) + centerOffset,
          textLayout,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(WavyTextPainter oldDelegate) {
    if (oldDelegate.progress != progress) {
      calculateLayoutInfo(text, _textLayoutInfo);
      calculateMove();
      return true;
    }
    return false;
  }

  void calculateMove() {
    final height = _textLayoutInfo[0].height;
    final txtInMoInd = progress.floor();
    final percent = progress - txtInMoInd;
    final txtInMoOdd = (progress - .5).floor();
    final txtInMoEven = txtInMoInd * 2;

    if (txtInMoOdd < (text.length - 1) / 2 && !txtInMoOdd.isNegative) {
      _textLayoutInfo[txtInMoOdd + (txtInMoOdd + 1)].isMoving = true;
      _textLayoutInfo[txtInMoOdd + (txtInMoOdd + 1)].riseHeight = progress < .5
          ? 0
          : -0.5 * height * math.sin((progress - .5) * math.pi).abs();
    }

    if (txtInMoEven < text.length) {
      _textLayoutInfo[txtInMoEven].isMoving = true;
      _textLayoutInfo[txtInMoEven].riseHeight =
          -0.5 * height * math.sin(percent * math.pi);
    }
  }

  void drawText(
    Canvas canvas,
    String text,
    Offset offset,
    _TextLayoutInfo textLayoutInfo,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        offset.dx - textLayoutInfo.width / 2,
        offset.dy + (textLayoutInfo.height - textPainter.height) / 2,
      ),
    );
  }

  void calculateLayoutInfo(String text, List<_TextLayoutInfo> list) {
    list.clear();

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    for (var i = 0; i < text.length; i++) {
      final forCaret = textPainter.getOffsetForCaret(
        TextPosition(offset: i),
        Rect.zero,
      );
      final offsetX = forCaret.dx;
      if (i > 0 && offsetX == 0) {
        break;
      }

      final textLayoutInfo = _TextLayoutInfo(
        text: text[i],
        offsetX: offsetX,
        offsetY: forCaret.dy,
        width: textPainter.width,
        height: textPainter.height,
        baseline: textPainter
            .computeDistanceToActualBaseline(TextBaseline.ideographic),
      );

      list.add(textLayoutInfo);
    }
  }
}

class _TextLayoutInfo {
  _TextLayoutInfo({
    required this.text,
    required this.offsetX,
    required this.offsetY,
    required this.width,
    required this.height,
    required this.baseline,
  });

  final String text;
  final double offsetX;
  final double offsetY;
  final double width;
  final double height;
  final double baseline;
  late double riseHeight;
  bool isMoving = false;
}
