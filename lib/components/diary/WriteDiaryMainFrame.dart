import 'package:englister/components/diary/WriteDiaryStepper.dart';
import 'package:englister/components/diary/WriteEnglishDiary.dart';
import 'package:englister/components/diary/WriteJapaneseDiary.dart';
import 'package:englister/components/study/main/Review.dart';
import 'package:englister/models/riverpod/DiaryModeRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteDiaryMainFrame extends HookConsumerWidget {
  const WriteDiaryMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 英語用日記への切り替えのためのステート
    var jpOrEnState = ref.watch(diaryModeProvider);

    var activeStep = useState(0);
    var errorMessage = useState<String?>(null);

    final englishTextController = useTextEditingController();

    var stepps = <Step>[];
    switch (jpOrEnState) {
      case DiaryMode.Japanese:
        stepps.addAll([
          Step(
            title: const Text('Japanene'),
            subtitle: const Text('日本語'),
            isActive: activeStep.value == 0,
            content: Container(
                alignment: Alignment.centerLeft,
                child: WriteJapaneseDiary(
                  errorMessage: errorMessage.value,
                )),
          ),
          Step(
            title: const Text('English'),
            subtitle: const Text('英語'),
            isActive: activeStep.value == 1,
            content: WriteEnglishDiary(
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
        ]);
        break;
      case DiaryMode.English:
        stepps.addAll([
          Step(
            title: const Text('English'),
            subtitle: const Text('英語'),
            isActive: activeStep.value == 0,
            content: WriteEnglishDiary(
              errorMessage: errorMessage.value,
              textEditingController: englishTextController,
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

    return Container(child: WriteDiaryStepper(steps: stepps));
  }
}
