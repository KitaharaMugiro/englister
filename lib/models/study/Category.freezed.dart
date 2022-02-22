// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

  _Category call(
      {@JsonKey(name: 'categorySlug') required String categorySlug,
      @JsonKey(name: 'categoryName') required String categoryName,
      @JsonKey(name: 'categoryDescription') required String categoryDescription,
      @JsonKey(name: 'categoryImageUrl') required String categoryImageUrl}) {
    return _Category(
      categorySlug: categorySlug,
      categoryName: categoryName,
      categoryDescription: categoryDescription,
      categoryImageUrl: categoryImageUrl,
    );
  }

  Category fromJson(Map<String, Object?> json) {
    return Category.fromJson(json);
  }
}

/// @nodoc
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  @JsonKey(name: 'categorySlug')
  String get categorySlug => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryName')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryDescription')
  String get categoryDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryImageUrl')
  String get categoryImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'categorySlug') String categorySlug,
      @JsonKey(name: 'categoryName') String categoryName,
      @JsonKey(name: 'categoryDescription') String categoryDescription,
      @JsonKey(name: 'categoryImageUrl') String categoryImageUrl});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? categorySlug = freezed,
    Object? categoryName = freezed,
    Object? categoryDescription = freezed,
    Object? categoryImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      categorySlug: categorySlug == freezed
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryDescription: categoryDescription == freezed
          ? _value.categoryDescription
          : categoryDescription // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImageUrl: categoryImageUrl == freezed
          ? _value.categoryImageUrl
          : categoryImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) then) =
      __$CategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'categorySlug') String categorySlug,
      @JsonKey(name: 'categoryName') String categoryName,
      @JsonKey(name: 'categoryDescription') String categoryDescription,
      @JsonKey(name: 'categoryImageUrl') String categoryImageUrl});
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(_Category _value, $Res Function(_Category) _then)
      : super(_value, (v) => _then(v as _Category));

  @override
  _Category get _value => super._value as _Category;

  @override
  $Res call({
    Object? categorySlug = freezed,
    Object? categoryName = freezed,
    Object? categoryDescription = freezed,
    Object? categoryImageUrl = freezed,
  }) {
    return _then(_Category(
      categorySlug: categorySlug == freezed
          ? _value.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryDescription: categoryDescription == freezed
          ? _value.categoryDescription
          : categoryDescription // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImageUrl: categoryImageUrl == freezed
          ? _value.categoryImageUrl
          : categoryImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(
      {@JsonKey(name: 'categorySlug') required this.categorySlug,
      @JsonKey(name: 'categoryName') required this.categoryName,
      @JsonKey(name: 'categoryDescription') required this.categoryDescription,
      @JsonKey(name: 'categoryImageUrl') required this.categoryImageUrl});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  @JsonKey(name: 'categorySlug')
  final String categorySlug;
  @override
  @JsonKey(name: 'categoryName')
  final String categoryName;
  @override
  @JsonKey(name: 'categoryDescription')
  final String categoryDescription;
  @override
  @JsonKey(name: 'categoryImageUrl')
  final String categoryImageUrl;

  @override
  String toString() {
    return 'Category(categorySlug: $categorySlug, categoryName: $categoryName, categoryDescription: $categoryDescription, categoryImageUrl: $categoryImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Category &&
            const DeepCollectionEquality()
                .equals(other.categorySlug, categorySlug) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality()
                .equals(other.categoryDescription, categoryDescription) &&
            const DeepCollectionEquality()
                .equals(other.categoryImageUrl, categoryImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categorySlug),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(categoryDescription),
      const DeepCollectionEquality().hash(categoryImageUrl));

  @JsonKey(ignore: true)
  @override
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: 'categorySlug')
          required String categorySlug,
      @JsonKey(name: 'categoryName')
          required String categoryName,
      @JsonKey(name: 'categoryDescription')
          required String categoryDescription,
      @JsonKey(name: 'categoryImageUrl')
          required String categoryImageUrl}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  @JsonKey(name: 'categorySlug')
  String get categorySlug;
  @override
  @JsonKey(name: 'categoryName')
  String get categoryName;
  @override
  @JsonKey(name: 'categoryDescription')
  String get categoryDescription;
  @override
  @JsonKey(name: 'categoryImageUrl')
  String get categoryImageUrl;
  @override
  @JsonKey(ignore: true)
  _$CategoryCopyWith<_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
