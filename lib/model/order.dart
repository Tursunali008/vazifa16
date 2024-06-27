import 'package:vazifa16/model/cart.dart';

class Order {
  final String id;
  final List<Cart> products;
  final DateTime date;

  Order({
    required this.id,
    required this.products,
    required this.date,
  });
}