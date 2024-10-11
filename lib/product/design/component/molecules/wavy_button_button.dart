import 'package:fatiharge/product/design/component/atoms/painter/wavy_text_painter/wavy_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utility/extension/context_extension.dart';

class WavyButton extends StatelessWidget {
  const WavyButton({
    required this.text,
    required this.onEnter,
    required this.onExit,
    required this.state,
    super.key,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;
  final void Function() onEnter;
  final void Function() onExit;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: TextButton(
        onPressed: onPressed,
        child: SizedBox(
          height: context.iconSize.xLarge,
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0,
              end: state ? 1 : 0,
            ),
            builder: (context, value, child) {
              return WavyAnimatedWidget(
                text,
                waveAnim: value,
              );
            },
            duration:
                Duration(milliseconds: context.baseDuration.medium.toInt()),
          ),
        ),
      ),
    );
  }
}
