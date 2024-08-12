import 'package:apollodeliver/Screens/MakeColor/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:apollodeliver/Services/AuthService.dart';
import 'package:apollodeliver/Widgets/AuthForm.dart';

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
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => LoadingScreen(
                      message: 'Logging in...',
                    ),
                  );

                  final token = await AuthService.login(email, password);
                  await Future.delayed(Duration(seconds: 10));
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login successful')),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: {'token': token, 'email': email},
                  );
                } catch (e) {
                  Navigator.of(context).pop();
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
