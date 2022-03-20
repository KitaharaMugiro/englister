import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayStudyReview extends HookConsumerWidget {
  const TodayStudyReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todayTopic = ref.watch(todayTopicProvider);

    Widget renderDiffOrReview() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(todayTopic!.question.title,
                style:
                    Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
            const SizedBox(height: 10),
            Text(todayTopic.question.description,
                style: Typography.dense2018.bodyText2),
            const SizedBox(height: 20),
            Text("日本語で書いた意見", style: Typography.dense2018.bodyText1),
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(todayTopic.answer!.japanese,
                      style: Typography.englishLike2018.bodyText1),
                )),
            Text("英語で書いた意見", style: Typography.dense2018.bodyText1),
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(todayTopic!.answer!.english,
                      style: Typography.englishLike2018.bodyText1),
                )),
            Text("↓ お手本の英語",
                textAlign: TextAlign.center,
                style: Typography.dense2018.bodyText1),
            Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(todayTopic.answer!.translation,
                      style: Typography.englishLike2018.bodyText1),
                )),
          ])
        ],
      );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Image(
        image: NetworkImage(
            'https://english.yunomy.com/static/ogp/slide_${todayTopic!.answer!.age + 1}.png'),
      ),
      const SizedBox(height: 30),
      renderDiffOrReview(),
    ]);
  }
}
