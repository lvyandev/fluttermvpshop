import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/constant/product_type.dart';
import 'package:flutter_mvp_shop/contract/category/sub_category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/presenter/category/sub_category_presenter.dart';
import 'package:flutter_mvp_shop/provider/top_category_tap_listener.dart';
import 'package:flutter_mvp_shop/ui/category/product_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubCategoryMenu extends StatefulWidget {
  @override
  _SubCategoryMenuState createState() => _SubCategoryMenuState();
}

class _SubCategoryMenuState
    extends BaseState<SubCategoryMenu, SubCategoryPresenter, ISubCategoryView>
    implements ISubCategoryView {
  final List<ProductBean> _data = List();

  RefreshController _refreshController = RefreshController();

  int _pageNo = 1;

  String _categoryId = '4';
  String _subCategoryId;

  int _currentSelectedIndex = 0;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildSubCategory(),
        _buildProductList(),
      ],
    );
  }

  @override
  SubCategoryPresenter initPresenter() {
    return SubCategoryPresenter();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 此处在provider状态改变时被调用
    final list = Provider.of<OnCategoryTapListener>(context).list;
    if (list.isNotEmpty) {
      _categoryId = list[0].categoryId;
    }
    _currentSelectedIndex = 0;
    _subCategoryId = '';
    _onLoadData();
  }

  _buildSubCategory() => Consumer<OnCategoryTapListener>(
        builder: (
          BuildContext context,
          OnCategoryTapListener value,
          Widget child,
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
                  _currentSelectedIndex = index;
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
                    style: TextStyle(
                      color: _currentSelectedIndex == index
                          ? Theme.of(context).accentColor
                          : Theme.of(context).textTheme.title.color,
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      );

  _buildProductList() {
    return Expanded(
      child: Container(
        width: 300,
        child: SmartRefresher(
          child: GridView.builder(
            shrinkWrap: true,
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
}
