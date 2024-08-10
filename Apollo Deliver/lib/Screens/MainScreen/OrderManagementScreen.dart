import 'package:apollodeliver/Screens/MainScreen/OrderDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:apollodeliver/Models/ShopOrder.dart';
import 'package:apollodeliver/Services/DeliveryService.dart';

class OrderManagementScreen extends StatefulWidget {
  final String token;
  final String email;

  OrderManagementScreen({required this.token, required this.email});

  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  List<ShopOrder> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  void _fetchOrders() async {
    try {
      DeliveryService service = DeliveryService(widget.token);
      List<ShopOrder> fetchedOrders = await service.getAllOrders();
      List<ShopOrder> acceptedOrders = fetchedOrders.where((order) => order.status == 'ACCEPTED').toList();
      print('Fetched Orders: $acceptedOrders'); // In dữ liệu để kiểm tra
      setState(() {
        orders = acceptedOrders;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to load orders: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Management'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? Center(child: Text('No orders found'))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text('Order ID: ${order.id}'),
            subtitle: Text('Status: ${order.status}'),
            trailing: IconButton(
              icon: Icon(Icons.details),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(
                      orderId: order.id!,
                      token: widget.token,
                      email: widget.email,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
