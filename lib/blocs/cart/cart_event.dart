// ignore_for_file: prefer_const_constructors_in_immutables

part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
   CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final Product product;

   CartProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Product product;

   CartProductRemoved(this.product);
  
  @override
  List<Object> get props => [product];
}