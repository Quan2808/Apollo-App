import 'package:apollodeliver/Screens/MakeColor/OnboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/MainScreen/LoginScreen.dart';
import 'Screens/MainScreen/RegisterScreen.dart';
import 'Screens/MainScreen/HomeScreen.dart';
import 'Screens/MainScreen/ShipperProfileScreen.dart';
import 'Screens/MainScreen/OrderManagementScreen.dart';
import 'Screens/MainScreen/DeliveryManagementScreen.dart';

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
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingView(),
        '/login': (context) => LoginScreen(),
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
