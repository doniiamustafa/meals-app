import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favourites_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  BottomNavigationBarScreen(this.favouriteMeals);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
 List<Map<String, Object>> _pages ;
  int indexPageSelected = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Your Favourites'},
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      indexPageSelected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[indexPageSelected]['title'])),
      drawer: MainDrawer(),
      body: _pages[indexPageSelected]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        //automatic by3bat el index m3 el function
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed, //as default w arga3 el backgroundcolor
        currentIndex: indexPageSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
            // backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
            // backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
