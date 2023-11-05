// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/cart/cart_bloc.dart';
import '/blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  final Product product;
  final double widthFactor;
  final bool isFavorite;
  int productAmount = 0;

  ProductWidget({
    required this.product,
    this.widthFactor = 2.5,
    this.isFavorite = false,
  });

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int productAmount = 0;
  bool isAddedToCart = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product', arguments: widget.product);
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / widget.widthFactor,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.black26,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.product.imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.green[50],
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '${widget.product.price} EGP',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 8),
                        if (productAmount == 0)
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(widget.product));
                        setState(() {
                          productAmount++;
                          isAddedToCart = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: Text('Add to Cart'),
                    ),
                  );
                },
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(widget.product));
                      setState(() {
                        productAmount--;
                        if (productAmount == 0) {
                          isAddedToCart = false;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                    color: Colors.grey,
                  ),
                  Text(
                    productAmount.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(widget.product));
                      setState(() {
                        productAmount++;
                      });
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Colors.green,
                  ),
                ],
              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  bool isProductFavorite = state is WishlistLoaded &&
                      state.wishlist.products.contains(widget.product);
                  return IconButton(
                    icon: Icon(
                      isProductFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
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
      ),
    );
  }
}
