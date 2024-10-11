import 'package:flutter/material.dart';
import 'package:uikit/utility/extension/context_extension.dart';
import 'package:uikit/utility/extension/spacer_extension.dart';

class HoverableIconButton extends StatelessWidget {
  const HoverableIconButton({
    required this.text,
    required this.secondText,
    required this.iconData,
    required this.secondIconData,
    required this.color,
    required this.secondColor,
    required this.onEnter,
    required this.onExit,
    required this.state,
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;
  final String text;
  final String secondText;
  final IconData iconData;
  final IconData secondIconData;
  final Color color;
  final Color secondColor;
  final void Function() onEnter;
  final void Function() onExit;

  final bool state;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: ElevatedButton(
        onPressed: onPressed,
        iconAlignment: IconAlignment.end,
        child: Row(
          children: [
            SizedBox(
              width: context.cardSize.large, //no bug its feature :)
              child: AnimatedCrossFade(
                firstChild: Text(text),
                secondChild: Text(secondText),
                crossFadeState: state
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(
                  milliseconds: context.baseDuration.xSmall.toInt(),
                ),
              ),
            ),
            context.itemPadding.medium.spacerHorizontal,
            Container(
              width: context.iconSize.large,
              height: context.iconSize.xLarge,
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: Duration(
                  milliseconds: context.baseDuration.xSmall.toInt(),
                ),
                child: CircleAvatar(
                  backgroundColor: context.colorScheme.primary,
                  radius:
                      state ? context.iconSize.medium : context.iconSize.xSmall,
                  child: Icon(
                    color: state ? color : secondColor,
                    state ? iconData : secondIconData,
                    size: state
                        ? context.iconSize.medium
                        : context.iconSize.xSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
