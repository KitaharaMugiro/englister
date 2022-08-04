import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/riverpod/StudyRiverpod.dart';

class WriteJapaneseDiary extends HookConsumerWidget {
  WriteJapaneseDiary({Key? key, this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("日本語で日記を書く",
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        const SizedBox(
          height: 15,
        ),
        TextField(
          maxLines: 5,
          onChanged: (value) {
            studyNotifier.set(studyState.copyWith(japanese: value));
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: '日本語で日記を書いてください',
              alignLabelWithHint: true,
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
