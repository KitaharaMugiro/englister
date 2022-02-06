// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_japanese_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEnglishResponse _$SendEnglishResponseFromJson(Map<String, dynamic> json) =>
    SendEnglishResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendEnglishResponseToJson(
        SendEnglishResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
