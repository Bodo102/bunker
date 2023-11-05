// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_escapes, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryWidget extends StatelessWidget {
  final Category? category;
final Product? product;
  final double widthFactor;

  const CategoryWidget({
    this.category,
   this.product,
    this.widthFactor = 2.5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/category', arguments: category);
      },
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width/widthFactor,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration:
           BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                spreadRadius: 1
              )
            ],
            color: Colors.white,),
            
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/2.5 ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 120,
                  child: Image.network(
                    product == null ? category!.imageUrl : product!.imageUrl,
                    fit: BoxFit.cover,
                    ),
                ),
              ),
              Container(
           width: MediaQuery.of(context).size.width/2.5 - 10,
           height: 50,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), 
            color: Colors.white),
            child:
             Padding(
               padding: const EdgeInsets.all(3.0),
               child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                           product == null ? category!.name : '', 
                          style: TextStyle(color: Colors.black,
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold),
                          
                            ),    
                           
                      ],
                    ),
                  ),
                  
                ],
                             ),
             ),
            ),
            ],
          ),
        ),
        
       ],
      ),
    );
  }
}