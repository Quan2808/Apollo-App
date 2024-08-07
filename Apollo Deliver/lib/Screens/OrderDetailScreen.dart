import 'package:flutter/material.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';
import 'package:apollodeliver/Services/DeliveryService.dart';

class OrderDetailScreen extends StatefulWidget {
  final int orderId;
  final String token;
  final String email;

  OrderDetailScreen({required this.orderId, required this.token, required this.email});

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  ShopOrder? order;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOrderDetail();
  }

  void _fetchOrderDetail() async {
    try {
      DeliveryService service = DeliveryService(widget.token);
      Map<String, dynamic> orderData = await service.getOrderById(widget.orderId);
      setState(() {
        order = ShopOrder.fromJson(orderData);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to load order details: $e");
    }
  }

  void _acceptOrder() async {
    try {
      DeliveryService service = DeliveryService(widget.token);
      await service.acceptOrder(order!.id!, widget.email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order accepted successfully')));
      setState(() {
        order!.status = "ACCEPTED";
      });
    } catch (e) {
      print("Failed to accept order: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to accept order')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : order == null
          ? Center(child: Text('Order not found'))
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order!.id}'),
            Text('Order Date: ${order!.orderDate}'),
            Text('Status: ${order!.status}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _acceptOrder,
              child: Text('Accept Order'),
            ),
          ],
        ),
      ),
    );
  }
}
