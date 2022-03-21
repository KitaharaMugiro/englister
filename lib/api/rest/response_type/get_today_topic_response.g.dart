// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_today_topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodayTopicResponse _$GetTodayTopicResponseFromJson(
        Map<String, dynamic> json) =>
    GetTodayTopicResponse(
      question:
          TodayQuestion.fromJson(json['question'] as Map<String, dynamic>),
      answer: json['answer'] == null
          ? null
          : TodayAnswer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTodayTopicResponseToJson(
        GetTodayTopicResponse instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
