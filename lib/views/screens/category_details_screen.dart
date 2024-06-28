import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/providers/product_provider.dart';
import '../widgets/product_item.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/category-details';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items
        .where((product) => product.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Details'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$category.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: products.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: products[i],
                child: ProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
