import 'package:apollodeliver/Services/AuthService.dart';
import 'package:apollodeliver/Widgets/AuthForm.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: AuthForm(
              onSubmit: (email, password) async {
                try {
                  await AuthService.register(email, password);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration successful')),
                  );
                  Navigator.pushReplacementNamed(context, '/login');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              submitButtonText: 'Register',
            ),
          ),
        ),
      ),
    );
  }
}
