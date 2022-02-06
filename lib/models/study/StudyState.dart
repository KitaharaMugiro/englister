import 'package:freezed_annotation/freezed_annotation.dart';

import 'Question.dart';

part 'StudyState.freezed.dart';

@freezed
abstract class StudyState implements _$StudyState {
  const factory StudyState(
      {required bool needRetry,
      required String japanese,
      required String english,
      required String translation,
      required Question activeQuestion}) = _StudyState;
}
