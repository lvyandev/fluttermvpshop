import 'package:flutter_mvp_shop/model/entity/category/sub_category_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_bean.g.dart';

@JsonSerializable()
class CategoryBean {
  @JsonKey(name: 'mallCategoryId')
  final String categoryId;
  @JsonKey(name: 'mallCategoryName')
  final String categoryName;
  @JsonKey(name: 'bxMallSubDto')
  final List<SubCategoryBean> subCategories;
  @JsonKey(name: 'comments')
  final String comments;
  @JsonKey(name: 'image')
  final String image;

  CategoryBean(
      {this.categoryId,
      this.categoryName,
      this.subCategories,
      this.comments,
      this.image});

  factory CategoryBean.fromJson(Map<String, dynamic> json) =>
      _$CategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);
}
