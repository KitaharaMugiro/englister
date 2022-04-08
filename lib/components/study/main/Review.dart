import 'package:englister/api/rest/RecordApi.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'DetailScoreBoard.dart';

class Review extends HookConsumerWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleDiff = useState(false);
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);

    Widget renderDiffOrReview() {
      if (visibleDiff.value) {
        return PrettyDiffText(
          oldText: studyState.english,
          newText: studyState.translation,
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("お手本の英語を暗記して復習しよう", style: Typography.dense2018.headline6),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(studyState.english,
                        style: Typography.englishLike2018.bodyText1),
                  )),
              Text("↓ お手本の英語",
                  textAlign: TextAlign.center,
                  style: Typography.dense2018.bodyText1),
              Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  color: Colors.green[100],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(studyState.translation,
                        style: Typography.englishLike2018.bodyText1),
                  )),
            ])
          ],
        );
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DetailScoreBoard(
          text: studyState.english, translation: studyState.translation),
      const SizedBox(height: 30),
      renderDiffOrReview(),
    ]);
  }
}
