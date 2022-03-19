import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayStudyTop extends HookConsumerWidget {
  TodayStudyTop({Key? key, String? this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameNotifier = ref.watch(nameProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('お名前を入力してください',
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        const SizedBox(
          height: 15,
        ),
        TextField(
          maxLines: 1,
          onChanged: (value) {
            nameNotifier.set(value);
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'お名前を入力してください',
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
