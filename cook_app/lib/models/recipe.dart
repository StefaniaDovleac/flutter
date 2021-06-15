class Recipe {
  final String name;
  final String image;
  final String totalTime;
  final double rating;
  final List<String> prepartionSteps;

  Recipe(
      {this.name,
      this.image,
      this.totalTime,
      this.rating,
      this.prepartionSteps});

  factory Recipe.fromJson(dynamic json) {
    // print(
    //   json['preparationSteps'] as List<String>,
    // );

    var mockPrepSteps = ["Step1", 'Step2', 'Step3'];
    return Recipe(
      name: json['details']['name'] as String,
      image: json['details']['images'][0]['hostedLargeUrl'] as String,
      totalTime: json['details']['totalTime'] as String,
      rating: json['details']['rating'] as double,
      // prepartionSteps: json['preparationSteps'] as List<String>,
      prepartionSteps: mockPrepSteps.toList()
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

class Ingredient {
  String name;
  int quantity;

  Ingredient({this.name, this.quantity});
}
