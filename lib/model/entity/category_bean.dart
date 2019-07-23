import 'package:flutter_mvp_shop/model/entity/sub_category_bean.dart';

class CategoryBean {
  String categoryId;
  String categoryName;
  List<SubCategoryBean> subCategories;
  String comments;
  String image;

  CategoryBean(
      {this.categoryId,
        this.categoryName,
        this.subCategories,
        this.comments,
        this.image});

  CategoryBean.fromJson(Map<String, dynamic> json) {
    categoryId = json['mallCategoryId'];
    categoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      subCategories = new List<SubCategoryBean>();
      json['bxMallSubDto'].forEach((v) {
        subCategories.add(new SubCategoryBean.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.categoryId;
    data['mallCategoryName'] = this.categoryName;
    if (this.subCategories != null) {
      data['bxMallSubDto'] = this.subCategories.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}