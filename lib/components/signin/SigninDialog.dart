import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

Future<void> openSigninDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SigninDialog();
      });
}

class SigninDialog extends StatelessWidget {
  const SigninDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SimpleDialog(
        insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.all(30),
        title: Text(
          "Englister",
          textAlign: TextAlign.center,
          style:
              Typography.englishLike2018.headline3?.apply(fontWeightDelta: 3),
        ),
        children: [
          Text("EnglisterはAI英語添削アプリです。あなたの英語で生きる力を飛躍的に伸ばします。",
              style: Typography.dense2018.bodyText1),
          SizedBox(height: 30),
          Container(
            child: SignInButton(
              Buttons.Google,
              padding: EdgeInsets.all(5),
              elevation: 5,
              onPressed: () async {
                try {
                  var res = await Amplify.Auth.signInWithWebUI(
                      provider: AuthProvider.google);
                } on AmplifyException catch (e) {
                  print(e.message);
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: SignInButton(
              Buttons.Facebook,
              padding: EdgeInsets.all(12),
              elevation: 5,
              onPressed: () async {
                try {
                  var res = await Amplify.Auth.signInWithWebUI(
                      provider: AuthProvider.facebook);
                } on AmplifyException catch (e) {
                  print(e.message);
                }
              },
            ),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          TextButton(
              onPressed: () async {
                try {
                  var res = await Amplify.Auth.signInWithWebUI();
                } on AmplifyException catch (e) {
                  print(e.message);
                }
              },
              child: Text("メールアドレス認証")),
          SizedBox(height: 20),
          Text("利用規約、プライバシーポリシーに同意した上でログインしてください。",
              style: Typography.dense2018.caption),
        ],
      ),
    );
  }
}
