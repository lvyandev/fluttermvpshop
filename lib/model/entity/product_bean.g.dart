// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) {
  return ProductBean(
    json['goodsId'] as String,
    json['goodsName'] as String,
    json['image'] as String,
    (json['mallPrice'] as num)?.toDouble(),
    json['name'] as String,
    (json['oriPrice'] as num)?.toDouble(),
    (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'name': instance.name,
      'oriPrice': instance.originalPrice,
      'price': instance.price,
    };
