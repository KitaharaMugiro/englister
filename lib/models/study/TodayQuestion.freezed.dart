// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'TodayQuestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodayQuestion _$TodayQuestionFromJson(Map<String, dynamic> json) {
  return _TodayQuestion.fromJson(json);
}

/// @nodoc
class _$TodayQuestionTearOff {
  const _$TodayQuestionTearOff();

  _TodayQuestion call(
      {@JsonKey(name: 'title') required String title,
      @JsonKey(name: 'todayTopicId') required String todayTopicId,
      @JsonKey(name: 'topicId') required String topicId,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'categorySlug') required String rescategorySlugultId}) {
    return _TodayQuestion(
      title: title,
      todayTopicId: todayTopicId,
      topicId: topicId,
      description: description,
      rescategorySlugultId: rescategorySlugultId,
    );
  }

  TodayQuestion fromJson(Map<String, Object?> json) {
    return TodayQuestion.fromJson(json);
  }
}

/// @nodoc
const $TodayQuestion = _$TodayQuestionTearOff();

/// @nodoc
mixin _$TodayQuestion {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'todayTopicId')
  String get todayTopicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'topicId')
  String get topicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'categorySlug')
  String get rescategorySlugultId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayQuestionCopyWith<TodayQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayQuestionCopyWith<$Res> {
  factory $TodayQuestionCopyWith(
          TodayQuestion value, $Res Function(TodayQuestion) then) =
      _$TodayQuestionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'todayTopicId') String todayTopicId,
      @JsonKey(name: 'topicId') String topicId,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'categorySlug') String rescategorySlugultId});
}

/// @nodoc
class _$TodayQuestionCopyWithImpl<$Res>
    implements $TodayQuestionCopyWith<$Res> {
  _$TodayQuestionCopyWithImpl(this._value, this._then);

  final TodayQuestion _value;
  // ignore: unused_field
  final $Res Function(TodayQuestion) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? todayTopicId = freezed,
    Object? topicId = freezed,
    Object? description = freezed,
    Object? rescategorySlugultId = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      todayTopicId: todayTopicId == freezed
          ? _value.todayTopicId
          : todayTopicId // ignore: cast_nullable_to_non_nullable
              as String,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rescategorySlugultId: rescategorySlugultId == freezed
          ? _value.rescategorySlugultId
          : rescategorySlugultId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TodayQuestionCopyWith<$Res>
    implements $TodayQuestionCopyWith<$Res> {
  factory _$TodayQuestionCopyWith(
          _TodayQuestion value, $Res Function(_TodayQuestion) then) =
      __$TodayQuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'todayTopicId') String todayTopicId,
      @JsonKey(name: 'topicId') String topicId,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'categorySlug') String rescategorySlugultId});
}

/// @nodoc
class __$TodayQuestionCopyWithImpl<$Res>
    extends _$TodayQuestionCopyWithImpl<$Res>
    implements _$TodayQuestionCopyWith<$Res> {
  __$TodayQuestionCopyWithImpl(
      _TodayQuestion _value, $Res Function(_TodayQuestion) _then)
      : super(_value, (v) => _then(v as _TodayQuestion));

  @override
  _TodayQuestion get _value => super._value as _TodayQuestion;

  @override
  $Res call({
    Object? title = freezed,
    Object? todayTopicId = freezed,
    Object? topicId = freezed,
    Object? description = freezed,
    Object? rescategorySlugultId = freezed,
  }) {
    return _then(_TodayQuestion(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      todayTopicId: todayTopicId == freezed
          ? _value.todayTopicId
          : todayTopicId // ignore: cast_nullable_to_non_nullable
              as String,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rescategorySlugultId: rescategorySlugultId == freezed
          ? _value.rescategorySlugultId
          : rescategorySlugultId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodayQuestion implements _TodayQuestion {
  const _$_TodayQuestion(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'todayTopicId') required this.todayTopicId,
      @JsonKey(name: 'topicId') required this.topicId,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'categorySlug') required this.rescategorySlugultId});

  factory _$_TodayQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_TodayQuestionFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'todayTopicId')
  final String todayTopicId;
  @override
  @JsonKey(name: 'topicId')
  final String topicId;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'categorySlug')
  final String rescategorySlugultId;

  @override
  String toString() {
    return 'TodayQuestion(title: $title, todayTopicId: $todayTopicId, topicId: $topicId, description: $description, rescategorySlugultId: $rescategorySlugultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodayQuestion &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.todayTopicId, todayTopicId) &&
            const DeepCollectionEquality().equals(other.topicId, topicId) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.rescategorySlugultId, rescategorySlugultId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(todayTopicId),
      const DeepCollectionEquality().hash(topicId),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(rescategorySlugultId));

  @JsonKey(ignore: true)
  @override
  _$TodayQuestionCopyWith<_TodayQuestion> get copyWith =>
      __$TodayQuestionCopyWithImpl<_TodayQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodayQuestionToJson(this);
  }
}

abstract class _TodayQuestion implements TodayQuestion {
  const factory _TodayQuestion(
      {@JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'todayTopicId')
          required String todayTopicId,
      @JsonKey(name: 'topicId')
          required String topicId,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'categorySlug')
          required String rescategorySlugultId}) = _$_TodayQuestion;

  factory _TodayQuestion.fromJson(Map<String, dynamic> json) =
      _$_TodayQuestion.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'todayTopicId')
  String get todayTopicId;
  @override
  @JsonKey(name: 'topicId')
  String get topicId;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'categorySlug')
  String get rescategorySlugultId;
  @override
  @JsonKey(ignore: true)
  _$TodayQuestionCopyWith<_TodayQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
