import 'package:cook_app/models/recipe.api.dart';
import 'package:cook_app/models/recipe.dart';
import 'package:flutter/material.dart';

import 'package:cook_app/widgets/recipe_card.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Recipe> _recipeList;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipeList = await RecipeAAPI.getRecipes();
    setState(() {
      _isLoading = false;
    });

    print(_recipeList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipes'),
            ],
          ),
        ),
        body:_isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipeList.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipeList[index].name,
                      cookTime: _recipeList[index].totalTime,
                      rating: _recipeList[index].rating.toString(),
                      thumbnailUrl: _recipeList[index].image);
                },
              ));
  }
}
