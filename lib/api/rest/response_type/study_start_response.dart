import 'package:json_annotation/json_annotation.dart';

part 'study_start_response.g.dart';

@JsonSerializable()
class StudyStartResponse {
  String? studySessionId;

  StudyStartResponse({this.studySessionId});

  factory StudyStartResponse.fromJson(Map<String, dynamic> json) =>
      _$StudyStartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StudyStartResponseToJson(this);
}
