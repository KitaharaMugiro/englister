// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitDashboardResponse _$SubmitDashboardResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitDashboardResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubmitDashboardResponseToJson(
        SubmitDashboardResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
