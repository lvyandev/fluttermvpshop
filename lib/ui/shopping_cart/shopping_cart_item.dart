import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:flutter_mvp_shop/ui/shopping_cart/count_controller_widget.dart';
import 'package:provider/provider.dart';

class ShoppingCartItem extends StatelessWidget {
  final ShoppingCartBean _data;

  ShoppingCartItem(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.network(
              _data.images,
              width: 80,
              height: 80,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: .5,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _data.goodsName,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  CountController(_data),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            child: Column(
              children: <Widget>[
                Text('${_data.price}'),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Provider.of<ShoppingCartProvider>(
                      context,
                      listen: false,
                    ).deleteItem(_data.goodsId);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
