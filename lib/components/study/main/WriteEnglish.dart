import 'dart:ui';

import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteEnglish extends HookConsumerWidget {
  WriteEnglish({Key? key, this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);

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
        Text(studyState.activeQuestion.title,
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        Text(studyState.activeQuestion.description,
            style: Typography.dense2018.bodyText2),
        const SizedBox(
          height: 5,
        ),
        Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.grey[300],
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(studyState.japanese,
                  style: Typography.englishLike2018.bodyText1!
                      .apply(color: Colors.black)),
            )),
        const SizedBox(
          height: 5,
        ),
        TextField(
          maxLines: 3,
          onChanged: (value) {
            studyNotifier.set(studyState.copyWith(english: value));
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
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
