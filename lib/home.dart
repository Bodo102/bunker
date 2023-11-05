// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/screens/categories_page/categories_page.dart';
import '/screens/home/home_screen.dart';
import '/screens/orders/order_screen.dart';
import '/screens/profile/profile_screen.dart';
import '/screens/wishlist/wishlist_screen.dart';

class Home extends StatefulWidget {
    static const String routeName = '/';

    static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => Home());
  }

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex =0;
 final List <Widget> _tabs= [
 HomeScreen(),
 CategoriesPage(),
 WishlistScreen(),
 OrderScreen(),
 ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  
     Scaffold(


body: _tabs[_selectedIndex],

bottomNavigationBar:
BottomAppBar(
  
  color: Colors.white,
  child:   Padding(
  
    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
  
    child:   GNav(
   
      onTabChange:(newindex) {
        setState(() {
          _selectedIndex =newindex;
        });
      }, 
      
      backgroundColor: Colors.white,
      color: Colors.greenAccent,
      gap: 3,
      activeColor: Colors.yellow,
      tabBackgroundColor: Colors.green,    
      padding: EdgeInsets.all(15),
      tabActiveBorder: Border.symmetric(),
      tabs: [
  
      GButton(
        icon: Icons.home_filled,  
        text: "home",
      ),  
        GButton(
          icon: Icons.category_outlined,
          text: "Category",    
        ),
        GButton(
          icon: Icons.favorite_border,
          text: "My Items",
          ),
        GButton(
          icon: Icons.receipt_long,
          text: "orders",
          ),
        GButton(
          icon: Icons.settings,
          text: "settings",
          ),
    ],),
  ),
),
      
    );

  }
}