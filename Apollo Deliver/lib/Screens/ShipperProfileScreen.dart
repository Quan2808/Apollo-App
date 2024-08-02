import 'package:apollodeliver/Models/Shipper.dart';
import 'package:apollodeliver/Services/ApiService.dart';
import 'package:apollodeliver/Services/AuthService.dart';
import 'package:flutter/material.dart';

class ShipperProfileScreen extends StatefulWidget {
  final int id;

  ShipperProfileScreen({required this.id});

  @override
  _ShipperProfileScreenState createState() => _ShipperProfileScreenState();
}

class _ShipperProfileScreenState extends State<ShipperProfileScreen> {
  Shipper? shipper;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchShipperProfile();
  }

  Future<void> _fetchShipperProfile() async {
    final token = await AuthService.getToken();
    if (token != null) {
      final apiService = ApiService(baseUrl: 'http://10.0.2.2:9999', token: token);
      final fetchedShipper = await apiService.getShipper(widget.id);
      setState(() {
        shipper = fetchedShipper;
        isLoading = false;
      });
    } else {
      // Handle token not available
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipper Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : shipper == null
          ? Center(child: Text('Failed to load shipper data'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${shipper!.shipperName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${shipper!.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone: ${shipper!.phoneNumber}', style: TextStyle(fontSize: 18)),
            // Add other fields as necessary
          ],
        ),
      ),
    );
  }
}
