// 下記コメントを付けないと@JsonKeyでwarningが出るがknown issue（https://github.com/rrousselGit/freezed/issues/527）
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

//下記をつけないとToJsonとFromJsonが作成されずにエラーになる
part 'TodayQuestion.g.dart';

part 'TodayQuestion.freezed.dart';

@freezed
abstract class TodayQuestion implements _$TodayQuestion {
  //@JsonSerializableのクラスで自分で作成したClassを使うには@JsonKeyが必要みたい
  const factory TodayQuestion(
      {@JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'todayTopicId')
          required String todayTopicId,
      @JsonKey(name: 'topicId')
          required String topicId,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'categorySlug')
          required String rescategorySlugultId}) = _TodayQuestion;
  factory TodayQuestion.fromJson(Map<String, dynamic> json) =>
      _$TodayQuestionFromJson(json);
}
