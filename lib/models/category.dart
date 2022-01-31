import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({   // 3amltha const 3lshan el data eli hatkhosh el constructor heia final fa once enha dakhlet msh hattghyar tani
   @required this.id,
   @required this.title,
    this.color = Colors.deepOrange
  });
}
