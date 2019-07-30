// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailBean _$ProductDetailBeanFromJson(Map<String, dynamic> json) {
  return ProductDetailBean(
    json['advertesPicture'] == null
        ? null
        : PictureInfoBean.fromJson(
            json['advertesPicture'] as Map<String, dynamic>),
    (json['goodComments'] as List)?.map((e) => e as String)?.toList(),
    json['goodInfo'] == null
        ? null
        : ProductBean.fromJson(json['goodInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductDetailBeanToJson(ProductDetailBean instance) =>
    <String, dynamic>{
      'advertesPicture': instance.adsPicture,
      'goodComments': instance.goodComments,
      'goodInfo': instance.productInfo,
    };
