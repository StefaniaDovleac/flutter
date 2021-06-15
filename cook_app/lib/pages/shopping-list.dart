import 'dart:async';
import 'package:cook_app/helpers/database.dart';
import 'package:cook_app/models/shopping-list-item.dart';
import 'package:cook_app/pages/add-item-page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ShoppingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<ShoppingListItem> shoppingList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (shoppingList == null) {
      shoppingList = List<ShoppingListItem>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        backgroundColor: Colors.green,
      ),
      body: getShoppingListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(
              ShoppingListItem(
                '',
                0,
              ),
              'Add Item');
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getShoppingListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(getFirstLetter(this.shoppingList[position].name),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            title: Text(this.shoppingList[position].name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(this.shoppingList[position].quantity.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _delete(context, shoppingList[position]);
                  },
                ),
              ],
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.shoppingList[position], 'Edit item');
            },
          ),
        );
      },
    );
  }

  getFirstLetter(String title) {
    return title.substring(0, 2);
  }

  void _delete(BuildContext context, ShoppingListItem item) async {
    int result = await databaseHelper.deleteItem(item.id);
    if (result != 0) {
      _showSnackBar(context, 'Item Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(ShoppingListItem item, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShoppingListItemDetail(item, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<ShoppingListItem>> shoppingListFuture =
          databaseHelper.getShoppingList();
      shoppingListFuture.then((shoppingList) {
        setState(() {
          this.shoppingList = shoppingList;
          this.count = shoppingList.length;
        });
      });
    });
  }
}
