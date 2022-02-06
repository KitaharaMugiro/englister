// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_english_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendJapaneseResponse _$SendJapaneseResponseFromJson(
        Map<String, dynamic> json) =>
    SendJapaneseResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendJapaneseResponseToJson(
        SendJapaneseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
