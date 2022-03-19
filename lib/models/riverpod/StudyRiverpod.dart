import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/study/Question.dart';
import 'package:englister/models/study/StudyState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

//定義
class StudyNotifier extends StateNotifier<StudyState> {
  StudyNotifier() : super(_initialValue);
  static final StudyState _initialValue = StudyState(
    needRetry: false,
    japanese: "",
    english: "",
    translation: "",
    activeQuestion: Question(description: "", topicId: "", title: ""),
  );
  void set(StudyState setValue) {
    //copy withを経て渡す
    state = setValue;
  }
}

final studyProvider = StateNotifierProvider<StudyNotifier, StudyState>(
  (ref) => StudyNotifier(),
);

//今日の英語年齢診断の名前
class NameNotifier extends StateNotifier<String> {
  NameNotifier() : super(_initialValue);
  static const String _initialValue = '';
  void set(String name) {
    state = name;
  }
}

final nameProvider = StateNotifierProvider<NameNotifier, String>(
  (ref) => NameNotifier(),
);

//使い方
//var value = ref.watch(xxxProvider);
// → value
//var notifier = ref.watch(xxxProvider.notifier);
// → notifier.set(XXX)