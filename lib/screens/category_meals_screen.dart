import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories_meals';

  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTile;
  List<Meal> displayMeals;
  var loadedInitData = false;   //description in didChangeDepend...

  @override
  void initState() {    // el init state lma 7atet fiha el code eli fl didchangedependencies 3mal error leh? 3lshan satr el routeArgs da byt3mlo run b3d ma el page t build
                       // w el initState byt3mlha build abl ma el page nfsha ttkawen fa msh byla2i el context fa by3mel error
    super.initState();
  }

  @override
  void didChangeDependencies() {   //leh 3amlt loadedInitData variable? 3lshan fy setState fl removeMeal fn so, el screen bt3mel rebuild lel state so, el meals kolha btt3rad akeni mamsa7tesh 7aga fa 3amlt condition eno y3mel intialize lel data mara wa7da bs
                                   // incase eni tala3t mn el page w dakhlt tani, fa kda b3mel lel state reset w bygeli state gdeda ya3ne barga3 kol 7aga zai ma kanet el loaded variable = false w el meals kolha m3roda
    if(! loadedInitData) {    // = loadedInitData == false
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTile = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayMeals = widget.availableMeals.where((meal) {
        // return with a condition
        return meal.categories.contains(
            categoryId); //ya3ne raga3li el meals bta3et el indian eli dost 3aleha bss
      }).toList();
      loadedInitData = true;

      super.didChangeDependencies();
    }

  }

  void removeMeal(String mealID){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealID );
    });

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTile),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return MealItem(
              id: displayMeals[index].id,
              imageUrl: displayMeals[index].imageUrl,
              title: displayMeals[index].title,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              duration: displayMeals[index].duration,
              removeID: removeMeal,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
