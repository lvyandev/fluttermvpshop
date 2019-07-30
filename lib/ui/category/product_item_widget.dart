import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/application.dart';
import 'package:flutter_mvp_shop/constant/product_type.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/route/routes.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductBean _data;
  final ProductType type;

  ProductItemWidget(
    this._data, {
    this.type: ProductType.TYPE_NORMAL,
  });

  @override
  Widget build(BuildContext context) {
    String productName;
    num realPrice;
    num showPrice;
    int titleMaxLine = 1;
    switch (type) {
      case ProductType.TYPE_NORMAL:
        productName = _data.name;
        realPrice = _data.mallPrice;
        showPrice = _data.price;
        break;
      case ProductType.TYPE_CATEGORY:
        productName = _data.goodsName;
        realPrice = _data.presentPrice;
        showPrice = _data.originalPrice;
        titleMaxLine = 2;
        break;
      default:
        break;
    }

    return InkWell(
      onTap: () {
        Application.router.navigateTo(
            context, '${Routes.PRODUCT_DETAILS}?productId=${_data.goodsId}');
      },
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.network(_data.image),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                productName,
                style: TextStyle(
                  color: Colors.pink,
                ),
                maxLines: titleMaxLine,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        _buildRmbLabelSpan(),
                        TextSpan(
                          text: '$realPrice',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey[350],
                      ),
                      children: [
                        _buildRmbLabelSpan(),
                        TextSpan(
                          text: '$showPrice',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildRmbLabelSpan() => TextSpan(
        text: '￥',
        style: TextStyle(fontSize: 10),
      );
}
