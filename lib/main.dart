// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/cart/cart_bloc.dart';
import '/blocs/wishlist/wishlist_bloc.dart';
import '/config/app_router.dart';
import '/config/theme.dart';
import '/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
       ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: ('Elm3dawy store'),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          "/": (context) => const Home(),
        },
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
