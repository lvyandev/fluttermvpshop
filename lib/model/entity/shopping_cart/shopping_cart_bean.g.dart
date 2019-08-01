// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartBean _$ShoppingCartBeanFromJson(Map<String, dynamic> json) {
  return ShoppingCartBean(
    json['goodsId'] as String,
    json['goodsName'] as String,
    json['images'] as String,
    (json['price'] as num)?.toDouble(),
    count: json['count'] as int ?? 1,
  );
}

Map<String, dynamic> _$ShoppingCartBeanToJson(ShoppingCartBean instance) =>
    <String, dynamic>{
      'count': instance.count,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'images': instance.images,
      'price': instance.price,
    };
