import 'package:flutter_mvp_shop/base/base_db_dao.dart';
import 'package:flutter_mvp_shop/model/entity/shopping_cart/shopping_cart_bean.dart';
import 'package:flutter_mvp_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class ShoppingCartDao extends BaseDbDao {
  static const String _TABLE_NAME = 'ShoppingCart';
  static const String _COLUMN_PRODUCT_NAME = 'goodsName';
  static const String _COLUMN_PRODUCT_ID = 'goodsId';
  static const String _COLUMN_PRODUCT_COUNT = 'count';
  static const String _COLUMN_PRODUCT_IMAGES = 'images';
  static const String _COLUMN_PRODUCT_PRICE = 'price';

  static ShoppingCartDao _instance = ShoppingCartDao._();

  static ShoppingCartDao get instance => _instance;

//  static ShoppingCartDao _getInstance() {
//    if (_instance == null) {
//      _instance = ShoppingCartDao._();
//    }
//    return instance;
//  }

  ShoppingCartDao._();

  @override
  String tableName() {
    return _TABLE_NAME;
  }

  @override
  String tableSqlString() {
    return tableBaseString(_TABLE_NAME, _COLUMN_PRODUCT_ID) +
        '''
        $_COLUMN_PRODUCT_NAME TEXT not null,
        $_COLUMN_PRODUCT_COUNT INT not null,
        $_COLUMN_PRODUCT_IMAGES TEXT not null,
        $_COLUMN_PRODUCT_PRICE DOUBLE not null)
    ''';
  }

  Future<ShoppingCartBean> query(String productId) async {
    Database dataBase = await getDataBase();
    List<Map<String, dynamic>> list = await dataBase.query(
      _TABLE_NAME,
      where: '$_COLUMN_PRODUCT_ID = ?',
      whereArgs: [productId],
    );

    ShoppingCartBean data;
    if (list.length > 0) {
      data = ShoppingCartBean.fromJson(list.first);
    }
    return data;
  }

  Future<List<ShoppingCartBean>> queryAll() async {
    Database dataBase = await getDataBase();
    List<Map<String, dynamic>> list = await dataBase.query(_TABLE_NAME);

    List<ShoppingCartBean> data = [];
    if (list.length > 0) {
      list.forEach((map) {
        data.add(ShoppingCartBean.fromJson(map));
      });
    }
    return data;
  }

  Future<int> insert(ShoppingCartBean info) async {
    Database database = await getDataBase();
    var bean = await query(info.goodsId);
    if (bean != null) {
      bean.count++;
      return await update(bean);
    } else {
      return await database.insert(_TABLE_NAME, info.toJson());
    }
  }

  Future<int> update(ShoppingCartBean info) async {
    Database database = await getDataBase();

    return await database.update(
      _TABLE_NAME,
      info.toJson(),
      where: '$_COLUMN_PRODUCT_ID = ?',
      whereArgs: [info.goodsId],
    );
  }

  Future<int> delete(String productId) async {
    Database database = await getDataBase();

    return await database.delete(
      _TABLE_NAME,
      where: '$_COLUMN_PRODUCT_ID = ?',
      whereArgs: [productId],
    );
  }
}
