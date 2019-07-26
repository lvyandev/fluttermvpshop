import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/ui/category/product_item_widget.dart';

class HotSellers extends StatelessWidget {
  final List<ProductBean> _data;

  HotSellers(this._data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.grey[200],
          child: Chip(
            backgroundColor: Colors.grey[200],
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
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.21,
          children: _data.map((product) => ProductItemWidget(product)).toList(),
        )
      ],
    );
  }
}
