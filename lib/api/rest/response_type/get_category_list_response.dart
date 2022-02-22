import 'package:json_annotation/json_annotation.dart';
import 'package:englister/models/study/Category.dart';

part 'get_category_list_response.g.dart';

@JsonSerializable()
class GetCategoryListResponse {
  //newが予約後
  //List<Category>? new;
  List<Category>? popular;
  List<Category>? free;

  GetCategoryListResponse({
    //this.new,
    this.popular,
    this.free,
  });

  factory GetCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCategoryListResponseToJson(this);
}
