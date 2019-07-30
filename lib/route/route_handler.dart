import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/main_page.dart';
import 'package:flutter_mvp_shop/ui/detail/product_detail_page.dart';

Handler routeNotFoundHandler = Handler(
  handlerFunc: (
    BuildContext context,
    Map<String, List<String>> params,
  ) =>
      AlertDialog(
    title: Text('温馨提示'),
    content: Text('路径未找到！'),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('关闭'),
      ),
    ],
  ),
);

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      MainPage(),
);

Handler productDetailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String productId = params['productId']?.first;

    return ProductDetailPage(productId);
  },
);
