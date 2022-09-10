import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:englister/components/study/main/PickModeInput.dart';
import 'package:englister/components/study/main/SpeachEnglish.dart';
import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/riverpod/DiaryModeRiverpod.dart';
import '../../models/riverpod/StudyRiverpod.dart';

class WriteEnglishDiary extends HookConsumerWidget {
  WriteEnglishDiary(
      {Key? key, this.errorMessage, required this.textEditingController})
      : super(key: key);
  String? errorMessage;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isSttMode = ref.watch(sttModeProvider);
    var sttModeNotifier = ref.watch(sttModeProvider.notifier);
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    var isPickMode = ref.watch(pickModeProvider);
    var pickModeNotifier = ref.watch(pickModeProvider.notifier);

    // 英語用日記への切り替えのためのステート
    var jpOrEnState = ref.watch(diaryModeProvider);
    var jpOrEnNotifier = ref.watch(diaryModeProvider.notifier);

    Widget renderInputIcons() {
      return Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  iconSize: 45,
                  color: Colors.blue,
                  icon: const Icon(Icons.keyboard),
                  onPressed: () {
                    pickModeNotifier.set(true);
                  }),
              IconButton(
                  iconSize: 45,
                  color: Colors.blue,
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    sttModeNotifier.set(true);
                  })
            ],
          ));
    }

    Widget renderEnglishTextField() {
      return Stack(
        children: [
          TextField(
            maxLines: 5,
            controller: textEditingController,
            onChanged: (value) {
              studyNotifier.set(studyState.copyWith(english: value));
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: '上の文章を英語にしてください',
              alignLabelWithHint: true,
              errorText: errorMessage,
            ),
          ),
          studyState.english.isEmpty ? renderInputIcons() : Container()
        ],
      );
    }

    Widget renderInputView() {
      if (isSttMode) {
        return SpeachEnglish(textEditingController);
      } else if (isPickMode) {
        return Column(
          children: [
            renderEnglishTextField(),
            PickModeInput(
              textEditingController: textEditingController,
            ),
          ],
        );
      } else {
        return renderEnglishTextField();
      }
    }

    var mainWidgets = <Widget>[
      renderInputView(),
      const SizedBox(
        height: 15,
      ),
    ];
    var widgetsByMode = <Widget>[];

    switch (jpOrEnState) {
      case DiaryMode.Japanese:
        widgetsByMode = <Widget>[
          Text("日本語を英語にする",
              style:
                  Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
          const SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.grey[300],
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(studyState.japanese,
                    style: Typography.englishLike2018.bodyText1!
                        .apply(color: Colors.black)),
              )),
          const SizedBox(
            height: 5,
          ),
        ];
        break;
      case DiaryMode.English:
        widgetsByMode = <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Container(
                child: Text("英語で日記を書く",
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
                  jpOrEnNotifier.set(DiaryMode.Japanese);
                },
              ),
            )
          ]),
          const SizedBox(
            height: 5,
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
                  textStyle: Typography.dense2018.headline6!
                      .apply(fontWeightDelta: 10),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ];
        break;
    }

    widgetsByMode.addAll(mainWidgets);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgetsByMode);
  }
}
