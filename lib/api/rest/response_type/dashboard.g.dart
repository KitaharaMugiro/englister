// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      studySessionId: json['studySessionId'] as String?,
      score: json['score'] as num?,
      questionTitle: json['questionTitle'] as String?,
      questionDescription: json['questionDescription'] as String?,
      topicId: json['topicId'] as String?,
      firstEnglish: json['firstEnglish'] as String?,
      translation: json['translation'] as String?,
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'studySessionId': instance.studySessionId,
      'score': instance.score,
      'questionTitle': instance.questionTitle,
      'questionDescription': instance.questionDescription,
      'topicId': instance.topicId,
      'firstEnglish': instance.firstEnglish,
      'translation': instance.translation,
      'isOpen': instance.isOpen,
    };
