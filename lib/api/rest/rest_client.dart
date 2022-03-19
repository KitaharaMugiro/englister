import 'package:englister/api/rest/response_type/dashboard.dart';
import 'package:englister/api/rest/response_type/get_category_detail_response.dart';
import 'package:englister/api/rest/response_type/get_category_list_response.dart';
import 'package:englister/api/rest/response_type/get_current_plan_response.dart';
import 'package:englister/api/rest/response_type/get_purchased_heart_response.dart';
import 'package:englister/api/rest/response_type/get_today_topic_response.dart';
import 'package:englister/api/rest/response_type/get_topic_response.dart';
import 'package:englister/api/rest/response_type/left_heart_response.dart';
import 'package:englister/api/rest/response_type/list_today_topic_result_response.dart';
import 'package:englister/api/rest/response_type/purchase_heart_response.dart';
import 'package:englister/api/rest/response_type/send_english_response.dart';
import 'package:englister/api/rest/response_type/send_japanese_response.dart';
import 'package:englister/api/rest/response_type/signin_response.dart';
import 'package:englister/api/rest/response_type/study_start_response.dart';
import 'package:englister/api/rest/response_type/submit_dashboard_response.dart';
import 'package:englister/api/rest/response_type/submit_done_topic_response.dart';
import 'package:englister/api/rest/response_type/submit_today_topic_result_response.dart';
import 'package:englister/api/rest/response_type/translate_response.dart';
import 'package:englister/api/rest/rest_constants.dart';
import 'package:englister/models/study/Category.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: REST_API_BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/subscription/plan")
  Future<GetCurrentPlanResponse> getCurrentPlan(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/left_heart")
  Future<LeftHeartResponse> leftHeart(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/record/list_dashboard")
  Future<List<Dashboard>> getDashboard(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/topic")
  Future<GetTopicResponse> getTopic(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/start")
  Future<StudyStartResponse> studyStart(
    @Body() Map<String, dynamic> map,
  );

  @POST("/user/signin")
  Future<SigninResponse> signin(
    @Body() Map<String, dynamic> map,
  );

  //study系
  @POST("/study/japanese")
  Future<SendJapaneseResponse> sendJapanese(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/english")
  Future<SendEnglishResponse> sendEnglish(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/translation")
  Future<TranslateResponse> translate(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/topic/submit_done_topic")
  Future<SubmitDoneTopicResponse> submitDoneTopics(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/topic/done_topic")
  Future<List<String>> getDoneTopicIds(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/topic/all")
  Future<List<String>> getAllTopicId(
    @Body() Map<String, dynamic> map,
  );

  @POST("/study/record/submit_dashboard")
  Future<SubmitDashboardResponse> submitDashboard(
    @Body() Map<String, dynamic> map,
  );

  @POST("/subscription/purchased_heart")
  Future<GetPurchasedHeartResponse> getPurchasedHeart(
    @Body() Map<String, dynamic> map,
  );

  @POST("/subscription/purchase_heart")
  Future<PurchaseHeartResponse> purchaseHeart(
    @Body() Map<String, dynamic> map,
  );

  //category系
  @POST("/category/detail")
  Future<Category> getCategoryDetail(
    @Body() Map<String, dynamic> map,
  );

  @POST("/category/list")
  Future<GetCategoryListResponse> getCategoryList(
    @Body() Map<String, dynamic> map,
  );

  //today系
  @POST("/today/get_topic")
  Future<GetTodayTopicResponse> getTodayTopic(
    @Body() Map<String, dynamic> map,
  );

  @POST("/today/get_result")
  Future<GetTodayTopicResponse> getResult(
    @Body() Map<String, dynamic> map,
  );

  @POST("/today/submit_result")
  Future<SubmitTodayTopicResultResponse> submitTodayTopicResult(
    @Body() Map<String, dynamic> map,
  );

  @POST("/today/list_result")
  Future<ListTodayTopicResultResponse> listTodayTopicResult(
    @Body() Map<String, dynamic> map,
  );
}
