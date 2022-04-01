import 'package:englister/components/phrase/PhraseList.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhrasePage extends HookConsumerWidget {
  const PhrasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);

    if (user.sub == null) {
      return const Center(
        child: Text("ログインすると覚えたいフレーズを登録できるようになります"),
      );
    }

    return const PhraseList();
  }
}
