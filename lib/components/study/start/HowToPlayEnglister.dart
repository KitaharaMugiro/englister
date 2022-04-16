import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HowToPlayEnglister extends HookConsumerWidget {
  const HowToPlayEnglister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("日本語で自分の意見を書く → 英語にする → お手本を覚える。",
              textAlign: TextAlign.center,
              style: Typography.englishLike2018.bodyText1!
                  .apply(fontWeightDelta: 2)),
        ));
  }
}
