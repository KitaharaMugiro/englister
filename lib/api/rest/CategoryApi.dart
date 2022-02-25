import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/get_category_detail_response.dart';
import 'package:englister/api/rest/response_type/get_category_list_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:englister/models/study/Category.dart';

class CategoryApi {
  static Future<Category> getCategoryDetail(String categorySlug) async {
    var userId = await LocalStorageHelper.getUserId();
    if (userId == null) {
      throw Exception('UserId is null');
    }
    var dio = Dio();
    var client = RestClient(dio);
    var res = await client.getCategoryDetail({
      "data": {"userId": userId, "categorySlug": categorySlug},
    });
    return res;
  }

  static Future<GetCategoryListResponse> getCategoryList() async {
    var dio = Dio();
    var client = RestClient(dio);
    var res = await client.getCategoryList({
      "data": {},
    });
    return res;
  }
}
