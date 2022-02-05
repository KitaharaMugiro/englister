import 'dart:ffi';

import 'package:englister/components/study/main/Review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'WriteEnglish.dart';
import 'WriteJapanese.dart';

const STEPS = ["Japanese", "English", "Review"];

class StudyStepper extends HookConsumerWidget {
  const StudyStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeStep = useState(0);
    var errorMessage = useState(null);

    void handleBack() {
      activeStep.value -= 1;
    }

    void handleNext() {
      if (activeStep.value == 2) {
        //最後のステップ
        //初期化
        //結果画面に移動
      } else if (activeStep.value == 0) {
        //日本語を送信
        activeStep.value += 1;
      } else if (activeStep.value == 1) {
        activeStep.value += 1;
      }

      errorMessage.value = null;
    }

    List<Widget> renderButtons() {
      if (activeStep.value == 0) {
        return [
          ElevatedButton(
            onPressed: handleNext,
            child: const Text('次へ進む'),
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
          )
        ];
      } else if (activeStep.value == 2) {
        return [
          TextButton(
            onPressed: handleBack,
            child: const Text('英語入力に戻る'),
          ),
          ElevatedButton(
            onPressed: handleNext,
            child: const Text('終了'),
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
          isActive: activeStep.value == 0,
          content: Container(
              alignment: Alignment.centerLeft,
              child: WriteJapanese(
                errorMessage: errorMessage.value,
              )),
        ),
        Step(
          title: Text('English'),
          isActive: activeStep.value == 1,
          content: WriteEnglish(
            errorMessage: errorMessage.value,
          ),
        ),
        // 以下追加
        Step(
          title: Text('Review'),
          isActive: activeStep.value == 2,
          content: Review(),
        ),
      ],
    );
  }
}
