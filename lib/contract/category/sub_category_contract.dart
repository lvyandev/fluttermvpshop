import 'package:flutter_mvp_shop/base/base_presenter.dart';
import 'package:flutter_mvp_shop/base/i_base_view.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';

abstract class ISubCategoryView extends IBaseView {
  void onReceiveCategoryProducts(List<ProductBean> list);
}

abstract class ISubCategoryPresenter<V extends ISubCategoryView>
    extends BasePresenter<V> {
  void getCategoryProductsData(
    int pageNo,
    String categoryId,
    String subCategoryId,
  );
}
