import 'package:flutter/material.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/presenter/category_presenter.dart';

class ShareDataWidget extends InheritedWidget {
  int pageNo;

  final List<ProductBean> data;

  final CategoryPresenter presenter;

  ShareDataWidget({
    @required this.pageNo,
    @required this.data,
    @required this.presenter,
    Widget child,
  }) : super(child: child);

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}
