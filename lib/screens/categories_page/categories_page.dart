// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/models/category_model.dart';
import '../../../widget/widget.dart';


class CategoriesPage extends StatelessWidget {
  static const String routeName = '/categories';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CategoriesPage());
  }
  @override
  Widget build(BuildContext context) {
    final List<Category> category = Category.Categories.toList() ;
    return  Scaffold(
      appBar:CustomAppBar(title: ''),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          childAspectRatio:1) , 
        itemCount: category.length,
        itemBuilder: (BuildContext context ,int index){
          return Center(child: 
          Column(
            children: [
              CategoryWidget(
                category: category[index],
                widthFactor: 2.2,
                                ),
            ],
          ));
        }),
    );
  }
}