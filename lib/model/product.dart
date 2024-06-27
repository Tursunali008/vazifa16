import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String id;
  String title;
  Color color;
  int price;

  Product({
    required this.id,
    required this.title,
    required this.color,
    required this.price,
  });

  

  void updateProduct(String newText, int newPrice) {
    title = newText;
    price = newPrice;
    notifyListeners();
  }
}