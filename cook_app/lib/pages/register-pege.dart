import 'package:cook_app/pages/home-page.dart';
import 'package:cook_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
        final nameField = TextField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
   

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            )),
        child: Text("Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[                  
                    nameField,
                    SizedBox(height: 24.0),
                    emailField,
                    SizedBox(height: 24.0),
                    passwordField,
                    SizedBox(
                      height: 36.0,
                    ),
                    registerButton,
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
