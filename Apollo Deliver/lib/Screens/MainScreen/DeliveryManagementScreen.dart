import 'package:apollodeliver/Screens/MainScreen/CompleteDetailScreen.dart';
import 'package:apollodeliver/Screens/MainScreen/ProcessDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:apollodeliver/Models/OrderDelivery.dart';
import 'package:apollodeliver/Services/DeliveryService.dart';

class DeliveryManagementScreen extends StatefulWidget {
  final String token;
  final String email;

  DeliveryManagementScreen({required this.token, required this.email});

  @override
  _DeliveryManagementScreenState createState() => _DeliveryManagementScreenState();
}

class _DeliveryManagementScreenState extends State<DeliveryManagementScreen> {
  List<OrderDelivery> pendingOrders = [];
  List<OrderDelivery> completedOrders = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      final List<OrderDelivery> orders = await DeliveryService(widget.token).getAllOrderDeliveries();
      setState(() {
        pendingOrders = orders.where((order) => order.status == 'PENDING').toList();
        completedOrders = orders.where((order) => order.status == 'COMPLETED').toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load orders: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Delivery Management'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'PROCESS'),
              Tab(text: 'COMPLETED'),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
            ? Center(child: Text(errorMessage))
            : TabBarView(
          children: [
            buildOrderList(pendingOrders, 'PENDING'),
            buildOrderList(completedOrders, 'COMPLETED'),
          ],
        ),
      ),
    );
  }

  Widget buildOrderList(List<OrderDelivery> orders, String status) {
    if (orders.isEmpty) {
      return Center(child: Text('No $status orders available'));
    }
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          title: Text('Order ID: ${order.id}'),
          subtitle: Text('Status: ${order.status}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => status == 'PENDING'
                    ? ProcessDetailScreen(orderId: order.id!, token: widget.token)
                    : CompleteDetailScreen(orderId: order.id!, token: widget.token),
              ),
            );
          },
        );
      },
    );
  }
}
