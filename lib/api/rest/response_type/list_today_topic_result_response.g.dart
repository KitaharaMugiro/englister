// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_today_topic_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTodayTopicResultResponse _$ListTodayTopicResultResponseFromJson(
        Map<String, dynamic> json) =>
    ListTodayTopicResultResponse(
      resultId: json['resultId'] as String,
      score: json['score'] as num,
      age: json['age'] as num,
      topicId: json['topicId'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ListTodayTopicResultResponseToJson(
        ListTodayTopicResultResponse instance) =>
    <String, dynamic>{
      'resultId': instance.resultId,
      'score': instance.score,
      'age': instance.age,
      'topicId': instance.topicId,
      'createdAt': instance.createdAt,
    };
