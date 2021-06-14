import 'package:cook_app/helpers/database.dart';
import 'package:cook_app/models/shopping-list-item.dart';
import 'package:cook_app/pages/recipe-list.dart';
import 'package:cook_app/pages/shopping-list.dart';
import 'package:flutter/material.dart';

import 'pages/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: RecipeList(),
      home: ShoppingList(),
    );
  }
}
