import 'package:cook_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final String title;
  final List<String> preparationSteps;
  RecipePage(this.title, this.preparationSteps);

  @override
  Widget build(BuildContext context) {
    const prepMock = ['step0', 'step1', 'step2'];
    const ingredientsMock = ['milk', 'oil', 'egg'];

    return Scaffold(
      drawer: MyDrawer(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.restaurant_rounded),
                  text: 'Ingredients',
                ),
                Tab(
                    icon: Icon(Icons.emoji_food_beverage_sharp),
                    text: 'Preparation Steps')
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant_menu),
                SizedBox(width: 10),
                Text(title),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Text(preparationSteps.join(','))
              // ListView.builder(
              //     itemCount: preparationSteps.length,
              //     itemBuilder: (BuildContext context, int position) {
              //       return Card(
              //         color: Colors.white,
              //         elevation: 2.0,
              //         child: ListTile(
              //           leading: CircleAvatar(
              //             backgroundColor: Colors.green,
              //             child: Text(position.toString()),
              //           ),
              //           title: Text(this.preparationSteps[position],
              //               style: TextStyle(fontWeight: FontWeight.bold)),
              //         ),
              //       );
              //     }),

              ListView.builder(
                  itemCount: ingredientsMock.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   backgroundColor: Colors.green,
                        //   child: Text(position.toString()),
                        // ),
                        title: Text(
                            ingredientsMock[position] +
                                " - " +
                                position.toString() +
                                'BUC',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  }),

              ListView.builder(
                  itemCount: prepMock.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(position.toString()),
                        ),
                        title: Text(prepMock[position],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
