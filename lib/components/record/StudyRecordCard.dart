import 'package:flutter/material.dart';

class StudyRecordCard extends StatelessWidget {
  String questionText = "";
  String firstEnglish = "";
  String translation = "";
  String questionDescription = "";

  StudyRecordCard({
    Key? key,
    String? questionText,
    String? firstEnglish,
    String? translation,
    String? questionDescription,
  }) : super(key: key) {
    this.questionText = questionText ?? "";
    this.firstEnglish = firstEnglish ?? "";
    this.translation = translation ?? "";
    this.questionDescription = questionDescription ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(questionText,
              style: Typography.dense2018.subtitle1?.apply(fontWeightDelta: 3)),
          Text(questionDescription, style: Typography.dense2018.subtitle2),
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(firstEnglish,
                    style: Typography.englishLike2018.bodyText1!
                        .apply(color: Colors.black)),
              )),
          Text("↓ お手本の英語",
              textAlign: TextAlign.center, style: Typography.dense2018.caption),
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(translation,
                    style: Typography.englishLike2018.bodyText1!
                        .apply(color: Colors.black)),
              )),
          Divider(
            color: Theme.of(context).dividerColor,
          )
        ]));
  }
}
