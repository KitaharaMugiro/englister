import 'package:englister/api/rest/response_type/dashboard.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl: "https://7m3mn2chy9.execute-api.ap-northeast-1.amazonaws.com/dev")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/study/record/list_dashboard")
  Future<List<Dashboard>> getDashboard(
    @Body() Map<String, dynamic> map,
  );
}
