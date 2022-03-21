import 'package:englister/components/button/TwitterShareButton.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayShareButton extends HookConsumerWidget {
  const TodayShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todayTopic = ref.watch(todayTopicProvider);
    var name = ref.watch(nameProvider);
    var text = name.isEmpty ? "回答はこちら↓" : "$nameさんの回答はこちら↓";
    return TwitterShareButton(
      label: '結果を共有する',
      text: 'Q.${todayTopic!.question.title}\n\n$text',
      url: 'https://english.yunomy.com/today/${todayTopic.answer?.resultId}',
      hashtags: const ["Englister", "英語力診断", "毎日英語年齢診断"],
    );
  }
}
