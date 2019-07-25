import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/contract/category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/presenter/category_presenter.dart';
import 'package:flutter_mvp_shop/provide/top_category_tap_listener.dart';
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

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Row(
        children: <Widget>[
          TopCategoryMenu(_categoryList),
          SubCategoryMenu(),
        ],
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
