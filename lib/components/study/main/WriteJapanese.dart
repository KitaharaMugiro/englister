import 'package:flutter/material.dart';

class WriteJapanese extends StatelessWidget {
  WriteJapanese({Key? key, String? this.errorMessage}) : super(key: key);
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
          height: 15,
        ),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '日本語で意見を書いてください',
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
