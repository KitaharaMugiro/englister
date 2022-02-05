import 'package:englister/components/study/main/StudyStepper.dart';
import 'package:flutter/material.dart';

class StudyMainFrame extends StatelessWidget {
  const StudyMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: StudyStepper());
  }
}
