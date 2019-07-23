// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBean _$HomeBeanFromJson(Map<String, dynamic> json) {
  return HomeBean(
    (json['slides'] as List)
        ?.map((e) => e == null
            ? null
            : ImageInfoBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['shopInfo'] == null
        ? null
        : ShopInfoBean.fromJson(json['shopInfo'] as Map<String, dynamic>),
    (json['recommend'] as List)
        ?.map((e) =>
            e == null ? null : ProductBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['advertesPicture'] == null
        ? null
        : PictureInfoBean.fromJson(
            json['advertesPicture'] as Map<String, dynamic>),
    (json['floor1'] as List)
        ?.map((e) => e == null
            ? null
            : ImageInfoBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor2'] as List)
        ?.map((e) => e == null
            ? null
            : ImageInfoBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor3'] as List)
        ?.map((e) => e == null
            ? null
            : ImageInfoBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['floor1Pic'] == null
        ? null
        : PictureInfoBean.fromJson(json['floor1Pic'] as Map<String, dynamic>),
    json['floor2Pic'] == null
        ? null
        : PictureInfoBean.fromJson(json['floor2Pic'] as Map<String, dynamic>),
    json['floor3Pic'] == null
        ? null
        : PictureInfoBean.fromJson(json['floor3Pic'] as Map<String, dynamic>),
    (json['category'] as List)
        ?.map((e) =>
            e == null ? null : CategoryBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeBeanToJson(HomeBean instance) => <String, dynamic>{
      'slides': instance.banners,
      'shopInfo': instance.shopInfo,
      'recommend': instance.recommendProducts,
      'advertesPicture': instance.adsPicture,
      'floor1': instance.recommendCategoryProducts1,
      'floor2': instance.recommendCategoryProducts2,
      'floor3': instance.recommendCategoryProducts3,
      'floor1Pic': instance.categoryImage1,
      'floor2Pic': instance.categoryImage2,
      'floor3Pic': instance.categoryImage3,
      'category': instance.categories,
    };
