import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/providers/cart_proveder.dart';
import 'package:vazifa16/providers/product_provider.dart';
import 'package:vazifa16/views/screens/product_screen.dart';
import 'package:vazifa16/views/widgets/styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return ProductsController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return CartProveder();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: ProductsScreen(),
        );
      },
    );
  }
}