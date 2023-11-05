
// ignore_for_file: avoid_print, unreachable_switch_case, prefer_const_constructors

import 'package:flutter/material.dart';
import '/home.dart';
import '/models/models.dart';
import '/screens/screens.dart';

import '../screens/categories_page/categories_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/': 
       return HomeScreen.route();
      case HomeScreen.routeName:
       return HomeScreen.route();
      case CategoryScreen.routeName:
       return CategoryScreen.route(category: settings.arguments as Category);
      case CartScreen.routeName:
       return CartScreen.route();
      case ProductScreen.routeName:
       return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
       return WishlistScreen.route();
       case CategoriesPage.routeName:
       return CategoriesPage.route();
       case Home.routeName:
       return Home.route();
       
           
      default:
       return _errorRoute(); 
    }
  }
}

   Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/erorr'),
      builder: (_) => Scaffold(appBar:AppBar(title: Text('Erorr'),)));
  }