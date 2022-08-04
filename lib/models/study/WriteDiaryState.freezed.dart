// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'WriteDiaryState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WriteDiaryStateTearOff {
  const _$WriteDiaryStateTearOff();

  _WriteDiaryState call(
      {required bool needRetry,
      required String japanese,
      required String english,
      required String translation}) {
    return _WriteDiaryState(
      needRetry: needRetry,
      japanese: japanese,
      english: english,
      translation: translation,
    );
  }
}

/// @nodoc
const $WriteDiaryState = _$WriteDiaryStateTearOff();

/// @nodoc
mixin _$WriteDiaryState {
  bool get needRetry => throw _privateConstructorUsedError;
  String get japanese => throw _privateConstructorUsedError;
  String get english => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WriteDiaryStateCopyWith<WriteDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteDiaryStateCopyWith<$Res> {
  factory $WriteDiaryStateCopyWith(
          WriteDiaryState value, $Res Function(WriteDiaryState) then) =
      _$WriteDiaryStateCopyWithImpl<$Res>;
  $Res call(
      {bool needRetry, String japanese, String english, String translation});
}

/// @nodoc
class _$WriteDiaryStateCopyWithImpl<$Res>
    implements $WriteDiaryStateCopyWith<$Res> {
  _$WriteDiaryStateCopyWithImpl(this._value, this._then);

  final WriteDiaryState _value;
  // ignore: unused_field
  final $Res Function(WriteDiaryState) _then;

  @override
  $Res call({
    Object? needRetry = freezed,
    Object? japanese = freezed,
    Object? english = freezed,
    Object? translation = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$WriteDiaryStateCopyWith<$Res>
    implements $WriteDiaryStateCopyWith<$Res> {
  factory _$WriteDiaryStateCopyWith(
          _WriteDiaryState value, $Res Function(_WriteDiaryState) then) =
      __$WriteDiaryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool needRetry, String japanese, String english, String translation});
}

/// @nodoc
class __$WriteDiaryStateCopyWithImpl<$Res>
    extends _$WriteDiaryStateCopyWithImpl<$Res>
    implements _$WriteDiaryStateCopyWith<$Res> {
  __$WriteDiaryStateCopyWithImpl(
      _WriteDiaryState _value, $Res Function(_WriteDiaryState) _then)
      : super(_value, (v) => _then(v as _WriteDiaryState));

  @override
  _WriteDiaryState get _value => super._value as _WriteDiaryState;

  @override
  $Res call({
    Object? needRetry = freezed,
    Object? japanese = freezed,
    Object? english = freezed,
    Object? translation = freezed,
  }) {
    return _then(_WriteDiaryState(
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
    ));
  }
}

/// @nodoc

class _$_WriteDiaryState implements _WriteDiaryState {
  const _$_WriteDiaryState(
      {required this.needRetry,
      required this.japanese,
      required this.english,
      required this.translation});

  @override
  final bool needRetry;
  @override
  final String japanese;
  @override
  final String english;
  @override
  final String translation;

  @override
  String toString() {
    return 'WriteDiaryState(needRetry: $needRetry, japanese: $japanese, english: $english, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WriteDiaryState &&
            const DeepCollectionEquality().equals(other.needRetry, needRetry) &&
            const DeepCollectionEquality().equals(other.japanese, japanese) &&
            const DeepCollectionEquality().equals(other.english, english) &&
            const DeepCollectionEquality()
                .equals(other.translation, translation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(needRetry),
      const DeepCollectionEquality().hash(japanese),
      const DeepCollectionEquality().hash(english),
      const DeepCollectionEquality().hash(translation));

  @JsonKey(ignore: true)
  @override
  _$WriteDiaryStateCopyWith<_WriteDiaryState> get copyWith =>
      __$WriteDiaryStateCopyWithImpl<_WriteDiaryState>(this, _$identity);
}

abstract class _WriteDiaryState implements WriteDiaryState {
  const factory _WriteDiaryState(
      {required bool needRetry,
      required String japanese,
      required String english,
      required String translation}) = _$_WriteDiaryState;

  @override
  bool get needRetry;
  @override
  String get japanese;
  @override
  String get english;
  @override
  String get translation;
  @override
  @JsonKey(ignore: true)
  _$WriteDiaryStateCopyWith<_WriteDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
