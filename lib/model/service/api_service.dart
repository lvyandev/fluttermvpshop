import 'package:dio/dio.dart';
import 'package:flutter_mvp_shop/constant/api.dart';
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
    return response.data;
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
    return response.data;
  } on DioError catch (e) {
    return print(e);
  }
}
