import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickModeButton extends HookConsumerWidget {
  PickModeButton(
      {Key? key,
      required this.value,
      required this.isSelected,
      required this.onClick})
      : super(key: key);
  String value;
  bool isSelected;
  Function onClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: isSelected ? null : () => onClick(),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(55, 50),
        backgroundColor: isSelected ? Colors.grey : Colors.white,
        primary: Colors.black,
        side: const BorderSide(color: Colors.grey, width: 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13))),
        shadowColor: Colors.grey,
        elevation: 2,
      ),
      child: Text(
        value,
        style: TextStyle(
          color: isSelected ? Colors.grey : Colors.black,
          fontSize: 19,
        ),
      ),
    );
  }
}
