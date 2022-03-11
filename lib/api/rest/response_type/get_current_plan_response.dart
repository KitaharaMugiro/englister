import 'package:json_annotation/json_annotation.dart';

part 'get_current_plan_response.g.dart';

@JsonSerializable()
class GetCurrentPlanResponse {
  String status;
  String plan;
  String customerId;

  GetCurrentPlanResponse(
      {required this.status, required this.plan, required this.customerId});

  factory GetCurrentPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentPlanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCurrentPlanResponseToJson(this);
}
