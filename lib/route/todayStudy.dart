import 'package:englister/components/today/TodayStudyMainFrame.dart';
import 'package:englister/components/today/TodayStudyStepper.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class TodayStudyPage extends HookConsumerWidget {
  const TodayStudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('今日の英語年齢診断'),
        ),
        body: GestureDetector(
            //画面タップでキーボードを閉じる処理
            onTap: () => FocusScope.of(context).unfocus(),
            child: const TodayStudyMainFrame()));
  }
}
