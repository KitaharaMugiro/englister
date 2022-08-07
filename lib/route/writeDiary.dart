import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/diary/WriteDiaryMainFrame.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class WriteDiaryPage extends HookConsumerWidget {
  const WriteDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("日記を書く"),
        ),
        body: GestureDetector(
            //画面タップでキーボードを閉じる処理
            onTap: () => FocusScope.of(context).unfocus(),
            child: const WriteDiaryMainFrame()));
  }
}
