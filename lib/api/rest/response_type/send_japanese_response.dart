import 'package:json_annotation/json_annotation.dart';

part 'send_japanese_response.g.dart';

@JsonSerializable()
class SendEnglishResponse {
  bool success;
  String message;

  SendEnglishResponse({required this.success, required this.message});

  factory SendEnglishResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEnglishResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SendEnglishResponseToJson(this);
}
