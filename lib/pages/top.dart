import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//①Englisterのアイコン＋はじめるボタン(ログインしていたらホームを表示する)
//②Englisterの概要
//③「問題をやってみる」→home・「診断テスト」→todayStudyの２択を用意して画面遷移をする
class TopPage extends HookConsumerWidget {
  const TopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        color: const Color.fromRGBO(3, 41, 68, 1),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 150,
            ),
            SizedBox(
                height: 250,
                width: 250,
                child: Image.asset('assets/images/icon.png')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '自由英作文の練習ができる\nAI添削アプリ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            child: const Text(
              'はじめる',
              style: TextStyle(
                color: Color.fromRGBO(3, 41, 68, 1),
                fontSize: 19,
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size(double.maxFinite, 60),
            ),
          ),
        ),
      ),
    ]);
  }
}
