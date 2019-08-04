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
              (BuildContext context, ShoppingCartProvider value, Widget child) => CustomScrollView(
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
                    height: value.data.length > 0 ? 40 : 0,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: value.data.length > 0
                        ? Builder(
                            builder: (BuildContext context) {
                              int count = 0;
                              double totalPrice = .0;
                              for (var value in value.data) {
                                count += value.count;
                                totalPrice += value.count * value.price;
                              }
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('共$count件商品'),
                                  Text(
                                    '小计： ￥$totalPrice',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : null,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
