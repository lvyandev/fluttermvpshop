import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_bean.g.dart';

@JsonSerializable()
class ShoppingCartBean {
  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'images')
  String images;

  @JsonKey(name: 'price')
  double price;

  ShoppingCartBean(
    this.goodsId,
    this.goodsName,
    this.images,
    this.price, {
    this.count = 1,
  });

  factory ShoppingCartBean.fromJson(Map<String, dynamic> srcJson) =>
      _$ShoppingCartBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShoppingCartBeanToJson(this);

  @override
  String toString() {
    return 'ShoppingCartBean{count: $count, goodsId: $goodsId, goodsName: $goodsName, images: $images, price: $price}';
  }
}
