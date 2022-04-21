import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class TodayStudyRankingItem extends StatelessWidget {
  TodayStudyRankingItem({
    Key? key,
    required this.index,
    required this.age,
    required this.name,
  }) : super(key: key);
  num index;
  num age;
  String name;

  Widget renderRandomAvatar() {
    return randomAvatar(
      DateTime.now().toIso8601String(),
      height: 50,
      width: 52,
    );
  }

  List<Icon> rankIcons = [
    const Icon(
      Icons.looks_one,
      size: 60,
      color: Colors.yellow,
    ),
    const Icon(
      Icons.looks_two,
      size: 60,
      color: Colors.grey,
    ),
    const Icon(
      Icons.looks_3,
      size: 60,
      color: Colors.orange,
    ),
  ];

  Widget renderLeftItem() {
    if (index < 3) {
      return Row(
        children: [
          rankIcons[index.toInt()],
          renderRandomAvatar(),
          const SizedBox(
            width: 10,
          ),
          Text('$nameさん', style: Typography.dense2018.bodyText1),
        ],
      );
    }
    return Row(
      children: [
        const SizedBox(
          width: 60,
          height: 60,
        ),
        renderRandomAvatar(),
        const SizedBox(
          width: 10,
        ),
        Text('$nameさん', style: Typography.dense2018.bodyText1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        renderLeftItem(),
        Text('${age.toString()}歳相当', style: Typography.dense2018.bodyText1)
      ],
    );
  }
}
