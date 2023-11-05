// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProfileScreen());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedIcon(icon: AnimatedIcons.add_event, progress: kAlwaysCompleteAnimation,color: Colors.black,),
      
    );
  }
}