import 'package:json_annotation/json_annotation.dart';
import 'package:englister/models/study/Category.dart';

part 'get_category_detail_response.g.dart';

@JsonSerializable()
class GetCategoryDetailResponse {
  Category category;

  GetCategoryDetailResponse({
    required this.category,
  });

  factory GetCategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCategoryDetailResponseToJson(this);
}
