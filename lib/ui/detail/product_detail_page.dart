import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String _productId;

  ProductDetailPage(this._productId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Center(child: Text('$_productId')),
    );
  }
}
