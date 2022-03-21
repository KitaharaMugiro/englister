// 下記コメントを付けないと@JsonKeyでwarningが出るがknown issue（https://github.com/rrousselGit/freezed/issues/527）
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

//下記をつけないとToJsonとFromJsonが作成されずにエラーになる
part 'TodayAnswer.g.dart';

part 'TodayAnswer.freezed.dart';

@freezed
abstract class TodayAnswer implements _$TodayAnswer {
  //@JsonSerializableのクラスで自分で作成したClassを使うには@JsonKeyが必要みたい
  //TODO 一部でnullがあり一時的に？にしているが後で直す
  const factory TodayAnswer(
      {@JsonKey(name: 'japanese') required String japanese,
      @JsonKey(name: 'english') required String english,
      @JsonKey(name: 'translation') required String translation,
      @JsonKey(name: 'age') required num age,
      @JsonKey(name: 'resultId') required String resultId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'userId') String? userId}) = _TodayAnswer;
  factory TodayAnswer.fromJson(Map<String, dynamic> json) =>
      _$TodayAnswerFromJson(json);
}
