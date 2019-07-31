import 'package:json_annotation/json_annotation.dart';

part 'product_bean.g.dart';

@JsonSerializable()
class ProductBean {
  @JsonKey(name: 'amount')
  int amount;

  @JsonKey(name: 'comPic')
  String comPic;

  @JsonKey(name: 'goodsDetail')
  String detailHtmlContent;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'image1')
  String image1;

  @JsonKey(name: 'image2')
  String image2;

  @JsonKey(name: 'image3')
  String image3;

  @JsonKey(name: 'image4')
  String image4;

  @JsonKey(name: 'image5')
  String image5;

  @JsonKey(name: 'isOnline')
  String isOnline;

  @JsonKey(name: 'mallPrice')
  double mallPrice;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'oriPrice')
  double originalPrice;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'presentPrice')
  double presentPrice;

  @JsonKey(name: 'goodsId')
  String productId;

  @JsonKey(name: 'goodsName')
  String productName;

  @JsonKey(name: 'goodsSerialNumber')
  String serialNumber;

  @JsonKey(name: 'shopId')
  String shopId;

  @JsonKey(name: 'state')
  int state;

  ProductBean(
      this.amount,
      this.comPic,
      this.detailHtmlContent,
      this.image,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.isOnline,
      this.mallPrice,
      this.name,
      this.originalPrice,
      this.price,
      this.presentPrice,
      this.productId,
      this.productName,
      this.serialNumber,
      this.shopId,
      this.state);

  factory ProductBean.fromJson(Map<String, dynamic> json) =>
      _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}
