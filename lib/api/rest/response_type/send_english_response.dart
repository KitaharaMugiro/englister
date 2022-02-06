import 'package:json_annotation/json_annotation.dart';

part 'send_english_response.g.dart';

@JsonSerializable()
class SendJapaneseResponse {
  bool success;
  String message;

  SendJapaneseResponse({required this.success, required this.message});

  factory SendJapaneseResponse.fromJson(Map<String, dynamic> json) =>
      _$SendJapaneseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SendJapaneseResponseToJson(this);
}
