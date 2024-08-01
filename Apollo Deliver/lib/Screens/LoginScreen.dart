import 'package:apollodeliver/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:apollodeliver/Dto/ShipperLoginDTO.dart';
import 'package:apollodeliver/Services/ApiService.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final authService = AuthService();
    final loginDTO = ShipperLoginDTO(email: email, password: password);

    try {
      final response = await authService.loginShipper(loginDTO);
      // Xử lý JWT token (Lưu trữ, chuyển hướng, v.v.)
      print('Access Token: ${response.accessToken}');

      // Chuyển hướng đến HomeScreen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } catch (e) {
      print('Login failed: $e');
      // Hiển thị thông báo lỗi cho người dùng nếu cần
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              onPressed: () => login(context), // Truyền BuildContext vào
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
