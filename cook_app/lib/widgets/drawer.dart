import 'package:cook_app/pages/contact-page.dart';
import 'package:cook_app/pages/login-page.dart';
import 'package:cook_app/pages/recipe-list.dart';
import 'package:cook_app/pages/shopping-list.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
              }),
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
            title: Text('Contact'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage(),
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ));
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),);
            },
          ),
        ],
      ),
    );
  }
}
