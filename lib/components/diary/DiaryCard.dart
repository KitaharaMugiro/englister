import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  String userInputText = "";
  String userInputEnglish = "";
  String translatedEnglish = "";
  String date = "";

  DiaryCard({
    Key? key,
    String? userInputText,
    String? userInputEnglish,
    String? translatedEnglish,
    String? date,
  }) : super(key: key) {
    this.userInputText = userInputText ?? "";
    this.userInputEnglish = userInputEnglish ?? "";
    this.translatedEnglish = translatedEnglish ?? "";
    this.date = date ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(userInputText,
              style: Typography.dense2018.subtitle1?.apply(fontWeightDelta: 3)),
          Text(date, style: Typography.dense2018.subtitle2),
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(userInputEnglish,
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
                child: Text(translatedEnglish,
                    style: Typography.englishLike2018.bodyText1!
                        .apply(color: Colors.black)),
              )),
          Divider(
            color: Theme.of(context).dividerColor,
          )
        ]));
  }
}
