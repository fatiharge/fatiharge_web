import 'package:flutter/material.dart';
import 'package:uikit/utility/constant/padding/extension/padding_extension.dart';
import 'package:uikit/utility/extension/context_extension.dart';

class HoverableCardWidget extends StatelessWidget {
  const HoverableCardWidget({
    required this.onEnter,
    required this.onExit,
    required this.state,
    required this.title,
    required this.description,
    required this.color,
    required this.onColor,
    required this.iconData,
    super.key,
  });

  final void Function() onEnter;
  final void Function() onExit;
  final bool state;
  final String title;
  final String description;
  final Color color;
  final Color onColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: AnimatedContainer(
        duration: Durations.medium2,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: state ? color : onColor,
          borderRadius: BorderRadius.circular(context.baseRadius.large),
        ),
        padding: context.itemPadding.xLarge.paddingAll,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Icon(
                iconData,
                size: context.iconSize.xLarge,
                color: state ? onColor : color,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.arrow_right_alt,
                color: state ? onColor : color,
              ),
            ),
            AnimatedPositioned(
              duration: Durations.medium2,
              bottom: state ? context.cardSize.large : 0,
              left: 0,
              right: 0,
              child: Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: state ? onColor : color,
                ),
              ),
            ),
            if (state)
              AnimatedPositioned(
                duration: Durations.medium2,
                bottom: 10,
                left: 0,
                right: 0,
                child: Text(
                  description,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HoverableCardModel {
  HoverableCardModel({
    required this.titleKey,
    required this.descriptionKey,
    required this.color,
    required this.onColor,
    required this.iconData,
  });

  final String titleKey;
  final String descriptionKey;
  final Color color;
  final Color onColor;
  final IconData iconData;
}
