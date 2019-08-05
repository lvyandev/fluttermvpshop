import 'package:flutter/material.dart';
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
          builder: (BuildContext context, ShoppingCartProvider value,
                  Widget child) =>
              Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: kTextTabBarHeight,
                ),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
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
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('共${value.count}件商品'),
                                  Text(
                                    '小计： ￥${value.totalPrice}',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 50,
                  width: 400,
                  color: Colors.white,
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: value.isAllSelected,
                        onChanged: (bool value) {
                          Provider.of<ShoppingCartProvider>(
                            context,
                            listen: false,
                          ).selectAll(value);
                        },
                      ),
                      Text('全选'),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: '合计：'),
                                TextSpan(
                                  text: '￥${value.totalPrice}',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ]),
                            ),
                            Text(
                              '满10元免配送费，预购免配送费',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 5),
                          textColor: Colors.white,
                          color: Colors.pink,
                          child: Text(
                            value.count > 0 ? '结算(${value.count})' : '结算',
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
