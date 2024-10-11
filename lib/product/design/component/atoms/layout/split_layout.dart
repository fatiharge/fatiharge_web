import 'package:flutter/material.dart';

class SplitLayout extends StatelessWidget {
  const SplitLayout({
    required this.axis,
    required this.firstChild,
    required this.secondChild,
    super.key,
  });

  final Axis axis;
  final Widget firstChild;
  final Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? Row(
            children: [
              Expanded(child: firstChild),
              Expanded(child: secondChild),
            ],
          )
        : Column(
            children: [
              Expanded(child: firstChild),
              Expanded(child: secondChild),
            ],
          );
  }
}
