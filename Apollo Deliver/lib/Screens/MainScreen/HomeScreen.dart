import 'package:flutter/material.dart';
import 'package:apollodeliver/Screens/MainScreen/ShipperProfileScreen.dart';
import 'package:apollodeliver/Screens/MainScreen/OrderManagementScreen.dart';
import 'package:apollodeliver/Screens/MainScreen/DeliveryManagementScreen.dart';
import 'package:apollodeliver/Screens/MakeColor/NavBar/CustomBottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final String email;

  HomeScreen({required this.token, required this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions(String token, String email) {
    return [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7357a4),
          title: Image.asset(
            'assets/images/walkthrough/logoBlack.png',
            height: 40.0,
          ),
          centerTitle: true,
        ),
        body: Center(child: Text('Home Screen')),
      ),
      OrderManagementScreen(token: token, email: email),
      DeliveryManagementScreen(token: token, email: email),
      ShipperProfileScreen(token: token, email: email),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions(widget.token, widget.email)[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
