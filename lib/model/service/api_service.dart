import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mvp_shop/constant/api.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_list_bean.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/util/dio_utils.dart';

Future getHomePageContent() async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'lon': '115.02932',
      'lat': '35.87468',
    });
    Response response = await dio.post(HOME_PAGE_CONTENT, data: formData);
    return BaseBean<HomeBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getHomeHotSellerContent(int pageNo) async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    FormData formData = FormData.from({
      'page': pageNo,
    });
    Response response = await dio.post(HOME_HOT_SELLER_CONTENT, data: formData);
    return BaseListBean<ProductBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}

Future getCategoryContent() async {
  try {
    Dio dio = DioUtils.getInstance();
    dio.options.contentType = DioUtils.formUrlEncoded;
    Response response = await dio.post(CATEGORY_CONTENT);
    return BaseListBean<CategoryBean>.fromJson(json.decode(response.data));
  } on DioError catch (e) {
    return print(e);
  }
}
