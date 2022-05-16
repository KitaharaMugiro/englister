import 'dart:async';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:englister/components/signin/LoginButton.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/riverpod/SettingRiverpod.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:englister/pages/home.dart';
import 'package:englister/pages/phrase.dart';
import 'package:englister/pages/plan.dart';
import 'package:englister/pages/record.dart';
import 'package:englister/pages/top.dart';
import 'package:englister/route/index.dart';
import 'package:englister/route/setting.dart';
import 'package:englister/route/study.dart';
import 'package:englister/route/phraseStudy.dart';
import 'package:englister/route/studyStart.dart';
import 'package:englister/route/todayStudy.dart';
import 'package:englister/route/top/Outline.dart';
import 'package:englister/route/top/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'amplifyconfiguration.dart';
import 'api/graphql/client_provider.dart';
import 'api/rest/UserApi.dart';
import 'components/drawer/MyDrawer.dart';
import 'components/navigation/MyBottomNavigationBar.dart';
import 'models/localstorage/LocalStorageHelper.dart';
import 'models/riverpod/PhraseRiverpod.dart';
import 'models/subscriptions/listenToPurchaseUpdated.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final started = useState<bool>(false);
    Future<void> _getStarted() async {
      final res = await LocalStorageHelper.getStarted();
      if (res == null) {
        return;
      }
      started.value = true;
    }

    useEffect(() {
      _getStarted();
    }, []);

    var themeMode = ref.watch(SettingProvider);

    return ClientProvider(
        child: MaterialApp(
      title: 'Englister',
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light(),
      darkTheme:
          themeMode == ThemeMode.light ? ThemeData.light() : ThemeData.dark(),
      builder: EasyLoading.init(),
      home:
          started.value ? const IndexPage(title: 'Englister') : const TopPage(),
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
      },
    ));
  }
}
