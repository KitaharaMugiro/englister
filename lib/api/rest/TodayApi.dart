import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/get_today_topic_response.dart';
import 'package:englister/api/rest/response_type/list_today_topic_result_response.dart';
import 'package:englister/api/rest/response_type/submit_today_topic_result_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:flutter/foundation.dart';

class TodayApi {
  static Future<GetTodayTopicResponse> getTodayTopic() async {
    var userId = await LocalStorageHelper.getUserId();
    if (userId == null) {
      throw Exception('UserId is null');
    }

    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.getTodayTopic({
      "data": {"userId": userId},
      "headers": await AuthService.getHeader()
    });
    return it;
  }

  static Future<GetTodayTopicResponse> getResult(String resultId) async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.getResult({
      "data": {"resultId": resultId},
      "headers": await AuthService.getHeader()
    });
    return it;
  }

  //引数多いからリクエストクラス作った方が良さそう
  static Future<SubmitTodayTopicResultResponse> submitTodayTopicResult(
    String todayTopicId,
    num score,
    String english,
    String translation,
    String japanese,
    String topicId,
    num age,
    String name,
  ) async {
    var userId = await LocalStorageHelper.getUserId();
    if (userId == null) {
      throw Exception('UserId is null');
    }

    var dio = Dio();
    var client = RestClient(dio);
    var it = await client.submitTodayTopicResult({
      "data": {
        "userId": userId,
        "todayTopicId": todayTopicId,
        "score": score,
        "topicId": topicId,
        "english": english,
        "translation": translation,
        "age": age,
        "japanese": japanese,
        "name": name,
      },
      "headers": await AuthService.getHeader(),
    });
    return it;
  }

  static Future<ListTodayTopicResultResponse> listTodayTopicResult() async {
    var userId = await LocalStorageHelper.getUserId();
    if (userId == null) {
      throw Exception('UserId is null');
    }
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.listTodayTopicResult({
      "data": {"userId": userId},
      "headers": await AuthService.getHeader()
    });
    return it;
  }
}
