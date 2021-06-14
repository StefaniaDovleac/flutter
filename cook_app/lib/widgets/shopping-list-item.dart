import 'package:flutter/material.dart';

class ShoppingListItemCard extends StatelessWidget {
  const ShoppingListItemCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: ListTile(
          title: Text('Milk'),
          subtitle: Text('2'),
          trailing: Checkbox(
            onChanged: (value) {
              print(value);
            },
            activeColor: Colors.green,
            value: true,
          ),
        ));
  }
}
