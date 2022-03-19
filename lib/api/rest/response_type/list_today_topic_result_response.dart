import 'package:json_annotation/json_annotation.dart';

part 'list_today_topic_result_response.g.dart';

@JsonSerializable()
class ListTodayTopicResultResponse {
  String resultId;
  num score;
  num age;
  String topicId;
  String createdAt;

  ListTodayTopicResultResponse({
    required this.resultId,
    required this.score,
    required this.age,
    required this.topicId,
    required this.createdAt,
  });

  factory ListTodayTopicResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTodayTopicResultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListTodayTopicResultResponseToJson(this);
}
