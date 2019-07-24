import 'package:json_annotation/json_annotation.dart';

part 'product_bean.g.dart';

@JsonSerializable()
class ProductBean {
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'mallPrice')
  double mallPrice;
  @JsonKey(name: 'goodsName')
  String goodsName;
  @JsonKey(name: 'goodsId')
  String goodsId;
  @JsonKey(name: 'price')
  double price;

  ProductBean(
      {this.image, this.mallPrice, this.goodsName, this.goodsId, this.price});

  factory ProductBean.fromJson(Map<String, dynamic> json) => _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}
