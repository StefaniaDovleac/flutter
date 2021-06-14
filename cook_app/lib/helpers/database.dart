import 'package:cook_app/models/shopping-list-item.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'cook.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE shoppingListItems(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,quantity INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertItem(List<ShoppingListItem> shoppingListItems) async {
    int result = 0;
    final Database db = await initializeDB();
    for (ShoppingListItem item in shoppingListItems) {
      result = await db.insert('shoppingListItems', item.toMap());
    }
    return result;
  }

  Future<List<ShoppingListItem>> retrieveItems() async {
    final Database db = await initializeDB();
    final List<Map<String, Object>> queryResult =
        await db.query('shoppingListItems');
    return queryResult.map((e) => ShoppingListItem.fromMap(e)).toList();
  }

  Future<void> deleteItem(int id) async {
    final db = await initializeDB();
    await db.delete(
      'shoppingListItems',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
