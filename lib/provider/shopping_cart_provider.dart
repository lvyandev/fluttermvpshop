import 'package:flutter/foundation.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';

class ShoppingCartProvider with ChangeNotifier {
  final List<ShoppingCartBean> _list = [];

  List<ShoppingCartBean> get data => _list;

  void getAllItems() {
    ShoppingCartDao.instance.queryAll().then((data) {
      _list.clear();
      _list.addAll(data);
      notifyListeners();
    });
  }

  void addItem(ShoppingCartBean item) {
    ShoppingCartDao.instance.insert(item).then((index) => notifyListeners());
  }

  void deleteItem(String itemId) {
    ShoppingCartDao.instance.delete(itemId).then((index) => notifyListeners());
  }

  void increaseItemCount(ShoppingCartBean item) {
    item.count++;
    ShoppingCartDao.instance.update(item).then((index) => notifyListeners());
  }

  void decreaseItemCount(ShoppingCartBean item) {
    item.count--;
    ShoppingCartDao.instance.update(item).then((index) => notifyListeners());
  }

  void clear() {
    ShoppingCartDao.instance.deleteAll().then((index) => notifyListeners());
  }
}
