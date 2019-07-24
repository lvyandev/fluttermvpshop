import 'package:flutter_mvp_shop/contract/home_contract.dart';
import 'package:flutter_mvp_shop/model/entity/base_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/model/service/api_service.dart';

class HomePresenter extends IHomePresenter {
  @override
  void getHomeData() async {
    if (view != null) {
      view.showLoading();

      final responseData = await getHomePageContent() as BaseBean<HomeBean>;
      if (responseData.code != '0' && responseData.message.isNotEmpty) {
        view.hideLoading();
        view.showMessage(message: responseData.message);
      } else {
        var homeData = responseData.data;
        if (homeData != null) {
          view.hideLoading();
          view.onReceiveHomeData(homeData);
        } else {
          view.hideLoading();
          view.onRequestFailed(message: responseData.message);
        }
      }
    }
  }
}