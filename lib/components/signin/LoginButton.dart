import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'SigninDialog.dart';

class LoginButton extends HookConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  void _onPressedLogin(BuildContext context) async {
    await openSigninDialog(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (user.sub != null) {
      return const Text('');
    }

    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
        primary: Theme.of(context).toggleableActiveColor,
      ),
      onPressed: () {
        _onPressedLogin(context);
      },
      child: Text('ログイン',
          style: TextStyle(
            fontSize: 17,
            color: Theme.of(context).cardColor,
          )),
    ));
  }
}
