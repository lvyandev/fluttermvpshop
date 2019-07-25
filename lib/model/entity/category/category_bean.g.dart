// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryBean _$CategoryBeanFromJson(Map<String, dynamic> json) {
  return CategoryBean(
    categoryId: json['mallCategoryId'] as String,
    categoryName: json['mallCategoryName'] as String,
    subCategories: (json['bxMallSubDto'] as List)
        ?.map((e) => e == null
            ? null
            : SubCategoryBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comments: json['comments'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$CategoryBeanToJson(CategoryBean instance) =>
    <String, dynamic>{
      'mallCategoryId': instance.categoryId,
      'mallCategoryName': instance.categoryName,
      'bxMallSubDto': instance.subCategories,
      'comments': instance.comments,
      'image': instance.image,
    };
