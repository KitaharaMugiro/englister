import 'package:freezed_annotation/freezed_annotation.dart';

part 'Question.freezed.dart';

@freezed
abstract class Question implements _$Question {
  const factory Question(
      {required String topicId,
      required String title,
      required String description}) = _Question;
}
