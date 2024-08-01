import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final String _baseUrl;

  AuthenticationService(this._baseUrl);

  Future<void> register({
    required String clientName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'clientName': clientName,
        'email': email,
        // 'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
    } else {
      // Handle errors
      jsonDecode(response.body);
      throw Exception(
          'Failed to register. Status code: ${response.statusCode}');
    }
  }
}
