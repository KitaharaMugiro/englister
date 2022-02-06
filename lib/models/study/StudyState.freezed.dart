// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'StudyState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StudyStateTearOff {
  const _$StudyStateTearOff();

  _StudyState call(
      {required bool needRetry,
      required String japanese,
      required String english,
      required String translation,
      required Question activeQuestion}) {
    return _StudyState(
      needRetry: needRetry,
      japanese: japanese,
      english: english,
      translation: translation,
      activeQuestion: activeQuestion,
    );
  }
}

/// @nodoc
const $StudyState = _$StudyStateTearOff();

/// @nodoc
mixin _$StudyState {
  bool get needRetry => throw _privateConstructorUsedError;
  String get japanese => throw _privateConstructorUsedError;
  String get english => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  Question get activeQuestion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudyStateCopyWith<StudyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyStateCopyWith<$Res> {
  factory $StudyStateCopyWith(
          StudyState value, $Res Function(StudyState) then) =
      _$StudyStateCopyWithImpl<$Res>;
  $Res call(
      {bool needRetry,
      String japanese,
      String english,
      String translation,
      Question activeQuestion});

  $QuestionCopyWith<$Res> get activeQuestion;
}

/// @nodoc
class _$StudyStateCopyWithImpl<$Res> implements $StudyStateCopyWith<$Res> {
  _$StudyStateCopyWithImpl(this._value, this._then);

  final StudyState _value;
  // ignore: unused_field
  final $Res Function(StudyState) _then;

  @override
  $Res call({
    Object? needRetry = freezed,
    Object? japanese = freezed,
    Object? english = freezed,
    Object? translation = freezed,
    Object? activeQuestion = freezed,
  }) {
    return _then(_value.copyWith(
      needRetry: needRetry == freezed
          ? _value.needRetry
          : needRetry // ignore: cast_nullable_to_non_nullable
              as bool,
      japanese: japanese == freezed
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: english == freezed
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      translation: translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      activeQuestion: activeQuestion == freezed
          ? _value.activeQuestion
          : activeQuestion // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  @override
  $QuestionCopyWith<$Res> get activeQuestion {
    return $QuestionCopyWith<$Res>(_value.activeQuestion, (value) {
      return _then(_value.copyWith(activeQuestion: value));
    });
  }
}

/// @nodoc
abstract class _$StudyStateCopyWith<$Res> implements $StudyStateCopyWith<$Res> {
  factory _$StudyStateCopyWith(
          _StudyState value, $Res Function(_StudyState) then) =
      __$StudyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool needRetry,
      String japanese,
      String english,
      String translation,
      Question activeQuestion});

  @override
  $QuestionCopyWith<$Res> get activeQuestion;
}

/// @nodoc
class __$StudyStateCopyWithImpl<$Res> extends _$StudyStateCopyWithImpl<$Res>
    implements _$StudyStateCopyWith<$Res> {
  __$StudyStateCopyWithImpl(
      _StudyState _value, $Res Function(_StudyState) _then)
      : super(_value, (v) => _then(v as _StudyState));

  @override
  _StudyState get _value => super._value as _StudyState;

  @override
  $Res call({
    Object? needRetry = freezed,
    Object? japanese = freezed,
    Object? english = freezed,
    Object? translation = freezed,
    Object? activeQuestion = freezed,
  }) {
    return _then(_StudyState(
      needRetry: needRetry == freezed
          ? _value.needRetry
          : needRetry // ignore: cast_nullable_to_non_nullable
              as bool,
      japanese: japanese == freezed
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as String,
      english: english == freezed
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      translation: translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      activeQuestion: activeQuestion == freezed
          ? _value.activeQuestion
          : activeQuestion // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }
}

/// @nodoc

class _$_StudyState implements _StudyState {
  const _$_StudyState(
      {required this.needRetry,
      required this.japanese,
      required this.english,
      required this.translation,
      required this.activeQuestion});

  @override
  final bool needRetry;
  @override
  final String japanese;
  @override
  final String english;
  @override
  final String translation;
  @override
  final Question activeQuestion;

  @override
  String toString() {
    return 'StudyState(needRetry: $needRetry, japanese: $japanese, english: $english, translation: $translation, activeQuestion: $activeQuestion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StudyState &&
            const DeepCollectionEquality().equals(other.needRetry, needRetry) &&
            const DeepCollectionEquality().equals(other.japanese, japanese) &&
            const DeepCollectionEquality().equals(other.english, english) &&
            const DeepCollectionEquality()
                .equals(other.translation, translation) &&
            const DeepCollectionEquality()
                .equals(other.activeQuestion, activeQuestion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(needRetry),
      const DeepCollectionEquality().hash(japanese),
      const DeepCollectionEquality().hash(english),
      const DeepCollectionEquality().hash(translation),
      const DeepCollectionEquality().hash(activeQuestion));

  @JsonKey(ignore: true)
  @override
  _$StudyStateCopyWith<_StudyState> get copyWith =>
      __$StudyStateCopyWithImpl<_StudyState>(this, _$identity);
}

abstract class _StudyState implements StudyState {
  const factory _StudyState(
      {required bool needRetry,
      required String japanese,
      required String english,
      required String translation,
      required Question activeQuestion}) = _$_StudyState;

  @override
  bool get needRetry;
  @override
  String get japanese;
  @override
  String get english;
  @override
  String get translation;
  @override
  Question get activeQuestion;
  @override
  @JsonKey(ignore: true)
  _$StudyStateCopyWith<_StudyState> get copyWith =>
      throw _privateConstructorUsedError;
}
