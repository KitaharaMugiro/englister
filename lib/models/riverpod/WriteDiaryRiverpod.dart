import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../study/WriteDiaryState.dart';

//定義
class WriteDiaryNotifier extends StateNotifier<WriteDiaryState> {
  WriteDiaryNotifier() : super(_initialValue);
  static const WriteDiaryState _initialValue = WriteDiaryState(
    needRetry: false,
    japanese: "",
    english: "",
    translation: "",
  );
  void set(WriteDiaryState setValue) {
    //copy withを経て渡す
    state = setValue;
  }
}

final writeDiaryProvider =
    StateNotifierProvider<WriteDiaryNotifier, WriteDiaryState>(
  (ref) => WriteDiaryNotifier(),
);
