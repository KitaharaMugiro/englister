import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'colors.dart';

const _labelAngle = math.pi / 2 * 0.2;

class FlashCardLabel extends StatelessWidget {
  const FlashCardLabel._({
    required this.color,
    required this.label,
    required this.angle,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  factory FlashCardLabel.right() {
    return const FlashCardLabel._(
      color: SwipeDirectionColor.right,
      label: '知ってる',
      angle: -_labelAngle,
      alignment: Alignment.topLeft,
    );
  }

  factory FlashCardLabel.left() {
    return const FlashCardLabel._(
      color: SwipeDirectionColor.left,
      label: '知らない',
      angle: _labelAngle,
      alignment: Alignment.topRight,
    );
  }

  final Color color;
  final String label;
  final double angle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        vertical: 36,
        horizontal: 36,
      ),
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 4,
            ),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: color,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
