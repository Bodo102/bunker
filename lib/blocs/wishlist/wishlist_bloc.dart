// ignore_for_file: override_on_non_overriding_member, no_leading_underscores_for_local_identifiers, prefer_const_constructors, depend_on_referenced_packages


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '../../models/favorite_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()); 


  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async*{
    if (event is StartWishList){
      yield*_mapStartWishListToState();
    }else if (event is AddWishListProduct){
      yield*_mapAddWishListProductToState(event,state);
    }else if (event is RemoveWishListProduct){
      yield*_mapRemoveWishListProductToState(event,state);
  }
  }
  
Stream<WishlistState> _mapStartWishListToState() async*{
  yield WishlistLoading();
  try {
   await Future<void>.delayed(Duration(seconds: 1));
   yield  WishlistLoaded(wishlist: WishlistModel());
   }catch(_){}
}

Stream<WishlistState> _mapAddWishListProductToState(
  AddWishListProduct event,
  WishlistState state,
) async*{
  if (state is WishlistLoaded){
    try{
      yield WishlistLoaded(wishlist: WishlistModel(products: List.from(state.wishlist.products)..add(event.productWishlist)));
      }catch(_){}
  }
}

Stream<WishlistState> _mapRemoveWishListProductToState(
  RemoveWishListProduct event,
  WishlistState state,
) async*{
  if (state is WishlistLoaded){
    try{
      yield WishlistLoaded(wishlist: WishlistModel(products: List.from(state.wishlist.products)..remove(event.product)));
      }catch(_){}
  }
}

}