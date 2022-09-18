import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final queryDocument = gql(r'''
  mutation CreateDiary($userInputText: String!, $protected: Boolean! , $translatedEnglish: String!, $translatedJapanese: String, $userInputEnglish: String!) {
    insert_englister_Diary_one(object: {userInputText: $userInputText, protected: $protected, translatedEnglish: $translatedEnglish, translatedJapanese: $translatedJapanese, userInputEnglish: $userInputEnglish}) {
      id
      protected
      translatedEnglish
      userInputEnglish
      userInputText
      updatedAt
      createdAt
      createdBy
      translatedJapanese
    }
  }
''');

class WriteDiaryStepper extends StatelessWidget {
  const WriteDiaryStepper(
      {Key? key,
      required this.steps,
      required this.activeStep,
      required this.renderButtons})
      : super(key: key);
  final List<Step> steps;
  final int activeStep;
  final List<Widget> Function() renderButtons;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      key: Key("write-diary-key-" + this.steps.length.toString()),
      currentStep: this.activeStep,
      type: StepperType.horizontal,
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: this.renderButtons(),
        );
      },
      steps: this.steps,
    );
  }
}
