import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person, size: 24),
              label: Text('Shipper Profile', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pushNamed(context, '/shipperProfile');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // full width button
                padding: EdgeInsets.symmetric(vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.assignment, size: 24),
              label: Text('Order Management', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pushNamed(context, '/orderManagement');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // full width button
                padding: EdgeInsets.symmetric(vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
