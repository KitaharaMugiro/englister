import 'package:englister/api/rest/TodayApi.dart';
import 'package:englister/components/today/TodayShareButton.dart';
import 'package:englister/components/today/TodayStudyRanking.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:random_avatar/random_avatar.dart';

class TodayStudyReview extends HookConsumerWidget {
  const TodayStudyReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todayTopic = ref.watch(todayTopicProvider);
    var todayTopicNotifier = ref.watch(todayTopicProvider.notifier);
    var todayResultId = ref.watch(TodayResultIdProvider);
    var name = useState("");

    useEffect(() {
      if (todayResultId == null) {
        //トップに戻す
        Navigator.pop(context);
        return;
      }
      TodayApi.getResult(todayResultId).then((res) {
        todayTopicNotifier.set(res);
        name.value = res.answer?.name ?? "";
      });
    }, [todayResultId]);

    Widget renderReview() {
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
            name.value.isEmpty
                ? Text("日本語で書いた意見", style: Typography.dense2018.bodyText1)
                : Text("${name.value}さんが日本語で書いた意見",
                    style: Typography.dense2018.bodyText1),
            Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(todayTopic.answer!.japanese,
                      style: Typography.englishLike2018.bodyText1!
                          .apply(color: Colors.black)),
                )),
            name.value.isEmpty
                ? Text("英語で書いた意見", style: Typography.dense2018.bodyText1)
                : Text("${name.value}さんが英語で書いた意見",
                    style: Typography.dense2018.bodyText1),
            Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(todayTopic.answer!.english,
                      style: Typography.englishLike2018.bodyText1!
                          .apply(color: Colors.black)),
                )),
            Text("↓ お手本の英語",
                textAlign: TextAlign.center,
                style: Typography.dense2018.bodyText1),
            Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SelectableText(todayTopic.answer!.translation,
                      style: Typography.englishLike2018.bodyText1!
                          .apply(color: Colors.black)),
                )),
            Text("結果と答えをシェア！！",
                textAlign: TextAlign.center,
                style:
                    Typography.dense2018.bodyText1!.apply(fontWeightDelta: 3)),
            Container(
                margin: const EdgeInsets.only(top: 1, bottom: 15),
                child: const SizedBox(height: 60, child: TodayShareButton())),
            //TODO 後で実装する
            // const TodayStudyRanking(),
          ])
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 3,
              margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Image(
                        image: NetworkImage(
                            'https://english.yunomy.com/static/ogp/slide_${todayTopic!.answer!.age + 1}.png'),
                      ),
                      const SizedBox(height: 30),
                      renderReview(),
                    ]),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).disabledColor,
          onPressed: () {},
          label: const Text('次回の英語年齢診断18時スタート！'),
        ),
      ),
    );
  }
}
