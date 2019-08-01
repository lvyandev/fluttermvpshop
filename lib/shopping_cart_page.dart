import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:flutter_mvp_shop/ui/shopping_cart/shopping_cart_item.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<ShoppingCartBean> _list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Consumer<ShoppingCartProvider>(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => ShoppingCartItem(
              _list[index],
            ),
            itemCount: _list.length,
          ),
          builder:
              (BuildContext context, ShoppingCartProvider value, Widget child) {
            ShoppingCartDao.instance.queryAll().then((list) {
              _list.clear();
              _list.addAll(list);
            });
            return child;
          },
        ),
      ),
    );
  }
}
