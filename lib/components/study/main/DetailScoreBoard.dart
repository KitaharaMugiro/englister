import 'package:dio/dio.dart';
import 'package:englister/api/rest/SpecialApi.dart';
import 'package:englister/api/rest/rest_special_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScoreBoard extends HookConsumerWidget {
  DetailScoreBoard({Key? key, required this.text, required this.translation})
      : super(key: key);
  String text;
  String translation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var distance = useState("");
    var easiness = useState("");
    var wordDifficulity = useState("");
    var age = useState("");

    useEffect(() {
      if (text.isNotEmpty && translation.isNotEmpty) {
        SpecialApi.englishScore(text, translation).then((res) async {
          distance.value = res.score;
          easiness.value = res.easiness;
          wordDifficulity.value = res.wordDifficulty;
          age.value = res.age.toString() + "歳";
        });
      }
    }, [text, translation]);

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
                label: Text(distance.value),
              ),
              const SizedBox(
                width: 10,
              ),
              Chip(
                avatar: Icon(Icons.thumb_up_alt),
                label: Text(easiness.value),
              ),
              const SizedBox(
                width: 10,
              ),
              Chip(
                avatar: Icon(Icons.drive_file_rename_outline),
                label: Text(wordDifficulity.value),
              ),
            ],
          ),
        ),
        Text("英語年齢: ${age.value}", style: Typography.dense2018.headline5),
      ],
    );
  }
}
