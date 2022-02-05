import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:englister/components/signin/LoginButton.dart';
import 'package:englister/components/signin/SigninDialog.dart';
import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:englister/pages/home.dart';
import 'package:englister/pages/phrase.dart';
import 'package:englister/pages/record.dart';
import 'package:englister/route/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'amplifyconfiguration.dart';
import 'api/graphql/client_provider.dart';
import 'api/rest/rest_client.dart';
import 'components/drawer/MyDrawer.dart';
import 'components/navigation/MyBottomNavigationBar.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
        child: MaterialApp(
      title: 'Englister',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(title: 'Englister'),
      routes: {'/settings': (BuildContext context) => new SettingPage()},
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

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // Add the following line to add Auth plugin to your app.
      await Amplify.addPlugin(AmplifyAuthCognito());

      // call Amplify.configure to use the initialized categories in your app
      //TODO: 手動でSignInRedirectURIをenglister://に修正してる。まじ！？
      await Amplify.configure(amplifyconfig);

      //ここでログイン状況を確認したい
      var userNotifier = ref.read(userProvider.notifier);
      userNotifier.setUser(await AuthService.getCurrentUserAttribute());
    } on Exception catch (e) {
      print('An error occurred configuring Amplify: $e');
    }
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
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
        actions: [
          Padding(padding: const EdgeInsets.all(10), child: LoginButton())
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(_selectedIndex, _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: Colors.grey[50],
    );
    return scaffold;
  }
}
