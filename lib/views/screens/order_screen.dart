import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/providers/order_provider.dart';
import 'package:vazifa16/views/widgets/custom_drower.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final orders = ordersProvider.orders;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) => OrderItem(orders[i]),
      ),
    );
  }
}