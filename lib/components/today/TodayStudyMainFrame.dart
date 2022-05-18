import 'dart:developer';

import 'package:englister/api/rest/TodayApi.dart';
import 'package:englister/components/today/TodayStudyReview.dart';
import 'package:englister/components/today/TodayStudyStepper.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:englister/models/study/Question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class TodayStudyMainFrame extends HookConsumerWidget {
  const TodayStudyMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    var todayResultId = ref.watch(TodayResultIdProvider);
    var todayResultIdNotifier = ref.watch(TodayResultIdProvider.notifier);
    var todayTopicNotifier = ref.watch(todayTopicProvider.notifier);
    var todayTopic = ref.watch(todayTopicProvider);

    useEffect(() {
      var uuid = const Uuid();
      LocalStorageHelper.saveStudySessionId(uuid.v4());
      TodayApi.getTodayTopic().then((res) {
        todayTopicNotifier.set(res);
        var topic = res.question;
        var answer = res.answer;
        var q = Question(
            topicId: topic.topicId,
            title: topic.title,
            description: topic.description);
        studyNotifier.set(studyState.copyWith(activeQuestion: q));

        if (answer != null) {
          todayResultIdNotifier.set(answer.resultId);
        } else {
          todayResultIdNotifier.set(null);
        }
      });
    }, []);

    if (todayTopic == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (todayResultId != null) {
      return const TodayStudyReview();
    }

    return const TodayStudyStepper();
  }
}
