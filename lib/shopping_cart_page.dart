import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  String _text = '加载中...';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Consumer<ShoppingCartProvider>(
          child: Text('$_text'),
          builder:
              (BuildContext context, ShoppingCartProvider value, Widget child) {
            print('收到ShoppingCartProvider');
            ShoppingCartDao().queryAll().then((list) {
              print(list);
              setState(() {
                _text = list.toString();
              });
            });
            return child;
          },
        ),
      ),
    );
  }
}
