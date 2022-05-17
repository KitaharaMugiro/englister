import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:englister/amplifyconfiguration.dart';
import 'package:englister/api/rest/UserApi.dart';
import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartPage extends HookConsumerWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toTodayStudy = useState<bool>(false);
    final toHome = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(3, 41, 68, 1),
          automaticallyImplyLeading: true,
          elevation: 0),
      backgroundColor: const Color.fromRGBO(3, 41, 68, 1),
      body: Stack(children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            '早速やってみよう',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.filter_5_outlined,
                    color: Color.fromRGBO(3, 41, 68, 1),
                    size: 60,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RichText(
                      text: TextSpan(
                          text: "英語年齢を診断をしてみませんか？",
                          style: TextStyle(
                              color: toTodayStudy.value
                                  ? Colors.lightBlue
                                  : Colors.black,
                              fontSize: 25),
                          children: <TextSpan>[
                            const TextSpan(text: "\n"),
                            const TextSpan(
                              text: " \n",
                              style: TextStyle(fontSize: 10),
                            ),
                            TextSpan(
                                text: "まずは自分の英語年齢を知ってみましょう！",
                                style: TextStyle(
                                    color: toTodayStudy.value
                                        ? Colors.lightBlue
                                        : Colors.black,
                                    fontSize: 20))
                          ]),
                    ),
                  ),
                  onPressed: () {
                    toTodayStudy.value = true;
                    toHome.value = false;
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 3,
                      color:
                          toTodayStudy.value ? Colors.lightBlue : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    primary: toTodayStudy.value
                        ? Colors.lightBlue.shade50
                        : Colors.white,
                    minimumSize: const Size(double.maxFinite, 60),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.school_outlined,
                    color: Color.fromRGBO(3, 41, 68, 1),
                    size: 60,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RichText(
                      text: TextSpan(
                          text: "英作文のAI添削を試してみませんか？",
                          style: TextStyle(
                              color: toHome.value
                                  ? Colors.lightBlue
                                  : Colors.black,
                              fontSize: 25),
                          children: <InlineSpan>[
                            const TextSpan(text: "\n"),
                            const TextSpan(
                              text: " \n",
                              style: TextStyle(fontSize: 10),
                            ),
                            TextSpan(
                              text: "テーマやシチュエーション別の英作文の練習ができます。",
                              style: TextStyle(
                                  color: toHome.value
                                      ? Colors.lightBlue
                                      : Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                          ]),
                    ),
                  ),
                  onPressed: () {
                    toTodayStudy.value = false;
                    toHome.value = true;
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 3,
                      color: toHome.value
                          ? Colors.lightBlue.shade500
                          : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    primary:
                        toHome.value ? Colors.lightBlue.shade50 : Colors.white,
                    minimumSize: const Size(double.maxFinite, 60),
                  ),
                ),
              ],
            ),
          ),
        ),
        toHome.value || toTodayStudy.value
            ? Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: const Text(
                      '次へ',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 41, 68, 1),
                        fontSize: 19,
                      ),
                    ),
                    onPressed: () async {
                      await LocalStorageHelper.saveStarted();
                      if (toHome.value) {
                        Navigator.pushNamed(context, '/index');
                        return;
                      }
                      if (toTodayStudy.value) {
                        if (!Amplify.isConfigured) {
                          await Amplify.addPlugin(AmplifyAuthCognito());
                          await Amplify.configure(amplifyconfig);
                        }
                        await LocalStorageHelper.initializeUserId();
                        Navigator.pushNamed(context, '/today');
                        return;
                      }
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
              )
            : Container(),
      ]),
    );
  }
}
