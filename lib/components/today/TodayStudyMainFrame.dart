import 'package:englister/components/today/TodayStudyStepper.dart';
import 'package:flutter/material.dart';

class TodayStudyMainFrame extends StatelessWidget {
  const TodayStudyMainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: TodayStudyStepper());
  }
}
