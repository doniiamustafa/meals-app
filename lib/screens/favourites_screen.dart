import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {

      if (favouriteMeals.isEmpty)
        {
          return Center(
            child: Text('Favourites'),
          );
        }
      else{
        return ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              imageUrl: favouriteMeals[index].imageUrl,
              title: favouriteMeals[index].title,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
            );
          },
          itemCount: favouriteMeals.length,
        );
      }

  }
}
