import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screens/bottom_navigate_screen.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'models/meal.dart';
import 'screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void manageFavourites(String mealID) {
    int existingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {  //existingIndex = -1
     setState(() {
       favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
     });
    }
  }

  bool isFavourite(String mealID){
    return favouriteMeals.any((meal) => meal.id == mealID);
  }

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree)
          return false; // law el data eli gyali 3iza gluten w el meal eli el compiler wa2ef 3leha not glutenFree so, neglect it
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // dy shayla kol el pink shades , laken el primary color btakhod lon wa7ed bs ex:pink[600]
        accentColor: Colors.amber,
        // secondary color for buttons or drawers
        canvasColor: Color.fromRGBO(255, 251, 229, 1),
        // color of scaffold
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1) //DARK-GREY COLOR
                  ),
              bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1) //DARK-GREY COLOR
                  ),
              caption: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        "/": (ctx) => BottomNavigationBarScreen(favouriteMeals), // home
        // "/categories_meals": (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals), // to avoid hard coded
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(manageFavourites, isFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoriesScreen()); // law mal2etsh el route fl routes map, tro7 lel CategoriesScreen
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (ctx) =>
                CategoriesScreen()); // law mal2etsh el route fl route map wla el onGenerate el screen di heia eli htban bdal el error screen
      },

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
