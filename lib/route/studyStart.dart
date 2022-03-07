import 'dart:developer';

import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/components/dialog/showHeartShortError.dart';
import 'package:englister/components/study/start/CategoryStartFrame.dart';
import 'package:englister/route/study.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class StudyStartPage extends HookConsumerWidget {
  StudyStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StudyStartPageArguments args =
        ModalRoute.of(context)?.settings.arguments as StudyStartPageArguments;
    void onClick() async {
      try {
        await StudyApi.studyStart(args.categorySlug);
        Navigator.pushNamed(context, '/study',
            arguments: StudyPageArguments(args.categoryTitle));
      } catch (e) {
        print(e);
        showHeartShortError(context);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(args.categoryTitle),
        ),
        body: CategoryStartFrame(
          categorySlug: args.categorySlug,
          onClick: onClick,
        ));
  }
}

class StudyStartPageArguments {
  final String categorySlug;
  final String categoryTitle;

  StudyStartPageArguments(this.categorySlug, this.categoryTitle);
}
