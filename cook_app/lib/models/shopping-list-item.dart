import 'package:cook_app/pages/shopping-list.dart';

class ShoppingListItem {
  int id;
  String name;
  int quantity;
  ShoppingListItem({this.name, this.quantity});
  ShoppingListItem.withId({this.id, this.name, this.quantity});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['quantity'] = "quantity";
    return map;
  }

  factory ShoppingListItem.fromMap(Map<String, dynamic> map) {
    return ShoppingListItem.withId(
        id: map['id'], name: map['name'], quantity: map['quantity']);
  }

  
}
