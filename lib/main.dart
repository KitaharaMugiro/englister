import 'dart:async';

import 'package:englister/models/riverpod/SettingRiverpod.dart';
import 'package:englister/pages/plan.dart';
import 'package:englister/pages/top.dart';
import 'package:englister/route/index.dart';
import 'package:englister/route/setting.dart';
import 'package:englister/route/study.dart';
import 'package:englister/route/phraseStudy.dart';
import 'package:englister/route/studyStart.dart';
import 'package:englister/route/todayStudy.dart';
import 'package:englister/route/top/Outline.dart';
import 'package:englister/route/top/start.dart';
import 'package:englister/route/writeDiary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'api/graphql/client_provider.dart';
import 'models/localstorage/LocalStorageHelper.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final started = useState<bool>(false);
    final isLoading = useState<bool>(false);

    Future<void> _getStarted() async {
      isLoading.value = true;
      final res = await LocalStorageHelper.getStarted();
      isLoading.value = false;
      if (res == null) {
        return;
      }
      started.value = true;
    }

    useEffect(() {
      _getStarted();
      return null;
    }, []);

    var themeMode = ref.watch(SettingProvider);

    return ClientProvider(
        child: MaterialApp(
      title: 'Englister',
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark
          ? ThemeData(brightness: Brightness.dark, useMaterial3: true)
          : ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme: themeMode == ThemeMode.light
          ? ThemeData(brightness: Brightness.light, useMaterial3: true)
          : ThemeData(brightness: Brightness.dark, useMaterial3: true),
      builder: EasyLoading.init(),
      home: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (BuildContext context, Widget? child) {
            if (isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (started.value) {
              return const IndexPage(title: 'Englister');
            }
            return const TopPage();
          }),
      routes: {
        '/index': (BuildContext context) => const IndexPage(title: 'Englister'),
        '/settings': (BuildContext context) => SettingPage(),
        '/study': (BuildContext context) => const StudyPage(),
        '/study/start': (BuildContext context) => StudyStartPage(),
        '/plan': (BuildContext context) => const PlanPage(),
        '/today': (BuildContext context) => const TodayStudyPage(),
        '/phrase/study': (BuildContext context) => const PhraseStudyPage(),
        '/top/outline': (BuildContext context) => const OutlinePage(),
        '/top/start': (BuildContext context) => const StartPage(),
        '/diary/write': (BuildContext context) => const WriteDiaryPage(),
      },
    ));
  }
}
