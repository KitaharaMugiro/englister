import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/get_purchased_heart_response.dart';
import 'package:englister/api/rest/response_type/purchase_heart_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';

class SubscriptionApi {
  static Future<GetPurchasedHeartResponse> getPurchasedHeart() async {
    var header = await AuthService.getHeader();
    var userId = await LocalStorageHelper.getUserId();

    if (userId == null && header == null) {
      throw Exception('UserId and header is null');
    }
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.getPurchasedHeart({
      "data": {
        "userId": userId,
      },
      "headers": header
    });
    return it;
  }

  static Future<PurchaseHeartResponse> purchaseHeart(String productId) async {
    var header = await AuthService.getHeader();
    var userId = await LocalStorageHelper.getUserId();

    if (userId == null && header == null) {
      throw Exception('UserId and header is null');
    }

    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.purchaseHeart({
      "data": {
        "productId": productId,
        "userId": userId,
      },
      "headers": header
    });
    return it;
  }
}
