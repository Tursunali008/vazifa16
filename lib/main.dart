import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/providers/cart_proveder.dart';
import 'package:vazifa16/providers/order_provider.dart';
import 'package:vazifa16/providers/product_provider.dart';
import 'package:vazifa16/views/screens/cart_screen.dart';
import 'package:vazifa16/views/screens/order_screen.dart';
import 'package:vazifa16/views/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: MaterialApp(
        title: 'Online Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          hintColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: ProductScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}