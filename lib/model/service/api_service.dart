import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvp_shop/constant/api.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_list_bean.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_detail_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/util/dio_utils.dart';

Future getHomePageContent(BuildContext context) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'lon': '115.02932',
      'lat': '35.87468',
    });
    Response response = await dio.post(
      HOME_PAGE_CONTENT,
      data: formData,
      options: Options(
        extra: {'context': context},
      ),
    );
    return BaseBean<HomeBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getHomeHotSellerContent(BuildContext context, int pageNo) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'page': pageNo,
    });
    Response response = await dio.post(
      HOME_HOT_SELLER_CONTENT,
      data: formData,
      options: Options(
        extra: {'context': context},
      ),
    );
    return BaseListBean<ProductBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getCategoryContent(BuildContext context) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    Response response = await dio.post(
      CATEGORY_CONTENT,
      options: Options(
        extra: {'context': context},
      ),
    );
    return BaseListBean<CategoryBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getCategoryProducts(BuildContext context, int pageNo, String categoryId,
    String subCategoryId) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'categoryId': categoryId,
      'categorySubId': subCategoryId,
      'page': pageNo,
    });
    Response response = await dio.post(
      CATEGORY_PRODUCTS,
      data: formData,
      options: Options(
        extra: {'context': context},
      ),
    );
    return BaseListBean<ProductBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getProductDetails(BuildContext context, String productId) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'goodId': productId,
    });
    Response response = await dio.post(
      PRODUCT_DETAIL,
      data: formData,
      options: Options(
        extra: {'context': context},
      ),
    );
    return BaseBean<ProductDetailBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}
