import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class FavProductCard extends StatefulWidget {
  final Product product;
  final bool isWishlist;

  const FavProductCard(
      {Key? key, required this.product, this.isWishlist = false, })
      : super(key: key);

  @override
  _FavProductCardState createState() => _FavProductCardState();
}

class _FavProductCardState extends State<FavProductCard> {
  int productAmount = 0;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    // Check the initial cart state and update productAmount accordingly.
    final cartState = context.read<CartBloc>().state;
    if (cartState is CartLoaded) {
      final productQuantity = cartState.cart.productQuantity(cartState.cart.products);
      if (productQuantity.containsKey(widget.product)) {
        productAmount = productQuantity[widget.product]!;
        isAddedToCart = productAmount > 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: widget.product);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 140,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.product.imageUrl,
                  width: 110,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.green[50],
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '${widget.product.price} EGP',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
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
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            if (productAmount == 0)
              ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(widget.product));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text('Add to Cart'),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(widget.product));
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
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Colors.green,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
