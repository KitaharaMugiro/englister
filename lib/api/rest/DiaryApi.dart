import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/translate_diary_response.dart';
import 'package:englister/api/rest/rest_client.dart';

class DiaryApi {
  static Future<TranslateDiaryResponse> translate(String userInputText) async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.translateDiary({
      "data": {
        "userInputText": userInputText,
      }
    });
    return it;
  }
}
