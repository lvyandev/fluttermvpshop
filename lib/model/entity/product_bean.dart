import 'package:json_annotation/json_annotation.dart';

part 'product_bean.g.dart';

@JsonSerializable()
class ProductBean {
  @JsonKey(name: 'goodsId')
  String goodsId;
  @JsonKey(name: 'goodsName')
  String goodsName;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'mallPrice')
  double mallPrice;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'oriPrice')
  double originalPrice;
  @JsonKey(name: 'price')
  double price;

  ProductBean(this.goodsId, this.goodsName, this.image, this.mallPrice,
      this.name, this.originalPrice, this.price);

  factory ProductBean.fromJson(Map<String, dynamic> json) =>
      _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}
