import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final String _baseUrl;

  AuthenticationService(this._baseUrl);

  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'clientName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully registered, parse the response if needed
      final responseBody = jsonDecode(response.body);
      print('Registration successful: $responseBody');
      // You can handle the parsed response here
    } else {
      // Handle errors
      final responseBody = jsonDecode(response.body);
      print('Error response: $responseBody');
      throw Exception(
          'Failed to register. Status code: ${response.statusCode}');
    }
  }
}
