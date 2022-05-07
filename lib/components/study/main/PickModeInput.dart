import 'dart:ui';

import 'package:englister/components/study/main/%20PickModeButton.dart';
import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;
import 'package:dots_indicator/dots_indicator.dart';

import 'package:quiver/iterables.dart';

class PickModeInput extends HookConsumerWidget {
  const PickModeInput({Key? key, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    const displayLimit = 7;
    var allWordSet = useState([]);
    var showingWords = useState([]);
    var index = useState(0);
    var complete = useState(false);

    useEffect(() {
      if (studyState.translation.isEmpty) return;
      // \s → 空白文字（半角スペース、\t、\n、\r、\f）すべて
      final words = studyState.translation.split(RegExp(r'(\s)'));
      final wordSet = partition(words, displayLimit);
      final _wordSet = wordSet
          .map((word) => word
              .map((w) => ({
                    'id': math.Random().nextDouble(),
                    'value': w,
                    'isSelected': false
                  }))
              .toList())
          .toList();
      allWordSet.value = _wordSet;

      //showingWordsが空であれば、allWordSetの最初の要素をshowingWordsに設定する
      if (showingWords.value.isEmpty && allWordSet.value.isNotEmpty) {
        final nextWords = allWordSet.value[index.value];
        nextWords.shuffle();
        showingWords.value = nextWords;
      }
    }, [studyState.translation]);

    void onClick(Map word) {
      final newShowingWords = showingWords.value.map((w) {
        if (w["id"] == word["id"]) {
          return {...w, 'isSelected': !w["isSelected"]};
        }
        return w;
      }).toList();
      showingWords.value = newShowingWords;

      textEditingController.text =
          '${textEditingController.text} ${word["value"]}'.trim();
      studyNotifier
          .set(studyState.copyWith(english: textEditingController.text));

      //もし全ての文字が選択されていたら、次の文字を表示する(同じものは出さない)
      if (newShowingWords.where((w) => w["isSelected"]).length ==
          newShowingWords.length) {
        if (index.value != allWordSet.value.length - 1) {
          final nextWords = allWordSet.value[index.value + 1];
          nextWords.shuffle();
          showingWords.value = nextWords;
          index.value += 1;
        } else {
          showingWords.value = [];
          complete.value = true;
        }
      }
    }

    return Column(
      children: [
        Wrap(
          children: [
            for (final showingWord in showingWords.value)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PickModeButton(
                    value: showingWord["value"],
                    isSelected: showingWord["isSelected"],
                    onClick: () => onClick(showingWord)),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        complete.value || allWordSet.value.isEmpty
            ? Container()
            : DotsIndicator(
                dotsCount: allWordSet.value.length,
                position: index.value.toDouble(),
                decorator: const DotsDecorator(
                  color: Colors.grey, // Inactive color
                  activeColor: Colors.blue,
                ),
              ),
      ],
    );
  }
}
