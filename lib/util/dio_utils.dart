import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      _dio.interceptors
        ..add(InterceptorsWrapper(
          onRequest: (RequestOptions options) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showGeneralDialog(
                context: options.extra['context'],
                barrierDismissible: false,
                barrierLabel: 'loading',
                transitionDuration: Duration(microseconds: 150),
                pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) =>
                    SafeArea(
                  child: Center(
                    child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: CupertinoActivityIndicator()),
                  ),
                ),
              );
            });
            return options;
          },
          onResponse: (Response response) {
            Navigator.pop(response.request.extra['context']);
            return response;
          },
          onError: (DioError error) {
            Navigator.pop(error.request.extra['context']);
            return error;
          },
        ))
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
    }
    return _dio;
  }
}
