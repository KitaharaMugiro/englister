import 'package:englister/models/study/TodayAnswer.dart';
import 'package:englister/models/study/TodayQuestion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_today_topic_response.g.dart';

@JsonSerializable()
class GetTodayTopicResponse {
  TodayQuestion question;
  TodayAnswer? answer;

  GetTodayTopicResponse({
    required this.question,
    this.answer,
  });

  factory GetTodayTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodayTopicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTodayTopicResponseToJson(this);
}
