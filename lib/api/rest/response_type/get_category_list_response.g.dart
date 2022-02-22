// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryListResponse _$GetCategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoryListResponse(
      popular: (json['popular'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      free: (json['free'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryListResponseToJson(
        GetCategoryListResponse instance) =>
    <String, dynamic>{
      'popular': instance.popular,
      'free': instance.free,
    };
