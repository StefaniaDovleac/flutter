import 'package:cook_app/models/shopping-list-item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String shoppingListTable = 'shoppingList_table';
  String colId = 'id';
  String colName = 'name';
  String colQuantity = 'quantity';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'shoppingList.db';

    // Open/create the database at a given path
    var shoppingListDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return shoppingListDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $shoppingListTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colQuantity INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getShoppingListItemsMapList() async {
    Database db = await this.database;

    var result = await db.query(shoppingListTable, orderBy: '$colName ASC');
    return result;
  }

  Future<int> insertItem(ShoppingListItem item) async {
    Database db = await this.database;
    var result = await db.insert(shoppingListTable, item.toMap());
    return result;
  }

  Future<int> updateItem(ShoppingListItem item) async {
    var db = await this.database;
    var result = await db.update(shoppingListTable, item.toMap(),
        where: '$colId = ?', whereArgs: [item.id]);
    return result;
  }

  Future<int> deleteItem(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $shoppingListTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $shoppingListTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<ShoppingListItem>> getShoppingList() async {
    var shoppingListMapList =
        await getShoppingListItemsMapList(); // Get 'Map List' from database
    int count =
        shoppingListMapList.length; // Count the number of map entries in db table

    List<ShoppingListItem> shoppingListItems = List<ShoppingListItem>();
    for (int i = 0; i < count; i++) {
      shoppingListItems.add(ShoppingListItem.fromMapObject(shoppingListMapList[i]));
    }

    return shoppingListItems;
  }
}
