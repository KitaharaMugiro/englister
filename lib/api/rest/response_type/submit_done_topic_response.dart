import 'package:json_annotation/json_annotation.dart';

part 'submit_done_topic_response.g.dart';

@JsonSerializable()
class SubmitDoneTopicResponse {
  bool? success;

  SubmitDoneTopicResponse({this.success});

  factory SubmitDoneTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitDoneTopicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitDoneTopicResponseToJson(this);
}
