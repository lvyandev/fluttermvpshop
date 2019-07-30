import 'package:flutter_mvp_shop/base/base_presenter.dart';
import 'package:flutter_mvp_shop/base/i_base_view.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_detail_bean.dart';

abstract class IProductDetailView extends IBaseView {
  void onReceiveProductDetailData(ProductDetailBean detailBean);
}

abstract class IProductDetailPresenter<V extends IProductDetailView>
    extends BasePresenter<V> {
  void getProductDetailData(String productId);
}
