import 'package:englister/api/rest/response_type/get_today_topic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

//音声入力かどうか
class SttModeNotifier extends StateNotifier<bool> {
  SttModeNotifier() : super(_initialValue);
  static const bool _initialValue = false;
  void set(bool isSttMode) {
    state = isSttMode;
  }
}

final sttModeProvider = StateNotifierProvider<SttModeNotifier, bool>(
  (ref) => SttModeNotifier(),
);

//単語選択モード
class PickModeNotifier extends StateNotifier<bool> {
  PickModeNotifier() : super(_initialValue);
  static const bool _initialValue = false;
  void set(bool isPickMode) {
    state = isPickMode;
  }
}

final pickModeProvider = StateNotifierProvider<PickModeNotifier, bool>(
  (ref) => PickModeNotifier(),
);
