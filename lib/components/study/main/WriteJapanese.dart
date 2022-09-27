import 'package:englister/components/publicAnswers/PublicJapaneseList.dart';
import 'package:englister/components/signin/SigninDialog.dart';
import 'package:englister/components/study/main/MyCountDownTimer.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final isStart = useState<bool>(false);

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
        Stack(alignment: AlignmentDirectional.center, children: [
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
          isStart.value
              ? Container()
              : Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 400,
                    height: 170,
                    color: Colors.blue,
                  ),
                ),
          isStart.value
              ? Container()
              : Positioned(
                  top: 55.0,
                  child: Center(
                    child: Text("あなたの意見を記述してください。",
                        style: Typography.dense2018.bodyLarge),
                  ),
                ),
          isStart.value
              ? Container()
              : Positioned(
                  top: 90.0,
                  child: ElevatedButton(
                    onPressed: () {
                      isStart.value = true;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text('日本語で書く',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
        ]),
        const SizedBox(
          height: 15,
        ),
        isStart.value
            ? const MyCountdownTimer(
                seconds: 60,
              )
            : Text("残り 01:00:00", style: Typography.dense2018.bodyText2),
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
