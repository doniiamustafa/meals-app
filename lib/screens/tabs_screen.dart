import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 0,  //as default yb2a 3la awel screen
        child: Scaffold(
            appBar: AppBar(
              title: Text('Meals'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.category), text: 'Categories'),
                  Tab(icon: Icon(Icons.star), text: 'Favourites'),
                ],
              ),
            ),
            body: TabBarView(children: [
              CategoriesScreen(),
              FavouritesScreen(widget.favouriteMeals),
            ])));
  }
}
