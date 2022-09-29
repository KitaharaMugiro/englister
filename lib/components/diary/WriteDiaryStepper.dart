import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/components/diary/WriteEnglishDiary.dart';
import 'package:englister/components/diary/WriteJapaneseDiary.dart';
import 'package:englister/components/study/main/Review.dart';
import 'package:englister/models/riverpod/DiaryModeRiverpod.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/rest/DiaryApi.dart';
import '../../models/riverpod/UserRiverpod.dart';

final queryDocument = gql(r'''
  mutation CreateDiary($userInputText: String!, $protected: Boolean! , $translatedEnglish: String!, $translatedJapanese: String, $userInputEnglish: String!) {
    insert_englister_Diary_one(object: {userInputText: $userInputText, protected: $protected, translatedEnglish: $translatedEnglish, translatedJapanese: $translatedJapanese, userInputEnglish: $userInputEnglish}) {
      id
      protected
      translatedEnglish
      userInputEnglish
      userInputText
      updatedAt
      createdAt
      createdBy
      translatedJapanese
    }
  }
''');

class WriteDiaryStepper extends HookConsumerWidget {
  const WriteDiaryStepper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeStep = useState(0);
    var errorMessage = useState<String?>(null);
    var isStartEnglish = useState(false);
    var isStartJapanese = useState(false);

    // 英語用日記への切り替えのためのステート
    var jpOrEnState = ref.watch(diaryModeProvider);

    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    final englishTextController = useTextEditingController();
    var user = ref.watch(userProvider);

    void handleSave(Function saveDiary) async {
      EasyLoading.show(status: 'loading...');
      //キーボードを閉じる
      FocusScope.of(context).unfocus();
      if (user.sub != null) {
        //日記保存処理
        saveDiary(
            userInputText: studyState.japanese,
            protected: true,
            translatedEnglish: studyState.translation,
            userInputEnglish: studyState.english);
      }
      //初期化
      studyNotifier.set(studyState.copyWith(
          english: "", japanese: "", translation: "", needRetry: false));
      //結果画面に移動
      Navigator.pop(context);
      activeStep.value = 0;
      EasyLoading.dismiss();
    }

    void handleNext() async {
      EasyLoading.show(status: 'loading...');
      //キーボードを閉じる
      FocusScope.of(context).unfocus();
      switch (jpOrEnState) {
        case DiaryMode.Japanese:
          if (activeStep.value == 0) {
            if (studyState.japanese.isEmpty || studyState.japanese.length < 5) {
              errorMessage.value = "短いのでもう少し書いてみよう";
              EasyLoading.dismiss();
              return;
            }

            //翻訳
            var resTranslation =
                await DiaryApi.translate(studyState.japanese.trim(), true);
            studyNotifier.set(studyState.copyWith(
                translation: resTranslation.translatedEnglish ?? ""));

            //英語のカウントダウンタイマーをスタートする
            isStartEnglish.value = true;
          } else if (activeStep.value == 1) {
            if (studyState.english.isEmpty) {
              EasyLoading.dismiss();
              return;
            }
            var res = await StudyApi.sendEnglish(studyState.english);
            if (!res.success) {
              errorMessage.value = res.message;
              EasyLoading.dismiss();
              return;
            }
          }
          break;
        case DiaryMode.English:
          if (activeStep.value == 0) {
            if (studyState.english.isEmpty || studyState.english.length < 5) {
              errorMessage.value = "短いのでもう少し書いてみよう";
              EasyLoading.dismiss();
              return;
            }
            //翻訳
            var resTranslation =
                await DiaryApi.translate(studyState.english.trim(), true);
            studyNotifier.set(studyState.copyWith(
                translation: resTranslation.translatedEnglish ?? "",
                japanese: resTranslation.translatedJapanese ?? ""));
          }
          break;
      }

      activeStep.value += 1;
      EasyLoading.dismiss();
      errorMessage.value = null;
    }

    void handleBack() {
      //キーボードを閉じる（一応戻る時も）
      FocusScope.of(context).unfocus();
      switch (jpOrEnState) {
        case DiaryMode.Japanese:
          studyNotifier.set(studyState.copyWith(english: ""));
          englishTextController.text = "";
          break;
        case DiaryMode.English:
          break;
      }
      activeStep.value -= 1;
    }

    List<Widget> renderButtons() {
      final commonFirstStep = [
        ElevatedButton(
          onPressed:
              isStartJapanese.value || isStartEnglish.value ? handleNext : null,
          child: const Text('次へ進む'),
          style: ElevatedButton.styleFrom(
            // Foreground color
            onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
            // Background color
            primary: Theme.of(context).colorScheme.secondaryContainer,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        )
      ];

      List<Widget> commonLastStep() {
        if (studyState.needRetry) {
          return [
            TextButton(
              onPressed: handleNext,
              child: const Text('終了'),
              style: ElevatedButton.styleFrom(
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
                // Background color
                primary: Theme.of(context).colorScheme.secondaryContainer,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            ),
            ElevatedButton(
              onPressed: handleBack,
              child: const Text('お手本を暗記してもう一回挑戦'),
            )
          ];
        }
        return [
          TextButton(
            onPressed: handleBack,
            child: const Text('英語入力に戻る'),
          ),
          Mutation(
              options: MutationOptions(
                document: queryDocument,
                onCompleted: (dynamic resultData) {
                  print(resultData);
                },
              ),
              builder: (runMutation, result) {
                saveDiary(
                    {required String userInputText,
                    required bool protected,
                    required String translatedEnglish,
                    String? translatedJapanese,
                    required String userInputEnglish}) {
                  runMutation({
                    'protected': protected,
                    'translatedEnglish': translatedEnglish,
                    'userInputEnglish': userInputEnglish,
                    'userInputText': userInputText,
                    'translatedJapanese': translatedJapanese,
                  });
                }

                return ElevatedButton(
                  onPressed: () => handleSave(saveDiary),
                  child: user.sub == null
                      ? const Text('終了する')
                      : const Text('保存する'),
                  style: ElevatedButton.styleFrom(
                    // Foreground color
                    onPrimary:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    // Background color
                    primary: Theme.of(context).colorScheme.secondaryContainer,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                );
              })
        ];
      }

      switch (jpOrEnState) {
        case DiaryMode.Japanese:
          if (activeStep.value == 0) {
            return commonFirstStep;
          } else if (activeStep.value == 1) {
            return [
              TextButton(
                onPressed: handleBack,
                child: const Text('日本語入力に戻る'),
              ),
              ElevatedButton(
                onPressed: handleNext,
                child: const Text('次へ進む'),
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
                  // Background color
                  primary: Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              )
            ];
          } else if (activeStep.value == 2) {
            return commonLastStep();
          }
          break;
        case DiaryMode.English:
          if (activeStep.value == 0) {
            return commonFirstStep;
          } else if (activeStep.value == 1) {
            return commonLastStep();
          }
          break;
      }
      return [];
    }

    var steps = <Step>[];
    switch (jpOrEnState) {
      case DiaryMode.Japanese:
        steps.addAll([
          Step(
            title: const Text('Japanene'),
            subtitle: const Text('日本語'),
            isActive: activeStep.value == 0,
            content: Container(
                alignment: Alignment.centerLeft,
                child: WriteJapaneseDiary(
                  errorMessage: errorMessage.value,
                  isStartJapanese: isStartJapanese,
                  isStartEnglish: isStartEnglish,
                )),
          ),
          Step(
            title: const Text('English'),
            subtitle: const Text('英語'),
            isActive: activeStep.value == 1,
            content: WriteEnglishDiary(
              errorMessage: errorMessage.value,
              textEditingController: englishTextController,
              isStart: isStartEnglish.value,
            ),
          ),
          Step(
            title: const Text('Review'),
            subtitle: const Text("お手本"),
            isActive: activeStep.value == 2,
            content: const Review(),
          ),
        ]);
        break;
      case DiaryMode.English:
        steps.addAll([
          Step(
            title: const Text('English'),
            subtitle: const Text('英語'),
            isActive: activeStep.value == 0,
            content: WriteEnglishDiary(
              errorMessage: errorMessage.value,
              textEditingController: englishTextController,
              isStart: isStartEnglish.value,
            ),
          ),
          Step(
            title: const Text('Review'),
            subtitle: const Text("お手本"),
            isActive: activeStep.value == 1,
            content: const Review(),
          ),
        ]);
        break;
    }

    return Stepper(
      key: Key("write-diary-key-" + steps.length.toString()),
      currentStep: activeStep.value,
      type: StepperType.horizontal,
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: renderButtons(),
        );
      },
      steps: steps,
    );
  }
}
