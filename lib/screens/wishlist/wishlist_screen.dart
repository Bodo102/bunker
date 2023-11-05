// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/wishlist/wishlist_bloc.dart';
import '../../widget/favorite_product_card.dart';



class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
        leading: BackButtonIcon(),
        title: Text('My Items', style: TextStyle(color: Colors.green, fontSize: 28)),
        elevation: 0,
        backgroundColor: Colors.white,
        ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading){
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );}
          if (state is WishlistLoaded){  
            return GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 3              
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {

                return FavProductCard(
                  product: state.wishlist.products[index],
                );
              });}
            else {return Text('Somthing went wrong');}  
          }          
        
  ),
    );
  }
}