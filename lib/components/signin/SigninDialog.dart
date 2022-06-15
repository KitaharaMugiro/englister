import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> openSigninDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SigninDialog();
      });
}

class SigninDialog extends HookConsumerWidget {
  const SigninDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userNotifier = ref.watch(userProvider.notifier);

    return SimpleDialog(
      insetPadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.all(30),
      title: Text(
        "Englister",
        textAlign: TextAlign.center,
        style: Typography.englishLike2018.headline3?.apply(fontWeightDelta: 3),
      ),
      children: [
        Text("EnglisterはAI英語添削アプリです。あなたの英語で生きる力を飛躍的に伸ばします。",
            style: Typography.dense2018.bodyText1),
        const SizedBox(height: 30),
        Container(
          child: SignInButton(
            Buttons.Google,
            padding: const EdgeInsets.all(5),
            elevation: 5,
            onPressed: () async {
              try {
                await AuthService.signInWithGoogle(context);
              } catch (e) {
                print(e);
              }

              userNotifier.set(await AuthService.getCurrentUserAttribute());
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          child: SignInButton(
            Buttons.Facebook,
            padding: const EdgeInsets.all(12),
            elevation: 5,
            onPressed: () async {
              try {
                await AuthService.signInWithFacebook(context);
              } catch (e) {
                print(e);
              }

              userNotifier.set(await AuthService.getCurrentUserAttribute());
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          child: SignInButton(
            Buttons.Apple,
            padding: const EdgeInsets.all(12),
            elevation: 5,
            onPressed: () async {
              try {
                await AuthService.signInWithApple(context);
              } catch (e) {
                print(e);
              }
              userNotifier.set(await AuthService.getCurrentUserAttribute());
            },
          ),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        TextButton(
            onPressed: () async {
              try {
                await AuthService.signInWithEmail(context);
              } catch (e) {
                print(e);
              }

              userNotifier.set(await AuthService.getCurrentUserAttribute());
            },
            child: const Text("メールアドレス認証")),
        const SizedBox(height: 20),
        Text("利用規約、プライバシーポリシーに同意した上でログインしてください。",
            style: Typography.dense2018.caption),
      ],
    );
  }
}
