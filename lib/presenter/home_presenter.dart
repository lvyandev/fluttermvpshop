import 'package:flutter_mvp_shop/contract/home_contract.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_list_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class HomePresenter extends IHomePresenter {
  @override
  void getHomeData() async {
    if (view != null) {
      view.showLoading();
    }

    final responseData = await getHomePageContent() as BaseBean<HomeBean>;
    if (view != null) {
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var homeData = responseData.data;
        if (homeData != null) {
          view.onReceiveHomeData(homeData);
        } else {
          view.onRequestFailed(message: responseData.message);
        }
      }
    }
  }

  @override
  void getHotSellerData(int pageNo) async {
    if (view != null) {
      view.showLoading();

      final responseData =
          await getHomeHotSellerContent(pageNo) as BaseListBean<ProductBean>;
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var productData = responseData.data;
        if (productData != null) {
          view.onReceiveHotSellerData(productData);
        } else {
          view.onRequestFailed(message: responseData.message);
        }
      }
    }
  }
}
