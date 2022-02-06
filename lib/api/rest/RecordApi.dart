import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/submit_dashboard_response.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';

class RecordApi {
  static Future<SubmitDashboardResponse> submitDashboard(
      num score, String english, String translation, String topicId) async {
    var userId = await LocalStorageHelper.getUserId();
    var studySessionId = await LocalStorageHelper.getStudySessionId();
    if (userId == null || studySessionId == null) {
      throw Exception('UserId or StudySessionId is null');
    }

    var dio = Dio();
    var client = RestClient(dio);
    var it = await client.submitDashboard({
      "data": {
        "userId": userId,
        "studySessionId": studySessionId,
        "score": score,
        "english": english,
        "translation": translation,
        "topicId": topicId,
        "isOpen": false
      },
      "headers": await AuthService.getHeader(),
    });
    return it;
  }
}
