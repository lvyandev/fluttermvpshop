import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/contract/category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/presenter/category_presenter.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
import 'package:flutter_mvp_shop/ui/category/share_data_widget.dart';
import 'package:flutter_mvp_shop/ui/category/sub_category_menu.dart';
import 'package:flutter_mvp_shop/ui/category/top_category_menu.dart';
import 'package:provide/provide.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState
    extends BaseState<CategoryPage, CategoryPresenter, ICategoryView>
    implements ICategoryView {
  final List<CategoryBean> _categoryList = List();
  final List<ProductBean> _productList = List();

  int _pageNo = 1;

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: ShareDataWidget(
        child: Row(
          children: <Widget>[
            TopCategoryMenu(_categoryList),
            SubCategoryMenu(),
          ],
        ),
        presenter: presenter,
        data: _productList,
        pageNo: _pageNo,
      ),
    );
  }

  @override
  void initData() {
    super.initData();
    presenter.getCategoryData();
  }

  @override
  CategoryPresenter initPresenter() {
    return CategoryPresenter();
  }

  @override
  void onHideLoading() {}

  @override
  void onReceiveCategoryData(List<CategoryBean> list) {
    if (list.isNotEmpty) {
      Provide.value<OnCategoryTapListener>(context).onTapCategory(list[0]);
    }
    _categoryList.clear();
    _categoryList.addAll(list);
  }

  @override
  void onReceiveCategoryProducts(List<ProductBean> list) {
    if (_pageNo == 1) {
      _productList.clear();
    }

    _productList.addAll(list);

    _pageNo++;
  }

  @override
  void onRequestFailed({String message = ""}) {}

  @override
  void onShowLoading() {}

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
