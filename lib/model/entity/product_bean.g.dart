// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) {
  return ProductBean(
    image: json['image'] as String,
    mallPrice: (json['mallPrice'] as num)?.toDouble(),
    goodsName: json['goodsName'] as String,
    goodsId: json['goodsId'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'goodsName': instance.goodsName,
      'goodsId': instance.goodsId,
      'price': instance.price,
    };
