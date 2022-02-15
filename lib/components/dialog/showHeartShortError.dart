import 'package:flutter/material.dart';

Future<void> showHeartShortError(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('ハートが不足しています'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('さらに問題を解く場合はハートをご購入ください'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Go to shop'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/plan");
            },
          ),
        ],
      );
    },
  );
}
