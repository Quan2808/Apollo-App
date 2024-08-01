import 'package:apollodeliver/Screens/HomeScreen.dart';
import 'package:apollodeliver/Screens/LoginScreen.dart';
import 'package:flutter/material.dart'; // Create this screen for after login

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
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
