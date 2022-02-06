import 'dart:developer';

import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/components/card/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void onTapCard(String category) async {
      EasyLoading.show(status: 'loading...');
      print("onTapCard: $category");
      await StudyApi.studyStart(category);
      Navigator.pushNamed(context, '/study', arguments: category);
      EasyLoading.dismiss();
    }

    return Container(
        child: Column(children: <Widget>[
      Container(
        height: 20,
      ),
      Text("コンテンツ一覧", style: Typography.dense2018.headline4),
      Padding(
          padding: EdgeInsets.all(20),
          child: CategoryCard(
            onTap: onTapCard,
          )),
    ]));
  }
}
