import 'package:json_annotation/json_annotation.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SigninResponse {
  String? result;
  String? userId;

  SigninResponse({this.result, this.userId});

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
