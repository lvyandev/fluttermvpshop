import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class CountController extends StatefulWidget {
  final ShoppingCartBean _data;

  CountController(this._data);

  @override
  _CountControllerState createState() => _CountControllerState();
}

class _CountControllerState extends State<CountController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              if (widget._data.count > 1) {
                Provider.of<ShoppingCartProvider>(
                  context,
                  listen: false,
                ).decreaseItemCount(widget._data);
              }
            },
            child: Container(
              width: 30,
              color: widget._data.count > 1 ? Colors.white : Colors.grey[200],
              alignment: Alignment.center,
              child: Text(widget._data.count > 1 ? '－' : ''),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.grey),
                    right: BorderSide(color: Colors.grey)),
              ),
              child: Text('${widget._data.count}'),
              alignment: Alignment.center,
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<ShoppingCartProvider>(
                context,
                listen: false,
              ).increaseItemCount(widget._data);
            },
            child: Container(
              width: 30,
              alignment: Alignment.center,
              child: Text('＋'),
            ),
          ),
        ],
      ),
    );
  }
}
