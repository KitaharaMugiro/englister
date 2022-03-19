import 'package:englister/components/today/TodayStudyReviewMainFrame.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class TodayStudyReviewPage extends HookConsumerWidget {
  const TodayStudyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('今日の英語年齢診断結果'),
        ),
        body: GestureDetector(
            //画面タップでキーボードを閉じる処理
            onTap: () => FocusScope.of(context).unfocus(),
            child: const TodayStudyReviewMainFrame()));
  }
}
