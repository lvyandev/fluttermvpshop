import 'package:flutter_mvp_shop/base/sql_manager.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDbDao {
  bool isTableExists = false;

  String tableSqlString();

  String tableName();

  String tableBaseString(String name, String columnId) {
    return '''
        create table $name (
        $columnId TEXT not null,
      ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  Future<void> prepare(name, String createSql) async {
    isTableExists = await SqlManager.isTableExits(name);
    if (!isTableExists) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  Future<Database> open() async {
    if (!isTableExists) {
      await prepare(tableName(), tableSqlString());
    }
    return await SqlManager.getCurrentDatabase();
  }

  Future<void> deleteAll() async {
    if (isTableExists) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute('''
        DELETE FROM ${tableName()}
        ''');
    }
  }
}
