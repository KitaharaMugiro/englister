import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/get_purchased_heart_response.dart';
import 'package:englister/api/rest/response_type/purchase_heart_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';

class SubscriptionApi {
  static Future<GetPurchasedHeartResponse> getPurchasedHeart() async {
    var header = await AuthService.getHeader();
    if (header == null) {
      throw Exception('Not logged in');
    }

    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.getPurchasedHeart({"data": {}, "headers": header});
    return it;
  }

  static Future<PurchaseHeartResponse> purchaseHeart(String productId) async {
    var header = await AuthService.getHeader();
    if (header == null) {
      throw Exception('Not logged in');
    }

    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.purchaseHeart({
      "data": {"productId": productId},
      "headers": header
    });
    return it;
  }
}
