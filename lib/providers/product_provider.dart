import 'package:flutter/material.dart';
import 'package:vazifa16/model/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "Supra",
      color: Colors.pink,
      price: 1003440,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "BMW",
      color: Colors.blue,
      price: 12345,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Mers",
      color: Colors.yellow,
      price: 32454,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Skyline",
      color: Colors.amber,
      price: 34567,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Bently",
      color: Colors.green,
      price: 234500,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void editProduct(String productId, String newTitle, int newPrice) {
    int index = _list.indexWhere((element) => element.id == productId);
    if (index != -1) {
      _list[index] = Product(
        id: _list[index].id,
        title: newTitle,
        color: _list[index].color,
        price: newPrice,
      );
    }
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _list.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
