import 'package:flutter/foundation.dart';
import 'package:flutter_mvp_shop/db/shopping_cart_dao.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';

class ShoppingCartProvider with ChangeNotifier {
  final List<ShoppingCartBean> _list = [];

  List<ShoppingCartBean> get data => _list;

  int count;

  double totalPrice;

  bool isAllSelected = true;

  ShoppingCartProvider() {
    getAllItems();
  }

  void getAllItems() {
    ShoppingCartDao.instance.queryAll().then((data) {
      _list.clear();
      _list.addAll(data);
      isAllSelected = true;
      count = 0;
      totalPrice = 0;
      _list.forEach((item) {
        if (item.selected) {
          count += item.count;
          totalPrice += item.price * item.count;
        } else {
          isAllSelected = false;
        }
      });
      notifyListeners();
    });
  }

  void addItem(ShoppingCartBean item) {
    ShoppingCartDao.instance.insert(item).then((index) => getAllItems());
  }

  void deleteItem(String itemId) {
    ShoppingCartDao.instance.delete(itemId).then((index) => getAllItems());
  }

  void selectItem(ShoppingCartBean item) {
    item.selected = !item.selected;
    ShoppingCartDao.instance.update(item).then((index) => getAllItems());
  }

  void selectAll(bool selected) {
    isAllSelected = selected;
    ShoppingCartDao.instance
        .updateColumn('selected', selected ? 1 : 0)
        .then((v) => getAllItems());
  }

  void increaseItemCount(ShoppingCartBean item) {
    item.count++;
    ShoppingCartDao.instance.update(item).then((index) => getAllItems());
  }

  void decreaseItemCount(ShoppingCartBean item) {
    item.count--;
    ShoppingCartDao.instance.update(item).then((index) => getAllItems());
  }

  void clear() {
    ShoppingCartDao.instance.deleteAll().then((index) => getAllItems());
  }
}
