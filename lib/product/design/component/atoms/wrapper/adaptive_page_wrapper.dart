import 'package:flutter/material.dart';
import 'package:uikit/utility/constant/padding/extension/padding_extension.dart';
import 'package:uikit/utility/extension/context_extension.dart';

class AdaptivePageWrapper extends StatelessWidget {
  const AdaptivePageWrapper({
    required this.child,
    super.key,
    this.isPadding = true,
    this.flex = 1,
  });

  final Widget child;
  final bool isPadding;
  final double flex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * flex,
      child: Padding(
        padding:
            isPadding ? context.pagePadding.medium.paddingAll : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
