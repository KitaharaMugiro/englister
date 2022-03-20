import 'package:englister/api/rest/TodayApi.dart';
import 'package:englister/components/today/TodayStudyReview.dart';
import 'package:englister/components/today/TodayStudyStepper.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:englister/models/study/Question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayStudyMainFrame extends HookConsumerWidget {
  const TodayStudyMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);
    var showReview = ref.watch(showReviewProvider);
    var todayTopicNotifier = ref.watch(todayTopicProvider.notifier);
    var todayTopic = ref.watch(todayTopicProvider);
    var showReviewNotifier = ref.watch(showReviewProvider.notifier);

    // Widgetのビルド後に実行される
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //ビルド後に状態を変更しないとエラーになるためここで初期化
      showReviewNotifier.set(false);
    });

    useEffect(() {
      TodayApi.getTodayTopic().then((res) {
        todayTopicNotifier.set(res);
        var topic = res.question;
        var q = Question(
            topicId: topic.topicId,
            title: topic.title,
            description: topic.description);
        studyNotifier.set(studyState.copyWith(activeQuestion: q));
        debugPrint(res.question.toString());
        debugPrint(res.answer.toString());
      });
    }, []);

    if (todayTopic == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (showReview || todayTopic.answer != null) {
      return Container(child: const TodayStudyReview());
    }

    return Container(child: const TodayStudyStepper());
  }
}
