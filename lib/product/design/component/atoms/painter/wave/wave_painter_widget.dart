import 'package:fatiharge/product/design/component/atoms/painter/wave/wave_painter.dart';
import 'package:flutter/material.dart';

class WavePainterWidget extends StatefulWidget {
  const WavePainterWidget({
    required this.waveHeight,
    required this.waveColor,
    required this.duration,
    super.key,
  });

  final double waveHeight;

  final Color waveColor;
  final Duration duration;

  @override
  _WavePainterWidgetState createState() => _WavePainterWidgetState();
}

class _WavePainterWidgetState extends State<WavePainterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WavePainter(
            _controller.value,
            context,
            widget.waveColor,
            widget.waveHeight,
          ),
        );
      },
    );
  }
}
