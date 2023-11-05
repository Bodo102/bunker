part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent{}

class AddWishListProduct extends WishlistEvent{
  final Product productWishlist;

  const AddWishListProduct(this.productWishlist);

  @override
  List<Object> get props => [productWishlist];
}

class RemoveWishListProduct extends WishlistEvent{
  final Product product;

  const RemoveWishListProduct(this.product);

  @override
  List<Object> get props => [product];
}