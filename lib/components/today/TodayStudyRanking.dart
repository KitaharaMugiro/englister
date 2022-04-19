import 'package:englister/api/rest/TodayApi.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:random_avatar/random_avatar.dart';

//TODO 後で実装する
class TodayStudyRanking extends HookConsumerWidget {
  const TodayStudyRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Icon(
            Icons.looks_one,
            size: 60,
            color: Colors.yellow,
          ),
          randomAvatar(
            DateTime.now().toIso8601String(),
            height: 50,
            width: 52,
          ),
        ],
      ),
      Row(
        children: [
          const Icon(
            Icons.looks_two,
            size: 60,
            color: Colors.grey,
          ),
          randomAvatar(
            DateTime.now().toIso8601String(),
            height: 50,
            width: 52,
          ),
        ],
      ),
      Row(
        children: [
          const Icon(
            Icons.looks_3,
            size: 60,
            color: Colors.orange,
          ),
          randomAvatar(
            DateTime.now().toIso8601String(),
            height: 50,
            width: 52,
          ),
        ],
      ),
    ]);
  }
}
