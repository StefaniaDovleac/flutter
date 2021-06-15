import 'package:cook_app/pages/login-page.dart';
import 'package:flutter/material.dart';

class PageAnimation extends StatefulWidget {
  @override
  PageAnimationState createState() => PageAnimationState();
}

class PageAnimationState extends State<PageAnimation>
    with SingleTickerProviderStateMixin {
  final sizeFactor = 150;

  AnimationController controller;
  Animation animation;
  bool _isRunning;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        // animate 0 to 1 over duration specified
        duration: Duration(milliseconds: 800),
        vsync: this);

    animation = Tween<double>(begin: 100, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat(min: 0.4);
    _isRunning = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_isRunning) {
            // controller.stop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                ));

            final snackBar = SnackBar(
              content: Text('Login snackbar'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _isRunning = false;
          } else {
            controller.repeat(min: 0.4);
            _isRunning = true;
          }
        },
        child: Center(
            child: Container(
                width: animation.value,
                height: animation.value,
                child: Row(
                  children: [
                    Icon(
                      Icons.restaurant_menu_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(width: 7),
                    Text("Click me!"),
                  ],
                ),
                color: Colors.green)));
  }
}
