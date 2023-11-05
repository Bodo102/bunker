// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '../../widget/widget.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(title: ('')),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.Categories.map((category) => HeroCarouselCard(category: category))
              .toList(),
            )
            ),
            SectionTitle(title: 'RECOMMENDED',),
      
            SizedBox(height: 10,),

            

            SectionTitle(title: 'RECOMMENDED',),
      
            SizedBox(height: 10,),
      
           ProductCarousel(products : Product.products.where((product) => product.isRecommended).toList()),
      
           SectionTitle(title: 'PAPILAR',),
      
            SizedBox(height: 10,),
      
           ProductCarousel(products : Product.products.where((product) => product.isPapular).toList()),
          ],
        ),
      ),
    );
  }
}




// Product card


