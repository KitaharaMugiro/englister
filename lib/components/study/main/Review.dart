import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'DetailScoreBoard.dart';

class Review extends HookConsumerWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleDiff = useState(true);

    Widget renderDiffOrReview() {
      if (visibleDiff.value) {
        //TODO: 見せ方
        return PrettyDiffText(
          oldText: "Your old text",
          newText: "Your new text",
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("お手本の英語を暗記して復習しよう", style: Typography.dense2018.headline6)
          ],
        );
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DetailScoreBoard(
          text: "I want to be a king", translation: "I wanna be a king"),
      Text("English Score: XX", style: Typography.englishLike2018.headline5),
      const SizedBox(height: 10),
      renderDiffOrReview(),
    ]);
  }
}
