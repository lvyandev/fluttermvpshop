import 'package:flutter_mvp_shop/base/base_presenter.dart';
import 'package:flutter_mvp_shop/base/i_base_view.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';

abstract class ICategoryView extends IBaseView {
  void onReceiveCategoryData(List<CategoryBean> list);
}

abstract class ICategoryPresenter<V extends ICategoryView>
    extends BasePresenter<V> {
  void getCategoryData();
}
