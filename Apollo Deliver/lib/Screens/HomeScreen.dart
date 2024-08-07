import 'package:flutter/material.dart';
import 'package:apollodeliver/Screens/ShipperProfileScreen.dart';
import 'package:apollodeliver/Screens/OrderManagementScreen.dart';
import 'package:apollodeliver/Screens/DeliveryManagementScreen.dart';

class HomeScreen extends StatelessWidget {
  final String token;
  final String email;

  HomeScreen({required this.token, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShipperProfileScreen(token: token, email: email),
                  ),
                );
              },
              child: Text('Shipper Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderManagementScreen(token: token, email: email),
                  ),
                );
              },
              child: Text('Order Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryManagementScreen(token: token, email: email),
                  ),
                );
              },
              child: Text('Delivery Management'),
            ),
          ],
        ),
      ),
    );
  }
}
