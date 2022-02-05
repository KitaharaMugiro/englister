import 'package:flutter/material.dart';

class DetailScoreBoard extends StatelessWidget {
  DetailScoreBoard({Key? key, required this.text, required this.translation})
      : super(key: key);
  String text;
  String translation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Chip(
                avatar: Icon(Icons.sports_score),
                label: Text("test"),
              ),
              const SizedBox(
                width: 10,
              ),
              Chip(
                avatar: Icon(Icons.thumb_up_alt),
                label: Text("test"),
              ),
              const SizedBox(
                width: 10,
              ),
              Chip(
                avatar: Icon(Icons.drive_file_rename_outline),
                label: Text("test"),
              ),
            ],
          ),
        ),
        Text("英語年齢: XX歳", style: Typography.dense2018.headline5),
      ],
    );
  }
}
