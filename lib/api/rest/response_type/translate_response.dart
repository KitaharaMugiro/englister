import 'package:json_annotation/json_annotation.dart';

part 'translate_response.g.dart';

@JsonSerializable()
class TranslateResponse {
  String? translation;

  TranslateResponse({this.translation});

  factory TranslateResponse.fromJson(Map<String, dynamic> json) =>
      _$TranslateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TranslateResponseToJson(this);
}
