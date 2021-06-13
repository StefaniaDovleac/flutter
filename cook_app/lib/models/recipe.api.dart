import 'dart:convert';
import 'package:cook_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeAAPI {
  static Future<List<Recipe>> getRecipes() async {
    const authority = 'yummly2.p.rapidapi.com';
    const unencodedPath = 'feeds/list';
    var uri = Uri.https(authority, unencodedPath ,
    {"start": "0",
      "limit": "10",
      "tag": "list.recipe.popular"
    });

    final response = await http.get(uri, 
    headers: {
      	"x-rapidapi-key": "a78d3a071emsh867e7a80731a99fp1c4bb8jsnf6bb63123a37",
	      "x-rapidapi-host": "yummly2.p.rapidapi.com",
	      "useQueryString": "true"R
    }
    );

    Map data  = jsonDecode(response.body);
    List _tempList = [];
    for (var  i in data['feed']){
      _tempList.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapShot(_tempList);
  }
}
