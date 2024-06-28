import 'package:flutter/material.dart';
import 'package:vazifa16/model/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Living Room Lamp',
      description: 'A beautiful lamp for your living room.',
      price: 29.99,
      imageUrl: 'assets/images/lamp.webp',
      category: 'Living Room',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
