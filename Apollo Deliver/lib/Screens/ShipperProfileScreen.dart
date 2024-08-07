import 'package:flutter/material.dart';

class ShipperProfileScreen extends StatelessWidget {
  final String token;
  final String email;

  ShipperProfileScreen({required this.token, required this.email});

  @override
  Widget build(BuildContext context) {
    // Use token and email as needed
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipper Profile'),
      ),
      body: Center(
        child: Text('Welcome, $email'),
      ),
    );
  }
}
