// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryDetailResponse _$GetCategoryDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoryDetailResponse(
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoryDetailResponseToJson(
        GetCategoryDetailResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
    };
