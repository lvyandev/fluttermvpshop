import 'package:flutter_mvp_shop/base/base_presenter.dart';
import 'package:flutter_mvp_shop/base/i_base_view.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';

abstract class IHomeView extends IBaseView {
  void onReceiveHomeData(HomeBean homeBean);

  void onReceiveHotSellerData(List<ProductBean> list);

  void onRequestFailed({String message: ""});
}

abstract class IHomePresenter<V extends IHomeView> extends BasePresenter<V> {
  void getHomeData();

  void getHotSellerData(int pageNo);
}
