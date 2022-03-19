import 'package:englister/components/today/TodayStudyMainFrame.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class TodayStudyPage extends HookConsumerWidget {
  const TodayStudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TodayStudyPageArguments args =
        ModalRoute.of(context)?.settings.arguments as TodayStudyPageArguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.categoryTitle),
        ),
        body: GestureDetector(
            //画面タップでキーボードを閉じる処理
            onTap: () => FocusScope.of(context).unfocus(),
            child: const TodayStudyMainFrame()));
  }
}

class TodayStudyPageArguments {
  final String categoryTitle;

  TodayStudyPageArguments(this.categoryTitle);
}
