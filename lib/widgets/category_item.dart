import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void SelectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        // '/categories_meals',
      CategoryMealsScreen.routeName,
        arguments: {   // parameters
          'id': id,
          'title':title,
        });

   // Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx){
   //   return CategoryMealsScreen(id: id,title: title,);
   // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(title, style: Theme.of(context).textTheme.caption,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [color, color.withOpacity(0.5)]),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
