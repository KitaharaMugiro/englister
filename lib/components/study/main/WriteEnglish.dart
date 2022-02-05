import 'dart:ui';

import 'package:flutter/material.dart';

class WriteEnglish extends StatelessWidget {
  WriteEnglish({Key? key, String? this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle,
          ),
          child: Container(
            child: const Text("Q",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        Text('転売は悪？',
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        Text(
            "限定グッズやコンサートチケット、マスクなどの転売について「転売ヤー」などと揶揄し、憤慨するツイートをしばしば見かけます。転売は悪なのでしょうか？",
            style: Typography.dense2018.bodyText2),
        const SizedBox(
          height: 5,
        ),
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.grey[300],
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("あなたの入力した日本語",
                  style: Typography.englishLike2018.bodyText1),
            )),
        const SizedBox(
          height: 5,
        ),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '上の文章を英語にしてください',
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
