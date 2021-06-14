import 'package:cook_app/pages/recipe-list.dart';
import 'package:cook_app/pages/shopping-list.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Recipes list'),
            onTap: () {              
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RecipeList(),
                  ));
            }
          ),
          ListTile(
            title: Text('Shopping List'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ShoppingList(),
                  ));
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.of(context).pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ShoppingList(),
                  ));
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),);
            },
          ),
        ],
      ),
    );
  }
}
