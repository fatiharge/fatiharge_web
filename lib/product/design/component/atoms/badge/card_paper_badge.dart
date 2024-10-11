import 'package:flutter/material.dart';

class CardPaperBadge extends StatelessWidget {
  const CardPaperBadge({
    required this.widget,
    required this.cardHeight,
    required this.cardRadius,
    required this.cardColor,

    required this.backgroundColor,
    required this.alignment,
    super.key,
  });

  final Widget widget;
  final double cardHeight;
  final BorderRadiusGeometry cardRadius;
  final Color cardColor;
  final Color backgroundColor;

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight * 2,
      width: cardHeight * 2,
      child: Stack(
        children: [
          _buildColoredContainer(
            alignment: Alignment(alignment.x, 0),
            height: cardHeight,
            width: cardHeight / 2,
            color: cardColor,
          ),
          _buildColoredContainer(
            alignment: Alignment(0, alignment.y),
            height: cardHeight / 2,
            width: cardHeight,
            color: cardColor,
          ),
          _buildDecoratedContainer(
            alignment: Alignment(alignment.x * -1, alignment.y),
          ),
          _buildDecoratedContainer(
            alignment: Alignment(alignment.x, alignment.y * -1),
          ),
          _buildCenterContainer(context),
        ],
      ),
    );
  }

  Widget _buildColoredContainer({
    required Alignment alignment,
    required double height,
    required double width,
    required Color color,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }

  Widget _buildDecoratedContainer({
    required Alignment alignment,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        height: cardHeight,
        width: cardHeight,
        decoration: BoxDecoration(
          borderRadius: cardRadius,
          color: backgroundColor,
        ),
      ),
    );
  }

  Widget _buildCenterContainer(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: cardHeight,
        width: cardHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: cardRadius,
          color: cardColor,
        ),
        child: widget,
      ),
    );
  }
}
