import 'package:englister/components/button/TwitterShareButton.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayShareButton extends HookConsumerWidget {
  const TodayShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todayTopic = ref.watch(todayTopicProvider);
    return TwitterShareButton(
      label: '結果をツイートする',
      text: '今日の英語年齢の診断結果',
      url: 'https://english.yunomy.com/today/${todayTopic!.answer?.resultId}',
      hashtags: const ["Englister", "英語力診断", "毎日英語年齢診断"],
    );
  }
}
