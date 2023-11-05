// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
final String title ;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) :super (key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(Icons.abc, size: 80, color: Colors.amber,),
      ),
        actions: [Padding(
          padding: const EdgeInsets.all(1.0),
          child: IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_basket, color: Colors.green, size: 35,)),
        )],
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 249, 252, 251),
      bottom:
       PreferredSize(
         preferredSize: Size.fromHeight(56),
         
         child: Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
    
            decoration:
              InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: ('Search Products,Categories...'),
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.barcode_viewfinder,color: Colors.green,size: 30,)),
                prefixIcon: Icon(CupertinoIcons.search,color: Colors.green,size: 30,)
              )),
          ),
        )
    );
  }
  
  @override
   Size get preferredSize => Size.fromHeight(130);
}
