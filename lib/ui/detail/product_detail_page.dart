import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mvp_shop/base/application.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/contract/product_detail_contract.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_detail_bean.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';
import 'package:flutter_mvp_shop/presenter/product_detail_presenter.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final String _productId;

  ProductDetailPage(this._productId);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends BaseState<ProductDetailPage,
        ProductDetailPresenter, IProductDetailView>
    with SingleTickerProviderStateMixin
    implements IProductDetailView {
  ProductDetailBean _data;
  List _tabs = ['详情', '评论'];

  TabController _tabController;

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_data?.productInfo?.productName}'),
      ),
      body: Stack(
        children: <Widget>[
          _buildList(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void initData() {
    super.initData();
    presenter.getProductDetailData(widget._productId);
  }

  @override
  ProductDetailPresenter initPresenter() {
    return ProductDetailPresenter();
  }

  @override
  void onReceiveProductDetailData(ProductDetailBean detailBean) {
    _data = detailBean;
  }

  Widget _buildList() {
    if (_data == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      var productInfo = _data.productInfo;
      return Container(
        margin: EdgeInsets.only(bottom: kToolbarHeight),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Image.network(productInfo.image1),
            _buildTitlePriceSection(productInfo),
            Container(
              height: 40,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '说明：> 急速送达 > 正品保证',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.black,
                tabs: _tabs
                    .map(
                      (text) => Tab(
                        text: text,
                      ),
                    )
                    .toList(),
                controller: _tabController,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top * 2 -
                  kToolbarHeight -
                  kBottomNavigationBarHeight -
                  kTextTabBarHeight,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Html(
                      data: productInfo.detailHtmlContent,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Text('$index'),
                    itemCount: 20,
                    itemExtent: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildTitlePriceSection(ProductBean productInfo) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            productInfo.productName,
            style: Theme.of(context).textTheme.subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '编号：${productInfo.serialNumber}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '￥${productInfo.presentPrice}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text('市场价：'),
              SizedBox(
                width: 20,
              ),
              Text(
                '￥${productInfo.originalPrice}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: kBottomNavigationBarHeight,
        width: 400,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                  onTap: () {
                    Provider.of<ShoppingCartProvider>(
                      context,
                      listen: false,
                    ).clear();
                  },
                  child: Icon(Icons.shopping_cart)),
              flex: 1,
            ),
            _buildButton(Colors.green, '加入购物车', () {
              var productInfo = _data.productInfo;
              var shoppingCartBean = ShoppingCartBean(
                productInfo.productId,
                productInfo.productName,
                productInfo.image1,
                productInfo.presentPrice,
              );
              Provider.of<ShoppingCartProvider>(
                context,
                listen: false,
              ).addItem(shoppingCartBean);
            }),
            _buildButton(Colors.red, '立即购买', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(Color backgroundColor, String text, VoidCallback onTap) =>
      Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        flex: 2,
      );
}
