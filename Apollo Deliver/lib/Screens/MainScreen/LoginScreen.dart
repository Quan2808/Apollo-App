import 'package:flutter/material.dart';
import 'package:apollodeliver/Services/AuthService.dart';
import 'package:apollodeliver/Widgets/AuthForm.dart';
import 'package:apollodeliver/Screens/MainScreen/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: AuthForm(
              onSubmit: (email, password) async {
                try {
                  final token = await AuthService.login(email, password);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login successful')),
                  );
                  print('Login successful. Token: $token');
                  // Navigate to Home Screen and pass the token and email
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: {'token': token, 'email': email},
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              submitButtonText: 'Login',
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextButton(
          child: Text('Don\'t have an account? Register'),
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
        ),
      ),
    );
  }
}
