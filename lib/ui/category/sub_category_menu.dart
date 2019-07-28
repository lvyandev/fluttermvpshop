import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/constant/product_type.dart';
import 'package:flutter_mvp_shop/contract/category/sub_category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/presenter/category/sub_category_presenter.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:flutter_mvp_shop/ui/category/product_item_widget.dart';
import 'package:provide/provide.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubCategoryMenu extends StatefulWidget {
  @override
  _SubCategoryMenuState createState() => _SubCategoryMenuState();
}

class _SubCategoryMenuState
    extends BaseState<SubCategoryMenu, SubCategoryPresenter, ISubCategoryView>
    implements ISubCategoryView {
  final List<ProductBean> _data = List();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  int _pageNo = 1;

  String _categoryId;
  String _subCategoryId;

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          _buildSubCategory(),
          _buildProductList(),
        ],
      ),
    );
  }

  @override
  SubCategoryPresenter initPresenter() {
    return SubCategoryPresenter();
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
                  _categoryId = item.categoryId;
                  _subCategoryId = item.subId;

                  _onLoadData();
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

  _buildProductList() {
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
            _data[index],
            type: ProductType.TYPE_CATEGORY,
          ),
          itemCount: _data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
          ),
        ),
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: _onLoadData,
        onLoading: () => _onLoadData(isRefresh: false),
      ),
    );
  }

  void _onLoadData({bool isRefresh = true}) {
    if (isRefresh) {
      _pageNo = 1;
    }

    presenter.getCategoryProductsData(_pageNo, _categoryId, _subCategoryId);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void onHideLoading() {
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  @override
  void onReceiveCategoryProducts(List<ProductBean> list) {
    if (_pageNo == 1) {
      _data.clear();
    }

    if (list != null && list.isNotEmpty) {
      _data.addAll(list);
      _pageNo++;
    } else {
      _refreshController.loadNoData();
    }
  }

  @override
  showMessage({String message = ''}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }
}
