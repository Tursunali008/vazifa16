import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/model/product.dart';
import 'package:vazifa16/providers/cart_proveder.dart';
import 'package:vazifa16/providers/product_provider.dart';
import 'package:vazifa16/views/widgets/add_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("\$${product.price}"),
      trailing: Consumer<CartProveder>(
        builder: (context, controller, child) {
          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddProductAlertDialog(
                                isAdd: false,
                                product: product,
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<ProductsController>()
                            .deleteProduct(product.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                );
        },
      ),
    );
  }
}