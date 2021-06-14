import 'package:cook_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'login-page.dart';

class MyApp extends StatelessWidget {
  final appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: MyDrawer()
    );
  }
}


