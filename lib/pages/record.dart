import 'package:englister/components/card/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ログインすると学習記録を閲覧できます"),
    );
  }
}
