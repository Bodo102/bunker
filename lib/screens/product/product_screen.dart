// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/wishlist/wishlist_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../models/product_model.dart';
import '../../widget/hero_prodact.dart';
import '../../widget/product_appbar.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = '/product';

  static Route route({
    required Product product
    
 
    }) {
    return MaterialPageRoute(
      settings: const RouteSettings(),
      builder: (context) => ProductScreen(product: product ,quantity: 1),
    );
  }

  final Product product;
  final bool isFavorite;
    final int quantity;


  const ProductScreen({
    required this.quantity,
    required this.product,
    this.isFavorite = false,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isFavorite = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const product_appbar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: 70,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {

              return
              
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 if (widget.quantity == 0)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(widget.product));
                        
                      },
                      child: Text(
                        'Add  to cart',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  if (widget.quantity > 0)
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(CartProductRemoved(widget.product));
                            setState(() {
                              
                            });
                          },
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.grey),
                        ),
                        Text(
                          '${widget.quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(CartProductAdded(widget.product));
                            setState(() {
                              
                            });
                          },
                          icon:
                              const Icon(Icons.add_circle, color: Colors.green),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: false,
                ),
                items:
                    [HeroCarouselProductCard(product: widget.product)].toList(),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    bool isProductFavorite = state is WishlistLoaded &&
                        state.wishlist.products.contains(widget.product);
                    return IconButton(
                      icon: Icon(
                        isProductFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 40,
                        color: isProductFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        if (isProductFavorite) {
                          BlocProvider.of<WishlistBloc>(context)
                              .add(RemoveWishListProduct(widget.product));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Removed from your wishlist!'),
                              backgroundColor: Colors.green,
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(top: 20),
                              duration: Duration(milliseconds: 700),
                            ),
                          );
                        } else {
                          BlocProvider.of<WishlistBloc>(context)
                              .add(AddWishListProduct(widget.product));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to your wishlist!'),
                              backgroundColor: Colors.green,
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(top: 20),
                              duration: Duration(milliseconds: 700),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            color: Colors.green[50],
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '${widget.product.price} EGP',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: Colors.green),
                            ),
                          ),
                          // Rest of the code...
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
