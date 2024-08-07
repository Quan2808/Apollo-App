import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ShipperProfileScreen.dart';
import 'Screens/OrderManagementScreen.dart';
import 'Screens/DeliveryManagementScreen.dart';

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
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => HomeScreen(token: args['token']!, email: args['email']!),
          );
        } else if (settings.name == '/orderManagement') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => OrderManagementScreen(token: args['token']!, email: args['email']!),
          );
        } else if (settings.name == '/shipperProfile') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => ShipperProfileScreen(token: args['token']!, email: args['email']!),
          );
        } else if (settings.name == '/deliveryManagement') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => DeliveryManagementScreen(token: args['token']!, email: args['email']!),
          );
        }
        // Add more routes if necessary
        return null;
      },
    );
  }
}
