import 'package:json_annotation/json_annotation.dart';

part 'get_purchased_heart_response.g.dart';

@JsonSerializable()
class GetPurchasedHeartResponse {
  bool purchased;
  num count;

  GetPurchasedHeartResponse({required this.purchased, required this.count});

  factory GetPurchasedHeartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPurchasedHeartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPurchasedHeartResponseToJson(this);
}
