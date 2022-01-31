import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filters';

   Function saveFilters;
  Map <String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var isGlutenFree = false;
  var isVegan = false;
  var isLactoseFree = false;
  var isVegetarian = false;

  @override
  initState(){
    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTitle(var currentValue, Function onChanged, String title, String subtitle) {
    return Expanded(
      child: ListView(
        children: [
          SwitchListTile(
            value: currentValue,
            onChanged: onChanged,
            title: Text(title),
            subtitle: Text(subtitle),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
         IconButton(onPressed: (){
           setState(() {
             var selectedFilters = {
               'gluten':isGlutenFree,
               'lactose':isLactoseFree ,
               'vegan': isVegan,
               'vegetarian': isVegetarian ,
             };
             widget.saveFilters(selectedFilters);
           });

         },  //3lshan a3raf awsal lel function lazem widget.
             icon: Icon(Icons.save)),
        ],
      ),

      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            buildSwitchListTitle(isGlutenFree, (newvalue){
             setState(() {
               isGlutenFree = newvalue;
             });
            }, 'Gluten-Free', 'Only include Gluten free meals.'),
            buildSwitchListTitle(isVegan, (newvalue){
              setState(() {
                isVegan = newvalue;
              });
            }, 'Vegan-Free', 'Only include Vegan free meals.'),

            buildSwitchListTitle(isLactoseFree, (newvalue){
              setState(() {
                isLactoseFree = newvalue;
              });
            }, 'Lactose-Free', 'Only include Lactose free meals.'),

            buildSwitchListTitle(isVegetarian, (newvalue){
              setState(() {
                isVegetarian = newvalue;
              });
            }, 'Vegetarian', 'Only include Vegetarian free meals.'),


          ],
        ),
      ),
    );
  }
}
