import 'package:apollodeliver/Dto/ShipperRegisterDTO.dart';
import 'package:apollodeliver/Services/ApiService.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final authService = AuthService();
    final registerDTO = ShipperRegisterDTO(shipperName: name, email: email, password: password);

    try {
      await authService.registerShipper(registerDTO);
      // Xử lý sau khi đăng ký thành công (chuyển hướng, thông báo, v.v.)
      print('Registration successful');
    } catch (e) {
      print('Registration failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
