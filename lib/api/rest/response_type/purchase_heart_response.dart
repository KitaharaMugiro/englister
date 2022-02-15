import 'package:json_annotation/json_annotation.dart';

part 'purchase_heart_response.g.dart';

@JsonSerializable()
class PurchaseHeartResponse {
  bool? result;

  PurchaseHeartResponse({this.result});

  factory PurchaseHeartResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseHeartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseHeartResponseToJson(this);
}
