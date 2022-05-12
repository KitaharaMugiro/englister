import 'dart:async';

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
import 'package:englister/route/setting.dart';
import 'package:englister/route/study.dart';
import 'package:englister/route/phraseStudy.dart';
import 'package:englister/route/studyStart.dart';
import 'package:englister/route/todayStudy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    var themeMode = ref.watch(SettingProvider);
    return ClientProvider(
        child: MaterialApp(
      title: 'Englister',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(useMaterial3: true),
      theme: themeMode == ThemeMode.dark
          ? ThemeData(brightness: Brightness.dark, useMaterial3: true)
          : ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme:
          themeMode == ThemeMode.light ? ThemeData.light() : ThemeData.dark(),
      builder: EasyLoading.init(),
      home: const IndexPage(title: 'Englister'),
      routes: {
        '/settings': (BuildContext context) => SettingPage(),
        '/study': (BuildContext context) => const StudyPage(),
        '/study/start': (BuildContext context) => StudyStartPage(),
        '/plan': (BuildContext context) => const PlanPage(),
        '/today': (BuildContext context) => const TodayStudyPage(),
        '/phrase/study': (BuildContext context) => const PhraseStudyPage(),
      },
    ));
  }
}

class IndexPage extends ConsumerStatefulWidget {
  const IndexPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ConsumerState<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  //TODO: ここで管理したくない・・
  int _selectedIndex = 0;
  late StreamSubscription<dynamic> _subscription;

  @override
  void initState() {
    super.initState();
    _subscribePurchaseUpdate();
    _configureAmplify();
  }

  void _subscribePurchaseUpdate() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      // The store cannot be reached or accessed. Update the UI accordingly.
      return;
    }
    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
      debugPrint("payment error: $error");
    });
  }

  Future<void> _configureAmplify() async {
    // Add the following line to add Auth plugin to your app.
    await Amplify.addPlugin(AmplifyAuthCognito());

    // call Amplify.configure to use the initialized categories in your app
    //TODO: 手動でSignInRedirectURIをenglister://に修正してる。まじ！？
    // WARN: pushしたらWebサービスのログイン障害に繋がる危険な状態
    await Amplify.configure(amplifyconfig);

    //ここでログイン状況を確認したい
    var userNotifier = ref.read(userProvider.notifier);
    try {
      userNotifier.set(await AuthService.getCurrentUserAttribute());
    } catch (e) {
      print(e);
    }

    await LocalStorageHelper.initializeUserId();
    await UserApi.signin();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecordPage(),
    PhrasePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var phrases = ref.watch(phrasesProvider);

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        titleTextStyle:
            const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        actions: const [
          Padding(padding: EdgeInsets.all(10), child: LoginButton())
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(_selectedIndex, _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: _selectedIndex == 2 && phrases.isNotEmpty
          ? FloatingActionButtonLocation.centerDocked
          : null,
      floatingActionButton: _selectedIndex == 2 && phrases.isNotEmpty
          ? (Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/phrase/study');
                },
                label: const Text('フラッシュカードで覚える'),
                icon: const Icon(Icons.school),
              ),
            ))
          : null,
    );
    return scaffold;
  }
}
