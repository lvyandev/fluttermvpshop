import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/picture_info_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_bean.g.dart';

@JsonSerializable()
class ProductDetailBean {
  @JsonKey(name: 'advertesPicture')
  PictureInfoBean adsPicture;

  @JsonKey(name: 'goodComments')
  List<String> goodComments;

  @JsonKey(name: 'goodInfo')
  ProductBean productInfo;

  ProductDetailBean(this.adsPicture, this.goodComments, this.productInfo);

  factory ProductDetailBean.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductDetailBeanFromJson(srcJson);
}
