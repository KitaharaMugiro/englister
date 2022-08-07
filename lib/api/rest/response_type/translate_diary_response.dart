import 'package:json_annotation/json_annotation.dart';

part 'translate_diary_response.g.dart';

@JsonSerializable()
class TranslateDiaryResponse {
  String? translatedEnglish = "";
  String? translatedJapanese = "";
  String? detectedSourceLanguage = "";

  TranslateDiaryResponse(
      {this.translatedEnglish,
      this.translatedJapanese,
      this.detectedSourceLanguage});

  factory TranslateDiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$TranslateDiaryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TranslateDiaryResponseToJson(this);
}
