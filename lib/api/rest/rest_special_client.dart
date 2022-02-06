import 'package:englister/api/rest/response_type/dashboard.dart';
import 'package:englister/api/rest/response_type/english_score_response.dart';
import 'package:englister/api/rest/response_type/get_topic_response.dart';
import 'package:englister/api/rest/response_type/send_english_response.dart';
import 'package:englister/api/rest/response_type/send_japanese_response.dart';
import 'package:englister/api/rest/response_type/signin_response.dart';
import 'package:englister/api/rest/response_type/study_start_response.dart';
import 'package:englister/api/rest/response_type/submit_done_topic_response.dart';
import 'package:englister/api/rest/response_type/translate_response.dart';
import 'package:englister/api/rest/rest_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_special_client.g.dart';

@RestApi(
    baseUrl: "https://ke5c05zzxb.execute-api.ap-northeast-1.amazonaws.com/dev/")
abstract class RestSpecialClient {
  factory RestSpecialClient(Dio dio, {String baseUrl}) = _RestSpecialClient;

  @POST("/nl/english_level")
  Future<EnglishScoreResponse> englishScore(
    @Body() Map<String, dynamic> map,
  );
}
