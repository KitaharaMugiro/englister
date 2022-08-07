import 'package:freezed_annotation/freezed_annotation.dart';

part 'WriteDiaryState.freezed.dart';

@freezed
abstract class WriteDiaryState implements _$WriteDiaryState {
  const factory WriteDiaryState({
    required bool needRetry,
    required String japanese,
    required String english,
    required String translation,
  }) = _WriteDiaryState;
}
