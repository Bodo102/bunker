// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widget/cutom_secondery_appbar.dart';
import '../../widget/widget.dart';


class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CategoryScreen(category : category));
  }

  final Category category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products.where((product) => product.category == category.name).toList() ;
    return  Scaffold(
      appBar: CustomSeconderyAppBar(title:category.name),
      body:GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:.6) , 
        itemCount: categoryProduct.length,
        itemBuilder: (BuildContext context ,int index){
          return Center(child: 
          ProductWidget(
            product: categoryProduct[index],
            widthFactor: 2.2,
            ));
        })
      
       
    );
  }
}