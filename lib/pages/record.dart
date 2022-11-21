import 'package:dio/dio.dart';
import 'package:englister/api/rest/response_type/dashboard.dart';
import 'package:englister/api/rest/rest_client.dart';
import 'package:englister/components/record/StudyRecordCard.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class RecordPage extends HookConsumerWidget {
  const RecordPage({Key? key}) : super(key: key);

  //TODO: RESTの処理は流石に隠蔽すべき
  Future<List<Dashboard>> getDashboard() async {
    final dio = Dio(); // Provide a dio instance
    //dio.interceptors.add(CurlLoggerDioInterceptor());
    final client = RestClient(dio);
    try {
      var it = await client.getDashboard({
        "data": {"userId": "USER_ID_FOR_MOBILE"},
        "headers": await AuthService.getHeader()
      });
      return it;
    } catch (e) {
      print("api error");
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var records = useState<List<Dashboard>>([]);
    var isLoading = useState(false);
    var user = ref.watch(userProvider);

    useEffect(() {
      isLoading.value = true;
      getDashboard().then((value) {
        records.value = value;
        isLoading.value = false;
      });
      return null;
    }, [user]);

    if (user.sub == null) {
      return const Center(
        child: Text("ログインすると学習記録を閲覧できます"),
      );
    }
    if (isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    var contentWidgets = <Widget>[];
    contentWidgets.add(Text("学習履歴", style: Typography.dense2018.headline5));
    contentWidgets.add(const SizedBox(height: 20));

    for (var record in records.value) {
      contentWidgets.add(StudyRecordCard(
        key: Key(record.studySessionId ?? ""),
        firstEnglish: record.firstEnglish,
        translation: record.translation,
        questionText: record.questionTitle,
        questionDescription: record.questionDescription,
        japanese: record.japanese,
      ));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: contentWidgets,
    );
  }
}
