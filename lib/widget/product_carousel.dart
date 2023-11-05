// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 330,
     child: ListView.builder(
       shrinkWrap: true,
       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
       scrollDirection: Axis.horizontal,
       itemCount: products.length,
       itemBuilder: (context, index){
         return Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: ProductWidget(product: products[index],),
         );
       }),
     );
  }
}
