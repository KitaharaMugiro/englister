import 'dart:ui';

import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO 実装予定
class PickModeInput extends HookConsumerWidget {
  const PickModeInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var isPickMode = ref.watch(pickModeProvider);
    // var pickModeNotifier = ref.watch(pickModeProvider.notifier);
    var studyState = ref.watch(studyProvider);
    const displayLimit = 8;

    useEffect(() {
      if (studyState.translation.isEmpty) return;
      //翻訳した文書をスペースで分割する
      final words = studyState.translation.split(" ");
      const wordSet = [];
      for (var i = 0; i < words.length; i += displayLimit) {
        wordSet.add(words.sublist(i, i + displayLimit));
      }
    }, [studyState.translation]);

    return const Text("PickModeInput");
  }
}
