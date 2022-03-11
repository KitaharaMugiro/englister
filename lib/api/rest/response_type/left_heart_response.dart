import 'package:json_annotation/json_annotation.dart';

part 'left_heart_response.g.dart';

@JsonSerializable()
class LeftHeartResponse {
  num leftHeart;

  LeftHeartResponse({required this.leftHeart});

  factory LeftHeartResponse.fromJson(Map<String, dynamic> json) =>
      _$LeftHeartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LeftHeartResponseToJson(this);
}
