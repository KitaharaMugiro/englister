import 'package:json_annotation/json_annotation.dart';

part 'english_score_response.g.dart';

@JsonSerializable()
class EnglishScoreResponse {
  String translation;
  String text;
  String score;
  num score_num;
  String easiness;
  num easiness_num;
  String wordDifficulty;
  num wordDifficulty_num;
  String totalReadablity;
  num totalReadablity_num;
  num age;

  EnglishScoreResponse(
      {required this.translation,
      required this.text,
      required this.score,
      required this.score_num,
      required this.easiness,
      required this.easiness_num,
      required this.wordDifficulty,
      required this.wordDifficulty_num,
      required this.totalReadablity,
      required this.totalReadablity_num,
      required this.age});

  factory EnglishScoreResponse.fromJson(Map<String, dynamic> json) =>
      _$EnglishScoreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EnglishScoreResponseToJson(this);
}
