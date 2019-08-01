import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';

class ShoppingCartItem extends StatelessWidget {
  final ShoppingCartBean _data;

  ShoppingCartItem(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            onChanged: (bool value) {},
          ),
          DecoratedBox(
            child: Image.network(
              _data.images,
              width: 60,
              height: 60,
            ),
            decoration:
                BoxDecoration(border: Border.all()),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  _data.goodsName,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text('${_data.price}'),
              Icon(Icons.delete),
            ],
          )
        ],
      ),
    );
  }
}
