part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();
  
  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

// ignore: empty_constructor_bodies
class WishlistLoaded extends WishlistState {
  final WishlistModel wishlist;

  const WishlistLoaded({
    required this.wishlist
    });

  @override
  List<Object> get props => [wishlist];
}

  


class WishlistError extends WishlistState {}

