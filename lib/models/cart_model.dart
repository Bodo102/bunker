import 'package:equatable/equatable.dart';
import '/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  Map<Product, int> productQuantity(List<Product> products) {
    var quantity = <Product, int>{};

    products.forEach((product) {
      quantity[product] = (quantity[product] ?? 0) + 1;
    });

    return quantity;
  }

  double delivaryFee(subtotal) {
    if (subtotal >= 600.0) {
      return 0.0;
    } else
      return 10.0;
  }

  double total(subtotal, delivaryFee) {
    return subtotal + delivaryFee(subtotal);
  }

  String freeDrlivery(subtotal) {
    if (subtotal >= 600) {
      return 'You have Free Delivery';
    } else {
      double missing = 600.0 - subtotal;
      return 'Add ${missing.toStringAsFixed(2)} EGP for FREE Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, delivaryFee).toStringAsFixed(2);

  String get delivaryFeeString => delivaryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDrlivery(subtotal);

  @override
  List<Object?> get props => [products];
}
