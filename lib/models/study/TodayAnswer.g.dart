// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodayAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodayAnswer _$$_TodayAnswerFromJson(Map<String, dynamic> json) =>
    _$_TodayAnswer(
      japanese: json['japanese'] as String,
      english: json['english'] as String,
      translation: json['translation'] as String,
      age: json['age'] as num,
      resultId: json['resultId'] as String,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_TodayAnswerToJson(_$_TodayAnswer instance) =>
    <String, dynamic>{
      'japanese': instance.japanese,
      'english': instance.english,
      'translation': instance.translation,
      'age': instance.age,
      'resultId': instance.resultId,
      'name': instance.name,
      'userId': instance.userId,
    };
