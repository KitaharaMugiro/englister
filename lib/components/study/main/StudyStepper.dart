import 'package:englister/api/rest/RecordApi.dart';
import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/api/rest/TopicApi.dart';
import 'package:englister/components/study/main/Review.dart';
import 'package:englister/components/study/main/WriteEnglish.dart';
import 'package:englister/components/study/main/WriteJapanese.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:englister/models/study/Question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudyStepper extends HookConsumerWidget {
  const StudyStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeStep = useState(0);
    var errorMessage = useState<String?>(null);
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    final englishTextController = useTextEditingController();
    var isStartEnglish = useState(false);
    var isStartJapanese = useState(false);

    useEffect(() {
      //API getTopic
      StudyApi.getTopic().then((topic) {
        var q = Question(
            topicId: topic.topicId!,
            title: topic.topicTitle!,
            description: topic.topicDescription!);
        studyNotifier.set(studyState.copyWith(activeQuestion: q));
      });
      return null;
    }, []);

    void handleNext() async {
      EasyLoading.show(status: 'loading...');
      //キーボードを閉じる
      FocusScope.of(context).unfocus();
      if (activeStep.value == 2) {
        //最後のステップ
        //初期化
        studyNotifier.set(studyState.copyWith(
            english: "", japanese: "", translation: "", needRetry: false));

        //結果画面に移動
        Navigator.pop(context);
        activeStep.value = 0;
        EasyLoading.dismiss();
      } else if (activeStep.value == 0) {
        if (studyState.japanese.isEmpty) {
          EasyLoading.dismiss();
          return;
        }
        //日本語を送信
        var res = await StudyApi.sendJapanese(studyState.japanese);
        if (!res.success) {
          errorMessage.value = res.message;
          EasyLoading.dismiss();
          return;
        }
        //翻訳
        var resTranslation = await StudyApi.translate(
            studyState.japanese.trim(), studyState.activeQuestion.title);
        studyNotifier.set(
            studyState.copyWith(translation: resTranslation.translation ?? ""));
        activeStep.value = 1;
        EasyLoading.dismiss();
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

        TopicApi.submitDoneTopic(studyState.activeQuestion.topicId);

        //WARN: WebではReviewのuseEffectで呼んでいるが、Flutterではスコアを算出しないことと、ライフサイクルの観点からここで実行する

        //translationとか全部入っている状態じゃないとダメだ。
        RecordApi.submitDashboard(-1, studyState.english,
            studyState.translation, studyState.activeQuestion.topicId);

        activeStep.value = 2;
        EasyLoading.dismiss();
      }

      errorMessage.value = null;
    }

    void handleBack() {
      //キーボードを閉じる（一応戻る時も）
      FocusScope.of(context).unfocus();
      studyNotifier.set(studyState.copyWith(english: ""));
      englishTextController.text = "";
      activeStep.value -= 1;
    }

    List<Widget> renderButtons() {
      if (activeStep.value == 0) {
        return [
          ElevatedButton(
            onPressed: isStartJapanese.value ? handleNext : null,
            child: const Text('次へ進む'),
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
              // Background color
              primary: Theme.of(context).colorScheme.secondaryContainer,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          )
        ];
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
          ElevatedButton(
            onPressed: handleNext,
            child: const Text('終了'),
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
              // Background color
              primary: Theme.of(context).colorScheme.secondaryContainer,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          )
        ];
      }
      return [];
    }

    return Stepper(
      currentStep: activeStep.value,
      type: StepperType.horizontal,
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: renderButtons(),
        );
      },
      steps: [
        Step(
          title: const Text('Japanene'),
          subtitle: const Text('日本語'),
          isActive: activeStep.value == 0,
          content: Container(
              alignment: Alignment.centerLeft,
              child: WriteJapanese(
                errorMessage: errorMessage.value,
                isStart: isStartJapanese,
              )),
        ),
        Step(
          title: const Text('English'),
          subtitle: const Text('英語'),
          isActive: activeStep.value == 1,
          content: WriteEnglish(
            isStart: isStartEnglish.value,
            errorMessage: errorMessage.value,
            textEditingController: englishTextController,
          ),
        ),
        Step(
          title: const Text('Review'),
          subtitle: const Text("お手本"),
          isActive: activeStep.value == 2,
          content: const Review(),
        ),
      ],
    );
  }
}
