import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'FlashCardLabel.dart';

class FlashCardOverlay extends StatelessWidget {
  const FlashCardOverlay({
    required this.direction,
    required this.swipeProgress,
    Key? key,
  }) : super(key: key);
  final SwipeDirection direction;
  final double swipeProgress;

  @override
  Widget build(BuildContext context) {
    final opacity = math.min<double>(swipeProgress, 1);

    final isRight = direction == SwipeDirection.right;
    final isLeft = direction == SwipeDirection.left;
    return Stack(
      children: [
        Opacity(
          opacity: isRight ? opacity : 0,
          child: FlashCardLabel.right(),
        ),
        Opacity(
          opacity: isLeft ? opacity : 0,
          child: FlashCardLabel.left(),
        ),
      ],
    );
  }
}
