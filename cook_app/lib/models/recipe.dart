class Recipe {
  final String name;
  final String image;
  final String totalTime;
  final double rating;
  // final String[] prepartionSteps;

  Recipe({this.name, this.image, this.totalTime, this.rating});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      totalTime: json['totalTime'] as String,
      rating: json['rating'] as double,
      // prepartionSteps: json['preparationSteps'] as double,
    );
  }

  static List<Recipe> recipesFromSnapShot(List list) {
    return list.map((l) {
      return Recipe.fromJson(l);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}

class Ingredient{
  String name; 
  int quantity;

  Ingredient({
    this.name, this.quantity
  });
}
