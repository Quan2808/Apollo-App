import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ShipperProfileScreen.dart';
import 'Screens/OrderManagementScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shipper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/shipperProfile': (context) {
          final int shipperId = ModalRoute.of(context)!.settings.arguments as int;
          return ShipperProfileScreen(id: shipperId);
        },
        '/orderManagement': (context) => OrderManagementScreen(),
      },
    );
  }
}
