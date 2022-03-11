import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as Math;

class LeftPlanHearts extends HookConsumerWidget {
  LeftPlanHearts(
      {Key? key,
      required this.hearts,
      required this.maxHearts,
      required this.showText})
      : super(key: key);

  num hearts;
  num maxHearts;
  bool showText;
  String color = "#ff6d75";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (maxHearts == 0) {
      //アプリではFreeプランは表示しない
      return Container();
    }
    if (maxHearts > 10 && showText) {
      return const Text("💕 Unlimited");
    }
    if (maxHearts == 10) {
      var topHearts = Math.min(hearts, 5);
      var bottomHearts = hearts - 5;
      var topHeartIcons = <Widget>[];
      for (var i = 0; i < 5; i++) {
        if (i < topHearts) {
          topHeartIcons.add(Icon(Icons.favorite, color: Colors.pink, size: 16));
        } else {
          topHeartIcons
              .add(Icon(Icons.favorite_border, color: Colors.pink, size: 16));
        }
      }
      var bottomHeartIcons = <Widget>[];
      for (var i = 0; i < 5; i++) {
        if (i < bottomHearts) {
          bottomHeartIcons
              .add(Icon(Icons.favorite, color: Colors.pink, size: 16));
        } else {
          bottomHeartIcons
              .add(Icon(Icons.favorite_border, color: Colors.pink, size: 16));
        }
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: topHeartIcons,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bottomHeartIcons,
          ),
        ],
      );
    }

    var topHeartIcons = <Widget>[];
    for (var i = 0; i < maxHearts; i++) {
      if (i < hearts) {
        topHeartIcons.add(Icon(Icons.favorite, color: Colors.pink, size: 16));
      } else {
        topHeartIcons
            .add(Icon(Icons.favorite_border, color: Colors.pink, size: 16));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: topHeartIcons,
    );
  }
}
