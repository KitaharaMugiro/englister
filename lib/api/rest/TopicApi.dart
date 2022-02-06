import 'package:dio/dio.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';

class TopicApi {
  static submitDoneTopic(String topicId) async {
    var userId = await LocalStorageHelper.getUserId();
    if (userId == null) {
      throw Exception('UserId is null');
    }

    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    var it = await client.submitDoneTopics({
      "data": {"userId": userId, "topicId": topicId},
      "headers": await AuthService.getHeader()
    });
    return it;
  }
}
