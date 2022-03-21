// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodayQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodayQuestion _$$_TodayQuestionFromJson(Map<String, dynamic> json) =>
    _$_TodayQuestion(
      title: json['title'] as String,
      todayTopicId: json['todayTopicId'] as String,
      topicId: json['topicId'] as String,
      description: json['description'] as String,
      rescategorySlugultId: json['categorySlug'] as String,
    );

Map<String, dynamic> _$$_TodayQuestionToJson(_$_TodayQuestion instance) =>
    <String, dynamic>{
      'title': instance.title,
      'todayTopicId': instance.todayTopicId,
      'topicId': instance.topicId,
      'description': instance.description,
      'categorySlug': instance.rescategorySlugultId,
    };
