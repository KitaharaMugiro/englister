import 'package:json_annotation/json_annotation.dart';

part 'submit_today_topic_result_response.g.dart';

@JsonSerializable()
class SubmitTodayTopicResultResponse {
  String resultId;

  SubmitTodayTopicResultResponse({required this.resultId});

  factory SubmitTodayTopicResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitTodayTopicResultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitTodayTopicResultResponseToJson(this);
}
