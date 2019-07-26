import 'package:flutter_mvp_shop/contract/category_contract.dart';
import 'package:flutter_mvp_shop/model/entity/base/base_list_bean.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class CategoryPresenter extends ICategoryPresenter {
  @override
  void getCategoryData() async {
    if (view != null) {
      view.showLoading();
    }

    final responseData =
        await getCategoryContent() as BaseListBean<CategoryBean>;
    if (view != null) {
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var categoryData = responseData.data;
        if (categoryData != null) {
          view.onReceiveCategoryData(categoryData);
        } else {
          view.onRequestFailed(message: responseData.message);
        }
      }
    }
  }

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
        await getCategoryProducts(pageNo, categoryId, subCategoryId)
            as BaseListBean<ProductBean>;
    if (view != null) {
      view.hideLoading();
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.showMessage(message: responseData.message);
      } else {
        var productsData = responseData.data;
        if (productsData != null) {
          view.onReceiveCategoryProducts(productsData);
        } else {
          view.onRequestFailed(message: responseData.message);
        }
      }
    }
  }
}
