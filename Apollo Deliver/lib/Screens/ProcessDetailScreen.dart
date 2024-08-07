import 'package:flutter/material.dart';
import 'package:apollodeliver/Models/OrderDelivery.dart';
import 'package:apollodeliver/Services/DeliveryService.dart';

class ProcessDetailScreen extends StatefulWidget {
  final int orderId;
  final String token;

  ProcessDetailScreen({required this.orderId, required this.token});

  @override
  _ProcessDetailScreenState createState() => _ProcessDetailScreenState();
}

class _ProcessDetailScreenState extends State<ProcessDetailScreen> {
  OrderDelivery? order;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    try {
      final orderData = await DeliveryService(widget.token).getOrderDeliveryById(widget.orderId);
      setState(() {
        order = orderData; // Directly assigning as it's already OrderDelivery object
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load order: $e';
      });
    }
  }

  Future<void> updateOrderStatus(String newStatus) async {
    try {
      await DeliveryService(widget.token).changeOrderStatus(order!.id!, newStatus, '');
      setState(() {
        order?.status = newStatus;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to update order status: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Process Order Details'),
      ),
      body: order == null
          ? Center(child: errorMessage.isNotEmpty ? Text(errorMessage) : CircularProgressIndicator())
          : Column(
        children: [
          ListTile(
            title: Text('Order ID: ${order?.id}'),
            subtitle: Text('Status: ${order?.status}'),
          ),
          ElevatedButton(
            onPressed: () {
              updateOrderStatus('COMPLETED');
            },
            child: Text('Complete Order'),
          ),
        ],
      ),
    );
  }
}
