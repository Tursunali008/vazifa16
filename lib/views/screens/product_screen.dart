import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/model/product.dart';
import 'package:vazifa16/providers/product_provider.dart';
import 'package:vazifa16/views/screens/cart_screen.dart';
import 'package:vazifa16/views/widgets/product_item.dart';

import '../widgets/add_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController =
        Provider.of<ProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotlar'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddProductAlertDialog(isAdd: true),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const CartScreen()),
              ),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return ProductItem();
            },
          );
        },
      ),
    );
  }
}
