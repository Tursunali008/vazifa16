import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/model/product.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: product.id,
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(product.imageUrl),
            Text(product.title),
            Text('\$${product.price}'),
          ],
        ),
      ),
    );
  }
}
