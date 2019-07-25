import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';

class HotSellers extends StatelessWidget {
  final List<ProductBean> _data;

  HotSellers(this._data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chip(
          backgroundColor: Colors.transparent,
          labelPadding: EdgeInsets.all(0),
          label: Text(
            '火爆专区',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          avatar: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 6,
            child: Text(
              '火',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          children: _data.map((product) => _buildItem(product)).toList(),
        )
      ],
    );
  }

  Widget _buildItem(ProductBean product) {
    return Column(
      children: <Widget>[
        Image.network(product.image),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            product.name,
            style: TextStyle(
              color: Colors.pink,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                '￥${product.mallPrice}',
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '￥${product.price}',
                textAlign: TextAlign.start,
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              ),
            ),
          ],
        )
      ],
    );
  }
}
