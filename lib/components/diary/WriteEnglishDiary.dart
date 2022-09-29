import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:englister/components/study/main/MyCountDownTimer.dart';
import 'package:englister/components/study/main/PickModeInput.dart';
import 'package:englister/components/study/main/SpeachEnglish.dart';
import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/riverpod/DiaryModeRiverpod.dart';
import '../../models/riverpod/StudyRiverpod.dart';

class WriteEnglishDiary extends HookConsumerWidget {
  String? errorMessage;
  final TextEditingController textEditingController;
  bool isStart;

  WriteEnglishDiary(
      {Key? key,
      this.errorMessage,
      required this.textEditingController,
      required this.isStart})
      : super(key: key);

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

    var widgetsByMode = <Widget>[];
    String decorationText;
    var inputIcons = <Widget>[
      IconButton(
          iconSize: 45,
          color: Colors.blue,
          icon: const Icon(Icons.mic),
          onPressed: () {
            sttModeNotifier.set(true);
          })
    ];

    switch (jpOrEnState) {
      case DiaryMode.Japanese:
        decorationText = '上の文章を英語にしてください';

        // 日本語日記の際には日本語を元にしたヒントを利用した入力方式が有効であるため、それを利用できるようにする
        inputIcons.insert(
            0,
            IconButton(
                iconSize: 45,
                color: Colors.blue,
                icon: const Icon(Icons.keyboard),
                onPressed: () {
                  pickModeNotifier.set(true);
                }));

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
        decorationText = '英語で日記を書いてください。';

        widgetsByMode = <Widget>[
          Text("英語で日記を書く",
              style:
                  Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
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
                  text: 'What did you do today?',
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

    Widget renderInputIcons() {
      return Positioned(
          bottom: 0,
          right: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: inputIcons));
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
              labelText: decorationText,
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
      isStart
          ? const MyCountdownTimer(
              seconds: 120,
            )
          : Text("残り 02:00:00", style: Typography.dense2018.bodyText2),
      const SizedBox(
        height: 15,
      ),
    ];

    widgetsByMode.addAll(mainWidgets);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgetsByMode);
  }
}
