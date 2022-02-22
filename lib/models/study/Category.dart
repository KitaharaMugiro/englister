// 下記コメントを付けないと@JsonKeyでwarningが出るがknown issue（https://github.com/rrousselGit/freezed/issues/527）
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

//下記をつけないとToJsonとFromJsonが作成されずにエラーになる
part 'Category.g.dart';

part 'Category.freezed.dart';

@freezed
abstract class Category implements _$Category {
  //@JsonSerializableのクラスで自分で作成したClassを使うには@JsonKeyが必要みたい
  const factory Category(
      {@JsonKey(name: 'categorySlug')
          required String categorySlug,
      @JsonKey(name: 'categoryName')
          required String categoryName,
      @JsonKey(name: 'categoryDescription')
          required String categoryDescription,
      @JsonKey(name: 'categoryImageUrl')
          required String categoryImageUrl}) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
