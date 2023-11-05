// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unnecessary_this

import 'package:flutter/material.dart';
import '/models/models.dart';


class HeroCarouselProductCard extends StatelessWidget {
final Category? category;
final Product? product;

const HeroCarouselProductCard ({
   this.category,
   this.product,
});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        if (this.product == null) {

         Navigator.pushNamed(
          context, '/category', 
          arguments: category); 
        }
        
      },
      child: Container(
       margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
       child: ClipRRect(
         borderRadius: BorderRadius.all(Radius.circular(5.0)),
         child: Stack(
           children: <Widget>[
             Image.network(
              product == null ? category!.imageUrl : product!.imageUrl, 
              fit: BoxFit.contain, 
              width: 1000.0),

             Positioned(
               bottom: 0.0,
               left: 0.0,
               right: 0.0,
               child: Container(
                 decoration: BoxDecoration(
                  
                   gradient: LinearGradient(
                     colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255)
                     ],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                   ),
                 ),
                 padding: EdgeInsets.symmetric(
                     vertical: 10.0, horizontal: 20.0),
                 child: Text(
              product == null ? category!.name : '', 
                   style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)
                   ),
                 ),
               ),
           ],
         )),
     ),
    )
    ;
  }
}