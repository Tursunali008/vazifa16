import 'package:flutter/material.dart';
import 'package:vazifa16/model/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      price: 29.99,
      description: 'A red shirt - it is pretty red!',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      price: 59.99,
      description: 'A nice pair of trousers.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
  ];

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _items[index] = newProduct;
      notifyListeners();
    }
  }
}