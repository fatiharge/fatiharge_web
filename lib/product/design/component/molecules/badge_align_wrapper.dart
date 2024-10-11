import 'package:fatiharge/product/design/component/atoms/badge/card_paper_badge.dart';
import 'package:flutter/material.dart';

class BadgeAlignWrapper extends StatelessWidget {
  const BadgeAlignWrapper({
    required this.child,
    required this.cardPaperBadge,
    super.key,
  });

  final Widget child;
  final CardPaperBadge? cardPaperBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: child,
        ),
        if (cardPaperBadge != null)
          Align(
            alignment: cardPaperBadge!.alignment,
            child: cardPaperBadge,
          ),
      ],
    );
  }
}
