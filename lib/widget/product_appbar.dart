// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, camel_case_types

import 'package:flutter/material.dart';

class product_appbar extends StatelessWidget implements PreferredSizeWidget{



  const product_appbar({
    
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
    leading: BackButton(color: Colors.black,),  
    backgroundColor: Colors.white,
    elevation: 0,
    );
  }
  @override
   Size get preferredSize => Size.fromHeight(50);
}
