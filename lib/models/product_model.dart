// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String id;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPapular;

 const Product({
  required this.name,
  required this.id,
  required this.category,
  required this.imageUrl,
  required this.price,
  required this.isRecommended,
  required this.isPapular,
 }) ;
  



  @override
  List<Object?> get props => [
    name,
    category, 
    imageUrl, 
    price, 
    isRecommended, 
    isPapular
     ];

static List<Product> products=[
Product(
  id: 'product 1',
  name: 'Pepsi 330 ml',
  category: 'Soft Drinks', 
  imageUrl: 'https://i.pinimg.com/564x/29/13/9d/29139dc443ffba41126718775e2d3bd8.jpg', 
  price: 10 ,
  isRecommended: true, 
  isPapular: false,
  ),
Product(
  id: 'product 2',  
  name: 'Steak 1 kg',
  category: 'Meat', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/d/o/dosh.jpg?fit=bounds&format=webp&height=200&quality=85&width=200', 
  price: 330 ,
  isRecommended: true, 
  isPapular: false,
  ),
Product(
  id: 'product 3',
  name: 'Jam 350 g',
  category: 'jams & Honey', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/6/2/6221029670157_380g.jpg', 
  price: 35 ,
  isRecommended: false, 
  isPapular: true,
  ),
Product(
  id: 'product 4',
  name: 'Honey',
  category: 'jams & Honey', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/6/2/6224008467144_450g_44.jpg', 
  price: 120 ,
  isRecommended: true, 
  isPapular: true,
  ),
Product(
  id: 'product 5',
  name: 'Dolphin Gold Smoked Tuna Slices',
  category: 'Canned Vegetables', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/6/2/6224009352401_---2.jpg', 
  price: 50 ,
  isRecommended: false, 
  isPapular: true,
  ),
Product(
  id: 'product 6',
  name: 'Americana Plain Fava Beans',
  category: 'Canned Vegetables', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/a/m/americana_fava_beans_400g.png', 
  price: 15 ,
  isRecommended: true, 
  isPapular: true,
  ),
 Product(
  id: 'product 7',
  name: 'Rich Bake Petit Pain Breads',
  category: 'Bakery', 
  imageUrl: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/6/2/6223000432341_rich_bake.jpg', 
  price: 18 ,
  isRecommended: true, 
  isPapular: true,
  ),          
] ;     
    }

