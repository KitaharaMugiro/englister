import 'package:englister/models/localstorage/LocalStorageHelper.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayStudyTop extends HookConsumerWidget {
  TodayStudyTop({Key? key, String? this.errorMessage}) : super(key: key);
  String? errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameNotifier = ref.watch(nameProvider.notifier);
    final _textEditingController = useTextEditingController();

    useEffect(() {
      LocalStorageHelper.getTodayName().then((name) {
        nameNotifier.set(name);
        _textEditingController.text = name;
      });
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('お名前を入力してください',
            style: Typography.dense2018.headline5?.apply(fontWeightDelta: 10)),
        const SizedBox(
          height: 15,
        ),
        TextField(
          autofocus: true,
          maxLines: 1,
          onChanged: (value) {
            nameNotifier.set(value);
          },
          controller: _textEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'お名前を入力してください',
              errorText: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
