import 'package:apollodeliver/Services/AuthService.dart';
import 'package:apollodeliver/Widgets/AuthForm.dart';
import 'package:flutter/material.dart';

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
                  final response = await AuthService.login(email, password);
                  final token = response['token'];
                  final id = response['id'];

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login successful')),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: id,
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
