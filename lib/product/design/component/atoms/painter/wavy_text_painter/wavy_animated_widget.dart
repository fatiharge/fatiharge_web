import 'package:fatiharge/product/design/component/atoms/painter/wavy_text_painter/wavy_text_painter.dart';
import 'package:flutter/material.dart';

class WavyAnimatedWidget extends StatelessWidget {
  const WavyAnimatedWidget(
    this.text, {
    required this.waveAnim,
    super.key,
    this.textAlign = TextAlign.start,
    this.textStyle,
  });

  final String text;

  final TextAlign textAlign;

  final TextStyle? textStyle;

  final double waveAnim;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: WavyTextPainter(
          progress: waveAnim * (text.length * 0.60),
          text: text,
          textStyle: DefaultTextStyle.of(context).style.merge(textStyle),
        ),
        child: Text(
          text,
          style: DefaultTextStyle.of(context)
              .style
              .merge(textStyle)
              .merge(const TextStyle(color: Colors.transparent)),
        ),
      ),
    );
  }
}
