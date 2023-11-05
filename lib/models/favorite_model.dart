import 'package:equatable/equatable.dart';
import '/models/product_model.dart';

class WishlistModel extends Equatable{
  final List<Product> products;
  
  const WishlistModel({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

}
