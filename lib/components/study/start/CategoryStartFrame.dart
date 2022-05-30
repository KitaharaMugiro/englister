import 'dart:developer';

import 'package:englister/api/rest/CategoryApi.dart';
import 'package:englister/api/rest/TopicApi.dart';
import 'package:englister/components/study/main/StudyStepper.dart';
import 'package:englister/components/study/start/HowToPlayEnglister.dart';
import 'package:englister/models/study/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CategoryStartFrame extends HookConsumerWidget {
  CategoryStartFrame({Key? key, this.categorySlug, this.onClick})
      : super(key: key);
  String? categorySlug;
  Function? onClick;

  get child => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const BASE_URL = 'https://englister.yunomy.com';
    var category = useState<Category?>(null);
    var doneTopicNum = useState(0);
    var allTopicNum = useState(0);
    var noMore = useState(false);
    useEffect(() {
      if (categorySlug != null) {
        TopicApi.getDoneTopicIds(categorySlug!).then((results) {
          doneTopicNum.value = results.length;
        });
        TopicApi.getAllTopicIds(categorySlug!).then((results) {
          allTopicNum.value = results.length;
        });
      }
    }, [categorySlug]);

    useEffect(() {
      if (doneTopicNum == allTopicNum) {
        noMore.value = true;
      } else {
        noMore.value = false;
      }
    }, [doneTopicNum, allTopicNum]);

    useEffect(() {
      if (categorySlug != null) {
        CategoryApi.getCategoryDetail(categorySlug!).then((_category) {
          category.value = _category;
        });
      }
    }, [categorySlug]);

    if (allTopicNum.value == 0) {
      return const Center(child: CircularProgressIndicator());
    }

    var imageUrl = "";
    var path = category.value?.categoryImageUrl;
    if (path != null) {
      imageUrl = BASE_URL + path;
    }

    return Container(
        child: SingleChildScrollView(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Column(
          children: [
            Image(
              image: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(category.value?.categoryName ?? "",
                        style: Typography.dense2018.headline4!
                            .apply(fontWeightDelta: 2)),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(category.value?.categoryDescription ?? "",
                        textAlign: TextAlign.center,
                        style: Typography.dense2018.subtitle1),
                    const HowToPlayEnglister(),
                    const SizedBox(height: 10),
                    LinearPercentIndicator(
                      lineHeight: 30,
                      animation: true,
                      animationDuration: 1000,
                      percent: doneTopicNum.value / allTopicNum.value,
                      center: Text(
                        "${doneTopicNum.value}/${allTopicNum.value}",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      backgroundColor: Colors.grey[100],
                      progressColor: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    if (doneTopicNum.value < 3)
                      Text("最初の3問はハートを消費しません",
                          textAlign: TextAlign.center,
                          style: Typography.dense2018.subtitle2),
                    if (doneTopicNum.value >= 3 && categorySlug != "free")
                      Text("1問ごとにハートを1つ消費します",
                          textAlign: TextAlign.center,
                          style: Typography.dense2018.subtitle2),
                    const SizedBox(height: 10),
                    if (!noMore.value)
                      ElevatedButton(
                          onPressed: () {
                            onClick!();
                          },
                          child: const Text("スタート")),
                    if (noMore.value)
                      Text("全ての問題を解き終わりました",
                          textAlign: TextAlign.center,
                          style: Typography.dense2018.bodyText1),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
