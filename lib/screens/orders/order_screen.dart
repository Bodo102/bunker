// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => OrderScreen());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AppBar(title:Text('order')),
      
    );
  }
}