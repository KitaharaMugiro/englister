import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ["日", "英"],
              // iconSize: 30.0,
              activeBgColors: [
                [Colors.black45, Colors.black26],
                [Colors.yellow, Colors.orange]
              ],
              // animate: true, // with just animate set to true, default curve = Curves.easeIn
              // curve: Curves.bounceInOut, // animate must be set to true when using custom curve
              onToggle: (index) {
                print('switched to: $index');
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
