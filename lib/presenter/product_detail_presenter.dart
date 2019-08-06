import 'package:flutter_mvp_shop/contract/product_detail_contract.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_detail_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class ProductDetailPresenter extends IProductDetailPresenter {
  @override
  void getProductDetailData(String productId) async {
    if (view != null) {
      view.showLoading();
    }

    final responseData = await getProductDetails(view.currentContext, productId) as BaseBean<ProductDetailBean>;
    if (view != null) {
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var productDetailData = responseData.data;
        if (productDetailData != null) {
          view.onReceiveProductDetailData(productDetailData);
        } else {
          view.showMessage(message: responseData.message);
        }
      }
    }
  }
}