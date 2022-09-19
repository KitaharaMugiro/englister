import 'package:englister/components/diary/WriteDiaryStepper.dart';
import 'package:flutter/material.dart';

class WriteDiaryMainFrame extends StatelessWidget {
  const WriteDiaryMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const WriteDiaryStepper());
  }
}
