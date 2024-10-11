import 'package:flutter/material.dart';
import 'package:uikit/utility/constant/padding/extension/padding_extension.dart';
import 'package:uikit/utility/extension/context_extension.dart';
import 'package:uikit/utility/extension/spacer_extension.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.title,
    required this.text,
    required this.iconData,
    required this.boxColor,
    required this.textColor,
    required this.isBigState,
    super.key,
  });

  final String title;
  final String text;
  final IconData iconData;
  final Color boxColor;
  final Color textColor;
  final bool isBigState;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: boxColor,
      child: Padding(
        padding: isBigState
            ? context.itemPadding.xLarge.paddingAll
            : context.itemPadding.small.paddingAll,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                iconData,
                color: textColor,
                size: isBigState
                    ? context.iconSize.xLarge
                    : context.iconSize.medium,
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                  context.itemPadding.medium.spacer,
                  Text(
                    text,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
