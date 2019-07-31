// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) {
  return ProductBean(
    json['amount'] as int,
    json['comPic'] as String,
    json['goodsDetail'] as String,
    json['image'] as String,
    json['image1'] as String,
    json['image2'] as String,
    json['image3'] as String,
    json['image4'] as String,
    json['image5'] as String,
    json['isOnline'] as String,
    (json['mallPrice'] as num)?.toDouble(),
    json['name'] as String,
    (json['oriPrice'] as num)?.toDouble(),
    (json['price'] as num)?.toDouble(),
    (json['presentPrice'] as num)?.toDouble(),
    json['goodsId'] as String,
    json['goodsName'] as String,
    json['goodsSerialNumber'] as String,
    json['shopId'] as String,
    json['state'] as int,
  );
}

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'comPic': instance.comPic,
      'goodsDetail': instance.detailHtmlContent,
      'image': instance.image,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'image4': instance.image4,
      'image5': instance.image5,
      'isOnline': instance.isOnline,
      'mallPrice': instance.mallPrice,
      'name': instance.name,
      'oriPrice': instance.originalPrice,
      'price': instance.price,
      'presentPrice': instance.presentPrice,
      'goodsId': instance.productId,
      'goodsName': instance.productName,
      'goodsSerialNumber': instance.serialNumber,
      'shopId': instance.shopId,
      'state': instance.state,
    };
