import 'package:json_annotation/json_annotation.dart';

part 'submit_dashboard_response.g.dart';

@JsonSerializable()
class SubmitDashboardResponse {
  bool success;
  String? message;

  SubmitDashboardResponse({required this.success, this.message});

  factory SubmitDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitDashboardResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitDashboardResponseToJson(this);
}
