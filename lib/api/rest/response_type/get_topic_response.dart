import 'package:json_annotation/json_annotation.dart';

part 'get_topic_response.g.dart';

@JsonSerializable()
class GetTopicResponse {
  String? topicTitle;
  String? topicDescription;
  String? topicId;

  GetTopicResponse({this.topicTitle, this.topicDescription, this.topicId});

  factory GetTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTopicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTopicResponseToJson(this);
}
