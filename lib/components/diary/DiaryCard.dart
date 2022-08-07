import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCard extends StatelessWidget {
  String userInputText;
  String userInputEnglish;
  String translatedEnglish;
  String date;

  DiaryCard({
    Key? key,
    required this.userInputText,
    required this.userInputEnglish,
    required this.translatedEnglish,
    required this.date,
  }) : super(key: key) {
    DateTime dt = DateTime.parse(date).toLocal();
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    String dateString = outputFormat.format(dt);
    date = dateString;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(date,
              style: Typography.dense2018.subtitle1?.apply(fontWeightDelta: 3)),
          Text(userInputText, style: Typography.dense2018.subtitle2),
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
