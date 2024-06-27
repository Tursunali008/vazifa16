import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vazifa16/model/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
                '\$${order.products.fold(0, (sum, item) => sum + item.price * item.quantity)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}