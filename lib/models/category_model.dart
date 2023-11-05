// ignore_for_file: empty_constructor_bodies, prefer_const_constructors, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });


  @override
  List<Object?> get props => [name, imageUrl];
  

 static List<Category> Categories = [
  Category(
    name: 'Soft Drinks', 
    imageUrl: 'https://img.freepik.com/free-photo/lemonade-drink-jar-glass-isolated-white-background_123827-23109.jpg?size=626&ext=jpg&ga=GA1.1.1071997553.1697541727&semt=ais'
    ),
  Category(
    name: 'Meat', 
    imageUrl: 'https://img.freepik.com/free-photo/raw-steak-white-paper_144627-10269.jpg?size=626&ext=jpg&ga=GA1.1.1071997553.1697541727&semt=ais'
    ),
  Category(
    name: 'Herbs & Seasoning', 
    imageUrl: 'https://img.freepik.com/free-photo/spices-herbs_1339-204.jpg?size=626&ext=jpg&ga=GA1.1.1071997553.1697541727&semt=ais'
    ),
  Category(
    name: 'jams & Honey', 
    imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/category/Jam_Spreads_Honeyy.jpg?format=webp&quality=100'
    ),
  Category(
    name: 'Bakery', 
    imageUrl: 'https://img.freepik.com/free-photo/homemade-crunchy-bread-with-grains_144627-362.jpg?size=626&ext=jpg&ga=GA1.1.1071997553.1697541727&semt=ais'
    ),
   Category(
    name: 'Canned Vegetables', 
    imageUrl: 'https://images.unsplash.com/photo-1534483509719-3feaee7c30da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60g'
  ),
  Category(
    name: 'Super Market', 
    imageUrl: 'https://mcprod.seoudisupermarket.com/media/catalog/category/164449461118.png?width=100'
  ),
  Category(
    name: 'Ice Cream', 
    imageUrl: 'https://img.freepik.com/free-photo/ice-cream-cone-white-surface_181624-57445.jpg?size=626&ext=jpg&ga=GA1.1.1071997553.1697541727&semt=ais'
  ),         
  ];
  


  }