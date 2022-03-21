import 'package:englister/api/rest/response_type/get_today_topic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

//英語年齢の状態
class TodayTopicNotifier extends StateNotifier<GetTodayTopicResponse?> {
  TodayTopicNotifier() : super(_initialValue);
  static const GetTodayTopicResponse? _initialValue = null;
  void set(GetTodayTopicResponse? res) {
    state = res;
  }
}

final todayTopicProvider =
    StateNotifierProvider<TodayTopicNotifier, GetTodayTopicResponse?>(
  (ref) => TodayTopicNotifier(),
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

//今日の英語年齢診断の結果ID
class TodayResultIdNotifier extends StateNotifier<String?> {
  TodayResultIdNotifier() : super(_initialValue);
  static const String? _initialValue = null;
  void set(String? showReview) {
    state = showReview;
  }
}

final TodayResultIdProvider =
    StateNotifierProvider<TodayResultIdNotifier, String?>(
  (ref) => TodayResultIdNotifier(),
);

//使い方
//var value = ref.watch(xxxProvider);
// → value
//var notifier = ref.watch(xxxProvider.notifier);
// → notifier.set(XXX)