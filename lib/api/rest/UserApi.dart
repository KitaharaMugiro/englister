import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/signin_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';

class UserApi {
  static Future<SigninResponse> signin() async {
    var userId = await LocalStorageHelper.getUserId();
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.signin({
      "data": {"userId": userId},
      "headers": await AuthService.getHeader()
    });
    return it;
  }
}
