import 'package:englister/components/card/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhrasePage extends StatefulWidget {
  const PhrasePage({Key? key}) : super(key: key);

  @override
  _PhrasePageState createState() => _PhrasePageState();
}

class _PhrasePageState extends State<PhrasePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ログインすると覚えたいフレーズを登録できるようになります"),
    );
  }
}
