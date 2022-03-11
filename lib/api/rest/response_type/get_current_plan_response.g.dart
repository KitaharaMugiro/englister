// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentPlanResponse _$GetCurrentPlanResponseFromJson(
        Map<String, dynamic> json) =>
    GetCurrentPlanResponse(
      status: json['status'] as String,
      plan: json['plan'] as String,
      customerId: json['customerId'] as String,
    );

Map<String, dynamic> _$GetCurrentPlanResponseToJson(
        GetCurrentPlanResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'plan': instance.plan,
      'customerId': instance.customerId,
    };
