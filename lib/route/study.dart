import 'package:englister/components/study/main/StudyMainFrame.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class StudyPage extends HookConsumerWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StudyPageArguments args =
        ModalRoute.of(context)?.settings.arguments as StudyPageArguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.categoryTitle),
        ),
        body: const StudyMainFrame());
  }
}

class StudyPageArguments {
  final String categoryTitle;

  StudyPageArguments(this.categoryTitle);
}
