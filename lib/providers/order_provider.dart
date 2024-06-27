import 'package:flutter/material.dart';
import 'package:vazifa16/model/cart.dart';
import 'package:vazifa16/model/order.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        products: cartProducts,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}