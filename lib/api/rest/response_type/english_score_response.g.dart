// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'english_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnglishScoreResponse _$EnglishScoreResponseFromJson(
        Map<String, dynamic> json) =>
    EnglishScoreResponse(
      translation: json['translation'] as String,
      text: json['text'] as String,
      score: json['score'] as String,
      score_num: json['score_num'] as num,
      easiness: json['easiness'] as String,
      easiness_num: json['easiness_num'] as num,
      wordDifficulty: json['wordDifficulty'] as String,
      wordDifficulty_num: json['wordDifficulty_num'] as num,
      totalReadablity: json['totalReadablity'] as String,
      totalReadablity_num: json['totalReadablity_num'] as num,
      age: json['age'] as num,
    );

Map<String, dynamic> _$EnglishScoreResponseToJson(
        EnglishScoreResponse instance) =>
    <String, dynamic>{
      'translation': instance.translation,
      'text': instance.text,
      'score': instance.score,
      'score_num': instance.score_num,
      'easiness': instance.easiness,
      'easiness_num': instance.easiness_num,
      'wordDifficulty': instance.wordDifficulty,
      'wordDifficulty_num': instance.wordDifficulty_num,
      'totalReadablity': instance.totalReadablity,
      'totalReadablity_num': instance.totalReadablity_num,
      'age': instance.age,
    };
