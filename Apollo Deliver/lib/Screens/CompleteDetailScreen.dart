import 'package:flutter/material.dart';
import 'package:apollodeliver/Models/OrderDelivery.dart';
import 'package:apollodeliver/Services/DeliveryService.dart';

class CompleteDetailScreen extends StatefulWidget {
  final int orderId;
  final String token;

  CompleteDetailScreen({required this.orderId, required this.token});

  @override
  _CompleteDetailScreenState createState() => _CompleteDetailScreenState();
}

class _CompleteDetailScreenState extends State<CompleteDetailScreen> {
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
        order = orderData; // Đã là đối tượng OrderDelivery
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load order: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Order Details'),
      ),
      body: order == null
          ? Center(child: errorMessage.isNotEmpty ? Text(errorMessage) : CircularProgressIndicator())
          : Column(
        children: [
          ListTile(
            title: Text('Order ID: ${order?.id}'),
            subtitle: Text('Status: ${order?.status}'),
          ),
          // Additional details can be added here
        ],
      ),
    );
  }
}
