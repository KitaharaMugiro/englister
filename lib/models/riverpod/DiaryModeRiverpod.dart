import 'package:hooks_riverpod/hooks_riverpod.dart';

//日本語・英語のどちらで日記を書き始めるかどうか
enum DiaryMode {
  Japanese,
  English,
}

class DiaryModeNotifier extends StateNotifier<DiaryMode> {
  DiaryModeNotifier() : super(_initialValue);
  static const DiaryMode _initialValue = DiaryMode.Japanese;
  void set(DiaryMode toggleVal) {
    state = toggleVal;
  }
}

final diaryModeProvider = StateNotifierProvider<DiaryModeNotifier, DiaryMode>(
  (ref) => DiaryModeNotifier(),
);
