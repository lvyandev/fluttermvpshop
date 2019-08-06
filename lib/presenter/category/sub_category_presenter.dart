import 'package:flutter_mvp_shop/contract/category/category_contract.dart';
import 'package:flutter_mvp_shop/contract/category/sub_category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_list_bean.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/detail/product_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class SubCategoryPresenter extends ISubCategoryPresenter {
  @override
  void getCategoryProductsData(
    int pageNo,
    String categoryId,
    String subCategoryId,
  ) async {
    if (view != null) {
      view.showLoading();
    }

    final responseData =
        await getCategoryProducts(view.currentContext, pageNo, categoryId, subCategoryId)
            as BaseListBean<ProductBean>;
    if (view != null) {
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var productsData = responseData.data;
        view.onReceiveCategoryProducts(productsData);
      }
    }
  }
}
