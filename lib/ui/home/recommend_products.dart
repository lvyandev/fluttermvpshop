import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';

class RecommendProducts extends StatelessWidget {
  final List<ProductBean> _data;

  RecommendProducts(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: .5,
                  color: Colors.grey[200],
                ),
              ),
            ),
            child: Text(
              '商品推荐',
            ),
          ),
          Container(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildItem(_data[index]),
              itemCount: _data.length,
              separatorBuilder: (BuildContext context, int index) =>
                  _buildDivider(),
            ),
          )
        ],
      ),
    );
  }

  _buildDivider() => Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: .5,
              color: Colors.grey[200],
            ),
          ),
        ),
      );

  _buildItem(ProductBean product) => Container(
        color: Colors.white,
        width: 133,
        child: Column(
          children: <Widget>[
            Image.network(
              product.image,
              height: 120,
            ),
            Text(
              "￥${product.mallPrice}",
            ),
            Text(
              '￥${product.price}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          ],
        ),
      );
}
