import 'package:englister/components/diary/WriteDiaryEnglishModeStepper.dart';
import 'package:englister/components/diary/WriteDiaryStepper.dart';
import 'package:englister/models/riverpod/DiaryModeRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteDiaryMainFrame extends HookConsumerWidget {
  const WriteDiaryMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 英語用日記への切り替えのためのステート
    var jpOrEnState = ref.watch(diaryModeProvider);

    var stepperWidget = null;
    switch (jpOrEnState) {
      case DiaryMode.Japanese:
        stepperWidget = const WriteDiaryStepper();
        break;
      case DiaryMode.English:
        stepperWidget = const WriteDiaryEnglishModeStepper();
        break;
    }

    return Container(child: stepperWidget);
  }
}
