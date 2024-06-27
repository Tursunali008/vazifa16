import 'package:flutter/material.dart';
import 'package:vazifa16/model/order.dart';

class OrderController extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}