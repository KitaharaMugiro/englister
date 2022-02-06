import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/english_score_response.dart';
import 'package:englister/api/rest/rest_special_client.dart';
import 'package:englister/models/auth/AuthService.dart';

class SpecialApi {
  static Future<EnglishScoreResponse> englishScore(
      String text, String translation) async {
    var dio = Dio();
    var client = RestSpecialClient(dio);
    var it = await client.englishScore({
      "data": {"text": text, "translation": translation},
      "headers": await AuthService.getHeader(),
    });
    return it;
  }
}
