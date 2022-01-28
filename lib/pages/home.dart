import 'package:englister/components/card/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _url = "https://english.yunomy.com/q/free";

  void _launchURL() async {
    print(_url);
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Container(
        height: 20,
      ),
      Text("コンテンツ一覧", style: Typography.dense2018.headline4),
      Padding(padding: EdgeInsets.all(20), child: CategoryCard(_launchURL))
    ]));
  }
}
