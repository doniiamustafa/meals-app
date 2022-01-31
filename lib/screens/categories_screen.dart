import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: Text('DeliMeals',),
      // ),
      // body:
      GridView(
        // children:[   mayenfa3sh 3lshan el children carry list of widgets w dummy categories list of constructors, lazem a7welha map
        //   CategoryItem(title:DUMMY_CATEGORIES[0].title, color:DUMMY_CATEGORIES[0].color)
        // ],
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((categoryData) =>
              CategoryItem(id: categoryData.id,title: categoryData.title, color: categoryData.color,))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // gridDelegate:Control layout of grid item , Sliver make it Scrollable as GridView is scrollable
          maxCrossAxisExtent: 200,
          // maximum size of one grid item width = 200, depends on device size how many cols will get which means how many item per row
          childAspectRatio: 1,
          // ratio between items 3/2 = 1.5, how item should be sized regarding their height (relation between height and width), so for 200 width i want 300 for height (3/2)
          crossAxisSpacing: 20,
          // width space between items 20
          mainAxisSpacing: 20
            // height space between items 20, means how much distance between cols and rows in our grid
      ),
    );
  }
}
