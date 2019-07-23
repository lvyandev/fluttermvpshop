import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvp_shop/constant/api.dart';

class DioUtils {
  static Dio _dio;

  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static final ContentType formUrlEncoded =
      ContentType.parse('application/x-www-form-urlencoded');

  static Dio getInstance() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      _dio = Dio(options);
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    return _dio;
  }
}
