import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:englister/components/study/main/MyCountDownTimer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/riverpod/DiaryModeRiverpod.dart';
import '../../models/riverpod/StudyRiverpod.dart';

class WriteJapaneseDiary extends HookConsumerWidget {
  String? errorMessage;
  ValueNotifier<bool> isStartJapanese;
  ValueNotifier<bool> isStartEnglish;

  WriteJapaneseDiary(
      {Key? key,
      this.errorMessage,
      required this.isStartJapanese,
      required this.isStartEnglish})
      : super(key: key);

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
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            TextField(
              maxLines: 6,
              onChanged: (value) {
                studyNotifier.set(studyState.copyWith(japanese: value));
              },
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: '日本語で日記を書いてください',
                  alignLabelWithHint: true,
                  errorText: errorMessage),
            ),
            isStartJapanese.value
                ? Container()
                : Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: double.infinity,
                      height: 184,
                      color: Colors.blue,
                    ),
                  ),
            isStartJapanese.value
                ? Container()
                : Positioned(
                    top: 55.0,
                    child: Center(
                      child: Text("あなたの日記を記述してください。",
                          style: Typography.dense2018.bodyLarge),
                    ),
                  ),
            isStartJapanese.value
                ? Container()
                : Positioned(
                    top: 90.0,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            isStartJapanese.value = true;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: const Text('日本語で書く',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isStartEnglish.value = true;
                            var jpOrEnState =
                                ref.watch(diaryModeProvider.notifier);
                            jpOrEnState.set(DiaryMode.English);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                          ),
                          child: const Text('英語で書く',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        isStartJapanese.value
            ? const MyCountdownTimer(
                seconds: 60,
              )
            : Text("残り 01:00:00", style: Typography.dense2018.bodyText2),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
