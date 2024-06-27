import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/model/product.dart';
import 'package:vazifa16/providers/cart_proveder.dart';
import 'package:vazifa16/views/screens/shopping_screen.dart';
import 'package:vazifa16/views/widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartProveder>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Savatcha bo'sh, mahsulot qo'shing"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  builder: (context, child) {
                    return const ProductItem();
                  },
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(),
            onPressed: () {},
            label: Text(
              "\$${cartController.cart.totalPrice}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(),
            onPressed: () {
              Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const ShoppingScreen(),
              ),
            );
            },
            label: const Text(
              "Shoping",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}