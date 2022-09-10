import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/riverpod/DiaryModeRiverpod.dart';
import '../../models/riverpod/StudyRiverpod.dart';

class WriteJapaneseDiary extends HookConsumerWidget {
  WriteJapaneseDiary({Key? key, this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    // 英語用日記への切り替えのためのステート
    var jpOrEnState = ref.watch(diaryModeProvider);
    var jpOrEnNotifier = ref.watch(diaryModeProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Container(
              child: Text("日本語で日記を書く",
                  style: Typography.dense2018.headline5
                      ?.apply(fontWeightDelta: 10)),
            ),
          ),
          Container(
            child: ToggleSwitch(
              minWidth: 36.0,
              minHeight: 20.0,
              initialLabelIndex: jpOrEnState.index,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ["日", "英"],
              activeBgColors: [
                [Colors.black45, Colors.black26],
                [Colors.black45, Colors.black26]
              ],
              onToggle: (index) {
                //初期化
                studyNotifier.set(studyState.copyWith(
                    english: "",
                    japanese: "",
                    translation: "",
                    needRetry: false));
                jpOrEnNotifier.set(DiaryMode.English);
              },
            ),
          )
        ]),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/playful_cat.png'),
            ),
            Expanded(
              flex: 3,
              child: BubbleSpecialOne(
                text: '今日、何をしたの？',
                isSender: false,
                color: Colors.green[100]!,
                tail: true,
                textStyle:
                    Typography.dense2018.headline6!.apply(fontWeightDelta: 10),
              ),
            )
          ],
        ),
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
