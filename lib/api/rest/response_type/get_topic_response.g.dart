// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTopicResponse _$GetTopicResponseFromJson(Map<String, dynamic> json) =>
    GetTopicResponse(
      topicTitle: json['topicTitle'] as String?,
      topicDescription: json['topicDescription'] as String?,
      topicId: json['topicId'] as String?,
    );

Map<String, dynamic> _$GetTopicResponseToJson(GetTopicResponse instance) =>
    <String, dynamic>{
      'topicTitle': instance.topicTitle,
      'topicDescription': instance.topicDescription,
      'topicId': instance.topicId,
    };
