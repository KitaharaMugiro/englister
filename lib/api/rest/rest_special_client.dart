import 'package:englister/api/rest/response_type/english_score_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_special_client.g.dart';

@RestApi(
    baseUrl: "https://1kfq730jwf.execute-api.ap-northeast-1.amazonaws.com/dev/")
abstract class RestSpecialClient {
  factory RestSpecialClient(Dio dio, {String baseUrl}) = _RestSpecialClient;

  @POST("/nl/english_level")
  Future<EnglishScoreResponse> englishScore(
    @Body() Map<String, dynamic> map,
  );
}
