import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/contract/category/category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/presenter/category/category_presenter.dart';
import 'package:flutter_mvp_shop/ui/category/sub_category_menu.dart';
import 'package:flutter_mvp_shop/ui/category/top_category_menu.dart';
import 'package:provider/provider.dart';

import 'provider/top_category_tap_listener.dart';

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
  void onReceiveCategoryData(List<CategoryBean> list) {
    if (list.isNotEmpty) {
      Provider.of<OnCategoryTapListener>(context, listen: false)
          .onTapCategory(list[0]);
    }
    _categoryList.clear();
    _categoryList.addAll(list);
  }
}
