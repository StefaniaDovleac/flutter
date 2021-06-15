class ShoppingListItem {
  int _id;
  String _name;
  int _quantity;

  ShoppingListItem(this._name, this._quantity);

  ShoppingListItem.withId(this._id, this._name, this._quantity);

  int get id => _id;

  String get name => _name;

  int get quantity => _quantity;

  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set quantity(int newQuantity) {
    this._quantity = newQuantity;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['quantity'] = _quantity;

    return map;
  }

  // Extract a Note object from a Map object
  ShoppingListItem.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._quantity = map['quantity'];
  }
}
