// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_diary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateDiaryResponse _$TranslateDiaryResponseFromJson(
        Map<String, dynamic> json) =>
    TranslateDiaryResponse(
      translatedEnglish: json['translatedEnglish'] as String?,
      translatedJapanese: json['translatedJapanese'] as String?,
      detectedSourceLanguage: json['detectedSourceLanguage'] as String?,
    );

Map<String, dynamic> _$TranslateDiaryResponseToJson(
        TranslateDiaryResponse instance) =>
    <String, dynamic>{
      'translatedEnglish': instance.translatedEnglish,
      'translatedJapanese': instance.translatedJapanese,
      'detectedSourceLanguage': instance.detectedSourceLanguage,
    };
