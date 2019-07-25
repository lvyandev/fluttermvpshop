import 'package:flutter/cupertino.dart';
import 'package:flutter_mvp_shop/model/entity/category/category_bean.dart';
import 'package:flutter_mvp_shop/model/entity/category/sub_category_bean.dart';

class OnCategoryTapListener with ChangeNotifier {
  final List<SubCategoryBean> list = List();

  void onTapCategory(CategoryBean category) {
    list.clear();
    list.add(SubCategoryBean(
      categoryId: '00',
      subId: '00',
      subCategoryName: '全部',
    ));
    list.addAll(category.subCategories);
    notifyListeners();
  }
}
