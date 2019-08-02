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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Consumer<ShoppingCartProvider>(
          builder:
              (BuildContext context, ShoppingCartProvider value, Widget child) {
            print('LOG_收到ShoppingCartProvider');

            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ShoppingCartItem(value.data[index]);
                    },
                    childCount: value.data.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(color: Colors.green, child: Text('footer')),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
