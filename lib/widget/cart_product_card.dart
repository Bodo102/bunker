// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/cart/cart_bloc.dart';

import '../models/product_model.dart';

class CartProductCard extends StatefulWidget {
  final Product product;
  final int quantity;

  const CartProductCard({super.key,
   required this.product,
   required this.quantity
   });

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: widget.product);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 140,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
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
                    width: 100,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
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
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
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
                            '${widget.quantity}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(CartProductAdded(widget.product));
                              setState(() {
                              });
                            },
                            icon: const Icon(Icons.add_circle),
                            color: Colors.green,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                           context.read<CartBloc>().add(CartProductRemoved(widget.product));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
