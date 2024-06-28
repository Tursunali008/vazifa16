import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/providers/cart_proveder.dart';
import 'package:vazifa16/views/screens/cart_screen.dart';
import 'package:vazifa16/views/screens/category_details_screen.dart';
import 'package:vazifa16/views/screens/chec_out_screen.dart';
import 'package:vazifa16/views/screens/payment_success_screen.dart';
import 'package:vazifa16/views/screens/product_details_screen.dart';
import 'package:vazifa16/views/screens/product_listing_screen.dart';
import 'providers/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping app',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductListingScreen(),
          CategoryDetailsScreen.routeName: (ctx) => CategoryDetailsScreen(),
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          PaymentSuccessScreen.routeName: (ctx) => PaymentSuccessScreen(),
        },
      ),
    );
  }
}
