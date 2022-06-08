import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OutlinePage extends HookConsumerWidget {
  const OutlinePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(3, 41, 68, 1),
          automaticallyImplyLeading: true,
          elevation: 0),
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          color: const Color.fromRGBO(3, 41, 68, 1),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Englisterの概要',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'AI翻訳(DeepL)を先生役に、英作文の練習や添削ができるサービスです。',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'こんな効果があります',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "言いたいことが英語で言えるようになる！",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white70,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          "こういう表現があったか〜という学びが得られる",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white70,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          "語彙力が効果的にアップする",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white70,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          "AIが自分の英語を採点してくれる",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              child: Text(
                '次へ',
                style: TextStyle(
                  color: const Color.fromRGBO(3, 41, 68, 1),
                  fontSize: 19.sp,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/top/start');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                primary: Colors.white,
                minimumSize: const Size(double.maxFinite, 60),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
