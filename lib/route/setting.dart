import 'package:englister/components/card/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final listItems = [
    {
      "title": "お問い合わせ",
      "url":
          "https://docs.google.com/forms/d/e/1FAIpQLSfpVp24DmJSR5IvLVqy0AuXSt1ZNxyAMxONMSZMEebh2EYqxw/viewform"
    },
    {"title": "利用規約", "url": "https://english.yunomy.com/t/terms_of_service"},
    {
      "title": "プライバシーポリシー",
      "url": "https://english.yunomy.com/t/privacy_policy"
    },
    {"title": "特定商取引法に基づく表記", "url": "https://english.yunomy.com/t/legal"},
  ];

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  List<Widget> _makeWidgets() {
    var contentWidgets = <Widget>[];

    for (var item in listItems) {
      contentWidgets.add(Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade300))),
        child: ListTile(
          title: Text(item["title"] ?? ""),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            _launchURL(item["url"] ?? "");
          },
        ),
      ));
    }

    return contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("設定"),
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView(children: _makeWidgets())));
  }
}
