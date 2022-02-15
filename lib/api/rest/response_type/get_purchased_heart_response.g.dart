// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchased_heart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPurchasedHeartResponse _$GetPurchasedHeartResponseFromJson(
        Map<String, dynamic> json) =>
    GetPurchasedHeartResponse(
      purchased: json['purchased'] as bool,
      count: json['count'] as num,
    );

Map<String, dynamic> _$GetPurchasedHeartResponseToJson(
        GetPurchasedHeartResponse instance) =>
    <String, dynamic>{
      'purchased': instance.purchased,
      'count': instance.count,
    };
