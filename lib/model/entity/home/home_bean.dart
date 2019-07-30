import 'package:flutter_mvp_shop/model/entity/home/shop_info_bean.dart';
import 'package:json_annotation/json_annotation.dart';

import '../category/category_bean.dart';
import '../detail/product_bean.dart';
import 'image_info_bean.dart';
import 'picture_info_bean.dart';

part 'home_bean.g.dart';

@JsonSerializable()
class HomeBean {
  @JsonKey(name: 'slides')
  List<ImageInfoBean> banners;
  @JsonKey(name: 'shopInfo')
  ShopInfoBean shopInfo;
  @JsonKey(name: 'recommend')
  List<ProductBean> recommendProducts;
  @JsonKey(name: 'advertesPicture')
  PictureInfoBean adsPicture;
  @JsonKey(name: 'floor1')
  List<ImageInfoBean> recommendCategoryProducts1;
  @JsonKey(name: 'floor2')
  List<ImageInfoBean> recommendCategoryProducts2;
  @JsonKey(name: 'floor3')
  List<ImageInfoBean> recommendCategoryProducts3;
  @JsonKey(name: 'floor1Pic')
  PictureInfoBean categoryImage1;
  @JsonKey(name: 'floor2Pic')
  PictureInfoBean categoryImage2;
  @JsonKey(name: 'floor3Pic')
  PictureInfoBean categoryImage3;
  @JsonKey(name: 'category')
  List<CategoryBean> categories;

  HomeBean(
      this.banners,
      this.shopInfo,
      this.recommendProducts,
      this.adsPicture,
      this.recommendCategoryProducts1,
      this.recommendCategoryProducts2,
      this.recommendCategoryProducts3,
      this.categoryImage1,
      this.categoryImage2,
      this.categoryImage3,
      this.categories);

  factory HomeBean.fromJson(Map<String, dynamic> json) =>
      _$HomeBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBeanToJson(this);

  @override
  String toString() {
    return 'HomeBean{banners: $banners, shopInfo: $shopInfo, recommendProducts: $recommendProducts, adsPicture: $adsPicture, recommendCategoryProducts1: $recommendCategoryProducts1, recommendCategoryProducts2: $recommendCategoryProducts2, recommendCategoryProducts3: $recommendCategoryProducts3, categoryImage1: $categoryImage1, categoryImage2: $categoryImage2, categoryImage3: $categoryImage3, categories: $categories}';
  }
}
