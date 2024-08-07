// services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Replace this with your actual backend URL
  static const String baseUrl = 'http://10.0.2.2:9999/api';

  static Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/shipper'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['accessToken'];
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  static Future<void> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register/shipper'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register: ${response.body}');
    }
  }
}

