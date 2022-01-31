import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details';
  Function manageFavourites;
  Function isFavouriteMeal;

  MealDetailsScreen(this.manageFavourites, this.isFavouriteMeal);

  Widget buildTitleSection(BuildContext ctx, String title) {
    //to avoid duplicate code
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.caption,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    //to avoid duplicate code
    return Container(
        padding: EdgeInsets.all(10),
        height: 160,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) =>
        meal.id ==
        mealID); //raga3li bs el meal eli el id bt3ha howa howa el meal id eli el user das 3aleh
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            buildTitleSection(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                //listView b3tha as a child (parameter)
                itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Text('${selectMeal.ingredients[index]}'),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildTitleSection(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        // backgroundColor: Theme.of(context).accentColor,
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('${selectMeal.steps[index]}'),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     Navigator.of(context).pop(mealID);
      //   }
      // ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
              isFavouriteMeal(mealID) ? Icons.star : Icons.star_border
          ),
          onPressed: () => manageFavourites(mealID)),
    );
  }
}
