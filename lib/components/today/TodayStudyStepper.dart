import 'package:englister/api/rest/RecordApi.dart';
import 'package:englister/api/rest/SpecialApi.dart';
import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/api/rest/TodayApi.dart';
import 'package:englister/components/study/main/WriteEnglish.dart';
import 'package:englister/components/study/main/WriteJapanese.dart';
import 'package:englister/components/today/TodayStudyTop.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queryDocument = gql(r'''
  mutation SubmitTodayPublicAnswer(
    $topicId: Int!, $answer: String!, $japanese: String!,
    $translation: String!, $age: Int!, $todayTopicId: String!,
    $name: String!) {
    insert_englister_PublicAnswers_one(object:{
      topicId:$topicId,
      answer:$answer,
      japanese: $japanese,
      translation: $translation,
      age: $age, todayTopicId: $todayTopicId,
      name: $name}) {
      id
      topicId
      answer
      createdAt
      createdBy
    }
  }
''');

class TodayStudyStepper extends HookConsumerWidget {
  const TodayStudyStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeStep = useState(0);
    var errorMessage = useState<String?>(null);
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    var nameState = ref.watch(nameProvider);
    var todayResultIdNotifier = ref.watch(TodayResultIdProvider.notifier);
    var todayTopic = ref.watch(todayTopicProvider);
    final englishTextController = useTextEditingController();
    var isStartJapanese = useState(false);
    var isStartEnglish = useState(false);

    void handleNext(Function? submitTodayPublicAnswer) async {
      EasyLoading.show(status: 'loading...');
      //キーボードを閉じる
      FocusScope.of(context).unfocus();
      if (activeStep.value == 0) {
        if (nameState.isEmpty) {
          EasyLoading.dismiss();
          return;
        }
        await LocalStorageHelper.saveTodayName(nameState);
        activeStep.value = 1;
        EasyLoading.dismiss();
      } else if (activeStep.value == 1) {
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
        final resTranslation = await StudyApi.translate(
            studyState.japanese.trim(), studyState.activeQuestion.title);
        studyNotifier.set(
            studyState.copyWith(translation: resTranslation.translation ?? ""));

        activeStep.value = 2;
        EasyLoading.dismiss();
        isStartEnglish.value = true;
      } else if (activeStep.value == 2) {
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

        //年齢とスコアの取得
        var resScore = await SpecialApi.englishScore(
            studyState.english, studyState.translation);

        //結果の保存
        var result = await TodayApi.submitTodayTopicResult(
          todayTopic!.question.todayTopicId,
          resScore.score_num,
          studyState.english,
          studyState.translation,
          studyState.japanese,
          studyState.activeQuestion.topicId,
          resScore.age,
          nameState,
        );

        submitTodayPublicAnswer!(
            int.parse(studyState.activeQuestion.topicId),
            studyState.english,
            studyState.japanese,
            studyState.translation,
            resScore.age,
            todayTopic.question.todayTopicId,
            nameState);

        //WARN: WebではReviewのuseEffectで呼んでいるが、Flutterではスコアを算出しないことと、ライフサイクルの観点からここで実行する

        RecordApi.submitDashboard(resScore.age, studyState.english,
            studyState.translation, studyState.activeQuestion.topicId);

        EasyLoading.dismiss();
        todayResultIdNotifier.set(result.resultId);
        //初期化
        activeStep.value = 0;
        studyNotifier.set(studyState.copyWith(
            english: "", japanese: "", translation: "", needRetry: false));
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

    Widget reviewButton() {
      return Mutation(
        builder: (runMutation, result) {
          // ignore: prefer_function_declarations_over_variables
          Function submitTodayPublicAnswer = (
            int topicId,
            String answer,
            String japanese,
            String translation,
            int age,
            String todayTopicId,
            String name,
          ) {
            runMutation({
              'topicId': topicId,
              'answer': answer,
              'japanese': japanese,
              'translation': translation,
              'age': age,
              'todayTopicId': todayTopicId,
              'name': name,
            });
          };

          return ElevatedButton(
            onPressed: () => handleNext(submitTodayPublicAnswer),
            child: const Text('結果を見る'),
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
              // Background color
              primary: Theme.of(context).colorScheme.secondaryContainer,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          );
        },
        options: MutationOptions(document: queryDocument),
      );
    }

    List<Widget> renderButtons() {
      if (activeStep.value == 0) {
        return [
          ElevatedButton(
            onPressed: () => handleNext(null),
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
            child: const Text('名前入力に戻る'),
          ),
          ElevatedButton(
            onPressed: isStartJapanese.value ? () => handleNext(null) : null,
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
            reviewButton(),
            ElevatedButton(
              onPressed: handleBack,
              child: const Text('お手本を暗記してもう一回挑戦'),
            )
          ];
        }
        return [
          TextButton(
            onPressed: handleBack,
            child: const Text('日本語入力に戻る'),
          ),
          reviewButton(),
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
          title: const Text('Your Name'),
          subtitle: const Text('君の名は'),
          isActive: activeStep.value == 0,
          content: Container(
              alignment: Alignment.centerLeft,
              child: TodayStudyTop(
                errorMessage: errorMessage.value,
              )),
        ),
        Step(
          title: const Text('Japanene'),
          subtitle: const Text('日本語'),
          isActive: activeStep.value == 1,
          content: Container(
              alignment: Alignment.centerLeft,
              child: WriteJapanese(
                isStart: isStartJapanese,
                errorMessage: errorMessage.value,
              )),
        ),
        Step(
          title: const Text('English'),
          subtitle: const Text('英語'),
          isActive: activeStep.value == 2,
          content: WriteEnglish(
            errorMessage: errorMessage.value,
            textEditingController: englishTextController,
            isStart: isStartEnglish.value,
          ),
        ),
      ],
    );
  }
}
