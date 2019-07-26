import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/constant/product_type.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:flutter_mvp_shop/ui/category/product_item_widget.dart';
import 'package:flutter_mvp_shop/ui/category/share_data_widget.dart';
import 'package:provide/provide.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubCategoryMenu extends StatefulWidget {
  @override
  _SubCategoryMenuState createState() => _SubCategoryMenuState();
}

class _SubCategoryMenuState extends State<SubCategoryMenu> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String _categoryId;
  String _subCategoryId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          _buildSubCategory(),
          _buildProductList(ShareDataWidget.of(context).data),
        ],
      ),
    );
  }

  _buildSubCategory() => Provide<OnCategoryTapListener>(
        builder: (
          BuildContext context,
          Widget child,
          OnCategoryTapListener value,
        ) =>
            Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: .5,
                color: Colors.grey,
              ),
            ),
          ),
          child: ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              var item = value.list[index];
              return InkWell(
                onTap: () {
                  var dataWidget = ShareDataWidget.of(context);

                  _categoryId = item.categoryId;
                  _subCategoryId = item.subId;
                  dataWidget.presenter.getCategoryProductsData(
                    dataWidget.pageNo,
                    _categoryId,
                    _subCategoryId,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    item.subCategoryName,
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      );

  _buildProductList(List<ProductBean> data) {
    return Container(
      width: 300,
      height: MediaQueryData.fromWindow(window).size.height -
          MediaQueryData.fromWindow(window).padding.top -
          MediaQueryData.fromWindow(window).padding.bottom -
          kToolbarHeight -
          40 -
          kBottomNavigationBarHeight,
      child: SmartRefresher(
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => ProductItemWidget(
            data[index],
            type: ProductType.TYPE_CATEGORY,
          ),
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
          ),
        ),
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: () {
          var shareDataWidget = ShareDataWidget.of(context);
          shareDataWidget.pageNo = 1;
          shareDataWidget.presenter.getCategoryProductsData(
              shareDataWidget.pageNo, _categoryId, _subCategoryId);
        },
        onLoading: () {
          var shareDataWidget = ShareDataWidget.of(context);
          shareDataWidget.presenter.getCategoryProductsData(
              shareDataWidget.pageNo, _categoryId, _subCategoryId);
        },
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
