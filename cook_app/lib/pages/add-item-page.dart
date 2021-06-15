import 'package:cook_app/helpers/database.dart';
import 'package:cook_app/models/shopping-list-item.dart';
import 'package:flutter/material.dart';

class ShoppingListItemDetail extends StatefulWidget {
  final String appBarTitle;
  final ShoppingListItem item;

  ShoppingListItemDetail(this.item, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ShoppingListItemDetailState(this.item, this.appBarTitle);
  }
}

class ShoppingListItemDetailState extends State<ShoppingListItemDetail> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  ShoppingListItem item;

  TextEditingController nameController = TextEditingController();
  TextEditingController quntityController = TextEditingController();

  ShoppingListItemDetailState(this.item, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    nameController.text = item.name;
    quntityController.text = item.quantity.toString();

    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToLastScreen();
                }),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: nameController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Name Text Field');
                      updateName();
                    },
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: quntityController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Quantity Text Field');
                      updateQuantity();
                    },
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                       Expanded(
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateName() {
    item.name = nameController.text;
  }

  void updateQuantity() {
    item.quantity = int.parse(quntityController.text) ;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    int result;
    if (item.id != null) {
      // Case 1: Update operation
      result = await helper.updateItem(item);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertItem(item);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Item Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving item');
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (item.id == null) {
      _showAlertDialog('Status', 'No item was deleted');
      return;
    }

    int result = await helper.deleteItem(item.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Item Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Item');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
