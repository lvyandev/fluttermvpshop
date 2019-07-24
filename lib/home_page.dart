import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvp_shop/base/base_state.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:flutter_mvp_shop/presenter/home_presenter.dart';
import 'package:flutter_mvp_shop/ui/ads_banner.dart';
import 'package:flutter_mvp_shop/ui/category_menu.dart';
import 'package:flutter_mvp_shop/ui/hot_sellers.dart';
import 'package:flutter_mvp_shop/ui/recommend_category.dart';
import 'package:flutter_mvp_shop/ui/recommend_products.dart';
import 'package:flutter_mvp_shop/ui/shop_manager_info.dart';
import 'package:flutter_mvp_shop/ui/top_banner.dart';

import 'contract/home_contract.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomePresenter, IHomeView>
    implements IHomeView {
  HomeBean _homeBean;

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: Container(
        child: Builder(
          builder: (context) {
            if (_homeBean == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  TopBanner(_homeBean.banners),
                  CategoryMenu(_homeBean.categories.take(10).toList()),
                  AdsBanner(List.generate(1, (_) => _homeBean.adsPicture)),
                  ShopManagerInfo(_homeBean.shopInfo),
                  RecommendProducts(_homeBean.recommendProducts),
                  RecommendCategory(
                    _homeBean.categoryImage1,
                    _homeBean.recommendCategoryProducts1,
                  ),
                  RecommendCategory(
                    _homeBean.categoryImage2,
                    _homeBean.recommendCategoryProducts2,
                  ),
                  RecommendCategory(
                    _homeBean.categoryImage3,
                    _homeBean.recommendCategoryProducts3,
                  ),
                  HotSellers(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void initData() {
    super.initData();
    presenter.getHomeData();
  }

  @override
  HomePresenter initPresenter() {
    return HomePresenter();
  }

  @override
  showMessage({String message = ''}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  @override
  void onReceiveHomeData(HomeBean homeBean) {
    _homeBean = homeBean;
  }

  @override
  void onRequestFailed({String message = ""}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }
}
