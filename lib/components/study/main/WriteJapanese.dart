import 'package:englister/components/publicAnswers/PublicJapaneseList.dart';
import 'package:englister/components/signin/SigninDialog.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/riverpod/UserRiverpod.dart';

class WriteJapanese extends HookConsumerWidget {
  WriteJapanese({Key? key, this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    var user = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle,
          ),
          child: Container(
            child: const Text("Q",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        Text(studyState.activeQuestion.title,
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        Text(studyState.activeQuestion.description,
            style: Typography.dense2018.bodyText2),
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
              labelText: '日本語で意見を書いてください',
              alignLabelWithHint: true,
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
        user.sub == null
            ? TextButton(
                onPressed: () async {
                  //TODO ログインしなくても見られるようにしたい
                  await openSigninDialog(context);
                },
                child: const Text("ログインすると他の人の意見が見られるよ"))
            : PublicJapaneseList(
                topicId: int.parse(studyState.activeQuestion.topicId),
              ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
